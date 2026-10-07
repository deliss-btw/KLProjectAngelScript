
namespace FProjectileUtils
{
    const FName StrikeKey_Projectile = n"ProjectileStrikeKey";

int SpawnProjectileEvent(const FECSEntity &inout OwnerEntity, const FFPTime &inout SpawnTime, const FFireProjectileConfig &inout FireConfig, const FFPTime &inout LifeTimeOverride = -1)
{
    const UECSEntityPoolMeta local_20;
    int local_79;
    int local_164 = 0;
    bool local_1 = !(OwnerEntity.IsValid());
    bool local_2 = !(false);
    if (local_1 == local_2)
    {
        XError(ELog(0), "Spawn Projectile by NULL Entity");
        return -1;
    }
    if (!(ECS::GetRuntimeInfo().IsClient))
    {
        local_1 = false;
    }
    else
    {
        Has local_8;
        local_1 = !(FireConfig.bLocalPrediction) || !(local_8.opCall());
    }
    if (local_1)
    {
        return -1;
    }
    FECSWorldPtr local_14 = ECS::GetECSWorld();
    FECSEntity local_18 = FECSEntity(ENTITY_NULL);
    bool local_21 = FireConfig.bLocalPrediction;
    if (!(FireConfig.bFireByWeapon))
    {
        local_2 = false;
    }
    else
    {
        TSoftClassPtr<AProjectilePrefab> local_32;
        local_32 = FireConfig.ProjectilePrefab;
        local_2 = (local_32 == nullptr);
    }
    if (local_2)
    {
        return -1;
    }
    TSoftClassPtr<AProjectilePrefab> local_32;
    if ((FireConfig.ProjectilePrefab == nullptr))
    {
        XError(ELog(0), FString().Append("Spawn Projectile with invalid prefab: ").Append(FireConfig.ProjectilePrefab));
        return -1;
    }
    AProjectilePrefab local_38 = FireConfig.ProjectilePrefab.Get().GetDefaultObject();
    if (local_38 == nullptr)
    {
        XError(ELog(0), FString().Append("Spawn Projectile with invalid prefab: ").Append(FireConfig.ProjectilePrefab));
        return -1;
    }
    if (local_38.Projectile.Config_FC_ProjectileBasicConfig.GetbNeverPredict())
    {
        local_21 = false;
    }
    bool local_43 = false;
    if (local_21)
    {
        local_18 = FEntityPoolUtils::TryPopEntityFromPool(EEntityPoolType(EEntityPoolType(0)), OwnerEntity, EEntityType(0), local_38);
        if (local_18.IsValid())
        {
            Get local_60;
            local_20 = local_60.opCall().Pools[0].GetPoolMeta();
            local_43 = true;
        }
    }
    if (!(local_43))
    {
        if (ECS::GetRuntimeInfo().IsServer)
        {
            local_18 = ECS::CreateEmptyEntity(local_14, EECSRegType(0), 5, local_38.GetFName(), true);
            ECS::MakeDelayDestroyRef(OwnerEntity, local_18);
            FC_Owner local_71 = FC_Owner();
            Assign local_70;
            local_70.opCall(local_71).SetOwnerEntity(OwnerEntity);
        }
        else
        {
            XError(ELog(0), FString().Append("Spawn Projectile in client while owner not have CharacterProjectilePool, may not need LocalPrediction, projectile: ").Append(FireConfig.ProjectilePrefab).Append(", owner: ").Append(OwnerEntity.GetEntityName()).Append("."));
            return -1;
        }
        local_21 = false;
    }
    if (local_18)
    {
        SendEvent local_78;
        FCE_CharacterFireProjectile& local_74 = local_78.opCall(SpawnTime);
        if (local_74)
        {
            local_74.ProjectileEntity = local_18;
            if (local_20 != nullptr)
            {
                local_79 = int(local_20.GetEntityPoolType());
            }
            else
            {
                local_79 = -1;
            }
            local_74.PoolType = local_79;
            local_74.AttackInfo.HitType = (2 != 0);
            local_74.AttackInfo.AttackData = FireConfig.AttackDataConfig;
            local_74.FireConfig = FFireProjectileData(FireConfig);
            local_74.FireConfig.SetbLocalPrediction(local_21);
            if (FireConfig.bFireByWeapon)
            {
                local_74.FromWeaponEntity = local_164.GetCurrentWeaponEntity();
            }
            local_74.LifeTimeOverride = LifeTimeOverride;
            if (FireConfig.bAutoSelectAimShoot)
            {
                if (OwnerEntity.GetBB_Bool(FireConfig.AimMark))
                {
                    local_74.FireConfig.SetbForShooting(true);
                    local_74.FireConfig.SetbAimAtLockTarget(false);
                }
                else
                {
                    local_74.FireConfig.SetbForShooting(false);
                    local_74.FireConfig.SetbAimAtLockTarget(true);
                }
            }
            else
            {
                if (FireConfig.bAimAtEntityBB)
                {
                    FNameHandle_EntityBBVar local_168;
                    local_168;
                    if (OwnerEntity.HasEntityBB(local_168))
                    {
                        if (OwnerEntity.GetBB_Entity(FireConfig.AimAtEntityBBHandle).IsValid())
                        {
                            local_74.FireConfig.SetbOverrideAimAtPosition(true);
                            FECSEntity local_172 = OwnerEntity.GetBB_Entity(FireConfig.AimAtEntityBBHandle);
                            GetDefaulted local_176;
                            local_74.FireConfig.SetOverrideAimAtPosition(local_176.opCall().GetPosition());
                        }
                    }
                }
            }
            local_74.HitTestProtectData = FireConfig.HitTestProtectData;
            return int(local_74._base_FECSEvent);
        }
    }
    return -1;
}
FECSEntity SpawnProjectile(const FECSEntity &inout OwnerEntity, const FFPTime &inout SpawnTime, const FFireProjectileConfig &inout FireConfig, const FFPTime &inout LifeTimeOverride = -1)
{
    int local_2 = FProjectileUtils::SpawnProjectileEvent(OwnerEntity, SpawnTime, FireConfig, LifeTimeOverride);
    if (local_2 < 0)
    {
        return ENTITY_NULL;
    }
    FECSWorldPtr local_6 = OwnerEntity.GetWorld();
    GetEvent local_10 = FECSWorldPtr::GetEvent(local_6);
    return local_10.opCall(local_2).ProjectileEntity;
}
bool CalculateProjectileSpawnTransform(const FECSEntity &inout Sender, const FFPTime &inout Time, const FFireProjectileData &inout FireConfig, const FTransform &inout SenderWorldTrans, FVector &inout SpawnPosition, FQuat4f &inout SpawnRotation, const bool bForPresentation, bool &inout bOutCancelSpawn)
{
    int local_120 = 0;
    bool local_127;
    int local_134 = 0;
    bOutCancelSpawn = false;
    GetDefaulted local_6;
    float32 local_7 = local_6.opCall().GetUniformScale();
    bool local_8 = false;
    FVector local_14(FVector::ZeroVector);
    FQuat4f local_20 = FQuat4f(FQuat4f::Identity);
    EOffsetRefType local_21 = EOffsetRefType(1);
    if (!(FireConfig.GetPositionAttachRefName().ToOffsetRefType(local_21)) && !(FireConfig.GetPositionAttachRefName().Name.IsNone()))
    {
        FTransform local_48;
        local_8 = FThrowUtils::GetThrowSocketTransform(FThrowTargetInfo(FireConfig.GetProjectileKey(), Sender.GetId()), FireConfig.GetPositionAttachRefName().Name, Time, local_48, bForPresentation);
        if (local_8)
        {
            local_14 = local_48.GetLocation();
            local_20 = FQuat4f(local_48.GetRotation());
        }
        else
        {
            if (bForPresentation)
            {
                XError(ELog(0), FString().Append("Fireprojectile can't find socket '").Append(FireConfig.GetPositionAttachRefName().Name).Append("' in entity '").Append(Sender.GetEntityName()).Append("' visual mesh"));
            }
            else
            {
                XError(ELog(0), FString().Append("Fireprojectile can't find socket '").Append(FireConfig.GetPositionAttachRefName().Name).Append("' in entity '").Append(Sender.GetEntityName()).Append("' game mesh"));
            }
        }
    }
    switch (int(FireConfig.GetSpawnRotationType()))
    {
    case 0:
    {
        SpawnRotation = (FQuat4f(SenderWorldTrans.GetRotation()) * FireConfig.GetRotationOffset().Quaternion());
        break;
    }
    case 1:
    {
        if (local_8)
        {
            SpawnRotation = (local_20 * FireConfig.GetRotationOffset().Quaternion());
        }
        else
        {
            SpawnRotation = (FQuat4f(SenderWorldTrans.GetRotation()) * FireConfig.GetRotationOffset().Quaternion());
        }
        break;
    }
    case 2:
    {
        SpawnRotation = FireConfig.GetRotationOffset().Quaternion();
        break;
    }
    }
    if (int(FireConfig.GetSpawnPositionOffsetType()) == 3)
    {
        SpawnPosition = FireConfig.GetPositionOffset();
    }
    else
    {
        if (int(FireConfig.GetSpawnPositionOffsetType()) == 2)
        {
            SpawnPosition = (local_14 + FireConfig.GetPositionOffset());
        }
        else
        {
            if (int(FireConfig.GetSpawnPositionOffsetType()) == 0)
            {
                if (local_8)
                {
                    SpawnPosition = (local_14 + (FVector((SpawnRotation * (FVector3f((FVector(FireConfig.GetPositionOffset()) * local_7)))))));
                }
                else
                {
                    if (int(local_21) == 1)
                    {
                        SpawnPosition = (SenderWorldTrans.GetLocation() + (FVector((SpawnRotation * (FVector3f((FVector(FireConfig.GetPositionOffset()) * local_7)))))));
                    }
                    else
                    {
                        if (local_120)
                        {
                            if (int(local_21) == 0)
                            {
                                FVector local_114 = (FVector(FireConfig.GetPositionOffset()) * local_7);
                                FVector3f local_105 = (SpawnRotation * FVector3f(local_114));
                                FVector local_102 = (SenderWorldTrans.GetLocation() + FVector(local_105));
                                FVector local_64_2 = (SenderWorldTrans.GetRotation().RotateVector(FVector::DownVector) * local_120.GetScaledHalfHeight());
                                SpawnPosition = (local_102 + local_64_2);
                            }
                            if (int(local_21) == 2)
                            {
                                FVector local_126 = SenderWorldTrans.GetLocation();
                                FVector local_64_3 = (FVector(FireConfig.GetPositionOffset()) * local_7);
                                FVector3f local_108 = (SpawnRotation * FVector3f(local_64_3));
                                FVector local_64_4 = (local_126 + FVector(local_108));
                                FVector local_126_2 = (SenderWorldTrans.GetRotation().RotateVector(FVector::UpVector) * local_120.GetScaledHalfHeight());
                                SpawnPosition = (local_64_4 + local_126_2);
                            }
                        }
                        else
                        {
                            SpawnPosition = (SenderWorldTrans.GetLocation() + (FVector((SpawnRotation * (FVector3f((FVector(FireConfig.GetPositionOffset()) * local_7)))))));
                        }
                    }
                }
            }
            else
            {
                if (int(FireConfig.GetSpawnPositionOffsetType()) == 1)
                {
                    if (int(local_21) == 1)
                    {
                        SpawnPosition = (SenderWorldTrans.GetLocation() + (FVector((FQuat4f(SenderWorldTrans.GetRotation()) * (FVector3f((FVector(FireConfig.GetPositionOffset()) * local_7)))))));
                    }
                    else
                    {
                        if (local_120)
                        {
                            if (int(local_21) == 0)
                            {
                                FVector local_126_3 = SenderWorldTrans.GetLocation();
                                FQuat4f local_92 = FQuat4f(SenderWorldTrans.GetRotation());
                                FVector local_102_2 = (FVector(FireConfig.GetPositionOffset()) * local_7);
                                FVector3f local_108_2 = (local_92 * FVector3f(local_102_2));
                                FVector local_102_3 = (local_126_3 + FVector(local_108_2));
                                FVector local_126_4 = (SenderWorldTrans.GetRotation().RotateVector(FVector::DownVector) * local_120.GetScaledHalfHeight());
                                SpawnPosition = (local_102_3 + local_126_4);
                            }
                            if (int(local_21) == 2)
                            {
                                FVector local_126_5 = SenderWorldTrans.GetLocation();
                                FQuat4f local_88 = FQuat4f(SenderWorldTrans.GetRotation());
                                FVector local_102_4 = (FVector(FireConfig.GetPositionOffset()) * local_7);
                                FVector3f local_108_3 = (local_88 * FVector3f(local_102_4));
                                FVector local_102_5 = (local_126_5 + FVector(local_108_3));
                                FVector local_126_6 = (SenderWorldTrans.GetRotation().RotateVector(FVector::UpVector) * local_120.GetScaledHalfHeight());
                                SpawnPosition = (local_102_5 + local_126_6);
                            }
                        }
                        else
                        {
                            SpawnPosition = (SenderWorldTrans.GetLocation() + (FVector((FQuat4f(SenderWorldTrans.GetRotation()) * (FVector3f((FVector(FireConfig.GetPositionOffset()) * local_7)))))));
                        }
                    }
                }
            }
        }
    }
    local_127 = false;
    if (FireConfig.GetbAimAtLockTarget())
    {
        Get local_172;
        FLockPointInfo local_150;
        if (local_134 && local_134.GetTargetEntity().IsValid() && FLockTargetUtils::GetLogicLockTargetInfo(Sender, local_150))
        {
            FVector local_156 = local_150.Position;
            if (!(FireConfig.GetAimAtLockTargetOffset().IsZero()))
            {
                local_156 += ((local_156 - SpawnPosition).Rotation()).RotateVector(FireConfig.GetAimAtLockTargetOffset());
            }
            FRotator local_162 = local_172.opCall().GetRotation().Rotator();
            FRotator local_194 = (FRotator((FVector3f((local_156 - SpawnPosition))).Rotation()) - local_162).GetNormalized();
            FRotator local_200;
            local_200.Pitch = FMath::Clamp(local_194.Pitch, FireConfig.GetMinRotateLimitAnimAtLockTarget().X, FireConfig.GetMaxRotateLimitAnimAtLockTarget().X);
            local_200.Yaw = FMath::Clamp(local_194.Yaw, FireConfig.GetMinRotateLimitAnimAtLockTarget().Y, FireConfig.GetMaxRotateLimitAnimAtLockTarget().Y);
            local_200.Roll = FMath::Clamp(local_194.Roll, FireConfig.GetMinRotateLimitAnimAtLockTarget().Z, FireConfig.GetMaxRotateLimitAnimAtLockTarget().Z);
            SpawnRotation = (FQuat4f((local_162 + local_200).Quaternion()) * FireConfig.GetRotationOffset().Quaternion());
        }
    }
    if (FireConfig.GetbOverrideAimAtPosition())
    {
        Get local_172;
        FVector local_156_2 = FVector(FireConfig.GetOverrideAimAtPosition());
        if (!(FireConfig.GetAimAtEntityBBOffset().IsZero()))
        {
            local_156_2 += ((local_156_2 - SpawnPosition).Rotation()).RotateVector(FireConfig.GetAimAtEntityBBOffset());
        }
        FRotator local_212 = local_172.opCall().GetRotation().Rotator();
        SpawnRotation = (FQuat4f(((local_156_2 - SpawnPosition).Rotation()).Quaternion()) * FireConfig.GetRotationOffset().Quaternion());
        local_127 = true;
    }
    if (FireConfig.GetSpawnOnGroundConfig().GetbSpawnOnGround())
    {
        bool local_219;
        local_219 = false;
        if (FSpawnOnGroundUtils::ApplySpawnOnGround(Sender, SpawnPosition, SpawnRotation, FireConfig.GetSpawnOnGroundConfig(), EPhysicsTraceTag(9), ETraceTypeQuery(5), local_219))
        {
            local_127 = true;
        }
        if (local_219)
        {
            bOutCancelSpawn = true;
            return false;
        }
    }
    return local_127;
}
FTransform GetProjectileSpawnTransform(const FECSEntity &inout Sender, const FFPTime &inout Time, const FFireProjectileData &inout FireConfig, const bool bForPresentation, bool &inout bOutCancelSpawn)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FTransform __r; return __r;
}
void CreateHitPresentation(const FECSEntity &inout ProjectileEntity, const FECSEntity &inout OwnerEntity, const FProjectileFXConfig &inout HitFX, const FVector &inout Position, const FRotator &inout Rotation, const FName &inout SurfaceName, const FFPTime &inout Time, const bool bPredictable)
{
    if (HitFX.Asset.IsValid())
    {
        SendEvent local_6;
        FCE_ProjectileHitPresentation& local_8 = local_6.opCall(Time);
        if (local_8)
        {
            local_8.OwnerEntity = OwnerEntity;
            local_8.SetbPredictable(bPredictable);
            local_8.HitFX.SetAsset(HitFX.Asset);
            local_8.HitFX.SetScale(HitFX.Scale);
            local_8.HitFX.SetOverrideParams(HitFX.OverrideParams);
            local_8.HitFX.SetDeterminedSurfaceName(SurfaceName);
            local_8.HitFX.SetbUseWorldOriginAsBaseTransformSource(true);
            local_8.HitFX.SetLocationOffsetSpace(EFXOffsetSpace(2));
            local_8.HitFX.SetRotationOffsetSpace(EFXOffsetSpace(2));
            local_8.HitFX.SetLocationOffset((Position + HitFX.LocationOffset));
            local_8.HitFX.SetRotationOffset((HitFX.RotationOffset.Quaternion() * Rotation.Quaternion()).Rotator());
            if (HitFX.bDetach || !(ProjectileEntity.IsValid()) || !(ProjectileEntity.IsActive()))
            {
                local_8.HitFX.SetbDetach(true);
                return;
            }
            local_8.HitFX.SetbDetach(false);
            local_8.HitFX.SetbUseAbsoluteRotation(HitFX.bUseAbsoluteRotation);
            if (int(HitFX.FXLifeTime) == 0)
            {
                local_8.StopMethod = EAttachFXStopMethod(4);
            }
            else
            {
                if (int(HitFX.FXLifeTime) == 1)
                {
                    local_8.StopMethod = EAttachFXStopMethod(0);
                }
                else
                {
                    if (int(HitFX.FXLifeTime) == 2)
                    {
                        local_8.StopMethod = EAttachFXStopMethod(1);
                    }
                }
            }
            local_8.AttachEntity = ProjectileEntity;
        }
    }
    return;
}
bool ShouldProjectileExplosion(const FC_ProjectileHitExplosionConfig &inout ProjectileHitExplosionConfig, const bool bFirstHit, const bool bLastHit, const FHitTestCheckResult &inout HitTestCheckResult)
{
    if (((ProjectileHitExplosionConfig.bExpolsionOnHitEntity && (int(HitTestCheckResult.CheckResult) == 0))) || (ProjectileHitExplosionConfig.bExpolsionOnHitScene && (int(HitTestCheckResult.CheckResult) == 1)))
    {
        if (!(ProjectileHitExplosionConfig.bExpolsionOnHitAlly) && (int(HitTestCheckResult.Relation) == 4))
        {
            return false;
        }
        if (bFirstHit)
        {
            return (int(ProjectileHitExplosionConfig.ExposionTriggerTime) == 0 || (int(ProjectileHitExplosionConfig.ExposionTriggerTime) == 1));
        }
        if (bLastHit)
        {
            return int(ProjectileHitExplosionConfig.ExposionTriggerTime) == 2 || (int(ProjectileHitExplosionConfig.ExposionTriggerTime) == 1);
        }
    }
    return false;
}
void ProjectileExplosion(const FC_ProjectileHitExplosionConfig &inout Config, const FECSEntity &inout ProjectileOwner, const FECSEntity &inout ProjectileEntity, const FVector &inout Position, const FFPTime &inout Time)
{
    FTransform local_48 = FTransformUtils::GetTransform(ProjectileEntity, Time);
    FVector local_70 = (Position + (local_48.GetRotation().GetForwardVector() * Config.ExplosionPointOffset));
    SendEvent local_80;
    FCE_ArealStrikeRequestEvent& local_82 = local_80.opCall(Time);
    if (local_82)
    {
        local_82.TransformPos = local_70;
        local_82.TransformRot = FQuat4f(local_48.GetRotation());
        local_82.SweepFromOffset = FVector3f::ZeroVector;
        local_82.Shape = Config.ExplosionShape;
        local_82.HitInterval = 0;
        local_82.AttackInfo.AttackData = Config.AttackDataConfig;
        local_82.SetbIgnoreSender(false);
        local_82.StrikeEventData.bUseHitTestPosStrikeOrigin = true;
    }
    FFXConfig local_206 = Config.ExplosionFX;
    Get local_210;
    if (local_210.opCall())
    {
        local_206.SetbUseWorldOriginAsBaseTransformSource(false);
        local_206.SetLocationOffsetSpace(EFXOffsetSpace(0));
        local_206.SetRotationOffsetSpace(EFXOffsetSpace(0));
        local_206.SetbDetach(false);
        local_206.SetLocationOffset(Config.ExplosionPointOffset);
        local_206.SetLocationOffsetSpace(EFXOffsetSpace(0));
    }
    else
    {
        local_206.SetbUseWorldOriginAsBaseTransformSource(true);
        local_206.SetLocationOffsetSpace(EFXOffsetSpace(2));
        local_206.SetRotationOffsetSpace(EFXOffsetSpace(2));
        local_206.SetbDetach(true);
        local_206.SetLocationOffset(local_70);
        local_206.SetRotationOffset(local_48.GetRotation().Rotator());
    }
    ECSFX::PlayFXInstant(ProjectileOwner, local_206, Time, 1.0f, true, false);
    return;
}
bool CheckPenetrationProjectileHit(const FC_ProjectileHitInfo &inout ProjectileHitInfo, const FC_ProjectilePenetrationConfig &inout ProjectilePenetrationConfig, const FECSEntityId &inout HitEntityId, const FFPTime &inout HitTime)
{
    if (int(ProjectilePenetrationConfig.MaxHitCount) > 0 && (ProjectileHitInfo.GetHitCount() >= int(ProjectilePenetrationConfig.MaxHitCount)))
    {
        return false;
    }
    if (int(ProjectilePenetrationConfig.MaxHitCountPerTargetEntity) > 0)
    {
        int local_5 = 0;
        ProjectileHitInfo.GetHitCountByEntity().Find(HitEntityId, local_5);
        if (local_5 >= int(ProjectilePenetrationConfig.MaxHitCountPerTargetEntity))
        {
            return false;
        }
    }
    FFPTime local_8;
    ProjectileHitInfo.GetNextPenetrationTimeByEntity().Find(HitEntityId, local_8);
    if ((local_8 == -1.0) || (HitTime.opCmp(local_8) < 0))
    {
        return false;
    }
    return true;
}
void CalculatePenetrationProjectileHit(FC_ProjectileHitInfo &inout ProjectilHitInfo, const FC_ProjectilePenetrationConfig &inout ProjectilePenetrationConfig, const FECSEntityId &inout HitEntityId)
{
    ProjectilHitInfo.SetHitCount((ProjectilHitInfo.GetHitCount() + 1));
    int local_2 = 0;
    ProjectilHitInfo.GetModify_HitCountByEntity().FindOrAdd(HitEntityId, local_2);
    ProjectilHitInfo.SetPenetratedAttenuationRatio((ProjectilHitInfo.GetPenetratedAttenuationRatio() * ProjectilePenetrationConfig.AttenuationRatioPerHit));
    if (ProjectilHitInfo.GetPenetratedAttenuationRatio() < ProjectilePenetrationConfig.AttenuationRatioMin)
    {
        ProjectilHitInfo.SetPenetratedAttenuationRatio(ProjectilePenetrationConfig.AttenuationRatioMin);
    }
    return;
}
void DestroyProjectile(const FECSEntity &inout Entity, const FC_Owner &inout ProjectileOwner, const FVector &inout DestroyPosition, const FFPTime &inout Time, const FFPTime &inout DelayDestroyTime, const bool bIsServer)
{
    FCombatUtils::TriggerCombatTimelineAction(Entity, ECombatTimelineTimePoint(2), Time, true, true);
    Get local_8;
    const FC_ProjectileHitExplosionConfig& local_10 = local_8.opCall();
    if (local_10)
    {
        if (int(local_10.ExposionTriggerTime) == 3)
        {
            FProjectileUtils::ProjectileExplosion(local_10, ProjectileOwner.GetOwnerEntity(), Entity, DestroyPosition, Time);
        }
    }
    if (FAbilityUtils::CanTriggerAbilityEffectEvent(Entity, EAbilityEffectEvent(4)))
    {
        FAbilityEffectEventData_Projectile local_30;
        local_30.SetProjectileEntity(Entity);
        local_30.SetPosition(DestroyPosition);
        GetDefaulted local_34;
        FECSEntity local_18 = local_34.opCall().GetOwnerEntity();
    }
    Get local_40;
    const FC_ProjectileActorVisualConfig& local_42 = local_40.opCall();
    if (local_42)
    {
        if (!(local_42.DestroyMaterialParam.IsEmpty()))
        {
            FMaterialUtils::SyncRequestChangeMaterialParam(Entity, n"ProjectileDestroy", local_42.DestroyMaterialParam);
        }
    }
    if (DelayDestroyTime.opCmp(0.0) > 0)
    {
        Remove local_48;
        local_48.opCall();
        Remove local_52;
        local_52.opCall();
        Assign local_56;
        local_56.opCall(FC_ProjectileHitTestDisableTag());
        FFPTime local_60 = (DelayDestroyTime + Time);
        FC_ProjectileDelayDestroy local_68;
        Assign local_64;
        local_64.opCall(local_68).SetDestroyTime(local_60);
        return;
    }
    Entity.DestroyDeferred();
    return;
}
void CollectFXPaths(const AECSPrefab Prefab, TArray<FSoftObjectPath> &inout OutPaths)
{
    if (Prefab == nullptr)
    {
        return;
    }
    AECSPrefab::GetComponentConfigValue local_8;
    const FC_ProjectileFXConfig& local_10 = local_8.opCall();
    if (local_10)
    {
        for (auto& local_24 : local_10.LifeTimeFX)
        {
            if (!(local_24.FXConfig.Asset.IsNull()))
            {
                OutPaths.AddUnique(FSoftObjectPath(local_24.FXConfig.Asset.ToString()));
            }
        }
    }
    AECSPrefab::GetComponentConfigValue local_40;
    const FC_ProjectileHitConfig& local_42 = local_40.opCall();
    if (local_42)
    {
        if (!(local_42.HitFXConfig.Asset.IsNull()))
        {
            OutPaths.AddUnique(FSoftObjectPath(local_42.HitFXConfig.Asset.ToString()));
        }
        if (!(local_42.HitSceneFXConfig.Asset.IsNull()))
        {
            OutPaths.AddUnique(FSoftObjectPath(local_42.HitSceneFXConfig.Asset.ToString()));
        }
    }
    AECSPrefab::GetComponentConfigValue local_46;
    const FC_ProjectileHitExplosionConfig& local_48 = local_46.opCall();
    if (local_48)
    {
        if (!(local_48.ExplosionFX.GetAsset().IsNull()))
        {
            OutPaths.AddUnique(FSoftObjectPath(local_48.ExplosionFX.GetAsset().ToString()));
        }
    }
    AECSPrefab::GetComponentConfigValue local_52;
    const FC_ProjectilePenetrationConfig& local_54 = local_52.opCall();
    if (local_54)
    {
        if (!(local_54.HitFXConfigAfterPenetration.Asset.IsNull()))
        {
            OutPaths.AddUnique(FSoftObjectPath(local_54.HitFXConfigAfterPenetration.Asset.ToString()));
        }
    }
    return;
}
}

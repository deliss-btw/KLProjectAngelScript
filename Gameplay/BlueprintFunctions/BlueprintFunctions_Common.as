
namespace BlueprintFunctions_Common
{
FFPTime GetWorldTime(const FECSEntity &inout ContextEntity)
{
    if (UEASAbility::GetContextAbility() != nullptr)
    {
        return UEASAbility::GetContextAbility().GetWorldTime();
    }
    else
    {
        if (ContextEntity.IsValid())
        {
            FECSWorldPtr local_10 = ContextEntity.GetWorld();
            Get local_14;
            return local_14.opCall().Time;
        }
        else
        {
            return ECS::GetContextTime();
        }
    }
}
UFUNCTION()
void IncreaseConsumableAttributeValue(const FECSEntityAdapter &inout Entity, const FGameAttributeSelector &inout Attribute, const float32 Value)
{
    if (Value <= 0.0f)
    {
        XWarning(ELog(8), "IncreaseConsumableAttributeValue value must > 0");
        return;
    }
    if (!(ECS::GetRuntimeInfo().IsServer) && !((Entity == UEASAbility::GetContextAbility().GetOwnerEntity())))
    {
        return;
    }
    FGameAttributeUtils::Recover(Entity.opImplConv(), FGameAttributeRef(Attribute.AttributeClass), UEASAbility::GetContextAbility().GetWorldTime(), Value, -1.0f);
    return;
}
UFUNCTION()
void DecreaseConsumableAttributeValue(const FECSEntityAdapter &inout Entity, const FGameAttributeSelector &inout Attribute, const float32 Value)
{
    if (Value <= 0.0f)
    {
        XWarning(ELog(8), "DecreaseConsumableAttributeValue value must > 0");
        return;
    }
    if (!(ECS::GetRuntimeInfo().IsServer) && !((Entity == UEASAbility::GetContextAbility().GetOwnerEntity())))
    {
        return;
    }
    FGameAttributeUtils::Consume(Entity.opImplConv(), FGameAttributeRef(Attribute.AttributeClass), BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()), Value);
    return;
}
UFUNCTION()
bool TryConsumeAttributeValue(const FECSEntityAdapter &inout Entity, const FGameAttributeSelector &inout Attribute, const float32 Value)
{
    float32 local_1 = 0.0f;
    if (Value <= 0.0f)
    {
        XWarning(ELog(8), "TryConsumeAttributeValue value must > 0");
        return false;
    }
    if (!(ECS::GetRuntimeInfo().IsServer) && !((Entity == UEASAbility::GetContextAbility().GetOwnerEntity())))
    {
        return false;
    }
    Get local_16;
    const FC_GameAttribute& local_18 = local_16.opCall();
    if (local_18)
    {
        FFPTime local_22 = BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv());
        FGameAttributeRef local_36 = FGameAttributeRef(Attribute.AttributeClass);
        if (local_18.HasAttribute(local_36))
        {
            float32 local_37 = local_18.GetAttributeValue(local_36, local_22);
            if (local_37 > local_1)
            {
                FGameAttributeUtils::Consume(Entity.opImplConv(), local_36, local_22, FMath::Min(Value, local_37 - local_1));
                return true;
            }
        }
    }
    return false;
}
UFUNCTION()
void SetConsumableAttributeValue(const FECSEntityAdapter &inout Entity, const FGameAttributeSelector &inout Attribute, const float32 Value)
{
    if (!(ECS::GetRuntimeInfo().IsServer) && !((Entity == UEASAbility::GetContextAbility().GetOwnerEntity())))
    {
        return;
    }
    FFPTime local_14 = BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv());
    FGameAttributeRef local_28 = FGameAttributeRef(Attribute.AttributeClass);
    float32 local_42 = FGameAttributeUtils::GetAttributeValue(Entity.opImplConv(), local_28, local_14, false, 0.0f, false, FGameAttributeModificationValue());
    if (Value > local_42)
    {
        FGameAttributeUtils::Recover(Entity.opImplConv(), local_28, local_14, Value - local_42, -1.0f);
    }
    else
    {
        if (Value < local_42)
        {
            FGameAttributeUtils::Consume(Entity.opImplConv(), local_28, local_14, local_42 - Value);
        }
    }
    return;
}
UFUNCTION()
void AddTargetToSourceFlock(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity)
{
    if (!(SourceEntity.IsValid()) || !(TargetEntity.IsValid()))
    {
        return;
    }
    FECSEntity local_10 = FEcologyUtils::GetFlockEntity(SourceEntity);
    if (local_10.IsValid())
    {
        FEcologySpawnerUtils::SetupFlockChild(TargetEntity, local_10);
    }
    return;
}
UFUNCTION()
void PushAttributeStopRecover(const FECSEntityAdapter &inout Entity, const FGameAttributeRef &inout Attribute)
{
    int local_8 = 0;
    FECSWorldPtr local_2 = Entity.GetWorld();
    FGameAttributeUtils::PushStopRecover(Entity.opImplConv(), Attribute, local_8.Time);
    return;
}
UFUNCTION()
void PopAttributeStopRecover(const FECSEntityAdapter &inout Entity, const FGameAttributeRef &inout Attribute)
{
    int local_8 = 0;
    FECSWorldPtr local_2 = Entity.GetWorld();
    FGameAttributeUtils::PopStopRecover(Entity.opImplConv(), Attribute, local_8.Time);
    return;
}
UFUNCTION()
void HealHP(const FECSEntityAdapter &inout HealFromEntity, const FECSEntityAdapter &inout Entity, const float32 HP = 0, const float32 HPRatio = 0, const bool bAudioEvent = true, const EHealHPType HealHPType = EHealHPType::SkillHeal)
{
    bool local_5;
    Has local_4;
    if (ECS::GetRuntimeInfo().IsClient && !(local_4.opCall()))
    {
        return;
    }
    Has local_10;
    if (local_10.opCall())
    {
        local_5 = true;
    }
    else
    {
        Has local_14;
        local_5 = local_14.opCall();
    }
    if (local_5)
    {
        return;
    }
    FFPTime local_22 = BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv());
    float32 local_23 = 0.0f;
    if (!(HealHpUtils::HealHP(HealFromEntity.opImplConv(), Entity.opImplConv(), local_22, HP, HPRatio, local_23)))
    {
        return;
    }
    FECSWorldPtr local_32 = ECS::GetECSWorld();
    if (bAudioEvent)
    {
        FCS_EntityAudioVoLogicManager local_38;
        FFPTime& local_44 = local_38.LastEntityHealedTime.FindOrAdd(FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv()));
        FECSWorldPtr local_32_2 = Entity.GetWorld();
        Get local_50;
        FFPTime local_46 = FFPTime(local_50.opCall().Time);
        if ((local_46 - local_44).opCmp(local_38.HealedCd) > 0)
        {
            FCE_HealHpAudioVo local_60;
            FFPTime local_16 = FFPTime(-1);
            local_60.HealHp = local_23;
            local_60.FromEntity = HealFromEntity.opImplConv();
            FFPTime& local_44_2 = local_46;
        }
    }
    return;
}
UFUNCTION()
void HealEnvBreakHP(const FECSEntityAdapter &inout Entity, const float32 EnvBreakHP = 0, const float32 EnvBreakHPRatio = 0)
{
    Has local_4;
    if (ECS::GetRuntimeInfo().IsClient && !(local_4.opCall()))
    {
        return;
    }
    FFPTime local_14 = BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv());
    Get local_20;
    float32 local_21 = local_20.opCall().GetAttributeValue(Attribute::EnvBreakHPMax, local_14);
    float32 local_15 = local_20.opCall().GetAttributeValue(Attribute::EnvBreakHP, local_14);
    float32 local_22 = (local_21 * EnvBreakHPRatio) + EnvBreakHP;
    float32 local_23 = float32((FMath::Clamp(local_22, 0.0, (local_21 - local_15))));
    FGameAttributeUtils::Recover(Entity.opImplConv(), Attribute::EnvBreakHP, local_14, local_22, -1.0f);
    return;
}
UFUNCTION()
FECSEntity GetEntityOwner(const FECSEntityAdapter &inout Entity)
{
    Get local_4;
    const FC_Owner& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.GetOwnerEntity().IsValid())
        {
            return local_6.GetOwnerEntity();
        }
    }
    Get local_18;
    const FC_GameAttributeInherit& local_14 = local_18.opCall();
    if (local_14)
    {
        if (local_14.GetInheritOwner().IsValid())
        {
            return local_14.GetInheritOwner();
        }
    }
    return Entity.opImplConv();
}
UFUNCTION()
FECSEntity GetEntityGameAttributeOriginOwner(const FECSEntityAdapter &inout Entity)
{
    int local_24 = 0;
    if (!(Entity.IsValid()))
    {
        return FECSEntity();
    }
    FECSEntity local_10 = FECSEntity(Entity.GetEntity());
    FECSEntity local_14;
    int local_15 = 100;
    while (local_10.IsValid() && (local_15 > 0))
    {
        --local_15;
        if (!(local_24) || !(local_24.GetInheritOwner().IsValid()))
        {
            break;
        }
        else
        {
            local_14 = local_24.GetInheritOwner();
            local_10 = local_24.GetInheritOwner();
        }
    }
    return local_14;
}
UFUNCTION()
TArray<FECSEntity> GetSummon(const FECSEntityAdapter &inout Entity)
{
    TArray<FECSEntity> local_4;
    int local_12 = 0;
    if (!(Entity.IsValid()))
    {
        return local_4;
    }
    if (local_12)
    {
        for (auto& local_26 : local_12.GetInheritSourceEntities())
        {
            if (local_26.IsValid())
            {
                local_4.Add(local_26);
            }
        }
    }
    return local_4;
}
UFUNCTION()
TArray<FECSEntity> GetAllSummons(const FECSEntityAdapter &inout Entity)
{
    TArray<FECSEntity> local_4;
    int local_26 = 0;
    bool local_5 = !(Entity.IsValid());
    if (local_5)
    {
        return local_4;
    }
    TArray<FECSEntity> local_10;
    local_10.Add(Entity.opImplConv());
    int local_16 = 100;
    int local_17 = 0;
    while (local_5)
    {
        --local_16;
        if (!(local_26))
        {
        }
        else
        {
            for (auto& local_40 : local_26.GetInheritSourceEntities())
            {
                if (local_40.IsValid())
                {
                    local_4.Add(local_40);
                    local_10.Add(local_40);
                }
            }
        }
        ++local_17;
        if (local_17 >= local_10.Num())
        {
            local_5 = false;
            continue;
        }
        local_5 = (local_16 > 0);
    }
    return local_4;
}
UFUNCTION()
TArray<FECSEntity> SortEntitiesByDistance(const TArray<FECSEntity> &inout InEntities, const FVector &inout Center)
{
    for (auto& local_16 : InEntities)
    {
        if (!(local_16.IsValid()))
        {
            if (UEASAbility::GetContextAbility() != nullptr)
            {
                XError(ELog(8), FString().Append("SortEntitiesByDistance InEntities contains invalid entity, EntityId: ").Append(local_16.GetIdValue()).Append(", Ability: ").Append(UEASAbility::GetContextAbility().GetFullName(nullptr)).Append("."));
            }
            else
            {
                XError(ELog(22), FString().Append("SortEntitiesByDistance InEntities contains invalid entity, EntityId: ").Append(local_16.GetIdValue()).Append("."));
            }
            return InEntities;
        }
    }
    return FEntityUtils::SortEntitiesByDistance(InEntities, Center);
}
UFUNCTION()
void SetEntityBehaviorTreeRunState(const FECSEntity &inout Entity, const bool bShouldRun)
{
    FASCommonUtils::SetEntityBehaviorTreeRunState(Entity, bShouldRun);
    return;
}
UFUNCTION()
TArray<FECSEntity> SortEntitiesByAngleToCamera(const TArray<FECSEntity> &inout InEntities, const FECSEntityAdapter &inout Entity)
{
    return FEntityUtils::SortEntitiesByAngleToCamera(InEntities, Entity.opImplConv());
}
UFUNCTION()
void GetEntityDisplayName(const FECSEntityAdapter &inout Entity, FString &out DisplayName)
{
    FString local_4;
    DisplayName = local_4;
    TDataObjectPtr<FBasePrefabConfig> local_32 = GetPrefabConfigPtr(Entity.GetEntity());
    if (local_32)
    {
        DisplayName = local_32.opArrow().DisplayName.ToString();
    }
    return;
}
UFUNCTION()
bool IsEntityActiveAndAlive(const FECSEntityAdapter &inout Entity)
{
    return FASCommonUtils::IsEntityActiveAndAlive(Entity.opImplConv());
}
UFUNCTION()
TSoftObjectPtr<AECSPrefab> GetEntityPrefab(const FECSEntityAdapter &inout Entity)
{
    Get local_4;
    const FC_PrefabLoaded& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.Prefab;
    }
    return TSoftObjectPtr<AECSPrefab>(nullptr);
}
UFUNCTION()
FECSEntity AddBuff(const FECSEntityAdapter &inout BuffFromEntity, const FECSEntityAdapter &inout Entity, const FBuffConfigRef &inout BuffConfig, const float32 OverrideDuration = -1, const int AddStackNum = 1)
{
    FBuffAddParams local_40;
    local_40.BuffOwnerEntity = Entity.opImplConv();
    local_40.BuffFromEntity = BuffFromEntity.opImplConv();
    local_40.OverrideDuration = OverrideDuration;
    local_40.StackNum = AddStackNum;
    UEASAbility local_46 = UEASAbility::GetContextAbility();
    if (local_46 != nullptr)
    {
        local_40.bPredictable = ((Entity == local_46.GetOwnerEntity()) && local_46.GetPredictable() != 0);
        local_40.WorldTime = local_46.GetWorldTime();
        local_40.CapabilityInstanceId = local_46.GetContextCapabilityInstanceId();
        return FBuffUtils::AddBuff(local_40);
    }
    else
    {
        local_40.bPredictable = false;
        local_40.WorldTime = BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv());
        return FBuffUtils::AddBuff(local_40);
    }
}
UFUNCTION()
bool RemoveBuffById(const FECSEntityAdapter &inout Entity, const FECSEntity &inout BuffId)
{
    if (!(BuffId.IsValid()) || !(BuffId.IsActive()))
    {
        return false;
    }
    return FBuffUtils::RemoveBuff(Entity.opImplConv(), BuffId, BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()), EBuffEndType(0));
}
UFUNCTION()
int RemoveBuffByConfig(const FECSEntityAdapter &inout Entity, const FBuffConfigRef &inout BuffConfig)
{
    return FBuffUtils::RemoveBuff(Entity.opImplConv(), BuffConfig, BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()), EBuffEndType(0));
}
UFUNCTION()
int RemoveBuffByConfigForAllPlayerAvatar(const FECSEntityAdapter &inout Entity, const FBuffConfigRef &inout BuffConfig)
{
    int local_1 = 0;
    FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv());
    Get local_14;
    const FC_PlayerController& local_16 = local_14.opCall();
    if (local_16)
    {
        TArray<FECSEntity> local_22 = local_16.GetAllPlayerPawnEntities();
        for (auto& local_36 : local_22)
        {
            FBuffUtils::RemoveBuff(local_36, BuffConfig, BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()), EBuffEndType(0));
            ++local_1;
        }
    }
    return local_1;
}
UFUNCTION()
int RemoveBuffStackNumByConfig(const FECSEntityAdapter &inout Entity, const FBuffConfigRef &inout BuffConfig, const int RemoveStackNum)
{
    return FBuffUtils::RemoveBuffStackNum(Entity.opImplConv(), BuffConfig, BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()), RemoveStackNum, EBuffEndType(0));
}
UFUNCTION()
bool HasDesignatedBuff(const FECSEntityAdapter &inout Entity, const FBuffConfigRef &inout Buff)
{
    if (FBuffUtils::HasBuff(Entity.opImplConv(), Buff))
    {
        return true;
    }
    return false;
}
UFUNCTION()
int GetBuffStackNum(const FECSEntityAdapter &inout Entity, const FBuffConfigRef &inout Buff)
{
    if (!(FBuffUtils::HasBuff(Entity.opImplConv(), Buff)))
    {
        return 0;
    }
    return FBuffUtils::GetBuffStackNum(Entity.opImplConv(), Buff, BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()));
}
UFUNCTION()
bool CheckBuffConfigEquals(const FBuffConfigRef &inout Buff1, const FBuffConfigRef &inout Buff2)
{
    return (Buff1.GetUniqueID() == Buff2.GetUniqueID());
}
UFUNCTION()
bool CopyAllBuffsToTargetEntity(const FECSEntityAdapter &inout SourceEntity, const FECSEntityAdapter &inout TargetEntity)
{
    int local_8 = 0;
    int local_58 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return false;
    }
    if (!(local_8) || !(local_8.GetbActive()))
    {
        return false;
    }
    Has local_14;
    if (!(local_14.opCall()))
    {
        return false;
    }
    FECSWorldPtr local_18 = ECS::GetECSWorld();
    Get local_22;
    FFPTime local_16 = FFPTime(local_22.opCall().LastTime);
    FBuffUtils::TransferSharedBuff(SourceEntity.opImplConv(), TargetEntity.opImplConv());
    Get local_34;
    if (local_34.opCall())
    {
        Get local_40;
        const FC_ControlledByPlayer& local_42 = local_40.opCall();
        if (local_42)
        {
            FECSEntity local_46 = local_42.GetPlayerEntity();
            if (local_46.IsValid())
            {
                ModifyOrAdd local_50;
                local_50.opCall().GetModify_SharedEntities().Add(TargetEntity.opImplConv());
                local_58.SetSharedAttributeParentEntity(local_46);
            }
        }
    }
    TArray<FBuffEntityData> local_62 = local_8.GetBuffData();
    for (auto& local_76 : local_62)
    {
        if (local_76.bApplyAttrModToBackground)
        {
            continue;
        }
        FBuffUtils::CopyBuff(SourceEntity.opImplConv(), local_76, TargetEntity.opImplConv(), local_16);
    }
    return true;
}
UFUNCTION()
FECSEntity CreateCombatArealEffectEntityByPrefab(const FECSEntityAdapter &inout OwnerEntity, const TSubclassOf<ACombatArealEffectPrefab> &inout PrefabClass, const FVector &inout Position, const FRotator &inout Rotation, const float32 LifeDuration = 1.0f)
{
    FECSEntity local_4;
    int local_48 = 0;
    Has local_8;
    if (local_8.opCall())
    {
        ACombatArealEffectPrefab local_12 = PrefabClass.GetDefaultObject();
        OwnerEntity;
        FECSEntity local_22;
        local_4 = local_22;
        if (local_4.IsValid())
        {
            ECS::MarkEntityPrefabPendingInit(local_4, PrefabClass, Position, Rotation.Quaternion(), EPrefabCollisionAlignment(2), false);
            local_48.SetSpawnTime(BlueprintFunctions_Common::GetWorldTime(local_4));
            local_48.SetLifeDuration(FFPTime(LifeDuration));
            Assign local_56;
            local_56.opCall(FC_LifeTimeCommonControlTag());
            ECS::MakeDelayDestroyRef(OwnerEntity.opImplConv(), local_4);
        }
    }
    return local_4;
}
UFUNCTION()
FECSEntity CreateArealBuffEntity(const FECSEntityAdapter &inout OwnerEntity, FCombatArealEffectConfigDataObject_Buff &inout Data, const FVector &inout Position, const FRotator &inout Rotation, const float32 LifeDuration = 1.0f)
{
    FECSEntity local_4;
    int local_136 = 0;
    if (!((Data.GetRoot() != nullptr)))
    {
        if (UEASAbility::GetContextAbility() != nullptr)
        {
            XError(ELog(0), FString().Append("CreateArealBuffEntity's param Data must be a variable in BP, ability: ").Append(UEASAbility::GetContextAbility().GetAbilityName()));
        }
        else
        {
            XError(ELog(0), FString().Append("CreateArealBuffEntity's param Data must be a variable in BP"));
        }
        return local_4;
    }
    Has local_24;
    if (local_24.opCall())
    {
        OwnerEntity;
        FECSEntity local_36;
        local_4 = local_36;
        if (local_4.IsValid())
        {
            local_4.InitTransform(Position, Rotation.Quaternion());
            FC_CombatArealEffectBuffOverride local_98;
            Assign local_72;
            TDataObjectPtr<FCombatArealEffectConfigDataObject_Buff> local_122;
            local_72.opCall(local_98).SetDataObject(local_122);
            local_136.SetSpawnTime(BlueprintFunctions_Common::GetWorldTime(local_4));
            local_136.SetLifeDuration(FFPTime(LifeDuration));
            Assign local_144;
            local_144.opCall(FC_LifeTimeCommonControlTag());
            ECS::MakeDelayDestroyRef(OwnerEntity.opImplConv(), local_4);
        }
    }
    return local_4;
}
UFUNCTION()
FECSEntity CreateArealAbilityEffectTriggerEntity(const FECSEntityAdapter &inout OwnerEntity, FCombatArealEffectConfigDataObject_AbilityEffectTrigger &inout Data, const FVector &inout Position, const FRotator &inout Rotation, const float32 LifeDuration = 1.0f)
{
    FECSEntity local_4;
    int local_136 = 0;
    if (!((Data.GetRoot() != nullptr)))
    {
        if (UEASAbility::GetContextAbility() != nullptr)
        {
            XError(ELog(0), FString().Append("CreateArealAbilityEffectTriggerEntity's param Data must be a variable in BP, ability: ").Append(UEASAbility::GetContextAbility().GetAbilityName()));
        }
        else
        {
            XError(ELog(0), FString().Append("CreateArealAbilityEffectTriggerEntity's param Data must be a variable in BP"));
        }
        return local_4;
    }
    Has local_24;
    if (local_24.opCall())
    {
        OwnerEntity;
        FECSEntity local_36;
        local_4 = local_36;
        if (local_4.IsValid())
        {
            local_4.InitTransform(Position, Rotation.Quaternion());
            FC_CombatArealEffectAbilityEffectTriggerOverride local_98;
            Assign local_72;
            TDataObjectPtr<FCombatArealEffectConfigDataObject_AbilityEffectTrigger> local_122;
            local_72.opCall(local_98).SetDataObject(local_122);
            local_136.SetSpawnTime(BlueprintFunctions_Common::GetWorldTime(local_4));
            local_136.SetLifeDuration(FFPTime(LifeDuration));
            Assign local_144;
            local_144.opCall(FC_LifeTimeCommonControlTag());
            ECS::MakeDelayDestroyRef(OwnerEntity.opImplConv(), local_4);
        }
    }
    return local_4;
}
UFUNCTION()
FECSEntity PlayFXDurational(const FECSEntityAdapter &inout OwnerEntity, const TSoftClassPtr<AFXActor> &inout SoftFX, const TArray<FFXOverrideParam> &inout OverrideParam, const bool IsAttached = true, const FName &inout AttachSocket = NAME_None, const TDataObjectPtr<FGameSocketPath> &inout AttachGameSocket = nullptr, const EFXBaseTransformResolveModeWithAttachmentOption BaseTransformResolveMode = EFXBaseTransformResolveModeWithAttachmentOption::AccordingToAttachmentSetting, const FVector &inout LocationOrOffset = FVector(0,0,0), const EFXOffsetSpaceWithAttachmentOption LocationOffsetSpace = EFXOffsetSpaceWithAttachmentOption::AccordingToAttachmentSetting, const FRotator &inout RotationOrOffset = FRotator(0,0,0), const EFXOffsetSpaceWithAttachmentOption RotationOffsetSpace = EFXOffsetSpaceWithAttachmentOption::AccordingToAttachmentSetting, const FECSEntity &inout AttachOveride = FECSEntity(), const EAttachFXStopMethod AttachFXStopMethod = EAttachFXStopMethod::StopOnEntityDestroy, FFXSurfaceTraceParam &inout SurfaceTraceParam = FFXSurfaceTraceParam(), const bool bRandomSeed = true, const bool bAffectedByScreenDarkness = true, const bool bUseAbsoluteRotation = false, const FSpawnOnGroundConfig &inout SpawnOnGroundConfig = FSpawnOnGroundConfig())
{
    SurfaceTraceParam.SetRefEntityId(OwnerEntity.GetIdValue());
    FFXConfig local_118;
    local_118.SetAsset(FSoftClassPath(SoftFX.ToString()));
    bool local_131 = !(IsAttached);
    local_118.SetbDetach(local_131);
    FAttachRefName local_133 = local_118.GetAttachRefName();
    local_133.Name = AttachSocket;
    local_118.SetAttachRefName(local_133);
    local_118.SetAttachGameSocket(AttachGameSocket.opImplConv());
    local_118.SetLocationOffset(LocationOrOffset);
    local_118.SetRotationOffset(RotationOrOffset);
    local_118.SetOverrideParams(OverrideParam);
    local_118.SetbRandomSeed(bRandomSeed);
    local_118.SetbAffectedByScreenDarkness(bAffectedByScreenDarkness);
    local_118.SetSurfaceTraceParam(SurfaceTraceParam);
    local_118.SetbUseAbsoluteRotation(bUseAbsoluteRotation);
    local_118.SetSpawnOnGroundConfig(SpawnOnGroundConfig);
    if (int(BaseTransformResolveMode) == 0)
    {
        local_118.SetbUseWorldOriginAsBaseTransformSource(!(IsAttached));
    }
    else
    {
        if (int(BaseTransformResolveMode) == 1)
        {
            local_118.SetbUseWorldOriginAsBaseTransformSource(true);
        }
        else
        {
            if (int(BaseTransformResolveMode) == 2)
            {
                local_118.SetbUseWorldOriginAsBaseTransformSource(false);
            }
        }
    }
    if (int(LocationOffsetSpace) == 3)
    {
        int local_161;
        if (!(IsAttached))
        {
            local_161 = 2;
        }
        else
        {
            local_161 = 0;
        }
        local_118.SetLocationOffsetSpace(EFXOffsetSpace(local_161));
    }
    else
    {
        int local_162;
        local_162 = int(FFXUtils::ToEFXOffsetSpace(EFXOffsetSpaceWithAttachmentOption(LocationOffsetSpace)));
        local_118.SetLocationOffsetSpace(EFXOffsetSpace(local_162));
    }
    if (int(RotationOffsetSpace) == 3)
    {
        int local_162;
        if (!(IsAttached))
        {
            local_162 = 2;
        }
        else
        {
            local_162 = 0;
        }
        local_118.SetRotationOffsetSpace(EFXOffsetSpace(local_162));
    }
    else
    {
        int local_161;
        local_161 = int(FFXUtils::ToEFXOffsetSpace(EFXOffsetSpaceWithAttachmentOption(RotationOffsetSpace)));
        local_118.SetRotationOffsetSpace(EFXOffsetSpace(local_161));
    }
    return ECSFX::PlayFXDurationalEx(OwnerEntity.opImplConv(), local_118, BlueprintFunctions_Common::GetWorldTime(OwnerEntity.opImplConv()), 1.0f, true, AttachOveride, false);
}
UFUNCTION()
void PlayFXAnimCurve(const FECSEntityAdapter &inout FxEntity, const UFXAnimCurveConfig AnimCurve, const float32 Duration = 1)
{
    if (!(FxEntity.IsValid()))
    {
        return;
    }
    if ((!((AnimCurve != nullptr))))
    {
        return;
    }
    FFXAnimCurveRange local_18;
    local_18.SetConfig(TSoftObjectPtr<UFXAnimCurveConfig>(AnimCurve));
    local_18.SetStartTime(BlueprintFunctions_Common::GetWorldTime(FxEntity.opImplConv()));
    local_18.SetDuration(FFPTime(Duration));
    ModifyOrAdd local_40;
    local_40.opCall().GetModify_Curves().Add(local_18);
    return;
}
UFUNCTION()
void PlayFXInstant(const FECSEntityAdapter &inout OwnerEntity, const TSoftClassPtr<AFXActor> &inout SoftFX, const TArray<FFXOverrideParam> &inout OverrideParam, const bool IsAttached = false, const FName &inout AttachSocket = NAME_None, const EFXBaseTransformResolveModeWithAttachmentOption BaseTransformResolveMode = EFXBaseTransformResolveModeWithAttachmentOption::AccordingToAttachmentSetting, const FVector &inout LocationOrOffset = FVector(0,0,0), const EFXOffsetSpaceWithAttachmentOption LocationOffsetSpace = EFXOffsetSpaceWithAttachmentOption::AccordingToAttachmentSetting, const FRotator &inout RotationOrOffset = FRotator(0,0,0), const EFXOffsetSpaceWithAttachmentOption RotationOffsetSpace = EFXOffsetSpaceWithAttachmentOption::AccordingToAttachmentSetting, FFXSurfaceTraceParam &inout SurfaceTraceParam = FFXSurfaceTraceParam(), const bool bRandomSeed = true, const bool bAffectedByScreenDarkness = true, const bool bUseAbsoluteRotation = false, const FSpawnOnGroundConfig &inout SpawnOnGroundConfig = FSpawnOnGroundConfig())
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    SurfaceTraceParam.SetRefEntityId(OwnerEntity.GetIdValue());
    FFXConfig local_122;
    local_122.SetAsset(FSoftClassPath(SoftFX.ToString()));
    bool local_135 = !(IsAttached);
    local_122.SetbDetach(local_135);
    FAttachRefName local_137 = local_122.GetAttachRefName();
    local_137.Name = AttachSocket;
    local_122.SetAttachRefName(local_137);
    local_122.SetLocationOffset(LocationOrOffset);
    local_122.SetRotationOffset(RotationOrOffset);
    local_122.SetOverrideParams(OverrideParam);
    local_122.SetSurfaceTraceParam(SurfaceTraceParam);
    local_122.SetbRandomSeed(bRandomSeed);
    local_122.SetbAffectedByScreenDarkness(bAffectedByScreenDarkness);
    local_122.SetbUseAbsoluteRotation(bUseAbsoluteRotation);
    local_122.SetSpawnOnGroundConfig(SpawnOnGroundConfig);
    if (int(BaseTransformResolveMode) == 0)
    {
        local_122.SetbUseWorldOriginAsBaseTransformSource(!(IsAttached));
    }
    else
    {
        if (int(BaseTransformResolveMode) == 1)
        {
            local_122.SetbUseWorldOriginAsBaseTransformSource(true);
        }
        else
        {
            if (int(BaseTransformResolveMode) == 2)
            {
                local_122.SetbUseWorldOriginAsBaseTransformSource(false);
            }
        }
    }
    if (int(LocationOffsetSpace) == 3)
    {
        int local_140;
        if (!(IsAttached))
        {
            local_140 = 2;
        }
        else
        {
            local_140 = 0;
        }
        local_122.SetLocationOffsetSpace(EFXOffsetSpace(local_140));
    }
    else
    {
        int local_141;
        local_141 = int(FFXUtils::ToEFXOffsetSpace(EFXOffsetSpaceWithAttachmentOption(LocationOffsetSpace)));
        local_122.SetLocationOffsetSpace(EFXOffsetSpace(local_141));
    }
    if (int(RotationOffsetSpace) == 3)
    {
        int local_141;
        if (!(IsAttached))
        {
            local_141 = 2;
        }
        else
        {
            local_141 = 0;
        }
        local_122.SetRotationOffsetSpace(EFXOffsetSpace(local_141));
    }
    else
    {
        int local_140;
        local_140 = int(FFXUtils::ToEFXOffsetSpace(EFXOffsetSpaceWithAttachmentOption(RotationOffsetSpace)));
        local_122.SetRotationOffsetSpace(EFXOffsetSpace(local_140));
    }
    if (local_2 != nullptr)
    {
        bool local_147 = local_2.GetPredictable() && (OwnerEntity == local_2.GetOwnerEntity());
        ECSFX::PlayFXInstant(OwnerEntity.opImplConv(), local_122, local_2.GetWorldTime(), 1.0f, true, local_147);
    }
    else
    {
        ECSFX::PlayFXInstant(OwnerEntity.opImplConv(), local_122, BlueprintFunctions_Common::GetWorldTime(OwnerEntity.opImplConv()), 1.0f, true, false);
    }
    return;
}
UFUNCTION()
void StopFX(const FECSEntityAdapter &inout FXEntity, const bool bDestroyImmediately = false, const bool bKeepAttachAfterStop = false, const float32 StopDelayTime = 0.f)
{
    ECSFX::StopFX(FXEntity.opImplConv(), bDestroyImmediately, bKeepAttachAfterStop, StopDelayTime);
    return;
}
UFUNCTION()
void CustomFXEvent(const FECSEntityAdapter &inout FXEntity, const FName &inout EventName, const FFPTime &inout EventDelayTime)
{
    ECSFX::CustomFXEvent(FXEntity.opImplConv(), EventName, (BlueprintFunctions_Common::GetWorldTime(FXEntity.opImplConv()) + EventDelayTime));
    return;
}
UFUNCTION()
void SpawnGhostTrailActor(const FECSEntityAdapter &inout Entity, const TSoftClassPtr<AGhostTrailActor> &inout SoftGhostClass)
{
    int local_12 = 0;
    if (ECS::GetRuntimeInfo().IsClient == false)
    {
        return;
    }
    FFPTime local_8 = FFPTime(-1);
    local_12.Receiver = Entity.opImplConv();
    local_12.GhostClass = SoftGhostClass;
    return;
}
UFUNCTION()
void ClearGhostTrailActors(const FECSEntityAdapter &inout Entity)
{
    if (ECS::GetRuntimeInfo().IsClient == false)
    {
        return;
    }
    FFPTime local_8 = FFPTime(-1);
    SendEvent local_6;
    local_6.opCall(local_8).Receiver = Entity.opImplConv();
    return;
}
UFUNCTION()
void AllPlayerPlayCutScene(const TDataObjectPtr<FCutSceneData> &inout CutSceneData, const TMap<FName, FECSEntity> &inout Entities, const FVector &inout Location, const FRotator &inout Rotation, const FLatentActionInfo &inout LatentInfo)
{
    if (ECS::GetRuntimeInfo().IsClient || !(CutSceneData))
    {
        return;
    }
    for (auto& local_20 : FGameUtils::GetAllPlayerControllerEntities(true))
    {
        CutSceneUtils::PlayCutScene(FASCommonUtils::GetUniqueAvatarPawnEntity(local_20), n"Player0", CutSceneData, Entities, Location, Rotation, false);
    }
    FCutSceneData local_74;
    ULevelSequence local_132 = (Cast<ULevelSequence>(local_74.LevelSequence.ToSoftObjectPath().TryLoad()));
    if (local_132 != nullptr)
    {
        FECSLatentAction local_138 = FECSLatentAction(LatentInfo);
        FFPTime local_154 = (ECS::GetContextTime() + FFPTime(local_132.GetDuration()));
        FECSWorldPtr local_140 = ECS::GetECSWorld();
        SendEvent local_144;
        local_144.opCall(ENTITY_NULL, local_154).LatentAction = local_138;
    }
    return;
}
UFUNCTION()
void SinglePlayerPlayCutScene(const FECSEntityAdapter &inout PawnEntity, const TDataObjectPtr<FCutSceneData> &inout CutSceneData, const TMap<FName, FECSEntity> &inout Entities, const FVector &inout Location, const FRotator &inout Rotation, const FLatentActionInfo &inout LatentInfo)
{
    if (ECS::GetRuntimeInfo().IsClient || !(CutSceneData))
    {
        return;
    }
    CutSceneUtils::PlayCutScene(PawnEntity.opImplConv(), n"Player0", CutSceneData, Entities, Location, Rotation, false);
    FCutSceneData local_52;
    ULevelSequence local_110 = (Cast<ULevelSequence>(local_52.LevelSequence.ToSoftObjectPath().TryLoad()));
    if (local_110 != nullptr)
    {
        FECSLatentAction local_116 = FECSLatentAction(LatentInfo);
        FFPTime local_132 = (ECS::GetContextTime() + FFPTime(local_110.GetDuration()));
        FECSWorldPtr local_118 = ECS::GetECSWorld();
        SendEvent local_122;
        local_122.opCall(ENTITY_NULL, local_132).LatentAction = local_116;
    }
    return;
}
UFUNCTION()
void MeleeStrikeRequest(const FECSEntityAdapter &inout SenderEntity, const FHitTestShape &inout HitTestShape, const FVector &inout FromPosition, const FQuat &inout FromRotation, const FVector &inout ToPosition, const FQuat &inout ToRotation, const TDataObjectPtr<FAttackData> &inout AttackData, const FAreaStrikeShape &inout StrikeShape, const TDataObjectPtr<FHitDecalConfig> &inout HitDecal, const bool bIgnoreSelf = true)
{
    if (!(SenderEntity.IsValid()) || !(ECS::IsAuthorityOrPrediction(SenderEntity.opImplConv())))
    {
        return;
    }
    if ((int(ECS::GetContextJobGroup())) >= 5 && (int(ECS::GetContextJobGroup()) <= 10))
    {
        FCE_ArealStrikeRequestEvent local_20;
        FFPTime local_14 = BlueprintFunctions_Common::GetWorldTime(SenderEntity.opImplConv());
        local_20.Shape = HitTestShape;
        local_20.AttackInfo.AttackData = AttackData.opImplConv();
        local_20.StrikeKey = NAME_None;
        local_20.TransformPos = ToPosition;
        local_20.TransformRot = FQuat4f(ToRotation);
        local_20.SweepFromOffset = FVector3f((FromPosition - ToPosition));
        local_20.SweepFromRotation = FQuat4f(FromRotation);
        local_20.StrikeEventData.StrikeDirection = (ToPosition - FromPosition).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        local_20.StrikeEventData.StrikeShape = StrikeShape;
        local_20.StrikeEventData.bUseHitTestPosStrikeOrigin = true;
        local_20.HitDecalConfig = HitDecal.opImplConv();
        local_20.SetbIgnoreSender(bIgnoreSelf);
    }
    return;
}
void SignalLaserStrike(const FECSEntityAdapter &inout SenderEntity, const FName &inout SignalName, const FName &inout CustomStrikeKey)
{
    ModifyOrAdd local_4;
    local_4.opCall().AddSignal(BlueprintFunctions_Common::GetWorldTime(SenderEntity.opImplConv()), SignalName, CustomStrikeKey);
    return;
}
UFUNCTION()
FECSEntity SpawnProjectile(const FECSEntityAdapter &inout OwnerEntity, const FFireProjectileConfig &inout Config, const FFPTime &inout LifeTimeOverride = -1)
{
    if (!(OwnerEntity.IsValid()))
    {
        return FECSEntity();
    }
    FECSWorldPtr local_8 = OwnerEntity.GetWorld();
    Get local_12;
    return FProjectileUtils::SpawnProjectile(OwnerEntity.opImplConv(), local_12.opCall().Time, Config, LifeTimeOverride);
}
UFUNCTION()
FECSEntity SpawnProjectileWithTimeline(const FECSEntityAdapter &inout OwnerEntity, const FFireProjectileConfig &inout Config, const UProjectileTimelineAsset TimelineAsset, const FName &inout InitState)
{
    int local_30 = 0;
    FFPTime local_12 = FFPTime(-1);
    FECSWorldPtr local_6 = OwnerEntity.GetWorld();
    Get local_10;
    FECSEntity local_22 = FProjectileUtils::SpawnProjectile(OwnerEntity.opImplConv(), local_10.opCall().Time, Config, local_12);
    if (local_22.IsValid())
    {
        local_30.SetTimelineAsset(TSoftObjectPtr<UProjectileTimelineAsset>(TimelineAsset));
        local_30.SetInitState(InitState);
    }
    return local_22;
}
UFUNCTION()
void RequestDestroyProjectile(const FECSEntityAdapter &inout ProjectileEntity)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        if (ECS::IsAuthorityOrPrediction(ProjectileEntity.opImplConv()))
        {
            Modify local_14;
            FC_LifeTime& local_16 = local_14.opCall();
            if (local_16)
            {
                local_16.SetCustomEndTime(BlueprintFunctions_Common::GetWorldTime(ProjectileEntity.opImplConv()));
            }
        }
    }
    return;
}
UFUNCTION()
void ProjectileTimelineTurnState(const FECSEntity &inout ProjectileEntity, const FName &inout TargetState)
{
    Get local_4;
    if (local_4.opCall())
    {
    }
    return;
}
UFUNCTION()
void TriggerProjectileEvent(const FECSEntity &inout ProjectileEntity, const FName &inout EventName)
{
    Get local_4;
    if (local_4.opCall())
    {
        FECSEntity local_12;
        BlueprintFunctions_Common::GetWorldTime(local_12);
    }
    return;
}
UFUNCTION()
void KillEntity(const FECSEntityAdapter &inout Entity, const FECSEntity &inout KillerEntity, const bool bDestroyImmediately = false, const bool bHasDropItem = true)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if (!((local_2 != nullptr)) || !(Entity.IsValid()) || !(ECS::IsAuthorityOrPrediction(Entity.opImplConv())))
    {
        return;
    }
    FFPTime local_16 = local_2.GetWorldTime();
    FECSEntityId local_13;
    if ((KillerEntity.GetId() == ENTITY_ID_NULL))
    {
        local_13 = local_2.GetOwnerEntity().GetId();
    }
    else
    {
        local_13 = KillerEntity.GetId();
    }
    FLifeCycleUtils::KillEntityCheckNearDeathRule(Entity.opImplConv(), local_13);
    return;
}
UFUNCTION()
void DestroyEntityDirectly(const FECSEntityAdapter &inout Entity)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if (!((local_2 != nullptr)) || !(Entity.IsValid()) || !(ECS::IsAuthorityOrPrediction(Entity.opImplConv())))
    {
        return;
    }
    FLifeCycleUtils::EntityDestroyDirectly(Entity.opImplConv(), local_2.GetWorldTime());
    return;
}
UFUNCTION()
void RebornTarget(const FECSEntityAdapter &inout Entity, const FECSEntity &inout Target, const float32 RebornHPRatio, const bool bRebornWithAnimation = true)
{
    FFPTime local_12 = BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv());
    FCE_Reborn local_2;
    local_2.RebornByEntity = Entity.opImplConv();
    local_2.RebornHPRatio = RebornHPRatio;
    local_2.bRebornWithAnimation = bRebornWithAnimation;
    return;
}
UFUNCTION()
void RescueNearDeathTarget(const FECSEntityAdapter &inout Entity, const FECSEntity &inout Target, const bool bRescueWithAnimation = true, const float32 OverrideHpRecoverRatio = 0)
{
    FFPTime local_12 = BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv());
    FCE_RescueNearDeathEvent local_2;
    local_2.RescueByEntity = Entity.opImplConv();
    local_2.bRescueWithAnimation = bRescueWithAnimation;
    local_2.OverrideHpRatio = OverrideHpRecoverRatio;
    return;
}
UFUNCTION()
bool IsEntityNearDeath(const FECSEntityAdapter &inout Entity)
{
    FECSEntity local_4 = Entity.GetEntity();
    Has local_8;
    return local_8.opCall();
}
UFUNCTION()
bool IsPlayerRebornAllowedByGame(const FECSEntityAdapter &inout Entity)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_CommissionFinish& local_8 = local_6.opCall();
    if (local_8)
    {
        if (!(local_8.GetbSuccess()))
        {
            return false;
        }
    }
    return true;
}
UFUNCTION()
FVector FindRandomReachablePointInRadius(bool &out bFound, const FECSEntity &inout Entity, const FVector &inout OriginPoint, const float32 MinRadius, const float32 MaxRadius, const float32 MinHeight, const float32 MaxHeight, const int MaxAttempt = 10)
{
    bFound = false;
    bFound = false;
    int local_4 = 0;
    while (local_4 < MaxAttempt)
    {
        FVector2D local_10 = (BlueprintFunctions_Ability::RandomDirection2D() * (BlueprintFunctions_Ability::RandomRange(MinRadius, MaxRadius)));
        float local_24 = BlueprintFunctions_Ability::RandomRange(MinHeight, MaxHeight);
        FVector local_44 = (OriginPoint + FVector(local_10.X, local_10.Y, local_24));
        if (FAIPathFollowUtils::IsReachableOnNavMesh(Entity, OriginPoint, local_44))
        {
            bFound = true;
            return local_44;
        }
        ++local_4;
    }
    return OriginPoint;
}
UFUNCTION()
FVector FindRandomReachablePointInRadiusByPrefab(bool &out bFound, const TSubclassOf<AECSPrefab> &inout Prefab, const FVector &inout OriginPoint, const float32 MinRadius, const float32 MaxRadius, const float32 MinHeight, const float32 MaxHeight, const int MaxAttempt = 10)
{
    bFound = false;
    bFound = false;
    int local_4 = 0;
    while (local_4 < MaxAttempt)
    {
        FVector2D local_10 = (BlueprintFunctions_Ability::RandomDirection2D() * (BlueprintFunctions_Ability::RandomRange(MinRadius, MaxRadius)));
        float local_24 = BlueprintFunctions_Ability::RandomRange(MinHeight, MaxHeight);
        FVector local_44 = (OriginPoint + FVector(local_10.X, local_10.Y, local_24));
        if (FAIPathFollowUtils::IsReachableOnNavMeshByPrefab(Prefab.GetDefaultObject(), OriginPoint, local_44))
        {
            bFound = true;
            local_44 = FAIPathFollowUtils::ProjectPointToNavigationByPrefab(Prefab.GetDefaultObject(), local_44, FVector::ZeroVector);
            return local_44;
        }
        ++local_4;
    }
    return OriginPoint;
}
UFUNCTION()
FECSEntity SpawnMonsterInValidPos(const FECSEntityAdapter &inout Entity, const TSoftClassPtr<AMonsterPrefab> &inout SoftPrefab, const FVector &inout Location, const FRotator &inout Rotation, const float32 MaxNearbyRadius = 500, const float32 StepLength = 50, const bool bSpawnEvenNoValidPos = true, const TArray<FEntityBBVarOverrideParam> &inout EntityBBOverrideParams = TArray<FEntityBBVarOverrideParam>(), const TArray<FESMEntryStateOverrideParam> &inout ESMEntryStateOverrideParams = TArray<FESMEntryStateOverrideParam>())
{
    UObject local_24;
    int local_66 = 0;
    int local_86 = 0;
    if (!(Entity.IsValid()) == !(false))
    {
        XError(ELog(0), FString().Append("Failed to SpawnMonsterInValidPos,  Entity not Valid"));
        return FECSEntity();
    }
    if (ECS::GetRuntimeInfo().IsServer)
    {
        bool local_25;
        local_24 = SoftPrefab.ToSoftObjectPath().TryLoad();
        if (local_24 == nullptr)
        {
            XError(ELog(0), FString().Append("Failed to SpawnNPCInValidPos,  Prefab not Valid"));
            return FECSEntity();
        }
        bool local_1 = false;
        local_25 = local_1;
        FVector local_52 = FASCommonUtils::FindLegalLocationByPrefab(local_25, Entity.opImplConv(), SoftPrefab.Get().GetDefaultObject(), Location, Rotation.Quaternion(), MaxNearbyRadius, StepLength, 8, true);
        if (local_25 || bSpawnEvenNoValidPos)
        {
            FECSEntity local_12 = ECS::RequestEntityByPrefabDeferred(SoftPrefab.Get(), local_52, Rotation, EPrefabCollisionAlignment(2), EECSRegType(0), false);
            if (EntityBBOverrideParams.Num() > 0)
            {
                for (auto& local_80 : EntityBBOverrideParams)
                {
                    local_80.SetValue(local_66);
                }
            }
            if (ESMEntryStateOverrideParams.Num() > 0)
            {
                for (auto& local_100 : ESMEntryStateOverrideParams)
                {
                    local_86.Add(uint8(int(local_100.SMIndex)), local_100.EntryState);
                }
            }
            return local_12;
        }
    }
    return FECSEntity();
}
UFUNCTION()
FECSEntity SpawnNPCInValidPos(const FECSEntityAdapter &inout Entity, const TSoftClassPtr<ANPCPrefab> &inout SoftPrefab, const FVector &inout Location, const FRotator &inout Rotation, const float32 MaxNearbyRadius = 500, const float32 StepLength = 50, const bool bSpawnEvenNoValidPos = true, const TArray<FEntityBBVarOverrideParam> &inout EntityBBOverrideParams = TArray<FEntityBBVarOverrideParam>(), const TArray<FESMEntryStateOverrideParam> &inout ESMEntryStateOverrideParams = TArray<FESMEntryStateOverrideParam>())
{
    UObject local_24;
    int local_66 = 0;
    int local_86 = 0;
    if (!(Entity.IsValid()) == !(false))
    {
        XError(ELog(0), FString().Append("Failed to SpawnNPCInValidPos,  Entity not Valid"));
        return FECSEntity();
    }
    if (ECS::GetRuntimeInfo().IsServer)
    {
        bool local_25;
        local_24 = SoftPrefab.ToSoftObjectPath().TryLoad();
        if (local_24 == nullptr)
        {
            XError(ELog(0), FString().Append("Failed to SpawnNPCInValidPos,  Prefab not Valid"));
            return FECSEntity();
        }
        bool local_1 = false;
        local_25 = local_1;
        FVector local_52 = FASCommonUtils::FindLegalLocationByPrefab(local_25, Entity.opImplConv(), SoftPrefab.Get().GetDefaultObject(), Location, Rotation.Quaternion(), MaxNearbyRadius, StepLength, 8, true);
        if (local_25 || bSpawnEvenNoValidPos)
        {
            FECSEntity local_12 = ECS::RequestEntityByPrefabDeferred(SoftPrefab.Get(), local_52, Rotation, EPrefabCollisionAlignment(2), EECSRegType(0), false);
            if (EntityBBOverrideParams.Num() > 0)
            {
                for (auto& local_80 : EntityBBOverrideParams)
                {
                    local_80.SetValue(local_66);
                }
            }
            if (ESMEntryStateOverrideParams.Num() > 0)
            {
                for (auto& local_100 : ESMEntryStateOverrideParams)
                {
                    local_86.Add(uint8(int(local_100.SMIndex)), local_100.EntryState);
                }
            }
            return local_12;
        }
    }
    return FECSEntity();
}
UFUNCTION()
FECSEntity BP_SpawnPropInValidPos(const FECSEntityAdapter &inout Entity, const TSoftClassPtr<APropPrefabBase> &inout SoftPrefab, const FVector &inout Location, const FRotator &inout Rotation, const FEntityCreateFinishDelegate &inout OnCreateFinish, const float32 MaxNearbyRadius = 500, const float32 StepLength = 50, const bool bSpawnEvenNoValidPos = true, const bool bSpawnOnGround = false, const float32 SpawnOnGroundMaxTraceDownDist = 1000.f, const float32 SpawnOnGroundHeightFromGround = 50.f, const FName &inout SpawnInitEntryName = NAME_None)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FECSEntity __r; return __r;
}
UFUNCTION()
void InitEntityAddBuff(const FECSEntityAdapter &inout Entity, const FBuffConfigRef &inout ConfigRef)
{
    bool local_1;
    if (ECS::GetRuntimeInfo().IsServer && Entity.IsValid())
    {
        Has local_6;
        if (local_6.opCall())
        {
            local_1 = true;
        }
        else
        {
            Has local_10;
            local_1 = local_10.opCall();
        }
        if (local_1)
        {
            ModifyOrAdd local_14;
            local_14.opCall().GetModify_InitBuffs().Add(ConfigRef);
        }
    }
    return;
}
UFUNCTION()
void InitEntityAddGameplayTags(const FECSEntityAdapter &inout Entity, const FGameplayTagContainer &inout GameplayTags)
{
    bool local_1;
    int local_16 = 0;
    if (ECS::GetRuntimeInfo().IsServer && Entity.IsValid())
    {
        Has local_6;
        if (local_6.opCall())
        {
            local_1 = true;
        }
        else
        {
            Has local_10;
            local_1 = local_10.opCall();
        }
        if (local_1)
        {
            for (auto& local_30 : GameplayTags.GameplayTags)
            {
                local_16.Tags.Add(local_30);
            }
        }
    }
    return;
}
UFUNCTION()
void InitEntityOverrideDropItems(const FECSEntityAdapter &inout Entity, const TArray<FDropConfigItem> &inout DropItems)
{
    int local_8 = 0;
    if (ECS::GetRuntimeInfo().IsServer && Entity.IsValid())
    {
        for (auto& local_22 : DropItems)
        {
            local_8.DropItems.Add(local_22);
        }
    }
    return;
}
UFUNCTION()
void InitEntityOverrideDropEnergyBall(const FECSEntityAdapter &inout Entity, const FC_DropEnergyBallSourceOverride &inout Config)
{
    if (ECS::GetRuntimeInfo().IsServer && Entity.IsValid())
    {
    }
    return;
}
UFUNCTION()
void InitEntityDisableDropEnergyBall(const FECSEntityAdapter &inout Entity, const bool DisableDeathDrop = true, const bool DisableHitBreakDrop = true, const bool DisableHitStagger = true)
{
    if (ECS::GetRuntimeInfo().IsServer && Entity.IsValid())
    {
        FC_DropEnergyBallSourceOverride local_8;
        local_8.bOverrideDeathEnergyBallDrops = DisableDeathDrop;
        local_8.bOverrideHitBreakEnergyBallDrops = DisableHitBreakDrop;
        local_8.bOverrideHitStaggerEnergyBallDrops = DisableHitStagger;
    }
    return;
}
UFUNCTION()
void InitEntitySetBBValue_Bool(const FECSEntityAdapter &inout Entity, const FNameHandle_EntityBBVarBool &inout Name, const bool Value)
{
    int local_8 = 0;
    if (ECS::GetRuntimeInfo().IsServer && Entity.IsValid())
    {
        local_8.AddValue_Bool(Name.Name, Value);
    }
    return;
}
UFUNCTION()
void InitEntitySetBBValue_Int(const FECSEntityAdapter &inout Entity, const FNameHandle_EntityBBVarInt &inout Name, const int Value)
{
    int local_8 = 0;
    if (ECS::GetRuntimeInfo().IsServer && Entity.IsValid())
    {
        local_8.AddValue_Int(Name.Name, Value);
    }
    return;
}
UFUNCTION()
void InitEntitySetBBValue_Float(const FECSEntityAdapter &inout Entity, const FNameHandle_EntityBBVarFloat &inout Name, const float32 Value)
{
    int local_8 = 0;
    if (ECS::GetRuntimeInfo().IsServer && Entity.IsValid())
    {
        local_8.AddValue_Float(Name.Name, Value);
    }
    return;
}
UFUNCTION()
void InitEntitySetBBValue_Enum(const FECSEntityAdapter &inout Entity, const FNameHandle_EntityBBVarEnum &inout Name, const uint8 Value)
{
    int local_8 = 0;
    if (ECS::GetRuntimeInfo().IsServer && Entity.IsValid())
    {
        local_8.AddValue_Enum(Name.Name, uint8(Value));
    }
    return;
}
UFUNCTION()
void InitEntitySetBBValue_Vector(const FECSEntityAdapter &inout Entity, const FNameHandle_EntityBBVarVector &inout Name, const FVector &inout Value)
{
    int local_8 = 0;
    if (ECS::GetRuntimeInfo().IsServer && Entity.IsValid())
    {
        local_8.AddValue_Vector(Name.Name, Value);
    }
    return;
}
UFUNCTION()
void InitEntitySetBBValue_Rotator(const FECSEntityAdapter &inout Entity, const FNameHandle_EntityBBVarRotator &inout Name, const FRotator &inout Value)
{
    int local_8 = 0;
    if (ECS::GetRuntimeInfo().IsServer && Entity.IsValid())
    {
        local_8.AddValue_Rotator(Name.Name, Value);
    }
    return;
}
UFUNCTION()
void InitEntitySetBBValue_Name(const FECSEntityAdapter &inout Entity, const FNameHandle_EntityBBVarName &inout Name, const FName &inout Value)
{
    int local_8 = 0;
    if (ECS::GetRuntimeInfo().IsServer && Entity.IsValid())
    {
        local_8.AddValue_Name(Name.Name, Value);
    }
    return;
}
UFUNCTION()
void InitEntitySetBBValue_Cost(const FECSEntityAdapter &inout Entity, const FNameHandle_EntityBBVarCost &inout Name, const FESMCost &inout Value)
{
    int local_8 = 0;
    if (ECS::GetRuntimeInfo().IsServer && Entity.IsValid())
    {
        local_8.AddValue_Cost(Name.Name, Value);
    }
    return;
}
UFUNCTION()
void InitEntitySetBBValue_Entity(const FECSEntityAdapter &inout Entity, const FNameHandle_EntityBBVarEntity &inout Name, const FECSEntity &inout Value)
{
    int local_8 = 0;
    if (ECS::GetRuntimeInfo().IsServer && Entity.IsValid())
    {
        local_8.AddValue_Entity(Name.Name, Value);
    }
    return;
}
UFUNCTION()
void InitEntityESMEntryState(const FECSEntityAdapter &inout Entity, const FName &inout EntryState, const uint8 SMIndex)
{
    int local_8 = 0;
    if (ECS::GetRuntimeInfo().IsServer && Entity.IsValid())
    {
        local_8.Add(uint8(SMIndex), EntryState);
    }
    return;
}
UFUNCTION()
FEntityBBVarOverrideParam MakeEntityBBVarOverrideParam_Bool(const FNameHandle_EntityBBVarBool &inout Name, const bool Value)
{
    FEntityBBVar_Bool local_8;
    local_8.Name = Name;
    local_8.Value = Value;
    FEntityBBVarOverrideParam local_12;
    local_12.ParamValue = FInstancedStruct::Make(local_8);
    return local_12;
}
UFUNCTION()
FEntityBBVarOverrideParam MakeEntityBBVarOverrideParam_Int(const FNameHandle_EntityBBVarInt &inout Name, const int Value)
{
    FEntityBBVar_Int local_8;
    local_8.Name = Name;
    local_8.Value = Value;
    FEntityBBVarOverrideParam local_12;
    local_12.ParamValue = FInstancedStruct::Make(local_8);
    return local_12;
}
UFUNCTION()
FEntityBBVarOverrideParam MakeEntityBBVarOverrideParam_Float(const FNameHandle_EntityBBVarFloat &inout Name, const float32 Value)
{
    FEntityBBVar_Float local_8;
    local_8.Name = Name;
    local_8.Value = Value;
    FEntityBBVarOverrideParam local_12;
    local_12.ParamValue = FInstancedStruct::Make(local_8);
    return local_12;
}
UFUNCTION()
FEntityBBVarOverrideParam MakeEntityBBVarOverrideParam_Enum(const FNameHandle_EntityBBVarEnum &inout Name, const uint8 Value)
{
    FEntityBBVar_Enum local_8;
    local_8.Name = Name;
    local_8.Value = (Value != 0);
    FEntityBBVarOverrideParam local_12;
    local_12.ParamValue = FInstancedStruct::Make(local_8);
    return local_12;
}
UFUNCTION()
FEntityBBVarOverrideParam MakeEntityBBVarOverrideParam_Vector(const FNameHandle_EntityBBVarVector &inout Name, const FVector &inout Value)
{
    FEntityBBVar_Vector local_12;
    local_12.Name = Name;
    local_12.Value = Value;
    FEntityBBVarOverrideParam local_16;
    local_16.ParamValue = FInstancedStruct::Make(local_12);
    return local_16;
}
UFUNCTION()
FEntityBBVarOverrideParam MakeEntityBBVarOverrideParam_Rotator(const FNameHandle_EntityBBVarRotator &inout Name, const FRotator &inout Value)
{
    FEntityBBVar_Rotator local_12;
    local_12.Name = Name;
    local_12.Value = Value;
    FEntityBBVarOverrideParam local_16;
    local_16.ParamValue = FInstancedStruct::Make(local_12);
    return local_16;
}
UFUNCTION()
FEntityBBVarOverrideParam MakeEntityBBVarOverrideParam_Name(const FNameHandle_EntityBBVarName &inout Name, const FName &inout Value)
{
    FEntityBBVar_Name local_8;
    local_8.Name = Name;
    local_8.Value = Value;
    FEntityBBVarOverrideParam local_12;
    local_12.ParamValue = FInstancedStruct::Make(local_8);
    return local_12;
}
UFUNCTION()
FEntityBBVarOverrideParam MakeEntityBBVarOverrideParam_Cost(const FNameHandle_EntityBBVarCost &inout Name, const FESMCost &inout Value)
{
    FEntityBBVar_Cost local_12;
    local_12.Name = Name;
    local_12.Value = Value;
    FEntityBBVarOverrideParam local_16;
    local_16.ParamValue = FInstancedStruct::Make(local_12);
    return local_16;
}
UFUNCTION()
FEntityBBVarOverrideParam MakeEntityBBVarOverrideParam_Entity(const FNameHandle_EntityBBVarEntity &inout Name, const FECSEntityId &inout Value)
{
    FEntityBBVar_Entity local_8;
    local_8.Name = Name;
    local_8.Value = Value;
    FEntityBBVarOverrideParam local_12;
    local_12.ParamValue = FInstancedStruct::Make(local_8);
    return local_12;
}
UFUNCTION()
EAIQuitCombatRule GetAIQuitCombatRule(const FECSEntity &inout Entity)
{
    return FAIQuitCombatUtils::GetQuitCombatRule(Entity);
}
UFUNCTION()
void ChangeAIQuitCombatRule(const FECSEntity &inout Entity, const EAIQuitCombatRule NewRule)
{
    FAIQuitCombatUtils::SetQuitCombatRuleOverride(Entity, EAIQuitCombatRule(NewRule));
    return;
}
UFUNCTION()
void SetAIBlackboardValueBool(const FECSEntityAdapter &inout Entity, const FName &inout KeyName, const bool Value)
{
    FAIKnowledgeUtils::SetAIBlackboardValueBool(Entity.opImplConv(), KeyName, Value);
    return;
}
UFUNCTION()
void SetAIBlackboardValueInt(const FECSEntityAdapter &inout Entity, const FName &inout KeyName, const int Value)
{
    FAIKnowledgeUtils::SetAIBlackboardValueInt(Entity.opImplConv(), KeyName, Value);
    return;
}
UFUNCTION()
void SetAIBlackboardValueFloat(const FECSEntityAdapter &inout Entity, const FName &inout KeyName, const float32 Value)
{
    FAIKnowledgeUtils::SetAIBlackboardValueFloat(Entity.opImplConv(), KeyName, Value);
    return;
}
UFUNCTION()
void SetAIBlackboardValueEntityId(const FECSEntityAdapter &inout Entity, const FName &inout KeyName, const FECSEntityAdapter &inout Value)
{
    FAIKnowledgeUtils::SetAIBlackboardValueEntityId(Entity.opImplConv(), KeyName, Value.GetEntity().GetId());
    return;
}
UFUNCTION()
void SetAIBlackboardValueVector(const FECSEntityAdapter &inout Entity, const FName &inout KeyName, const FVector &inout Value)
{
    FAIKnowledgeUtils::SetAIBlackboardValueVector(Entity.opImplConv(), KeyName, Value);
    return;
}
UFUNCTION()
void SetAIBlackboardValueName(const FECSEntityAdapter &inout Entity, const FName &inout KeyName, const FName &inout Value)
{
    FAIKnowledgeUtils::SetAIBlackboardValueName(Entity.opImplConv(), KeyName, Value);
    return;
}
UFUNCTION()
void SetAIBlackboardValueString(const FECSEntityAdapter &inout Entity, const FName &inout KeyName, const FString &inout Value)
{
    FAIKnowledgeUtils::SetAIBlackboardValueString(Entity.opImplConv(), KeyName, Value);
    return;
}
UFUNCTION()
void DispatchAISpecialToken(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FAISpecialCombatTokenConfig> &inout SpecialToken, const FFPTime &inout GenerateTokenDelay = 0, const EAISpecialTokenDispatchMode DispatchMode = EAISpecialTokenDispatchMode::SendToAll, const TArray<FECSEntityAdapter> &inout TargetEntities = TArray<FECSEntityAdapter>())
{
    if (SpecialToken)
    {
        TArray<FECSEntityId> local_12;
        if (int(DispatchMode) == 1)
        {
            for (auto& local_28 : TargetEntities)
            {
                FECSEntityId local_29 = FECSEntityId(local_28.GetEntity().GetId());
                if ((!((local_29 == ENTITY_ID_NULL))))
                {
                    local_12.Add(local_29);
                }
            }
        }
        FECSEntity local_34 = Entity.opImplConv();
    }
    return;
}
UFUNCTION()
void AddESMExternalTransit(const FECSEntityAdapter &inout Entity, const FName &inout ToState, const FName &inout ToSMName = NAME_None, const FName &inout ToNotify = NAME_None, const FFPTime &inout TransitEventTime = -1, const float32 ToTimeOffset = 0, const float32 ToTimeAnchor = 0, const FName &inout Comment = NAME_None)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        FESMExternalTransitHandle local_14 = Entity.GetEntity().ESMExternalTransit(ToSMName, ToState, Comment);
        if ((!((ToNotify == NAME_None))))
        {
            local_14.SetToNotify(ToNotify, ToTimeOffset, ToTimeAnchor);
        }
    }
    return;
}
UFUNCTION()
void SetESMExtraTickSpeed(const FECSEntityAdapter &inout Entity, const float32 ExtraTickSpeed)
{
    ModifyOrAdd local_4;
    local_4.opCall().SetTickSpeed(ExtraTickSpeed);
    return;
}
UFUNCTION()
bool IsEntityMount(const FECSEntityAdapter &inout Entity)
{
    Has local_4;
    return local_4.opCall();
}
UFUNCTION()
void SimpleLinearMoveTo(const FECSEntityAdapter &inout Entity, const FVector &inout TargetPosition, const float32 Speed, const bool bRotation = false, const FRotator &inout DesiredRotation = FRotator::ZeroRotator, const bool bRotateToMoveDir = false)
{
    int local_30 = 0;
    int local_82 = 0;
    int local_96 = 0;
    if (Speed <= 0.0f)
    {
        return;
    }
    Get local_6;
    const FC_Transform& local_8 = local_6.opCall();
    if (local_8)
    {
        FVector local_20 = (TargetPosition - local_8.GetPosition());
        float32 local_1 = float32(local_20.Size());
        if (local_1 > 0.0f)
        {
            local_30.SetMoveBeginTime(BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()));
            local_30.SetMoveTotalTime(FFPTime((local_1 / Speed)));
            local_30.SetMoveTime(FFPTime(0));
            local_30.SetLastMoveTime(FFPTime(0));
            local_30.SetMoveTotalTime((FFPTime(FECSWorld::FixedFrameInterval) * FMath::CeilToInt((FFPTime(local_30.GetMoveTotalTime()) / FECSWorld::FixedFrameInterval))));
            FFPTime local_40 = FFPTime(local_30.GetMoveTotalTime());
            if (local_40.opCmp(FECSWorld::FixedFrameInterval) < 0)
            {
                local_30.SetMoveTotalTime(FECSWorld::FixedFrameInterval);
            }
            local_30.SetInitRotation(local_8.ToFTransform().GetRotation());
            local_82.SetVelocity((local_20.GetUnsafeNormal() * (local_1 / local_30.GetMoveTotalTime().ToSeconds())));
            local_82.SetbRotateToMoveDir(bRotateToMoveDir);
            if ((bRotation && !(bRotateToMoveDir)))
            {
                local_96.SetRotationBeginTime(BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()));
                local_96.SetRotationTotalTime(local_30.GetMoveTotalTime());
                FQuat local_120 = (DesiredRotation.Quaternion() * local_8.GetRotation().Inverse());
                FVector local_126;
                float32 local_127 = 0.0f;
                local_120.ToAxisAndAngle(local_126, local_127);
                local_127 = local_127 / (float32((FFPTime(local_96.GetRotationTotalTime()) / FECSWorld::FixedFrameInterval)));
                local_96.SetDeltaRotation(FQuat4f(FVector3f(local_126), local_127));
            }
        }
    }
    return;
}
UFUNCTION()
void ToggleVisualComponents(const FECSEntity &inout Entity, const bool bHidden, const TArray<FName> &inout Names, const UObject InstigatorObject)
{
    int local_10 = 0;
    int local_20 = 0;
    if (bHidden)
    {
        FFPTime local_6 = FFPTime(-1);
        if (local_10)
        {
            local_10.CurrentTime = Entity.GetWorld().GetFixedTime().Time;
            local_10.LogicNames = Names;
        }
    }
    if (local_20)
    {
        InstigatorObject.GetFName();
        FECSWorldPtr local_14 = Entity.GetWorld();
    }
    return;
}
UFUNCTION()
void SetEntityRotation(const FECSEntityAdapter &inout Entity, const FRotator &inout Rotation)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        ModifyOrAdd local_10;
        local_10.opCall().SetNextRotation(FQuat4f(Rotation.Quaternion()));
    }
    return;
}
UFUNCTION()
void EnableGravityFalling(const FECSEntityAdapter &inout Entity, const float32 GravityScale = 1.f, const FObjectTypeMask &inout ObjectType = FObjectTypeMask(), const TSoftClassPtr<UEASAbility> &inout AbilityBP = nullptr, const FName &inout OnLandSignalName = n"OnLand")
{
    Has local_4;
    int local_48 = 0;
    int local_54 = 0;
    if (!(local_4.opCall()))
    {
        XWarning(ELog(0), FString().Append(Entity.GetEntityName().ToString()).Append(" EnableGravityFalling must has FC_Collision"));
        return;
    }
    ModifyOrAdd local_22;
    FC_GravityFallingMovementRuntime& local_24 = local_22.opCall();
    if (local_24)
    {
        local_24.SetGravityScale(GravityScale);
    }
    ModifyOrAdd local_28;
    FC_EntityHitCollider& local_30 = local_28.opCall();
    if (local_30)
    {
        local_30.SetEntity(Entity.GetEntity());
        Get local_38;
        const FC_Transform& local_40 = local_38.opCall();
        if (local_40)
        {
            local_30.SetLastPosition(local_40.GetPosition());
        }
        local_30.GetExtraConfig().SetbHitSceneEvent(false);
        local_30.GetExtraConfig().SetbEndMovementWhenHitScene(true);
        local_30.GetExtraConfig().SetPropMovementCollisionCheckMode(EPropMovementCollisionCheckMode(0));
        local_30.GetExtraConfig().SetbCollisionCheckIncludeDynamic(true);
        local_30.GetExtraConfig().SetObjectTypeMask(ObjectType);
        local_30.GetExtraConfig().SetbMovementEndEvent(true);
        local_30.GetExtraConfig().SetMovementEndProcessMode(EPropMovementHitSceneEventProcessMode(0));
        local_30.GetExtraConfig().SetMovementEndAbilityClass(AbilityBP);
        local_30.GetExtraConfig().SetMovementEndSignalName(OnLandSignalName);
    }
    if (!(AbilityBP.IsNull()))
    {
        local_48.SetNotifyEntity(Entity.GetEntity());
        local_48.SetAbilityClass(AbilityBP);
        local_48.SetSignalName(OnLandSignalName);
    }
    local_54.SetMoveBeginTime(BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()));
    local_54.SetMoveTime(FFPTime(0));
    local_54.SetLastMoveTime(FFPTime(0));
    local_54.SetMoveTotalTime(FFPTime(-1));
    GetDefaulted local_62;
    local_54.SetInitRotation(local_62.opCall().ToFTransform().GetRotation());
    return;
}
UFUNCTION()
void DisableGravityFalling(const FECSEntityAdapter &inout Entity)
{
    Remove local_4;
    local_4.opCall();
    return;
}
UFUNCTION()
void TransformAttachToEntity(const FECSEntityAdapter &inout Entity, const FECSEntity &inout AttachToEntity, const FVector &inout LocationOffset, const FQuat &inout RotationOffset, const bool bWorldSpaceLocationOffset = false)
{
    int local_12 = 0;
    int local_20 = 0;
    if (!(Entity.IsValid()) || !(AttachToEntity.IsValid()))
    {
        return;
    }
    if (!(ECS::IsAuthorityOrPrediction(Entity.opImplConv())))
    {
        return;
    }
    local_12.SetAttachmentMode(ETransformAttachmentLogicMode(1));
    local_12.SetAttachToEntity(AttachToEntity);
    local_12.SetLocationOffset(LocationOffset);
    local_12.SetRotationOffset(RotationOffset);
    local_12.SetbWorldSpaceLocationOffset(bWorldSpaceLocationOffset);
    local_20.SetAttachToEntity(AttachToEntity);
    local_20.SetLocationOffset(LocationOffset);
    local_20.SetRotationOffset(RotationOffset);
    return;
}
UFUNCTION()
void DamageTarget(const FECSEntityAdapter &inout Entity, const FECSEntity &inout Target, const TDataObjectPtr<FAttackData> &inout AttackDataConfig, const EDamageToTargetDirection Direction, const FAreaStrikeShape &inout StrikeShape, const TDataObjectPtr<FHitDecalConfig> &inout DecalConfig)
{
    if (!(Entity.IsValid()) || !(Target.IsValid()) || !(ECS::IsAuthorityOrPrediction(Target)))
    {
        return;
    }
    TDataObjectPtr<FAttackData> local_54 = FCombatUtils::GetAttackDataPtrFromDataTable(AttackDataConfig.opImplConv(), Entity.opImplConv());
    if (local_54)
    {
        const FAttackData& local_98;
        FFPTime local_86 = BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv());
        GetDefaulted local_96;
        FVector local_92 = local_96.opCall().GetPosition();
        GetDefaulted local_128;
        FTransform local_152 = local_128.opCall().ToFTransform();
        FVector local_170 = (local_92 - local_152.GetLocation());
        FVector local_176(FVector::ZeroVector);
        switch (int(Direction))
        {
        case 0:
        {
            local_176 = local_170;
            break;
        }
        case 1:
        {
            local_176 = local_170.RotateAngleAxis(90.0, local_170.RotateAngleAxis(-90.0, local_170.CrossProduct(FVector::UpVector).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
            break;
        }
        case 2:
        {
            local_176 = local_170.RotateAngleAxis(-90.0, local_170.RotateAngleAxis(-90.0, local_170.CrossProduct(FVector::UpVector).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
            break;
        }
        case 3:
        {
            local_176 = FVector::DownVector;
            break;
        }
        }
        if (local_98.HasHitPresentation())
        {
            FCE_HitEvent local_190;
            local_190.SetbPredictable(false);
            local_190.Attacker = Entity.opImplConv();
            local_190.Receiver = Target;
            local_190.AttackData = local_54;
            local_190.HitPosition = local_92;
            FAreaStrikeShape local_212 = StrikeShape;
            local_212.Position = local_152.GetRotation().UnrotateVector(local_170);
            local_212.Rotation = local_152.GetRotation().UnrotateVector(local_190.StrikeData.GetStrikeDirection()).ToOrientationRotator();
            local_190.StrikeData.SetStrikeShape(local_212);
            local_190.StrikeData.SetStrikeDirection(local_176);
            local_190.StrikeData.SetDecalConfig(DecalConfig.opImplConv());
            int local_177 = int(local_190._base_FECSEvent);
        }
        bool local_2 = FDamageUtils::IsDamageToAvatar(Target);
        FAttackInfo local_278;
        local_278.AttackData = local_54.opImplConv();
        FCapabilityInstanceId local_279;
        if (UEASAbility::GetContextAbility() != nullptr)
        {
            local_279 = UEASAbility::GetContextAbility().GetContextCapabilityInstanceId();
        }
        FECSEntity local_84 = Entity.opImplConv();
        FECSEntity local_84_2 = Entity.opImplConv();
        FECSEntity local_84_3 = Entity.opImplConv();
        FECSEntity local_308 = Entity.opImplConv();
        FECSEntity local_312 = Entity.opImplConv();
    }
    return;
}
UFUNCTION()
float32 GetAttackDataHitImpulseX(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    return GetHitImpulseX();
}
UFUNCTION()
float32 GetAttackDataHitImpulseZ(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    return GetHitImpulseZ();
}
UFUNCTION()
float32 GetHitImpulseX(const FAttackData &inout AttackData)
{
    return AttackData.GetHitImpulseX();
}
UFUNCTION()
float32 GetHitImpulseZ(const FAttackData &inout AttackData)
{
    return AttackData.GetHitImpulseZ();
}
UFUNCTION()
void DamageTargetDirect(const FECSEntityAdapter &inout Entity, const FECSEntity &inout Target, const TDataObjectPtr<FAttackData> &inout AttackDataConfig)
{
    if (!(Target.IsValid()) || !(ECS::IsAuthorityOrPrediction(Target)))
    {
        return;
    }
    if (FCombatUtils::GetAttackDataPtrFromDataTable(AttackDataConfig.opImplConv(), Entity.opImplConv()))
    {
        FFPTime local_84 = BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv());
        FECSEntity local_82 = Entity.opImplConv();
        FECSEntity local_88 = Entity.opImplConv();
    }
    return;
}
UFUNCTION()
void AccumulateTargetAbnormal(const FECSEntityAdapter &inout SourceEntity, const FECSEntity &inout Target, const EAbnormalState AbnormalState, const float32 AbnormalValue, const bool bIsEnhancedAbnormal)
{
    if (!(Target.IsValid()) || !(ECS::IsAuthorityOrPrediction(Target)))
    {
        return;
    }
    ModifyOrAdd local_6;
    FC_AbnormalValuePreChange& local_8 = local_6.opCall();
    if (local_8)
    {
        FDamageAbnormalChangeData local_16;
        local_16.SourceEntity = SourceEntity.opImplConv();
        local_16.AbnormalState = AbnormalState;
        float32 local_21 = -AbnormalValue;
        local_16.DeltaValue = local_21;
        local_16.bEnhanced = bIsEnhancedAbnormal;
        local_8.Changes.Add(local_16);
    }
    return;
}
UFUNCTION()
int AddPotentialDamage(const FECSEntityAdapter &inout CasuerEntity, const FECSEntity &inout TargetEntity, const TDataObjectPtr<FAttackData> &inout AttackDataRow, const float32 ExpireDuration = 10.0f)
{
    if (!(TargetEntity.IsValid()) || !(ECS::IsAuthorityOrPrediction(TargetEntity)))
    {
        return -1;
    }
    FCapabilityInstanceId local_4;
    if (UEASAbility::GetContextAbility() != nullptr)
    {
        local_4 = UEASAbility::GetContextAbility().GetContextCapabilityInstanceId();
    }
    FFPTime local_22 = (BlueprintFunctions_Common::GetWorldTime(CasuerEntity.opImplConv()) + FFPTime(ExpireDuration));
    return FCombatUtils::AddPotentialDamage(CasuerEntity.opImplConv(), TargetEntity, AttackDataRow, BlueprintFunctions_Common::GetWorldTime(CasuerEntity.opImplConv()), local_22, local_4);
}
UFUNCTION()
void RemovePotentialDamage(const FECSEntityAdapter &inout TargetEntity, const int DamageIndex)
{
    if (!(TargetEntity.IsValid()) || !(ECS::IsAuthorityOrPrediction(TargetEntity.opImplConv())))
    {
        return;
    }
    FCombatUtils::RemovePotentialDamage(TargetEntity.opImplConv(), DamageIndex);
    return;
}
UFUNCTION()
void ApplyPotentialDamage(const FECSEntityAdapter &inout TargetEntity, const int DamageIndex)
{
    if (DamageIndex < 0 || !(TargetEntity.IsValid()) || !(ECS::IsAuthorityOrPrediction(TargetEntity.opImplConv())))
    {
        return;
    }
    FCombatUtils::ApplyPotentialDamage(TargetEntity.opImplConv(), DamageIndex, BlueprintFunctions_Common::GetWorldTime(TargetEntity.opImplConv()));
    return;
}
UFUNCTION()
void LifeDrain(const FECSEntityAdapter &inout Entity, const bool bValueAsMaxHPRatio, const float32 Value)
{
    if (!(Entity.IsValid()) || !(ECS::IsAuthorityOrPrediction(Entity.opImplConv())))
    {
        return;
    }
    FDamageUtils::LifeDrain(Entity.opImplConv(), bValueAsMaxHPRatio, Value, BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()));
    return;
}
UFUNCTION()
void TriggerSkillSignal(const FECSEntityAdapter &inout Entity, const USkillConfig SkillConfig, const FName &inout Signal)
{
    Has local_4;
    bool local_11;
    int local_18 = 0;
    bool local_6 = !(false);
    if (!(local_4.opCall()) == local_6)
    {
        local_11 = true;
    }
    else
    {
        Has local_10;
        local_11 = (!(local_10.opCall()) == !(false));
    }
    if (local_11)
    {
        return;
    }
    int local_20 = local_18.IndexOfSkill(SkillConfig);
    if (local_20 < 0)
    {
        return;
    }
    FC_EASAbilityInstance& local_22 = FSkillUtils::TryGetSkillAbilityInstance(Entity.opImplConv(), local_20);
    if (local_22)
    {
        FAbilityUtils::InvokeSignal(local_22, Entity.opImplConv(), Signal, BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()), true);
    }
    return;
}
UFUNCTION()
void ActivateSkill(const FECSEntityAdapter &inout Entity, const USkillConfig SkillConfig)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return;
    }
    int local_9 = local_6.IndexOfSkill(SkillConfig);
    if (local_9 < 0)
    {
        return;
    }
    FSkillUtils::ActivateSkill(Entity.opImplConv(), local_9, BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()));
    return;
}
UFUNCTION()
void DeactivateSkill(const FECSEntityAdapter &inout Entity, const USkillConfig SkillConfig)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return;
    }
    int local_9 = local_6.IndexOfSkill(SkillConfig);
    if (local_9 < 0)
    {
        return;
    }
    FSkillUtils::DeactivateSkill(Entity.opImplConv(), local_9, BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()));
    return;
}
UFUNCTION()
void TurnSkillStage(const FECSEntityAdapter &inout Entity, const USkillConfig SkillConfig, const int TargetStage)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return;
    }
    int local_9 = local_6.IndexOfSkill(SkillConfig);
    if (local_9 < 0)
    {
        return;
    }
    FSkillUtils::SkillTurnToStage(Entity.opImplConv(), local_9, TargetStage, BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()));
    return;
}
UFUNCTION()
void ChangeSkillState(const FECSEntityAdapter &inout Entity, const USkillConfig SkillConfig, const int TargetState)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return;
    }
    int local_9 = local_6.IndexOfSkill(SkillConfig);
    if (local_9 < 0)
    {
        return;
    }
    FSkillUtils::ChangeSkillState(Entity.opImplConv(), local_9, TargetState, BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()));
    return;
}
UFUNCTION()
int GetSkillState(const FECSEntityAdapter &inout Entity, const USkillConfig SkillConfig)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return -1;
    }
    int local_8 = local_6.IndexOfSkill(SkillConfig);
    if (local_8 < 0)
    {
        return -1;
    }
    return local_6.GetSkillRuntimeInfos()[local_8].GetSkillState();
}
UFUNCTION()
void ConsumeTemporarySkillTime(const FECSEntityAdapter &inout Entity)
{
    Modify local_4;
    FC_TemporarySkillOwner& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.SetUsableTime((local_6.GetUsableTime() - 1));
        if (local_6.GetUsableTime() <= 0)
        {
            FSkillUtils::RemoveSkill(local_6.GetSkillEntity(), Entity.opImplConv(), true);
            Remove local_18;
            local_18.opCall();
        }
    }
    return;
}
UFUNCTION()
void SetSkillDisabledByConfig(const FECSEntityAdapter &inout Entity, const USkillConfig SkillConfig, const bool bDisabled)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UFUNCTION()
void SetSkillSlotDisabled(const FECSEntityAdapter &inout Entity, const ESkillSlot SkillSlot, const bool bDisabled)
{
    FSkillUtils::SetSkillSlotDisabled(Entity.opImplConv(), bDisabled);
    return;
}
UFUNCTION()
bool HasSkill(const FECSEntityAdapter &inout Entity, const USkillConfig SkillConfig)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    bool __r; return __r;
}
UFUNCTION()
int GetSkillIndexByConfig(const FECSEntityAdapter &inout Entity, const USkillConfig SkillConfig)
{
    return FSkillUtils::GetSkillIndex(Entity.opImplConv(), SkillConfig);
}
UFUNCTION()
int GetSkillIndexBySlot(const FECSEntityAdapter &inout Entity, const ESkillSlot SkillSlot)
{
    return FSkillUtils::GetSkillIndex(Entity.opImplConv());
}
UFUNCTION()
int GetContextSkillIndex(const FECSEntityAdapter &inout Entity)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    int __r; return __r;
}
UFUNCTION()
void ConsumeSkillCD(const FECSEntityAdapter &inout Entity, const int SkillIndex)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UFUNCTION()
void ConsumeSkillAttribute(const FECSEntityAdapter &inout Entity, const int SkillIndex)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UFUNCTION()
void ConsumeSkillItem(const FECSEntityAdapter &inout Entity, const int SkillIndex)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UFUNCTION()
void RecoverSkillCDBySecond(const FECSEntityAdapter &inout Entity, const float32 Seconds, const int SkillIndex)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UFUNCTION()
void RecoverSkillCDByRate(const FECSEntityAdapter &inout Entity, const float32 Rate, const int SkillIndex)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UFUNCTION()
void RecoverAllSimpleSkillCD(const FECSEntityAdapter &inout Entity)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UFUNCTION()
EFactionRelation GetEntityFactionRelation(const FECSEntityAdapter &inout EntityA, const FECSEntity &inout EntityB)
{
    return FASCommonUtils::GetEntityFactionRelation(EntityA.opImplConv(), EntityB);
}
UFUNCTION()
void SetEntityFaction(const FECSEntityAdapter &inout Entity, const EFaction Faction, const bool bSetAllControlledPawn = false)
{
    if (bSetAllControlledPawn)
    {
        FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv());
        Get local_16;
        const FC_PlayerController& local_18 = local_16.opCall();
        if (local_18)
        {
            TArray<FECSEntity> local_24 = local_18.GetAllPlayerPawnEntities();
            for (auto& local_38 : local_24)
            {
                FFactionUtils::SetEntityFaction(local_38, EFaction(Faction));
            }
        }
    }
    FFactionUtils::SetEntityFaction(Entity.opImplConv());
    return;
}
UFUNCTION()
bool IsEntityControlledByPlayer(const FECSEntityAdapter &inout Entity)
{
    Has local_4;
    bool local_5;
    if (local_4.opCall())
    {
        local_5 = true;
    }
    else
    {
        Has local_10;
        local_5 = local_10.opCall();
    }
    if (local_5)
    {
        return true;
    }
    return false;
}
UFUNCTION()
void GetUniquePlayerEntity(const FECSEntityAdapter &inout Entity, FECSEntity &out OutEntity)
{
    FECSEntity local_4;
    OutEntity = local_4;
    OutEntity = FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv());
    return;
}
UFUNCTION()
void GetUniquePlayerPawnEntity(const FECSEntityAdapter &inout Entity, FECSEntity &out OutEntity)
{
    FECSEntity local_4;
    OutEntity = local_4;
    OutEntity = FASCommonUtils::GetUniqueAvatarPawnEntity(Entity.opImplConv());
    return;
}
UFUNCTION()
void GetAvatarEntity(const FECSEntityAdapter &inout Entity, FECSEntity &out OutEntity)
{
    FECSEntity local_4;
    OutEntity = local_4;
    FECSEntity local_8 = Entity.opImplConv();
    Get local_16;
    const FC_PlayerController& local_18 = local_16.opCall();
    if (local_18)
    {
        local_8 = local_18.GetPlayerPawnEntity();
    }
    OutEntity = FASCommonUtils::GetRiderEntity(local_8);
    return;
}
UFUNCTION()
void GetSocialInteractionInfoTarget(const FECSEntityAdapter &inout Entity, FECSEntity &out OutEntity)
{
    FECSEntity local_4;
    OutEntity = local_4;
    FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv());
    Get local_20;
    const FC_SocialInteractionInfo& local_22 = local_20.opCall();
    if (local_22)
    {
        OutEntity = FASCommonUtils::GetUniqueAvatarPawnEntity(local_22.GetRequestInteractActionTargetPlayerEntity());
    }
    return;
}
UFUNCTION()
void SpawnFakeCharacterAndControl(const FECSEntityAdapter &inout SwitchOutAvatar, const FDefaultAvatarData &inout SwitchInData, const FSpawnFakeCharacterExtractData &inout ExtraData)
{
    FFakeCharacterUtils::SpawnFakeCharacterAndControl(SwitchOutAvatar.GetEntity(), SwitchInData, ExtraData);
    return;
}
UFUNCTION()
void StopControlFakeCharacterByOwner(const FECSEntityAdapter &inout FakeEntity)
{
    FFakeCharacterUtils::StopControlFakeCharacterByOwner(FakeEntity.GetEntity());
    return;
}
UFUNCTION()
void StopControlFakeCharacter(const FECSEntityAdapter &inout SwitchOutAvatar)
{
    FFakeCharacterUtils::StopControlFakeCharacter(SwitchOutAvatar.GetEntity());
    return;
}
UFUNCTION()
void PlayForceFeedback(const FECSEntityAdapter &inout Entity, const UForceFeedbackEffect ForceFeedbackEffect, const FName &inout Tag, const bool bLooping, const bool bIgnoreTimeDilation, const bool bPlayWhilePaused)
{
    FFPTime local_10 = BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv());
    FCE_LocalPlayerForceFeedbackEffect local_12;
    local_12.ForceFeedbackEffect = ForceFeedbackEffect;
    local_12.Tag = Tag;
    local_12.bLooping = bLooping;
    local_12.bIgnoreTimeDilation = bIgnoreTimeDilation;
    local_12.bPlayWhilePaused = bPlayWhilePaused;
    return;
}
UFUNCTION()
TDataObjectPtr<FAvatarPrefabConfig> GetActiveAvatarPrefabConfig(const FECSEntityAdapter &inout PlayerControllerEntity)
{
    bool local_13;
    int local_26 = 0;
    if (!(FASCommonUtils::GetUniquePlayerEntity(PlayerControllerEntity.opImplConv()).IsValid()))
    {
        local_13 = false;
    }
    else
    {
        Has local_18;
        local_13 = local_18.opCall();
    }
    if (local_13)
    {
        FECSEntity local_30 = local_26.GetPlayerPawnEntity();
        if (local_30.IsValid())
        {
            return GetAvatarConfig(local_30);
        }
    }
    return TDataObjectPtr<FAvatarPrefabConfig>(nullptr);
}
UFUNCTION()
TDataObjectPtr<FAvatarPrefabConfig> GetInactiveAvatarPrefabConfig(const FECSEntityAdapter &inout PlayerControllerEntity)
{
    bool local_13;
    int local_26 = 0;
    if (!(FASCommonUtils::GetUniquePlayerEntity(PlayerControllerEntity.opImplConv()).IsValid()))
    {
        local_13 = false;
    }
    else
    {
        Has local_18;
        local_13 = local_18.opCall();
    }
    if (local_13)
    {
        FECSEntity local_30 = local_26.GetPlayerPawnEntity();
        for (auto& local_44 : local_26.GetAllPlayerPawnEntities())
        {
            if (local_44.IsValid() && !((local_44 == local_30)))
            {
                return GetAvatarConfig(local_44);
            }
        }
    }
    return TDataObjectPtr<FAvatarPrefabConfig>(nullptr);
}
UFUNCTION()
void SetGameplayInputEnabled(const FECSEntityAdapter &inout Entity, const bool bEnabled)
{
    if (!(FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv()).IsValid()))
    {
        return;
    }
    FFPTime local_20 = FFPTime(-1);
    FCE_SetGameplayInputEnabled local_24;
    local_24.bEnabled = bEnabled;
    return;
}
UFUNCTION()
void GetCurrentLockTarget(const FECSEntityAdapter &inout Entity, bool &out HasLockTarget, FECSEntity &out TargetEntity, FVector &out LockLocation)
{
    HasLockTarget = false;
    FECSEntity local_6;
    TargetEntity = local_6;
    LockLocation = FVector();
    Get local_16;
    const FC_LockTarget& local_18 = local_16.opCall();
    if (local_18)
    {
        HasLockTarget = true;
        TargetEntity = local_18.GetTargetEntity();
        if (local_18.GetbCachedValidLockTargetPosition())
        {
            LockLocation = local_18.GetLogicLockTargetPosition();
        }
    }
    return;
}
UFUNCTION()
FAITargetingQueryResult ExecuteTargetingQuery(const FECSEntity &inout Entity, const TDataObjectPtr<FAITargetingQueryConfig> &inout TargetingQueryConfig)
{
    if (!(Entity.IsValid()) || (TargetingQueryConfig == nullptr))
    {
        return FAITargetingQueryResult();
    }
    FAITargetingQueryConfig::CreateBehaviorTreeContextForEntity(Entity);
    return FAITargetingUtils::Query(Entity, TargetingQueryConfig, FAISmartValueContext());
}
UFUNCTION()
void GetCurrentAttackTarget(const FECSEntity &inout Entity, bool &out HasAttackTarget, FECSEntity &out TargetEntity)
{
    HasAttackTarget = false;
    FECSEntity local_6;
    TargetEntity = local_6;
    FECSEntity local_14 = FAITargetingUtils::GetCurrentAttackTarget(Entity);
    if (local_14.IsValid())
    {
        HasAttackTarget = true;
        TargetEntity = local_14;
    }
    return;
}
UFUNCTION()
void DisableLockTarget(const FECSEntityAdapter &inout Entity)
{
    Get local_4;
    const FC_LockTarget& local_6 = local_4.opCall();
    if (local_6)
    {
        FLockTargetUtils::DisposeChangeLockTarget(Entity.opImplConv(), ENTITY_NULL, local_6.GetTargetEntity(), -1, false, EPreChangeTargetReason(4), ELockTargetType(0));
    }
    return;
}
UFUNCTION()
void ChangeMultiLockSubPointsValid(const FECSEntity &inout Entity, const bool bValid, const int MainIndex, const FName &inout SubSokcetName)
{
    Has local_4;
    int local_8 = 0;
    if (!(local_4.opCall()))
    {
        return;
    }
    if (MainIndex >= local_8.GetLockPoints().Num())
    {
        XError(ELog(7), "[ChangeMultiLockSubPointsValid] MainIndex >= MultiLockableConfig.LockPoints.Num()");
        return;
    }
    bool local_15 = false;
    int local_16 = 0;
    for (; local_16 < local_8.GetLockPoints()[MainIndex].GetSubPoints().Num(); ++local_16)
    {
        if ((SubSokcetName == local_8.GetLockPoints()[MainIndex].GetSubPoints()[local_16].GetSocket()))
        {
            local_8.GetModify_LockPoints()[MainIndex].GetModify_SubPoints()[local_16].SetbValid(bValid);
            local_15 = true;
        }
    }
    if (!(local_15))
    {
        XError(ELog(7), "[ChangeMultiLockSubPointsValid] bEffectOnConfig == false, nothing change");
    }
    return;
}
UFUNCTION()
bool GetMultiLockSubPointsValid(const FECSEntity &inout Entity, const bool bValid, const int MainIndex, const FName &inout SubSokcetName)
{
    Has local_4;
    int local_8 = 0;
    if (!(local_4.opCall()))
    {
        return false;
    }
    if (MainIndex >= local_8.GetLockPoints().Num())
    {
        XError(ELog(7), "[GetMultiLockSubPointsValid] MainIndex >= MultiLockableConfig.LockPoints.Num()");
        return false;
    }
    int local_15 = 0;
    for (; local_15 < local_8.GetLockPoints()[MainIndex].GetSubPoints().Num(); ++local_15)
    {
        if ((SubSokcetName == local_8.GetLockPoints()[MainIndex].GetSubPoints()[local_15].GetSocket()))
        {
            return local_8.GetModify_LockPoints()[MainIndex].GetSubPoints()[local_15].GetbValid();
        }
    }
    return false;
}
UFUNCTION()
void CacheLockTargetEntityInBBVar(const FECSEntityAdapter &inout Entity, const FNameHandle_EntityBBVarEntity &inout BBVarEntity)
{
    Get local_4;
    const FC_LockTarget& local_6 = local_4.opCall();
    if (local_6)
    {
        FNameHandle_EntityBBVar local_16;
        local_16;
        if (Entity.GetEntity().HasEntityBB(local_16))
        {
            Entity.GetEntity().SetBB_Entity(BBVarEntity, local_6.GetTargetEntity());
            return;
        }
    }
    return;
}
UFUNCTION()
void PushExternalAITargetingQuery(const FECSEntity &inout Entity, const FName &inout SourceName, const TDataObjectPtr<FAITargetingQueryConfig> &inout QueryConfig)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(Entity.IsValid()))
    {
        XWarning(ELog(14), "PushExternalAITargetingQuery: invalid Entity");
        return;
    }
    if (SourceName.IsNone())
    {
        XWarning(ELog(14), "PushExternalAITargetingQuery: SourceName must not be None");
        return;
    }
    if ((QueryConfig == nullptr))
    {
        XWarning(ELog(14), FString().Append("PushExternalAITargetingQuery: QueryConfig is null (SourceName=").Append(SourceName.ToString()).Append(")"));
        return;
    }
    FAITargetingQueryConfig::CreateBehaviorTreeContextForEntity(Entity);
    TArray<FAISmart_EntityId> local_46;
    local_46.Add(FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0)));
    return;
}
UFUNCTION()
void PopExternalAITargetingQuery(const FECSEntity &inout Entity, const FName &inout SourceName)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(Entity.IsValid()))
    {
        XWarning(ELog(14), "PopExternalAITargetingQuery: invalid Entity");
        return;
    }
    if (SourceName.IsNone())
    {
        XWarning(ELog(14), "PopExternalAITargetingQuery: SourceName must not be None");
        return;
    }
    FAITargetingUtils::PopQueryInstanceBySourceName(Entity, SourceName);
    return;
}
UFUNCTION()
void AddInventoryItem(const FECSEntityAdapter &inout Entity, const FItemTableRowRef &inout Item, const int number = 1)
{
    InventoryUtils::AddInventoryItem(Entity.opImplConv(), TDataObjectPtr<FItemConfig>(), number);
    return;
}
UFUNCTION()
void IncreaseInventoryItem(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FItemConfig> &inout Item, const int number = 1)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        InventoryUtils::AddInventoryItem(Entity.opImplConv(), Item, number);
    }
    return;
}
UFUNCTION()
int GetInventoryItemNum(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FItemConfig> &inout Item)
{
    return InventoryUtils::GetInventoryItemNumber(Entity.opImplConv(), Item);
}
UFUNCTION()
void SpawnCollectItem(const FECSEntityAdapter &inout Entity, const TSoftClassPtr<ACollectionPrefab> &inout SoftPrefab, const FVector &inout Location, const FRotator &inout Rotation, FECSEntity &out PropEntity)
{
    UObject local_18;
    FECSEntity local_4;
    PropEntity = local_4;
    if (ECS::GetRuntimeInfo().IsServer)
    {
        local_18 = SoftPrefab.ToSoftObjectPath().TryLoad();
        if (local_18 == nullptr)
        {
            XError(ELog(0), FString().Append("Failed to SpawnCollectItem,  Prefab not Valid"));
            return;
        }
        PropEntity = ECS::RequestEntityByPrefabDeferred(SoftPrefab.Get(), Location, Rotation, EPrefabCollisionAlignment(2), EECSRegType(0), false);
    }
    return;
}
UFUNCTION()
void RemoveInventoryItem(const FECSEntityAdapter &inout Entity, const FItemTableRowRef &inout Item, const int number = 1)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        InventoryUtils::RemoveInventoryItem(Entity.opImplConv(), TDataObjectPtr<FItemConfig>(), number);
    }
    return;
}
UFUNCTION()
void ConsumeInventoryItem(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FItemConfig> &inout Item, const int number = 1)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        InventoryUtils::RemoveInventoryItem(Entity.opImplConv(), Item, number);
    }
    return;
}
UFUNCTION()
void RemoveItemDrop(const FECSEntityAdapter &inout Entity, const EDropTriggerType TriggerType, const TDataObjectPtr<FDropItemConfig> &inout DropItem)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        Modify local_6;
        if (local_6.opCall())
        {
        }
    }
    return;
}
UFUNCTION()
void SpawnProp(const FECSEntityAdapter &inout Entity, const TSoftClassPtr<APropPrefab> &inout SoftPrefab, const FVector &inout Location, const FRotator &inout Rotation, FECSEntity &out PropEntity, const bool bSpawnOnGround = false, const float32 SpawnOnGroundMaxTraceDownDist = 1000.f, const float32 SpawnOnGroundHeightFromGround = 50.f)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
UFUNCTION()
void SpawnPropNew(const FECSEntityAdapter &inout Entity, const TSoftClassPtr<APropPrefabBase> &inout SoftPrefab, const FVector &inout Location, const FRotator &inout Rotation, FECSEntity &out PropEntity, const bool bSpawnOnGround = false, const float32 SpawnOnGroundMaxTraceDownDist = 1000.f, const float32 SpawnOnGroundHeightFromGround = 50.f)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
UFUNCTION()
FECSEntity GetCharacterRegionEntity(const FECSEntity &inout CharacterEntity)
{
    return FWeatherUtils::GetCharacterRegionEntity(CharacterEntity);
}
UFUNCTION()
FName GetWeatherNameFormRegionVolume(const AECSRegionVolume RegionVolume = nullptr)
{
    return FWeatherUtils::GetWeatherNameFromRegionVolume(RegionVolume);
}
UFUNCTION()
FName GetWeatherNameFormRegionEntity(const FECSEntity &inout RegionEntity)
{
    return FWeatherUtils::GetWeatherNameFromRegionEntity(RegionEntity);
}
UFUNCTION()
void OverrideRegionWeatherByVolume(const TDataObjectPtr<FWeatherConfig> &inout WeatherConfig, const AECSRegionVolume RegionVolume = nullptr, const float32 Duration = -1.f, const float32 ArtWeatherBlendTime = -1.f)
{
    FWeatherUtils::OverrideRegionVolumeWeather(WeatherConfig, RegionVolume, Duration, ArtWeatherBlendTime);
    return;
}
UFUNCTION()
void OverrideRegionWeatherByRegionEntity(const TDataObjectPtr<FWeatherConfig> &inout WeatherConfig, const FECSEntity &inout RegionEntity, const float32 Duration = -1.f, const float32 ArtWeatherBlendTime = -1.f)
{
    FWeatherUtils::OverrideRegionWeatherByRegionEntity(RegionEntity, WeatherConfig, Duration, ArtWeatherBlendTime);
    return;
}
UFUNCTION()
void RestoreRegionWeatherOverrideByVolume(const AECSRegionVolume RegionVolume = nullptr)
{
    FWeatherUtils::RestoreRegionWeatherOverrideByVolume(RegionVolume);
    return;
}
UFUNCTION()
void RestoreRegionWeatherOverrideByRegionEntity(const FECSEntity &inout RegionEntity)
{
    FWeatherUtils::RestoreRegionWeatherOverrideByRegionEntity(RegionEntity);
    return;
}
UFUNCTION()
void OverrideRegionWeatherTemplateByVolume(const TDataObjectPtr<FWeatherGenerateTemplate> &inout WeatherGenerateTemplate, const AECSRegionVolume RegionVolume = nullptr)
{
    FWeatherUtils::OverrideRegionWeatherTemplateByVolume(WeatherGenerateTemplate, RegionVolume);
    return;
}
UFUNCTION()
void OverrideRegionWeatherTemplateByRegionEntity(const TDataObjectPtr<FWeatherGenerateTemplate> &inout WeatherGenerateTemplate, const FECSEntity &inout RegionEntity)
{
    FWeatherUtils::OverrideRegionWeatherTemplateByRegionEntity(WeatherGenerateTemplate, RegionEntity);
    return;
}
UFUNCTION()
void RestoreRegionWeatherTemplateByVolume(const AECSRegionVolume RegionVolume = nullptr)
{
    FWeatherUtils::RestoreRegionWeatherTemplateByVolume(RegionVolume);
    return;
}
UFUNCTION()
void RestoreRegionWeatherTemplateByRegionEntity(const FECSEntity &inout RegionEntity)
{
    FWeatherUtils::RestoreRegionWeatherTemplateByRegionEntity(RegionEntity);
    return;
}
UFUNCTION()
void SetWeatherPausedByVolume(const AECSRegionVolume RegionVolume, const bool bPaused)
{
    FECSEntity local_4 = FWeatherUtils::GetWeatherRegionEntity(RegionVolume);
    if ((!((local_4 == ENTITY_NULL))))
    {
        FWeatherUtils::SetWeatherPausedByRegionEntity(local_4, bPaused);
    }
    return;
}
UFUNCTION()
void GetRandomPositionAroundEntity(const FECSEntityAdapter &inout Entity, const float32 MinRadius, const float32 MaxRadius, const float32 MinHeight, const float32 MaxHeight, FVector &out RandomPosition)
{
    FVector local_6;
    RandomPosition = local_6;
    Get local_10;
    FVector local_16 = local_10.opCall().GetPosition();
    FVector2D local_20 = (BlueprintFunctions_Ability::RandomDirection2D() * (BlueprintFunctions_Ability::RandomRange(MinRadius, MaxRadius)));
    float local_34 = BlueprintFunctions_Ability::RandomRange(MinHeight, MaxHeight);
    RandomPosition = (local_16 + FVector(local_20.X, local_20.Y, local_34));
    return;
}
UFUNCTION()
void GetRandomPositionAroundEntityBox(const FECSEntityAdapter &inout Entity, const float32 MinX, const float32 MaxX, const float32 MinY, const float32 MaxY, const float32 MinZ, const float32 MaxZ, FVector &out RandomPosition)
{
    FVector local_6;
    RandomPosition = local_6;
    Get local_10;
    FVector local_16 = local_10.opCall().GetPosition();
    float local_18 = BlueprintFunctions_Ability::RandomRange(MinX, MaxX);
    float local_24 = BlueprintFunctions_Ability::RandomRange(MinY, MaxY);
    float local_26 = BlueprintFunctions_Ability::RandomRange(MinZ, MaxZ);
    RandomPosition = (local_16 + FVector(local_18, local_24, local_26));
    return;
}
UFUNCTION()
void GetTargetDirectionXYBySelfForward(const FECSEntityAdapter &inout SelfEntity, const FECSEntity &inout TargetEntity, float &out Angle)
{
    Get local_12;
    Angle = 0.0;
    Get local_30;
    Angle = FMath::RadiansToDegrees(FQuat(local_12.opCall().GetRotation()).AngularDistance((FVector(local_30.opCall().GetPosition()) - FVector(local_12.opCall().GetPosition())).VectorPlaneProject(FVector::UpVector).ToOrientationQuat()));
    return;
}
UFUNCTION()
void GetTargetDirectionXYBySelfForwardBearing(const FECSEntityAdapter &inout SelfEntity, const FECSEntity &inout TargetEntity, float &out BearingAngle)
{
    BearingAngle = 0.0;
    Get local_12;
    FVector local_8 = local_12.opCall().GetPosition();
    FQuat local_20 = local_12.opCall().GetRotation();
    Get local_30;
    FVector local_42 = (FVector(local_30.opCall().GetPosition()) - local_8).VectorPlaneProject(FVector::UpVector).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    float local_64 = (local_20.GetRightVector().VectorPlaneProject(FVector::UpVector).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)).DotProduct(local_42);
    BearingAngle = FMath::RadiansToDegrees(FMath::Atan2(local_64, (local_20.GetForwardVector().VectorPlaneProject(FVector::UpVector).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)).DotProduct(local_42)));
    if (BearingAngle < 0.0)
    {
        BearingAngle = (BearingAngle + 360.0);
    }
    return;
}
UFUNCTION()
void IsOnWater(const FECSEntityAdapter &inout Entity, bool &out IsOnWater)
{
    IsOnWater = false;
    IsOnWater = PhysicalMaterialUtils::IsStandOnWater(Entity.opImplConv());
    return;
}
UFUNCTION()
void OverrideMaterial(const FECSEntityAdapter &inout Entity, const FName &inout RequestName, const TArray<FSingleMaterialParamRequestData> &inout ChangeMaterialParam)
{
    FMaterialUtils::SyncRequestChangeMaterialParam(Entity.opImplConv(), RequestName, ChangeMaterialParam);
    return;
}
UFUNCTION()
void RemoveOverrideMaterial(const FECSEntityAdapter &inout Entity, const FName &inout RequestName, const FSoftObjectPath &inout BlendOutCurvePath, const float32 BlendOutTime = 0.2)
{
    FMaterialUtils::SyncRemoveChangeMaterialRequest(Entity.opImplConv(), RequestName, BlendOutTime, BlendOutCurvePath);
    return;
}
UFUNCTION()
void SetEntityDither(const FECSEntityAdapter &inout Entity, const FName &inout RequestName, const bool IsDithered = true, const float32 BlendDuration = 1.0f, const bool bIncludeAttachEntity = true)
{
    if (IsDithered)
    {
        FDitherEffectUtils::RequestDitherEffect(Entity.opImplConv(), RequestName, BlendDuration, bIncludeAttachEntity);
        return;
    }
    FDitherEffectUtils::RemoveDitherEffect(Entity.opImplConv(), RequestName, BlendDuration);
    return;
}
UFUNCTION()
FECSEntity GetWeaponEntity(const FECSEntityAdapter &inout OwnerEntity)
{
    Get local_4;
    const FC_CharacterWeapon& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.GetCurrentWeaponEntity();
    }
    return ENTITY_NULL;
}
UFUNCTION()
void SetWeaponVisibility(const FECSEntityAdapter &inout OwnerEntity, const bool Enable)
{
    Modify local_4;
    FC_CharacterWeapon& local_6 = local_4.opCall();
    if (local_6)
    {
        if (Enable)
        {
            local_6.SetHideWeaponCounter(int8((local_6.GetHideWeaponCounter() - 1)));
            return;
        }
        local_6.SetHideWeaponCounter(int8((local_6.GetHideWeaponCounter() + 1)));
    }
    return;
}
UFUNCTION()
void AddTeamLinkEnergy(const FECSEntityAdapter &inout Entity, const float32 AddLinkEnergy)
{
    return;
}
UFUNCTION()
float32 GetTeamLinkEnergy(const FECSEntityAdapter &inout Entity)
{
    return 0.0f;
}
void PlayTauntHintFX(const FECSEntityAdapter &inout TauntPlayerEntity, const FECSEntityAdapter &inout BossEntity)
{
    if (!(TauntPlayerEntity.IsValid()) || !(BossEntity.IsValid()))
    {
        return;
    }
    if ((int(FASCommonUtils::GetMonsterRank(BossEntity.opImplConv()))) != 2)
    {
        return;
    }
    UWorld local_12 = ECS::GetUEWorld();
    if (local_12 == nullptr)
    {
        return;
    }
    FBuffConfigRef local_38;
    US_AITargetingSystem local_42 = Cast<US_AITargetingSystem>(AECSGameManagerActor::GetSystem(local_12, US_AITargetingSystem));
    if (local_42 != nullptr)
    {
        if (local_42.TargetingHintBuffRef.IsValid())
        {
            local_38 = local_42.TargetingHintBuffRef;
        }
    }
    if (!(local_38.IsValid()))
    {
        return;
    }
    FBuffUtils::AddBuff(BossEntity.opImplConv(), local_38, BossEntity.GetWorld().GetFixedTime().Time, TauntPlayerEntity.opImplConv(), false, -1.0f, 1, false);
    return;
}
UFUNCTION()
bool RangeTaunt(const FECSEntityAdapter &inout TauntEntity, const float32 DurationTimeSeconds, const FVector &inout Center, const float32 Radius, const EFaction FactionID, const FBuffConfigRef &inout TauntBuff, const bool bShowFX)
{
    int local_164 = 0;
    Get local_174;
    int local_190 = 0;
    bool local_1 = false;
    FECSEntity local_14 = FAITargetingUtils::GetPlayerController(TauntEntity.opImplConv());
    bool local_2 = ECS::GetRuntimeInfo().IsServer;
    if (local_2)
    {
        FECSRuntimeQuery local_56 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(TauntEntity.opImplConv(), Center, Radius, EECSQueryRegsitryType(3), false);
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Exclude(local_56).opCall();
        local_56.FilterByFaction(EFaction(FactionID), uint8(2));
        if (local_56.GetAllEntities().Num() > 0)
        {
            local_1 = true;
            FECSRuntimeQueryIterator local_138 = local_56.Iterator();
            for (; local_138.CanProceed;)
            {
                const FECSEntity& local_162 = local_138.Proceed();
                local_164.SetFromEntity(local_14);
                FECSWorldPtr local_170 = TauntEntity.GetWorld();
                local_164.SetTauntStartTime(local_174.opCall().Time);
                FECSWorldPtr local_170_2 = TauntEntity.GetWorld();
                local_164.SetTauntEndTime((FFPTime(local_174.opCall().Time) + FFPTime(DurationTimeSeconds)));
                local_164.SetbShowArrow(bShowFX);
                BlueprintFunctions_Common::PlayTauntHintFX(TauntEntity, FECSEntityAdapter(local_162));
            }
            local_190.SetTauntNum(local_56.GetAllEntities().Num());
            FECSWorldPtr local_170_3 = TauntEntity.GetWorld();
            local_190.SetTauntStartTime(local_174.opCall().Time);
            FECSWorldPtr local_170_4 = TauntEntity.GetWorld();
            local_190.SetTauntEndTime((FFPTime(local_174.opCall().Time) + FFPTime(DurationTimeSeconds)));
            if (TauntBuff.IsValid())
            {
                FECSEntity local_10 = TauntEntity.opImplConv();
                FECSWorldPtr local_170_5 = TauntEntity.GetWorld();
                FBuffUtils::AddBuff(TauntEntity.opImplConv(), TauntBuff, local_174.opCall().Time, local_10, false, DurationTimeSeconds, 1, false);
            }
        }
    }
    return local_1;
}
UFUNCTION()
bool SingleTaunt(const FECSEntityAdapter &inout TauntEntity, const FECSEntityAdapter &inout TargetEntity, const float32 DurationTimeSeconds, const FBuffConfigRef &inout TauntBuff, const bool bShowFX)
{
    Has local_4;
    int local_20 = 0;
    int local_40 = 0;
    if (local_4.opCall())
    {
        return false;
    }
    local_20.SetFromEntity(FAITargetingUtils::GetPlayerController(TauntEntity.opImplConv()));
    FECSWorldPtr local_26 = TauntEntity.GetWorld();
    Get local_30;
    local_20.SetTauntStartTime(local_30.opCall().Time);
    FECSWorldPtr local_26_2 = TauntEntity.GetWorld();
    local_20.SetTauntEndTime((FFPTime(local_30.opCall().Time) + FFPTime(DurationTimeSeconds)));
    local_20.SetbShowArrow(bShowFX);
    local_40.SetTauntNum(1);
    FECSWorldPtr local_26_3 = TauntEntity.GetWorld();
    local_40.SetTauntStartTime(local_30.opCall().Time);
    FECSWorldPtr local_26_4 = TauntEntity.GetWorld();
    local_40.SetTauntEndTime((FFPTime(local_30.opCall().Time) + FFPTime(DurationTimeSeconds)));
    if (TauntBuff.IsValid())
    {
        FECSEntity local_14 = TauntEntity.opImplConv();
        FECSWorldPtr local_26_5 = TauntEntity.GetWorld();
        FBuffUtils::AddBuff(TauntEntity.opImplConv(), TauntBuff, local_30.opCall().Time, local_14, false, DurationTimeSeconds, 1, false);
    }
    if (ECS::GetRuntimeInfo().IsServer)
    {
        BlueprintFunctions_Common::PlayTauntHintFX(TauntEntity, TargetEntity);
    }
    return true;
}
UFUNCTION()
bool RemoveEntityAllBeTaunted(const FECSEntityAdapter &inout BeTauntedEntity)
{
    Get local_4;
    if (local_4.opCall())
    {
        Remove local_12;
        local_12.opCall();
        return true;
    }
    return false;
}
UFUNCTION()
void AddHostilityInRange(const FECSEntityAdapter &inout TargetEntity, const FVector &inout Center, const float32 Radius, const float32 Increment)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        int local_97;
        FECSRuntimeQuery local_48 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(TargetEntity.opImplConv(), Center, Radius, EECSQueryRegsitryType(3), false);
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Get local_102;
        local_97 = int(local_102.opCall().GetFactionId());
        local_48.FilterByFaction(EFaction(local_97), uint8(2));
        FECSRuntimeQueryIterator local_126 = local_48.Iterator();
        for (; local_126.CanProceed;)
        {
            const FECSEntity& local_150 = local_126.Proceed();
            FTargetEntity local_152 = FTargetEntity(TargetEntity.opImplConv());
            FAITargetingUtils::AddHostility(local_150, local_152, Increment);
        }
    }
    return;
}
UFUNCTION()
void GetBodypartStatus(const FECSEntityAdapter &inout Entity, const FName &inout BodypartKey, bool &out IsBroken)
{
    IsBroken = false;
    Modify local_6;
    FC_BodyParts& local_8 = local_6.opCall();
    if (local_8)
    {
        if (!(local_8.GetBodyPartDatas()[BodypartKey].GetbCanDestroy()))
        {
            IsBroken = true;
        }
    }
    return;
}
UFUNCTION()
void SpawnMonster(const TSoftClassPtr<AMonsterPrefab> &inout SoftPrefab, const FVector &inout Location, const FRotator &inout Rotation, FECSEntity &out MonsterEntity)
{
    UObject local_18;
    FECSEntity local_4;
    MonsterEntity = local_4;
    if (ECS::GetRuntimeInfo().IsServer)
    {
        local_18 = SoftPrefab.ToSoftObjectPath().TryLoad();
        if (local_18 == nullptr)
        {
            XError(ELog(0), FString().Append("Failed to SpawnMonster,  Prefab not Valid"));
            return;
        }
        MonsterEntity = ECS::RequestEntityByPrefabDeferred(SoftPrefab.Get(), Location, Rotation, EPrefabCollisionAlignment(2), EECSRegType(0), false);
    }
    return;
}
UFUNCTION()
EMonsterRank GetMonsterRank(const FECSEntityAdapter &inout Entity)
{
    return FASCommonUtils::GetMonsterRank(Entity.opImplConv());
}
UFUNCTION()
void ShowSkillCastHint(const bool bEnable, const UInputAction CastAction, const FText &inout OverrideText)
{
    if (bEnable)
    {
        FVMS_CommonBottomActionList::Get(UEASAbility::GetContextAbility().GetWorld()).AddAction(FInputActionListConstructParamItem(FEUIInputAction(CastAction), OverrideText));
        return;
    }
    FVMS_CommonBottomActionList::Get(UEASAbility::GetContextAbility().GetWorld()).RemoveAction(FEUIInputAction(CastAction));
    return;
}
UFUNCTION()
void OverrideSightConfig(const FECSEntityAdapter &inout Entity, const FName &inout OverrideSightConfigKey)
{
    FAIKnowledgeUtils::OverrideSightConfig(Entity.opImplConv(), OverrideSightConfigKey);
    return;
}
UFUNCTION()
void ClearOverrideSightConfig(const FECSEntityAdapter &inout Entity)
{
    FAIKnowledgeUtils::ClearOverrideSightConfig(Entity.opImplConv());
    return;
}
UFUNCTION()
void OverrideAlertConfig(const FECSEntityAdapter &inout Entity, const FName &inout OverrideAlertConfigKey)
{
    FAIKnowledgeUtils::OverrideAlertConfig(Entity.opImplConv(), OverrideAlertConfigKey);
    return;
}
UFUNCTION()
void ClearOverrideAlertConfig(const FECSEntityAdapter &inout Entity)
{
    FAIKnowledgeUtils::ClearOverrideAlertConfig(Entity.opImplConv());
    return;
}
UFUNCTION()
void SpawnEnergyBall(const FECSEntityAdapter &inout Entity, const TSoftClassPtr<AEnergyBallPrefab> &inout SoftPrefab, const FVector &inout Location, const int SpawnNum = 1, const EEnergyBallSpawnDirection SpawnDirection = EEnergyBallSpawnDirection::LeftThenRight)
{
    UObject local_12 = SoftPrefab.ToSoftObjectPath().TryLoad();
    if (local_12 == nullptr)
    {
        XError(ELog(0), FString().Append("Failed to SpawnEnergyBall,  Prefab not Valid"));
        return;
    }
    EnergyBallUtils::SpawnEnergyBallByPrefab(Entity.opImplConv(), SoftPrefab.Get(), BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()), Location, SpawnNum);
    return;
}
UFUNCTION()
void SpawnEnergyBallInSphere(const FECSEntityAdapter &inout Entity, const TSoftClassPtr<AEnergyBallPrefab> &inout SoftPrefab, const float32 Radius, const int SpawnNum = 1, const EEnergyBallSpawnDirection SpawnDirection = EEnergyBallSpawnDirection::LeftThenRight)
{
    UObject local_12 = SoftPrefab.ToSoftObjectPath().TryLoad();
    if (local_12 == nullptr)
    {
        XError(ELog(0), FString().Append("Failed to SpawnEnergyBallInSphere,  Prefab not Valid"));
        return;
    }
    EnergyBallUtils::SpawnEnergyBallInSphere(Entity.opImplConv(), SoftPrefab.Get(), BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()), Radius, SpawnNum);
    return;
}
UFUNCTION()
void PlayCameraPostProcessAnim(const FECSEntityAdapter &inout Entity, const FECSEntity &inout AttachEntity, const bool bUpdateAttach, const UCameraPostProcessAnimConfig AnimConfig, const float32 Duration = 4.f, const FName &inout AttachSocketName = NAME_None, const FVector &inout AttachOffset = FVector::ZeroVector)
{
    PostProcessUtils::PlayCameraPostProcessAnim(Entity.opImplConv(), AttachEntity, bUpdateAttach, AnimConfig, Duration, AttachSocketName, AttachOffset);
    return;
}
UFUNCTION()
void StopCameraPostProcessAnim(const FECSEntityAdapter &inout Entity, const UCameraPostProcessAnimConfig AnimConfig)
{
    PostProcessUtils::StopCameraPostProcessAnim(Entity.opImplConv(), AnimConfig);
    return;
}
UFUNCTION()
void PlayCameraPostProcessRadius(const FECSEntityAdapter &inout Entity, const float32 Radius, const FFactionRelationMask &inout RelationMask, const bool bUpdateAttach, const UCameraPostProcessAnimConfig AnimConfig, const float32 Duration = 4.f, const FName &inout AttachSocketName = NAME_None, const FVector &inout AttachOffset = FVector::ZeroVector)
{
    PostProcessUtils::PlayCameraPostProcessRadius(Entity.opImplConv(), Radius, int(RelationMask.Relation), bUpdateAttach, AnimConfig, Duration, AttachSocketName, AttachOffset);
    return;
}
UFUNCTION()
void Level_AddCameraOverride(const FECSEntity &inout PlayerEntity, const FECSEntity &inout LookAtTargetEntity, const FVector &inout LookAtTargetOffset, const FName &inout LookAtTargetSocketName, const TDataObjectPtr<FCameraLookAtTargetConfig> &inout LookAtConfig, const TDataObjectPtr<FTPCameraStateConfig> &inout CameraState)
{
    ECameraOverrideLayer local_8;
    if (!(FASCommonUtils::GetUniquePlayerEntity(PlayerEntity).IsValid()))
    {
        return;
    }
    GetDefaulted local_14;
    local_14.opCall().GetCameraViewTargetEntity();
    if (!(local_8.IsValid()))
    {
        return;
    }
    return;
}
UFUNCTION()
void Level_RemoveCameraOverride(const FECSEntity &inout PlayerEntity)
{
    if (!(FASCommonUtils::GetUniquePlayerEntity(PlayerEntity).IsValid()))
    {
        return;
    }
    GetDefaulted local_14;
    FECSEntity local_8 = local_14.opCall().GetCameraViewTargetEntity();
    if (!(local_8.IsValid()))
    {
        return;
    }
    FCameraOverrideUtils::RemoveSyncCameraOverrideLayer(local_8, ECameraOverrideLayer(5));
    return;
}
UFUNCTION()
void Level_AddOverrideSceneCameraInfo(const FECSEntity &inout PlayerEntity, const FVector &inout Position, const FRotator &inout Rotation, const float32 FOV, const float32 FadeInDuration, const ECameraBlend FadeInType, const float32 FadeOutDuration, const ECameraBlend FadeOutType)
{
    if (!(FASCommonUtils::GetUniquePlayerEntity(PlayerEntity).IsValid()))
    {
        return;
    }
    GetDefaulted local_14;
    if (!(local_14.opCall().GetCameraViewTargetEntity().IsValid()))
    {
        return;
    }
    FCameraOverrideParam local_106;
    local_106.SetUseOverrideCameraData(true);
    local_106.SetLayer(ECameraOverrideLayer(5));
    local_106.GetOverrideCamera().SetPosition(Position);
    local_106.GetOverrideCamera().SetRotation(Rotation);
    local_106.GetOverrideCamera().SetFOV(FOV);
    local_106.GetOverrideCamera().SetFadeInDuration(FadeInDuration);
    local_106.GetOverrideCamera().SetFadeInType();
    local_106.GetOverrideCamera().SetFadeOutDuration(FadeOutDuration);
    local_106.GetOverrideCamera().SetFadeOutType();
    local_106.GetOverrideCamera().SetDataID(BlueprintFunctions_Common::GetWorldTime(PlayerEntity).GetTicks());
    FCameraOverrideUtils::AddSyncCameraOverrideLayer(PlayerEntity, local_106);
    return;
}
FECSEntity ResolvePlayerBGMTargetEntity(const FECSEntityAdapter &inout Entity)
{
    FECSEntity local_4 = Entity.opImplConv();
    Has local_12;
    bool local_13 = local_12.opCall();
    if (local_13)
    {
        Get local_18;
        local_4 = local_18.opCall().GetPlayerPawnEntity();
    }
    return local_4;
}
UFUNCTION()
void SoundSetStateByConfig(const FECSEntityAdapter &inout Entity, const TSoftObjectPtr<UAkStateValue> &inout StateValue, const float32 SpreadDistance = -1)
{
    int local_56 = 0;
    XLog(ELog(0), FString().Append("[SoundSetStateByConfig] Enter, Entity:").Append(Entity.ToString()).Append(", StateValue:").Append(StateValue.ToString()).Append(", StateAsset:").Append(StateValue.GetAssetName()).Append(", SpreadDistance:").Append(SpreadDistance).Append(", IsClient:").Append(ECS::GetRuntimeInfo().IsClient).Append(", IsServer:").Append(ECS::GetRuntimeInfo().IsServer));
    if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
    {
        Print(FString().Append("[SoundSetStateByConfig] Called... Entity:").Append(Entity.ToString()).Append(", StateValue:").Append(StateValue.GetAssetName()).Append(", SpreadDistance:").Append(SpreadDistance), 99999.0f, FLinearColor::LucBlue);
    }
    XLog(ELog(0), FString().Append("Ability_SFX::SoundSetStateByConfig, StateValue is ").Append(StateValue.GetAssetName()).Append("."));
    if (StateValue.IsNull())
    {
        if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
        {
            Print(FString().Append("Ability_SFX::SoundSetStateByConfig, StateValue is null."), 99999.0f, FLinearColor::LucBlue);
        }
        XLog(ELog(0), "Ability_SFX::SoundSetStateByConfig, StateValue is null.");
        return;
    }
    if (!(Entity.IsValid()))
    {
        if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
        {
            Print(FString().Append("Entity is not valid, Please check Entity pin on the Ability_SFX::SoundSetStateByConfig Node."), 99999.0f, FLinearColor::LucBlue);
        }
        XLog(ELog(0), "Entity is not valid, Please check Entity pin on the Ability_SFX::SoundSetStateByConfig Node.");
        return;
    }
    if (SpreadDistance < 0.0f)
    {
        FECSEntity local_28 = BlueprintFunctions_Common::ResolvePlayerBGMTargetEntity(Entity);
        XLog(ELog(0), FString().Append("[SoundSetStateByConfig] Direct target resolved, SourceEntity:").Append(Entity.ToString()).Append(", ActualEntity:").Append(local_28.ToString()).Append(", StateAsset:").Append(StateValue.GetAssetName()));
        if (!(local_28.IsValid()))
        {
            XLog(ELog(0), "Resolved entity is not valid, Please check Entity pin on the Ability_SFX::SoundSetStateByConfig Node.");
            return;
        }
        local_56.SetState(StateValue);
        XLog(ELog(0), FString().Append("[SoundSetStateByConfig] Assigned FC_PlayerBgmToPending, Entity:").Append(local_28.ToString()).Append(", StateAsset:").Append(StateValue.GetAssetName()).Append(", SpreadDistance:").Append(SpreadDistance));
        if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
        {
            Print(FString().Append("[SoundSetStateByConfig] Entity(").Append(local_28.ToString()).Append(") Set State(").Append(StateValue.GetAssetName()).Append(") to FC_PlayerBGMState, SpreadDistance ").Append(SpreadDistance), 99999.0f, FLinearColor::LucBlue);
        }
        return;
    }
    Has local_60;
    if (!(local_60.opCall()))
    {
        XLog(ELog(0), FString().Append("[SoundSetStateByConfig] Range target has no FC_Transform, Entity:").Append(Entity.ToString()).Append(", StateAsset:").Append(StateValue.GetAssetName()).Append(", SpreadDistance:").Append(SpreadDistance));
        return;
    }
    Get local_64;
    FECSRuntimeQuery local_108 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(Entity.opImplConv(), local_64.opCall().GetPosition(), SpreadDistance, EECSQueryRegsitryType(3), false);
    Include local_152;
    local_152.opCall();
    Include local_156;
    local_156.opCall();
    int local_157 = 0;
    FECSRuntimeQueryIterator local_180 = local_108.Iterator();
    for (; local_180.CanProceed;)
    {
        const FECSEntity& local_204 = local_180.Proceed();
        if (!(local_204))
        {
            return;
        }
        local_56.SetState(StateValue);
        ++local_157;
        XLog(ELog(0), FString().Append("[SoundSetStateByConfig] Assigned ranged FC_PlayerBgmToPending, PawnEntity:").Append(local_204.ToString()).Append(", StateAsset:").Append(StateValue.GetAssetName()).Append(", SpreadDistance:").Append(SpreadDistance));
        if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
        {
            Print(FString().Append("[SoundSetStateByConfig] PawnEntity(").Append(local_204.ToString()).Append(") Set State(").Append(StateValue.GetAssetName()).Append(") to FC_PlayerCurrentBGMState, SpreadDistance").Append(SpreadDistance), 99999.0f, FLinearColor::LucBlue);
        }
    }
    XLog(ELog(0), FString().Append("[SoundSetStateByConfig] Range assign finished, SourceEntity:").Append(Entity.ToString()).Append(", StateAsset:").Append(StateValue.GetAssetName()).Append(", AssignedCount:").Append(local_157).Append(", SpreadDistance:").Append(SpreadDistance));
    return;
}
UFUNCTION()
void SoundSetStateByName(const FECSEntityAdapter &inout Entity, const FName &inout StateResourceName)
{
    int local_64 = 0;
    if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
    {
        Print(FString().Append("[SoundSetStateByName] Called... Entity:").Append(Entity.ToString()).Append(", StateResourceName:").Append(StateResourceName), 99999.0f, FLinearColor::LucBlue);
    }
    if (!(Entity.IsValid()))
    {
        XWarning(ELog(0), "Entity is not valid, Please check Entity pin on the Ability_SFX::SoundSetStateByName Node.");
        return;
    }
    FGameAudioUtils::GetAudioSoftObjectPathFromStateAssetName(StateResourceName);
    FECSEntity local_36 = BlueprintFunctions_Common::ResolvePlayerBGMTargetEntity(Entity);
    if (!(local_36.IsValid()))
    {
        XWarning(ELog(0), "Resolved entity is not valid, Please check Entity pin on the Ability_SFX::SoundSetStateByName Node.");
        return;
    }
    local_64.SetState(TSoftObjectPtr<UAkStateValue>());
    if (FAsGameAudioUtils::CVar_EnvSound_EnableDebug.GetBool())
    {
        Print(FString().Append("[SoundSetStateByName] Entity(").Append(local_36.ToString()).Append(") Set State ").Append(StateResourceName).Append(" to FC_PlayerBGMState}"), 99999.0f, FLinearColor::LucBlue);
    }
    return;
}
UFUNCTION()
void PlayAudioVoOnlyPresentation(const FECSEntityAdapter &inout Entity, const FDataTableRowHandle &inout VoRowName)
{
    if (FAudioVoUtils::CVar_AudioVoDebugAbility.GetBool())
    {
        Print(FString().Append("[PlayAudioVo] Called... Entity:").Append(Entity.ToString()).Append(", VoRowName:").Append(VoRowName.RowName).Append(","), 99999.0f, FLinearColor::LucBlue);
    }
    if (VoRowName.RowName.IsNone())
    {
        if (FAudioVoUtils::CVar_AudioVoDebugAbility.GetBool())
        {
            Print(FString().Append("Ability_Vo::PlayAudioVo, VoRowName is None."), 99999.0f, FLinearColor::LucBlue);
        }
        XWarning(ELog(0), "Ability_Vo::PlayAudioVo, VoRowName is None.");
        return;
    }
    FFPTime local_14 = FFPTime(-1);
    Entity;
    return;
}
UFUNCTION()
void PlayAudioVoWithSync(const FECSEntityAdapter &inout Entity, const FDataTableRowHandle &inout VoRowName, const bool bRandomTeamatePlayVo = false)
{
    if (FAudioVoUtils::CVar_AudioVoDebugAbility.GetBool())
    {
        Print(FString().Append("[PlayAudioVo] Called... Entity:").Append(Entity.ToString()).Append(", VoRowName:").Append(VoRowName.RowName).Append(","), 99999.0f, FLinearColor::LucBlue);
    }
    if (VoRowName.RowName.IsNone())
    {
        if (FAudioVoUtils::CVar_AudioVoDebugAbility.GetBool())
        {
            Print(FString().Append("Ability_Vo::PlayAudioVo, VoRowName is None."), 99999.0f, FLinearColor::LucBlue);
        }
        XWarning(ELog(0), "Ability_Vo::PlayAudioVo, VoRowName is None.");
        return;
    }
    FECSWorldPtr local_16 = Entity.GetWorld();
    Get local_20;
    FFPTime local_14 = FFPTime(local_20.opCall().Time);
    FECSEntity local_24 = FECSEntity(ENTITY_NULL);
    if (bRandomTeamatePlayVo)
    {
        local_24 = FAudioVoUtils::GetDeterministicRandomTeamate(Entity.opImplConv(), local_14);
    }
    if (!(local_24.IsValid()))
    {
        local_24 = Entity.opImplConv();
    }
    FAudioVoUtils::SendAudioVoEventBySync(VoRowName.RowName, local_24, local_14);
    return;
}
UFUNCTION()
void SetMinimapIconVisibility(const FECSEntityAdapter &inout Target, const EEntityMinimapIconVisibility Visibility, const TArray<FECSEntity> &inout SpecifiedVisiblePlayers, const EEntityMinimapIconSource IconSource = EEntityMinimapIconSource::Config)
{
    int local_21 = 0;
    Has local_6;
    if (!(Target.IsValid()) || !(local_6.opCall()))
    {
        XWarning(ELog(16), FString().Append("Failed to set minimap icon visibility for target entity ").Append(Target.ToString()).Append(", it is not valid or does not have FC_LevelSpot component"));
        return;
    }
    if (int(IconSource) == 4)
    {
        XWarning(ELog(16), FString().Append("Using deprecated function SetMinimapIconVisibility to set spot config visiblilty to ").Append(Visibility));
        local_21 = 5;
    }
    else
    {
        local_21 = 4;
    }
    switch (int(Visibility))
    {
    case 1:
    {
        EntityLevelSpotUtils::ChangeSpotDataViewers(Target.opImplConv(), FLevelSpotViewers::AllViewers);
        return;
    }
    case 2:
    {
        ELevelSpotDataSource local_48;
        EntityLevelSpotUtils::ChangeSpotDataViewers(Target.opImplConv(), local_48);
        return;
    }
    case 3:
    {
        XError(ELog(0), "SameWithEntityNetRelevance is no longer supported");
        return;
    }
    case 0:
    {
        EntityLevelSpotUtils::ChangeSpotDataViewers(Target.opImplConv(), FLevelSpotViewers::NoViewer);
        return;
    }
    }
    return;
}
UFUNCTION()
void AddMinimapIcon(const FECSEntityAdapter &inout Target, const FEntityMinimapIconSettingsRowRef &inout IconSettings, const EEntityMinimapIconVisibility Visibility, const TArray<FECSEntity> &inout SpecifiedVisiblePlayers)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
UFUNCTION()
void RemoveMinimapIcon(const FECSEntityAdapter &inout Target)
{
    Has local_6;
    if (!(Target.IsValid()) || !(local_6.opCall()))
    {
        return;
    }
    ELevelSpotDataSource local_138;
    EntityLevelSpotUtils::GetSpotData(Target.opImplConv(), local_138);
    if (local_138)
    {
        local_138.SetMinimapIconDisplaySettings(TDataObjectPtr<FMinimapIconConfig>(nullptr));
        FECSEntity local_12 = Target.opImplConv();
    }
    return;
}
TArray<FECSEntity> GetAllPlayerEntitiesInRangeAS(const FVector &inout Location, const float32 Range, const bool bIncludeBackGround = true)
{
    TArray<FECSEntity> local_4;
    BlueprintFunctions_Level::GetAllPlayerEntitiesInRange(local_4, Location, Range, bIncludeBackGround);
    return TArray<FECSEntity>();
}
UFUNCTION()
void SetCurrentTimeOfDayInHours(const float32 TimeOfDayHours)
{
    FTimeOfDayUtils::SetCurrentTimeOfDayInHours(TimeOfDayHours);
    return;
}
UFUNCTION()
void SetTimePaused(const bool bPaused)
{
    FTimeOfDayUtils::SetTimePaused(bPaused);
    return;
}
UFUNCTION()
void ForwardTimeOfDayTo(const float32 TargetTimeOfDayHours, const float32 BlendDuration = 0.f)
{
    FTimeOfDayUtils::ForwardTimeOfDayTo(TargetTimeOfDayHours, BlendDuration);
    return;
}
void TeleportEntityToLocation(const FECSEntityAdapter &inout Entity, const FVector &inout Location, const FRotator &inout Rotation, const bool bSetCameraRotation = false, const FRotator &inout CameraRotation = FRotator::ZeroRotator, const bool bTeleportCamera = false, const bool bShowBlackScreen = true, const ELoadingScreenAction Action = ELoadingScreenAction::None, const bool bBlockInput = true)
{
    FFPTime local_6 = FFPTime(-1);
    FCE_TeleportToLocationRequest local_10;
    local_10.Location = Location;
    local_10.Rotation = Rotation;
    local_10.bSetCameraRotation = bSetCameraRotation;
    local_10.CameraRotation = CameraRotation;
    local_10.bTeleportCamera = bTeleportCamera;
    local_10.bShowBlackScreen = bShowBlackScreen;
    local_10.Action = Action;
    local_10.bBlockInput = bBlockInput;
    return;
}
UFUNCTION()
void GetInteractTargetInfo(const FECSEntityAdapter &inout Entity, float32 &out ProgressValue = 0.0f)
{
    ProgressValue = 0.0f;
    Has local_6;
    bool local_7 = local_6.opCall();
    if (local_7)
    {
        Get local_12;
        TArray<FRuntimeInteractionBehaviorStatus> local_16 = local_12.opCall().GetInteractionBehaviorStatus();
        if (local_16.Num() > 0)
        {
            ProgressValue = local_16[0].GetProgressValue();
        }
        return;
    }
    XError(ELog(0), "No InteractTarget Component!");
    return;
}
UFUNCTION()
FVector GetInteractPointPosition(const FECSEntity &inout Entity, const int InteractIndex)
{
    FVector local_6;
    int local_34 = 0;
    int local_40 = 0;
    Get local_20;
    const FC_InteractionTargetConfig& local_22 = local_20.opCall();
    if (local_22)
    {
        if (InteractIndex >= 0 && (InteractIndex < local_22.InteractionPoints.Num()))
        {
            const FInteractionPoint& local_28 = local_22.InteractionPoints[InteractIndex];
            if (local_40)
            {
                FTransform local_136 = local_34 ? local_40.ToFTransformWitScale(local_34.Scale) : local_40.ToFTransform();
                local_6 = local_136.TransformPosition(local_28.TransformOffset.GetLocation());
            }
        }
    }
    return local_6;
}
UFUNCTION()
void Level_AddESMExternalTransit(const FECSEntityAdapter &inout Entity, const FName &inout ToState, const FName &inout ToSMName = NAME_None, const FName &inout ToNotify = NAME_None, const FFPTime &inout TransitEventTime = -1, const float32 ToTimeOffset = 0, const float32 ToTimeAnchor = 0, const FName &inout Comment = NAME_None)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        FESMExternalTransitHandle local_14 = Entity.GetEntity().ESMExternalTransit(ToSMName, ToState, Comment);
        if ((!((ToNotify == NAME_None))))
        {
            local_14.SetToNotify(ToNotify, ToTimeOffset, ToTimeAnchor);
        }
    }
    return;
}
UFUNCTION()
void Level_PlayFX_Instant(const FECSEntityAdapter &inout OwnerEntity, const TSoftClassPtr<AFXActor> &inout SoftFX, const TArray<FFXOverrideParam> &inout OverrideParam, const bool IsAttached = false, const FName &inout AttachSocket = NAME_None, const EFXBaseTransformResolveModeWithAttachmentOption BaseTransformResolveMode = EFXBaseTransformResolveModeWithAttachmentOption::AccordingToAttachmentSetting, const FVector &inout LocationOrOffset = FVector(0,0,0), const EFXOffsetSpaceWithAttachmentOption LocationOffsetSpace = EFXOffsetSpaceWithAttachmentOption::AccordingToAttachmentSetting, const FRotator &inout RotationOrOffset = FRotator(0,0,0), const EFXOffsetSpaceWithAttachmentOption RotationOffsetSpace = EFXOffsetSpaceWithAttachmentOption::AccordingToAttachmentSetting, FFXSurfaceTraceParam &inout SurfaceTraceParam = FFXSurfaceTraceParam())
{
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    FECSEntityAdapter local_10 = OwnerEntity;
    SurfaceTraceParam.SetRefEntityId(local_10.GetIdValue());
    FFXConfig local_128;
    local_128.SetAsset(FSoftClassPath(SoftFX.ToString()));
    bool local_141 = !(IsAttached);
    local_128.SetbDetach(local_141);
    FAttachRefName local_143 = local_128.GetAttachRefName();
    local_143.Name = AttachSocket;
    local_128.SetAttachRefName(local_143);
    local_128.SetLocationOffset(LocationOrOffset);
    local_128.SetRotationOffset(RotationOrOffset);
    local_128.SetOverrideParams(OverrideParam);
    local_128.SetSurfaceTraceParam(SurfaceTraceParam);
    if (int(BaseTransformResolveMode) == 0)
    {
        local_128.SetbUseWorldOriginAsBaseTransformSource(!(IsAttached));
    }
    else
    {
        if (int(BaseTransformResolveMode) == 1)
        {
            local_128.SetbUseWorldOriginAsBaseTransformSource(true);
        }
        else
        {
            if (int(BaseTransformResolveMode) == 2)
            {
                local_128.SetbUseWorldOriginAsBaseTransformSource(false);
            }
        }
    }
    if (int(LocationOffsetSpace) == 3)
    {
        int local_146;
        if (!(IsAttached))
        {
            local_146 = 2;
        }
        else
        {
            local_146 = 0;
        }
        local_128.SetLocationOffsetSpace(EFXOffsetSpace(local_146));
    }
    else
    {
        int local_147;
        local_147 = int(FFXUtils::ToEFXOffsetSpace(EFXOffsetSpaceWithAttachmentOption(LocationOffsetSpace)));
        local_128.SetLocationOffsetSpace(EFXOffsetSpace(local_147));
    }
    if (int(RotationOffsetSpace) == 3)
    {
        int local_147;
        if (!(IsAttached))
        {
            local_147 = 2;
        }
        else
        {
            local_147 = 0;
        }
        local_128.SetRotationOffsetSpace(EFXOffsetSpace(local_147));
    }
    else
    {
        int local_146;
        local_146 = int(FFXUtils::ToEFXOffsetSpace(EFXOffsetSpaceWithAttachmentOption(RotationOffsetSpace)));
        local_128.SetRotationOffsetSpace(EFXOffsetSpace(local_146));
    }
    if (ECS::GetRuntimeInfo().IsServer)
    {
        ECSFX::PlayFXInstant(local_10.opImplConv(), local_128, local_4.GetFixedTime().Time, 1.0f, true, true);
    }
    return;
}
UFUNCTION()
FECSEntity Level_PlayFX_Durational(const FECSEntityAdapter &inout OwnerEntity, const TSoftClassPtr<AFXActor> &inout SoftFX, const TArray<FFXOverrideParam> &inout OverrideParam, const FName &inout AttachSocket, const bool IsAttached = false, const EFXBaseTransformResolveModeWithAttachmentOption BaseTransformResolveMode = EFXBaseTransformResolveModeWithAttachmentOption::AccordingToAttachmentSetting, const FVector &inout LocationOrOffset = FVector(0,0,0), const EFXOffsetSpaceWithAttachmentOption LocationOffsetSpace = EFXOffsetSpaceWithAttachmentOption::AccordingToAttachmentSetting, const FRotator &inout RotationOrOffset = FRotator(0,0,0), const EFXOffsetSpaceWithAttachmentOption RotationOffsetSpace = EFXOffsetSpaceWithAttachmentOption::AccordingToAttachmentSetting, const FECSEntity &inout AttachOveride = FECSEntity(), const EAttachFXStopMethod AttachFXStopMethod = EAttachFXStopMethod::StopOnEntityDestroy)
{
    FFXConfig local_116;
    local_116.SetAsset(FSoftClassPath(SoftFX.ToString()));
    bool local_129 = !(IsAttached);
    local_116.SetbDetach(local_129);
    FAttachRefName local_131 = local_116.GetAttachRefName();
    local_131.Name = AttachSocket;
    local_116.SetAttachRefName(local_131);
    local_116.SetLocationOffset(LocationOrOffset);
    local_116.SetRotationOffset(RotationOrOffset);
    local_116.SetOverrideParams(OverrideParam);
    if (int(BaseTransformResolveMode) == 0)
    {
        local_116.SetbUseWorldOriginAsBaseTransformSource(!(IsAttached));
    }
    else
    {
        if (int(BaseTransformResolveMode) == 1)
        {
            local_116.SetbUseWorldOriginAsBaseTransformSource(true);
        }
        else
        {
            if (int(BaseTransformResolveMode) == 2)
            {
                local_116.SetbUseWorldOriginAsBaseTransformSource(false);
            }
        }
    }
    if (int(LocationOffsetSpace) == 3)
    {
        int local_134;
        if (!(IsAttached))
        {
            local_134 = 2;
        }
        else
        {
            local_134 = 0;
        }
        local_116.SetLocationOffsetSpace(EFXOffsetSpace(local_134));
    }
    else
    {
        int local_135;
        local_135 = int(FFXUtils::ToEFXOffsetSpace(EFXOffsetSpaceWithAttachmentOption(LocationOffsetSpace)));
        local_116.SetLocationOffsetSpace(EFXOffsetSpace(local_135));
    }
    if (int(RotationOffsetSpace) == 3)
    {
        int local_135;
        if (!(IsAttached))
        {
            local_135 = 2;
        }
        else
        {
            local_135 = 0;
        }
        local_116.SetRotationOffsetSpace(EFXOffsetSpace(local_135));
    }
    else
    {
        int local_134;
        local_134 = int(FFXUtils::ToEFXOffsetSpace(EFXOffsetSpaceWithAttachmentOption(RotationOffsetSpace)));
        local_116.SetRotationOffsetSpace(EFXOffsetSpace(local_134));
    }
    FFPTime local_140 = ECS::GetContextTime();
    return ECSFX::PlayFXDurationalEx(OwnerEntity.opImplConv(), local_116, local_140, 1.0f, true, AttachOveride, false);
}
UFUNCTION()
void Level_EcosimAIMuteCreature(const FString &inout Creature, const bool bMute)
{
    return;
}
UFUNCTION()
void EnableQiongBuffTipIndicator(const FECSEntityAdapter &inout Entity, const FECSEntityAdapter &inout FromEntity, const FBuffConfigRef &inout BuffConfig, const bool Enabled)
{
    int local_2 = 0;
    if (Enabled)
    {
        FECSEntity local_6 = Entity.GetEntity();
        local_2.SetFromEntity(FromEntity.opImplConv());
        local_2.SetBuffConfig(BuffConfig);
        return;
    }
    FECSEntity local_6_2 = Entity.GetEntity();
    Remove local_14;
    local_14.opCall();
    return;
}
UFUNCTION()
void QiongHiddenBuffTip(const FECSEntityAdapter &inout QiongEntity, const bool bHidden)
{
    if (bHidden)
    {
        FC_QiongHiddenBuffTipTag local_6;
        Assign local_4;
        local_4.opCall(local_6);
        return;
    }
    Remove local_10;
    local_10.opCall();
    return;
}
UFUNCTION()
void ShowHideItemBtn(const FECSEntityAdapter &inout Entity, const EItemBtnUIType BtnType, const bool bShow)
{
    int local_4 = 0;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (bShow)
    {
        return;
    }
    if (!(local_4.GetHiddenBtnTypes().Contains(BtnType)))
    {
        local_4.GetModify_HiddenBtnTypes().Add(BtnType);
    }
    return;
}
UFUNCTION()
void ShowHideSkillBtn(const FECSEntityAdapter &inout Entity, const ENormalSSkillBtnUIType BtnType, const bool bShow)
{
    int local_4 = 0;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (bShow)
    {
        return;
    }
    if (!(local_4.GetHiddenBtnTypes().Contains(BtnType)))
    {
        local_4.GetModify_HiddenBtnTypes().Add(BtnType);
    }
    return;
}
UFUNCTION()
void SetSkillBtnDurationEffect(const FECSEntityAdapter &inout Entity, const int SkillIndex, const bool bEnabled, const float32 DurationTime, const FBuffConfigRef &inout DurationTimeBuffConfig)
{
    int local_14 = 0;
    int local_46 = 0;
    Has local_6;
    if (!(Entity.IsValid()) || !(local_6.opCall()))
    {
        return;
    }
    if (SkillIndex < 0 || (SkillIndex >= local_14.GetSkillRuntimeInfos().Num()))
    {
        return;
    }
    ESkillSlot local_16;
    local_16 = local_14.GetSkillRuntimeInfos()[SkillIndex].GetSlot();
    float32 local_18 = DurationTime;
    if (DurationTimeBuffConfig.IsValid())
    {
        TDataObjectPtr<FBuffConfig> local_42;
        local_18 = local_42.opArrow().BuffDuration;
    }
    int local_53 = local_46.GetDurationEffect().Num() - 1;
    for (; local_53 >= 0; --local_53)
    {
        if ((int(local_46.GetDurationEffect()[local_53].GetSlot())) == (int(local_16)))
        {
            local_46.GetModify_DurationEffect().RemoveAt(local_53);
        }
    }
    if (bEnabled)
    {
        FSkillBtnDurationEffect local_60;
        local_60.SetSlot(ESkillSlot(local_16));
        local_60.SetStartTime(BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()));
        local_60.SetEndTime((BlueprintFunctions_Common::GetWorldTime(Entity.opImplConv()) + FFPTime(local_18)));
        local_46.GetModify_DurationEffect().Add(local_60);
    }
    return;
}
UFUNCTION()
void LevelSpot_OverridePresentationConfig(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FPresentationConfig> &inout PresentationConfig)
{
    ELevelSpotDataSource local_258;
    EntityLevelSpotUtils::GetSpotData(Entity.opImplConv(), local_258);
    local_258.SetPresentationConfig(PresentationConfig);
    FECSEntity local_132 = Entity.opImplConv();
    return;
}
UFUNCTION()
void LevelSpot_OverridePresentationRuleConfig(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FPresentationRuleConfig> &inout PresentationRuleConfig)
{
    ELevelSpotDataSource local_258;
    EntityLevelSpotUtils::GetSpotData(Entity.opImplConv(), local_258);
    local_258.SetPresentationRuleConfig(PresentationRuleConfig);
    FECSEntity local_132 = Entity.opImplConv();
    return;
}
UFUNCTION()
void LevelSpot_RemovePresentationConfigOverride(const FECSEntityAdapter &inout Entity)
{
    ELevelSpotDataSource local_258;
    EntityLevelSpotUtils::GetSpotData(Entity.opImplConv(), local_258);
    local_258.RemovePresentationConfig();
    if (local_258.IsEmpty())
    {
        EntityLevelSpotUtils::RemoveSpotData(Entity.opImplConv(), ELevelSpotDataSource(4));
    }
    else
    {
        FECSEntity local_132 = Entity.opImplConv();
    }
    return;
}
UFUNCTION()
void LevelSpot_RemovePresentationRuleConfigOverride(const FECSEntityAdapter &inout Entity)
{
    ELevelSpotDataSource local_258;
    EntityLevelSpotUtils::GetSpotData(Entity.opImplConv(), local_258);
    local_258.RemovePresentationRuleConfig();
    if (local_258.IsEmpty())
    {
        EntityLevelSpotUtils::RemoveSpotData(Entity.opImplConv(), ELevelSpotDataSource(4));
    }
    else
    {
        FECSEntity local_132 = Entity.opImplConv();
    }
    return;
}
UFUNCTION()
void TeleportToNearestPrefab(const FECSEntityAdapter &inout Entity, const FName &inout PrefabRowName, const float32 OffsetRadius = 300.0f)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        FECSRuntimeView local_42 = Entity.GetWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_46;
        local_46.opCall();
        Exclude(local_42).opCall();
        float32 local_51 = 0.0f;
        FVector local_58(FVector::ZeroVector);
        FECSRuntimeViewIterator local_92 = local_42.Iterator();
        for (; local_92.CanProceed;)
        {
            const FECSEntity& local_128 = local_92.Proceed();
            TDataObjectPtr<FBasePrefabConfig> local_152 = GetPrefabConfigPtr(local_128);
            if (!((local_152 == nullptr)) && (local_152.GetDataName() == PrefabRowName))
            {
                float32 local_52 = FASCommonUtils::CalculateEntityDistance2D(Entity.opImplConv(), local_128, true);
                if ((local_51 == 0.0f || (local_52 < local_51)))
                {
                    local_58 = (FASCommonUtils::GetEntityLocation(local_128) + FVector(0.0, 0.0, 100.0));
                    local_51 = local_52;
                }
            }
        }
        if (!((local_58 == FVector::ZeroVector)))
        {
            GetDefaulted local_220;
            BlueprintFunctions_Common::TeleportEntityToLocation(Entity, FASCommonUtils::FindLegalLocationExt(Entity.opImplConv(), local_58, OffsetRadius, 200.0f, 4, FVector(100.0, 100.0, 200.0), false), local_220.opCall().GetRotation().Rotator(), false, FRotator::ZeroRotator, false, true, ELoadingScreenAction(0), true);
        }
        else
        {
            FString local_234 = "Can't Find Teleport Target ! ";
        }
    }
    return;
}
UFUNCTION()
void GetLocalAvatar(FECSEntity &out Avatar)
{
    FECSEntity local_4;
    Avatar = local_4;
    Avatar = UECSFunctionLibraryExtension::GetLocalPlayerPawnEntity(__GetWorldContext());
    return;
}
UFUNCTION()
void Ability_StartVengeance(const FECSEntityAdapter &inout Target, const FECSEntity &inout Killer)
{
    int local_16 = 0;
    if (ECS::GetRuntimeInfo().IsServer)
    {
        FFPTime local_14 = BlueprintFunctions_Common::GetWorldTime(Target.opImplConv());
        FECSEntity local_12 = Target.opImplConv();
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        local_16.Killer = Killer;
        local_16.SetbPredictable(false);
    }
    return;
}
UFUNCTION()
int GetInventoryItemNumber(const FECSEntityAdapter &inout Entity, const FItemTableRowRef &inout Item)
{
    bool local_1 = !(Entity.IsValid());
    bool local_2 = !(false);
    local_1 = local_1 == local_2 || !(Item.IsValid());
    if (local_1)
    {
        return 0;
    }
    return InventoryUtils::GetInventoryItemNumber(Entity.opImplConv(), TDataObjectPtr<FItemConfig>());
}
UFUNCTION()
void SetTextRender(const FECSEntityAdapter &inout Entity, const FName &inout Text)
{
    return;
}
UFUNCTION()
void GetEntityIDValue(const FECSEntityAdapter &inout Entity, int &out Idvalue)
{
    Idvalue = 0;
    Idvalue = Entity.GetIdValue();
    return;
}
UFUNCTION()
void GetMonsterSpawnProbability(const FECSEntityAdapter &inout Entity, float32 &out Value)
{
    Value = 0.0f;
    Get local_6;
    const FC_DropItemConfig& local_8 = local_6.opCall();
    if (local_8)
    {
        if (local_8.HasMonsterSpawn)
        {
            Value = local_8.SpawnProbability;
        }
        else
        {
            Value = 0.0f;
        }
        return;
    }
    Value = 0.0f;
    return;
}
UFUNCTION()
void GetTargetSpawnMonster(const FECSEntityAdapter &inout Entity, TSubclassOf<AMonsterPrefab> &out Target)
{
    TSubclassOf<AMonsterPrefab> local_2;
    Target = local_2;
    Get local_6;
    const FC_DropItemConfig& local_8 = local_6.opCall();
    if (local_8)
    {
        bool local_13;
        local_13 = local_8.HasMonsterSpawn;
        if (!(local_13))
        {
            local_13 = false;
        }
        else
        {
            TSubclassOf<AMonsterPrefab> local_12;
            local_12 = local_8.TargetMonster;
            local_13 = !((local_12 == nullptr));
        }
        if (local_13)
        {
            Target = local_8.TargetMonster;
        }
        else
        {
            XError(ELog(0), "Target Spawn Monster Not Configured.");
        }
        return;
    }
    XError(ELog(0), "DropConfig Not Found.");
    return;
}
UFUNCTION()
FString LoadStringFromFile(const FString &inout FileName)
{
    if (FileName.IsEmpty())
    {
        return "";
    }
    FString local_6;
    FString local_18 = (FString(FPaths::ProjectSavedDir()) + FileName);
    FFileHelper::LoadFileToString(local_6, local_18, FFileHelper::EHashOptions(0), 0);
    return FString();
}
UFUNCTION()
void SaveStringToFile(const FString &inout Content, const FString &inout FileName)
{
    if (FileName.IsEmpty())
    {
        return;
    }
    FString local_14 = (FString(FPaths::ProjectSavedDir()) + FileName);
    FFileHelper::SaveStringToFile(Content, local_14, FFileHelper::EEncodingOptions(0), 0);
    return;
}
UFUNCTION()
bool CheckEntityOrControllerSame(const FECSEntity &inout EntityA, const FECSEntity &inout EntityB)
{
    if ((EntityA == EntityB))
    {
        return true;
    }
    Get local_6;
    const FC_ControlledByPlayer& local_8 = local_6.opCall();
    if (local_8)
    {
        Get local_12;
        const FC_ControlledByPlayer& local_14 = local_12.opCall();
        if (local_14)
        {
            return (FECSEntity(local_8.GetPlayerEntity()) == local_14.GetPlayerEntity());
        }
    }
    return false;
}
UFUNCTION()
void OverrideLevelReviveRule(const TDataObjectPtr<FReviveData> &inout NewReviveRule)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Modify local_8;
    FCS_NearDeathRule& local_10 = local_8.opCall();
    if (local_10)
    {
        local_10.SetReviveData(NewReviveRule);
    }
    return;
}
UFUNCTION()
void RestoreLevelReviveRule()
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Modify local_8;
    FCS_NearDeathRule& local_10 = local_8.opCall();
    if (local_10)
    {
        if (FLevelUtils::GetCurrentLevelInfoConfig(nullptr))
        {
            local_10.SetReviveData(GetReviveRule());
        }
        else
        {
            local_10.SetReviveData(TDataObjectPtr<FReviveData>(nullptr));
        }
    }
    return;
}
UFUNCTION()
bool EqualEqual_DataObject(const FDataObjectPtr &inout A, const FDataObjectPtr &inout B)
{
    return (A.GetUniqueID() == B.GetUniqueID());
}
UFUNCTION()
bool EqualEqual_ObjectiveConfigDataObject(const TDataObjectPtr<FObjectiveConfig> &inout A, const TDataObjectPtr<FObjectiveConfig> &inout B)
{
    return (A == B.opImplConv());
}
UFUNCTION()
bool EqualEqual_WorldAreaConfigDataObject(const TDataObjectPtr<FWorldAreaConfig> &inout A, const TDataObjectPtr<FWorldAreaConfig> &inout B)
{
    return (A == B.opImplConv());
}
UFUNCTION()
void CommissionAddCustomNameStatsCount(const FECSEntityAdapter &inout PlayerPawn, const FName &inout CustomName, const FECSEntity &inout TargetEntity, const int Count = 1)
{
    CommissionStatsUtils::AddCustomNameStatsCount(PlayerPawn.opImplConv(), CustomName, TargetEntity, Count);
    return;
}
UFUNCTION()
void IntrusionEventSucceed()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    bool local_7 = local_6.opCall();
    if (local_7)
    {
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Modify local_12;
        local_12.opCall().bHasFinishChallengeFactor = true;
    }
    return;
}
UFUNCTION()
void IntrusionEventFailed()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    bool local_7 = local_6.opCall();
    if (local_7)
    {
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Modify local_12;
        local_12.opCall().bHasFinishChallengeFactor = (-1 != 0);
    }
    return;
}
UFUNCTION()
void CommissionFinishSkipReward(const bool bSkipRewardUI)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    bool local_7 = local_6.opCall();
    if (local_7)
    {
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Modify local_12;
        local_12.opCall().bSkipRewardUI = bSkipRewardUI;
    }
    return;
}
UFUNCTION()
void StartRaceCommissionTimer()
{
    if (!(CommissionUtils::IsRaceCommissionTimerStarted()))
    {
        CommissionUtils::ResetRaceCommissionTimer(FFPTime(-1));
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        FCS_RaceStartDivineSkillResetPendingTag local_14;
        Assign local_12;
        local_12.opCall(local_14);
        return;
    }
    XWarning(ELog(22), "Race commission timer already started.");
    return;
}
UFUNCTION()
void AbortCatchExecution(const FECSEntity &inout Target, const FName &inout SlaveTrigger, const float32 SlaveTriggerValidateTime)
{
    Has local_6;
    if (!(Target.IsValid()) || !(local_6.opCall()))
    {
        return;
    }
    Modify local_12;
    FC_ManipulatedInfo& local_14 = local_12.opCall();
    if (local_14)
    {
        FFPTime local_18 = BlueprintFunctions_Common::GetWorldTime(Target);
        local_14.SetExitTime(local_18);
        FECSEntity local_22 = FECSEntity(local_14.GetMasterEntity());
        if (!(!(local_22.IsValid())) && local_6.opCall())
        {
            FNameHandle_EntityBBVarBool local_26;
            local_26;
            local_22.SetBB_Bool(local_26, MonsterThrowDetectUtils::MonsterCatchTargetLostBBVar);
        }
        if ((!((SlaveTrigger == NAME_None))))
        {
            FESMTriggerUtils::ActivateESMTrigger(Target, SlaveTrigger, local_18, FFPTime(SlaveTriggerValidateTime), 0);
        }
    }
    return;
}
UFUNCTION()
void SetInteractionBlocked(const FECSEntity &inout InteractionTarget, const bool bBlocked)
{
    Has local_6;
    if (!(InteractionTarget.IsValid()) || !(local_6.opCall()))
    {
        return;
    }
    FInteractUtils::SetInteractionBlocked(InteractionTarget, bBlocked);
    return;
}
UFUNCTION()
void PropAddBuffToPlayer(const FECSEntity &inout TriggerPlayer, const FECSEntity &inout BuffConfigSourceEntity, const bool bIncludeDefault, const TArray<FName> &inout BuffTagNames)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    PropAddBuffToPlayerUtils::TriggerEntityAddBuffListByBuffTag(TriggerPlayer, BuffConfigSourceEntity, bIncludeDefault, BuffTagNames);
    return;
}
UFUNCTION()
void AddTemporarySkill(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FAddTemporarySkillConfig> &inout AddTemporarySkillConfig)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    FSkillUtils::AddTemporarySkill(Entity.opImplConv(), AddTemporarySkillConfig);
    return;
}
UFUNCTION()
void GetLocationAndRotationByEntityId(const FECSEntityId &inout TargetEntityId, FVector &out Location, FVector &out Rotation)
{
    FVector local_6;
    Location = local_6;
    Rotation = local_6;
    FVector local_18(FVector::ZeroVector);
    FVector local_24(FVector::ZeroVector);
    FECSEntity local_32 = FECSEntity(TargetEntityId);
    Get local_36;
    const FC_Transform& local_38 = local_36.opCall();
    if (local_38)
    {
        local_18 = local_38.GetPosition();
        local_24 = local_38.GetRotation().GetForwardVector();
    }
    Location = local_18;
    Rotation = local_24;
    return;
}
UFUNCTION()
void GetEntityByEntityId(const FECSEntityId &inout EntityId, FECSEntity &out Entity, bool &out bIsValid)
{
    FECSEntity local_4;
    Entity = local_4;
    bIsValid = false;
    Entity = ENTITY_NULL;
    bIsValid = FECSEntity(EntityId).IsValid();
    if (!(bIsValid))
    {
        return;
    }
    Entity = FECSEntity(EntityId);
    return;
}
UFUNCTION()
void SpawnMonsterBasedOnProbability(const FECSEntityAdapter &inout Entity, const TArray<FSpawnMonsterConfigItem> &inout OverrideSpawnMonsterConfigs = TArray<FSpawnMonsterConfigItem>(), const bool bDisableAutoSpawnOnDeath = false)
{
    int local_12 = 0;
    if (!(OverrideSpawnMonsterConfigs.IsEmpty()))
    {
        SpawnMonsterUtils::SpawnMonsterByConfig(Entity.opImplConv(), OverrideSpawnMonsterConfigs);
    }
    else
    {
        if (local_12)
        {
            SpawnMonsterUtils::SpawnMonsterByConfig(Entity.opImplConv(), local_12.SpawnMonsterConfigs);
        }
    }
    if (bDisableAutoSpawnOnDeath)
    {
        Has local_22;
        XLog(ELog(42), FString().Append("[SpawnMonster] Entity[").Append(Entity.GetIdValue()).Append("] DisableAutoSpawnOnDeath, Previous=").Append(local_22.opCall()));
        Remove local_28;
        local_28.opCall();
    }
    return;
}
UFUNCTION()
void SetAutoSpawnMonsterOnDeathEnabled(const FECSEntityAdapter &inout Entity, const bool bEnabled = false)
{
    Has local_10;
    XLog(ELog(42), FString().Append("[SpawnMonster] Entity[").Append(Entity.GetIdValue()).Append("] SetAutoSpawnMonsterOnDeath=").Append(bEnabled).Append(", Previous=").Append(local_10.opCall()));
    if (bEnabled)
    {
        FC_SpawnMonsterOnDeathTag local_18;
        Assign local_16;
        local_16.opCall(local_18);
        return;
    }
    Remove local_22;
    local_22.opCall();
    return;
}
UFUNCTION()
bool HasCapability(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FCapabilityConfig> &inout CapabilityConfig)
{
    int local_22 = 0;
    if (!(CapabilityConfig))
    {
        return false;
    }
    FECSEntity local_10 = Entity.opImplConv();
    Has local_14;
    if (!(local_10.IsValid()) || !(local_14.opCall()))
    {
        return false;
    }
    int local_23 = 0;
    for (; local_23 < local_22.GetCapabilityRuntime().CapabilityInstances.Num(); ++local_23)
    {
        if ((CapabilityConfig == local_22.GetCapabilityRuntime().CapabilityInstances[local_23].Config))
        {
            return true;
        }
    }
    return false;
}
UFUNCTION()
bool HasCapabilityByName(const FECSEntityAdapter &inout Entity, const FName &inout CapabilityDataName)
{
    int local_22 = 0;
    if (CapabilityDataName.IsNone())
    {
        return false;
    }
    FECSEntity local_10 = Entity.opImplConv();
    Has local_14;
    if (!(local_10.IsValid()) || !(local_14.opCall()))
    {
        return false;
    }
    int local_23 = 0;
    for (; local_23 < local_22.GetCapabilityRuntime().CapabilityInstances.Num(); ++local_23)
    {
        if ((local_22.GetCapabilityRuntime().CapabilityInstances[local_23].Config.GetDataName() == CapabilityDataName))
        {
            return true;
        }
    }
    return false;
}
UFUNCTION()
bool CopyAllCapAbilitiesToTargetEntity(const FECSEntityAdapter &inout SourceEntity, const FECSEntityAdapter &inout TargetEntity)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return false;
    }
    return FCapabilityUtils::CopyAllCapabilities(SourceEntity.opImplConv(), TargetEntity.opImplConv());
}
UFUNCTION()
int GetHealItemMax(const FECSEntityAdapter &inout Entity)
{
    FECSEntity local_12 = FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv());
    int local_14 = StigmataUtils::GetEntityHealItemMax(local_12);
    int local_13 = FGameModeUtils::GetCombatRestrictionPotionMaxCount();
    if (local_13 >= 0)
    {
        local_14 = local_13;
    }
    return local_14;
}
UFUNCTION()
void SupplyPotionToMax(const FECSEntityAdapter &inout Entity)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    FECSEntity local_14 = FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv());
    if (!(local_14.IsValid()))
    {
        return;
    }
    int local_16 = StigmataUtils::GetEntityHealItemMax(local_14);
    int local_15 = FGameModeUtils::GetCombatRestrictionPotionMaxCount();
    if (local_15 >= 0)
    {
        local_16 = local_15;
    }
    UNearDeathSettings local_20 = NearDeathSettings::Get();
    int local_17 = InventoryUtils::GetInventoryItemNumber(local_14, TDataObjectPtr<FItemConfig>());
    if (local_17 < local_16)
    {
        int local_18 = local_16 - local_17;
        UNearDeathSettings local_20_2 = NearDeathSettings::Get();
        InventoryUtils::AddInventoryItem(local_14, TDataObjectPtr<FItemConfig>());
        XLog(ELog(0), FString().Append("[SupplyPotionToMax] cur=").Append(local_17).Append(", max=").Append(local_16).Append(", added=").Append(local_18));
    }
    return;
}
UFUNCTION()
void AddPlayerExperience(const FECSEntityAdapter &inout Entity, const int ExperienceNum)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (ExperienceNum <= 0)
    {
        return;
    }
    if (!(FVirtualItemConfig::FindByKey(EVirtualItemType(1))))
    {
        return;
    }
    FInventoryAddItemReasonScope local_54 = FInventoryAddItemReasonScope(21);
    InventoryUtils::AddInventoryItem(Entity.opImplConv(), TDataObjectPtr<FItemConfig>(), ExperienceNum);
    return;
}
UFUNCTION()
int CombineTargetCreatureToOneTeamOfSelfEntityByRangeNewEcology(const FECSEntity &inout SelfEntity, const TDataObjectPtr<FMonsterMainConfig> &inout MonsterRowData, const float32 Range, const int MaxEntityNum = -1)
{
    return FCombatUtils::CombineTargetCreatureToOneTeamOfSelfEntityByRangeNewEcology(SelfEntity, MonsterRowData, Range, MaxEntityNum);
}
}

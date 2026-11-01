const FConsoleVariable CVar_HitTest_HitFrameDebug = FConsoleVariable();
const FName DebugDrawKey_ArealStrike = n"ArealStrike";
const FName DebugDrawKey_ArealStrikeHit = n"ArealStrikeHit";
const FConsoleCommand CVar_Debug_DrawArealStrike = FConsoleCommand();

struct FHitTestEvaluateResult
{
    UPROPERTY()
    FVector HitResultLocation;
    UPROPERTY()
    FVector HitPoint;
    UPROPERTY()
    float32 Scroe = 0.0f;
    UPROPERTY()
    int HitBoxDataIndex = -1;
    UPROPERTY()
    FHitTestCheckResult HitTestCheckResult;
    UPROPERTY()
    UCharacterBodyPartDataAsset BodyPartData = nullptr;

}

class US_HitTestSystemAS : UECSScriptSystem
{
    US_HitTestSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    FCE_HitEvent& MakeHitEventByStrike(const FECSEntity &inout Sender, const FECSEntity &inout HitEntity, const FFPTime &inout Time, const FTransform &inout HitTestTramsform, const FVector &inout HitPoint, const FAttackData &inout AttackData, const FName &inout StrikeKey, const FStrikeEventData &inout StrikeData, const FDataObjectPtr &inout HitDecalConfig, const FHitBoxData &inout HitBoxData, const bool bHitWeakness, const bool bPredicatable, const bool bClientWaitForServerOnHit, const bool bNeedHitMeshPresentation, const bool bAttackHitFXSpawnToStrikeCenterLine) const
    {
        FECSEntity local_4 = Sender;
        if (FECSEntity::Has<FC_ControlledByPlayer>(HitEntity).opCall() && !(FECSEntity::Has<FC_ControlledByPlayer>(Sender).opCall()))
        {
            local_4 = HitEntity;
        }
        FHitEventParam local_132;
        local_132.bPredictable = (!(this.GetECSRuntime().IsServer) || bPredicatable);
        local_132.bClientWaitForServerOnHit = bClientWaitForServerOnHit;
        local_132.bNeedHitMeshPresentation = bNeedHitMeshPresentation;
        local_132.bAttackHitFXSpawnToStrikeCenterLine = bAttackHitFXSpawnToStrikeCenterLine;
        local_132.HitPosition = HitPoint;
        local_132.bHitWeakness = bHitWeakness;
        local_132.HitShakeBodyType = HitBoxData.BoneShakeBodyType;
        local_132.HitBoneName = HitBoxData.AttachInfo.AttachToName;
        local_132.HitBodyPart = HitBoxData.BodyPartKey;
        local_132.OverrideAnimSocket = HitBoxData.OverrideAnimSocket;
        local_132.PhysicalMaterial = HitBoxData.HitMaterial;
        local_132.StrikeData = StrikeData;
        local_132.CustomStrikeTransform = HitTestTramsform;
        local_132.HitDecalConfig = HitDecalConfig;
        local_132.StrikeKey = StrikeKey;
        local_132.AttackData = TDataObjectPtr<FAttackData>(AttackData);
        return (::FCombatUtils::MakeHitEvent(local_4, Sender, HitEntity, Time, local_132));
    }
    bool CheckEntityControlledByPlayer(const FECSEntity &inout ControlledEntity, const FECSEntity &inout PlayerEntity) const
    {
        Get local_4;
        const FC_ControlledByPlayer& local_6 = local_4.opCall();
        if (local_6)
        {
            return (FECSEntity(local_6.GetPlayerEntity()) == PlayerEntity);
        }
        return false;
    }
    FVector GetImpactDir(const FECSEntity &inout Attacker, const FCE_ArealStrikeRequestEvent &inout Event, const FHitTestResult &inout Result, const FAttackData &inout AttackData) const
    {
        int local_6 = 0;
        bool local_13;
        UStaticMeshComponent local_28;
        UHierarchicalInstancedStaticMeshComponent local_32;
        bool local_57 = false;
        UInstancedSkinnedMeshComponent local_62;
        FVector __return;
        FVector local_12;
        if (Result.HitComponent.IsValid())
        {
            local_12 = Result.HitComponent.Get().GetWorldLocation();
            if (int(Result.HitItemIndex) == INDEX_NONE)
            {
                local_28 = (Cast<UStaticMeshComponent>(Result.HitComponent.Get()));
                if (local_28 != nullptr)
                {
                    local_12 = local_28.GetWorldLocation();
                }
            }
            else
            {
                while (local_57)
                {
                    local_32 = Cast<UHierarchicalInstancedStaticMeshComponent>(Result.HitComponent.Get());
                    if (local_32 != nullptr)
                    {
                        FTransform local_56;
                        if (local_32.GetInstanceTransform(int(Result.HitItemIndex), local_56, true))
                        {
                            local_12 = local_56.GetLocation();
                        }
                        break;
                    }
                    local_62 = Cast<UInstancedSkinnedMeshComponent>(Result.HitComponent.Get());
                    if (local_62 != nullptr)
                    {
                        FTransform local_56;
                        if (FSimpleDestructibleUtils::GetInstanceSkinnedMeshTransform(local_62, int(Result.HitItemIndex), local_56, true))
                        {
                            local_12 = local_56.GetLocation();
                        }
                        break;
                    }
                }
            }
        }
        else
        {
            if (!(Result.HitEntity.IsValid()))
            {
                local_13 = false;
            }
            else
            {
                Has local_68;
                local_13 = local_68.opCall();
            }
            if (local_13)
            {
                Get local_4;
                local_12 = local_4.opCall().GetPosition();
            }
            else
            {
                XError(ELog(42), "HitTestResult has no hit entity(or entity has no transform) or hit component");
                __return = FVector::ZeroVector;
            }
        }
        FVector local_74(FVector::ZeroVector);
        if (Result.bIsOverlap)
        {
            if ((int(AttackData.HitDirection) == 0 || (int(AttackData.HitDirection) == 1)))
            {
                local_74 = (local_12 - local_6.GetPosition());
            }
            else
            {
                if (int(AttackData.HitDirection) == 2)
                {
                    local_74 = local_6.GetRotation().GetForwardVector();
                }
                else
                {
                    if (int(AttackData.HitDirection) == 3)
                    {
                        local_74 = Event.StrikeEventData.StrikeDirection;
                    }
                }
            }
        }
        else
        {
            if (int(AttackData.HitDirection) == 0)
            {
                local_74 = (local_12 - local_6.GetPosition());
            }
            else
            {
                if (int(AttackData.HitDirection) == 1)
                {
                    local_74 = (local_12 - Result.HitPoint);
                }
                else
                {
                    if (int(AttackData.HitDirection) == 2)
                    {
                        local_74 = local_6.GetRotation().GetForwardVector();
                    }
                    else
                    {
                        if (int(AttackData.HitDirection) == 3)
                        {
                            local_74 = Event.StrikeEventData.StrikeDirection;
                        }
                    }
                }
            }
        }
        local_74.Z = 0.0;
        local_74.Normalize(9.99999993922529e-9);
        return local_74;
    }
    void TryPausePIEOnHit(const bool bPausePIEOnHit) const
    {
        return;
    }
    void RecordMeleeStrikeHitDebug(const FCE_ArealStrikeRequestEvent &inout Event, const FCS_FixedTime &inout FixedTime, const FFPTime &inout Time, const bool bPerEntityQuest, const TArray<FECSEntityId> &inout HitEntityIds) const
    {
        if (int(Event.MeleeStrikeToFrame) == INDEX_NONE || HitEntityIds.IsEmpty())
        {
            return;
        }
        FHitTestDebugRecord local_32;
        bool local_4 = this.GetECSRuntime().IsServer;
        local_32.SetbServer(local_4);
        local_32.SetServerHitTimeSeconds(ECS::ConvertToAuthorityWorldTimeStamp(Time).ToSeconds());
        local_32.SetClientHitTime(Time);
        local_32.SetServerFixedFrame(ECS::ConvertToAuthorityWorldTimeStampFrame(int(FixedTime.Frame)));
        local_32.SetClientFixedFrame(int(FixedTime.Frame));
        local_32.SetServerRequestTimeSeconds(ECS::ConvertToAuthorityWorldTimeStamp(Event.GetHitRequestTime()).ToSeconds());
        local_32.SetClientRequestTime(Event.GetHitRequestTime());
        local_32.SetRequestCreatedFrame(int(Event.CreatedFrame));
        local_32.SetRequestEventId(int(Event.EventId));
        local_32.SetActionFromFrame(int(Event.MeleeStrikeFromFrame));
        local_32.SetActionToFrame(int(Event.MeleeStrikeToFrame));
        local_32.SetSenderEntityId(Event.Sender.GetId());
        local_32.SetActionIdentifier(Event.AttackIdentifier);
        local_32.SetStrikeKey(Event.StrikeKey);
        local_32.SetbPerEntityQuest(bPerEntityQuest);
        local_32.SetHitEntityIds(HitEntityIds);
        if (this.GetECSRuntime().IsServer)
        {
            FECSWorldPtr local_42 = this.GetECSWorld();
            Modify local_46;
            FCS_ServerHitTestDebugRecords& local_48 = local_46.opCall();
            if (local_48)
            {
                if (!(local_48.bEnabled))
                {
                    return;
                }
                TArray<FHitTestDebugRecord> local_52 = local_48.Records;
                if (local_52.Num() >= 512)
                {
                    local_52.RemoveAt(0);
                }
                local_52.Add(local_32);
                local_48.Records = local_52;
                this.TryPausePIEOnHit(local_48.bPausePIEOnHit);
            }
        }
        else
        {
            FECSWorldPtr local_42_2 = this.GetECSWorld();
            Modify local_56;
            FCS_ClientHitTestDebugRecords& local_58 = local_56.opCall();
            if (local_58)
            {
                if (!(local_58.bEnabled))
                {
                    return;
                }
                if (local_58.Records.Num() >= 512)
                {
                    local_58.Records.RemoveAt(0);
                }
                local_58.Records.Add(local_32);
                this.TryPausePIEOnHit(local_58.bPausePIEOnHit);
            }
        }
        return;
    }
    bool HandleArealStrike(const FCE_ArealStrikeRequestEvent &inout Event, const FCS_FixedTime &inout FixedTime, const bool bPerEntityQuest, const FECSEntity &inout ForSpecificReceiverEntity, const FFPTime &inout Time) const
    {
        bool local_27;
        int local_76 = 0;
        FAttackData local_102;
        const FC_BodyPartsConfig& local_214;
        int local_228 = 0;
        Get local_232;
        bool local_379 = false;
        bool local_384;
        const FHitBoxData& local_422;
        UCharacterBodyPartDataAsset local_618;
        int local_636 = 0;
        bool local_639;
        UCharacterBodyPartDataAsset local_778;
        int local_816 = 0;
        int local_822 = 0;
        if (!(Event.Sender.IsValid()))
        {
            return false;
        }
        bool local_1 = this.GetECSRuntime().IsClient;
        if (local_1)
        {
            Has local_6;
            if (!((ForSpecificReceiverEntity.GetId() == ENTITY_ID_NULL)))
            {
                if (!(local_6.opCall()))
                {
                    return false;
                }
            }
            else
            {
                if (!(local_6.opCall()))
                {
                    return false;
                }
            }
        }
        FECSEntity local_10 = FECSEntity(Event.Sender);
        FFPTime local_18 = bPerEntityQuest ? FCollisionUtils::GetCollisionRollbackTimeWithSyncNetTime(ForSpecificReceiverEntity, FixedTime) : FCollisionUtils::GetCollisionRollbackTime(local_10, FixedTime);
        TArray<FHitTestResult> local_22;
        TArray<FECSEntityId> local_26;
        local_27 = false;
        bool local_28 = false;
        FECSEntityId local_2;
        if (!((FVector3f(Event.SweepFromOffset) == FVector3f::ZeroVector)))
        {
            Get local_66;
            bool local_32;
            FECSEntityId local_71;
            if (bPerEntityQuest && !((ForSpecificReceiverEntity == ENTITY_NULL)))
            {
                local_27 = Event.Shape.DoHitTestSweepOnEntity(local_22, ForSpecificReceiverEntity, Event.GetTransform(), Event.SweepFromOffset, Event.SweepFromRotation, Event.ShapePositionOffset, EAxisDirection(Event.TipDirection), ECollisionChannel(17), local_18, DebugDrawKey_ArealStrike);
                const FC_PerfectDodge& local_62 = local_66.opCall();
                if (local_62)
                {
                    if (!(local_62.GetbIsDummy()) && local_62.GetDummyEntity().IsValid())
                    {
                        TArray<FHitTestResult> local_70;
                        local_32 = Event.Shape.DoHitTestSweepOnEntity(local_70, local_62.GetDummyEntity(), Event.GetTransform(), Event.SweepFromOffset, Event.SweepFromRotation, Event.ShapePositionOffset, EAxisDirection(Event.TipDirection), ECollisionChannel(17), local_18, DebugDrawKey_ArealStrike);
                        if (local_32)
                        {
                            local_22.Append(local_70);
                        }
                    }
                }
            }
            else
            {
                int local_34_2 = int(Event.TipDirection);
                FTransform local_60 = Event.GetTransform();
                if (Event.GetbIgnoreSender())
                {
                    local_71 = local_10.GetId();
                }
                else
                {
                    local_71 = ENTITY_ID_NULL;
                }
                local_27 = Event.Shape.DoHitTestSweep(local_22, this.GetWorld(), local_71);
            }
        }
        else
        {
            Get local_66;
            bool local_32;
            if (bPerEntityQuest && !((ForSpecificReceiverEntity == ENTITY_NULL)))
            {
                local_27 = Event.Shape.DoHitTestOnEntity(local_22, ForSpecificReceiverEntity, Event.GetTransform(), ECollisionChannel(17), local_18, DebugDrawKey_ArealStrike);
                const FC_PerfectDodge& local_62_2 = local_66.opCall();
                if (local_62_2)
                {
                    if (!(local_62_2.GetbIsDummy()) && local_62_2.GetDummyEntity().IsValid())
                    {
                        TArray<FHitTestResult> local_70;
                        local_32 = Event.Shape.DoHitTestOnEntity(local_70, local_62_2.GetDummyEntity(), Event.GetTransform(), ECollisionChannel(17), local_18, DebugDrawKey_ArealStrike);
                        if (local_32)
                        {
                            local_22.Append(local_70);
                        }
                    }
                }
            }
            else
            {
                FTransform local_60_2 = Event.GetTransform();
                if (Event.GetbIgnoreSender())
                {
                    local_2 = local_10.GetId();
                }
                else
                {
                    local_2 = ENTITY_ID_NULL;
                }
                local_27 = Event.Shape.DoHitTest(local_22, this.GetWorld(), local_2);
            }
        }
        if (local_27)
        {
            FECSEntityId local_71;
            bool local_32;
            Has local_6;
            if (!(Event.AttackInfo.AttackData.IsValid()))
            {
                return false;
            }
            TDataObjectPtr<FAttackData> local_100 = TDataObjectPtr<FAttackData>(local_76);
            FVector local_108(Event.StrikeEventData.StrikeDirection);
            TMap<FECSEntityId, FHitTestEvaluateResult> local_128;
            FTransform local_152;
            for (auto& local_166 : local_22)
            {
                FECSEntity local_174 = ::FCombatUtils::GetFinalHitEntity(local_166.HitEntity);
                if (!((ForSpecificReceiverEntity == ENTITY_NULL)) && !((ForSpecificReceiverEntity == local_174)))
                {
                    continue;
                }
                bool local_1_2 = Event.GetbIgnorePlayerAndCreatePerEntityQuest() && !(bPerEntityQuest);
                if (!(local_1_2))
                {
                    local_1_2 = false;
                }
                else
                {
                    Has local_178;
                    local_1_2 = local_178.opCall();
                }
                if (local_1_2)
                {
                    continue;
                }
                if (!((FECSEntity(Event.OnlyHitPlayerEntity) == ENTITY_NULL)) && !(this.CheckEntityControlledByPlayer(local_174, Event.OnlyHitPlayerEntity)))
                {
                    continue;
                }
                if (!((FECSEntity(Event.IgnoreHitPlayerEntity) == ENTITY_NULL)) && this.CheckEntityControlledByPlayer(local_174, Event.IgnoreHitPlayerEntity))
                {
                    continue;
                }
                Get local_182;
                const FC_OnlyAcceptSpecificEntityAttack& local_184 = local_182.opCall();
                if (local_184)
                {
                    if (!((FECSEntity(local_184.GetAcceptedEntity()) == Event.Sender)))
                    {
                        continue;
                    }
                }
                FHitTestCheckResult local_190 = ::FCombatUtils::CheckHitTestResult(local_10, TDataObjectPtr<FAttackData>(local_76), EAttackType(local_102.AttackType), local_102.AttackTag, uint8(int(local_102.AffectFactionRelation)), local_166, Event.HitTestProtectData);
                local_1_2 = (int(local_190.CheckResult) == 0 || (int(local_190.CheckResult) == 9)) && local_174.IsValid();
                if (local_1_2)
                {
                    if (local_22.Num() == 1)
                    {
                        FHitTestEvaluateResult local_212;
                        local_212.HitResultLocation = local_166.Location;
                        local_212.HitPoint = local_166.HitPoint;
                        local_212.HitBoxDataIndex = int(local_166.HitBoxDataIndex);
                        local_212.HitTestCheckResult = local_190;
                        Get local_218;
                        local_214 = local_218.opCall();
                        if (local_214)
                        {
                            local_212.BodyPartData = local_214.BodyPartData;
                        }
                        local_128.Add(local_174.GetId(), local_212);
                        FECSDebugDraw::DrawDebugSphere(DebugDrawKey_ArealStrikeHit, local_166.HitPoint, 5.0f, 12, FColor::Orange, FColor::Orange, 5.0f, uint8(10), 0.0f);
                    }
                    else
                    {
                        int local_222;
                        local_222 = -1;
                        if (local_228)
                        {
                            local_222 = local_232.opCall().GetHitBoxIndex(local_228.GetHitBoxName());
                        }
                        if (local_222 != int(local_166.HitBoxDataIndex))
                        {
                            local_1_2 = false;
                        }
                        else
                        {
                            local_1_2 = local_228;
                        }
                        local_1_2 = local_1_2 && FGameAnimUtils::GetEntityHitboxTransform(local_174, local_18, local_228.GetHitBoxName(), local_152);
                        if (local_1_2)
                        {
                            Get local_244;
                            FVector local_240(local_244.opCall().GetPosition());
                            FVector local_250 = FVector(local_244.opCall().GetPosition());
                            FVector local_262 = local_152.GetLocation();
                            FVector local_276 = (local_262 - local_240).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                            FVector local_268 = (local_250 - local_240).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                            if (local_102.AttackCalculationTags.HasTag(GameplayTags::Attack_ArealDamage))
                            {
                                local_268 = (Event.GetTransform().GetLocation() - local_240).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                            }
                            FECSDebugDraw::DrawDebugLine(DebugDrawKey_ArealStrikeHit, local_240, local_262, FColor::Green, FColor::Green, 5.0f, uint8(0), 0.0f);
                            FECSDebugDraw::DrawDebugLine(DebugDrawKey_ArealStrikeHit, local_240, local_250, FColor::Yellow, FColor::Yellow, 5.0f, uint8(0), 0.0f);
                            if (local_228.GetXYAngleMax() >= ::FCombatUtils::GetHorizontalAngle(local_276, local_268) && (local_228.GetZAngleMax() >= ::FCombatUtils::GetVerticalAngle(local_276, local_268)))
                            {
                                FHitTestEvaluateResult local_212;
                                local_212.HitResultLocation = local_166.Location;
                                local_212.HitPoint = local_166.HitPoint;
                                local_212.HitBoxDataIndex = int(local_166.HitBoxDataIndex);
                                local_212.HitTestCheckResult = local_190;
                                local_212.Scroe = 1.0f;
                                if (local_214)
                                {
                                    local_212.BodyPartData = local_214.BodyPartData;
                                }
                                if (local_128.Contains(local_174.GetId()))
                                {
                                    local_71 = local_174.GetId();
                                    local_128[local_71] = local_212;
                                }
                                else
                                {
                                    local_128.Add(local_174.GetId(), local_212);
                                }
                                FECSDebugDraw::DrawDebugSphere(DebugDrawKey_ArealStrikeHit, local_166.HitPoint, 8.0f, 20, FColor::Red, FColor::Red, 5.0f, uint8(10), 0.0f);
                                break;
                            }
                        }
                        else
                        {
                            FVector local_268_2 = local_166.HitPoint;
                            FVector local_292 = (Event.GetTransform().GetLocation() + FVector(Event.SweepFromOffset));
                            FVector local_256_2 = (local_292 - (local_108 * Event.Shape.GetRadius()));
                            FVector local_250_2 = local_166.HitPoint;
                            FVector local_282 = (local_250_2 - local_292);
                            FECSDebugDraw::DrawDebugSphere(DebugDrawKey_ArealStrikeHit, local_166.HitPoint, 5.0f, 12, FColor::Orange, FColor::Orange, 5.0f, uint8(10), 0.0f);
                            local_250_2 = local_166.HitPoint;
                            FVector local_276_2 = local_166.HitPointNormal;
                            FVector local_240_2 = (local_276_2 * 100.0);
                            FECSDebugDraw::DrawDebugLine(DebugDrawKey_ArealStrikeHit, local_166.HitPoint, (local_250_2 + local_240_2), FColor::Green, FColor::Green, 5.0f, uint8(0), 0.0f);
                            if (local_166.HitPointNormal.DotProduct((Event.GetTransform().GetRotation() * FVector::ForwardVector)) > 0.0)
                            {
                                FVector local_262_2 = (Event.GetTransform().GetRotation() * FVector::UpVector);
                                local_276_2 = (local_256_2 + (local_262_2 * local_262_2.DotProduct(local_282)));
                                FHitResult local_378;
                                local_379 = false;
                                const FCollisionInPhysSceneData& local_382 = local_166.TryGetPhysSceneData(local_379);
                                if (!(local_379))
                                {
                                    continue;
                                }
                                if (FPhysicsUtils::LineTraceEntityPhysShape(local_378, EPhysicsTraceTag(18), local_382, local_276_2, local_166.HitPoint, false, false))
                                {
                                    local_268_2 = local_378.ImpactPoint;
                                    local_166.HitPoint = local_378.ImpactPoint;
                                }
                            }
                            FVector local_312 = (local_268_2 - local_256_2);
                            float32 local_219_2 = float32(local_108.DotProduct(local_312));
                            int local_386 = 0.0f;
                            if (int(Event.StrikeEventData.StrikeShape.PreferDivisionIndex) < 0)
                            {
                                FVector local_306_2 = (local_108 * local_108.DotProduct(local_312));
                                local_276_2 = (local_256_2 + local_306_2);
                                float local_285 = float32(((local_276_2 - local_268_2).Size()));
                                local_386 = int(local_285);
                            }
                            else
                            {
                                FQuat local_412;
                                FAreaStrikeShape local_414 = local_412 = (FQuat(Event.SweepFromRotation) * Event.GetTransform().GetRotation());
                                int local_417 = FMath::Clamp(int(local_414.NumDivision), 2, 16);
                                int local_415 = FMath::IntegerDivisionTrunc(local_417, 2);
                                local_276_2 = local_412.GetUpVector();
                                FVector local_306_3 = local_412.GetForwardVector().RotateAngleAxis(((local_414.Angle / local_417) * (int(local_414.PreferDivisionIndex) - local_415)), local_276_2);
                                local_276_2 = (local_306_3 * (local_306_3.DotProduct((local_268_2 - local_292))));
                                local_250_2 = (local_292 + local_276_2);
                                local_386 = int((float32(((local_250_2 - local_268_2).Size()))));
                                FVector local_262_3 = (local_306_3 * (local_306_3.DotProduct((local_268_2 - local_292))));
                                FECSDebugDraw::DrawDebugLine(DebugDrawKey_ArealStrikeHit, local_292, (local_292 + local_262_3), FColor::Cyan, FColor::Cyan, 5.0f, uint8(0), 0.0f);
                            }
                            float local_285_3 = local_219_2 + local_386;
                            FVector local_262_4 = (local_108 * local_219_2);
                            FECSDebugDraw::DrawDebugLine(DebugDrawKey_ArealStrikeHit, local_256_2, (local_256_2 + local_262_4), FColor::Purple, FColor::Purple, 5.0f, uint8(0), 0.0f);
                            FECSDebugDraw::DrawDebugSphere(DebugDrawKey_ArealStrikeHit, local_268_2, 5.0f, 12, FColor::Yellow, FColor::Yellow, 5.0f, uint8(10), 0.0f);
                            FECSDebugDraw::DrawDebugSphere(DebugDrawKey_ArealStrikeHit, local_292, 5.0f, 12, FColor::Blue, FColor::Blue, 5.0f, uint8(10), 0.0f);
                            FECSDebugDraw::DrawDebugSphere(DebugDrawKey_ArealStrikeHit, local_256_2, 5.0f, 12, FColor::Purple, FColor::Purple, 5.0f, uint8(10), 0.0f);
                            if (!(local_128.Contains(local_174.GetId())))
                            {
                                FHitTestEvaluateResult local_212;
                                if (local_214)
                                {
                                    local_212.BodyPartData = local_214.BodyPartData;
                                }
                                local_212.HitResultLocation = local_166.Location;
                                local_212.HitPoint = local_166.HitPoint;
                                local_212.HitBoxDataIndex = int(local_166.HitBoxDataIndex);
                                local_212.HitTestCheckResult = local_190;
                                local_379 = false;
                                local_422 = local_166.TryGetHitBoxData(local_379);
                                if (local_379)
                                {
                                    if (!(!(local_422.BodyPartKey.IsNone())))
                                    {
                                        local_384 = false;
                                    }
                                    else
                                    {
                                        local_384 = local_214;
                                    }
                                    if (local_384)
                                    {
                                        FCharacterBodyPartConfig local_614;
                                        if (local_214.BodyPartData.BodyParts.Find(local_422.BodyPartKey, local_614))
                                        {
                                            local_285_3 = local_285_3 / local_614.BeHitWeight;
                                            if (local_614.IsWeakness)
                                            {
                                                local_285_3 = local_285_3 * 0.8f;
                                            }
                                        }
                                    }
                                }
                                local_212.Scroe = local_285_3;
                                local_128.Add(local_174.GetId(), local_212);
                            }
                            else
                            {
                                FHitTestEvaluateResult local_616;
                                local_71 = local_174.GetId();
                                local_379 = false;
                                local_422 = local_166.TryGetHitBoxData(local_379);
                                local_618 = local_616.BodyPartData;
                                local_1_2 = local_618 != nullptr && local_379;
                                if (local_1_2 && !(local_422.BodyPartKey.IsNone()))
                                {
                                    FCharacterBodyPartConfig local_614;
                                    if (local_616.BodyPartData.BodyParts.Find(local_422.BodyPartKey, local_614))
                                    {
                                        local_285_3 = local_285_3 / local_614.BeHitWeight;
                                        if (local_614.IsWeakness)
                                        {
                                            local_285_3 = local_285_3 * 0.8f;
                                        }
                                    }
                                }
                                if (local_285_3 < local_616.Scroe)
                                {
                                    local_616.HitPoint = local_166.HitPoint;
                                    local_616.HitBoxDataIndex = int(local_166.HitBoxDataIndex);
                                    local_616.HitTestCheckResult = local_190;
                                    local_616.Scroe = local_285_3;
                                }
                            }
                            FECSDebugDraw::DrawDebugString(DebugDrawKey_ArealStrikeHit, local_268_2, FString::Format("{0}", uint(local_285_3)), FColor::White, 2.0f, FColor::White, 5.0f);
                        }
                    }
                }
                else
                {
                    local_1_2 = int(local_190.CheckResult) == 4 || (int(local_190.CheckResult) == 5);
                    local_384 = local_1_2 || (int(local_190.CheckResult) == 6);
                    local_1_2 = local_384 || (int(local_190.CheckResult) == 7);
                    if (local_1_2 || (int(local_190.CheckResult) == 8))
                    {
                        local_1_2 = int(local_190.CheckResult) == 5 || (int(local_190.CheckResult) == 6);
                        if (local_1_2 || (int(local_190.CheckResult) == 7))
                        {
                            local_384 = this.GetECSRuntime().IsServer;
                            if (local_384 || ECS::IsAuthorityOrPrediction(local_174))
                            {
                                ::FCombatUtils::AddDodgeProtectRecord(local_174, Event.HitTestProtectData, Time);
                            }
                            else
                            {
                                FECSManualBackupScope local_628 = FECSManualBackupScope(local_174);
                                local_628.BackupComponent(FC_HitTestProtectRecord);
                                ::FCombatUtils::AddDodgeProtectRecord(local_174, Event.HitTestProtectData, Time);
                            }
                            if (this.GetECSRuntime().IsServer || ECS::IsAuthorityOrPrediction(local_10))
                            {
                                if (::FCombatUtils::TryRecordHit(local_636, local_174.GetId(), EHitRecordType(1), Event.StrikeKey, Event.GetHitRequestTime(), Time, Event.HitInterval))
                                {
                                    ::FCombatUtils::MakeInvincibleCounterEvent(local_174, local_10, local_190.CheckResult, Time, Event.GetbLocalPrediction());
                                }
                            }
                            else
                            {
                                FECSManualBackupScope local_628_2 = FECSManualBackupScope(local_10);
                                local_628_2.BackupComponent(FC_HitRecords);
                                if (::FCombatUtils::TryRecordHit(local_636, local_174.GetId(), EHitRecordType(1), Event.StrikeKey, Event.GetHitRequestTime(), Time, Event.HitInterval))
                                {
                                    ::FCombatUtils::MakeInvincibleCounterEvent(local_174, local_10, local_190.CheckResult, Time, Event.GetbLocalPrediction());
                                }
                            }
                        }
                    }
                    else
                    {
                        if (int(local_190.CheckResult) == 10)
                        {
                            local_384 = this.GetECSRuntime().IsClient;
                            if (local_384 && !(local_6.opCall()))
                            {
                                FECSManualBackupScope local_628_3 = FECSManualBackupScope(local_10);
                                local_628_3.BackupComponent(FC_HitRecords);
                                if (::FCombatUtils::TryRecordHit(local_636, local_174.GetId(), EHitRecordType(1), Event.StrikeKey, Event.GetHitRequestTime(), Time, Event.HitInterval))
                                {
                                    this.MakeHitEventByStrike(local_10, local_174, Time, Event.GetTransform(), local_166.HitPoint, local_102, Event.StrikeKey, Event.StrikeEventData, Event.HitDecalConfig, local_166.TryGetHitBoxData(local_379), false, Event.GetbLocalPrediction(), Event.bClientWaitForServerOnHit, Event.GetbNeedHitMeshPresentation(), Event.GetbAttackHitFXSpawnToStrikeCenterLine());
                                }
                            }
                            else
                            {
                                if (::FCombatUtils::TryRecordHit(local_636, local_174.GetId(), EHitRecordType(1), Event.StrikeKey, Event.GetHitRequestTime(), Time, Event.HitInterval))
                                {
                                    this.MakeHitEventByStrike(local_10, local_174, Time, Event.GetTransform(), local_166.HitPoint, local_102, Event.StrikeKey, Event.StrikeEventData, Event.HitDecalConfig, local_166.TryGetHitBoxData(local_379), false, Event.GetbLocalPrediction(), Event.bClientWaitForServerOnHit, Event.GetbNeedHitMeshPresentation(), Event.GetbAttackHitFXSpawnToStrikeCenterLine());
                                }
                            }
                        }
                        else
                        {
                            if (int(local_190.CheckResult) == 11)
                            {
                                if (int(local_102.HitLevel) >= 2)
                                {
                                    FCE_DestructibleHitEvent local_648;
                                    local_648.Receiver = local_174;
                                    local_648.ImpactType = EImpactType(local_102.ImpactType);
                                    local_648.ImpactStrength = EImpactStrength(local_102.ImpactStrengthValue);
                                    local_648.ForceDirection = this.GetImpactDir(local_10, Event, local_166, local_102);
                                    local_648.DestructibleDamageLevel = local_102.GetDestructibleClassLevelFromDamage(local_10);
                                }
                            }
                            else
                            {
                                if (int(local_190.CheckResult) == 1)
                                {
                                    local_639 = ECS::GetRuntimeInfo().IsServer;
                                    if (local_639)
                                    {
                                        FSimpleDestructibleBreakResult local_688;
                                        if (::SimpleDestructibleUtils::ServerTryBreakFromHitResult(local_10, local_166.HitComponent.Get(), int(local_166.HitItemIndex), local_102.GetDestructibleClassLevelFromDamage(local_10), true, EImpactType(local_102.ImpactType), EImpactStrength(local_102.ImpactStrengthValue), this.GetImpactDir(local_10, Event, local_166, local_102), local_688))
                                        {
                                            if (local_688.bWasAlreadyDestroyed)
                                            {
                                                continue;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            for (auto& local_708 : local_128)
            {
                FECSEntity local_174_2 = FECSEntity(local_708.GetKey());
                local_379 = false;
                bool local_1_3 = this.GetECSRuntime().IsClient;
                if (local_1_3 && !(local_6.opCall()))
                {
                    XLog(ELog(42), FString().Append("ManualBackup SenderId: '").Append(local_10.GetIdValue()).Append("', Name: '").Append(local_10.GetEntityName().ToString()).Append("'."));
                    FECSManualBackupScope local_628_4 = FECSManualBackupScope(local_10);
                    local_628_4.BackupComponent(FC_HitRecords);
                    local_379 = ::FCombatUtils::TryRecordHit(local_636, local_708.GetKey(), EHitRecordType(1), Event.StrikeKey, Event.GetHitRequestTime(), Time, Event.HitInterval);
                }
                else
                {
                    local_379 = ::FCombatUtils::TryRecordHit(local_636, local_708.GetKey(), EHitRecordType(1), Event.StrikeKey, Event.GetHitRequestTime(), Time, Event.HitInterval);
                }
                if (local_379)
                {
                    if (CVar_HitTest_HitFrameDebug.GetBool())
                    {
                        local_26.Add(local_708.GetKey());
                    }
                    ::FCombatUtils::AddMultiStrikeProtectRecord(local_174_2, Event.HitTestProtectData, Time);
                    ::FCombatUtils::AddForceHitInvincibleRecord(local_174_2, Event.HitTestProtectData, Time);
                    FHitBoxData local_772;
                    if (local_708.GetValue().HitBoxDataIndex >= 0)
                    {
                        const FC_HitBoxConfig& local_774 = local_232.opCall();
                        if (local_774)
                        {
                            if (local_708.GetValue().HitBoxDataIndex < local_774.HitBoxDatas.Num())
                            {
                                local_772 = local_774.HitBoxDatas[local_708.GetValue().HitBoxDataIndex];
                            }
                        }
                    }
                    local_1_3 = false;
                    local_778 = local_708.GetValue().BodyPartData;
                    if (local_778 != nullptr && !(local_772.BodyPartKey.IsNone()))
                    {
                        if (local_708.GetValue().BodyPartData.BodyParts.Contains(local_772.BodyPartKey))
                        {
                            local_639 = local_708.GetValue().BodyPartData.BodyParts[local_772.BodyPartKey].IsWeakness;
                        }
                    }
                    bool local_638 = Event.GetbAttackHitFXSpawnToStrikeCenterLine();
                    local_32 = Event.GetbNeedHitMeshPresentation();
                    local_384 = Event.bClientWaitForServerOnHit;
                    local_639 = bPerEntityQuest || Event.GetbLocalPrediction();
                    FTransform local_60_3 = Event.GetTransform();
                    if (ECS::IsAuthorityOrPrediction(local_174_2))
                    {
                        if (int(local_708.GetValue().HitTestCheckResult.CheckResult) == 9)
                        {
                            ::FCombatUtils::MakeInvincibleCounterEvent(local_174_2, local_10, EHitTestCheckResult(9), Time, Event.GetbLocalPrediction());
                        }
                        else
                        {
                            FCE_HitEvent local_780;
                            local_1_3 = Event.GetbIgnorePlayerAndCreatePerEntityQuest();
                            FECSEntity local_786 = local_10;
                            Get local_790;
                            const FC_AttackerAttributeValueProvider& local_792 = local_790.opCall();
                            if (local_792)
                            {
                                if (local_792.GetProviderEntity().IsValid())
                                {
                                    local_786 = local_792.GetProviderEntity();
                                }
                            }
                            bool local_638_2 = ::FDamageUtils::IsDamageToAvatar(local_174_2);
                            local_32 = false;
                            ::FDamageUtils::CalcAttackRecoverEnergyValue(local_10, local_102, Time, Event.ContetxCapabilityId);
                            FAttackBaseDamageValue local_809;
                            if (local_638_2)
                            {
                                local_809 = Event.DamageToAvatar;
                            }
                            else
                            {
                                local_809 = Event.Damage;
                            }
                            ::FCombatUtils::DamageTargetByHit(local_10, local_10, local_174_2, this.GetECSRuntime().IsServer, local_780.StrikeKey, int(local_780._base_FECSEvent), Event.AttackInfo, local_809);
                        }
                    }
                    local_28 = true;
                }
            }
        }
        if (CVar_HitTest_HitFrameDebug.GetBool())
        {
            this.RecordMeleeStrikeHitDebug(Event, FixedTime, Time, bPerEntityQuest, local_26);
        }
        if (!(Event.GetbPerEntityQuest()))
        {
            if (local_816 && local_816.AttackIdentifierSet.Contains(Event.AttackIdentifier))
            {
                local_822.AttackIdentifier = Event.AttackIdentifier;
                local_822.StrikeEventData = Event.StrikeEventData;
                local_822.HitDecal = Event.HitDecalConfig;
                local_816.AttackIdentifierSet.Remove(Event.AttackIdentifier);
            }
        }
        return local_28;
    }
    UFUNCTION()
    void Job_RemoveEnvSurfaceImpactFXRecord(const FCE_EnvSurfaceImpactFXRecordToRemove &inout RecordToRemove) const
    {
        Modify local_4;
        FC_EnvSurfaceImpactFXRecord& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.AttackIdentifierSet = local_6.AttackIdentifierSet.Difference(RecordToRemove.AttackIdentifierSet);
        }
        return;
    }
    UFUNCTION()
    void Job_CalcArealStrikeHitTestBaseDamage(FCE_ArealStrikeRequestEvent &inout Event) const
    {
        bool local_7;
        int local_34 = 0;
        if (!(Event.Sender.IsValid()))
        {
            local_7 = true;
        }
        else
        {
            Has local_6;
            local_7 = this.GetECSRuntime().IsClient && !(local_6.opCall());
        }
        if (local_7)
        {
            return;
        }
        if (!(Event.AttackInfo.AttackData))
        {
            return;
        }
        TDataObjectPtr<FAttackData> local_32 = TDataObjectPtr<FAttackData>(Event.AttackInfo.AttackData);
        Event.Damage = ::FDamageUtils::CalcAttackBaseDamageValue(Event.Sender, local_34, Event.Time, false, FCapabilityInstanceId());
        Event.DamageToAvatar = ::FDamageUtils::CalcAttackBaseDamageValue(Event.Sender, local_34, Event.Time, true, FCapabilityInstanceId());
        return;
    }
    UFUNCTION()
    void Job_ArealStrikeHitTest(const FCE_ArealStrikeRequestEvent &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        this.HandleArealStrike(Event, FixedTime, false, ENTITY_NULL, Event.Time);
        return;
    }
    FFPTime CalculateOffsetTime(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime) const
    {
        GetDefaulted local_4;
        return local_4.opCall().GetOffsetTime((FixedTime.Frame - 1));
    }
    void CalcFilterTime(const FECSEntity &inout Entity, FC_ArealStrikeTimeFilter &inout TimeFilter, const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_4 = this.CalculateOffsetTime(Entity, FixedTime);
        if (FFPTime(TimeFilter.GetCurFilterTime()).opCmp(0.0) > 0)
        {
            if (FFPTime(TimeFilter.GetLastFilterTime()).opCmp(TimeFilter.GetCurFilterTime()) < 0)
            {
                TimeFilter.SetLastFilterTime(TimeFilter.GetCurFilterTime());
            }
        }
        else
        {
            TimeFilter.SetLastFilterTime((FFPTime(FixedTime.LastTime) - local_4));
        }
        TimeFilter.SetCurFilterTime(((FFPTime(FixedTime.Time) - local_4) - FECSWorld::FixedFrameInterval));
        return;
    }
    void GetFilterTime(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, FFPTime &inout OutLastFilterTime, FFPTime &inout OutCurFilterTime) const
    {
        Has local_4;
        int local_24 = 0;
        if (!(local_4.opCall()))
        {
            FC_ArealStrikeTimeFilter local_18;
            Assign local_10;
            this.CalcFilterTime(Entity, local_10.opCall(local_18), FixedTime);
        }
        OutLastFilterTime = local_24.GetLastFilterTime();
        OutCurFilterTime = local_24.GetCurFilterTime();
        return;
    }
    UFUNCTION()
    void Job_ArealStrikeTimeFilterUpdate(const FECSEntity &inout Entity, FC_ArealStrikeTimeFilter &inout TimeFilter, const FCS_FixedTime &inout FixedTime) const
    {
        this.CalcFilterTime(Entity, TimeFilter, FixedTime);
        return;
    }
    UFUNCTION()
    void Job_ArealStrikeHitTestForPlayer(const FCE_PerReceiverArealStrikeRequest &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        Has local_6;
        if (!(Event.Sender.IsValid()) || !(local_6.opCall()))
        {
            return;
        }
        FFPTime local_10 = FFPTime();
        FFPTime local_10_2 = -1;
        FFPTime local_14 = FFPTime();
        FFPTime local_14_2 = -1;
        this.GetFilterTime(Event.Sender, FixedTime, local_10_2, local_14_2);
        bool local_15 = false;
        if (int(Event.CreatedFrame) == int(FixedTime.Frame) || (int(Event.CreatedFrame) == (FixedTime.Frame - 1) && Event.IsCreatedAfterCurrentJob()))
        {
            FFPTime local_20 = FFPTime(Event.Time);
            if (local_20.opCmp(local_10_2) >= 0 && ((FFPTime(Event.Time).opCmp(local_14_2) <= 0)))
            {
                local_15 = true;
            }
        }
        else
        {
            FFPTime local_20_2 = FFPTime(Event.Time);
            if (local_20_2.opCmp(local_10_2) > 0 && ((FFPTime(Event.Time).opCmp(local_14_2) <= 0)))
            {
                local_15 = true;
            }
        }
        if (local_15)
        {
            FECSWorldPtr local_22 = this.GetECSWorld();
            GetEvent local_26 = FECSWorldPtr::GetEvent(local_22);
            this.HandleArealStrike(local_26.opCall(Event.ArealStrikeRequestEventId), FixedTime, true, Event.Sender, FixedTime.LastTime);
            if (this.GetECSRuntime().IsServer)
            {
                FECSWorldPtr local_22_2 = this.GetECSWorld();
                ModifyOrAdd local_30;
                local_30.opCall().EventIds.Add(Event.EventId);
            }
        }
        Modify local_34;
        FC_ArealStrikeTimeFilter& local_36 = local_34.opCall();
        if (local_36)
        {
            local_36.SetLastEventCheckJobTime(FixedTime.Time);
        }
        return;
    }
    UFUNCTION()
    void Job_ArealStrikeTimeFilterFlush(const FECSEntity &inout Entity, FC_ArealStrikeTimeFilter &inout FilterTime, const FCS_FixedTime &inout FixedTime) const
    {
        if (FFPTime(FilterTime.GetLastEventCheckJobTime()).opCmp((FFPTime(FixedTime.Time) - FFPTime(1))) < 0)
        {
            Remove local_16;
            local_16.opCall();
        }
        return;
    }
    UFUNCTION()
    void Job_ClearPerReceiverArealStrikeRequest(const FCS_PerReceiverArealStrikeRequestClear &inout ClearRequest) const
    {
        auto local_6 = ClearRequest.EventIds.Iterator();
        for (; local_6.CanProceed;)
        {
            this.GetECSWorld().RemoveEvent(FCE_PerReceiverArealStrikeRequest, local_6.Proceed());
        }
        FECSWorldPtr local_18 = this.GetECSWorld();
        Remove local_24;
        local_24.opCall();
        return;
    }
    UFUNCTION()
    void Job_AssignProjectileMeleeStrike(FCE_ArealStrikeRequestEvent &inout Event) const
    {
        int local_8 = 0;
        int local_14 = 0;
        if ((FECSEntityId(Event.CollisionEntityId) == ENTITY_ID_NULL))
        {
            return;
        }
        if (!(FECSEntity(Event.CollisionEntityId)))
        {
            return;
        }
        if ((!(local_8) || !(local_14)))
        {
            return;
        }
        Event.TransformPos = local_14.GetPosition();
        Event.TransformRot = FQuat4f(local_14.GetRotation());
        GetDefaulted local_28;
        float32 local_29 = local_28.opCall().GetUniformScale();
        Event.SweepFromOffset = FVector3f(local_8.GetDeltaMovement().opNeg());
        Event.SweepFromRotation = FQuat4f(local_14.GetRotation());
        Event.StrikeEventData.StrikeDirection = local_8.GetDeltaMovement().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        return;
    }
    UFUNCTION()
    void Job_DelayArealStrike(const FECSEntity &inout Entity, const FC_Transform &inout Transform, FC_DelayArealStrike &inout DelayArealStrike, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_5;
        Remove local_30;
        FECSEntity local_4 = Entity;
        Has local_10;
        while (local_4)
        {
            if (!(local_10.opCall()))
            {
                local_5 = false;
            }
            else
            {
                Has local_14;
                local_5 = local_14.opCall();
            }
            if (local_5)
            {
                break;
            }
            Get local_20;
            const FC_Owner& local_22 = local_20.opCall();
            if (local_22)
            {
                local_4 = local_22.GetOwnerEntity();
            }
        }
        if (!(local_4.IsValid()))
        {
            local_30.opCall();
            return;
        }
        FFPTime local_32 = FixedTime.Time;
        if (DelayArealStrike.DelayTime.opCmp(0.0) > 0)
        {
            local_32 += DelayArealStrike.DelayTime;
        }
        SendEvent local_42;
        FCE_ArealStrikeRequestEvent& local_44 = local_42.opCall(local_32);
        if (local_44)
        {
            local_44.TransformPos = (FVector(Transform.GetPosition()) + Transform.GetRotation().RotateVector(DelayArealStrike.PostionOffset));
            local_44.TransformRot = FQuat4f(Transform.GetRotation());
            local_44.SweepFromOffset = FVector3f::ZeroVector;
            local_44.Shape = DelayArealStrike.HitTestShape;
            local_44.AttackInfo.AttackData = DelayArealStrike.AttackData;
            local_44.StrikeEventData.StrikeShape = DelayArealStrike.StrikeShape;
            local_44.StrikeEventData.StrikeDirection = Transform.GetRotation().RotateVector(FVector(DelayArealStrike.StrikeDirection));
        }
        local_30.opCall();
        return;
    }
    UFUNCTION()
    void Job_ClearHitTestProtectRecord(const FECSEntity &inout Entity, FC_HitTestProtectRecord &inout HitTestProtectRecord, const FCS_FixedTime &inout FixedTime) const
    {
        TArray<FName> local_4;
        for (auto& local_24 : HitTestProtectRecord.GetDodgeProtect())
        {
            FFPTime local_26 = local_24.GetValue();
            if (local_26.opCmp(FixedTime.Time) < 0)
            {
                local_4.Add(local_24.GetKey());
            }
        }
        for (auto& local_42 : local_4)
        {
            HitTestProtectRecord.GetModify_DodgeProtect().Remove(local_42);
        }
        local_4.Reset(0);
        for (auto& local_24_2 : HitTestProtectRecord.GetMultiStrikeProtect())
        {
            FFPTime local_26_2 = local_24_2.GetValue();
            if (local_26_2.opCmp(FixedTime.Time) < 0)
            {
                local_4.Add(local_24_2.GetKey());
            }
        }
        for (auto& local_42 : local_4)
        {
            HitTestProtectRecord.GetModify_MultiStrikeProtect().Remove(local_42);
        }
        local_4.Reset(0);
        for (auto& local_24_3 : HitTestProtectRecord.GetForceHitInvincible())
        {
            FFPTime local_26_3 = local_24_3.GetValue();
            if (local_26_3.opCmp(FixedTime.Time) < 0)
            {
                local_4.Add(local_24_3.GetKey());
            }
        }
        for (auto& local_42 : local_4)
        {
            HitTestProtectRecord.GetModify_ForceHitInvincible().Remove(local_42);
        }
        if (HitTestProtectRecord.GetDodgeProtect().IsEmpty() && HitTestProtectRecord.GetMultiStrikeProtect().IsEmpty() && HitTestProtectRecord.GetForceHitInvincible().IsEmpty())
        {
            Remove local_48;
            local_48.opCall();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RemoveEnvSurfaceImpactFXRecord() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EnvSurfaceImpactFXRecordToRemove> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EnvSurfaceImpactFXRecordToRemove& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_RemoveEnvSurfaceImpactFXRecord(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CalcArealStrikeHitTestBaseDamage() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_ArealStrikeRequestEvent> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_ArealStrikeRequestEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_CalcArealStrikeHitTestBaseDamage(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ArealStrikeHitTest() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ArealStrikeRequestEvent> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_ArealStrikeRequestEvent& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_ArealStrikeHitTest(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ArealStrikeTimeFilterUpdate() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_ArealStrikeTimeFilterUpdate(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_ArealStrikeTimeFilterUpdate(local_174, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ArealStrikeHitTestForPlayer() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventIterator<FCE_PerReceiverArealStrikeRequest> local_40 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(3)).Iterator();
        for (; local_40.CanProceed;)
        {
            FCE_PerReceiverArealStrikeRequest& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            local_64.NoTimeFilterOverrideKeepHistoryDuration = FFPTime(1);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.Job_ArealStrikeHitTestForPlayer(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ArealStrikeTimeFilterFlush() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_ArealStrikeTimeFilterFlush(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_ArealStrikeTimeFilterFlush(local_174, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearPerReceiverArealStrikeRequest() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.Job_ClearPerReceiverArealStrikeRequest(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_AssignProjectileMeleeStrike() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_ArealStrikeRequestEvent> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_ArealStrikeRequestEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_AssignProjectileMeleeStrike(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_DelayArealStrike() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_180 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_DelayArealStrike(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_DelayArealStrike> local_56;
                local_56.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_94.Iterator();
        for (; local_142.CanProceed;)
        {
            local_40 = local_142.Proceed();
            ++local_108;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_DelayArealStrike(local_180, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_DelayArealStrike>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearHitTestProtectRecord() const
    {
        int local_12 = 0;
        const FECSEntity& local_44;
        int local_46 = 0;
        MarkModifiedIfDirty local_54;
        int local_178 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(5.0))))
        {
            return;
        }
        int local_14 = 0;
        int local_13 = local_14;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_20 = local_4.GetViewCacheEntities();
            int local_21 = 0;
            for (auto& local_36 : local_20)
            {
                local_36;
                FECSEntity local_40;
                if (!(local_40.IsValid()))
                {
                    continue;
                }
                ++local_21;
                FECSEntityScopeCycleCounter local_41 = FECSEntityScopeCycleCounter(local_40);
                this.Job_ClearHitTestProtectRecord(local_44, local_46, local_12);
                local_54.opCall(local_46);
            }
            local_4.UpdateCachedEntityCount(local_21);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_92).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_22 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_92.Iterator();
        for (; local_140.CanProceed;)
        {
            local_44 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_44.GetId());
            }
            FECSEntityScopeCycleCounter local_41_2 = FECSEntityScopeCycleCounter(local_44);
            this.Job_ClearHitTestProtectRecord(local_178, local_46, local_12);
            local_54.opCall(local_46);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_22);
        }
        return;
    }
}

void CMD_EnableDebugDrawArealStrike(const TArray<FString> &inout Arguments)
{
    if (Arguments.Num() == 0 || (FString(Arguments[0]) == "1") || (Arguments[0].ToLower() == "true"))
    {
        FECSDebugDraw::SetDebugKeyEnable(DebugDrawKey_ArealStrike, true);
        return;
    }
    FECSDebugDraw::SetDebugKeyEnable(DebugDrawKey_ArealStrike, false);
    return;
}

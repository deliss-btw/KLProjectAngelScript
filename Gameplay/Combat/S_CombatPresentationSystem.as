const FConsoleVariable CVar_CombatPresentation_EnableOtherPlayerHitFx = FConsoleVariable();
const FConsoleVariable CVar_CombatPresentation_HitFxDetachTime = FConsoleVariable();

class US_CombatPresentationSystem : UECSScriptSystem
{
    US_CombatPresentationSystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    void CalculateHitInfo(const FCE_HitEvent &inout Event, float32 &inout HitAngle, float32 &inout HitFromAngle, FTransform &inout AttackerTransform, FVector &inout AttackerForwardVector, FVector &inout AttackDirectionVector) const
    {
        FC_Transform local_20;
        Get local_24;
        const FC_TransformHistory& local_26 = local_24.opCall();
        if (local_26)
        {
            local_26.GetInterpoValue(Event.Time, local_20);
        }
        else
        {
            GetDefaulted local_32;
            local_20 = local_32.opCall();
        }
        AttackerTransform = local_20.ToFTransform();
        AttackerForwardVector = AttackerTransform.GetRotation().GetForwardVector();
        AttackDirectionVector = Event.StrikeData.GetStrikeDirection();
        FC_Transform local_92;
        const FC_TransformHistory& local_26_2 = local_24.opCall();
        if (local_26_2)
        {
            local_26_2.GetInterpoValue(Event.Time, local_92);
        }
        else
        {
            GetDefaulted local_32;
            local_92 = local_32.opCall();
        }
        FVector local_104 = local_92.GetRotation().UnrotateVector(Event.StrikeData.GetStrikeDirection().opNeg());
        local_104.Z = 0.0;
        if (local_104.IsZero())
        {
            local_104 = (Event.HitPosition - local_92.GetPosition());
            local_104.Z = 0.0;
        }
        HitAngle = float32((FMath::RadiansToDegrees(FMath::Acos((FVector::ForwardVector.DotProduct(local_104.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector)))))));
        if (local_104.Y < 0.0)
        {
            HitAngle = -HitAngle;
        }
        FVector local_98 = local_92.GetRotation().UnrotateVector((FVector(local_20.GetPosition()) - local_92.GetPosition()));
        local_98.Z = 0.0;
        HitFromAngle = float32((FMath::RadiansToDegrees(FMath::Acos((local_98.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector).DotProduct(FVector::ForwardVector))))));
        if (local_98.Y < 0.0)
        {
            float32 local_109_2 = -HitFromAngle;
            HitFromAngle = local_109_2;
        }
        return;
    }
    UFUNCTION()
    void Job_HandleHitShake(const FCE_HitEvent &inout Event) const
    {
        Has local_4;
        bool local_5;
        int local_58 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        if ((!(Event.bDefended) && !(Event.bBanPresentation)))
        {
            Modify local_12;
            FC_HitReaction& local_8 = local_12.opCall();
            if (local_8)
            {
                Has local_56;
                float32 local_13 = 0.0f;
                float32 local_15 = 0.0f;
                FTransform local_40 = FTransform(FTransform::Identity);
                FVector local_46(FVector::ForwardVector);
                FVector local_52(FVector::ForwardVector);
                this.CalculateHitInfo(Event, local_13, local_15, local_40, local_46, local_52);
                local_8.SetHitAngle(local_13);
                local_8.SetHitFromAngle(local_15);
                if (!(local_56.opCall()))
                {
                    local_5 = false;
                }
                else
                {
                    local_5 = local_56.opCall();
                }
                if (local_5)
                {
                    local_58.SetHitAngle(local_13);
                    local_58.SetHitFromAngle(local_15);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleAnimHitShake(const FCE_HitEvent &inout Event) const
    {
        float32 local_6;
        if ((!(Event.bDefended) && !(Event.bBanPresentation)))
        {
            const FAttackData& local_4 = Event.AttackData.Get();
            if (local_4.HitShakeTime > 0.0f)
            {
                Has local_14;
                Has local_10;
                if (local_10.opCall() && !(local_14.opCall()))
                {
                    FC_AnimBeHitShake local_58;
                    float32 local_15 = 0.0f;
                    float32 local_16 = 0.0f;
                    FTransform local_40 = FTransform(FTransform::Identity);
                    FVector local_46(FVector::ForwardVector);
                    FVector local_52(FVector::ForwardVector);
                    this.CalculateHitInfo(Event, local_15, local_16, local_40, local_46, local_52);
                    local_58.BeHitShakeStartTime = Event.Time;
                    if (local_4.bEnableBeHitShakePause)
                    {
                        local_6 = local_4.BeHitShakePauseTime;
                    }
                    else
                    {
                        local_6 = 0.0f;
                    }
                    local_58.BeHitShakePauseDuration = local_6;
                    local_58.BeHitShakeDuration = local_4.HitShakeTime;
                    local_58.BeHitShakeRatio = local_4.HitShakeRatio;
                    local_58.BeHitShakeAngle = local_15;
                    local_58.DynamicShakeStrengthScale = local_4.DynamicShakeStrengthScale;
                    local_58.DynamicShakeTimeScale = local_4.DynamicShakeTimeScale;
                    if (local_4.bEnableBeHitShakePause)
                    {
                        local_6 = local_4.HitShakePauseStartPercent;
                    }
                    else
                    {
                        local_6 = 0.0f;
                    }
                    local_58.BeHitShakePauseStartPercent = local_6;
                    FName local_60;
                    if (Event.OverrideAnimSocket.IsNone())
                    {
                        local_60 = Event.HitBoneName;
                    }
                    else
                    {
                        local_60 = Event.OverrideAnimSocket;
                    }
                    local_58.BeHitShakeBoneName = local_60;
                    local_58.BeHitShakeBodyType = Event.HitShakeBodyType;
                    local_58.AttackerTransform = local_40;
                    local_58.AttackerForwardVector = local_46;
                    local_58.AttackDirectionVector = local_52;
                    FC_NeedUpdateHitShakeTag local_68;
                    Assign local_66;
                    local_66.opCall(local_68);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleHitCameraShake(const FCE_HitEvent &inout Event) const
    {
        if Event.bBanPresentation
        {
            return;
        }
        const FAttackData& local_4 = Event.AttackData.Get();
        FECSEntity local_8 = Event.Receiver;
        FECSEntity local_12 = Event.Attacker;
        if Event.bHitWeakness
        {
            float32 local_14;
            local_14 = local_4.HitWeaknessCameraShakeRatio;
        }
        else
        {
            float32 local_14;
            local_14 = 1.0f;
        }
        if (local_4.HitCameraShakeSelf.IsValid())
        {
            float32 local_14;
            FCameraUtils::StartCameraShakeForEntity(local_12, Event.Time, n"CombatEvent_HitCameraToSender", local_4.HitCameraShakeSelf, local_14, false);
        }
        if (local_4.HitCameraShakeTarget.IsValid())
        {
            float32 local_14;
            FCameraUtils::StartCameraShakeForEntity(local_8, Event.Time, n"CombatEvent_HitCameraToReceiver", local_4.HitCameraShakeTarget, local_14, false);
        }
        return;
    }
    UFUNCTION()
    void Job_HandleHitEffect(const FCE_HitEvent &inout Event) const
    {
        bool local_18;
        const AActor local_108;
        USceneComponent local_110;
        USceneComponent local_114;
        const AActor local_120;
        UMeshComponent local_128;
        bool local_131;
        int local_160 = 0;
        USkeletalMeshComponent local_242;
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        Has local_8;
        bool local_9 = local_8.opCall();
        if (!(local_9))
        {
            local_9 = false;
        }
        else
        {
            FECSWorldPtr local_4_2 = ECS::GetECSWorld();
            Get local_14;
            local_9 = (int(local_14.opCall().GetGameModeType()) != 0);
        }
        local_18 = !(CVar_CombatPresentation_EnableOtherPlayerHitFx.GetBool());
        bool local_1 = !(false);
        Has local_22;
        local_18 = local_18 == local_1 && !(local_22.opCall());
        local_18 = local_18 && !(local_9);
        if (local_18)
        {
            FECSEntity local_26 = Event.Attacker;
            while (local_26.IsValid())
            {
                Get local_30;
                const FC_Owner& local_32 = local_30.opCall();
                if (local_32)
                {
                    local_26 = local_32.GetOwnerEntity();
                }
                else
                {
                    break;
                }
            }
            Has local_40;
            local_1 = local_40.opCall();
            if (local_1)
            {
                FECSEntityId local_45 = local_26.GetId();
                FECSWorldPtr local_4_3 = ECS::GetECSWorld();
                Get local_44;
                if (!((local_45 == local_44.opCall().PlayerEntity.GetId())))
                {
                    return;
                }
            }
        }
        Get local_50;
        const FC_BeHitPresentationConfig& local_52 = local_50.opCall();
        if (local_52)
        {
            if (!(local_52.bShowHitFX))
            {
                return;
            }
        }
        if (Event.bBanPresentation)
        {
            return;
        }
        const FAttackData& local_54 = Event.AttackData.Get();
        FECSEntity local_26_2 = Event.Receiver;
        FECSEntity local_58 = Event.Attacker;
        FVector local_64 = Event.HitPosition;
        FVector local_76 = Event.StrikeData.GetStrikeDirection().opNeg();
        FVector local_82(FVector::ZeroVector);
        FRotator local_94 = local_76.ToOrientationRotator();
        TSoftObjectPtr<UGamePhysicalMaterial> local_104 = Event.PhysicalMaterial;
        if (Event.bNeedHitMeshPresentation)
        {
            local_108 = local_58.GetActor();
            if (local_108 != nullptr)
            {
                local_114 = local_108.GetRootComponent();
            }
            else
            {
            }
            local_110 = local_114;
            TArray<UMeshComponent> local_118;
            local_120 = local_26_2.GetActor();
            if (local_120 != nullptr)
            {
                local_118 = local_120.GetComponentsByClass(UMeshComponent);
                int local_126 = local_118.Num() - 1;
                for (; local_126 >= 0; --local_126)
                {
                    local_128 = local_118[local_126];
                    if (!(local_128.IsVisible()) || !(local_128.IsA(USkeletalMeshComponent) || local_128.IsA(UStaticMeshComponent)))
                    {
                        local_118.RemoveAtSwap(local_126);
                    }
                }
            }
            if (local_110 != nullptr && !(local_118.IsEmpty()))
            {
                bool local_157;
                FHitPresentationData local_156;
                local_157 = false;
                local_18 = local_22.opCall();
                if (local_18 && !(Event.StrikeKey.IsNone()))
                {
                    local_18 = local_160.GetHitPresentationDataFromCache(Event.StrikeKey, local_26_2, Event.Time, local_156);
                    local_157 = local_18;
                }
                if (!(local_157))
                {
                    local_131 = Event.bHitWeakness;
                    local_156 = ::FHitPresentationUtils::GetHitPresentationData(local_110, local_118, Event.StrikeData, Event.HitPosition, local_131);
                    if (local_156.HitMeshComp == nullptr)
                    {
                        local_18 = false;
                    }
                    else
                    {
                        local_18 = local_22.opCall();
                    }
                    if (!(local_18 && !(Event.StrikeKey.IsNone())))
                    {
                        local_131 = false;
                    }
                    else
                    {
                        Has local_194;
                        local_131 = local_194.opCall();
                    }
                    if (local_131)
                    {
                        Modify local_198;
                        local_198.opCall().SetHitPresentationDataFromCache(Event.StrikeKey, local_26_2, Event.Time, local_156);
                    }
                }
                if (local_156.HitMeshComp != nullptr)
                {
                    local_64 = local_156.HitLocation;
                    FRotator local_88 = FRotator::MakeFromZ(local_156.HitFanPlaneNormal);
                    local_82 = local_88.UnrotateVector(local_156.HitNormal);
                    local_82.Z = 0.0;
                    local_82 = local_88.RotateVector(local_82);
                    if (FMath::Abs(local_76.DotProduct(local_156.HitNormal)) > 0.5)
                    {
                        FVector local_230 = local_156.HitNormal.RotateAngleAxis(90.0, local_156.HitNormal.CrossProduct(local_76).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
                        local_76 = FMath::Lerp(local_76, local_230, 0.5);
                        local_94 = local_76.ToOrientationRotator();
                    }
                    FVector local_224 = local_94.UnrotateVector(local_156.HitNormal.opNeg());
                    local_224.X = 0.0;
                    if (!(local_224.IsZero()))
                    {
                        float local_212;
                        local_212 = FMath::RadiansToDegrees(FMath::Acos(local_224.GetUnsafeNormal().DotProduct(FVector::UpVector)));
                        if (local_224.Y < 0.0)
                        {
                            local_212 = -local_212;
                        }
                        local_94.Roll = local_212;
                    }
                    local_104 = (Cast<UGamePhysicalMaterial>(local_156.PhysicsMaterial));
                    if (Event.StrikeData.GetDecalConfig().IsValid())
                    {
                        local_242 = (Cast<USkeletalMeshComponent>(local_156.HitMeshComp));
                        if (local_242 != nullptr)
                        {
                            ::FHitDecalUtils::SpawnDecalByHitResult(local_242, local_156.HitBoneName, local_156.HitFanPlaneNormal, local_156.HitLocation, local_156.HitNormal, Event.StrikeData.GetStrikeDirection(), Event.StrikeData.GetDecalConfig());
                        }
                    }
                }
            }
        }
        if (Event.bAttackHitFXSpawnToStrikeCenterLine)
        {
            FVector local_218 = Event.StrikeData.GetStrikeDirection().GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            if (!(local_218.IsNearlyZero(9.999999747378752e-5)))
            {
                FVector local_224_2(Event.StrikeData.GetCustomStrikeTransformPos());
                FVector local_230_2 = (local_64 - local_224_2);
                float local_210 = local_230_2.DotProduct(local_218);
                local_64 = (local_224_2 + (local_218 * local_210));
            }
        }
        FFPTime local_244 = FFPTime(this.GetECSRuntime().Time);
        Get local_248;
        const FC_InterpoTime& local_250 = local_248.opCall();
        if (local_250)
        {
            local_244 = local_250.Time;
        }
        FCE_ImpactFXEvent local_256;
        local_256.SetbPredictable(Event.GetbLocalCreated());
        local_256.ImpactPosition = Event.HitPosition;
        local_256.ImpactOutDir = local_82;
        local_256.ImpactType = EImpactType(local_54.ImpactType);
        local_256.ImpactStrength = EImpactStrength(local_54.ImpactStrengthValue);
        local_256.bDurational = true;
        local_256.ImpactPosition = local_64;
        local_256.ImpactRotation = FRotator3f(local_94);
        local_256.PhysicalMaterial = local_104;
        local_256.ImpactSFXEvent = local_54.ImpactSFXEvent;
        if ((int(local_54.FXConfigType)) == 1)
        {
            local_256.bHasVFX = false;
            local_256.bHasSFX = local_54.bEnableImpactSFX;
        }
        else
        {
            local_256.bHasVFX = local_54.bEnableImpactVFX;
            local_256.bHasSFX = local_54.bEnableImpactSFX;
        }
        local_256.TargetEntity = Event.Receiver;
        if ((Event.bHitWeakness && (local_54.bUseDefaultHitWeaknessFX || local_54.HitWeaknessFXAsset.IsValid())))
        {
            FFXConfig local_380 = local_54.HitFXConfig;
            FSoftClassPath local_390;
            if (local_54.bUseDefaultHitWeaknessFX)
            {
                local_390 = UCombatGlobalSettingsBase::Get().DefaultHitWeaknessFXAsset;
            }
            else
            {
                local_390 = local_54.HitWeaknessFXAsset;
            }
            local_380.SetAsset(local_390);
            local_380.SetbUseWorldOriginAsBaseTransformSource(true);
            local_380.SetLocationOffsetSpace(EFXOffsetSpace(2));
            local_380.SetRotationOffsetSpace(EFXOffsetSpace(2));
            local_380.SetLocationOffset(local_64);
            local_380.SetRotationOffset(local_94);
            local_380.SetbDetach(true);
            if (CVar_CombatPresentation_HitFxDetachTime.GetFloat() > 0.0f)
            {
                local_380.SetbDetach(false);
                local_380.SetAutoDetachTime(CVar_CombatPresentation_HitFxDetachTime.GetFloat());
            }
            ECSFX::PlayFXDurationalEx(local_58, local_380, local_244, 1.0f, false, Event.Receiver, EAttachFXStopMethod(0), false);
        }
        if ((int(local_54.FXConfigType)) == 0 || (int(local_54.FXConfigType) == 1 && !(local_54.HitFXConfig.IsValid())))
        {
            return;
        }
        FFXConfig local_380_2 = local_54.HitFXConfig;
        local_380_2.SetbUseWorldOriginAsBaseTransformSource(true);
        local_380_2.SetLocationOffsetSpace(EFXOffsetSpace(2));
        local_380_2.SetRotationOffsetSpace(EFXOffsetSpace(2));
        local_380_2.SetLocationOffset(local_64);
        local_380_2.SetRotationOffset(local_94);
        local_380_2.SetbDetach(true);
        if (CVar_CombatPresentation_HitFxDetachTime.GetFloat() > 0.0f)
        {
            local_380_2.SetbDetach(false);
            local_380_2.SetAutoDetachTime(CVar_CombatPresentation_HitFxDetachTime.GetFloat());
        }
        ECSFX::PlayFXDurationalEx(local_58, local_380_2, local_244, 1.0f, false, Event.Receiver, EAttachFXStopMethod(0), false);
        return;
    }
    UFUNCTION()
    void Run_Job_HandleHitShake() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HitEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HitEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleHitShake(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleAnimHitShake() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HitEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HitEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleAnimHitShake(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleHitCameraShake() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HitEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HitEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleHitCameraShake(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleHitEffect() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_HitEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_HitEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleHitEffect(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

namespace FHitDecalUtils
{
void SpawnDecalByHitResult(const USkeletalMeshComponent SkelMeshComp, const FName &inout HitBoneName, const FVector &inout FanPlaneNormal, const FVector &inout HitLocation, const FVector &inout HitNormal, const FVector &inout HitFromDir, const FDataObjectPtr &inout DecalCfgTableRow)
{
    if (!(DecalCfgTableRow.IsValid()))
    {
        XError(ELog(0), "[HitDecal] Null data table row.");
        return;
    }
    if (!((TDataObjectPtr<FHitDecalConfig>(DecalCfgTableRow))))
    {
        XError(ELog(0), (FString("[HitDecal] Can not find table row: ") + DecalCfgTableRow.GetDataName().ToString()));
        return;
    }
    TDataObjectPtr<FHitDecalConfig> local_26 = TDataObjectPtr<FHitDecalConfig>(DecalCfgTableRow);
    FVector local_54 = FanPlaneNormal.CrossProduct(HitNormal);
    local_54 *= FMath::Sign(local_54.DotProduct(HitFromDir));
    FHitDecalConfig local_42;
    bool local_1 = local_42.bFadeOutByTime;
    FHitDecalScriptUtils::AddHitDecal(SkelMeshComp, HitBoneName, int(local_42.DecalTextureID), HitLocation, local_54, HitNormal, local_42.Size, local_42.Duration, local_42.InitOpacity, local_1, local_42.FadeStartTime, local_42.Emissive);
    return;
}
}

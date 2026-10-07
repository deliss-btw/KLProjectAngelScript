
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
            const FAttackData& local_4;
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
        const FAttackData& local_4;
        if (Event.bBanPresentation)
        {
            return;
        }
        FECSEntity local_8 = Event.Receiver;
        FECSEntity local_12 = Event.Attacker;
        if (Event.bHitWeakness)
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
        // body not fully recovered вЂ” stub [unresolved-operand]
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
        FString local_36 = "[HitDecal] Can not find table row: ";
        FString local_32 = DecalCfgTableRow.GetDataName().ToString();
        return;
    }
    TDataObjectPtr<FHitDecalConfig> local_26 = TDataObjectPtr<FHitDecalConfig>(DecalCfgTableRow);
    FVector local_54 = FanPlaneNormal.CrossProduct(HitNormal);
    local_54 *= FMath::Sign(local_54.DotProduct(HitFromDir));
    FHitDecalConfig local_42;
    FHitDecalScriptUtils::AddHitDecal(SkelMeshComp, HitBoneName, int(local_42.DecalTextureID), HitLocation, local_54, HitNormal, local_42.Size, local_42.Duration, local_42.InitOpacity, local_42.bFadeOutByTime, local_42.FadeStartTime, int(local_42.Emissive));
    return;
}
}



struct FESMAimControlInstanceData
{
    UPROPERTY()
    bool bShowCastHint = false;


}

UCLASS(Abstract)
class UESMAction_AimControl : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    int Priority = 0;
    UPROPERTY()
    FESMBBVar_Bool ForceAim = false;
    UPROPERTY()
    FGameplayTag DisallowAimTag;
    UPROPERTY()
    bool bShowCrosshair = true;
    UPROPERTY()
    ULockTargetConfig LockTargetConfig;
    UPROPERTY()
    bool bReSoftLockTargetWhenEnterStrafe = false;
    UPROPERTY()
    bool bOverrideMaxDistance = false;
    UPROPERTY()
    FESMBBVar_Float OverrideMaxDistance = 0.0f;
    UPROPERTY()
    UESMInputTriggerAsset AimInput;
    UPROPERTY()
    FDataObjectPtr CameraModifier;
    UPROPERTY()
    bool bApplyAimModifierAnyway = false;
    UPROPERTY()
    bool bOverrideModifier = false;
    UPROPERTY()
    FDataObjectPtr OverrideCameraModifier;
    UPROPERTY()
    FESMBBVar_Float AimMoveSpeedScale = 1.0f;
    UPROPERTY()
    bool bAimAssist = false;
    UPROPERTY()
    bool bEnableViewTurnSpeedLimit = false;
    UPROPERTY()
    float32 MaxViewTurnSpeed = 180.0f;
    UPROPERTY()
    TArray<FSkillCastHintData> CastHintDatas;


    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMAimControlInstanceData);
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        int local_4;
        if (this.CastHintDatas.Num() > 0)
        {
            local_4 = 3;
        }
        else
        {
            local_4 = 1;
        }
        return EESMActionType(local_4);
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [unresolved-operand]
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_26 = 0;
        bool local_27;
        int local_34 = 0;
        int local_52 = 0;
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        bool local_5 = false;
        bool local_6 = local_5;
        Get local_10;
        const FC_CharacterAimControl& local_12 = local_10.opCall();
        if (local_12)
        {
            if (!((local_12.GetCurrentDataSource() == NAME_None)) && !((local_12.GetCurrentDataSource() == this.GetDataPathName())) && (local_12.GetCurrentPriority() >= this.Priority))
            {
                return;
            }
            if ((local_12.GetCurrentDataSource() == this.GetDataPathName()))
            {
                local_6 = true;
            }
        }
        local_27 = local_26.GetbIsAiming();
        if (local_27)
        {
            if (this.bShowCrosshair)
            {
                local_34.SetbIsShow(false);
            }
        }
        this.UpdateAimChange(Context, Time, Time.WorldTime, local_27, false, false);
        if (local_27)
        {
            Modify local_38;
            local_38.opCall().SetbIsAiming(false);
        }
        if (local_6)
        {
            Remove local_42;
            local_42.opCall();
        }
        if (!(this.bEnableViewTurnSpeedLimit))
        {
            local_5 = false;
        }
        else
        {
            Has local_46;
            local_5 = local_46.opCall();
        }
        if (local_5)
        {
            local_52.SetCounter((local_52.GetCounter() - 1));
        }
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_3;
        Has local_20;
        if (this.CastHintDatas.Num() == 0)
        {
            return;
        }
        if (!((::FASCommonUtils::GetLocalPlayerPawnEntity() == Context.GetEntity())))
        {
            return;
        }
        FESMAimControlInstanceData& local_10 = this.ModifyViewInstanceData(Context);
        Get local_14;
        const FC_CharacterAimControl& local_16 = local_14.opCall();
        if (local_16)
        {
            if (this.Priority >= local_16.GetCurrentPriority())
            {
                local_3 = !(local_10.bShowCastHint);
                if (!(local_3))
                {
                    local_3 = false;
                }
                else
                {
                    local_3 = local_20.opCall();
                }
                if (local_3)
                {
                    int local_22 = 0;
                    for (; local_22 < this.CastHintDatas.Num(); )
                    {
                        const FSkillCastHintData& local_24 = this.CastHintDatas[local_22];
                        FInputActionListConstructParamItem local_154 = FInputActionListConstructParamItem(::FSkillUIUtils::GetSkillInputAction(Context.GetEntity(), local_24), ::FSkillUIUtils::GetSkillCastHintText(local_24));
                        local_154.bOnlyShowMainKey = true;
                        ::FVMS_CommonBottomActionList::Get(Context.GetWorld()).AddAction(local_154);
                        ++local_22;
                    }
                    local_3 = true;
                    local_10.bShowCastHint = local_3;
                }
                else
                {
                    if (local_10.bShowCastHint && !(local_20.opCall()))
                    {
                        int local_22_2 = 0;
                        for (; local_22_2 < this.CastHintDatas.Num(); )
                        {
                            FSkillCastHintData local_308;
                            ::FVMS_CommonBottomActionList::Get(Context.GetWorld()).RemoveAction(::FSkillUIUtils::GetSkillInputAction(Context.GetEntity(), local_308));
                            ++local_22_2;
                        }
                        local_10.bShowCastHint = false;
                    }
                }
                return;
            }
            if (local_10.bShowCastHint)
            {
                int local_22_3 = 0;
                for (; local_22_3 < this.CastHintDatas.Num(); )
                {
                    FSkillCastHintData local_308;
                    ::FVMS_CommonBottomActionList::Get(Context.GetWorld()).RemoveAction(::FSkillUIUtils::GetSkillInputAction(Context.GetEntity(), local_308));
                    ++local_22_3;
                }
                local_3 = false;
                local_10.bShowCastHint = local_3;
            }
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.CastHintDatas.Num() == 0)
        {
            return;
        }
        if (!((::FASCommonUtils::GetLocalPlayerPawnEntity() == Context.GetEntity())))
        {
            return;
        }
        if (this.ModifyViewInstanceData(Context).bShowCastHint)
        {
            int local_11 = 0;
            for (; local_11 < this.CastHintDatas.Num(); )
            {
                FSkillCastHintData local_42;
                ::FVMS_CommonBottomActionList::Get(Context.GetWorld()).RemoveAction(::FSkillUIUtils::GetSkillInputAction(Context.GetEntity(), local_42));
                ++local_11;
            }
        }
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.bOverrideModifier == false)
        {
            this.OverrideCameraModifier = this.CameraModifier;
        }
        return;
    }
    const FESMAimControlInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMAimControlInstanceData __r;
        return __r;
    }
    FESMAimControlInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMAimControlInstanceData __r;
        return __r;
    }
    FDataObjectPtr GetActualCameraModifier() const
    {
        FDataObjectPtr __r;
        if (this.bOverrideModifier)
        {
        }
        else
        {
        }
        return __r;
    }
    void UpdateAimChange(const FESMContext &inout Context, const FESMActionTime &inout ActionTime, const FFPTime &inout Time, const bool bLastAiming, const bool bAiming, const bool bForceApplyModifier) const
    {
        int local_8 = 0;
        int local_28 = 0;
        int local_42 = 0;
        int local_140 = 0;
        bool local_1 = !(bAiming);
        bool local_2 = !(bLastAiming);
        if (local_1 != local_2)
        {
            bool local_39;
            if (bAiming)
            {
                Assign local_12;
                local_12.opCall(FC_CharacterIsAimingTag());
                int local_14 = local_8.GetKeepStrafeCounter() + 1;
                local_8.SetKeepStrafeCounter(local_14);
                int local_18 = (local_8.GetAimRotationValidCounter() + 1);
                local_8.SetAimRotationValidCounter(uint8(local_18));
                FESMTriggerUtils::ActivateESMTrigger(Context.GetEntity(), n"KeepStrafeCounterTrigger", Time, FFPTime(0.1), 0);
                if (local_28 && (int(local_28.GetType()) == 1))
                {
                    if (local_28.GetbShouldStrafe() && (local_8.GetKeepStrafeCounter() > 0) && !(local_8.GetbAdditionalStrafeCounter()))
                    {
                        local_14 = local_8.GetKeepStrafeCounter();
                        local_14 = local_14 + 1;
                        local_8.SetKeepStrafeCounter(local_14);
                        local_8.SetbAdditionalStrafeCounter(true);
                        FESMTriggerUtils::ActivateESMTrigger(Context.GetEntity(), n"KeepStrafeCounterTrigger", Time, FFPTime(0.1), 0);
                    }
                    ::FLockTargetUtils::ClearLockTarget(Context.GetEntity());
                }
            }
            else
            {
                Remove local_34;
                local_34.opCall();
                local_8.SetKeepStrafeCounter((local_8.GetKeepStrafeCounter() - 1));
                int local_18_2 = (local_8.GetAimRotationValidCounter() - 1);
                local_8.SetAimRotationValidCounter(uint8(local_18_2));
                FESMTriggerUtils::ActivateESMTrigger(Context.GetEntity(), n"KeepStrafeCounterTrigger", Time, FFPTime(0.1), 0);
                bool local_2_2 = (!(local_28) && local_8.GetbAdditionalStrafeCounter()) && ((this.LockTargetConfig != nullptr));
                bool local_1_3 = !(local_28);
                local_39 = local_1_3 && (local_8.GetStrafeWeightTarget() == 1.0f);
                bool local_1_4 = local_39 && ((this.LockTargetConfig != nullptr));
                local_39 = local_1_4 && this.bReSoftLockTargetWhenEnterStrafe;
                if (local_2_2 || local_39)
                {
                    FLockTargetOverrideInfo local_90 = ::FLockTargetUtils::GetInitOverrideInfo(Context.GetEntity(), ActionTime.WorldTime);
                    if (this.bOverrideMaxDistance)
                    {
                        local_90.bOverrideMaxLockDistance = true;
                        local_90.MaxMaxLockDistance = local_42;
                    }
                    FLockTargetResult local_122 = ::FLockTargetUtils::PickLockTargetResult(ELockTargetType(ELockTargetType(1)), Context.GetEntity(), ActionTime.WorldTime, this.LockTargetConfig.Data, local_90);
                    if (!((local_122.LockTarget == ENTITY_NULL)))
                    {
                        ::FLockTargetUtils::UpdateLockTarget(Context.GetEntity(), local_122.LockTarget, int(local_122.LockPointIndex), ELockTargetType(ELockTargetType(1)), true, (local_39 ? int(this.LockTargetConfig.Data.KeepDuration) : 0));
                    }
                }
                if (Context.GetECSRuntime().IsClient)
                {
                    if (local_28 && (int(local_28.GetType()) == 2))
                    {
                        FC_LockTargetTrigger local_134;
                        local_134.Time = Time;
                        local_134.bCanRepickNull = true;
                    }
                }
            }
        }
        FDataObjectPtr local_164 = this.GetActualCameraModifier();
        bool local_35 = bAiming || bForceApplyModifier;
        if (local_35 && !(local_140.GetCurrentAimModifier().IsValid()))
        {
            ModifyOrAdd local_218;
            TDataObjectPtr<FTPCameraModifierConfig> local_214;
            FCameraUtils::StartModifier(Context.GetEntity(), Time, this.GetDataPathName(), local_214, -1.0f);
            local_218.opCall().SetCurrentAimModifier(local_164);
        }
        else
        {
            ModifyOrAdd local_218;
            TDataObjectPtr<FTPCameraModifierConfig> local_214;
            bool local_39;
            local_39 = !(local_35);
            if (local_39 && local_140.GetCurrentAimModifier().IsValid())
            {
                (local_140.GetCurrentAimModifier().GetDataName() == local_164.GetDataName());
                FCameraUtils::StopModifier(Context.GetEntity(), Time, this.GetDataPathName(), local_214, -1.0f, true);
                local_218.opCall().SetCurrentAimModifier(FDataObjectPtr());
            }
        }
        return;
    }
}


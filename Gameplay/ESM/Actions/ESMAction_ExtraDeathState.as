
enum EExtraDeathStateTargetType
{
    Self,
    InteractTarget,
    LockTarget,
    BBValue,
}


struct FESMExtraDeathStateInstanceData
{
    UPROPERTY()
    FECSEntity TargetEntity;

    FESMExtraDeathStateInstanceData()
    {
        return;
    }
}

class UESMAction_ExtraDeathState : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bUseAsSwtich = true;
    UPROPERTY()
    bool bSwitchOnOff = true;
    UPROPERTY()
    bool bDeferDeathTransition = true;
    UPROPERTY()
    bool bHasExtraState = true;
    UPROPERTY()
    FName ExtraDeathStateName = NAME_None;
    UPROPERTY()
    EExtraDeathStateTargetType TargetType = EExtraDeathStateTargetType(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMExtraDeathStateInstanceData);
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        return this.bUseAsSwtich;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FC_DeathInfo& local_34;
        FC_DeferDeathTransition& local_44;
        FECSEntity local_4;
        if (int(this.TargetType) == 0)
        {
            local_4 = Context.GetEntity();
        }
        else
        {
            if (int(this.TargetType) == 1)
            {
                Get local_12;
                const FC_InteractionInfoForESM& local_14 = local_12.opCall();
                if (local_14)
                {
                    if (local_14.GetTargetEntity().IsValid())
                    {
                        local_4 = local_14.GetTargetEntity();
                    }
                }
            }
            else
            {
                if (int(this.TargetType) == 2)
                {
                    Get local_18;
                    const FC_LockTarget& local_20 = local_18.opCall();
                    if (local_20)
                    {
                        local_4 = local_20.GetTargetEntity();
                    }
                }
                else
                {
                    if (int(this.TargetType) == 3)
                    {
                        FNameHandle_EntityBBVarEntity local_24;
                        local_24;
                        local_4 = Context.GetEntity().GetBB_Entity(local_24);
                    }
                }
            }
        }
        if (local_4.IsValid())
        {
            if (this.bUseAsSwtich)
            {
                if (this.bSwitchOnOff)
                {
                    if (this.bHasExtraState)
                    {
                        ModifyOrAdd local_32;
                        local_34 = local_32.opCall();
                        if (local_34)
                        {
                            local_34.SetbHasExtraDeathState(false);
                            local_34.SetExtraDeathStateName(this.ExtraDeathStateName);
                        }
                    }
                }
                else
                {
                    Modify local_38;
                    local_34 = local_38.opCall();
                    if (local_34)
                    {
                        local_34.SetbHasExtraDeathState(false);
                        local_34.SetExtraDeathStateName(NAME_None);
                    }
                }
                if (this.bDeferDeathTransition)
                {
                    Modify local_42;
                    local_44 = local_42.opCall();
                    if (local_44)
                    {
                        if (this.bSwitchOnOff)
                        {
                            if (this.bDeferDeathTransition)
                            {
                                local_44.SetbDeferByAction(true);
                            }
                        }
                        else
                        {
                            local_44.SetbDeferByAction(false);
                        }
                    }
                }
            }
            else
            {
                if (this.bHasExtraState)
                {
                    local_34.SetbHasExtraDeathState(true);
                    local_34.SetExtraDeathStateName(this.ExtraDeathStateName);
                }
                if (this.bDeferDeathTransition)
                {
                    local_44.SetbDeferByAction(true);
                }
                this.ModifyInstanceData(Context).TargetEntity = local_4;
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.bUseAsSwtich)
        {
            return;
        }
        if (this.bHasExtraState)
        {
            Modify local_10;
            FC_DeathInfo& local_12 = local_10.opCall();
            if (local_12)
            {
                local_12.SetbHasExtraDeathState(false);
                local_12.SetExtraDeathStateName(NAME_None);
            }
        }
        if (this.bDeferDeathTransition)
        {
            Modify local_16;
            FC_DeferDeathTransition& local_18 = local_16.opCall();
            if (local_18)
            {
                local_18.SetbDeferByAction(false);
            }
        }
        return;
    }
    FESMExtraDeathStateInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMExtraDeathStateInstanceData __r;
        return __r;
    }
    FESMExtraDeathStateInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMExtraDeathStateInstanceData __r;
        return __r;
    }
}


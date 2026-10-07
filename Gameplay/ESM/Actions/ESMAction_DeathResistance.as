

struct FESMDeathResistanceInstanceData
{
    UPROPERTY()
    FECSEntity TargetEntity;

    FESMDeathResistanceInstanceData()
    {
        return;
    }
}

class UESMAction_DeathResistance : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bUseAsSwtich = false;
    UPROPERTY()
    bool bSwitchOnOff = true;
    UPROPERTY()
    EESMActionTargetType TargetType = EESMActionTargetType(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMDeathResistanceInstanceData);
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
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
        FC_DeathResistance& local_40;
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
        Has local_32;
        if (local_4.IsValid() && !(local_32.opCall()))
        {
            if (this.bUseAsSwtich)
            {
                if (this.bSwitchOnOff)
                {
                    local_40.SetResistanceCount((local_40.GetResistanceCount() + 1));
                }
                else
                {
                    ModifyOrAdd local_38;
                    local_40 = local_38.opCall();
                    if (local_40)
                    {
                        local_40.SetResistanceCount((local_40.GetResistanceCount() - 1));
                    }
                }
            }
            else
            {
                local_40.SetResistanceCount((local_40.GetResistanceCount() + 1));
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
        FECSEntity local_6;
        if (local_6.IsValid())
        {
            Modify local_10;
            FC_DeathResistance& local_12 = local_10.opCall();
            if (local_12)
            {
                local_12.SetResistanceCount((local_12.GetResistanceCount() - 1));
            }
        }
        return;
    }
    FESMDeathResistanceInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMDeathResistanceInstanceData __r;
        return __r;
    }
    FESMDeathResistanceInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMDeathResistanceInstanceData __r;
        return __r;
    }
}

class UESMAction_DeferredDeath : UESMBPBaseSpanAction
{
    UPROPERTY()
    FGameplayTagContainer OnlyEnterAddGameplayTags;

    UESMAction_DeferredDeath()
    {
        return;
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        const UESMState local_4 = Info.GetParentState();
        if (local_4 == nullptr)
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "Deferred Death еЏЄиѓЅж”ѕењЁеЏ—е‡» State дёЉгЂ‚");
            return;
        }
        UESMAsset::ModifyAutoCustomConfig local_10;
        UESMDeferredDeathCustomData local_14 = local_10.opCall(this);
        if (local_14 != nullptr)
        {
            local_14.StateNames.AddUnique(local_4.GetDataName());
        }
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        local_2.RemoveGameplayTag(GameplayTags::CombatState_InDeferredDeath, NAME_None);
        Modify local_6;
        FC_DeferDeathTransition& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.SetbDeferByAction(false);
        }
        return;
    }
}


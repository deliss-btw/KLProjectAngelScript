

struct FESMSyncStateInstanceData
{
    UPROPERTY()
    FECSEntity SlaveEntity;

    FESMSyncStateInstanceData()
    {
        return;
    }
}

class UESMAction_SyncState : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarEntity SlaveEntityBBVar;
    UPROPERTY()
    FName SlaveStateName;
    UPROPERTY()
    EManipulateSlaveESMSyncType SlaveStateSyncType = EManipulateSlaveESMSyncType(0);
    UPROPERTY()
    float32 SlaveStateSyncNormalizedTimeEnd = -1.0f;
    UPROPERTY()
    EESMBlackboardConditionTagQueryType CheckTagCondition = EESMBlackboardConditionTagQueryType(2);
    UPROPERTY()
    FGameplayTagContainer TagToCheck;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMSyncStateInstanceData);
    }
    UFUNCTION()
    EESMActionExitPolicy GetExitPolicy_Implementation() const
    {
        return EESMActionExitPolicy(1);
    }
    UFUNCTION()
    bool IsNotifyTypeAllowed_Implementation(const EESMNotifyType InType) const
    {
        return (int(InType) == 1);
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.IdentifyName = FName((FString("ESMAction_SyncState_") + this.SlaveEntityBBVar.Name.ToString()));
        OutParam.bExclusiveSameState = true;
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (!((Info.GetParentState() != nullptr)))
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "Sync State can only add in state.");
        }
        if ((this.SlaveStateSyncNormalizedTimeEnd >= 0.0f && (int(this.NotifyType) != 1)))
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "NotifyType can only by span if specify SlaveStateSyncNormalizedTimeEnd.");
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_40;
        FECSEntity local_4;
        if (!(local_4.IsValid()))
        {
            Has local_24;
            FNameHandle_EntityBBVarEntity local_10;
            local_10;
            local_4 = Context.GetEntity().GetBB_Entity(local_10);
            if (local_4.IsValid())
            {
                Has local_18;
                if (!(local_18.opCall()) && !(local_4.MatchGameplayTag(GameplayTags::Character_Avatar_Base)) && !(Context.GetEntity().MatchGameplayTag(GameplayTags::ESM_HitState_Death)))
                {
                    return;
                }
                if (!(local_24.opCall()))
                {
                    return;
                }
                if (!(this.CheckTagShouldSyncState(local_4)))
                {
                    return;
                }
                this.ModifyInstanceData(Context).SlaveEntity = local_4;
            }
        }
        bool local_19 = !((this.SlaveStateName == NAME_None)) && (int(this.SlaveStateSyncType) != 0) && local_4.IsValid();
        if (!(local_19))
        {
            local_19 = false;
        }
        else
        {
            Has local_24;
            local_19 = local_24.opCall();
        }
        if (local_19)
        {
            if (int(this.SlaveStateSyncType) == 1)
            {
                local_40 = float32((FFPTime(Time.ActionTime) / Time.ActionDuration));
            }
            else
            {
                local_40 = float32((FFPTime(Time.StateTime) / Context.State.GetStateLength()));
            }
            FC_ESMPlayerSlaved& local_42 = local_4.ESMSlavedStart();
            if (this.SlaveStateSyncNormalizedTimeEnd >= 0.0f)
            {
                local_40 = FMath::Lerp(0.0f, this.SlaveStateSyncNormalizedTimeEnd, local_40);
            }
            local_42.SetSlavedMasterEntity(Context.GetEntity());
            local_42.SetSlavedStateName(this.SlaveStateName);
            local_42.SetTargetStateNormalizedTime(local_40);
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_5;
        FECSEntity local_4;
        if (!(local_4.IsValid()))
        {
            local_5 = false;
        }
        else
        {
            Has local_10;
            local_5 = local_10.opCall();
        }
        if (local_5)
        {
            local_4.ESMSlavedStop();
        }
        this.ModifyInstanceData(Context).SlaveEntity = ENTITY_NULL;
        return;
    }
    FESMSyncStateInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMSyncStateInstanceData __r;
        return __r;
    }
    FESMSyncStateInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMSyncStateInstanceData __r;
        return __r;
    }
    bool CheckTagShouldSyncState(const FECSEntity &inout Entity) const
    {
        return (int(this.CheckTagCondition) == 0 && Entity.MatchAnyGameplayTags(this.TagToCheck)) || (int(this.CheckTagCondition) == 2 && !(Entity.MatchAnyGameplayTags(this.TagToCheck)));
    }
}


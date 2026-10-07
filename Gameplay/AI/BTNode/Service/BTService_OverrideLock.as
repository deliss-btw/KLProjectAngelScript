

// NOTE: class defaults are not authored in this module: FAICommand_OverrideLock (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FAICommand_OverrideLockData
{
    UPROPERTY()
    TDataObjectPtr<FAITargetingQueryConfig> QueryConfig;
    UPROPERTY()
    TArray<FAISmartEntityValue> QueryOutputs;
    UPROPERTY()
    FAITargetingQueryResult QueryResult;
    UPROPERTY()
    bool bPreferUnSelected = false;
    UPROPERTY()
    int64 QueryHandle = 0;
    UPROPERTY()
    bool bHoldTarget = true;


}

struct FAICommand_OverrideLock : FAICommandScript
{
    FAICommandScript _base_FAICommandScript;

    FAICommand_OverrideLock()
    {
        this.__InitDefaults();
        return;
    }
    const UScriptStruct GetInstanceDataType_Implementation() const
    {
        UScriptStruct local_2 = FAICommand_OverrideLockData;
        return local_2;
    }
    FAICommand_OverrideLockData GetInstanceData(const FAICommandParams &inout Params) const
    {
        FAICommand_OverrideLockData __r;
        return __r;
    }
    void Execute_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        const FAICommand_OverrideLockData& local_2;
        ::FAITargetingUtils::PushQueryInstance(Params.GetPawnProxy(), EAITargetingQuerySourceType(2), local_2.QueryConfig, local_2.QueryOutputs, local_2.QueryResult, NAME_None, local_2.QueryHandle);
        if (local_2.bPreferUnSelected)
        {
            FC_AITargetingPreferUnSelectedTag local_16;
            Assign local_14;
            local_14.opCall(local_16);
            ::FAITargetingUtils::UpdateSelectedMarks(Params.GetPawnProxy());
        }
        if (local_2.bHoldTarget)
        {
            Modify local_20;
            FC_AITargetingV2& local_22 = local_20.opCall();
            if (local_22)
            {
                ++local_22.HoldTargetRefCount;
            }
        }
        return;
    }
    void Finish_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        FAICommand_OverrideLockData local_2;
        ::FAITargetingUtils::PopQueryInstanceByHandle(Params.GetPawnProxy(), local_2.QueryHandle);
        if (local_2.bPreferUnSelected)
        {
            Remove local_10;
            local_10.opCall();
        }
        if (local_2.bHoldTarget)
        {
            Modify local_14;
            FC_AITargetingV2& local_16 = local_14.opCall();
            if (local_16)
            {
                --local_16.HoldTargetRefCount;
            }
        }
        return;
    }
}

class UBTService_OverrideLock : UBTService_AICommandScript
{
    UPROPERTY()
    TDataObjectPtr<FAITargetingQueryConfig> TargetingQueryConfig;
    UPROPERTY()
    TArray<FAISmart_EntityId> TargetIDs;
    UPROPERTY()
    bool bPreferUnSelected = false;
    UPROPERTY()
    bool bHoldTarget = true;
    UPROPERTY()
    FAICommand_OverrideLock AICommand;


    UFUNCTION()
    void OnInitCommandInstanceData_Implementation(const FAICommandInstanceDataInitContextPtr &inout Context) const
    {
        GetInstanceData local_4 = FAICommandInstanceDataInitContextPtr::GetInstanceData(Context);
        FAICommand_OverrideLockData local_6;
        local_6.QueryConfig = this.TargetingQueryConfig;
        local_6.bPreferUnSelected = this.bPreferUnSelected;
        local_6.QueryHandle = ::FAITargetingUtils::AllocateQueryHandle(Context.GetPawnEntity());
        local_6.QueryOutputs = ::FAITargetingUtils::BuildQueryOutputs(Context.GetPawnEntity(), this.TargetingQueryConfig, this.TargetIDs, Context.GetOwnerContext(), local_6.QueryResult);
        if (this.bPreferUnSelected)
        {
            ::FAITargetingUtils::ClearSelectedMarksIfNeed(Context.GetPawnEntity(), Context.GetOwnerContext());
            ::FAITargetingUtils::UpdateSelectedMarks(Context.GetPawnEntity());
        }
        local_6.bHoldTarget = this.bHoldTarget;
        return;
    }
}


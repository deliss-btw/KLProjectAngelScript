

// NOTE: class defaults are not authored in this module: FAICommand_UpdateLock (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FAICommand_UpdateLockData
{
    UPROPERTY()
    TDataObjectPtr<FAITargetingQueryConfig> QueryConfig;
    UPROPERTY()
    TArray<FAISmartEntityValue> QueryOutputs;
    UPROPERTY()
    FAITargetingQueryResult QueryResult;
    UPROPERTY()
    int64 QueryHandle = 0;
    UPROPERTY()
    bool bHoldTarget = true;


}

struct FAICommand_UpdateLock : FAICommandScript
{
    FAICommandScript _base_FAICommandScript;

    FAICommand_UpdateLock()
    {
        this.__InitDefaults();
        return;
    }
    const UScriptStruct GetInstanceDataType_Implementation() const
    {
        UScriptStruct local_2 = FAICommand_UpdateLockData;
        return local_2;
    }
    FAICommand_UpdateLockData GetInstanceData(const FAICommandParams &inout Params) const
    {
        FAICommand_UpdateLockData __r;
        return __r;
    }
    void Execute_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        const FAICommand_UpdateLockData& local_2;
        FC_AITmpLockCurrentAttackTargetTag local_8;
        Assign local_6;
        local_6.opCall(local_8);
        ::FAITargetingUtils::PushQueryInstance(Params.GetPawnProxy(), EAITargetingQuerySourceType(1), local_2.QueryConfig, local_2.QueryOutputs, local_2.QueryResult, NAME_None, local_2.QueryHandle);
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
        Remove local_4;
        local_4.opCall();
        FAICommand_UpdateLockData local_8;
        ::FAITargetingUtils::PopQueryInstanceByHandle(Params.GetPawnProxy(), local_8.QueryHandle);
        if (local_8.bHoldTarget)
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

class UBTService_UpdateLock : UBTService_AICommandScript
{
    UPROPERTY()
    TDataObjectPtr<FAITargetingQueryConfig> TargetingQueryConfig;
    UPROPERTY()
    TArray<FAISmart_EntityId> TargetIDs;
    UPROPERTY()
    bool bHoldTarget = true;
    UPROPERTY()
    FAICommand_UpdateLock AICommand;


    UFUNCTION()
    void OnInitCommandInstanceData_Implementation(const FAICommandInstanceDataInitContextPtr &inout Context) const
    {
        GetInstanceData local_4 = FAICommandInstanceDataInitContextPtr::GetInstanceData(Context);
        FAICommand_UpdateLockData local_6;
        local_6.QueryConfig = this.TargetingQueryConfig;
        local_6.QueryHandle = ::FAITargetingUtils::AllocateQueryHandle(Context.GetPawnEntity());
        Context.GetOwnerContext();
        FECSEntity local_34 = Context.GetPawnEntity();
        TArray<FAISmartEntityValue> local_42;
        local_6.QueryOutputs = local_42;
        local_6.bHoldTarget = this.bHoldTarget;
        return;
    }
    UFUNCTION()
    void OnSearchStart_Implementation(const FAIBehaviorTreeSearchContext &inout SearchContext) const
    {
        this.CheckDeferredMuteCombat(SearchContext.PawnEntity);
        return;
    }
    void CheckDeferredMuteCombat(const FECSEntity &inout Entity) const
    {
        if (!(Entity.IsValid()))
        {
            return;
        }
        Has local_6;
        bool local_1 = local_6.opCall();
        if (local_1)
        {
            Remove local_10;
            local_10.opCall();
            if (::FAIKnowledgeUtils::CanMuteCombat(Entity))
            {
                ::FAITargetingUtils::ClearSelfTargeting(Entity);
                ::FAIKnowledgeUtils::QuitCombat(Entity);
                XLog(ELog(14), FString().Append(Entity.GetEntityName()).Append(" Deferred quit combat executed at BT root"));
                return;
            }
            XLog(ELog(14), FString().Append(Entity.GetEntityName()).Append(" MuteCombat cleared before BT root - skip quit combat"));
        }
        return;
    }
}


struct FAICommand_LockTargetData
{
    UPROPERTY()
    bool bUseBlackboardEntity;
    UPROPERTY()
    bool bForceLockCurrent;
    UPROPERTY()
    FECSEntityId TargetEntityID;

}

struct FAICommand_LockTarget : FAICommandScript
{
    FAICommandScript _base_FAICommandScript;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FAICommand_LockTarget.Get());

    FAICommand_LockTarget()
    {
        this.__InitDefaults();
        return;
    }
    const UScriptStruct GetInstanceDataType_Implementation() const
    {
        UScriptStruct local_2 = FAICommand_LockTargetData;
        return local_2;
    }
    FAICommand_LockTargetData GetInstanceData(const FAICommandParams &inout Params) const
    {
        FAICommand_LockTargetData __r;
        return __r;
    }
    void Execute_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        int local_36 = 0;
        const FAICommand_LockTargetData& local_2 = this.GetInstanceData(Params);
        FC_AITmpLockCurrentAttackTargetTag local_8;
        Assign local_6;
        local_6.opCall(local_8);
        Modify local_12;
        FC_AITargeting& local_14 = local_12.opCall();
        if (local_14)
        {
            ::FAIKnowledgeUtils::UpdateCombatKnowledgeAboutTarget(Params.GetPawnProxy(), local_14.CurrentAttackTarget.GetEntity());
            if (local_2.bUseBlackboardEntity)
            {
                local_14.BlackboardLockedTargetEntity = FTargetEntity(FECSEntity(local_2.TargetEntityID));
            }
            else
            {
                local_14.BlackboardLockedTargetEntity = local_14.BestScoredAttackTarget;
            }
            Has local_26;
            bool local_15 = local_26.opCall();
            if (local_15)
            {
                Get local_34;
                local_14.BlackboardLockedTargetEntity = ::FASCommonUtils::GetControlledPawnEntity(local_34.opCall().GetFromEntity());
            }
            if (local_2.bForceLockCurrent)
            {
                local_36.SetRefCount((local_36.GetRefCount() + 1));
            }
        }
        return;
    }
    void Finish_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        int local_16 = 0;
        const FAICommand_LockTargetData& local_2 = this.GetInstanceData(Params);
        Remove local_6;
        local_6.opCall();
        Modify local_12;
        FC_AITargeting& local_14 = local_12.opCall();
        if (local_14)
        {
            local_14.BlackboardLockedTargetEntity = ENTITY_NULL;
            if (local_2.bForceLockCurrent)
            {
                local_16.SetRefCount((local_16.GetRefCount() - 1));
                int local_22 = local_16.GetRefCount();
            }
        }
        return;
    }
}

class UBTService_LockTarget : UBTService_AICommandScript
{
    UPROPERTY()
    bool bUseBlackboardEntity = false;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
    UPROPERTY()
    bool bForceLockCurrent = false;
    UPROPERTY()
    bool bClearForceOnlyTargetOnFinish = false;
    UPROPERTY()
    FAICommand_LockTarget AICommand;

    default SetNodeName("锁定目标");

    UFUNCTION()
    void OnInitCommandInstanceData_Implementation(const FAICommandInstanceDataInitContextPtr &inout Context) const
    {
        FAICommand_LockTargetData local_6;
        GetInstanceData local_4 = FAICommandInstanceDataInitContextPtr::GetInstanceData(Context);
        if (this.bUseBlackboardEntity)
        {
            local_6.TargetEntityID = this.TargetEntityID.GetValue(Context.GetOwnerContext());
            local_6.bUseBlackboardEntity = true;
        }
        local_6.bForceLockCurrent = this.bForceLockCurrent;
        return;
    }
}

struct FAICommand_AIForceLockTargetTagData
{
    UPROPERTY()
    bool bForceLockCurrent;
    UPROPERTY()
    bool bShowArrow;

}

struct FAICommand_AIForceLockTargetTag : FAICommandScript
{
    FAICommandScript _base_FAICommandScript;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FAICommand_AIForceLockTargetTag.Get());

    FAICommand_AIForceLockTargetTag()
    {
        this.__InitDefaults();
        return;
    }
    const UScriptStruct GetInstanceDataType_Implementation() const
    {
        UScriptStruct local_2 = FAICommand_AIForceLockTargetTagData;
        return local_2;
    }
    FAICommand_AIForceLockTargetTagData GetInstanceData(const FAICommandParams &inout Params) const
    {
        FAICommand_AIForceLockTargetTagData __r;
        return __r;
    }
    void Execute_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        int local_4 = 0;
        const FAICommand_AIForceLockTargetTagData& local_2 = this.GetInstanceData(Params);
        if (int(local_2.bForceLockCurrent) != 0)
        {
            local_4.SetRefCount((local_4.GetRefCount() + 1));
        }
        local_4.SetbShowArrow((int(local_2.bShowArrow) != 0));
        return;
    }
    void Finish_Implementation(const FAICommandParams &inout Params, const FFPTime &inout WorldTime) const
    {
        int local_16 = 0;
        const FAICommand_AIForceLockTargetTagData& local_2 = this.GetInstanceData(Params);
        Remove local_6;
        local_6.opCall();
        Modify local_12;
        FC_AITargeting& local_14 = local_12.opCall();
        if (local_14)
        {
            local_14.BlackboardLockedTargetEntity = ENTITY_NULL;
            if (local_2.bForceLockCurrent)
            {
                local_16.SetRefCount((local_16.GetRefCount() - 1));
                int local_22 = local_16.GetRefCount();
            }
        }
        return;
    }
}

class UBTService_AIForceLockTargetTag : UBTService_AICommandScript
{
    UPROPERTY()
    bool bShowArrow = true;
    UPROPERTY()
    FAICommand_AIForceLockTargetTag AICommand;

    default SetNodeName("AI显示锁敌红线");

    UFUNCTION()
    void OnInitCommandInstanceData_Implementation(const FAICommandInstanceDataInitContextPtr &inout Context) const
    {
        GetInstanceData local_4 = FAICommandInstanceDataInitContextPtr::GetInstanceData(Context);
        FAICommand_AIForceLockTargetTagData local_6;
        local_6.bShowArrow = this.bShowArrow;
        return;
    }
}




class UHTNService_LockTarget : UHTNService_AICommandScript
{
    UPROPERTY()
    bool bUseBlackboardEntity = false;
    UPROPERTY()
    FAISmart_EntityId TargetEntityID = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
    UPROPERTY()
    bool bForceLockCurrent = false;
    UPROPERTY()
    FAICommand_LockTarget AICommand;

    default SetNodeName("й”Ѓе®љз›®ж ‡");


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


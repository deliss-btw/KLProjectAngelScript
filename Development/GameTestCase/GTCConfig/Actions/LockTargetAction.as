struct FGTCLockTargetAction : FGTCAction
{
    FGTCAction _base_FGTCAction;
    UPROPERTY()
    FName LockTargetEntityName;
    UPROPERTY()
    FECSEntity LockTargetEntity;

    FGTCLockTargetAction()
    {
        this.__InitDefaults();
        return;
    }
    void OnStart_Implementation(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        int local_16 = 0;
        FECSEntity(Context.TestCaseEntityId).IsValid();
        FECSEntityId local_10;
        if (!(local_16.TryFindEntityId(this.LockTargetEntityName, local_10)))
        {
            return;
        }
        this.LockTargetEntity = FECSEntity(local_10);
        this.LockTargetEntity.IsValid();
        return;
    }
    void Execute_Implementation(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        if ((!((this.LockTargetEntityName == NAME_None))))
        {
            if (!(this.LockTargetEntity.IsValid()))
            {
                return;
            }
            ::FLockTargetUtils::UpdateLockTarget(TargetEntity, this.LockTargetEntity, 0, ELockTargetType(2), false, 0.0f);
            return;
        }
        ::FLockTargetUtils::ClearLockTarget(TargetEntity);
        return;
    }
}


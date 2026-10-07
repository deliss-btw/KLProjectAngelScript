

class UItemActionTrigger_DropOnGround : UItemActionTriggerBase
{
    UPROPERTY()
    FDropMovementConfigData DropMovement;
    UPROPERTY()
    int Num = 1;
    UPROPERTY()
    float32 RatePercentage = 100.0f;


    void Execute(const FItemActionSource &inout ActionSource) const
    {
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        return;
    }
}

class UItemActionTrigger_DropToInventory : UItemActionTriggerBase
{
    UPROPERTY()
    TArray<FDropItemTableRowRef> DropItems;

    UItemActionTrigger_DropToInventory()
    {
        super();
        return;
    }
    void Execute(const FItemActionSource &inout ActionSource) const
    {
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        return;
    }
}




class UHTNDecorator_CheckIsLazyAllocate : UHTNDecorator_ECSScriptBase
{
    UPROPERTY()
    bool Inverse = false;

    default SetNodeName("CheckIsLazyAllocate");


    UFUNCTION()
    bool PerformConditionCheck_Implementation(const FHTNContext &inout Context, const EHTNDecoratorConditionCheckType CheckType) const
    {
        int local_12 = 0;
        bool local_15;
        if (!(FECSEntity(Context.PawnEntity).IsValid()))
        {
            return false;
        }
        if (!(local_12))
        {
            return false;
        }
        bool local_13 = local_12.SlotAllocator.bLazyAllocate;
        if (this.Inverse)
        {
            local_15 = !(local_13);
        }
        else
        {
            local_15 = local_13;
        }
        return local_15;
    }
}


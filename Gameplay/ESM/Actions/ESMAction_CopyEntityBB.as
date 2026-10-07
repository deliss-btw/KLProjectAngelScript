

class UESMAction_CopyEntityBB : UESMBPBaseInstantAction
{
    UPROPERTY()
    FNameHandle_EntityBBVar Src;
    UPROPERTY()
    FNameHandle_EntityBBNoNativeVar Dest;

    UESMAction_CopyEntityBB()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        if (local_6)
        {
            local_6.CopyValue(this.Src, this.Dest, Time.WorldTime);
        }
        return;
    }
}




class UESMAction_WeaponBowLine : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool bSingleActor = false;


    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        this.SetAttachBowLine(Context, true);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        this.SetAttachBowLine(Context, false);
        return;
    }
    void SetAttachBowLine(const FESMContext &inout Context, const bool bAttach) const
    {
        int local_20 = 0;
        if (this.bSingleActor)
        {
            Has local_6;
            if (!(local_6.opCall()))
            {
                return;
            }
            Modify local_10;
            local_10.opCall().SetAttachBowLine(bAttach);
            return;
        }
        Has local_14;
        if (!(local_14.opCall()))
        {
            return;
        }
        FECSEntity local_24 = local_20.GetCurrentWeaponEntity();
        Has local_28;
        if (!(local_28.opCall()))
        {
            return;
        }
        Modify local_32;
        local_32.opCall().SetAttachBowLine(bAttach);
        return;
    }
}


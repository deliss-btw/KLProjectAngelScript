

class UESMAction_WeaponHide : UESMBPBaseSpanAction
{
    UESMAction_WeaponHide()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_CharacterWeapon& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetHideWeaponCounter(int8((local_6.GetHideWeaponCounter() + 1)));
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_CharacterWeapon& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetHideWeaponCounter(int8((local_6.GetHideWeaponCounter() - 1)));
        }
        return;
    }
}


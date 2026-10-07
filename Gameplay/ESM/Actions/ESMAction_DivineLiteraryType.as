

class UESMAction_OverrideDivineLiteraryType : UESMBPBaseSpanAction
{
    UPROPERTY()
    TDataObjectPtr<FDivineLiteraryTypeConfig> DivineLiteraryType;
    UPROPERTY()
    bool bAutoRestoreWhenExit = false;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_38 = 0;
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        local_38.SetDivineLiteraryType(this.DivineLiteraryType);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        if (this.bAutoRestoreWhenExit)
        {
            Remove local_10;
            local_10.opCall();
        }
        return;
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        bool local_1 = (!(this.bAutoRestoreWhenExit) == !(false));
        return local_1;
    }
}

class UESMAction_RestoreDivineLiteraryType : UESMBPBaseInstantAction
{
    UESMAction_RestoreDivineLiteraryType()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Has local_4;
        if (!(local_4.opCall()))
        {
            return;
        }
        Remove local_10;
        local_10.opCall();
        return;
    }
}


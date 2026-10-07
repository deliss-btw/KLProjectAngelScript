

class UWidget_SmallHPBar : UASUserWidget
{
    UPROPERTY()
    UProgressBar AS_HPBar;

    UWidget_SmallHPBar()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        XErrorTrace(ELog(0), "Error");
        return;
    }
    UFUNCTION()
    void OnInitialized_Implementation()
    {
        XErrorTrace(ELog(0), "Error");
        return;
    }
}


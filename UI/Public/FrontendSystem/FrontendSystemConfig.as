
enum EFrontendSystemAllowMultipleInstance
{
    AllowIfNotFocused,
    AllowAlways,
    Disallow,
    DisallowAndReenterSystem,
}

enum EFrontendSystemState
{
    Opened,
    Focused,
    Backgrounded,
}


struct FFrontendSystemBehavior
{
    UPROPERTY()
    EFrontendSystemState State;
    UPROPERTY()
    UFrontendSystemBehaviorBase Behavior = nullptr;


}

class UFrontendSystemConfig : UDataAsset
{
    UPROPERTY()
    FName SystemName;
    UPROPERTY()
    EFrontendSystemAllowMultipleInstance AllowMultipleInstance;
    UPROPERTY()
    TArray<FFrontendSystemBehavior> Behaviors;
    UPROPERTY()
    bool bForbitOnDeath;

    UFrontendSystemConfig()
    {
        FString local_8 = this.GetName();
        local_8.RemoveFromStart("DA_", ESearchCase(1));
        local_8.RemoveFromEnd("System", ESearchCase(1));
        this.SystemName = FName(local_8);
        return;
    }
}


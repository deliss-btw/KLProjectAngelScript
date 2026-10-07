

struct FUIItemInteractAbility
{
    UPROPERTY()
    FText DisplayText;
    UPROPERTY()
    bool bIsInteractTarget;
    UPROPERTY()
    TSoftClassPtr<UEASAbility> AbilityClass;
    UPROPERTY()
    FName Signal;
    UPROPERTY()
    bool bSetVisibility;
    UPROPERTY()
    TDataObjectPtr<FSystemControlConfig> UnlockSystemControl;


}

struct FUIInteractAbilityGroup
{
    UPROPERTY()
    TArray<FUIItemInteractAbility> GroupItems;

    FUIInteractAbilityGroup()
    {
        return;
    }
}

class UUIInteractAbilityConfig : UDataAsset
{
    UPROPERTY()
    TMap<FName, FUIInteractAbilityGroup> Groups;

    UUIInteractAbilityConfig()
    {
        return;
    }
}

namespace UIInteractAbilityConfig
{
FUIInteractAbilityGroup GetUIInteractAbilityGroup(const FName &inout GroupName)
{
    FUIInteractAbilityGroup __r;
    FUIInteractAbilityGroup local_20 = Cast<UUIInteractAbilityConfig>(UGameplayConfigsManager.GetDefaultObject().GlobalUIInteractAbilityConfig.ToSoftObjectPath().TryLoad());
    return __r;
}
}

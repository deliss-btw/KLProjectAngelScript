class UNearDeathSettings : UGameplaySettingsBase
{
    UPROPERTY()
    UInputAction GiveUpAction;
    UPROPERTY()
    UInputAction NeedHelpAction;
    UPROPERTY()
    UInputAction ReviveSituAction;
    UPROPERTY()
    UInputAction RevivePointAction;
    UPROPERTY()
    UInputAction ReviveTeleportAction;
    UPROPERTY()
    UInputAction ReviveOtherAction;
    UPROPERTY()
    TDataObjectPtr<FReviveData> DefaultReviveRule;
    UPROPERTY()
    FItemTableRowRef PotionItemConfig;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> NearDeathWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> WaitRebornWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> RescueOtherWidgetClass;
    UPROPERTY()
    TArray<TSubclassOf<AECSPrefab>> RestPointRevivePrefabClass;

    UNearDeathSettings()
    {
        return;
    }
}

namespace NearDeathSettings
{
TArray<TSubclassOf<AECSPrefab>> GetRestPointPrefabClasses()
{
    int local_8 = 0;
    bool local_9;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_8))
    {
        local_9 = false;
    }
    else
    {
        local_9 = local_8.GetReviveData();
    }
    if (!(!(local_9)) && local_8.GetReviveData().Get().bUseOverrideRevivePrefabClass)
    {
        return local_8.GetReviveData().Get().RestPointRevivePrefabClass;
    }
    return NearDeathSettings::Get().RestPointRevivePrefabClass;
}
}

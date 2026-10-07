

UCLASS(Abstract)
class UAS_GameModeSettings : UKLGameModeSettings
{
    UPROPERTY()
    TSubclassOf<UUserWidget> EntryUIClass;
    UPROPERTY()
    TArray<TDataObjectPtr<FAvatarPrefabConfig>> ChangeRoleDataObjects;
    UPROPERTY()
    TDataObjectPtr<FGameModeProfileConfig> GameModeProfile;

    UAS_GameModeSettings()
    {
        return;
    }
}

namespace GameModeSettings
{
UFUNCTION()
const UAS_GameModeSettings GetGameModeSettings(const UObject WorldContextObject)
{
    UAS_GameModeSettings local_6 = Cast<UAS_GameModeSettings>(UECSGameModeSettingsBase::Get(WorldContextObject.GetWorld()));
    return local_6;
}
}

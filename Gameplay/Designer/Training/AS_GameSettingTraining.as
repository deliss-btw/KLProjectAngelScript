

UCLASS(Abstract)
class UAS_GameModeSettingsTraining : UAS_GameModeSettings
{
    UPROPERTY()
    TArray<TDataObjectPtr<FTrainingInfoConfig>> TrainingInfos;
    UPROPERTY()
    int SelectIndex = 0;


}


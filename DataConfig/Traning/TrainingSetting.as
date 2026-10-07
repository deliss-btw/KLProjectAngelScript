

class UTrainingSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TDataObjectPtr<FKLTextData> TrainingDialogTitleTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> TrainingDialogMessageTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> TrainingDialogConfirmTextTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> TrainingDialogCancelTextTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> TrainingRewardClaimedDescTextData;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> TrainingRewardPreviewDescTextData;

    UTrainingSettings()
    {
        return;
    }
}


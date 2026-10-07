

struct FCustomVolumeAudioConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FName AreaTypeName = n"None";
    UPROPERTY()
    FSimpleAudioSet AudioSet;
    UPROPERTY()
    FText Description = FText::FromString("");
    UPROPERTY()
    FText DisplayName = FText::FromString("");

    FCustomVolumeAudioConfig()
    {
        return;
    }
    void OnDataTableChangedInternal(const UDataTable DataTable, const FName &inout InRowName)
    {
        if (this.AreaTypeName.IsNone())
        {
            XWarning(ELog(1), FString().Append("CustomVolumeAudioConfig: AreaTypeName is empty for ").Append(InRowName));
        }
        if (this.AudioSet.Event.IsNull())
        {
            XWarning(ELog(1), FString().Append("CustomVolumeAudioConfig: AudioEvent is null for ").Append(InRowName));
        }
        FDataTableMisc::InformWholeTableChange(DataTable, InRowName);
        return;
    }
}


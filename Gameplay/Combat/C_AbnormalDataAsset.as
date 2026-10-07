

class UAbnormalDataAsset : UDataAsset
{
    UPROPERTY()
    TMap<EAbnormalState, FAbnormalStateConfig> AbnormalStateGlobalConfig;
    UPROPERTY()
    TMap<EAbnormalState, FBuffConfigRef> ResistanceBuffConfig;
    UPROPERTY()
    TMap<EAbnormalState, EAbnormalState> ExclusiveOverrideConfig;
    UPROPERTY()
    TSet<EAbnormalState> NotShowAbnormalActiveUI;

    UAbnormalDataAsset()
    {
        return;
    }
}


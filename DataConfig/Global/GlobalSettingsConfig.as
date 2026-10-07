

struct FGlobalSettingsConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    FStringCheckerConfig NicknameChecker;
    UPROPERTY()
    TArray<FDataObjectPtr> m_TutorialMissionConfigs;
    UPROPERTY()
    int NicknameChangeCDHours;


    const TArray<TDataObjectPtr<FMissionCommissionConfig>> GetTutorialMissionConfigs() const property
    {
        const TArray<TDataObjectPtr<FMissionCommissionConfig>> __r;
        return __r;
    }
    void SetTutorialMissionConfigs(const TArray<TDataObjectPtr<FMissionCommissionConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FMissionCommissionConfig>>> local_2;
        this.m_TutorialMissionConfigs = local_2;
        return;
    }
}

namespace FGlobalSettingsConfig
{
TDataObjectPtr<FGlobalSettingsConfig> Get()
{
    TDataObjectIterator<FGlobalSettingsConfig> local_16;
    TDataObjectPtr<FGlobalSettingsConfig> __return;
    for (; local_16; )
    {
        __return = local_16.GetDataPtr();
    }
    return TDataObjectPtr<FGlobalSettingsConfig>();
}
}

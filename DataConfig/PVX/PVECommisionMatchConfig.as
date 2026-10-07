

struct FPveCommissionMatchConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;
    UPROPERTY()
    EMatchMode MatchMode = EMatchMode(2);
    UPROPERTY()
    int ConfirmWaitTime = 15;
    UPROPERTY()
    ECommissionType CommissionType;
    UPROPERTY()
    int MaxPlayerNum;
    UPROPERTY()
    int MinTeamNum = 2;
    UPROPERTY()
    int MatchingTimeoutSec;
    UPROPERTY()
    int StopMatchingTimeoutSec;
    UPROPERTY()
    FDataObjectPtr m_SystemControlCfg;


    const TDataObjectPtr<FSystemControlConfig> GetSystemControlCfg() const property
    {
        const TDataObjectPtr<FSystemControlConfig> __r;
        return __r;
    }
    void SetSystemControlCfg(const TDataObjectPtr<FSystemControlConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FSystemControlConfig>> local_2;
        this.m_SystemControlCfg = local_2;
        return;
    }
}


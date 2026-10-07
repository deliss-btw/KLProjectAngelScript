

struct FOperatorBtnData
{
    UPROPERTY()
    FText ButtonText;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    FSoftBrush BtnHoverIcon;

    FOperatorBtnData()
    {
        return;
    }
}

class UTeamSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> ListInfoHover;
    UPROPERTY()
    TMap<ETeamInvitationType, FSoftBrush> InvitationIconConfigs;
    UPROPERTY()
    TMap<ETeamOtherPlayerOperatorType, FOperatorBtnData> OperatorIconConfigs;
    UPROPERTY()
    TMap<ETeamOperatorBtnType, FOperatorBtnData> OperatorPlayerIconConfigs;
    UPROPERTY()
    TMap<ETeamListenState, FOperatorBtnData> OperatorTeamMuteIconConfigs;
    UPROPERTY()
    TMap<ETeamSpeakState, FOperatorBtnData> OperatorTeamSpeakIconConfigs;

    UTeamSettings()
    {
        return;
    }
}


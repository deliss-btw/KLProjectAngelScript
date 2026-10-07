

class UModelDefaultsInGameCommon : UEUIModelConfigDefaults
{
    UPROPERTY()
    FVMS_MotionPageConfigDefault MotionPage;
    UPROPERTY()
    FVMS_TeamPanelConfigDefault TeamPanel;
    UPROPERTY()
    FVMS_PlayerKeyMappingsConfigDefault KeyMappingSettings;
    UPROPERTY()
    FVMS_BossHpBarConfigDefault BossHpBar;
    UPROPERTY()
    FVMS_MiniHpBarV2PanelConfigDefault MiniHpBar;
    UPROPERTY()
    FVM_PlayerAvatarIconConfigDefault AvatarIcon;
    UPROPERTY()
    FVM_PlayerHpBarConfigDefault PlayerHpBar;
    UPROPERTY()
    FVMS_PlayerStatusV2ConfigDefault PlayerStatus;
    UPROPERTY()
    FVMS_CustomWheelConfigDefault CustomWheel;
    UPROPERTY()
    FVM_BuffInfoConfigDefault BuffInfo;
    UPROPERTY()
    FMS_HUDInputManagerConfigDefault HUDInput;
    UPROPERTY()
    FVMS_SettingPageConfigDefault SettingPage;

    UModelDefaultsInGameCommon()
    {
        return;
    }
}

class UModelDefaultsItem : UEUIModelConfigDefaults
{
    UModelDefaultsItem()
    {
        return;
    }
}


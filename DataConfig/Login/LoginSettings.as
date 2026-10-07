
enum EGameStartPhase
{
    CompanyLogo,
    GameLogo,
    Warning,
}

enum ELoginShowPhase
{
    GameStart,
    LoginUI,
    Setting,
    LoginCG,
    CreatePlayer,
    EnterToGame,
}

enum ELoginButtonType
{
    StartGame,
    ContinueGame,
    SwitchAccount,
    Notice,
    Settings,
    ExitGame,
}

enum ECreatePlayerPhase
{
    SelectGender,
    CreateFace,
    SelectFashion,
    SetNickname,
}

enum ELoginErrorTipType
{
    DeviceLimit,
    ServerInvalid,
    ConnectFailed,
    GetToken,
    SdkVerify,
    PlayerLogin,
    Generic,
}


struct FGameStartPhaseInfo
{
    UPROPERTY()
    bool bIsSkip = false;
    UPROPERTY()
    float32 FadeInTime = 0.25f;
    UPROPERTY()
    float32 Time = 1.5f;
    UPROPERTY()
    float32 FadeOutTime = 0.25f;


}

struct FSkipInfo
{
    UPROPERTY()
    bool bIsSkip = false;


}

struct FLoginButtonInfo
{
    UPROPERTY()
    TDataObjectPtr<FKLTextData> ButtonTextData;
    UPROPERTY()
    bool bHidden = false;


}

struct FHotUpdateInfo
{
    UPROPERTY()
    bool bDisableHotUpdate = false;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> HotUpdateProgressTextData;


}

struct FPSOPrecompileInfo
{
    UPROPERTY()
    bool bDisablePSOPrecompile = false;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> PSOPrecompileTextData;


}

struct FLoginErrorTipInfo
{
    UPROPERTY()
    TDataObjectPtr<FKLTextData> DeviceLimitTip;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> ServerInvalidTip;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> ConnectFailedTip;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> GetTokenFailedTip;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> SdkVerifyFailedTip;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> PlayerLoginFailedTip;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> GenericTip;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> SDKNotLoginTip;

    FLoginErrorTipInfo()
    {
        return;
    }
}

struct FCreatePlayerStepConfig
{
    UPROPERTY()
    ECreatePlayerPhase StepType;
    UPROPERTY()
    bool bIsSkip = false;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> StepNameTextData;
    UPROPERTY()
    TArray<FName> EnabledLightTags;


}

class ULoginSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TMap<EGameStartPhase, FGameStartPhaseInfo> GameStartPhaseControl;
    UPROPERTY()
    FString LoginBGMStartEventName = "Play_Music_Login";
    UPROPERTY()
    FString LoginBGMEndEventName = "Stop_Music_Login";
    UPROPERTY()
    FHotUpdateInfo HotUpdateInfo;
    UPROPERTY()
    FPSOPrecompileInfo PSOPrecompileInfo;
    UPROPERTY()
    TMap<ELoginShowPhase, FSkipInfo> LoginPhaseInfos;
    UPROPERTY()
    TMap<ELoginButtonType, FLoginButtonInfo> LoginButtonsInfo;
    UPROPERTY()
    TDataObjectPtr<FCGConfig> LoginCGConfig;
    UPROPERTY()
    TArray<FCreatePlayerStepConfig> CreatePlayerStepInfos;
    UPROPERTY()
    FName CreatePlayerPhaseLightRootTag = n"CreatePlayerPhaseLight";
    UPROPERTY()
    TDataObjectPtr<FLoginCreatePlayerConfig> LoginCreatePlayerConfig;
    UPROPERTY()
    FLoginErrorTipInfo LoginErrorTips;
    UPROPERTY()
    float32 LoginTimeoutSeconds = 20.0f;


}


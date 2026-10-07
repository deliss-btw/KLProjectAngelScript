

struct FLoginGateInfo
{
    UPROPERTY()
    FString RegionType;
    UPROPERTY()
    FString RegionName;
    UPROPERTY()
    FString RegionTitle;
    UPROPERTY()
    FString RegionAddress;
    UPROPERTY()
    FString GateAddress;
    UPROPERTY()
    FString DsaAddress;
    UPROPERTY()
    uint DsaPort;
    UPROPERTY()
    uint Port;
    UPROPERTY()
    int DSVersion;
    UPROPERTY()
    FString DSBuildType;
    UPROPERTY()
    FString CDNUrl;
    UPROPERTY()
    FString ClientVersion;
    UPROPERTY()
    bool bNeedRestartClient;
    UPROPERTY()
    bool bNeedExitClient;
    UPROPERTY()
    FString DownloadExtraInfo;


}


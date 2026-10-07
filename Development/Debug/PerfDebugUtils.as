
namespace FPerfDebugUtils
{
UFUNCTION()
void PrintMemoryInfo()
{
    XLog(ELog(54), FString().Append("еЏЇз”Ёи™љж‹џе†…е­: ").Append(UPerformanceUtils::GetAvailableVirtualMemString()));
    XLog(ELog(54), FString().Append("е·Із”Ёи™љж‹џе†…е­: ").Append(UPerformanceUtils::GetUsedVirtualMemString()));
    return;
}
UFUNCTION()
FString GetMemoryInfo(const bool bWithNewLine = true)
{
    UPerformanceUtils::GetUsedPhysicalMemString();
    UPerformanceUtils::GetPeakUsedPhysicalMemString();
    UPerformanceUtils::GetUsedVirtualMemString();
    UPerformanceUtils::GetPeakUsedVirtualMemString();
    UPerformanceUtils::GetGPUUsedMemoryString();
    return FString();
}
UFUNCTION()
FString GetLocalEntityPosition(const bool bWithNewLine = true)
{
    if (FASCommonUtils::GetLocalPlayerPawnEntity().IsValid() == false)
    {
        return FString();
    }
    return FString();
}
UFUNCTION()
FString GetNewLineStr()
{
    if (FASCommonUtils::GetLocalPlayerPawnEntity().IsValid() == false)
    {
        return FString();
    }
    return FString();
}
UFUNCTION()
FString GetCPUInfo(const bool bWithNewLine = true)
{
    UPerformanceUtils::GetCPUVendor();
    UPerformanceUtils::GetCPUBrand();
    UPerformanceUtils::GetCPUCoreCount();
    return FString();
}
UFUNCTION()
FString GetGPUInfo(const bool bWithNewLine = true)
{
    UPerformanceUtils::GetGPUVendor();
    UPerformanceUtils::GetGPUDeviceDesc();
    UPerformanceUtils::GetGPUDriverInternalVersion();
    return FString();
}
UFUNCTION()
FString GetRHIInfo(const bool bWithNewLine = true)
{
    UPerformanceUtils::GetRHIName();
    UPerformanceUtils::GetRHIMaxFeatureLevel();
    return FString();
}
UFUNCTION()
FString GetBuildInfo(const bool bWithNewLine = true)
{
    UPerformanceUtils::GetBranchName();
    UPerformanceUtils::GetCurrentChangelist();
    UPerformanceUtils::GetBuildDate();
    UPerformanceUtils::GetBuildVersion();
    UPerformanceUtils::GetBuildConfiguration();
    UPerformanceUtils::GetDeviceName();
    UPerformanceUtils::GetPlatformName();
    UPerformanceUtils::GetBuildTargetType();
    FString local_36 = FDateTime::Now().ToString();
    return FString();
}
UFUNCTION()
FString GetDataTime(const bool bWithNewLine = true)
{
    FString local_10 = FDateTime::Now().ToString();
    FString local_18;
    if (bWithNewLine)
    {
        local_18 = FString().Append("\nDataTime: ").Append(local_10);
    }
    else
    {
        local_18 = FString().Append("DataTime: ").Append(local_10);
    }
    return local_18;
}
UFUNCTION()
FString GetPlayerInfo(const bool bWithNewLine = true)
{
    FECSEntity local_8 = FASCommonUtils::GetLocalPlayerProxy();
    if (local_8)
    {
        int local_23;
        FText local_14 = FASCommonUtils::GetPlayerName(local_8);
        GetDefaulted local_22;
        local_23 = local_22.opCall().GetPlayerId();
        if (!(local_14.IsEmpty()))
        {
            FString local_36;
            if (bWithNewLine)
            {
                local_36 = FString().Append("\nUID ").Append(local_14).Append(" (").Append(local_23).Append(")");
            }
            else
            {
                local_36 = FString().Append("UID ").Append(local_14).Append(" (").Append(local_23).Append(")");
            }
            return local_36;
        }
    }
    FString local_36;
    if (bWithNewLine)
    {
        local_36 = FString().Append("Not Login\n");
    }
    else
    {
        local_36 = FString().Append("Not Login");
    }
    return local_36;
}
UFUNCTION()
FString GetLevelInfo(const bool bWithNewLine = true)
{
    TDataObjectPtr<FLevelInfoConfig> local_26 = FLevelUtils::GetCurrentLevelInfoConfig(GetCurrentWorld());
    if (local_26)
    {
        FString local_68;
        if (bWithNewLine)
        {
            local_68 = FString().Append("\nLevel: ").Append(local_26.GetDataName());
        }
        else
        {
            local_68 = FString().Append("Level: ").Append(local_26.GetDataName());
        }
        return local_68;
    }
    return "";
}
}

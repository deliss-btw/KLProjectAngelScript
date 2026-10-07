
namespace FJobPerformanceUtils
{
UFUNCTION()
void StartPerformanceAnalysis()
{
    FECSJobPerformanceControl::SetEnabled(true);
    return;
}
UFUNCTION()
void StopPerformanceAnalysis()
{
    FECSJobPerformanceControl::SetEnabled(false);
    return;
}
UFUNCTION()
void PrintFrequencyWarnings()
{
    ELog local_10;
    FECSJobPerformanceControl::GetFrequencyWarningsContent(local_10);
    return;
}
UFUNCTION()
void DumpECSFrequencyWarning()
{
    ELog local_10;
    FECSJobPerformanceControl::GetFrequencyWarningsContent(local_10);
    return;
}
UFUNCTION()
void ExportJobFrequencyStats()
{
    FECSJobPerformanceControl::ExportJobFrequencyStats();
    return;
}
UFUNCTION()
void ExportJobPerformanceStats()
{
    FECSJobPerformanceControl::ForceExportStats();
    return;
}
FString GetFrequencyWarningsContent(const bool bIncludeTimestamp = true)
{
    return FECSJobPerformanceControl::GetFrequencyWarningsContent(bIncludeTimestamp);
}
UFUNCTION()
TArray<FJobFrequencyWarning> GetJobFrequencyWarnings()
{
    return FECSJobPerformanceControl::GetJobFrequencyWarnings();
}
UFUNCTION()
TArray<FSystemFrequencyWarning> GetSystemFrequencyWarnings()
{
    return FECSJobPerformanceControl::GetSystemFrequencyWarnings();
}
UFUNCTION()
TArray<FHighFrequencyWarning> GetHighFrequencyWarnings()
{
    return FECSJobPerformanceControl::GetHighFrequencyWarnings();
}
UFUNCTION()
void ForceGC()
{
    UPerformanceUtils::ForceGC(true);
    return;
}
UFUNCTION()
void FullForceGC()
{
    UPerformanceUtils::FullForceGC();
    return;
}
}

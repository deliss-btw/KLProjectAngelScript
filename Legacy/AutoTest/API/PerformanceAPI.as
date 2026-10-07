
namespace AutoTest::API::PerformanceAPI
{
void StartPerformanceAnalysis()
{
    FECSJobPerformanceControl::SetEnabled(true);
    return;
}
void StopPerformanceAnalysis()
{
    FECSJobPerformanceControl::SetEnabled(false);
    return;
}
void ExportJobFrequencyStats()
{
    FECSJobPerformanceControl::ExportJobFrequencyStats();
    return;
}
}

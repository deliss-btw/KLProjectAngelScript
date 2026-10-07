
namespace AutoTest::PlatformUtils
{
int CreateProc(const FString &inout Path, const FString &inout Params, const bool bLaunchDetached, const bool bLaunchHidden, const bool bLaunchReallyHidden, const int Priority = 0, const FString &inout WorkingDir = "")
{
    int local_2 = KLAutomation::CreateProc(Path, Params, bLaunchDetached, bLaunchHidden, bLaunchReallyHidden, Priority, WorkingDir);
    XLog(ELog(50), FString().Append("CreateProc: Path=").Append(Path).Append(", Params=").Append(Params).Append(", bLaunchDetached=").Append(bLaunchDetached).Append(", bLaunchHidden=").Append(bLaunchHidden).Append(", bLaunchReallyHidden=").Append(bLaunchReallyHidden).Append(", Priority=").Append(Priority).Append(", WorkingDir=").Append(WorkingDir).Append(", ProcessId=").Append(local_2));
    return local_2;
}
}

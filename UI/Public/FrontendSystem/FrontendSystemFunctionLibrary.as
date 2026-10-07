
namespace FrontendSystemFunctionLibrary
{
UFUNCTION()
void EnterSystem(const UFrontendSystemConfig FrontendSystem)
{
    if (ECS::GetRuntimeInfo().IsClient)
    {
        FrontendSystemUtil::EnterSystem(FASCommonUtils::GetLocalUniquePlayerEntity(), FrontendSystem);
    }
    return;
}
UFUNCTION()
void ExitSystem(const UFrontendSystemConfig FrontendSystem)
{
    if (ECS::GetRuntimeInfo().IsClient)
    {
        FrontendSystemUtil::ExitSystem(FASCommonUtils::GetLocalUniquePlayerEntity(), FrontendSystem);
    }
    return;
}
UFUNCTION()
bool IsSystemOpen(const UFrontendSystemConfig FrontendSystem)
{
    if (ECS::GetRuntimeInfo().IsClient)
    {
        return FrontendSystemUtil::IsSystemOpen(FASCommonUtils::GetLocalUniquePlayerEntity(), FrontendSystem);
    }
    return false;
}
}

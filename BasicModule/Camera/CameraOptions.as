
namespace CameraOptions
{
    const FConsoleVariable CVar_Camera_AdditionalInputModifierIndex = FConsoleVariable();
    const FConsoleVariable CVar_Camera_Look_InvertY = FConsoleVariable();
    const FConsoleVariable CVar_Camera_Look_InvertX = FConsoleVariable();
    const FConsoleVariable CVar_Camera_Look_Sensitivity = FConsoleVariable();
    const FConsoleVariable CVar_Camera_EnableAutoYaw = FConsoleVariable();

UFUNCTION()
int ClientGetCameraAdditionalInputModifierIndex(const FECSWorldPtr &inout World)
{
    FCS_LocalPlayer local_6;
    if (!(local_6))
    {
        return 0;
    }
    Get local_14;
    const FC_CameraAdditionalInput& local_16 = local_14.opCall();
    if (local_16)
    {
        return local_16.GetDesiredModifierIndex() < 0 ? 0 : local_16.GetDesiredModifierIndex();
    }
    return 0;
}
UFUNCTION()
void ClientSetCameraAdditionalInputModifierIndex(const FECSWorldPtr &inout World, const int Index)
{
    FCS_LocalPlayer local_6;
    if (!(local_6))
    {
        return;
    }
    FFPTime local_16 = FFPTime(-1);
    FCE_SetAdditionalInputModifierIndexNotify local_20;
    local_20.DesiredIndex = Index;
    return;
}
}

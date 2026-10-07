
namespace UniversalGameModeUtils
{
UFUNCTION()
FGameModeFlowSettings GetGameModeFlowSettings()
{
    int local_8 = 0;
    UAS_GameModeSettings local_22;
    FGameModeFlowSettings __r;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (local_8)
    {
    }
    else
    {
        local_22 = (Cast<UAS_GameModeSettings>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if (local_22 == nullptr || !(local_22.GameModeProfile.IsSet()))
        {
        }
        else
        {
        }
    }
    return __r;
}
UFUNCTION()
bool HasFairModeFlag(const EFairModeFlags Flag)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_GameMode& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.HasFairModeFlag(EFairModeFlags(Flag));
    }
    return false;
}
UFUNCTION()
bool IsFullFairMode()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_GameMode& local_8 = local_6.opCall();
    if (local_8)
    {
        return (local_8.GetFairModeFlags() == 63);
    }
    return false;
}
}

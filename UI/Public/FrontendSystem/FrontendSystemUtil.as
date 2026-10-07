
namespace FrontendSystemUtil
{
bool IsSystemOpen(const FECSEntity &inout PlayerEntity, const UFrontendSystemConfig FrontendSystem)
{
    Has local_4;
    UFrontendSystemConfig local_28;
    if (!(local_4.opCall()))
    {
        return false;
    }
    Get local_10;
    const FC_FrontendSystem& local_12 = local_10.opCall();
    if (local_12)
    {
        for (auto& local_26 : local_12.OpenedSystemInstances)
        {
            local_28 = local_26.Config;
            if (local_28 == FrontendSystem)
            {
                return true;
            }
        }
    }
    return false;
}
void EnterSystem(const FECSEntity &inout PlayerEntity, const UFrontendSystemConfig FrontendSystem)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return;
    }
    if (ECS::IsFixedFrameJob())
    {
        FFPTime local_12 = FFPTime(-1);
        return;
    }
    FrontendSystem_Internal::EnterSystem(PlayerEntity, FrontendSystem);
    return;
}
void ExitSystem(const FECSEntity &inout PlayerEntity, const UFrontendSystemConfig FrontendSystem)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return;
    }
    if (ECS::IsFixedFrameJob())
    {
        FFPTime local_12 = FFPTime(-1);
        return;
    }
    FrontendSystem_Internal::ExitSystem(PlayerEntity, FrontendSystem);
    return;
}
const UFrontendSystemConfig GetFocusedSystem(const FECSEntity &inout PlayerEntity)
{
    Get local_4;
    const FC_FrontendSystem& local_6 = local_4.opCall();
    if (local_6)
    {
        if (!(local_6.OpenedSystemInstances.IsEmpty()))
        {
            return local_6.OpenedSystemInstances.Last(0).Config;
        }
    }
    return nullptr;
}
bool ExitFocusedSystem(const FECSEntity &inout PlayerEntity)
{
    const UFrontendSystemConfig local_4 = FrontendSystemUtil::GetFocusedSystem(PlayerEntity);
    if (local_4 != nullptr)
    {
        FrontendSystemUtil::ExitSystem(PlayerEntity, local_4);
        return true;
    }
    return false;
}
const UFrontendSystemConfig FindSystemConfigByName(const FString &inout SystemName)
{
    FString local_4 = "/Game/MoleRes/Dev/DataAsset/FrontendSystems";
    FString local_8 = FString().Append("DA_").Append(SystemName).Append("System");
    FString local_16 = FString().Append(local_4).Append("/").Append(local_8).Append(".").Append(local_8);
    UFrontendSystemConfig local_18 = Cast<UFrontendSystemConfig>(System::LoadAsset_Blocking((TSoftObjectPtr<UFrontendSystemConfig>(FSoftObjectPath(local_16)))));
    if (local_18 != nullptr)
    {
        if ((local_18.SystemName == SystemName))
        {
            return local_18;
        }
    }
    XError(ELog(52), FString().Append("Failed to find frontend system config asset ").Append(local_8).Append(" in ").Append(local_4));
    UFrontendSystemConfig local_44;
    return local_44;
}
}

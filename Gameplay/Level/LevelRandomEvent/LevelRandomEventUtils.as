
namespace LevelRandomEventUtils
{
void DeactivateAllRandomEventDatalayers()
{
    int local_8 = 0;
    UClass local_48;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_8))
    {
        XLog(ELog(22), FString().Append("DeactivateAllRandomEventDatalayers: No LevelRandomEventData found"));
        return;
    }
    XLog(ELog(22), FString().Append("DeactivateAllRandomEventDatalayers: Deactivating ").Append(local_8.SelectedEventPointIndexes.Num()).Append(" random event datalayers"));
    for (auto local_29 : local_8.SelectedEventPointIndexes)
    {
        const FRuntimeEventPointData& local_32 = local_8.RandomLevelEventPointData[local_29];
        if (int(local_32.SelectedLBPIndex) < 0)
        {
            continue;
        }
        local_48 = Cast<UClass>(local_32.LBPs[int(local_32.SelectedLBPIndex)].ToSoftObjectPath().TryLoad());
        if (local_48 != nullptr)
        {
            FLevelDataLayerUtils::SetDatalayerRuntimeStateByName(ECS::GetUEWorld(), local_48.GetFName(), EDataLayerRuntimeState(0));
            XLog(ELog(22), FString().Append("DeactivateAllRandomEventDatalayers:: Deactivated: ").Append(local_48.GetFName()));
        }
    }
    return;
}
}

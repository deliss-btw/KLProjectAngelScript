
namespace FLevelObjectStatUtils
{
bool IsLevelObjectRecorded(const FECSEntity &inout InPlayerEntity, const TDataObjectPtr<FLevelObjectStatConfig> &inout LevelObjectStatConfig)
{
    int local_16 = 0;
    int local_18 = 0;
    int local_33 = 0;
    FECSEntity local_4 = FASCommonUtils::GetUniquePlayerEntity(InPlayerEntity);
    if (!(local_4.IsValid()) || !(LevelObjectStatConfig.IsSet()))
    {
        return false;
    }
    if (!(local_16))
    {
        return false;
    }
    int local_17 = local_18;
    for (auto& local_32 : local_16.GetLevelObjectStatInfoList())
    {
        switch (local_33)
        {
        case 2:
        {
            if (local_32.GetPortalIdList().Contains(local_17))
            {
                return true;
            }
            break;
        }
        case 1:
        {
            if (local_32.GetOculusIdList().Contains(local_17))
            {
                return true;
            }
            break;
        }
        case 0:
        {
            for (auto& local_50 : local_32.GetTreasureBoxList())
            {
                if (local_50.GetTreasureBoxId() == local_17)
                {
                    return true;
                }
            }
            break;
        }
        case 4:
        {
            if (local_32.GetCollectionPrefabList().Contains(local_17))
            {
                return true;
            }
            break;
        }
        case 3:
        {
            break;
        }
        }
    }
    for (auto local_64 : local_16.GetTeleporterDataIds())
    {
        if (int(local_64) == local_17)
        {
            return true;
        }
    }
    for (auto local_64 : local_16.GetUnlockedTeleporterDataIds())
    {
        if (int(local_64) == local_17)
        {
            return true;
        }
    }
    return false;
}
void RecordLevelObject(const FECSEntity &inout InPlayerEntity, const TDataObjectPtr<FLevelObjectStatConfig> &inout LevelObjectStatConfig)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
}

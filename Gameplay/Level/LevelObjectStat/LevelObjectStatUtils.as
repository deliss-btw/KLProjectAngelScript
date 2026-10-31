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
    int local_11 = 0;
    int local_20 = 0;
    int local_22 = 0;
    FECSEntity local_4 = FASCommonUtils::GetUniquePlayerEntity(InPlayerEntity);
    if (!(local_4.IsValid()) || !(LevelObjectStatConfig.IsSet()))
    {
        return;
    }
    int local_12 = local_11;
    if (local_12 != 0 && FLevelObjectStatUtils::IsLevelObjectRecorded(local_4, LevelObjectStatConfig))
    {
        return;
    }
    int local_21 = 0;
    if (GetMapConfig().IsSet())
    {
        local_21 = local_22;
    }
    int local_23 = INDEX_NONE;
    int local_24 = 0;
    for (; local_24 < local_20.GetModify_LevelObjectStatInfoList().Num(); ++local_24)
    {
        local_22 = local_20.GetModify_LevelObjectStatInfoList()[local_24].GetMapConfigId();
        if (local_22 == local_21)
        {
            local_23 = local_24;
            break;
        }
    }
    int local_13 = INDEX_NONE;
    if (local_23 == local_13)
    {
        FLevelObjectStatInfo local_42;
        local_42.SetMapConfigId(local_21);
        local_20.GetModify_LevelObjectStatInfoList().Add(local_42);
        local_23 = local_20.GetModify_LevelObjectStatInfoList().Num() - 1;
    }
    FLevelObjectStatInfo& local_44 = local_20.GetModify_LevelObjectStatInfoList()[local_23];
    int local_45 = local_22;
    switch (local_11)
    {
    case 2:
    {
        local_44.GetModify_PortalIdList().AddUnique(local_45);
        break;
    }
    case 1:
    {
        local_44.GetModify_OculusIdList().AddUnique(local_45);
        break;
    }
    case 0:
    {
            bool local_51;
        local_22 = FDateTime::UtcNow().ToUnixTimestamp();
        local_51 = false;
        int local_24_2 = 0;
        for (; local_24_2 < local_44.GetModify_TreasureBoxList().Num(); ++local_24_2)
        {
            if (local_44.GetModify_TreasureBoxList()[local_24_2].GetTreasureBoxId() == local_45)
            {
                local_44.GetModify_TreasureBoxList()[local_24_2].SetTreasureBoxTime(local_22);
                local_51 = true;
                break;
            }
        }
        if (!(local_51))
        {
            FTreasureBoxInfo local_56;
            local_56.SetTreasureBoxId(local_45);
            local_56.SetTreasureBoxTime(local_22);
            local_44.GetModify_TreasureBoxList().Add(local_56);
        }
        break;
    }
    case 4:
    {
        local_44.GetModify_CollectionPrefabList().AddUnique(local_45);
        break;
    }
    case 3:
    {
        break;
    }
    }
    return;
}
}

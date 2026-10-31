namespace TreasureBoxUtils
{
bool IsTreasureBoxCoolingDown(const FECSEntity &inout InPlayerEntity, const uint TreasureBoxId)
{
    int local_18 = 0;
    int local_115 = 0;
    int local_116 = 0;
    FECSEntity local_4 = FASCommonUtils::GetUniquePlayerEntity(InPlayerEntity);
    if (!(local_4.IsValid()) || (TreasureBoxId == 0))
    {
        return false;
    }
    if (!(local_18))
    {
        return false;
    }
    GetDataObjectByGSDataId<FLevelObjectStatConfig> local_66;
    bool local_9 = !(local_66.opImplConv().IsSet());
    if (local_9)
    {
        local_9 = true;
    }
    else
    {
        local_116 = local_115;
        local_9 = (local_116 != 0);
    }
    if (local_9)
    {
        return false;
    }
    if (0 < 0)
    {
        for (auto& local_132 : local_18.GetLevelObjectStatInfoList())
        {
            for (auto& local_146 : local_132.GetTreasureBoxList())
            {
                if (local_146.GetTreasureBoxId() == TreasureBoxId)
                {
                    return true;
                }
            }
        }
        return false;
    }
    int local_10 = FDateTime::UtcNow().ToUnixTimestamp();
    for (auto& local_132 : local_18.GetLevelObjectStatInfoList())
    {
        for (auto& local_146 : local_132.GetTreasureBoxList())
        {
            if (local_146.GetTreasureBoxTime() > 0 && (local_146.GetTreasureBoxId() == TreasureBoxId))
            {
                return (local_10 < (local_146.GetTreasureBoxTime() + local_116));
            }
        }
    }
    return false;
}
ETreasureBoxRecordState GetTreasureBoxRecordState(const FECSEntity &inout InPlayerEntity, const uint TreasureBoxId)
{
    int local_18 = 0;
    FECSEntity local_4 = FASCommonUtils::GetUniquePlayerEntity(InPlayerEntity);
    if (!(local_4.IsValid()) || (TreasureBoxId == 0))
    {
        return ETreasureBoxRecordState(0);
    }
    if (!(local_18))
    {
        return ETreasureBoxRecordState(0);
    }
    for (auto& local_32 : local_18.GetLevelObjectStatInfoList())
    {
        for (auto& local_46 : local_32.GetTreasureBoxList())
        {
            if (local_46.GetTreasureBoxId() == TreasureBoxId)
            {
                return ETreasureBoxRecordState(local_46.GetTreasureBoxState());
            }
        }
    }
    return ETreasureBoxRecordState(0);
}
void SetTreasureBoxRecordState(const FECSEntity &inout InPlayerEntity, const TDataObjectPtr<FLevelObjectStatConfig> &inout LevelObjectStatConfig, const ETreasureBoxRecordState RecordState, const bool bStampTime)
{
    int local_11 = 0;
    int local_20 = 0;
    int local_22 = 0;
    if (!(FASCommonUtils::GetUniquePlayerEntity(InPlayerEntity).IsValid()) || !(LevelObjectStatConfig.IsSet()))
    {
        return;
    }
    int local_12 = local_11;
    if (local_12 != 0)
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
    local_22 = FDateTime::UtcNow().ToUnixTimestamp();
    bool local_51 = false;
    int local_24_2 = 0;
    for (; local_24_2 < local_44.GetModify_TreasureBoxList().Num(); ++local_24_2)
    {
        if (local_44.GetModify_TreasureBoxList()[local_24_2].GetTreasureBoxId() == local_45)
        {
            local_44.GetModify_TreasureBoxList()[local_24_2].SetTreasureBoxState(int(RecordState));
            if (bStampTime)
            {
                local_44.GetModify_TreasureBoxList()[local_24_2].SetTreasureBoxTime(local_22);
            }
            local_51 = true;
            break;
        }
    }
    if (!(local_51))
    {
        FTreasureBoxInfo local_56;
        local_56.SetTreasureBoxId(local_45);
        local_56.SetTreasureBoxState(int(RecordState));
        local_56.SetTreasureBoxTime((bStampTime ? local_22 : 0));
        local_44.GetModify_TreasureBoxList().Add(local_56);
    }
    return;
}
bool CanOpenTreasureBox(const FECSEntity &inout InPlayerEntity, const uint TreasureBoxId)
{
    ETreasureBoxRecordState local_2 = TreasureBoxUtils::GetTreasureBoxRecordState(InPlayerEntity, TreasureBoxId);
    if (int(local_2) == 0)
    {
        return true;
    }
    if (int(local_2) == 1)
    {
        return false;
    }
    return !(TreasureBoxUtils::IsTreasureBoxCoolingDown(InPlayerEntity, TreasureBoxId));
}
bool GetTreasureBoxLastTime(const FECSEntity &inout InPlayerEntity, const uint TreasureBoxId, uint &inout OutLastTime)
{
    int local_18 = 0;
    int local_115 = 0;
    FECSEntity local_4 = FASCommonUtils::GetUniquePlayerEntity(InPlayerEntity);
    if (!(local_4.IsValid()) || (TreasureBoxId == 0))
    {
        return false;
    }
    if (!(local_18))
    {
        return false;
    }
    GetDataObjectByGSDataId<FLevelObjectStatConfig> local_66;
    bool local_9 = !(local_66.opImplConv().IsSet());
    if (local_9)
    {
        local_9 = true;
    }
    else
    {
        int local_116 = local_115;
        local_9 = (local_116 != 0);
    }
    if (local_9)
    {
        return false;
    }
    for (auto& local_132 : local_18.GetLevelObjectStatInfoList())
    {
        for (auto& local_146 : local_132.GetTreasureBoxList())
        {
            if (local_146.GetTreasureBoxId() == TreasureBoxId)
            {
                OutLastTime = local_146.GetTreasureBoxTime();
                return true;
            }
        }
    }
    return false;
}
}


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
    // body not fully recovered вЂ” stub [opcode-uncovered]
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



struct __Lambda_Gameplay_Level_Commission_CommissionStatsUtils_342
{
    __Lambda_Gameplay_Level_Commission_CommissionStatsUtils_342()
    {
        return;
    }
    bool opCall(const FCommissionBadgeRewardResurlt &inout A, const FCommissionBadgeRewardResurlt &inout B)
    {
        return (0 > 0);
    }
}

namespace CommissionStatsUtils
{
bool CheckInCommission()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    return local_6.opCall();
}
bool CheckInMissionCommission()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_CommissionInfo& local_8 = local_6.opCall();
    if (local_8)
    {
        if (local_8.CommissionConfig.IsSet() && (0 == 3))
        {
            return true;
        }
    }
    return false;
}
FECSEntity GetPlayer(const FECSEntity &inout Pawn)
{
    FECSEntity local_8 = FASCommonUtils::GetUniquePlayerEntity(Pawn);
    Has local_12;
    if (!(local_12.opCall()))
    {
        return ENTITY_NULL;
    }
    return local_8;
}
FECSEntity CheckAndGetPlayerEntity(const FECSEntity &inout Pawn)
{
    if (!(ECS::GetRuntimeInfo().IsServer) || !(CommissionStatsUtils::CheckInCommission()))
    {
        return ENTITY_NULL;
    }
    return CommissionStatsUtils::GetPlayer(Pawn);
}
void AddHealToHP(const FECSEntity &inout HealFromEntity, const FECSEntity &inout HealTargetEntity, const float32 HealAmount, const float32 BeforeHealHP, const float32 HPMax)
{
    ModifyOrAdd local_22;
    SendEvent local_28;
    FECSEntity local_4 = CommissionStatsUtils::CheckAndGetPlayerEntity(HealFromEntity);
    if ((local_4 == ENTITY_NULL))
    {
        return;
    }
    float32 local_13 = UCombatGlobalSettings::Get().PlayerLowHPPercentThreshold;
    if ((HPMax > 0.0f && (((BeforeHealHP / HPMax) <= local_13))))
    {
        FECSEntity local_8 = CommissionStatsUtils::GetPlayer(HealTargetEntity);
        if ((!((local_8 == ENTITY_NULL)) && !((local_4 == local_8))))
        {
            local_22.opCall().HealLowHPTeammateCount = (local_22.opCall().HealLowHPTeammateCount + 1);
            FFPTime local_30 = FFPTime(-1);
            local_28.opCall(local_30).PlayerStatsType = ECommissionPlayerStatsType(8);
        }
    }
    local_22.opCall().HealToHP = (local_22.opCall().HealToHP + HealAmount);
    FFPTime local_30_2 = FFPTime(-1);
    local_28.opCall(local_30_2).PlayerStatsType = ECommissionPlayerStatsType(1);
    return;
}
void AddMutualClashCount(const FECSEntity &inout EventEntity)
{
    if ((CommissionStatsUtils::CheckAndGetPlayerEntity(EventEntity) == ENTITY_NULL))
    {
        return;
    }
    ModifyOrAdd local_14;
    local_14.opCall().MutualClashCount = (local_14.opCall().MutualClashCount + 1);
    FFPTime local_22 = FFPTime(-1);
    SendEvent local_20;
    local_20.opCall(local_22).PlayerStatsType = ECommissionPlayerStatsType(2);
    return;
}
void AddParryCount(const FECSEntity &inout EventEntity)
{
    if ((CommissionStatsUtils::CheckAndGetPlayerEntity(EventEntity) == ENTITY_NULL))
    {
        return;
    }
    ModifyOrAdd local_14;
    local_14.opCall().ParryCount = (local_14.opCall().ParryCount + 1);
    FFPTime local_22 = FFPTime(-1);
    SendEvent local_20;
    local_20.opCall(local_22).PlayerStatsType = ECommissionPlayerStatsType(9);
    return;
}
void AddBlockCount(const FECSEntity &inout EventEntity)
{
    if ((CommissionStatsUtils::CheckAndGetPlayerEntity(EventEntity) == ENTITY_NULL))
    {
        return;
    }
    ModifyOrAdd local_14;
    local_14.opCall().BlockCount = (local_14.opCall().BlockCount + 1);
    FFPTime local_22 = FFPTime(-1);
    SendEvent local_20;
    local_20.opCall(local_22).PlayerStatsType = ECommissionPlayerStatsType(10);
    return;
}
void AddCatchRescueCount(const FECSEntity &inout EventEntity)
{
    if ((CommissionStatsUtils::CheckAndGetPlayerEntity(EventEntity) == ENTITY_NULL))
    {
        return;
    }
    ModifyOrAdd local_14;
    local_14.opCall().CatchRescueCount = (local_14.opCall().CatchRescueCount + 1);
    FFPTime local_22 = FFPTime(-1);
    SendEvent local_20;
    local_20.opCall(local_22).PlayerStatsType = ECommissionPlayerStatsType(11);
    return;
}
void AddUsePropItemCount(const FECSEntity &inout EventEntity)
{
    if ((CommissionStatsUtils::CheckAndGetPlayerEntity(EventEntity) == ENTITY_NULL))
    {
        return;
    }
    ModifyOrAdd local_14;
    local_14.opCall().UsePropItemCount = (local_14.opCall().UsePropItemCount + 1);
    FFPTime local_22 = FFPTime(-1);
    SendEvent local_20;
    local_20.opCall(local_22).PlayerStatsType = ECommissionPlayerStatsType(15);
    return;
}
void AddRescueTeammateCount(const FECSEntity &inout EventEntity)
{
    if ((CommissionStatsUtils::CheckAndGetPlayerEntity(EventEntity) == ENTITY_NULL))
    {
        return;
    }
    ModifyOrAdd local_14;
    local_14.opCall().RescueTeammateCount = (local_14.opCall().RescueTeammateCount + 1);
    FFPTime local_22 = FFPTime(-1);
    SendEvent local_20;
    local_20.opCall(local_22).PlayerStatsType = ECommissionPlayerStatsType(17);
    return;
}
void AddSpecialStateTransitCount(const FECSEntity &inout EventEntity, const FName &inout SpecialState, const FECSEntity &inout TargetEntity)
{
    if ((CommissionStatsUtils::CheckAndGetPlayerEntity(EventEntity) == ENTITY_NULL))
    {
        return;
    }
    if ((SpecialState == n"SpecialHit_FlashedDuringInvisible"))
    {
        FCE_CommissionBreakSpecialStateEvent local_30;
        SendEvent local_20;
        ModifyOrAdd local_14;
        local_14.opCall().BreakMonsterInvisiableCount = (local_14.opCall().BreakMonsterInvisiableCount + 1);
        FFPTime local_22 = FFPTime(-1);
        local_20.opCall(local_22).PlayerStatsType = ECommissionPlayerStatsType(12);
        FFPTime local_22_2 = FFPTime(-1);
        local_30.SpecialState = EBreakSpecialState(0);
        local_30.TargetEntity = TargetEntity;
    }
    else
    {
        FCE_CommissionBreakSpecialStateEvent local_30;
        SendEvent local_20;
        ModifyOrAdd local_14;
        if ((SpecialState == n"SpecialHit_ElectricShockedInAir_Loop"))
        {
            local_14.opCall().BreakMonsterInAirCount = (local_14.opCall().BreakMonsterInAirCount + 1);
            FFPTime local_22_3 = FFPTime(-1);
            local_20.opCall(local_22_3).PlayerStatsType = ECommissionPlayerStatsType(14);
            FFPTime local_22_4 = FFPTime(-1);
            local_30.SpecialState = EBreakSpecialState(1);
            local_30.TargetEntity = TargetEntity;
        }
    }
    return;
}
void AddCustomNameStatsCount(const FECSEntity &inout EventEntity, const FName &inout CustomName, const FECSEntity &inout TargetEntity, const int Count = 1)
{
    if (!((CommissionStatsUtils::CheckAndGetPlayerEntity(EventEntity) == ENTITY_NULL)) && (CustomName == n"DefenceBreak"))
    {
        FCE_CommissionBreakSpecialStateEvent local_32;
        ModifyOrAdd local_16;
        local_16.opCall().BreakMonsterDefenceCount = (local_16.opCall().BreakMonsterDefenceCount + 1);
        FFPTime local_24 = FFPTime(-1);
        SendEvent local_22;
        local_22.opCall(local_24).PlayerStatsType = ECommissionPlayerStatsType(13);
        FFPTime local_24_2 = FFPTime(-1);
        local_32.SpecialState = EBreakSpecialState(2);
        local_32.TargetEntity = TargetEntity;
    }
    FFPTime local_24_3 = FFPTime(-1);
    FCE_CommissionCustomNameEvent local_40;
    local_40.CustomName = CustomName;
    local_40.TargetEntity = TargetEntity;
    local_40.Count = Count;
    return;
}
void AddAbnormalBuffAdded(const FECSEntity &inout EventEntity, const FBuffConfigRef &inout Buff, const FECSEntity &inout TargetEntity)
{
    int local_20 = 0;
    if ((CommissionStatsUtils::CheckAndGetPlayerEntity(EventEntity) == ENTITY_NULL))
    {
        return;
    }
    FFPTime local_16 = FFPTime(-1);
    local_20.Buff = Buff;
    local_20.TargetEntity = TargetEntity;
    return;
}
int GetStateValue(const FECSEntity &inout Pawn, const ECommissionPlayerStatsType StateEnum)
{
    int local_16 = 0;
    FECSEntity local_4 = CommissionStatsUtils::CheckAndGetPlayerEntity(Pawn);
    if ((local_4 == ENTITY_NULL))
    {
        return 0;
    }
    if (!(local_16))
    {
        return 0;
    }
    return local_16.GetPlayerStatsValue(ECommissionPlayerStatsType(StateEnum));
}
bool HasRewardBadge(const TDataObjectPtr<FCommissionBadgeConfig> &inout Config, const FECSEntity &inout Pawn, const TArray<FECSEntity> &inout OtherTeamer, FCommissionBadgeRewardResurlt &inout OutResurlt)
{
    int local_10 = 0;
    int local_14 = 0;
    FECSEntity local_4 = CommissionStatsUtils::CheckAndGetPlayerEntity(Pawn);
    if ((local_4 == ENTITY_NULL))
    {
        return false;
    }
    int local_11 = local_10;
    switch (local_11)
    {
    case 0:
    {
        int local_12 = CommissionStatsUtils::GetStateValue(Pawn, ECommissionPlayerStatsType(local_14));
        if (local_12 >= local_11)
        {
            OutResurlt.SetConfig(Config);
            OutResurlt.SetValue(local_12);
            OutResurlt.SetbPercent(false);
            return true;
        }
        return false;
    }
    case 1:
    {
        int local_11_2 = CommissionStatsUtils::GetStateValue(Pawn, ECommissionPlayerStatsType(local_14));
        if (local_11_2 <= 0)
        {
            OutResurlt.SetConfig(Config);
            OutResurlt.SetValue(local_11_2);
            OutResurlt.SetbPercent(false);
            return true;
        }
        return false;
    }
    case 2:
    {
        if (OtherTeamer.Num() <= 0)
        {
            return false;
        }
        int local_12_2 = CommissionStatsUtils::GetStateValue(Pawn, ECommissionPlayerStatsType(local_14));
        int local_15 = 0;
        int local_16 = local_12_2;
        for (auto& local_30 : OtherTeamer)
        {
            int local_11_3 = CommissionStatsUtils::GetStateValue(local_30, ECommissionPlayerStatsType(local_14));
            if (local_12_2 < local_11_3)
            {
                ++local_15;
            }
            local_16 = local_16 + local_11_3;
        }
        if ((local_12_2 > 0 && (local_16 > 0) && (local_15 == 0)))
        {
            OutResurlt.SetConfig(Config);
            OutResurlt.SetPercent((local_12_2 / local_16));
            OutResurlt.SetbPercent(true);
            return true;
        }
        return false;
    }
    case 3:
    {
        if (OtherTeamer.Num() <= 0)
        {
            return false;
        }
        int local_31 = CommissionStatsUtils::GetStateValue(Pawn, ECommissionPlayerStatsType(local_14));
        int local_16_2 = 0;
        int local_11_4 = local_31;
        for (auto& local_30 : OtherTeamer)
        {
            int local_12_3 = CommissionStatsUtils::GetStateValue(local_30, ECommissionPlayerStatsType(local_14));
            if (local_31 < local_12_3)
            {
                ++local_16_2;
            }
            local_11_4 = local_11_4 + local_12_3;
        }
        if ((local_31 > 0 && (local_11_4 > 0) && (local_16_2 == 1)))
        {
            OutResurlt.SetConfig(Config);
            OutResurlt.SetPercent((local_31 / local_11_4));
            OutResurlt.SetbPercent(true);
            return true;
        }
        return false;
    }
    default:
    {
    }
    }
    return false;
}
TArray<FCommissionBadgeRewardResurlt> GetAllRewardBadge(const FECSEntity &inout Player)
{
    const UCommissionBadgeSettings local_16;
    FECSEntity local_4 = CommissionStatsUtils::CheckAndGetPlayerEntity(Player);
    if ((local_4 == ENTITY_NULL))
    {
        return TArray<FCommissionBadgeRewardResurlt>();
    }
    GetGameplaySettings<UCommissionBadgeSettings> local_18;
    local_16 = local_18;
    TArray<TDataObjectPtr<FCommissionBadgeConfig>> local_28 = local_16.GetAllCommissionBadgeConfig();
    TArray<FECSEntity> local_36 = FTeamUtils::GetTeammates(local_4);
    TArray<FECSEntity> local_40;
    for (auto& local_54 : local_36)
    {
        if ((local_54 == local_4))
        {
            continue;
        }
        local_40.Add(local_54);
    }
    TArray<FCommissionBadgeRewardResurlt> local_60;
    for (auto& local_74 : local_28)
    {
        FCommissionBadgeRewardResurlt local_104;
        if (CommissionStatsUtils::HasRewardBadge(local_74, Player, local_40, local_104))
        {
            local_60.Add(local_104);
        }
    }
    return local_60;
}
}

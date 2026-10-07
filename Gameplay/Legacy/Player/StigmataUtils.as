
namespace StigmataUtils
{
int GetDefaultHealItemMax()
{
    return 4;
}
int ComputeHealItemMaxFromStigmata(const TArray<uint> &inout UnlockedStigmataIds)
{
    int local_1 = 0;
    TDataObjectIterator<FStigmataConfig> local_18;
    for (; local_18; )
    {
        const FStigmataConfig& local_22 = local_18.GetData();
        if (int(local_22.NodeType) != 3)
        {
        }
        else
        {
            if (!(UnlockedStigmataIds.Contains(local_22.DataId)))
            {
            }
            else
            {
                CastTo local_28;
                if (local_28.opCall().IsSet())
                {
                    local_1 = local_1 + 0;
                }
                else
                {
                    local_1 = local_1 + 1;
                }
            }
        }
        local_18.Next();
    }
    return StigmataUtils::GetDefaultHealItemMax() + local_1;
}
int ComputeHealItemMaxByLevel(const int PlayerLevel)
{
    int local_1 = 0;
    TDataObjectIterator<FStigmataConfig> local_18;
    for (; local_18; )
    {
        const FStigmataConfig& local_22 = local_18.GetData();
        int local_2 = int(local_22.NodeType);
        if (local_2 != 3)
        {
        }
        else
        {
            if (int(local_22.RoleLevel) > PlayerLevel)
            {
            }
            else
            {
                if (local_22.UnlockCost.Num() > 0 || ((local_22.GetUnlockCondition().Num() > 0)))
                {
                }
                else
                {
                    CastTo local_30;
                    if (local_30.opCall().IsSet())
                    {
                        local_1 = local_1 + local_2;
                    }
                    else
                    {
                        local_1 = local_1 + 1;
                    }
                }
            }
        }
        local_18.Next();
    }
    return (StigmataUtils::GetDefaultHealItemMax() + local_1);
}
void SetEffectiveHealItemMax(const FECSEntity &inout PlayerEntity, const int RawHealItemMax)
{
    int local_1 = RawHealItemMax;
    int local_3 = FGameModeUtils::GetCombatRestrictionPotionMaxCount();
    if (local_3 >= 0)
    {
        local_1 = FMath::Min(local_1, local_3);
    }
    ECS::GetContextTime();
    FNameHandle_EntityBBVarInt local_10;
    local_10;
    XLog(ELog(0), FString().Append("[StigmataUtils] SetEffectiveHealItemMax: raw=").Append(RawHealItemMax).Append(", effective=").Append(local_1));
    return;
}
void ApplyHealItemMaxToEntity(const FECSEntity &inout PlayerEntity, const TArray<uint> &inout UnlockedStigmataIds)
{
    if (!(PlayerEntity.IsValid()))
    {
        return;
    }
    StigmataUtils::SetEffectiveHealItemMax(PlayerEntity, StigmataUtils::ComputeHealItemMaxFromStigmata(UnlockedStigmataIds));
    return;
}
void ApplyHealItemMaxByLevel(const FECSEntity &inout PlayerEntity, const int PlayerLevel)
{
    if (!(PlayerEntity.IsValid()))
    {
        return;
    }
    StigmataUtils::SetEffectiveHealItemMax(PlayerEntity, StigmataUtils::ComputeHealItemMaxByLevel(PlayerLevel));
    return;
}
void RefreshHealItemMax(const FECSEntity &inout PlayerEntity)
{
    if (!(PlayerEntity.IsValid()))
    {
        return;
    }
    FNameHandle_EntityBBVarInt local_8;
    local_8;
    int local_3_2 = PlayerEntity.GetBB_Int(local_8);
    if (local_3_2 <= 0)
    {
        local_3_2 = StigmataUtils::GetDefaultHealItemMax();
    }
    StigmataUtils::SetEffectiveHealItemMax(PlayerEntity, local_3_2);
    return;
}
int GetEntityHealItemMax(const FECSEntity &inout PlayerEntity)
{
    if (!(PlayerEntity.IsValid()))
    {
        return StigmataUtils::GetDefaultHealItemMax();
    }
    FNameHandle_EntityBBVarInt local_8;
    local_8;
    int local_2_2 = PlayerEntity.GetBB_Int(local_8);
    if (local_2_2 <= 0)
    {
        local_2_2 = StigmataUtils::GetDefaultHealItemMax();
    }
    return local_2_2;
}
}



namespace BoonRandomDropUtils
{
struct FSingleTraitPoolChoosedIndices
{
    UPROPERTY()
    TSet<int> ChoosedIndices;

    FSingleTraitPoolChoosedIndices()
    {
        return;
    }
}

TArray<FTraitParam> RandomTraitsFromSlotsConfig(const FECSEntity &inout PlayerEntity, const FBoonRandomSlotsConfig &inout SlotsConfig)
{
    int local_56;
    bool local_129;
    TArray<FTraitParam> local_4;
    TMap<uint64, BoonRandomDropUtils::FSingleTraitPoolChoosedIndices> local_24;
    for (auto& local_40 : SlotsConfig.Slots)
    {
        for (auto& local_54 : local_40.Pools)
        {
            local_56 = local_54.PoolConfig.GetUniqueID();
            if (!(local_24.Contains(local_56)))
            {
                BoonRandomDropUtils::FSingleTraitPoolChoosedIndices local_78;
                local_24.Add(local_56, local_78);
            }
        }
    }
    for (auto& local_40 : SlotsConfig.Slots)
    {
        TDataObjectPtr<FBoonRandomTraitPoolConfig> local_126 = BoonRandomDropUtils::RandomChooseOnePoolFromSlot(local_40);
        if (!(local_126))
        {
            continue;
        }
        local_56 = local_126.GetUniqueID();
        BoonRandomDropUtils::FSingleTraitPoolChoosedIndices& local_128 = local_24[local_56];
        local_129 = false;
        FTraitParam local_182 = BoonRandomDropUtils::RandomChooseOneTraitFromPool(PlayerEntity, local_128, local_129);
        if (local_129)
        {
            local_4.Add(local_182);
            continue;
        }
        XError(ELog(0), FString().Append("RandomChooseOneTraitFromPool failed, PoolUniqueId: ").Append(local_56));
    }
    return local_4;
}
bool InternalCheckPlayerCtrlHasPawnInAvatarList(const FC_PlayerController &inout PlayerCtrl, const TArray<TDataObjectPtr<FAvatarMappingConfig>> &inout BoonAvatarList)
{
    if (!(PlayerCtrl))
    {
        return false;
    }
    for (auto& local_16 : PlayerCtrl.GetAllPlayerPawnEntities())
    {
        TDataObjectPtr<FAvatarPrefabConfig> local_40 = GetAvatarConfig(local_16);
        for (auto& local_78 : BoonAvatarList)
        {
            if (local_78 && GetAvatar().Contains(local_40))
            {
                return true;
            }
        }
    }
    return false;
}
FTraitParam RandomChooseOneTraitFromPool(const FECSEntity &inout PlayerEntity, const FBoonRandomTraitPoolConfig &inout PoolConfig, BoonRandomDropUtils::FSingleTraitPoolChoosedIndices &inout ChoosedIndices, bool &out bSuccess)
{
    int local_42 = 0;
    int local_48;
    int local_101;
    FTraitParam __r;
    bSuccess = false;
    int local_3 = PoolConfig.TraitParams.Num() - ChoosedIndices.ChoosedIndices.Num();
    if (local_3 <= 0)
    {
        bSuccess = false;
    }
    else
    {
        TArray<bool> local_36;
        int local_4 = PoolConfig.TraitParams.Num();
        local_36.SetNumZeroed(local_4);
        int local_49 = 0;
        int local_50 = 0;
        while (local_50 < local_3)
        {
            if (ChoosedIndices.ChoosedIndices.Contains(local_50))
            {
                local_36[local_50] = true;
            }
            else
            {
                const FBoonRandomSingleTrait& local_52 = PoolConfig.TraitParams[local_50];
                if (int(local_52.Weight) <= 0)
                {
                    local_36[local_50] = true;
                }
                else
                {
                    if (local_52.Param.GetTrait())
                    {
                        EBoonTraitAdaptRule local_104;
                        TDataObjectPtr<FTraitConfig> local_76 = local_52.Param.GetTrait();
                        local_101 = local_4;
                        if (local_42 && (local_101 > 0))
                        {
                            int local_103 = 0;
                            if (local_42.ChoosedTraitCount.Find(local_76, local_103))
                            {
                                if (local_103 >= local_101)
                                {
                                    local_36[local_50] = true;
                                }
                                else
                                {
                                }
                            }
                        }
                        EBoonTraitAdaptRule local_105;
                        local_104 = local_105;
                        local_4 = int(local_104);
                        if (local_4 == 1)
                        {
                            if (!(BoonRandomDropUtils::InternalCheckPlayerCtrlHasPawnInAvatarList(local_48, GetBoonAvatarList())))
                            {
                                local_36[local_50] = true;
                            }
                            else
                            {
                            }
                        }
                        else
                        {
                            if (int(local_104) == 2)
                            {
                                bool local_106;
                                local_106 = false;
                                if (local_48)
                                {
                                    for (auto& local_120 : local_48.GetAllPlayerPawnEntities())
                                    {
                                        local_120;
                                        Get local_124;
                                        const FC_Faction& local_126 = local_124.opCall();
                                        if (local_126)
                                        {
                                            local_4 = int(local_126.GetFactionId());
                                            if (local_4 != 1)
                                            {
                                                local_106 = true;
                                                break;
                                            }
                                        }
                                    }
                                }
                                if (!(local_106))
                                {
                                    local_36[local_50] = true;
                                }
                                else
                                {
                                }
                            }
                        }
                    }
                    local_49 = local_49 + int(local_52.Weight);
                }
            }
            ++local_50;
        }
        if (local_49 <= 0)
        {
            bSuccess = false;
        }
        else
        {
            int local_3_2 = FMath::RandRange(1, local_49);
            local_50 = 0;
            local_101 = 0;
            while (local_101 < local_4)
            {
                if (local_36[local_101])
                {
                }
                else
                {
                    const FBoonRandomSingleTrait& local_52_2 = PoolConfig.TraitParams[local_101];
                    local_50 = local_50 + int(local_52_2.Weight);
                    if (local_3_2 <= local_50)
                    {
                        ChoosedIndices.ChoosedIndices.Add(local_101);
                        bSuccess = true;
                        return __r;
                    }
                }
                ++local_101;
            }
            bSuccess = false;
        }
    }
    return __r;
}
TDataObjectPtr<FBoonRandomTraitPoolConfig> RandomChooseOnePoolFromSlot(const FBoonRandomSingleSlot &inout Slot)
{
    int local_72;
    int local_1 = Slot.Pools.Num();
    if (local_1 == 0)
    {
        return TDataObjectPtr<FBoonRandomTraitPoolConfig>(nullptr);
    }
    int local_53 = 0;
    for (auto& local_68 : Slot.Pools)
    {
        if (int(local_68.Weight) > 0)
        {
            local_1 = int(local_68.Weight);
            local_53 = local_53 + local_1;
        }
    }
    if (local_53 <= 0)
    {
        return TDataObjectPtr<FBoonRandomTraitPoolConfig>(nullptr);
    }
    int local_2 = FMath::RandRange(1, local_53);
    int local_70 = 0;
    int local_71 = 0;
    while (local_71 < local_1)
    {
        local_72 = Slot.Pools[local_71].Weight;
        if (local_72 > 0)
        {
            local_70 = local_70 + local_72;
            if (local_2 <= local_70)
            {
                return Slot.Pools[local_71].PoolConfig;
            }
        }
        ++local_71;
    }
    return TDataObjectPtr<FBoonRandomTraitPoolConfig>(nullptr);
}
}


namespace FMetaBuffUtils
{
TDataObjectPtr<FMetaBuffConfig> GetMetaBuffBySlot(const FECSEntity &inout Entity, const EMetaBuffSlot MetaBuffSlot)
{
    bool local_9;
    int local_22 = 0;
    if (!(FASCommonUtils::GetUniquePlayerEntity(Entity).IsValid()))
    {
        local_9 = false;
    }
    else
    {
        Has local_14;
        local_9 = local_14.opCall();
    }
    if (local_9)
    {
        const TArray<FPlayerMetaBuff>& local_24 = local_22.GetMetaBuffs();
        int local_25 = 0;
        for (; local_25 < local_24.Num(); ++local_25)
        {
            if (0 == int(MetaBuffSlot))
            {
                return local_24[local_25].GetMetaBuffConfig();
            }
        }
    }
    return TDataObjectPtr<FMetaBuffConfig>(nullptr);
}
bool HasMetaBuffBySlot(const FECSEntity &inout Entity, const EMetaBuffSlot MetaBuffSlot = EMetaBuffSlot::None)
{
    bool local_9;
    int local_22 = 0;
    FECSEntity local_8 = FASCommonUtils::GetUniquePlayerEntity(Entity);
    if (!(local_8.IsValid()))
    {
        local_9 = false;
    }
    else
    {
        Has local_14;
        local_9 = local_14.opCall();
    }
    if (local_9)
    {
        const TArray<FPlayerMetaBuff>& local_24 = local_22.GetMetaBuffs();
        if (int(MetaBuffSlot) == 0)
        {
            return (local_24.Num() > 0);
        }
        int local_27 = 0;
        for (; local_27 < local_24.Num(); ++local_27)
        {
            if (0 == int(MetaBuffSlot))
            {
                return true;
            }
        }
    }
    return false;
}
bool IsMetaBuff(const FECSEntity &inout Entity, const FBuffConfigRef &inout BuffConfig)
{
    bool local_1;
    if (!(BuffConfig.IsValid()))
    {
        return false;
    }
    FECSEntity local_10 = FASCommonUtils::GetUniquePlayerEntity(Entity);
    if (!(local_10.IsValid()))
    {
        local_1 = false;
    }
    else
    {
        Has local_14;
        local_1 = local_14.opCall();
    }
    if (local_1)
    {
        int local_18;
        for (auto& local_36 : local_18.GetMetaBuffs())
        {
            local_36;
            if (0 == BuffConfig.GetUniqueID())
            {
                return true;
            }
        }
    }
    return false;
}
bool HasMetaBuffByConfig(const FECSEntity &inout Entity, const TDataObjectPtr<FMetaBuffConfig> &inout MetaBuffConfig)
{
    bool local_9;
    int local_22 = 0;
    FECSEntity local_8 = FASCommonUtils::GetUniquePlayerEntity(Entity);
    if (!(local_8.IsValid()))
    {
        local_9 = false;
    }
    else
    {
        Has local_14;
        local_9 = local_14.opCall();
    }
    if (local_9)
    {
        const TArray<FPlayerMetaBuff>& local_24 = local_22.GetMetaBuffs();
        int local_25 = 0;
        for (; local_25 < local_24.Num(); ++local_25)
        {
            TDataObjectPtr<FMetaBuffConfig> local_52;
            local_52 = local_24[local_25].GetMetaBuffConfig();
            if ((local_52 == MetaBuffConfig.opImplConv()))
            {
                return true;
            }
        }
    }
    return false;
}
UFUNCTION()
bool AddMetaBuff(const FECSEntity &inout Entity, const TDataObjectPtr<FMetaBuffConfig> &inout MetaBuffConfig, const TArray<TDataObjectPtr<FGameplayModifierConfig>> &inout Modifiers, const TArray<TDataObjectPtr<FMetaBuffCapabilityConfig>> &inout Capabilities = TArray<TDataObjectPtr<FMetaBuffCapabilityConfig>>())
{
    int local_35 = 0;
    FECSEntity local_8 = FASCommonUtils::GetUniquePlayerEntity(Entity);
    if (local_8.IsValid())
    {
        int local_36 = local_35;
        if (local_36 == 0)
        {
            XError(ELog(26), FString().Append("MetaBuffConfig.MetaBuffSlot is None, MetaBuffConfig=").Append(MetaBuffConfig.GetDataName()));
            return false;
        }
        FBuffConfigRef local_34;
        if (!(local_34.IsValid()))
        {
            XError(ELog(26), FString().Append("MetaBuffConfig.BuffConfig is invalid, MetaBuffConfig=").Append(MetaBuffConfig.GetDataName()));
            return false;
        }
        if (ECS::GetRuntimeInfo().IsServer)
        {
            FCE_HUDBuffAddHintEvent local_58;
            FECSEntity local_4 = FASCommonUtils::GetUniqueAvatarPawnEntity(local_8);
            FFPTime local_56 = FFPTime(-1);
            local_58.BuffConfig = local_34;
            local_58.BuffFromEntity = local_4;
            local_58.BuffEntity = local_4;
            local_58.bMetaBuff = true;
        }
        return FMetaBuffUtils::AddMetaBuffWithStartTime(local_8, MetaBuffConfig, Modifiers, Capabilities, FDateTime::UtcNow().ToUnixTimestamp());
    }
    XError(ELog(26), FString().Append("AddMetaBuff failed: Entity=").Append(Entity).Append(", MetaBuffConfig=").Append(MetaBuffConfig.GetDataName()));
    return false;
}
bool AddMetaBuffWithStartTime(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMetaBuffConfig> &inout MetaBuffConfig, const TArray<TDataObjectPtr<FGameplayModifierConfig>> &inout Modifiers, const TArray<TDataObjectPtr<FMetaBuffCapabilityConfig>> &inout Capabilities, const uint StartUtcTime)
{
    int local_9 = 0;
    int local_64 = 0;
    int local_71 = 0;
    int local_156 = 0;
    int local_157 = 0;
    if (!(PlayerEntity.IsValid()))
    {
        return false;
    }
    Has local_6;
    local_6.opCall();
    int64 local_8 = local_9;
    int64 local_14 = FDateTime::UtcNow().ToUnixTimestamp();
    if (local_14 >= (StartUtcTime + local_8))
    {
        XLog(ELog(26), FString().Append("AddMetaBuffWithStartTime failed: Time expired, MetaBuffConfig=").Append(MetaBuffConfig.GetDataName()).Append(", Duration=").Append(local_8).Append(", StartUtcTime=").Append(StartUtcTime).Append(", CurrentUtcTime=").Append(local_14));
        return false;
    }
    Get local_58;
    FECSEntity local_54 = local_58.opCall().GetPlayerPawnEntity();
    FBuffConfigRef local_50;
    FMetaBuffUtils::AddMetaBuffToPawn(PlayerEntity, local_50);
    TArray<FPlayerMetaBuff>& local_66 = local_64.GetModify_MetaBuffs();
    int local_67 = -1;
    int local_68 = 0;
    for (; local_68 < local_66.Num(); ++local_68)
    {
        int local_72 = local_71;
        if (0 == local_72)
        {
            local_67 = local_68;
            break;
        }
    }
    if (local_67 == -1)
    {
        FPlayerMetaBuff local_116;
        local_116.SetMetaBuffConfig(MetaBuffConfig);
        local_116.SetStartTime(StartUtcTime);
        for (auto& local_130 : Modifiers)
        {
            local_116.GetModify_RuntimeGamePlayModifierIDs().Add(FGameplayModifierUtils::AddGameplayModifier(local_54, local_130, FFPTime(-1), true));
        }
        for (auto& local_146 : Capabilities)
        {
            if (!(local_146) || !(GetCapabilityConfig()))
            {
                continue;
            }
            local_116.GetModify_RuntimeCapabilitiesIDs().Add(FCapabilityUtils::AddCapability(local_54, GetCapabilityConfig(), local_9));
        }
        local_66.Add(local_116);
        return true;
    }
    if (GetUniqueID() == GetUniqueID())
    {
        bool local_155;
        local_66[local_67].SetStartTime(StartUtcTime);
        bool local_147 = (Modifiers.Num() != local_66[local_67].GetModifiersDataIDs().Num());
        if (!(local_147))
        {
            int local_69;
            local_69 = 0;
            for (; local_69 < Modifiers.Num(); ++local_69)
            {
                local_157 = local_66[local_67].GetModifiersDataIDs()[local_69];
                if (local_156 != local_157)
                {
                    local_147 = true;
                    break;
                }
            }
        }
        if (local_147)
        {
            auto local_164 = local_66[local_67].GetRuntimeGamePlayModifierIDs().Iterator();
            for (; local_164.CanProceed;)
            {
                FGameplayModifierUtils::RemoveGameplayModifier(local_54, local_164.Proceed());
            }
            local_66[local_67].GetModify_RuntimeGamePlayModifierIDs().Empty(0);
            local_66[local_67].GetModify_ModifiersDataIDs().Empty(0);
            for (auto& local_130 : Modifiers)
            {
                local_66[local_67].GetModify_RuntimeGamePlayModifierIDs().Add(FGameplayModifierUtils::AddGameplayModifier(local_54, local_130, FFPTime(-1), true));
            }
        }
        local_68 = Capabilities.Num();
        local_155 = (local_68 != local_66[local_67].GetCapabilitiesConfigs().Num());
        if (!(local_155))
        {
            int local_72_2 = 0;
            for (; local_72_2 < Capabilities.Num(); ++local_72_2)
            {
                if (Capabilities[local_72_2] ? local_157 : 0 != local_66[local_67].GetCapabilitiesConfigs()[local_72_2])
                {
                    local_155 = true;
                    break;
                }
            }
        }
        if (local_155)
        {
            for (auto& local_188 : local_66[local_67].GetRuntimeCapabilitiesIDs())
            {
                FCapabilityUtils::RemoveCapabilityByInstanceId(local_54, local_188);
            }
            local_66[local_67].GetModify_RuntimeCapabilitiesIDs().Empty(0);
            local_66[local_67].GetModify_CapabilitiesConfigs().Empty(0);
            for (auto& local_146 : Capabilities)
            {
                if (!(local_146) || !(GetCapabilityConfig()))
                {
                    continue;
                }
                local_66[local_67].GetModify_RuntimeCapabilitiesIDs().Add(FCapabilityUtils::AddCapability(local_54, GetCapabilityConfig(), local_68));
            }
        }
        return true;
    }
    local_66[local_67].SetMetaBuffConfig(MetaBuffConfig);
    local_66[local_67].SetStartTime(StartUtcTime);
    local_66[local_67].GetModify_RuntimeGamePlayModifierIDs().Empty(0);
    local_66[local_67].GetModify_ModifiersDataIDs().Empty(0);
    local_66[local_67].GetModify_RuntimeCapabilitiesIDs().Empty(0);
    local_66[local_67].GetModify_CapabilitiesConfigs().Empty(0);
    for (auto& local_130 : Modifiers)
    {
        local_66[local_67].GetModify_RuntimeGamePlayModifierIDs().Add(FGameplayModifierUtils::AddGameplayModifier(local_54, local_130, FFPTime(-1), true));
    }
    for (auto& local_146 : Capabilities)
    {
        if (!(local_146) || !(GetCapabilityConfig()))
        {
            continue;
        }
        local_66[local_67].GetModify_RuntimeCapabilitiesIDs().Add(FCapabilityUtils::AddCapability(local_54, GetCapabilityConfig(), local_68));
    }
    return true;
}
UFUNCTION()
void RemoveMetaBuff(const FECSEntity &inout Entity, const TDataObjectPtr<FMetaBuffConfig> &inout MetaBuffConfig)
{
    bool local_9;
    int local_22 = 0;
    if (!(FASCommonUtils::GetUniquePlayerEntity(Entity).IsValid()))
    {
        local_9 = false;
    }
    else
    {
        Has local_14;
        local_9 = local_14.opCall();
    }
    if (local_9)
    {
        int local_26 = local_22.GetMetaBuffs().Num() - 1;
        for (; local_26 >= 0; --local_26)
        {
            TDataObjectPtr<FMetaBuffConfig> local_50;
            local_50 = local_22.GetMetaBuffs()[local_26].GetMetaBuffConfig();
            if ((local_50 == MetaBuffConfig.opImplConv()))
            {
                local_22.GetModify_MetaBuffs().RemoveAt(local_26);
                break;
            }
        }
        if (local_22.GetMetaBuffs().Num() == 0)
        {
            Remove local_102;
            local_102.opCall();
        }
    }
    return;
}
void AddMetaBuffToPawn(const FECSEntity &inout PlayerEntity, const FBuffConfigRef &inout BuffConfig)
{
    bool local_1 = false;
    if (PlayerEntity.IsValid() && BuffConfig.IsValid())
    {
        Has local_6;
        local_6.opCall();
        TDataObjectPtr<FBuffConfig> local_30;
        local_1 = !(local_30.opArrow().bAttrModToAllCharacter);
        Get local_38;
        FBuffUtils::AddBuff(FECSEntity(local_38.opCall().GetPlayerPawnEntity()), BuffConfig, ECS::GetContextTime(), ENTITY_NULL, false, 0.0f, 1, true);
    }
    return;
}
void RemoveMetaBuffFromPawn(const FECSEntity &inout PlayerEntity, const FBuffConfigRef &inout BuffConfig, const TArray<int> &inout RuntimeGamePlayModifierIDs, const TArray<FCapabilityInstanceId> &inout RuntimeCapabilityIDs)
{
    if (PlayerEntity.IsValid())
    {
        Has local_6;
        local_6.opCall();
        Get local_14;
        FECSEntity local_10 = local_14.opCall().GetPlayerPawnEntity();
        FBuffUtils::RemoveBuff(local_10, BuffConfig, ECS::GetContextTime(), EBuffEndType(0));
        for (auto local_33 : RuntimeGamePlayModifierIDs)
        {
            FGameplayModifierUtils::RemoveGameplayModifier(local_10, local_33);
        }
        for (auto& local_48 : RuntimeCapabilityIDs)
        {
            FCapabilityUtils::RemoveCapabilityByInstanceId(local_10, local_48);
        }
    }
    return;
}
}

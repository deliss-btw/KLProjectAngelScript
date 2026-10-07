
namespace FEquipmentUtils
{
int AddEquipmentByTraits(const FECSEntity &inout OwnerEntity, const FEquipmentConfig &inout EquipmentConfig, const EEquipSlotType Slot, const TArray<FTraitParam> &inout Traits)
{
    const FTraitConfig& local_82;
    FTraitCapabilities local_178;
    FTraitModifiers local_188;
    TArray<FCapabilityConfigWithLevel> local_4;
    TArray<FGameplayModifierConfigRefWithArgs> local_8;
    for (auto& local_24 : Traits)
    {
        TDataObjectPtr<FTraitConfig> local_48;
        local_48 = local_24.GetTrait();
        if ((local_48 == nullptr))
        {
            XError(ELog(60), FString().Append("Invalid trait in Equipment ").Append(EquipmentConfig.GetDataName()).Append("."));
            continue;
        }
        if (local_82.GetAdaptAvatar())
        {
            bool local_131;
            TDataObjectPtr<FAvatarPrefabConfig> local_130 = GetAvatarConfig(OwnerEntity);
            local_131 = false;
            for (auto& local_146 : GetAvatar())
            {
                if ((local_146 == local_130.opImplConv()))
                {
                    local_131 = true;
                    break;
                }
            }
            if (!(local_131))
            {
                continue;
            }
        }
        local_82.CapabilitiesByLevel.Find(local_24.GetLevel(), local_178);
        local_4.Append(local_178.Capabilities);
        if (local_82.ModifiersByLevel.Find(local_24.GetLevel(), local_188))
        {
            local_8.Append(local_188.Modifiers);
        }
    }
    return FEquipmentUtils::AddEquipment(OwnerEntity, EquipmentConfig, EEquipSlotType(Slot), local_8, local_4);
}
int AddEquipment(const FECSEntity &inout OwnerEntity, const FEquipmentConfig &inout EquipmentConfig, const EEquipSlotType Slot, const TArray<FGameplayModifierConfigRefWithArgs> &inout Modifiers, const TArray<FCapabilityConfigWithLevel> &inout Capabilities)
{
    int local_6 = 0;
    int local_44 = 0;
    if (!(local_6) || local_6.GetUsedSlot().Contains(Slot))
    {
        XLog(ELog(60), FString().Append("WeaponDebug AddEquipment return by no FC_EquipmentHolder or slot used. Slot: ").Append(int(Slot)).Append(", EquipmentConfig: ").Append(EquipmentConfig.GetDataName()));
        return -1;
    }
    Get local_20;
    const FC_EquipmentUpdateRequest& local_22 = local_20.opCall();
    if (local_22)
    {
        for (auto& local_36 : local_22.AddEquipmentInfos)
        {
            if (int(local_36.GetEquipSlot()) == int(Slot))
            {
                XLog(ELog(60), FString().Append("WeaponDebug AddEquipment return by slot used in pending AddEquipment. Slot: ").Append(int(Slot)).Append(", EquipmentConfig: ").Append(local_36.GetConfig().GetDataName()));
                return -1;
            }
        }
    }
    local_44.SetEquipmentIdCounter((local_44.GetEquipmentIdCounter() + 1));
    FEquipmentAddInfo local_84;
    local_84.SetId(local_44.GetEquipmentIdCounter());
    local_84.SetConfig(TDataObjectPtr<FEquipmentConfig>());
    local_84.SetEquipSlot(EEquipSlotType(Slot));
    local_84.SetModifierConfigs(Modifiers);
    local_84.SetCapabilities(Capabilities);
    local_22.AddEquipmentInfos.Add(local_84);
    XLog(ELog(60), FString().Append("WeaponDebug AddEquipment Add to UpdateRequest. Id: ").Append(local_84.GetId()).Append(", Slot: ").Append(int(Slot)).Append(", EquipmentConfig: ").Append(EquipmentConfig.GetDataName()).Append(", ModifiersNum: ").Append(Modifiers.Num()).Append("."));
    return local_44.GetEquipmentIdCounter();
}
void RemoveEquipment(const FECSEntity &inout OwnerEntity, const int EquipmentId)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return;
    }
    Modify local_12;
    FC_EquipmentUpdateRequest& local_14 = local_12.opCall();
    if (local_14)
    {
        int local_15 = 0;
        for (; local_15 < local_14.AddEquipmentInfos.Num(); ++local_15)
        {
            if (local_14.AddEquipmentInfos[local_15].GetId() == EquipmentId)
            {
                XLog(ELog(60), FString().Append("WeaponDebug RemoveEquipment Remove pending AddEquipment. Id: ").Append(local_14.AddEquipmentInfos[local_15].GetId()).Append(", Slot: ").Append(int(local_14.AddEquipmentInfos[local_15].GetEquipSlot())).Append(", EquipmentConfig: ").Append(local_14.AddEquipmentInfos[local_15].GetConfig().GetDataName()).Append("."));
                local_14.AddEquipmentInfos.RemoveAtSwap(local_15);
                return;
            }
        }
    }
    for (auto& local_42 : local_6.GetEquipmentInfos())
    {
        if (local_42.GetId() == EquipmentId)
        {
            local_14.RemoveEquipmentIds.Add(EquipmentId);
            XLog(ELog(60), FString().Append("WeaponDebug RemoveEquipment Add to RemoveEquipmentIds. Id: ").Append(EquipmentId));
            break;
        }
    }
    return;
}
void RemoveEquipmentBySlot(const FECSEntity &inout OwnerEntity, const EEquipSlotType Slot)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return;
    }
    Modify local_12;
    FC_EquipmentUpdateRequest& local_14 = local_12.opCall();
    if (local_14)
    {
        int local_15 = 0;
        for (; local_15 < local_14.AddEquipmentInfos.Num(); ++local_15)
        {
            if (int(local_14.AddEquipmentInfos[local_15].GetEquipSlot()) == int(Slot))
            {
                XLog(ELog(60), FString().Append("WeaponDebug RemoveEquipment Remove pending AddEquipment by Slot. Slot: ").Append(int(Slot)).Append(", EquipmentConfig: ").Append(local_14.AddEquipmentInfos[local_15].GetConfig().GetDataName()).Append("."));
                local_14.AddEquipmentInfos.RemoveAtSwap(local_15);
                return;
            }
        }
    }
    for (auto& local_42 : local_6.GetEquipmentInfos())
    {
        if (int(local_42.GetEquipSlot()) == int(Slot))
        {
            local_14.RemoveEquipmentIds.Add(local_42.GetId());
            XLog(ELog(60), FString().Append("WeaponDebug RemoveEquipment Add to RemoveEquipmentIds. Id: ").Append(local_42.GetId()).Append(", Slot: ").Append(int(Slot)).Append(", EquipmentConfig: ").Append(local_42.GetConfig().GetDataName()).Append("."));
            break;
        }
    }
    return;
}
FEquipmentData MakeEquipmentDataByPbEquip(const uint ItemId, const FPbEquip &inout PbEquip)
{
    FEquipmentData local_28;
    FEquipmentData __r;
    GetDataObjectByGSDataId<FEquipmentConfig> local_52;
    local_28.SetEquipmentConfig(local_52.opImplConv());
    TArray<FPbUint32Pair> local_80;
    PbEquip.GetTraitLevelList(local_80);
    for (auto& local_96 : local_80)
    {
        FTraitParam local_122;
        int local_147 = local_96.GetFirst();
        GetDataObjectByGSDataId<FTraitConfig> local_146;
        local_122.SetTrait(local_146.opImplConv());
        local_122.SetLevel(local_96.GetSecond());
        local_28.GetTraits().Add(local_122);
    }
    return __r;
}
void GS_RequestChangeEquipment(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FAvatarPrefabConfig> &inout EquippedAvatar, const uint64 ItemUid)
{
    FPbWearWeaponReq local_4;
    local_4.SetAvatarId(EquippedAvatar.opArrow().DataId);
    local_4.SetWeaponGuid(ItemUid);
    if (ECS::GetRuntimeInfo().IsClient)
    {
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        Get local_12;
        if ((PlayerEntity == local_12.opCall().PlayerEntity))
        {
            UGameClientConnectionSubsystem::Get().SendProtoWrapper(local_4.ToWrapper());
        }
    }
    else
    {
        Get local_24;
        const FC_PlayerController& local_26 = local_24.opCall();
        if (local_26)
        {
            UGameDSConnectionSubsystem::Get().SendProtoWrapperByPlayerUid(local_26.GetPlayerId(), local_4.ToWrapper());
        }
    }
    return;
}
TDataObjectPtr<FWeaponConfig> GetGameModeOverrideWeapon(const FECSWorldPtr &inout World, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    bool local_1;
    int local_62 = 0;
    if ((AvatarConfig == nullptr))
    {
        return (TDataObjectPtr<FWeaponConfig>(nullptr));
    }
    if (!(World.IsValid()))
    {
        local_1 = false;
    }
    else
    {
        Has local_54;
        local_1 = local_54.opCall();
    }
    if (local_1)
    {
        if ((int(local_62.GetGameModeType())) != 0)
        {
            TDataObjectPtr<FGameModeOverrideAvatarConfig> local_90;
            if (!(GetGameModeOverride().Find(local_62.GetGameModeType(), local_90)))
            {
                local_1 = false;
            }
            else
            {
                local_1 = local_90;
            }
            local_1 = local_1 && !((GetDefaultWeapon() == nullptr));
            if (local_1)
            {
                return GetDefaultWeapon();
            }
            TDataObjectPtr<FPVPOverrideAvatarConfig> local_114 = GetPVPOverride();
            if (local_114 && !((GetDefaultWeapon() == nullptr)))
            {
                return GetDefaultWeapon();
            }
        }
    }
    return (TDataObjectPtr<FWeaponConfig>(nullptr));
}
void AddInitEquipmentWithoutGS(const FECSEntity &inout PawnEntity)
{
    // body not fully recovered вЂ” stub [argmismatch:argint]
}
uint64 GetAvatarEquipmentUid(const FECSEntity &inout PlayerEntity, const EEquipSlotType Slot, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    Get local_4;
    const FC_DSPlayerAvatarInfo& local_6 = local_4.opCall();
    if (local_6)
    {
        for (auto& local_22 : local_6.GetAvatarList())
        {
            if (local_22.GetAvatarId() == AvatarConfig.opArrow().DataId)
            {
                FDSAvatarEquipmentInfo local_54;
                if (local_22.GetEquipmentInfos().Find(Slot, local_54))
                {
                    return local_54.GetGuid();
                }
            }
        }
    }
    return 0;
}
float32 FindAttributeValue(const TDataObjectPtr<FEquipmentConfig> &inout EquipmentConfig, const FGameAttributeRef &inout Attribute)
{
    for (auto& local_16 : EquipmentConfig.opArrow().AttributeDatas)
    {
        if (local_16.AttributeClass.GetGlobalIndex() == Attribute.GetGlobalIndex())
        {
            return local_16.Value;
        }
    }
    return 0.0f;
}
bool AvatarCanEquip(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig, const TDataObjectPtr<FEquipmentConfig> &inout EquipmentConfig)
{
    CastTo local_4;
    TDataObjectPtr<FWeaponConfig> local_28 = local_4.opCall();
    if (local_28)
    {
        int local_56 = int(AvatarConfig.opArrow().WeaponType);
        int local_57 = int(local_28.opArrow().WeaponType);
        return (local_56 == local_57);
    }
    CastTo local_62;
    if (local_62.opCall())
    {
        return true;
    }
    return false;
}
bool IsTalismanSlot(const EEquipSlotType Slot)
{
    return (int(Slot) == 2 || (int(Slot) == 3) || (int(Slot) == 4) || (int(Slot) == 5));
}
bool CanDecompose(const TDataObjectPtr<FEquipmentConfig> &inout EquipmentConfig)
{
    if (!(EquipmentConfig.IsSet()))
    {
        return false;
    }
    CastTo local_6;
    TDataObjectPtr<FTalismanConfig> local_30 = local_6.opCall();
    if (local_30)
    {
        return (int(local_30.opArrow().TalismanType) != 1);
    }
    return true;
}
}

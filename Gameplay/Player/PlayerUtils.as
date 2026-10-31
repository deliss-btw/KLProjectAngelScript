namespace FPlayerUtils
{
void GetAllPlayerPawnEntitiesInRange(TArray<FECSEntity> &inout OutAllEntities, const FECSWorldPtr &inout World, const FVector &inout Location, const float32 Range, const bool bIncludeBackGround = true)
{
    OutAllEntities.Reset(0);
    FECSRuntimeQuery local_44 = FECSRuntimeQueryHelper::MakeRuntimeQuery(ENTITY_NULL, World, EECSQueryRegsitryType(1), bIncludeBackGround);
    Include local_88;
    local_88.opCall();
    Exclude(local_44).opCall();
    local_44.FilterByDistance(Location, Range);
    FECSRuntimeQueryIterator local_114 = local_44.Iterator();
    for (; local_114.CanProceed;)
    {
        OutAllEntities.Add(local_114.Proceed());
    }
    return;
}
void OverridePlayerAvatarBuild(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FAvatarBuildOverrideConfig> &inout Config)
{
    int local_86 = 0;
    int local_178 = 0;
    int local_184 = 0;
    TDataObjectPtr<FEquipmentConfig> local_238;
    int local_300 = 0;
    if (!(PlayerEntity.IsValid()) || !(Config))
    {
        return;
    }
    const FAvatarBuildOverrideConfig& local_4 = Config.Get();
    if (!(local_4.GetAvatarMappingConfig()))
    {
        XError(ELog(66), "OverridePlayerAvatarBuild failed: AvatarMappingConfig is null");
        return;
    }
    const FAvatarMappingConfig& local_8 = local_4.GetAvatarMappingConfig().Get();
    if (local_8.GetAvatar().Num() == 0)
    {
        XError(ELog(66), "OverridePlayerAvatarBuild failed: AvatarMappingConfig.Avatar is empty");
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> local_34 = local_8.GetAvatar()[0];
    Get local_62;
    const FC_DSPlayerInfo& local_64 = local_62.opCall();
    if (local_64)
    {
        EGenderType local_65;
        local_65 = local_64.GetGender();
        int local_67 = 0;
        for (; local_67 < local_8.GetAvatar().Num(); ++local_67)
        {
            EGenderType local_66 = local_8.GetAvatar()[local_67].Get().GenderType;
            if (int(local_66) == int(local_65))
            {
                local_34 = local_8.GetAvatar()[local_67];
                break;
            }
        }
    }
    if (!(local_34))
    {
        XError(ELog(66), "OverridePlayerAvatarBuild failed: resolved AvatarConfig is invalid");
        return;
    }
    int local_70 = local_34.Get().DataId;
    int local_69 = local_70;
    if (ECS::GetUEWorld() != nullptr && WorldUtils::IsPlayInEditor(ECS::GetUEWorld()))
    {
        bool local_87;
        Has local_80;
        if (!(local_80.opCall()))
        {
            local_86.InitByGameMode();
        }
        local_87 = false;
        for (auto local_102 : local_86.GetAvatarList())
        {
            if (local_102.GetAvatarId() == local_69)
            {
                local_87 = true;
                break;
            }
        }
        if (!(local_87))
        {
            FDSAvatarInfo local_152;
            local_152.SetAvatarId(local_69);
            local_86.GetModify_AvatarList().Add(local_152);
            XLog(ELog(66), FString().Append("OverridePlayerAvatarBuild PIE: stub avatar AvatarId=").Append(local_69));
        }
    }
    if (!(local_86))
    {
        return;
    }
    for (auto local_102 : local_86.GetModify_AvatarList())
    {
        if (local_102.GetAvatarId() == local_69)
        {
            local_178.SetCurLevel(int(local_4.Level));
            int local_70_2 = local_102.GetAvatarId();
            local_184.AtrributeInitConfigByAvatarId.Add(local_70_2, local_4.GetAttributeInitConfig());
            if (local_4.GetWeaponConfig())
            {
                FDSAvatarEquipmentInfo local_214;
                FDataObjectPtr local_262;
                local_262;
                local_214.GetEquipmentData().SetEquipmentConfig(local_238);
                local_102.GetModify_EquipmentInfos().Add(EEquipSlotType(1), local_214);
            }
            if (local_4.bOverrideTalisman)
            {
                int local_264;
                local_102.GetModify_EquipmentInfos().Remove(EEquipSlotType(2));
                local_102.GetModify_EquipmentInfos().Remove(EEquipSlotType(3));
                local_102.GetModify_EquipmentInfos().Remove(EEquipSlotType(4));
                local_102.GetModify_EquipmentInfos().Remove(EEquipSlotType(5));
                int local_263 = 2;
                local_264 = local_263;
                for (auto& local_278 : local_4.GetTalismans())
                {
                    FDSAvatarEquipmentInfo local_214;
                    local_238 = TDataObjectPtr<FEquipmentConfig>(local_278.opImplConv());
                    local_214.GetEquipmentData().SetEquipmentConfig(local_238);
                    local_102.GetModify_EquipmentInfos().Add(EEquipSlotType(local_264), local_214);
                    local_70_2 = local_264 + 1;
                    if (local_70_2 > 5)
                    {
                        break;
                    }
                }
            }
            for (auto& local_292 : local_4.GetUnlockTalents())
            {
                if (local_292 && (int(local_292.Get().UnlockType) == 4))
                {
                    local_102.GetAvatarTalentEquipList().GetModify_OnEquipChooseTalentIdList().Add(local_292.Get().DataId);
                }
            }
            if (local_4.GetFoundationTalent())
            {
                local_70_2 = local_4.GetFoundationTalent().Get().DataId;
            }
            else
            {
                local_70_2 = 0;
            }
            local_102.GetAvatarTalentEquipList().SetOnEquipFoundationId(local_70_2);
            local_300.SetUnlockTalentList(local_4.GetUnlockTalents());
            for (auto& local_318 : local_4.GetReplaceSkillSlotTalents())
            {
                if (local_318.GetValue())
                {
                    local_102.GetAvatarTalentEquipList().GetModify_TalentIdBySkillSlot().Add(local_318.GetKey(), local_318.GetValue().Get().DataId);
                }
            }
            FDivineSkillData local_348;
            local_348.SetSkillConfig(local_4.GetDivineSkill());
            FFPTime local_354 = FFPTime(-1);
            FCE_OnChangeDivineSkillReq local_356;
            local_356.bNeedReply = false;
            break;
        }
    }
    return;
}
}

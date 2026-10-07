
namespace FCombatStateUtils
{
float32 GetDataTrackCombatDuration(const FCombatSession &inout CombatSession, const FFPTime &inout EndTime)
{
    FFPTime local_2 = CombatSession.EnterCombatTime;
    if ((local_2 == 0.0))
    {
        return 0.0f;
    }
    return FMath::Max(0.0f, float32(((EndTime - CombatSession.EnterCombatTime).ToSeconds())));
}
float32 GetDataTrackEngagementDuration(const FCombatSession &inout CombatSession, const FFPTime &inout EndTime)
{
    FFPTime local_2 = CombatSession.FirstDamageTime;
    if ((local_2 == 0.0))
    {
        return 0.0f;
    }
    return FMath::Max(0.0f, float32(((EndTime - CombatSession.FirstDamageTime).ToSeconds())));
}
bool IsInCombat(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_CombatState& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.bInCombat;
    }
    return false;
}
void EnterCombat(const FECSEntity &inout Entity)
{
    int local_26 = 0;
    ModifyOrAdd local_4;
    FC_CombatState& local_6 = local_4.opCall();
    if (local_6)
    {
        if (!(local_6.bInCombat))
        {
            FCS_CombatStateGlobal local_16;
            local_6.bInCombat = true;
            FECSWorldPtr local_10 = Entity.GetWorld();
            local_16.SessionIDCount = (int(local_16.SessionIDCount) + 1);
            local_6.SelfCombatSession.SessionID = int(local_16.SessionIDCount);
            local_6.SelfCombatSession.EndReason = ECombatSessionEndReason(0);
            FECSWorldPtr::Get<FCS_FixedTime> local_24 = FECSWorldPtr::Get<FCS_FixedTime>(Entity.GetWorld());
            local_6.SelfCombatSession.EnterCombatTime = local_26.Time;
            local_6.SelfCombatSession.ExitCombatTime = 0;
            local_6.SelfCombatSession.FirstDamageTime = 0;
            local_6.SelfCombatSession.UncontrollableDuration = 0.0f;
            local_6.LastHPOnEnterCombat = 0.0f;
            local_28 = 0.0f;
            local_6.LastHPMaxOnEnterCombat = 0.0f;
            const FC_GameAttribute& local_34 = FECSEntity::Get<FC_GameAttribute>(Entity).opCall();
            if (local_34)
            {
                local_6.LastHPOnEnterCombat = local_34.GetAttributeValue(Attribute::HP, local_26.Time);
                local_6.LastHPMaxOnEnterCombat = local_34.GetAttributeValue(Attribute::HPMax, local_26.Time);
            }
            if ((int(FLevelUtils::GetCurrentLevelType())) == 1)
            {
                return;
            }
            Get local_40;
            const FC_ControlledByPlayer& local_42 = local_40.opCall();
            if (local_42)
            {
                Has local_46;
                if (local_46.opCall())
                {
                    FPbPlayerLogDsCombatStart local_56;
                    FPbPlayerLogDsCombatCommon local_66 = local_56.GetCommon();
                    FCombatStateUtils::GetDataTrackPbCombatCommonData(Entity, local_66);
                    ServerDataTrackerHelper::InternalLogProtoMessage(local_42.GetPlayerEntity(), Entity, 102501, local_56.ToWrapper(), FProtoWrapper());
                    FCombatStateUtils::LogDataTrackAvatarSnapshot(local_42.GetPlayerEntity(), Entity, 2);
                }
            }
        }
    }
    return;
}
void ExitCombat(const FECSEntity &inout Entity, const ECombatSessionEndReason EndReason)
{
    int local_16 = 0;
    ModifyOrAdd local_4;
    FC_CombatState& local_6 = local_4.opCall();
    if (local_6)
    {
        FECSWorldPtr local_10 = Entity.GetWorld();
        if (local_6.bInCombat)
        {
            local_6.bInCombat = false;
            local_6.SelfCombatSession.ExitCombatTime = local_16.Time;
            local_6.SelfCombatSession.EndReason = EndReason;
            if ((int(FLevelUtils::GetCurrentLevelType())) == 1)
            {
                return;
            }
            Get local_24;
            const FC_ControlledByPlayer& local_26 = local_24.opCall();
            if (local_26)
            {
                Has local_30;
                if (local_30.opCall())
                {
                    FPbPlayerLogDsCombatEnd local_40;
                    FPbPlayerLogDsCombatCommon local_50 = local_40.GetCommon();
                    FCombatStateUtils::GetDataTrackPbCombatCommonData(Entity, local_50);
                    local_40.SetEndStatus(int(local_6.SelfCombatSession.EndReason));
                    local_40.SetCombatDuration(FCombatStateUtils::GetDataTrackCombatDuration(local_6.SelfCombatSession, local_6.SelfCombatSession.ExitCombatTime));
                    local_40.SetEngagementDuration(FCombatStateUtils::GetDataTrackEngagementDuration(local_6.SelfCombatSession, local_6.SelfCombatSession.ExitCombatTime));
                    local_40.SetUncontrollableDuration((local_6.SelfCombatSession.UncontrollableDuration * 1000.0f));
                    ServerDataTrackerHelper::InternalLogProtoMessage(local_26.GetPlayerEntity(), Entity, 102502, local_40.ToWrapper(), FProtoWrapper());
                    FCombatStateUtils::LogDataTrackAvatarSnapshot(local_26.GetPlayerEntity(), Entity, 3);
                }
            }
        }
    }
    return;
}
void EnterBossCombatSession(const FECSEntity &inout PawnEntity, const FECSEntity &inout BossEntity)
{
    FC_CombatState local_6;
    int local_28 = 0;
    int local_44 = 0;
    if ((!(local_6) || !(local_6.bInCombat)))
    {
        return;
    }
    ModifyOrAdd local_12;
    FC_CombatState& local_14 = local_12.opCall();
    if (local_14)
    {
        FBossCombatSessionInfo local_18;
        if (local_14.BossCombatSessions.Contains(BossEntity.GetId()))
        {
            return;
        }
        FECSEntityId local_15 = BossEntity.GetId();
        FECSWorldPtr local_22 = PawnEntity.GetWorld();
        local_18.EnterCombatTime = local_28.Time;
        local_18.ExitCombatTime = 0;
        local_18.FirstDamageTime = 0;
        local_18.UncontrollableDuration = 0.0f;
        Get local_34;
        const FC_MonsterInfo& local_36 = local_34.opCall();
        if (local_36)
        {
            if (local_36.GetMonsterConfig())
            {
                local_18.BossId = local_6.SelfCombatSession.SessionID;
            }
        }
        local_18.BossInstanceId = BossEntity.GetIdValue();
        if ((int(FLevelUtils::GetCurrentLevelType())) == 1)
        {
            return;
        }
        Has local_48;
        if (!(local_44) || !(local_48.opCall()))
        {
            return;
        }
        FPbPlayerLogDsBossCombatStart local_58;
        FPbPlayerLogDsCombatCommon local_68 = local_58.GetCommon();
        FCombatStateUtils::GetDataTrackPbCombatCommonData(PawnEntity, local_68);
        local_58.SetBossCombatSessionId(int(local_18._base_FCombatSession));
        local_58.SetBossId(int(local_18.BossId));
        local_58.SetBossInstanceId(int(local_18.BossInstanceId));
        ServerDataTrackerHelper::InternalLogProtoMessage(local_44.GetPlayerEntity(), PawnEntity, 102503, local_58.ToWrapper(), FProtoWrapper());
    }
    return;
}
void ExitBossCombatSession(const FECSEntity &inout PawnEntity, const FECSEntity &inout BossEntity, FC_CombatState &inout CombatState, const ECombatSessionEndReason EndReason)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void GetDataTrackPbCombatCommonData(const FECSEntity &inout PawnEntity, FPbPlayerLogDsCombatCommon &inout CombatCommon)
{
    Get local_4;
    const FC_CombatState& local_6 = local_4.opCall();
    if (local_6)
    {
        int local_8 = local_6.SelfCombatSession.SessionID;
        CombatCommon.SetCombatSessionId(local_8);
        for (auto& local_26 : local_6.BossCombatSessions)
        {
            local_26;
            FPbPlayerLogDsBossCombatSessionInfo local_36 = CombatCommon.AddBossCombats();
            local_36.SetCombatSessionId(local_8);
            local_36.SetBossId(local_8);
            local_36.SetBossInstanceId(local_8);
        }
    }
    int local_47 = 0;
    FECSWorldPtr local_50 = ECS::GetECSWorld();
    Get local_54;
    const FCS_GameModeDataTrack& local_56 = local_54.opCall();
    if (local_56)
    {
        local_47 = int(local_56.PlayerNumWhenGameModeStart);
    }
    int local_57 = 0;
    FECSWorldPtr local_50_2 = ECS::GetECSWorld();
    FECSRuntimeView local_76 = local_50_2.GetRuntimeView(EECSRuntimeViewType(2));
    Include local_98;
    local_98.opCall();
    FECSRuntimeViewIterator local_132 = local_76.Iterator();
    for (; local_132.CanProceed;)
    {
        local_132.Proceed();
        ++local_57;
    }
    CombatCommon.SetStartMemberCnt(local_47);
    CombatCommon.SetCurMemberCnt(local_57);
    FECSEntity local_172;
    int local_173 = -1;
    Get local_178;
    const FC_ControlledByPlayer& local_180 = local_178.opCall();
    if (local_180)
    {
        local_172 = local_180.GetPlayerEntity();
        Get local_184;
        const FC_PlayerController& local_186 = local_184.opCall();
        if (local_186)
        {
            local_173 = local_186.GetPlayerId();
        }
    }
    if (local_173 != -1)
    {
        FECSWorldPtr local_50_3 = ECS::GetECSWorld();
        Get local_190;
        const FCS_PVX_MatchData& local_192 = local_190.opCall();
        if (local_192)
        {
            FPVX_MatchPlayerEntry local_200;
            local_192.GetPlayerEntries().Find(local_173, local_200);
            int local_204 = int(local_200.GetFaction()) == 1 ? 1 : 2;
            CombatCommon.SetCamp(local_204);
        }
        FECSWorldPtr local_50_4 = ECS::GetECSWorld();
        Get local_208;
        const FCS_PVX_ProgressData& local_210 = local_208.opCall();
        if (local_210)
        {
            FPVX_PlayerProgressData local_258;
            local_210.GetPlayerProgressMap().Find(local_172, local_258);
            CombatCommon.SetPvxLevel(local_258.GetLevel());
        }
    }
    return;
}
void FillDataTrackAvatarEquipment(FPbPlayerLogDsAvatarEquipment &inout Equipment, const EEquipSlotType SlotType, const FEquipmentData &inout EquipmentData)
{
    int local_2 = 0;
    if (!(EquipmentData.GetEquipmentConfig()))
    {
        return;
    }
    Equipment.SetEquipmentId(local_2);
    Equipment.SetEquipmentSlot(int(SlotType));
    for (auto& local_18 : EquipmentData.GetTraits())
    {
        if (!(local_18.GetTrait()))
        {
            continue;
        }
        FPbPlayerLogDsAvatarTrait local_28 = Equipment.AddTrait();
        local_28.SetTraitId(local_2);
        local_28.SetTraitLevel(local_18.GetLevel());
    }
    return;
}
void LogDataTrackAvatarSnapshot(const FECSEntity &inout PlayerEntity, const FECSEntity &inout PawnEntity, const uint TriggerType)
{
    int local_6 = 0;
    int local_28 = 0;
    int local_203;
    int local_253 = 0;
    float32 local_254;
    int local_446 = 0;
    int local_447;
    int local_467;
    if (!(local_6))
    {
        return;
    }
    FECSWorldPtr local_10 = PlayerEntity.GetWorld();
    FPbPlayerLogDsAvatarSnapshot local_26;
    local_26.SetTriggerType(TriggerType);
    int local_27 = 0;
    if (PawnEntity.IsValid())
    {
        Get local_32;
        const FC_CombatState& local_34 = local_32.opCall();
        if (local_34)
        {
            local_28 = local_34.SelfCombatSession.SessionID;
            local_27 = local_28;
        }
    }
    local_26.SetAssociationId(local_27);
    Get local_38;
    const FC_ItemQuickSlot& local_40 = local_38.opCall();
    CastTo local_110;
    if (local_40)
    {
        for (auto& local_58 : local_40.GetQuickSlots())
        {
            local_58;
            TDataObjectPtr<FItemConfig> local_106;
            TDataObjectPtr<FItemConfig> local_82 = local_106;
            if (!(local_82) || !(local_110.opCall()))
            {
                continue;
            }
            FPbPlayerLogDsAvatarItem local_146 = local_26.AddCombatItemList();
            local_146.SetItemId(local_28);
            local_146.SetCurrentNum(FMath::Max(0, InventoryUtils::GetInventoryItemNumber(PlayerEntity, local_82)));
            local_146.SetMaxLimit(FMath::Max(0, GetInventoryMax()));
        }
    }
    if (PawnEntity.IsValid())
    {
        Get local_164;
        const FC_Buff& local_166 = local_164.opCall();
        if (local_166)
        {
            for (auto& local_180 : local_166.GetBuffData())
            {
                FPbPlayerLogDsAvatarBuff local_190 = local_26.AddBuffList();
                local_28 = local_180.ConfigRef.GetUniqueID();
                local_190.SetBuffId(local_28);
                local_203 = 0;
                if (TDataObjectPtr<FBuffConfig>(local_180.ConfigRef))
                {
                    local_203 = local_253;
                }
                local_190.SetBuffType(local_203);
                local_190.SetBuffLayer(FMath::Max(0, int(local_180.StackCount)));
                local_254 = -1.0f;
                FECSEntity local_260 = FECSEntity(local_180.BuffEntityId);
                Get local_264;
                const FC_BuffInstance& local_266 = local_264.opCall();
                if (local_266)
                {
                    if (local_266.GetDuration().ToSeconds() >= 0.0)
                    {
                        local_254 = FMath::Max(0.0f, float32(((local_266.GetEndTime() - 0.Time).ToSeconds())));
                    }
                }
                local_190.SetBuffRemain(local_254);
            }
        }
    }
    local_203 = 0;
    int local_277 = 0;
    if (GetAvatarConfig(local_6.GetPlayerPawnEntity()))
    {
        local_203 = local_28;
    }
    for (auto& local_340 : local_6.GetAllPlayerPawnEntities())
    {
        if (!((local_340 == local_6.GetPlayerPawnEntity())))
        {
            if (GetAvatarConfig(local_340))
            {
                local_277 = local_28;
                break;
            }
        }
    }
    Get local_344;
    const FC_DSPlayerAvatarInfo& local_346 = local_344.opCall();
    if (local_346)
    {
        for (auto& local_360 : local_346.GetAvatarList())
        {
            if (local_360.GetAvatarId() != local_203 && (local_360.GetAvatarId() != local_277))
            {
                continue;
            }
            FPbPlayerLogDsAvatarSchool local_370 = local_26.AddSchoolList();
            local_370.SetAvatarId(local_360.GetAvatarId());
            local_370.SetIsFrontAvatar((local_360.GetAvatarId() == local_203));
            local_370.SetSchoolId(local_360.GetAvatarTalentEquipList().GetOnEquipFoundationId());
            FPbPlayerLogDsAvatarEquipmentList local_390 = local_26.AddEquipmentList();
            local_390.SetAvatarId(local_360.GetAvatarId());
            local_28 = local_360.GetAvatarId();
            local_390.SetIsFrontAvatar((local_28 == local_203));
            for (auto& local_418 : local_360.GetEquipmentInfos())
            {
                if (!(GetEquipmentData().GetEquipmentConfig()))
                {
                    continue;
                }
                if (int(local_418.GetKey()) == 1)
                {
                    FPbPlayerLogDsAvatarEquipment local_430 = local_390.GetWeapon();
                    FCombatStateUtils::FillDataTrackAvatarEquipment(local_430, EEquipSlotType(local_418.GetKey()), GetEquipmentData());
                    continue;
                }
                FPbPlayerLogDsAvatarEquipment local_440 = local_390.AddTalisman();
                FCombatStateUtils::FillDataTrackAvatarEquipment(local_440, EEquipSlotType(local_418.GetKey()), GetEquipmentData());
            }
        }
    }
    for (auto& local_340 : local_6.GetAllPlayerPawnEntities())
    {
        if (!(local_340.IsValid()))
        {
            continue;
        }
        if (!(local_446))
        {
            continue;
        }
        local_447 = 0;
        if (GetAvatarConfig(local_340))
        {
            local_447 = local_28;
        }
        for (auto& local_466 : local_446.GetSkillIndexBySlot())
        {
            local_466;
            local_467 = GetInstanceIndex();
            if (local_467 < 0 || (local_467 >= local_446.GetSkillRuntimeInfos().Num()))
            {
                continue;
            }
            const FSkillRuntimeInfo& local_470 = local_446.GetSkillRuntimeInfos()[local_467];
            if (!(local_470.GetSkillConfig().IsValid()))
            {
                continue;
            }
            FPbPlayerLogDsAvatarSkill local_490 = local_26.AddSkillList();
            local_490.SetAvatarId(local_447);
            local_490.SetIsFrontAvatar((local_447 == local_203));
            local_490.SetSkillId(local_470.GetSkillConfig().ToSoftObjectPath().ToString());
            local_490.SetSkillType((int(GetInputSlot()) == 11 ? 2 : 1));
            local_490.SetSkillLevel(0);
        }
    }
    if (PawnEntity.IsValid())
    {
        ServerDataTrackerHelper::LogProtoMessage3WithPawn(PawnEntity, 102599, local_26.ToWrapper());
    }
    else
    {
        ServerDataTrackerHelper::LogProtoMessage3WithPlayer(PlayerEntity, 102599, local_26.ToWrapper());
    }
    return;
}
}

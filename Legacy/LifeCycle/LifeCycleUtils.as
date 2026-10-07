
enum EServerDataTrackDeathReason
{
    DirectByDamage,
    NearDeathByDamage,
    NearDeathTimeout,
    NearDeathGiveUp,
    KillZone,
    PVXTeamWipe,
}

namespace FLifeCycleUtils
{
void KillEntityCheckNearDeathRule(const FECSEntity &inout DeathEntity, const FECSEntityId &inout KillerEntityId, const FFPTime &inout Time, const bool bESMTransitToDeathState = true, const bool bAutoEnterDestroy = true, const bool bDestroyImmediately = false, const bool bHasDropItem = true)
{
    if (FNearDeathUtils::CheckCanNearDeath(DeathEntity))
    {
        FLifeCycleUtils::EntityNearDeath(DeathEntity, KillerEntityId, Time);
        return;
    }
    Has local_6;
    bool local_1 = local_6.opCall();
    FLifeCycleUtils::EntityDeath(DeathEntity, KillerEntityId, Time, bESMTransitToDeathState, bAutoEnterDestroy, bDestroyImmediately, bHasDropItem, EDeathReason(0));
    if (!(local_1))
    {
        FLifeCycleUtils::ServerDataTrackPlayerDeath(DeathEntity, EServerDataTrackDeathReason(0), KillerEntityId);
    }
    return;
}
void EntityNearDeath(const FECSEntity &inout DeathEntity, const FECSEntityId &inout KillerEntityId, const FFPTime &inout Time)
{
    int local_3 = 0;
    int local_28 = 0;
    int local_50 = 0;
    int local_68 = 0;
    float32 local_70;
    int local_96 = 0;
    int local_116 = 0;
    int local_124 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer) && (int(DeathEntity.GetRegistryType()) != 2))
    {
        return;
    }
    if (!(DeathEntity.IsValid()))
    {
        XWarning(ELog(0), FString().Append("DeathEntity is invalid, entityId: '").Append(DeathEntity.GetIdValue()).Append("'!"));
        return;
    }
    if (!(FASCommonUtils::IsAvatarPrefab(DeathEntity)))
    {
        XWarning(ELog(0), FString().Append("Only avatar can near death, entityId: '").Append(DeathEntity.GetIdValue()).Append("'!"));
        return;
    }
    Has local_16;
    bool local_1 = local_16.opCall();
    if (local_1)
    {
        FString local_20 = (DeathEntity.ToString() + " Already NearDead!");
        XWarning(ELog(0), local_20);
        return;
    }
    FECSWorldPtr local_22 = ECS::GetECSWorld();
    if (!(local_28.GetReviveData()))
    {
        FString local_20_2 = (DeathEntity.ToString() + " not found revivedata!");
        XError(ELog(0), local_20_2);
        return;
    }
    XLogTrace(ELog(0), FString().Append("EntityNearDeath: ").Append(DeathEntity.ToString()).Append(" is entering NearDeath, KillerEntityId: ").Append(KillerEntityId.ToString()).Append(", Time: ").Append(Time.ToString()).Append("."));
    FECSEntityId local_37 = KillerEntityId;
    Get local_42;
    const FC_DeathResistance& local_44 = local_42.opCall();
    if (local_44)
    {
        local_3 = local_44.GetResistanceCount();
        FString local_10 = DeathEntity.ToString();
        XLog(ELog(0), FString().Append("EntityNearDeath: ").Append(local_10).Append(" is entering NearDeath with DeathResistance, count = ").Append(local_3).Append("."));
        if (local_44.GetResistanceCount() > 0)
        {
            local_1 = !(local_44.GetbDyingDuringResistance());
            if (local_1)
            {
                local_50.SetbDyingDuringResistance(true);
                local_50.SetKillerEntityId(KillerEntityId);
            }
            return;
        }
        if (local_44.GetbDyingDuringResistance())
        {
            local_37 = local_44.GetKillerEntityId();
        }
    }
    Assign local_54;
    local_54.opCall(FC_NearDeathTag());
    int local_69 = local_3;
    if (0 == 0)
    {
        local_70 = local_69;
    }
    else
    {
        Get local_78;
        local_70 = (local_69 / 100.0f) * local_78.opCall().GetAttributeValue(Attribute::HPMax, Time);
    }
    local_68.SetNearDeathHP(local_70);
    local_68.SetMaxNearDeathHP(local_70);
    local_68.SetKilledByEntity(local_37);
    local_68.SetbCanHitOrLockTargetWhenNearDeath(local_1);
    if (!(local_68.GetbCanHitOrLockTargetWhenNearDeath()))
    {
        Modify local_82;
        FC_HitBox& local_84 = local_82.opCall();
        if (local_84)
        {
            local_84.GetOptions().DisableByReason(ECollisionDisableReason(8));
        }
    }
    Has local_90;
    bool local_5 = local_90.opCall();
    if (local_5)
    {
        FBuffUtils::RemoveBuffByNearDeath(DeathEntity, Time);
    }
    FLifeCycleUtils::ClearEntityHpAndAbnormalAttribute(DeathEntity, Time);
    local_3 = local_96.GetNearDeathCount();
    local_3 = local_3 + 1;
    local_96.SetNearDeathCount(local_3);
    Get local_100;
    const FC_CharacterMovement& local_102 = local_100.opCall();
    if (local_102)
    {
        if (local_102.GetbAirborne())
        {
            ModifyOrAdd local_106;
            local_106.opCall().SetbWaitLand(true);
        }
    }
    bool local_107 = false;
    Get local_112;
    const FC_NearDeathDeferTransition& local_114 = local_112.opCall();
    if (local_114)
    {
        local_107 = local_114.NeedDefer();
    }
    if (!(local_107))
    {
        FLifeCycleUtils::ESMTransitToNearDeath(DeathEntity);
    }
    FECSWorldPtr local_22_2 = DeathEntity.GetWorld();
    FFPTime local_118 = Time;
    if (local_118.opCmp(local_116.LastTime) < 0)
    {
        local_118 = local_116.Time;
    }
    local_124.SetbPredictable(false);
    local_124.KilledByEntity = local_37;
    return;
}
void ClearEntityHpAndAbnormalAttribute(const FECSEntity &inout Entity, const FFPTime &inout Time)
{
    FASCommonUtils::GetUniquePlayerEntity(Entity);
    FC_AbnormalClearTag local_14;
    Assign local_12;
    local_12.opCall(local_14);
    return;
}
void ESMTransitToNearDeath(const FECSEntity &inout Entity)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return;
    }
    Has local_10;
    bool local_5 = local_10.opCall();
    if (local_5)
    {
        return;
    }
    FESMExternalTransitHandle local_20 = Entity.ESMExternalTransitMainSM(n"HitNearDeath", NAME_None);
    local_20.SetBlockExternalTransits(true);
    return;
}
void EntityRescueFromNearDeath(const FECSEntity &inout RescueEntity, const FECSEntity &inout RescueByEntity, const FFPTime &inout Time, const bool bRescueWithAnimation, const float32 OverrideHpRatio = 0)
{
    int local_4 = 0;
    int local_28 = 0;
    int local_66 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer) && (int(RescueEntity.GetRegistryType()) != 2))
    {
        return;
    }
    if (!(RescueEntity.IsValid()))
    {
        XWarning(ELog(0), FString().Append("RescueEntity is invalid, entityId: '").Append(RescueEntity.GetIdValue()).Append("'!"));
        return;
    }
    if (!(FASCommonUtils::IsAvatarPrefab(RescueEntity)))
    {
        XWarning(ELog(0), FString().Append("Only avatar can rescue from near death, entityId: '").Append(RescueEntity.GetIdValue()).Append("'!"));
        return;
    }
    Has local_16;
    if (!(local_16.opCall()))
    {
        FString local_10 = RescueEntity.ToString();
        return;
    }
    FECSWorldPtr local_22 = ECS::GetECSWorld();
    if (!(local_28.GetReviveData()))
    {
        FString local_10_2 = RescueEntity.ToString();
        return;
    }
    if (bRescueWithAnimation)
    {
        FESMExternalTransitHandle local_36 = RescueEntity.ESMExternalTransitMainSM(n"NearDeathRescue", NAME_None);
    }
    FNearDeathUtils::TryRestoreHitboxFromNearDeath(RescueEntity);
    Remove local_40;
    local_40.opCall();
    Remove local_44;
    local_44.opCall();
    Remove local_48;
    local_48.opCall();
    Get local_54;
    float32 local_55 = local_54.opCall().GetAttributeValue(Attribute::HPMax, Time);
    float32 local_49 = local_4;
    local_49 = local_49 / 100.0f;
    if (OverrideHpRatio > 0.0f)
    {
        local_49 = FMath::Clamp(OverrideHpRatio, 0.0f, 1.0f);
    }
    float32 local_57_2 = local_55 * local_49;
    FGameAttributeUtils::Recover(RescueEntity, Attribute::HP, Time, local_57_2, -1.0f);
    local_66.RescueByEntity = RescueByEntity;
    CommissionStatsUtils::AddRescueTeammateCount(RescueByEntity);
    return;
}
void EntityDeath(const FECSEntity &inout DeathEntity, const FECSEntityId &inout KillerEntityId, const FFPTime &inout Time, const bool bESMTransitToDeathState = true, const bool bAutoEnterDestroy = true, const bool bDestroyImmediately = false, const bool bHasDropItem = true, const EDeathReason Reason = EDeathReason::Combat)
{
    int local_46 = 0;
    int local_100 = 0;
    int local_116 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer) && (int(DeathEntity.GetRegistryType()) != 2))
    {
        return;
    }
    if (!(DeathEntity.IsValid()))
    {
        XWarning(ELog(0), FString().Append("DeathEntity is invalid, entityId: '").Append(DeathEntity.GetIdValue()).Append("'!"));
        return;
    }
    Has local_16;
    bool local_1 = local_16.opCall();
    if (local_1)
    {
        local_1 = true;
    }
    else
    {
        Has local_20;
        local_1 = local_20.opCall();
    }
    if (local_1)
    {
        FString local_24 = (DeathEntity.ToString() + " Already Dead!");
        XWarning(ELog(0), local_24);
        return;
    }
    XLog(ELog(0), FString().Append("EntityDeath: ").Append(DeathEntity.ToString()).Append(" is dying, KillerEntityId: ").Append(KillerEntityId.ToString()).Append(", Time: ").Append(Time.ToString()).Append("."));
    FECSEntityId local_33 = KillerEntityId;
    Get local_38;
    const FC_DeathResistance& local_40 = local_38.opCall();
    if (local_40)
    {
        FString local_10 = DeathEntity.ToString();
        XLog(ELog(0), FString().Append("EntityDeath: ").Append(local_10).Append(" has DeathResistance, count = ").Append(local_40.GetResistanceCount()).Append("."));
        if (local_40.GetResistanceCount() > 0)
        {
            if (!(local_40.GetbDyingDuringResistance()))
            {
                local_46.SetbDyingDuringResistance(true);
                local_46.SetKillerEntityId(KillerEntityId);
            }
            return;
        }
        if (local_40.GetbDyingDuringResistance())
        {
            local_33 = local_40.GetKillerEntityId();
        }
    }
    if (CommissionStatsUtils::CheckInMissionCommission())
    {
        if (!((CommissionStatsUtils::GetPlayer(DeathEntity) == ENTITY_NULL)))
        {
            FBuffConfigRef local_78 = FBuffConfigRef(CommissionUtils::GetCommissionSettings().CommissionDeathBuffConfig);
            if (local_78.IsValid())
            {
                FBuffUtils::AddBuff(DeathEntity, local_78, Time, DeathEntity, false, -1.0f, 1, false);
            }
        }
    }
    FLifeCycleUtils::DeactiveComps(DeathEntity);
    Assign local_86;
    local_86.opCall(FC_DeathTag());
    FC_DeathKiller local_94;
    Assign local_92;
    local_92.opCall(local_94).SetKillerEntityId(local_33);
    FCombatStateUtils::ExitCombat(DeathEntity, ECombatSessionEndReason(2));
    FECSWorldPtr local_98 = DeathEntity.GetWorld();
    FFPTime local_102 = Time;
    if (local_102.opCmp(local_100.LastTime) < 0)
    {
        local_102 = local_100.Time;
    }
    FCE_DeathEvent local_108;
    local_108.SetbPredictable(false);
    local_108.KilledByEntity = local_33;
    local_108.bHasDropItem = bHasDropItem;
    bool local_109 = false;
    if (!(bESMTransitToDeathState))
    {
        local_109 = true;
    }
    if (!(bAutoEnterDestroy) || bDestroyImmediately)
    {
        local_109 = true;
    }
    if (local_109)
    {
        local_116.SetbESMTransitToDeathState(bESMTransitToDeathState);
        local_116.SetbAutoEnterDestroy(bAutoEnterDestroy);
        local_116.SetbDestroyImmediately(bDestroyImmediately);
        local_116.SetReason(EDeathReason(Reason));
    }
    Has local_120;
    bool local_1_3 = local_120.opCall();
    if (local_1_3)
    {
        Get local_124;
        const FC_LockTarget& local_126 = local_124.opCall();
        if (local_126)
        {
            FLockTargetUtils::DisposeChangeLockTarget(DeathEntity, ENTITY_NULL, local_126.GetTargetEntity(), -1, false, EPreChangeTargetReason(4), ELockTargetType(0));
        }
    }
    return;
}
void DeactiveComps(const FECSEntity &inout Entity)
{
    Modify local_4;
    FC_Buff& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.SetbActive(false);
    }
    Modify local_12;
    FC_EASAbility& local_14 = local_12.opCall();
    if (local_14)
    {
        local_14.bActive = false;
    }
    return;
}
void EntityReadyToDestroy(const FECSEntity &inout Entity)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        FString local_10 = Entity.ToString();
        return;
    }
    FC_ReadyToDestroyTag local_22;
    Assign local_20;
    local_20.opCall(local_22);
    FLifeCycleUtils::DeactiveComps(Entity);
    return;
}
void EntityDisappear(const FECSEntity &inout Entity, const FFPTime &inout CurTime, const FFPTime &inout FadeOutDuration, const bool bDisableMoveCollision, const bool bDisableHitBox, const bool bDisableOverlapCollision)
{
    if ((Entity == ENTITY_NULL))
    {
        XWarning(ELog(0), "Entity is NULL!");
        return;
    }
    FLifeCycleUtils::EntityReadyToDestroy(Entity);
    FCE_EntityDisappear local_8;
    local_8.FadeOutDuration = FadeOutDuration;
    local_8.bDisableMoveCollision = bDisableMoveCollision;
    local_8.bDisableHitBox = bDisableHitBox;
    local_8.bDisableOverlapCollision = bDisableOverlapCollision;
    return;
}
void EntityDestroyDirectly(const FECSEntity &inout DeadEntity, const FFPTime &inout Time)
{
    Has local_4;
    if (local_4.opCall() || (int(DeadEntity.GetRegistryType()) == 2))
    {
        FLifeCycleUtils::EntityReadyToDestroy(DeadEntity);
        DeadEntity.DestroyDeferred();
    }
    return;
}
void EntityDestroyByChangeRole(const FECSEntity &inout DeadEntity, const FFPTime &inout Time)
{
    Has local_4;
    if (local_4.opCall() || (int(DeadEntity.GetRegistryType()) == 2))
    {
        Get local_14;
        const FC_ControlledByPlayer& local_16 = local_14.opCall();
        if (local_16)
        {
            if (local_16.GetPlayerEntity().IsValid())
            {
                Modify local_20;
                FC_DivineSkill& local_22 = local_20.opCall();
                if (local_22)
                {
                    DivineSkillUtils::RemoveDivineSkillModifier(DeadEntity, local_22);
                }
            }
        }
        Get local_26;
        if (local_26.opCall())
        {
            Modify local_32;
            if (local_32.opCall())
            {
            }
        }
        FLifeCycleUtils::EntityReadyToDestroy(DeadEntity);
        DeadEntity.DestroyDeferred();
    }
    return;
}
void SetEntityActiveByDuration(const FECSEntity &inout Entity, const FFPTime &inout Duration, const FFPTime &inout CurTime)
{
    int local_6 = 0;
    local_6.SetActiveTime(CurTime);
    local_6.SetDuration(Duration);
    return;
}
void ServerDataTrackPlayerDeath(const FECSEntity &inout Pawn, const EServerDataTrackDeathReason Reason, const FECSEntityId &inout KillerEntityId)
{
    int local_61 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    Has local_6;
    if (!(local_6.opCall()))
    {
        return;
    }
    FASCommonUtils::GetUniquePlayerEntity(Pawn);
    Has local_18;
    if (!(local_18.opCall()))
    {
        return;
    }
    FPbPlayerLogDsPlayerDeath local_28;
    local_28.SetDeathType(int(Reason));
    FPbPlayerLogDsCombatCommon local_40 = FPbPlayerLogDsCombatCommon(local_28.GetCommon());
    FCombatStateUtils::GetDataTrackPbCombatCommonData(Pawn, local_40);
    FECSEntity local_14 = FECSEntity(KillerEntityId);
    if (local_14.IsValid())
    {
        Get local_58;
        const FC_ControlledByPlayer& local_60 = local_58.opCall();
        if (local_60)
        {
            local_28.SetSourceEntityType(1);
            if (GetAvatarConfig(local_14))
            {
                local_28.SetSourceEntityConfigId(local_61);
            }
            local_61 = FASCommonUtils::GetPlayerUidFromPlayerEntity(local_60.GetPlayerEntity());
            local_28.SetSourceEntityInstanceId(local_61);
        }
        else
        {
            Get local_114;
            const FC_MonsterInfo& local_116 = local_114.opCall();
            if (local_116)
            {
                local_28.SetSourceEntityType(2);
                if (local_116.GetMonsterConfig())
                {
                    local_28.SetSourceEntityConfigId(local_61);
                }
                local_28.SetSourceEntityInstanceId(local_14.GetIdValue());
            }
            else
            {
                local_28.SetSourceEntityType(0);
                local_28.SetSourceEntityInstanceId(local_14.GetIdValue());
            }
        }
    }
    ServerDataTrackerHelper::LogProtoMessage3WithPawn(Pawn, 102514, local_28.ToWrapper());
    return;
}
void ServerDataTrackPlayerRevive(const FECSEntity &inout Pawn, const EReviveType ReviveType)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    Has local_6;
    bool local_1 = local_6.opCall();
    if (local_1)
    {
        return;
    }
    FASCommonUtils::GetUniquePlayerEntity(Pawn);
    Has local_18;
    if (!(local_18.opCall()))
    {
        return;
    }
    FPbPlayerLogDsPlayerRevive local_28;
    local_28.SetReviveType(int(ReviveType));
    FPbPlayerLogDsCombatCommon local_40 = FPbPlayerLogDsCombatCommon(local_28.GetCommon());
    FCombatStateUtils::GetDataTrackPbCombatCommonData(Pawn, local_40);
    ServerDataTrackerHelper::LogProtoMessage3WithPawn(Pawn, 102515, local_28.ToWrapper());
    return;
}
}

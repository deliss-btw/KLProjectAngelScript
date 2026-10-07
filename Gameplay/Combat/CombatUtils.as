

struct __Lambda_Gameplay_Combat_CombatUtils_783
{
    UPROPERTY()
    FVector __SelfEntityLocation;

    __Lambda_Gameplay_Combat_CombatUtils_783()
    {
        return;
    }
    __Lambda_Gameplay_Combat_CombatUtils_783(const FVector &inout _InSelfEntityLocation)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FVector GetSelfEntityLocation() property
    {
        FVector __r;
        return __r;
    }
    bool opCall(const FTargetEntity &inout A, const FTargetEntity &inout B)
    {
        FECSEntity local_4 = A.GetEntity();
        Get local_8;
        float local_10 = this.GetSelfEntityLocation().Distance(local_8.opCall().GetPosition());
        FECSEntity local_4_2 = B.GetEntity();
        return (local_10 < this.GetSelfEntityLocation().Distance(local_8.opCall().GetPosition()));
    }
}

namespace FCombatUtils
{
TDataObjectPtr<FAttackData> GetAttackDataPtrFromDataTable(const FDataObjectPtr &inout DataTableRowHandle, const FECSEntity &inout ContextEntity)
{
    if (!(DataTableRowHandle.IsValid()))
    {
        XError(ELog(0), FString().Append("[Error] Cannot find AttackData config row, Entity: ").Append(ContextEntity.GetEntityName()).Append(", table: ").Append(DataTableRowHandle.GetRoot().GetName()).Append(", row: ").Append(DataTableRowHandle.GetDataName()).Append("."));
    }
    return TDataObjectPtr<FAttackData>(DataTableRowHandle);
}
EFactionRelationSplitSelf GetHitCheckEntityFactionRelation(const FECSEntity &inout HitCaster, const FECSEntity &inout Receiver)
{
    FECSEntity local_4 = Receiver;
    Has local_8;
    while (!(local_8.opCall()))
    {
        Get local_14;
        const FC_Owner& local_16 = local_14.opCall();
        if (local_16)
        {
            local_4 = local_16.GetOwnerEntity();
        }
        else
        {
            break;
        }
    }
    return FASCommonUtils::GetEntityFactionRelationSplitSelf(HitCaster, local_4);
}
bool HitCheckCondition(const EFactionRelationSplitSelf FactionRelation, const uint8 AffectFactionRelationBitMask, const TDataObjectPtr<FAttackData> &inout AttackData, const FHitCheckCondition &inout HittableCondition)
{
    bool local_2 = false;
    bool local_1 = local_2;
    if (int(HittableCondition.RelationCheckType) == 0)
    {
        local_2 = ((int(FactionRelation) & AffectFactionRelationBitMask) != 0);
        local_1 = local_2;
    }
    else
    {
        if (int(HittableCondition.RelationCheckType) == 1)
        {
            int local_4 = int(FactionRelation);
            int local_9 = local_4 & int(HittableCondition.Relation);
            local_2 = (local_9 != 0);
            local_1 = local_2;
        }
        else
        {
            if (int(HittableCondition.RelationCheckType) == 2)
            {
                if ((int(FactionRelation) & AffectFactionRelationBitMask) == 0)
                {
                    local_2 = false;
                }
                else
                {
                    int local_5 = int(FactionRelation);
                    int local_8 = local_5 & int(HittableCondition.Relation);
                    local_2 = (local_8 != 0);
                }
                local_1 = local_2;
            }
        }
    }
    if (local_1)
    {
        if (!(HittableCondition.AttackTags.IsEmpty()) && !((AttackData == nullptr)))
        {
            if ((local_2 && !(HittableCondition.bInverseCheckTags)) || (!(local_2) && HittableCondition.bInverseCheckTags))
            {
                return true;
            }
        }
        else
        {
            return true;
        }
    }
    return false;
}
FECSEntity GetFinalHitEntity(const FECSEntity &inout HitEntity)
{
    FECSEntity local_4 = HitEntity;
    Get local_10;
    const FC_PerfectDodge& local_6 = local_10.opCall();
    if (local_6)
    {
        local_4 = local_6.GetFinalHitEntity(HitEntity);
    }
    return local_4;
}
FHitTestCheckResult CheckHitTestResult(const FECSEntity &inout HitCaster, const TDataObjectPtr<FAttackData> &inout AttackDataPtr, const EAttackType AttackType, const FName &inout AttackTag, const uint8 AffectFactionRelationBitMask, const FHitTestResult &inout Result, const FAttackHitTestProtectData &inout HitTestProtectData)
{
    FHitTestCheckResult local_2;
    int local_68 = 0;
    local_2.Relation = EFactionRelationSplitSelf(EFactionRelationSplitSelf(1));
    local_2.CheckResult = EHitTestCheckResult(1);
    FECSEntity local_8 = FECSEntity(Result.HitEntity);
    if (!(local_8.IsValid()))
    {
        return local_2;
    }
    Has local_14;
    bool local_9 = local_14.opCall();
    if (local_9)
    {
        local_2.CheckResult = EHitTestCheckResult(11);
        return local_2;
    }
    Has local_18;
    bool local_9_2 = local_18.opCall();
    if (local_9_2)
    {
        local_2.CheckResult = EHitTestCheckResult(10);
        return local_2;
    }
    EFactionRelationSplitSelf local_3_2 = FCombatUtils::GetHitCheckEntityFactionRelation(HitCaster, local_8);
    local_2.Relation = EFactionRelationSplitSelf(local_3_2);
    Get local_24;
    const FC_HittableConfig& local_26 = local_24.opCall();
    if (local_26)
    {
        bool local_27;
        local_27 = false;
        int local_28 = 0;
        for (auto& local_44 : local_26.ConditionalResolveOptions)
        {
            local_27 = FCombatUtils::HitCheckCondition(EFactionRelationSplitSelf(local_3_2), uint8(AffectFactionRelationBitMask), AttackDataPtr, local_44.Condition);
            if (local_27)
            {
                local_2.CheckResult = EHitTestCheckResult(0);
                local_2.ConditionalResolveIndex = local_28;
                break;
            }
            ++local_28;
        }
        if (!(local_27))
        {
            if (!(FCombatUtils::HitCheckCondition(EFactionRelationSplitSelf(local_3_2), uint8(AffectFactionRelationBitMask), AttackDataPtr, local_26.DefaultCondition)))
            {
                local_2.CheckResult = EHitTestCheckResult(3);
                return local_2;
            }
        }
    }
    else
    {
        int local_29 = int(local_3_2);
        if ((local_29 & AffectFactionRelationBitMask) == 0)
        {
            local_2.CheckResult = EHitTestCheckResult(3);
            return local_2;
        }
    }
    if (int(AttackType) != 4 && local_8.MatchGameplayTag(GameplayTags::ESM_CombatFlag_Invincible))
    {
        local_2.CheckResult = EHitTestCheckResult(4);
        return local_2;
    }
    if (int(AttackType) == 0 && local_8.MatchGameplayTag(GameplayTags::ESM_CombatFlag_GuardInvincible))
    {
        local_2.CheckResult = EHitTestCheckResult(9);
        return local_2;
    }
    if (int(AttackType) == 0 || (int(AttackType) == 2))
    {
        Get local_56;
        if (local_56.opCall())
        {
            local_2.CheckResult = EHitTestCheckResult(6);
            return local_2;
        }
    }
    if (int(AttackType) == 0 || (int(AttackType) == 2))
    {
        if (local_8.MatchGameplayTag(GameplayTags::ESM_CombatFlag_DodgeInvincible))
        {
            local_2.CheckResult = EHitTestCheckResult(5);
            return local_2;
        }
    }
    if (int(AttackType) == 1)
    {
        bool local_27;
        local_27 = false;
        Get local_60;
        const FC_CharacterMovement& local_62 = local_60.opCall();
        if (local_62)
        {
            if (local_62.GetbAirborne())
            {
                local_27 = true;
            }
        }
        if (local_27 || local_8.MatchGameplayTag(GameplayTags::ESM_CombatFlag_JumpInvincible))
        {
            local_2.CheckResult = EHitTestCheckResult(7);
            return local_2;
        }
    }
    if (int(AttackType) == 0 || (int(AttackType) == 1))
    {
        bool local_27;
        if (local_68)
        {
            for (auto& local_82 : HitTestProtectData.DodgeProtectGroup)
            {
                if (local_68.GetDodgeProtect().Contains(local_82))
                {
                    local_2.CheckResult = EHitTestCheckResult(8);
                    return local_2;
                }
            }
        }
        if (local_8.MatchGameplayTag(GameplayTags::ESM_CombatFlag_AvatarBeHitInvincible) && local_8.MatchGameplayTag(GameplayTags::Character_Avatar_Base))
        {
            local_27 = false;
            if (local_68)
            {
                for (auto& local_82 : HitTestProtectData.ForceHitInvincibleGroup)
                {
                    if (local_68.GetForceHitInvincible().Contains(local_82))
                    {
                        local_27 = true;
                        break;
                    }
                }
            }
            if (!(local_27))
            {
                local_2.CheckResult = EHitTestCheckResult(8);
                return local_2;
            }
        }
    }
    Get local_86;
    const FC_IgnoreAttackFromEntities& local_88 = local_86.opCall();
    if (local_88)
    {
        if (HitCaster.IsValid() && local_88.GetIgnoredEntities().Contains(HitCaster))
        {
            local_2.CheckResult = EHitTestCheckResult(4);
            return local_2;
        }
    }
    Get local_92;
    const FC_IgnoreSpecificAttackTagHit& local_94 = local_92.opCall();
    if (local_94)
    {
        bool local_9_4 = local_94.GetCountByTagName().Contains(AttackTag);
        if ((local_9_4 && !(local_94.GetbInverseIgnore())) || (!(local_9_4) && local_94.GetbInverseIgnore()))
        {
            local_2.CheckResult = EHitTestCheckResult(4);
            return local_2;
        }
    }
    Get local_100;
    const FC_AttackIgnoreSpecificTarget& local_102 = local_100.opCall();
    if (local_102)
    {
        TDataObjectPtr<FAttackIgnoreTargetCondition> local_126;
        if (local_102.GetConditionByAttackData().Find(AttackDataPtr, local_126))
        {
            if (!((local_126 == nullptr)))
            {
                TArrayConstIterator<FBuffConfigRef> local_132;
                for (; local_132.CanProceed;)
                {
                    if (FBuffUtils::HasBuff(local_8, local_132.Proceed()))
                    {
                        local_2.CheckResult = EHitTestCheckResult(4);
                        return local_2;
                    }
                }
            }
        }
    }
    if (local_68)
    {
        for (auto& local_82 : HitTestProtectData.MultiStrikeProtectGroup)
        {
            if (local_68.GetMultiStrikeProtect().Contains(local_82))
            {
                local_2.CheckResult = EHitTestCheckResult(8);
                return local_2;
            }
        }
    }
    local_2.CheckResult = EHitTestCheckResult(0);
    return local_2;
}
bool IsAttackPreventByHitTestProtect(const FECSEntity &inout HitEntity, const FAttackHitTestProtectData &inout ProtectData, const FFPTime &inout CurrentTime)
{
    Get local_4;
    const FC_HitTestProtectRecord& local_6 = local_4.opCall();
    if (local_6)
    {
        for (auto& local_22 : ProtectData.MultiStrikeProtectGroup)
        {
            if (local_6.GetMultiStrikeProtect().Contains(local_22) && ((FFPTime(local_6.GetMultiStrikeProtect()[local_22]).opCmp(CurrentTime) <= 0)))
            {
                return true;
            }
        }
        for (auto& local_22 : ProtectData.DodgeProtectGroup)
        {
            if (local_6.GetDodgeProtect().Contains(local_22) && ((FFPTime(local_6.GetDodgeProtect()[local_22]).opCmp(CurrentTime) <= 0)))
            {
                return true;
            }
        }
    }
    return false;
}
void AddMultiStrikeProtectRecord(const FECSEntity &inout HitEntity, const FAttackHitTestProtectData &inout ProtectData, const FFPTime &inout CurrentTime)
{
    if (ProtectData.MultiStrikeProtectGroup.IsEmpty())
    {
        return;
    }
    ModifyOrAdd local_6;
    FC_HitTestProtectRecord& local_8 = local_6.opCall();
    if (local_8)
    {
        for (auto& local_22 : ProtectData.MultiStrikeProtectGroup)
        {
            if (!(local_8.GetMultiStrikeProtect().Contains(local_22)))
            {
                local_8.GetModify_MultiStrikeProtect().Add(local_22, (CurrentTime + FFPTime(ProtectData.MultiStrikeProtectTime)));
            }
        }
    }
    return;
}
void AddDodgeProtectRecord(const FECSEntity &inout HitEntity, const FAttackHitTestProtectData &inout ProtectData, const FFPTime &inout CurrentTime)
{
    if (ProtectData.DodgeProtectGroup.IsEmpty())
    {
        return;
    }
    ModifyOrAdd local_6;
    FC_HitTestProtectRecord& local_8 = local_6.opCall();
    if (local_8)
    {
        for (auto& local_22 : ProtectData.DodgeProtectGroup)
        {
            if (!(local_8.GetDodgeProtect().Contains(local_22)))
            {
                local_8.GetModify_DodgeProtect().Add(local_22, (CurrentTime + FFPTime(ProtectData.DodgeProtectTime)));
            }
        }
    }
    return;
}
void AddForceHitInvincibleRecord(const FECSEntity &inout HitEntity, const FAttackHitTestProtectData &inout ProtectData, const FFPTime &inout CurrentTime)
{
    if (ProtectData.ForceHitInvincibleGroup.IsEmpty())
    {
        return;
    }
    ModifyOrAdd local_6;
    FC_HitTestProtectRecord& local_8 = local_6.opCall();
    if (local_8)
    {
        for (auto& local_22 : ProtectData.ForceHitInvincibleGroup)
        {
            if (!(local_8.GetForceHitInvincible().Contains(local_22)))
            {
                local_8.GetModify_ForceHitInvincible().Add(local_22, (CurrentTime + FFPTime(ProtectData.ForceHitInvincibleTime)));
            }
        }
    }
    return;
}
bool TryRecordHit(FC_HitRecords &inout HitRecords, const FECSEntityId &inout ReceiverId, const EHitRecordType Type, const FName &inout StrikeKey, const FFPTime &inout HitRequestTime, const FFPTime &inout HitTime, const FFPTime &inout HitInterval)
{
    if (StrikeKey.IsNone())
    {
        return true;
    }
    if (!(HitRecords) || HitRecords.IsHitBlocked(HitTime, ReceiverId, StrikeKey))
    {
        return false;
    }
    FHitRecordItem local_12;
    local_12.SetHitEntity(ReceiverId);
    local_12.SetStrikeKey(StrikeKey);
    local_12.SetHitType(EHitRecordType(Type));
    local_12.SetHitRequestTime(HitRequestTime);
    if (HitInterval.opCmp(0.0) >= 0)
    {
        local_12.SetNextHitTime((HitTime + HitInterval));
    }
    else
    {
        local_12.SetNextHitTime(FFPTime(-1));
    }
    HitRecords.AddRecord(local_12);
    return true;
}
void MakeInvincibleCounterEvent(const FECSEntity &inout EventSender, const FECSEntity &inout Attacker, const EHitTestCheckResult CheckResult, const FFPTime &inout Time, const bool bPredictable)
{
    int local_20 = 0;
    int local_30 = 0;
    if ((int(CheckResult) == 5 || (int(CheckResult) == 7)))
    {
        FCE_InvincibleCounterEvent local_6;
        local_6.Attacker = Attacker;
        int local_1 = int(CheckResult);
        if (local_1 <= 5)
        {
            if (local_1 != 5)
            {
            }
            else
            {
                local_6.Type = EInvincibleCounterType(1);
            }
        }
        local_6.Type = EInvincibleCounterType(0);
        local_6.SetbPredictable(bPredictable);
        return;
    }
    if (int(CheckResult) == 6)
    {
        Modify local_18;
        FC_PerfectDodge& local_14 = local_18.opCall();
        if (local_14)
        {
            if (local_14.GetHitCount() == 0)
            {
                local_20.Attacker = Attacker;
                local_20.SetbPredictable(bPredictable);
                local_14.SetHitCount((local_14.GetHitCount() + 1));
            }
        }
        return;
    }
    if (int(CheckResult) == 9)
    {
        local_30.Attacker = Attacker;
        local_30.SetbPredictable(bPredictable);
    }
    return;
}
FCE_HitEvent& MakeHitEvent(const FECSEntity &inout EventSender, const FECSEntity &inout AttackerEntity, const FECSEntity &inout HitEntity, const FFPTime &inout Time, const FHitEventParam &inout HitEventParam)
{
    FCE_HitEvent local_6;
    local_6.SetbPredictable(HitEventParam.bPredictable);
    local_6.bClientWaitForServerOnHit = HitEventParam.bClientWaitForServerOnHit;
    local_6.bNeedHitMeshPresentation = HitEventParam.bNeedHitMeshPresentation;
    local_6.bAttackHitFXSpawnToStrikeCenterLine = HitEventParam.bAttackHitFXSpawnToStrikeCenterLine;
    Get local_14;
    const FC_DefenseHit& local_16 = local_14.opCall();
    if (local_16)
    {
        FAttackData local_10;
        local_6.bBanPresentation = FDamageUtils::BanPresentationWhenDefense(local_10, local_16.GetDefenseHitDatas());
    }
    local_6.Attacker = AttackerEntity;
    local_6.Receiver = HitEntity;
    local_6.HitPosition = HitEventParam.HitPosition;
    local_6.bHitWeakness = HitEventParam.bHitWeakness;
    local_6.HitShakeBodyType = HitEventParam.HitShakeBodyType;
    local_6.HitBoneName = HitEventParam.HitBoneName;
    local_6.HitBodyPart = HitEventParam.HitBodyPart;
    local_6.OverrideAnimSocket = HitEventParam.OverrideAnimSocket;
    local_6.PhysicalMaterial = HitEventParam.PhysicalMaterial;
    local_6.StrikeData.SetStrikeShape(HitEventParam.StrikeData.StrikeShape);
    local_6.StrikeData.SetStrikeDirection(HitEventParam.StrikeData.StrikeDirection);
    local_6.StrikeData.SetbUseCustomStrikeTransform(HitEventParam.StrikeData.bUseHitTestPosStrikeOrigin);
    local_6.StrikeData.SetCustomStrikeTransformPos(HitEventParam.CustomStrikeTransform.GetLocation());
    local_6.StrikeData.SetCustomStrikeTransformRot(HitEventParam.CustomStrikeTransform.GetRotation());
    local_6.StrikeData.SetDecalConfig(HitEventParam.HitDecalConfig);
    local_6.StrikeKey = HitEventParam.StrikeKey;
    return HitEventParam.AttackData;
}
void DamageTargetByHit(const FECSEntity &inout DamageCaster, const FECSEntity &inout DirectDamageCauser, const FECSEntity &inout TargetEntity, const bool bIsServer, const FName &inout StrikeKey, const int HitEventId, const FAttackInfo &inout AttackInfo, const FAttackBaseDamageValue &inout BaseDamageValue, const FAttackRecoverEnergyValue &inout RecoverEnergyValue, const FFPTime &inout HitTime, const FName &inout BodyPartKey, const FVector &inout AttackFromPos, const FVector &inout HitPoint, const FVector &inout StrikeDirection, const FHitTestCheckResult &inout HitTestCheckResult, const float32 DamageCoefficient = 1.0f, const bool bDistanceAttenuation = false, const bool bForceHitWeakness = false, const bool bLatencyCompensation = false)
{
    int local_28 = 0;
    bool local_33;
    if (!(AttackInfo.AttackData))
    {
        return;
    }
    TDataObjectPtr<FAttackData> local_26 = TDataObjectPtr<FAttackData>(AttackInfo.AttackData);
    if (!(bIsServer))
    {
        local_33 = false;
    }
    else
    {
        Has local_32;
        local_33 = local_32.opCall();
    }
    if (local_33)
    {
        Get local_38;
        const FC_HittableConfig& local_40 = local_38.opCall();
        if (local_40)
        {
            Modify local_44;
            FDamageUtils::AddHitDamageToProjectile(DamageCaster, TargetEntity, local_40, local_44.opCall(), HitTestCheckResult, local_28, HitTime, DamageCoefficient, HitPoint);
        }
        return;
    }
    FECSEntity local_48 = DamageCaster;
    Get local_52;
    const FC_AttackerAttributeValueProvider& local_54 = local_52.opCall();
    if (local_54)
    {
        if (local_54.GetProviderEntity().IsValid())
        {
            local_48 = local_54.GetProviderEntity();
        }
    }
    FDamageUtils::AddHitDamage(DamageCaster, DirectDamageCauser, local_48, TargetEntity, AttackInfo, StrikeKey, BaseDamageValue, RecoverEnergyValue, DamageCoefficient, BodyPartKey, bForceHitWeakness, bDistanceAttenuation, AttackFromPos, HitPoint, StrikeDirection, HitEventId, HitTime, bLatencyCompensation);
    return;
}
void ShowDamageNumber(const FECSEntity &inout Sender, const FECSEntity &inout Receiver, const FFPTime &inout HitTime, const FFPTime &inout ShowTextTime, const float32 DamageValue, const FName &inout StrikeKey, const bool bAdjustPresentationHitPos, const FVector &inout Position, const EAttackType AttackType, const EDamageType DamageType, const bool bHitWeakness, const bool bAttenuated, const bool bCritical, const float32 DamageNumberRandomRatio, const TDataObjectPtr<FSpecialDamageTextConfig> &inout SpecialDamageTextConfig)
{
    FCE_ShowDamageNumber local_6;
    local_6.Attacker = Sender;
    local_6.Receiver = Receiver;
    local_6.Damage = DamageValue;
    local_6.HitPosition = Position;
    local_6.AttackType = AttackType;
    local_6.DamageType = DamageType;
    local_6.bAdjustPresentationHitPos = bAdjustPresentationHitPos;
    local_6.SpecialDamageTextConfig = SpecialDamageTextConfig;
    local_6.bHitWeakness = bHitWeakness;
    local_6.bAttenuated = bAttenuated;
    local_6.bCritical = bCritical;
    local_6.DamageNumberRandomRatio = DamageNumberRandomRatio;
    local_6.StrikeKey = StrikeKey;
    local_6.HitTime = HitTime;
    return;
}
void TriggerEntitySimpleSkill(const FECSEntity &inout Entity, const int SkillIndex, const float32 ValidateTime = 0.1)
{
    Modify local_4;
    if (local_4.opCall())
    {
        FFPTime local_10 = ECS::GetContextTime();
        FNameHandle_EntityBBVarInt local_14;
        local_14;
        FFPTime local_10_2 = FFPTime(ValidateTime);
        ECS::GetContextTime();
    }
    return;
}
void TriggerEntitySkill(const FECSEntity &inout Entity, const USkillConfig SkillConfig, const float32 ValidateTime = 0.1)
{
    FFPTime local_2 = FFPTime(ValidateTime);
    ECS::GetContextTime();
    return;
}
void TriggerEntityPhaseChange(const FECSEntity &inout Entity, const int PhaseIndex, const float32 ValidateTime = 0.1)
{
    Modify local_4;
    if (local_4.opCall())
    {
        FFPTime local_10 = ECS::GetContextTime();
        FNameHandle_EntityBBVarInt local_14;
        local_14;
        FFPTime local_10_2 = FFPTime(ValidateTime);
        ECS::GetContextTime();
    }
    return;
}
bool IsTargetWeakDamageType(const FECSEntity &inout Entity, const EDamageType DamageType)
{
    int local_54 = 0;
    if ((!((Entity == ENTITY_NULL))))
    {
        if (int(GetPrefabType(Entity)) == 2)
        {
            if ((!((GetMonsterConfig(Entity) == nullptr))))
            {
                if ((local_54 & (1 << int(DamageType))) != 0)
                {
                    return true;
                }
                return false;
            }
        }
    }
    return false;
}
void TriggerCombatTimelineAction(const FECSEntity &inout Entity, const ECombatTimelineTimePoint BaseTime, const FFPTime &inout TriggerTime, const bool bIsServer, const bool bEntityDestroy = false)
{
    int local_32 = 0;
    int local_52 = 0;
    Get local_4;
    const FC_CombatActionTimelineConfig& local_6 = local_4.opCall();
    if (local_6)
    {
        bool local_8;
        local_8 = false;
        int local_9 = 0;
        for (; local_9 < local_6.ActionTimePoints.Num(); ++local_9)
        {
            const FCombatTimelineActionPoint& local_14 = local_6.ActionTimePoints[local_9];
            if (int(local_14.BaseTime) == int(BaseTime))
            {
                if (int(local_14.BaseTime) == 2)
                {
                    GetDefaulted local_20;
                    if ((int(local_14.DestroyTypeFilter) & int(local_20.opCall().DestroyType)) == 0)
                    {
                        continue;
                    }
                }
                int local_33 = 0;
                for (; local_33 < int(local_14.RepeatCount); )
                {
                    FCombatActionTrigger local_38;
                    local_38.SetIndexInConfig(local_9);
                    FFPTime local_40 = (TriggerTime + local_14.DelayTime);
                    FFPTime local_42 = local_14.RepeatDelayTime;
                    local_38.SetTriggerTime((local_40 + (local_42 * local_33)));
                    local_32.AddTrigger(local_38);
                    ++local_33;
                }
                if (!(local_8))
                {
                    local_8 = true;
                    local_52.SetRefCount((local_52.GetRefCount() + 1));
                }
            }
        }
    }
    return;
}
int AddPotentialDamage(const FECSEntity &inout Casuer, const FECSEntity &inout Target, const TDataObjectPtr<FAttackData> &inout AttackDataPtr, const FFPTime &inout Time, const FFPTime &inout ExpireTime, const FCapabilityInstanceId &inout ContextCapabilityId)
{
    int local_12 = 0;
    if (!(Casuer.IsValid()) || !(Target.IsValid()))
    {
        XError(ELog(0), "AddPotentialDamage but casuer or target invalid");
        return -1;
    }
    if ((AttackDataPtr == nullptr) || (0 != 4))
    {
        XError(ELog(0), "AddPotentialDamage but AttackData is invalid or AttackType is NOT DOT!");
        return -1;
    }
    local_12.SetIndexAcc((local_12.GetIndexAcc() + 1));
    local_12.SetCheckTime(ExpireTime);
    FPotentialDamageData local_54;
    local_54.SetAttackData(AttackDataPtr);
    local_54.SetDamagerCasuer(Casuer);
    local_54.SetExpireTime(ExpireTime);
    FAttackData local_56;
    local_54.SetBaseDamage(FDamageUtils::CalcAttackBaseDamageValue(Casuer, local_56, Time, FDamageUtils::IsDamageToAvatar(Target), ContextCapabilityId));
    local_54.SetDamageProcedureType(EDamageProcedureType(1));
    local_12.GetModify_DataByIndex().Add(local_12.GetIndexAcc(), local_54);
    return local_12.GetIndexAcc();
}
void RemovePotentialDamage(const FECSEntity &inout TargetEntity, const int DamageIndex)
{
    Modify local_4;
    if (local_4.opCall())
    {
    }
    return;
}
void ApplyPotentialDamage(const FECSEntity &inout TargetEntity, const int DamageIndex, const FFPTime &inout Time)
{
    if (!(ECS::IsAuthorityOrPrediction(TargetEntity)))
    {
        return;
    }
    Modify local_6;
    FC_PotentialDamage& local_8 = local_6.opCall();
    if (local_8)
    {
        FPotentialDamageData local_50;
        if (local_8.GetDataByIndex().Find(DamageIndex, local_50))
        {
            FDataObjectPtr local_110;
            const FAttackData& local_52;
            FECSEntity local_60;
            if (local_50.GetDamagerCasuer().IsValid())
            {
                local_60 = local_50.GetDamagerCasuer();
            }
            else
            {
                local_60 = TargetEntity;
            }
            FAttackInfo local_86;
            local_110;
            local_86.AttackData = local_110;
            FDamageUtils::AddDirectDamage(local_60, local_60, TargetEntity, local_86, local_52.DamageType, local_50.GetBaseDamage(), 1.0f, local_52.AbnormalState, Time);
        }
    }
    return;
}
bool IsInFrontHalfSphere(const FECSEntity &inout HitEntity, const FECSEntity &inout BeHitEntity)
{
    int local_6 = 0;
    FVector local_14 = local_6.GetPosition();
    FVector local_20 = 0.GetPosition();
    if ((local_14 == local_20))
    {
        return true;
    }
    FVector local_48(local_6.GetRotation().GetForwardVector());
    return (local_48.DotProduct(((local_20 - local_14).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector))) > 0.0);
}
float GetHorizontalAngle(const FVector &inout Dir1, const FVector &inout Dir2)
{
    FVector local_12 = FVector(Dir1.X, Dir1.Y, 0.0);
    FVector local_6 = FVector(Dir2.X, Dir2.Y, 0.0);
    float local_26 = 360.0;
    if (!(local_12.IsNearlyZero(9.999999747378752e-5)) && !(local_6.IsNearlyZero(9.999999747378752e-5)))
    {
        local_12.Normalize(9.99999993922529e-9);
        local_6.Normalize(9.99999993922529e-9);
        float local_18_2 = local_12.DotProduct(local_6);
        local_26 = FMath::RadiansToDegrees(FMath::Acos(FMath::Clamp(local_18_2, -1.0, 1.0)));
    }
    return local_26;
}
float GetVerticalAngle(const FVector &inout Dir1, const FVector &inout Dir2)
{
    float local_2 = FMath::RadiansToDegrees(FMath::Asin(Dir1.Z)) - FMath::RadiansToDegrees(FMath::Asin(Dir2.Z));
    return FMath::Abs(local_2);
}
FECSEntity GetAttackSourceEntity(const FECSEntity &inout InstigatorEntity)
{
    FECSEntity local_4 = InstigatorEntity;
    Has local_8;
    while (!(local_8.opCall()))
    {
        Get local_14;
        const FC_Owner& local_16 = local_14.opCall();
        if (local_16)
        {
            local_4 = local_16.GetOwnerEntity();
        }
        else
        {
            break;
        }
    }
    return local_4;
}
int CombineTargetCreatureToOneTeamOfSelfEntityByRangeNewEcology(const FECSEntity &inout SelfEntity, const TDataObjectPtr<FMonsterMainConfig> &inout MonsterRowData, const float32 Range, const int MaxEntityNum = -1)
{
    int local_62 = 0;
    TMapIterator<FECSEntityId, FEcologyVoxelSceneUnitSummary> local_124;
    int local_144 = 0;
    FTargetEntity local_4 = FTargetEntity(SelfEntity);
    Get local_8;
    bool local_9 = !(local_8.opCall());
    if (local_9)
    {
        return 0;
    }
    FVector local_16 = local_8.opCall().GetPosition();
    FVoxelRegionScope local_56 = FVoxelRegionScope(FBox::BuildAABB(local_16, FVector(Range)));
    FECSWorldPtr local_64 = ECS::GetECSWorld();
    TArray<FTargetEntity> local_72;
    FVoxelRegionIterator local_82 = local_56.Iterator();
    for (; local_82.CanProceed;)
    {
        FEcologyVoxelSceneRegion& local_96 = local_62.VoxelScene.FindOrAddRegion(local_82.Proceed().Current);
        for (auto& local_116 : local_96.GetCellSlotDataRef(EEcologyVoxelUnitSlot(1)))
        {
            local_116;
            for (; local_124.CanProceed;)
            {
                FECSEntity local_138 = FECSEntity(local_124.Proceed().GetKey());
                if (!(local_138.IsValid()))
                {
                    continue;
                }
                if (!(local_144))
                {
                    continue;
                }
                Has local_148;
                local_9 = local_148.opCall();
                if (local_9)
                {
                    continue;
                }
                TDataObjectPtr<FMonsterMainConfig> local_172 = local_144.CreatureConfigProxy.GetMonsterConfig();
                if (local_172.IsSet())
                {
                    local_9 = (local_172 == MonsterRowData.opImplConv());
                    if (local_9)
                    {
                        local_72.Add(FTargetEntity(local_138));
                    }
                }
            }
        }
    }
    FVector local_226 = local_8.opCall().GetPosition();
    if (local_72.IsEmpty())
    {
        return 0;
    }
    TArray<FTargetEntity> local_236;
    if (MaxEntityNum > 0)
    {
        int local_237 = 0;
        while (local_9)
        {
            local_236.Add(local_72[local_237]);
            ++local_237;
            if (local_237 >= local_72.Num())
            {
                local_9 = false;
                continue;
            }
            local_9 = (local_237 < MaxEntityNum);
        }
    }
    else
    {
        local_236 = local_72;
    }
    TSet<FTargetEntity> local_260;
    local_260.Append(local_236);
    local_260.Add(local_4);
    FCombatUtils::CombineEntitiesToOneNewTeam(local_260, local_4);
    return local_260.Num();
}
void CombineEntitiesToOneNewTeam(const TSet<FTargetEntity> &inout EntitySet, const FTargetEntity &inout TeamLeader)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ModifyOrAdd local_6;
    FCS_EcologyDemoAIRelationShipTeam& local_8 = local_6.opCall();
    if (local_8)
    {
        int local_10;
        local_10 = int(local_8.NextTeamID);
        ++local_8.NextTeamID;
        FEcologyDemoAIRelationShipTeamDetail local_36;
        local_36.TeamID = local_10;
        local_36.TeamMemberSet = EntitySet;
        local_36.TeamLeader = TeamLeader;
        for (auto& local_54 : EntitySet)
        {
            FCombatUtils::DissolveEntityFromItsTeam(local_54);
        }
        local_8.RelationShipTeamDetailMap.Add(local_10, local_36);
        for (auto& local_54 : EntitySet)
        {
            FECSEntity local_58 = local_54.GetEntity();
            FC_EcologyDemoAIRelationShipTeamMember local_66;
            local_66.TeamID = local_10;
        }
    }
    return;
}
void DissolveEntityFromItsTeam(const FTargetEntity &inout Entity)
{
    FCombatUtils::DissolveEntityFromItsTeamInternal(Entity, 0);
    return;
}
void DissolveEntityFromItsTeamInternal(const FTargetEntity &inout Entity, const int RecursionDepth)
{
    Get local_22;
    int local_1 = 50;
    if (RecursionDepth > 50)
    {
        Remove local_26;
        FString local_16 = FASCommonUtils::GetEntityShowName(Entity.GetEntity());
        XLog(ELog(30), FString().Append("DissolveEntityFromItsTeam: йЂ’еЅ’ж·±еє¦и¶…й™ђпјЊEntity= ").Append(local_16).Append(" EntityеЏЇиѓЅе­ењЁеѕЄзЋЇеј•з”Ё"));
        FECSEntity local_12 = Entity.GetEntity();
        if (local_22.opCall())
        {
            FECSEntity local_12_2 = Entity.GetEntity();
            local_26.opCall();
        }
        return;
    }
    FECSEntity local_12_3 = Entity.GetEntity();
    if (!(local_22.opCall()))
    {
        return;
    }
    FECSWorldPtr local_28 = ECS::GetECSWorld();
    ModifyOrAdd local_32;
    FCS_EcologyDemoAIRelationShipTeam& local_34 = local_32.opCall();
    if (local_34)
    {
        Remove local_26;
        int local_37;
        FECSEntity local_12_4 = Entity.GetEntity();
        FC_EcologyDemoAIRelationShipTeamMember local_36;
        local_37 = int(local_36.TeamID);
        if (!(local_34.RelationShipTeamDetailMap.Contains(local_37)))
        {
            FECSEntity local_12_5 = Entity.GetEntity();
            local_26.opCall();
            FASCommonUtils::GetEntityShowName(Entity.GetEntity());
            return;
        }
        FEcologyDemoAIRelationShipTeamDetail& local_40 = local_34.RelationShipTeamDetailMap[local_37];
        TSet<FTargetEntity> local_60 = local_40.TeamMemberSet;
        if ((local_40.TeamLeader == Entity))
        {
            for (auto& local_80 : local_60)
            {
                if ((!((local_80 == Entity))))
                {
                    FCombatUtils::DissolveEntityFromItsTeamInternal(local_80, (RecursionDepth + 1));
                }
            }
        }
        else
        {
        }
        FECSEntity local_12_6 = Entity.GetEntity();
        local_26.opCall();
    }
    return;
}
bool GetEntityTeamMemberSet(const FTargetEntity &inout Entity, TSet<FTargetEntity> &out TeamMemberSet)
{
    Get local_28;
    TSet<FTargetEntity> local_20;
    TeamMemberSet = local_20;
    FECSEntity local_24 = Entity.GetEntity();
    if (!(local_28.opCall()))
    {
        return false;
    }
    FECSWorldPtr local_32 = ECS::GetECSWorld();
    Get local_36;
    const FCS_EcologyDemoAIRelationShipTeam& local_38 = local_36.opCall();
    if (local_38)
    {
        int local_41;
        FECSEntity local_24_2 = Entity.GetEntity();
        FC_EcologyDemoAIRelationShipTeamMember local_40;
        local_41 = int(local_40.TeamID);
        if (local_38.RelationShipTeamDetailMap.Contains(local_41))
        {
            TeamMemberSet = local_38.RelationShipTeamDetailMap[local_41].TeamMemberSet;
            return true;
        }
    }
    return false;
}
bool IsHitRecoverAttributeBanned(const FECSEntity &inout Entity, const FGameAttributeRef &inout Attribute)
{
    if ((Attribute.GetDefinition() == Attribute::CustomSkillEnergy.GetDefinition()) || (Attribute.GetDefinition() == Attribute::CustomSkillEnergy_2.GetDefinition()) || (Attribute.GetDefinition() == Attribute::CustomSkillEnergy_3.GetDefinition()) || (Attribute.GetDefinition() == Attribute::CustomSkillEnergy_4.GetDefinition()))
    {
        return Entity.MatchGameplayTag(GameplayTags::Skill_BanRecoverCustomSkillEnergy);
    }
    if ((Attribute.GetDefinition() == Attribute::UltraSkillEnergy.GetDefinition()))
    {
        return Entity.MatchGameplayTag(GameplayTags::Skill_BanRecoverUltraSkillEnergy);
    }
    return false;
}
}

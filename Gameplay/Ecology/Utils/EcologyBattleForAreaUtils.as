
namespace FEcologyBattleForAreaUtils
{
void ModifyBattleForAreaState(const FECSEntity &inout FlockEntity, const EBossBattleForAreaState NewState)
{
    FC_EcologyFlockBossBattleForAreaComponent local_6;
    if (!(local_6))
    {
        XLog(ELog(0), FString().Append("[BattleForArea]: ModifyStateFailed - BattleForAreaComp Invalid"));
        return;
    }
    EBossBattleForAreaState local_14 = local_6.BattleForAreaState;
    if ((int(local_14)) == (int(NewState)))
    {
        XLog(ELog(0), FString().Append("[BattleForArea]: ModifyStateFailed - Flock: ").Append(FlockEntity).Append(", From: ").Append(local_14).Append(", To: ").Append(NewState));
        return;
    }
    FC_EcologyFlockBossBattleForAreaComponent local_24;
    local_24.BattleForAreaState = NewState;
    FECSWorldPtr local_26 = ECS::GetECSWorld();
    Get local_30;
    local_24.EnterStateTime = local_30.opCall().Time;
    FEcologyBattleForAreaUtils::OnBattleForAreaStateChanged(FlockEntity, EBossBattleForAreaState(local_14), EBossBattleForAreaState(NewState), local_6.EnterStateTime);
    return;
}
void OnBattleForAreaStateChanged(const FECSEntity &inout FlockEntity, const EBossBattleForAreaState OldState, const EBossBattleForAreaState NewState, const FFPTime &inout FixedTime)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return;
    }
    XLog(ELog(0), FString().Append("[BattleForArea]: EntityStateChanged - Flock: ").Append(FlockEntity).Append(", From: ").Append(OldState).Append(", To: ").Append(NewState));
    if ((int(OldState) == 2 && (int(NewState) == 3)))
    {
        local_6.InstanceContext.InBattleStartTime = local_6.EnterStateTime;
    }
    if (int(NewState) == 0)
    {
        Has local_20;
        bool local_16 = local_20.opCall();
        if (local_16)
        {
            Remove local_24;
            local_24.opCall();
        }
        Has local_28;
        local_16 = local_28.opCall();
        if (local_16)
        {
            Remove local_32;
            local_32.opCall();
        }
        local_6.InstanceContext.Reset();
    }
    return;
}
void PrepareBossBattleForAreaPreContext(const FECSEntity &inout AttackerFlock, const FECSEntity &inout AttackerLeader, const FECSEntity &inout DefenderFlock, const FECSEntity &inout DefenderLeader)
{
    int local_8 = 0;
    int local_10 = 0;
    if (!(AttackerFlock.IsValid()))
    {
        return;
    }
    if (!(AttackerLeader.IsValid()))
    {
        return;
    }
    if (!(DefenderFlock.IsValid()))
    {
        return;
    }
    if (!(DefenderLeader.IsValid()))
    {
        return;
    }
    local_8.InstanceContext.AttackerFlock = AttackerFlock;
    local_8.InstanceContext.DefenderFlock = DefenderFlock;
    local_8.InstanceContext.AttackerBoss = AttackerLeader;
    local_8.InstanceContext.DefenderBoss = DefenderLeader;
    local_8.InstanceContext.AttackerHPLimit = int(local_8.BossBattleForAreaInfo.HPLimit);
    local_8.InstanceContext.DefenderHPLimit = int(local_10.BossBattleForAreaInfo.HPLimit);
    local_8.InstanceContext.BattleTargetFlock = DefenderFlock;
    local_10.InstanceContext.AttackerFlock = AttackerFlock;
    local_10.InstanceContext.DefenderFlock = DefenderFlock;
    local_10.InstanceContext.AttackerBoss = AttackerLeader;
    local_10.InstanceContext.DefenderBoss = DefenderLeader;
    local_10.InstanceContext.AttackerHPLimit = int(local_8.BossBattleForAreaInfo.HPLimit);
    local_10.InstanceContext.DefenderHPLimit = int(local_10.BossBattleForAreaInfo.HPLimit);
    local_10.InstanceContext.BattleTargetFlock = AttackerFlock;
    return;
}
void PrepareBossBattleForAreaLateContext(const FECSEntity &inout AttackerFlock, const FECSEntity &inout AttackerLeader, const FECSEntity &inout DefenderFlock, const FECSEntity &inout DefenderLeader)
{
    float32 local_10;
    int local_26 = 0;
    int local_28 = 0;
    if (!(AttackerFlock.IsValid()))
    {
        return;
    }
    if (!(AttackerLeader.IsValid()))
    {
        return;
    }
    if (!(DefenderFlock.IsValid()))
    {
        return;
    }
    if (!(DefenderLeader.IsValid()))
    {
        return;
    }
    FFPTime local_8 = FFPTime(ECS::GetECSWorld().GetFixedTime().Time);
    float32 local_9 = 0.0f;
    float32 local_11 = 0.0f;
    Get local_16;
    const FC_GameAttribute& local_18 = local_16.opCall();
    if (local_18)
    {
        local_10 = local_18.GetAttributeValue(Attribute::HPMax, local_8);
        if (local_10 > 0.0f)
        {
            local_9 = local_18.GetAttributeValue(Attribute::HP, local_8) / local_10;
        }
    }
    const FC_GameAttribute& local_18_2 = local_16.opCall();
    if (local_18_2)
    {
        float32 local_20 = local_18_2.GetAttributeValue(Attribute::HPMax, local_8);
        if (local_20 > 0.0f)
        {
            local_10 = local_18_2.GetAttributeValue(Attribute::HP, local_8);
            local_11 = local_10 / local_20;
        }
    }
    float32 local_19 = local_26.BossBattleForAreaInfo.TimeLimit;
    if (local_19 > local_28.BossBattleForAreaInfo.TimeLimit)
    {
        local_10 = local_28.BossBattleForAreaInfo.TimeLimit;
    }
    else
    {
        local_10 = local_26.BossBattleForAreaInfo.TimeLimit;
    }
    local_26.InstanceContext.InBattleStartTime = local_8;
    local_26.InstanceContext.AttackerStartHpPercent = local_9;
    local_26.InstanceContext.DefenderStartHpPercent = local_11;
    if (local_10 > 0.0f)
    {
        local_19 = local_10;
    }
    else
    {
        local_19 = local_26.InstanceContext.EndTimeLimit;
    }
    local_26.InstanceContext.EndTimeLimit = local_19;
    local_28.InstanceContext.InBattleStartTime = local_8;
    local_28.InstanceContext.AttackerStartHpPercent = local_9;
    local_28.InstanceContext.DefenderStartHpPercent = local_11;
    if (local_10 > 0.0f)
    {
        local_19 = local_10;
    }
    else
    {
        local_19 = local_28.InstanceContext.EndTimeLimit;
    }
    local_28.InstanceContext.EndTimeLimit = local_19;
    return;
}
void BossBattleForAreaStartInBattle(const FECSEntity &inout AttackerFlock, const FECSEntity &inout AttackerLeader, const FECSEntity &inout DefenderFlock, const FECSEntity &inout DefenderLeader)
{
    int local_40 = 0;
    int local_66 = 0;
    bool local_1 = !(AttackerFlock.IsValid());
    if (local_1)
    {
        return;
    }
    bool local_1_2 = !(AttackerLeader.IsValid());
    if (local_1_2)
    {
        return;
    }
    bool local_1_3 = !(DefenderFlock.IsValid());
    if (local_1_3)
    {
        return;
    }
    bool local_1_4 = !(DefenderLeader.IsValid());
    if (local_1_4)
    {
        return;
    }
    FC_EcologyFlockBossBattleForAreaComponent local_8;
    FC_EcologyFlockBossBattleForAreaComponent local_10;
    if ((!(local_8) || !(local_10)))
    {
        return;
    }
    FEcologyBossBattleForAreaInfo local_14 = local_8.BossBattleForAreaInfo;
    FEcologyBossBattleForAreaInfo local_16 = local_10.BossBattleForAreaInfo;
    if (int(local_8.BattleForAreaState) == 2 || (int(local_10.BattleForAreaState) == 2))
    {
        if (!((AttackerLeader.MatchGameplayTag(FEcologyGameplayTagDefine::Ecology_ForbidBattleforAreaHint) || DefenderLeader.MatchGameplayTag(FEcologyGameplayTagDefine::Ecology_ForbidBattleforAreaHint))) && local_14.BattleStartMessageInfo.MessageConfig.IsSet() && local_16.BattleStartMessageInfo.MessageConfig.IsSet())
        {
            float32 local_21;
            local_21 = local_14.BattleStartMessageInfo.Radius;
            TArray<FECSEntity> local_32 = FEcologyUtils::SearchPlayerByRadiusAndHalfHeight(AttackerLeader, local_21, local_14.BattleStartMessageInfo.HalfHeight);
            FFPTime local_38 = FFPTime(-1);
            local_40.PlayerEntityList = local_32;
            local_40.MessageConfig = local_14.BattleStartMessageInfo.MessageConfig;
            FFPTime local_38_2 = FFPTime(-1);
            local_66.PlayerEntityList = local_32;
            local_66.MessageConfig = local_16.BattleStartMessageInfo.MessageConfig;
        }
        FEcologyBattleForAreaUtils::PrepareBossBattleForAreaLateContext(AttackerFlock, AttackerLeader, DefenderFlock, DefenderLeader);
        FAITargetingUtils::AddHostilityByDamage(AttackerLeader, FTargetEntity(DefenderLeader), 100.0f, 1.0f, 15.0f);
        FAITargetingUtils::AddHostilityByDamage(DefenderLeader, FTargetEntity(AttackerLeader), 100.0f, 1.0f, 15.0f);
        FEcologyBattleForAreaUtils::ModifyBattleForAreaState(AttackerFlock, EBossBattleForAreaState(3));
        FEcologyBattleForAreaUtils::ModifyBattleForAreaState(DefenderFlock, EBossBattleForAreaState(3));
    }
    return;
}
void BossBattleForAreaWinnerCheck(const FECSEntity &inout AttackerFlock, const FECSEntity &inout DefenderFlock, const FEcologyBossBattleInstanceContext &inout Context)
{
    FC_EcologyFlockBossBattleForAreaComponent local_32;
    UResourceRequestFilterConfigAsset local_112;
    int local_142 = 0;
    int local_2 = FEcologyBattleForAreaUtils::BossBattleForAreaCheckWinnerCondition(Context);
    if (local_2 == 0)
    {
        return;
    }
    XLog(ELog(0), FString().Append("[BattleForArea]: HasWinner: ").Append(local_2));
    FECSEntity local_14;
    FECSEntity local_18;
    if (local_2 == 1)
    {
        local_14 = AttackerFlock;
        local_18 = DefenderFlock;
    }
    else
    {
        if (local_2 == 2)
        {
            local_14 = DefenderFlock;
            local_18 = AttackerFlock;
        }
        else
        {
            XLog(ELog(0), FString().Append("[BattleForArea]: Invalid WinnerResult: ").Append(local_2));
            return;
        }
    }
    FECSEntity local_22;
    FECSEntity local_26;
    if (FEcologyBehaviorUtils::CheckFlockLeaderHasChangeAreaTriggers(local_18))
    {
        local_22 = local_18;
        local_26 = local_14;
        XLog(ELog(0), FString().Append("[BattleForArea]: Loser ChangeArea"));
    }
    else
    {
        local_22 = local_14;
        local_26 = local_18;
        XLog(ELog(0), FString().Append("[BattleForArea]: Winner ChangeArea"));
    }
    if (!(local_32))
    {
        XLog(ELog(0), FString().Append("[BattleForArea]: ChangeAreaFlock BattleComp Invalid: ").Append(local_22));
        return;
    }
    FResourceRequestFilterConfig local_108;
    if (local_112 != nullptr)
    {
    }
    FGameplayTag local_116 = FGameplayTag(FEcologyGameplayTagDefine::Ecology_ChangeAreaReasonBattleForAreaReasonTag);
    FGameplayTag local_118 = FGameplayTag(FEcologyGameplayTagDefine::Ecology_ChangeAreaReasonBattleForAreaSourceTag);
    FECSEntity local_128;
    if ((local_22 == AttackerFlock))
    {
        local_128 = Context.AttackerBoss;
    }
    else
    {
        local_128 = Context.DefenderBoss;
    }
    FChangeAreaMessageInfo local_114;
    FEcologyBehaviorUtils::AddFlockChangeAreaRequest(local_22, local_108, local_116, local_118, true, local_114, 25000.0f, 50000.0f, local_32.BattleChangeAreaPriority, !(local_128.IsValid() && local_128.MatchGameplayTag(FEcologyGameplayTagDefine::Ecology_ForbidBattleforAreaHint)), false);
    TArray<FECSEntityId> local_136;
    if (local_142)
    {
        local_136 = local_142.CreatureEntities;
    }
    for (auto& local_156 : local_136)
    {
        FECSEntity local_124 = FECSEntity(local_156);
        if (!(local_124.IsValid()))
        {
            continue;
        }
        local_124.AddGameplayTag(FEcologyGameplayTagDefine::Ecology_SpecialHiddenByBattleForArea, NAME_None);
    }
    FEcologyBattleForAreaUtils::ModifyBattleForAreaStateByFinish(local_22, local_26);
    return;
}
void ModifyBattleForAreaStateByFinish(const FECSEntity &inout ChangeAreaFlock, const FECSEntity &inout StayFlock)
{
    FC_BattleForAreaCheckFinishChangeAreaTag local_6;
    Assign local_4;
    local_4.opCall(local_6);
    FC_BattleForAreaCheckFinishStayTag local_12;
    Assign local_10;
    local_10.opCall(local_12);
    FEcologyBattleForAreaUtils::ModifyBattleForAreaState(ChangeAreaFlock, EBossBattleForAreaState(4));
    FEcologyBattleForAreaUtils::ModifyBattleForAreaState(StayFlock, EBossBattleForAreaState(5));
    Has local_18;
    bool local_19 = local_18.opCall();
    if (local_19)
    {
        Remove local_24;
        local_24.opCall();
    }
    bool local_19_2 = local_18.opCall();
    if (local_19_2)
    {
        Remove local_24;
        local_24.opCall();
    }
    return;
}
int BossBattleForAreaCheckWinnerCondition(const FEcologyBossBattleInstanceContext &inout Context)
{
    FFPTime local_40;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    FFPTime local_6 = FFPTime(local_2.GetFixedTime().Time);
    float32 local_7 = 0.0f;
    Get local_12;
    const FC_GameAttribute& local_14 = local_12.opCall();
    if (local_14)
    {
        float32 local_8 = local_14.GetAttributeValue(Attribute::HPMax, local_6);
        if (local_8 > 0.0f)
        {
            float32 local_16 = local_14.GetAttributeValue(Attribute::HP, local_6);
            local_7 = local_16 / local_8;
        }
    }
    float local_22 = (Context.AttackerStartHpPercent - local_7);
    float local_26 = FMath::Max(0.0, local_22);
    if (local_26 > Context.AttackerHPLimit)
    {
        XLog(ELog(0), FString().Append("[BattleForArea]: AttackerHPLimit - ").Append(local_26));
        return 2;
    }
    float32 local_16_2 = 0.0f;
    const FC_GameAttribute& local_14_2 = local_12.opCall();
    if (local_14_2)
    {
        float32 local_17_2 = local_14_2.GetAttributeValue(Attribute::HPMax, local_6);
        if (local_17_2 > 0.0f)
        {
            float32 local_8_2 = local_14_2.GetAttributeValue(Attribute::HP, local_6);
            local_16_2 = local_8_2 / local_17_2;
        }
    }
    float local_22_2 = FMath::Max(0.0, (Context.DefenderStartHpPercent - local_16_2));
    if (local_22_2 > Context.DefenderHPLimit)
    {
        XLog(ELog(0), FString().Append("[BattleForArea]: DefenderLimit - ").Append(local_22_2));
        return 1;
    }
    if (local_40.ToSeconds() > Context.EndTimeLimit)
    {
        if (local_26 >= local_22_2)
        {
            XLog(ELog(0), FString().Append("[BattleForArea]: TimeLimit - AttackerHP: ").Append(local_26).Append(", DefenderHP: ").Append(local_22_2));
            return 2;
        }
        XLog(ELog(0), FString().Append("[BattleForArea]: TimeLimit - AttackerHP: ").Append(local_26).Append(", DefenderHP: ").Append(local_22_2));
        return 1;
    }
    return 0;
}
void BossBattleForAreaFinishEnd(const FECSEntity &inout FlockEntity)
{
    if (!(0))
    {
        return;
    }
    FEcologyBattleForAreaUtils::CleanupBattleForAreaTagsForFlock(FlockEntity);
    Get local_12;
    if (local_12.opCall())
    {
        FEcologyBattleForAreaUtils::ModifyBattleForAreaState(FlockEntity, EBossBattleForAreaState(0));
        Has local_20;
        bool local_7 = local_20.opCall();
        if (local_7)
        {
            Remove local_24;
            local_24.opCall();
        }
    }
    Has local_28;
    bool local_7_2 = local_28.opCall();
    if (local_7_2)
    {
        Remove local_32;
        local_32.opCall();
        XLog(ELog(0), FString().Append("[BattleForArea]: Removed FC_BattleForAreaCheckFinishChangeAreaTag from Flock:").Append(FlockEntity));
    }
    return;
}
void BossBattleForAreaEndImmediately(const FECSEntity &inout AttackerFlock, const FECSEntity &inout DefenderFlock)
{
    Remove local_10;
    Remove local_20;
    Remove local_28;
    if (AttackerFlock.IsValid() && DefenderFlock.IsValid())
    {
        Has local_24;
        Has local_16;
        Has local_6;
        bool local_1;
        bool local_2 = local_6.opCall();
        if (local_2)
        {
            local_10.opCall();
        }
        local_2 = local_6.opCall();
        if (local_2)
        {
            local_10.opCall();
        }
        FEcologyBattleForAreaUtils::ModifyBattleForAreaState(AttackerFlock, EBossBattleForAreaState(0));
        FEcologyBattleForAreaUtils::ModifyBattleForAreaState(DefenderFlock, EBossBattleForAreaState(0));
        local_1 = local_16.opCall();
        if (local_1)
        {
            local_20.opCall();
        }
        local_1 = local_16.opCall();
        if (local_1)
        {
            local_20.opCall();
        }
        local_2 = local_24.opCall();
        if (local_2)
        {
            local_28.opCall();
        }
        local_2 = local_24.opCall();
        if (local_2)
        {
            local_28.opCall();
        }
        FEcologyBattleForAreaUtils::CleanupBattleForAreaTagsForFlock(AttackerFlock);
        FEcologyBattleForAreaUtils::CleanupBattleForAreaTagsForFlock(DefenderFlock);
    }
    return;
}
void CleanupBattleForAreaTagsForFlock(const FECSEntity &inout FlockEntity)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return;
    }
    for (auto& local_22 : local_6.CreatureEntities)
    {
        FECSEntity local_30 = FECSEntity(local_22);
        if (!(local_30.IsValid()))
        {
            continue;
        }
        if (local_30.MatchGameplayTag(FEcologyGameplayTagDefine::Ecology_SpecialHiddenByBattleForArea))
        {
            local_30.RemoveGameplayTag(FEcologyGameplayTagDefine::Ecology_SpecialHiddenByBattleForArea, NAME_None);
        }
    }
    return;
}
bool CheckTargetMonsterRank(const FECSEntity &inout TargetEntity, const EMonsterRank TargetRank)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return false;
    }
    int local_9 = int(local_6.CreatureConfigProxy.GetMonsterRank());
    int local_10 = int(TargetRank);
    return (local_9 == local_10);
}
}

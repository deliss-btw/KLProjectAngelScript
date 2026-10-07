
namespace FLevelPublicEventUtils
{
bool IsLBPInCooldown(const FCS_LevelPublicEventData &inout LevelPublicEventData, const TSoftClassPtr<AKLLevelScriptPublicEvent> &inout LBPClass)
{
    TConstRawPtr<FRuntimePublicEventLBPData> local_2 = LevelPublicEventData.RuntimePublicEventLBPDatas.Find(LBPClass);
    if (local_2 && ((FFPTime(local_2.opArrow().CoolDownEndTime).opCmp(0.0) > 0)) && ((ECS::GetContextTime().opCmp(local_2.opArrow().CoolDownEndTime) < 0)))
    {
        return true;
    }
    return false;
}
bool GetLBPRuntimeData(const TSoftClassPtr<AKLLevelScriptPublicEvent> &inout LBPClass, FRuntimePublicEventLBPData &inout LBPData)
{
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Get local_8;
    const FCS_LevelPublicEventData& local_2 = local_8.opCall();
    if (local_2)
    {
        if (local_2.RuntimePublicEventLBPDatas.Contains(LBPClass))
        {
            return true;
        }
    }
    return false;
}
bool IsEventTypeAlreadyActive(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout EventInfoConfig, const FCS_LevelPublicEventData &inout LevelPublicEventData)
{
    bool local_59;
    if (!(EventInfoConfig))
    {
        return false;
    }
    for (auto local_15 : LevelPublicEventData.SelectedEventPointIndexes)
    {
        const FRuntimePublicEventPointData& local_18 = LevelPublicEventData.RandomPublicEventPointData[local_15];
        int local_16 = int(local_18.SelectedLBPIndex);
        if (local_18.LBPs.IsValidIndex(int(local_18.SelectedLBPIndex)))
        {
            if (!(LevelPublicEventData.RuntimePublicEventLBPDatas.Find(TSoftClassPtr<AKLLevelScriptPublicEvent>(local_18.LBPs[int(local_18.SelectedLBPIndex)]))))
            {
                local_59 = false;
            }
            else
            {
                FDataObjectPtr local_58;
                local_58;
                local_59 = (EventInfoConfig == local_58);
            }
            if (local_59)
            {
                return true;
            }
        }
    }
    return false;
}
bool CollectHighestPriorityCandidates(const FCS_LevelPublicEventData &inout LevelPublicEventData, const TArray<int> &inout AvailableEventPointIndexes, TArray<int> &inout OutPointIndices, TArray<int> &inout OutLBPIndices)
{
    int local_29;
    OutPointIndices.Empty(0);
    OutLBPIndices.Empty(0);
    int local_2 = 0;
    bool local_3 = false;
    for (auto local_17 : AvailableEventPointIndexes)
    {
        const FRuntimePublicEventPointData& local_20 = LevelPublicEventData[local_17];
        int local_21 = 0;
        for (; local_21 < local_20.LBPs.Num(); ++local_21)
        {
            const TSoftClassPtr<AKLLevelScriptPublicEvent>& local_24 = local_20.LBPs[local_21];
            if ((local_24 == nullptr))
            {
                continue;
            }
            if (FLevelPublicEventUtils::IsLBPInCooldown(LevelPublicEventData, local_24))
            {
                continue;
            }
            TConstRawPtr<FRuntimePublicEventLBPData> local_26 = LevelPublicEventData.RuntimePublicEventLBPDatas.Find(local_24);
            if (!(local_26))
            {
                continue;
            }
            if (FLevelPublicEventUtils::IsEventTypeAlreadyActive(local_26.opArrow().EventInfoConfig, LevelPublicEventData))
            {
                continue;
            }
            int local_22 = local_26.opArrow().Priority;
            local_29 = local_22;
            if (!(local_3) || (local_29 > local_2))
            {
                local_2 = local_29;
                OutPointIndices.Empty(0);
                OutLBPIndices.Empty(0);
                OutPointIndices.Add(local_17);
                OutLBPIndices.Add(local_21);
                local_3 = true;
                continue;
            }
            if (local_29 == local_2)
            {
                OutPointIndices.Add(local_17);
                OutLBPIndices.Add(local_21);
            }
        }
    }
    return local_3;
}
TArray<int> ReGenerateAvailablePublicEventPointIndexes(const FCS_LevelPublicEventData &inout LevelPublicEventData)
{
    TArray<TDataObjectPtr<FLevelEventInfoConfigBase>> local_4;
    auto local_10 = LevelPublicEventData.SelectedEventPointIndexes.Iterator();
    for (; local_10.CanProceed;)
    {
        const FRuntimePublicEventPointData& local_22 = LevelPublicEventData.RandomPublicEventPointData[local_10.Proceed()];
        if (int(local_22.SelectedLBPIndex) >= 0 && local_22.LBPs.IsValidIndex(int(local_22.SelectedLBPIndex)))
        {
            TConstRawPtr<FRuntimePublicEventLBPData> local_36 = LevelPublicEventData.RuntimePublicEventLBPDatas.Find(TSoftClassPtr<AKLLevelScriptPublicEvent>(local_22.LBPs[int(local_22.SelectedLBPIndex)]));
            if (local_36)
            {
                local_4.Add(local_36.opArrow().EventInfoConfig);
            }
        }
    }
    TArray<int> local_42;
    int local_18 = 0;
    while (local_18 < 0)
    {
        const FRuntimePublicEventPointData& local_22_2 = LevelPublicEventData.RandomPublicEventPointData[local_18];
        if (local_22_2.LBPs.Num() <= 0)
        {
        }
        else
        {
            if (int(local_22_2.SelectedLBPIndex) >= 0)
            {
            }
            else
            {
                bool local_44;
                local_44 = false;
                for (auto& local_58 : local_22_2.LBPs)
                {
                    if ((local_58 == nullptr))
                    {
                        continue;
                    }
                    if (FLevelPublicEventUtils::IsLBPInCooldown(LevelPublicEventData, local_58))
                    {
                        continue;
                    }
                    TConstRawPtr<FRuntimePublicEventLBPData> local_38 = LevelPublicEventData.RuntimePublicEventLBPDatas.Find(local_58);
                    if (!(local_38) || !(local_38.opArrow().EventInfoConfig) || !(local_4.Contains(local_38.opArrow().EventInfoConfig)))
                    {
                        local_44 = true;
                        break;
                    }
                }
                if (!(local_44))
                {
                }
                else
                {
                    local_42.Add(local_18);
                }
            }
        }
        ++local_18;
    }
    return local_42;
}
int SelectAndActivatePublicEvents(const UWorld World, FRandomGenerator &inout RandomGenerator, FCS_LevelPublicEventData &inout LevelPublicEventData, TArray<int> &inout AvailableEventPointIndexes, const int MaxAttempts)
{
    UClass local_44;
    int local_1 = 0;
    TArray<int> local_6;
    TArray<int> local_10;
    while (AvailableEventPointIndexes.Num() > 0 && (int(LevelPublicEventData.CurrentEventCount) < int(LevelPublicEventData.MaxEventCount)) && (local_1 < MaxAttempts))
    {
        ++local_1;
        if (!(FLevelPublicEventUtils::CollectHighestPriorityCandidates(LevelPublicEventData, AvailableEventPointIndexes, local_6, local_10)))
        {
            break;
        }
        else
        {
            int local_17;
            int local_16;
            int local_15 = RandomGenerator.NextRangeInt(0, (local_6.Num() - 1));
            local_16 = local_6[local_15];
            local_17 = local_10[local_15];
            FRuntimePublicEventPointData& local_20 = LevelPublicEventData.RandomPublicEventPointData[local_16];
            local_20.SelectedLBPIndex = local_17;
            LevelPublicEventData.SelectedEventPointIndexes.Add(local_16);
            ++LevelPublicEventData.CurrentEventCount;
            TSoftClassPtr<AKLLevelScriptPublicEvent> local_30 = TSoftClassPtr<AKLLevelScriptPublicEvent>(local_20.LBPs[local_17]);
            local_44 = Cast<UClass>(local_30.ToSoftObjectPath().TryLoad());
            if (local_44 != nullptr)
            {
                FLevelPublicEventUtils::ActivateDatalayer(World, TSubclassOf<AKLLevelScriptPublicEvent>(local_44));
            }
            TRawPtr<FRuntimePublicEventLBPData> local_48 = LevelPublicEventData.RuntimePublicEventLBPDatas.Find(local_30);
            if (local_48)
            {
                ++local_48.opArrow().ActiveCount;
            }
            AvailableEventPointIndexes = FLevelPublicEventUtils::ReGenerateAvailablePublicEventPointIndexes(LevelPublicEventData);
        }
    }
    return local_1;
}
void ActivateDatalayer(const UWorld World, const TSubclassOf<AKLLevelScriptPublicEvent> &inout LBPClass)
{
    UClass local_6;
    XLog(ELog(22), FString().Append("public event ActivateDatalayer: ").Append(local_6.GetName()));
    KLDataLayer::SetDataLayerRuntimeStateByLBPClass(__GetWorldContext(), LBPClass, EDataLayerRuntimeState(2));
    return;
}
void DeActivateDatalayer(const UWorld World, const TSubclassOf<AKLLevelScriptPublicEvent> &inout LBPClass)
{
    FCS_LevelPublicEventData local_24;
    float32 local_45;
    UClass local_6;
    XLog(ELog(22), FString().Append("public event DeActivateDatalayer: ").Append(local_6.GetName()));
    KLDataLayer::SetDataLayerRuntimeStateByLBPClass(__GetWorldContext(), LBPClass, EDataLayerRuntimeState(0));
    FECSWorldPtr local_18 = ECS::GetECSWorld();
    int local_25 = 0;
    for (; local_25 < local_24.RandomPublicEventPointData.Num(); ++local_25)
    {
        FRuntimePublicEventPointData& local_30 = local_24.RandomPublicEventPointData[local_25];
        if (int(local_30.SelectedLBPIndex) < 0)
        {
            continue;
        }
        if (!(local_30.LBPs.IsValidIndex(int(local_30.SelectedLBPIndex))))
        {
            continue;
        }
        TSoftClassPtr<AKLLevelScriptPublicEvent> local_42 = TSoftClassPtr<AKLLevelScriptPublicEvent>(local_30.LBPs[int(local_30.SelectedLBPIndex)]);
        if (!((local_42.Get() == local_6)))
        {
            continue;
        }
        local_45 = 0.0f;
        TRawPtr<FRuntimePublicEventLBPData> local_48 = local_24.RuntimePublicEventLBPDatas.Find(local_42);
        if (local_48)
        {
            CastTo local_54;
            TDataObjectPtr<FLevelPublicEventInfoConfig> local_78 = local_54.opCall();
            if (local_78.IsSet() && ((local_78.opArrow().CoolDownDuration > 0.0f)))
            {
                local_45 = local_78.opArrow().CoolDownDuration;
            }
        }
        if (local_48)
        {
            if (local_45 <= 0.0f)
            {
                local_45 = 2.0f;
            }
            local_48.opArrow().CoolDownEndTime = (ECS::GetContextTime() + FFPTime(local_45));
        }
        local_30.SelectedLBPIndex = -1;
        local_24.CurrentEventCount = FMath::Max(0, (int(local_24.CurrentEventCount) - 1));
        break;
    }
    return;
}
void RegeneratePublicEvent(const UWorld World, const FCS_FixedTime &inout FixedTime, FCS_LevelPublicEventData &inout LevelPublicEventData)
{
    int local_20 = 0;
    if (int(LevelPublicEventData.CurrentEventCount) >= int(LevelPublicEventData.MaxEventCount))
    {
        return;
    }
    TArray<int> local_12 = FLevelPublicEventUtils::ReGenerateAvailablePublicEventPointIndexes(LevelPublicEventData);
    if (local_12.Num() <= 0)
    {
        return;
    }
    FECSWorldPtr local_14 = ECS::GetECSWorld();
    FRandomGenerator local_25 = local_20.CreateGeneratorForComponent(FCS_LevelPublicEventData, FixedTime.Time, 0);
    FLevelPublicEventUtils::SelectAndActivatePublicEvents(World, local_25, LevelPublicEventData, local_12, (local_12.Num() * 2));
    return;
}
void InitPublicEventData(const UWorld World, const FCS_FixedTime &inout FixedTime)
{
    UClass local_80;
    AKLLevelScriptPublicEvent local_84;
    int local_170 = 0;
    AAS_ECSWorldSettings local_2 = (Cast<AAS_ECSWorldSettings>(World.GetWorldSettings()));
    if (local_2 != nullptr && ((local_2.PublicEventPoints.Num() <= 0)))
    {
        return;
    }
    int local_11 = 5;
    if (local_11 <= 0)
    {
        XLog(ELog(22), FString().Append("Level public event count is 0, no public event will be generated"));
        return;
    }
    FECSWorldPtr local_20 = ECS::GetECSWorld();
    FCS_LevelPublicEventData local_26;
    local_26.MaxEventCount = local_11;
    TArray<int> local_30;
    for (auto local_44 : local_2.PublicEventPoints)
    {
        FRuntimePublicEventPointData local_52;
        local_52.PublicEventPoint = local_44;
        for (auto& local_66 : local_44.PublicEventLBPClasses)
        {
            local_80 = Cast<UClass>(local_66.ToSoftObjectPath().TryLoad());
            if (local_80 == nullptr)
            {
                XError(ELog(22), FString().Append("Init Level Public Event: Failed to load LBP class ").Append(local_66));
                continue;
            }
            local_84 = Cast<AKLLevelScriptPublicEvent>(local_80.GetDefaultObject());
            if (local_84 != nullptr)
            {
                local_52.LBPs.Add(local_66);
                FRuntimePublicEventLBPData& local_86 = local_26.RuntimePublicEventLBPDatas.FindOrAdd(local_66);
                local_86.EventInfoConfig = local_84.EventInfo;
                CastTo local_114;
                TDataObjectPtr<FLevelPublicEventInfoConfig> local_138 = local_114.opCall();
                if (local_138.IsSet())
                {
                    int local_7 = local_138.opArrow().Priority;
                    local_86.Priority = local_7;
                }
                if (!(local_84.EventInfo))
                {
                    XWarning(ELog(22), FString().Append("Init Level Public Event: LBP ").Append(local_66).Append(" EventInfo not found"));
                }
            }
            else
            {
                XError(ELog(22), FString().Append("Init Level Public Event: LBP ").Append(local_66).Append(" not found"));
            }
        }
        int local_7_2 = local_52.LBPs.Num();
        if (local_7_2 > 0)
        {
            local_30.Add(local_26.RandomPublicEventPointData.Add(local_52));
        }
        else
        {
            XWarning(ELog(22), FString().Append("Init Level Public Event: PublicEventPoint ").Append(local_44).Append(" has no valid LBP"));
        }
    }
    FECSWorldPtr local_20_2 = ECS::GetECSWorld();
    FRandomGenerator local_175 = local_170.CreateGeneratorForComponent(FCS_LevelPublicEventData, FixedTime.Time, 0);
    XLog(ELog(22), FString().Append("Init Level Public Event: Begin Generate Public Event, MaxPublicEventCount=").Append(local_11).Append(", RandomGenerator.Seed ").Append(local_175));
    int local_7_3 = local_30.Num() * 2;
    int local_163 = FLevelPublicEventUtils::SelectAndActivatePublicEvents(World, local_175, local_26, local_30, local_7_3);
    if (local_163 >= local_7_3)
    {
        XWarning(ELog(22), FString().Append("Init Level Public Event:: Reached max attempts (").Append(local_7_3).Append("), selected ").Append(local_26.CurrentEventCount).Append(" events"));
    }
    else
    {
        XLog(ELog(22), FString().Append("Init Level Public Event:: Successfully selected ").Append(local_26.CurrentEventCount).Append(" events in ").Append(local_163).Append(" attempts"));
    }
    return;
}
}

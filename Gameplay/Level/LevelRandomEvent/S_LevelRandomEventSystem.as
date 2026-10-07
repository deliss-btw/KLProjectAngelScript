

class US_LevelRandomEventSystem : UECSScriptSystem
{
    US_LevelRandomEventSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_InitRandomEventData(const FCE_LevelLoadingPassBegin &inout Event) const
    {
        int local_12 = 0;
        int local_21 = 0;
        FString local_28;
        ALevelRandomEventPoint local_104;
        UClass local_160;
        AKLLevelScriptAreaTargetEvent local_164;
        int local_166;
        FString local_170;
        FString local_178;
        FString local_182;
        int local_236 = 0;
        ELevelRandomEventType local_441;
        if (!((FName(Event.LoadingPass) == FLevelGroupLoadingPassNames::RandomEventPassName)))
        {
            return;
        }
        FECSWorldPtr local_6 = ECS::GetECSWorld();
        AAS_ECSWorldSettings local_14 = (Cast<AAS_ECSWorldSettings>(this.GetWorld().GetWorldSettings()));
        if (local_14 != nullptr && ((local_14.RandomEventPoints.Num() <= 0)))
        {
            XLog(ELog(22), FString().Append("Init Level Random Event: No random event points found"));
            return;
        }
        int local_30 = 99;
        TDataObjectPtr<FCommissionConfig> local_54 = ::CommissionUtils::GetCurrentCommissionConfig();
        if (local_54)
        {
            local_30 = local_21;
        }
        if (local_30 <= 0)
        {
            XLog(ELog(22), FString().Append("Level random event count is 0, no random event will be generated"));
            return;
        }
        FECSWorldPtr local_6_2 = ECS::GetECSWorld();
        FCS_LevelRandomEventData local_84;
        local_84.MaxEventCount = local_30;
        TArray<float32> local_88;
        TArray<ALevelRandomEventPoint> local_96 = this.FilterRandomEventPointByDistance(local_54, local_14, local_88);
        XLog(ELog(22), FString().Append("Init Level Random Event: FilteredEventPoints=").Append(local_96.Num()).Append(", OriginalPoints=").Append(local_14.RandomEventPoints.Num()));
        TArray<int> local_100;
        int local_101 = 0;
        for (; local_101 < local_96.Num(); ++local_101)
        {
            local_104 = local_96[local_101];
            FRuntimeEventPointData local_124;
            local_124.RandomEventPoint = local_104;
            local_124.Location = local_104.GetActorLocation();
            local_124.DistToNearestResource = local_88[local_101];
            for (auto& local_146 : local_104.RandomEventLBPClasses)
            {
                local_160 = Cast<UClass>(local_146.ToSoftObjectPath().TryLoad());
                if (local_160 == nullptr)
                {
                    XError(ELog(22), FString().Append("Init Level Random Event: Failed to load LBP class ").Append(local_146));
                    continue;
                }
                local_164 = Cast<AKLLevelScriptAreaTargetEvent>(local_160.GetDefaultObject());
                if (local_164 != nullptr)
                {
                    local_124.LBPs.Add(local_146);
                    local_124.EventInfoConfigs.Add(local_164.EventInfo);
                    if (!(local_164.EventInfo))
                    {
                        XWarning(ELog(22), FString().Append("Init Level Random Event: LBP ").Append(local_146).Append(" EventInfo not found"));
                    }
                }
                else
                {
                    XError(ELog(22), FString().Append("Init Level Random Event: LBP ").Append(local_146).Append(" not found"));
                }
            }
            if (local_124.LBPs.Num() > 0)
            {
                int local_165 = local_84.RandomLevelEventPointData.Add(local_124);
                local_100.Add(local_165);
                int local_171 = 0;
                for (; local_171 < local_124.EventInfoConfigs.Num(); )
                {
                    TDataObjectPtr<FLevelEventInfoConfigBase>& local_174 = local_124.EventInfoConfigs[local_171];
                    if (local_174)
                    {
                        local_182 = local_174.GetDataName().ToString();
                    }
                    else
                    {
                        local_182 = "NULL";
                    }
                    if (local_171 > 0)
                    {
                        local_170 += ", ";
                    }
                    local_170 += local_182;
                    ++local_171;
                }
                XLog(ELog(22), FString().Append("Init Level Random Event: EventPoint [").Append(local_104.GetActorNameOrLabel()).Append("] idx=").Append(local_165).Append(", validLBPs=").Append(local_124.LBPs.Num()).Append(", EventInfos=[").Append(local_170).Append("]"));
                continue;
            }
            XWarning(ELog(22), FString().Append("Init Level Random Event: RandomEventPoint [").Append(local_104.GetActorNameOrLabel()).Append("] has no valid LBP"));
        }
        XLog(ELog(22), FString().Append("Init Level Random Event: Built ").Append(local_84.RandomLevelEventPointData.Num()).Append(" RuntimeEventPointData, ").Append(local_100.Num()).Append(" available for selection"));
        TMap<ELevelRandomEventType, FRandomEventTypeCountLimit> local_202;
        TArray<FRandomEventTypeCountLimit> local_206;
        if (local_54)
        {
            TArrayConstIterator<FRandomEventTypeCountLimit> local_212;
            for (; local_212.CanProceed;)
            {
                FRandomEventTypeCountLimit local_220 = local_212.Proceed();
                FRandomEventTypeCountLimit local_224;
                FRandomEventTypeCountLimit local_228;
                local_228 = local_220;
                local_224 = local_228;
                if (int(local_224.MinCount) > int(local_224.MaxCount))
                {
                    XWarning(ELog(22), FString().Append("Init Level Random Event: Type ").Append(int(local_224.LevelRandomEventType)).Append(" has MinCount(").Append(local_224.MinCount).Append(") > MaxCount(").Append(local_224.MaxCount).Append("), clamping MinCount to MaxCount"));
                    local_224.MinCount = int(local_224.MaxCount);
                }
                local_202.Add(local_224.LevelRandomEventType, local_224);
                local_206.Add(local_224);
            }
            int local_101_2 = 1;
            for (; local_101_2 < local_206.Num(); )
            {
                FRandomEventTypeCountLimit local_224;
                local_224 = local_206[local_101_2];
                local_21 = local_101_2 - 1;
                if (local_21 >= 0 && (int(local_206[local_21].LevelRandomEventType) < int(local_224.LevelRandomEventType)))
                {
                    int local_22_2 = local_21 + 1;
                    local_206[local_22_2] = local_206[local_21];
                    --local_21;
                }
                local_206[(local_21 + 1)] = local_224;
                ++local_101_2;
            }
        }
        FECSWorldPtr local_6_3 = ECS::GetECSWorld();
        FRandomGenerator local_241 = local_236.CreateGeneratorForComponent(FCS_LevelRandomEventData, local_12.Time, 0);
        XLog(ELog(22), FString().Append("Init Level Random Event: Begin Generate Random Event, MaxRandomEventCount=").Append(local_30).Append(", TypeCountLimits=").Append(local_206.Num()).Append(", RandomGenerator.Seed ").Append(local_241));
        TDataObjectPtr<FWeatherConfig> local_290 = ::FLevelUtils::GetCurrentCommissionWeatherConfig();
        TArray<TDataObjectPtr<FMonsterMainConfig>> local_294;
        if (local_54)
        {
            local_294 = ::FLevelUtils::GetTargetMonsterConfigsFromCommission(local_54);
        }
        FEventScoreContext local_350;
        local_350.CurrentWeather = local_290;
        local_350.TargetMonsters = local_294;
        local_350.CurrentTimeConfig = ::FLevelUtils::GetCurrentCommissionTimeConfig();
        if (local_290)
        {
            local_28 = local_290.GetDataName().ToString();
        }
        else
        {
            local_28 = "None";
        }
        if (local_350.CurrentTimeConfig)
        {
            local_178 = local_350.CurrentTimeConfig.GetDataName().ToString();
        }
        else
        {
            local_178 = "None";
        }
        XLog(ELog(22), FString().Append("Init Level Random Event: ScoreContext - Weather=[").Append(local_28).Append("], TargetMonsters=").Append(local_294.Num()).Append(", TimeConfig=[").Append(local_178).Append("]"));
        int local_165_2 = 0;
        for (; local_165_2 < local_294.Num(); )
        {
            if (local_294[local_165_2])
            {
                local_170 = local_294[local_165_2].GetDataName().ToString();
            }
            else
            {
                local_170 = "NULL";
            }
            XLog(ELog(22), FString().Append("Init Level Random Event: ScoreContext - TargetMonster[").Append(local_165_2).Append("]=[").Append(local_170).Append("]"));
            ++local_165_2;
        }
        TArray<FRandomEventDistanceTier> local_406;
        if (local_54)
        {
            local_21 = 1;
            for (; local_21 < local_406.Num(); )
            {
                FRandomEventDistanceTier local_408;
                local_408 = local_406[local_21];
                local_166 = local_21 - 1;
                while (local_166 >= 0 && (local_406[local_166].MaxDistance > local_408.MaxDistance))
                {
                    local_165_2 = local_166 + 1;
                    local_406[local_165_2] = local_406[local_166];
                    --local_166;
                }
                int local_171_3 = local_166 + 1;
                local_406[local_171_3] = local_408;
                ++local_21;
            }
        }
        int local_22_3 = local_406.Num();
        XLog(ELog(22), FString().Append("Init Level Random Event: DistanceTiers=").Append(local_22_3));
        local_21 = 0;
        for (; local_21 < local_406.Num(); )
        {
            XLog(ELog(22), FString().Append("Init Level Random Event: Tier[").Append(local_21).Append("]: MaxDistance=").Append(local_406[local_21].MaxDistance).Append("m, Weight=").Append(local_406[local_21].Weight));
            ++local_21;
        }
        this.ExecutePhase1_GuaranteeMinCount(local_84, local_100, local_206, local_406, local_241, local_350);
        XLog(ELog(22), FString().Append("Init Level Random Event: Phase1 done, selected ").Append(local_84.CurrentEventCount).Append(" events so far"));
        this.ExecutePhase2_FreeFill(local_84, local_100, local_202, local_406, local_241, local_350);
        XLog(ELog(22), FString().Append("Init Level Random Event: ===== Final Summary ====="));
        XLog(ELog(22), FString().Append("Init Level Random Event: TotalSelected=").Append(local_84.CurrentEventCount).Append("/").Append(local_84.MaxEventCount));
        auto local_416 = local_206.Iterator();
        for (; local_416.CanProceed;)
        {
            FRandomEventTypeCountLimit local_220_2 = local_416.Proceed();
            local_166 = 0;
            if (local_84.EventTypeCountMap.Find(local_220_2.LevelRandomEventType))
            {
                local_166 = local_22_3;
            }
            XLog(ELog(22), FString().Append("Init Level Random Event: Type ").Append(int(local_220_2.LevelRandomEventType)).Append(": count=").Append(local_166).Append(", Min=").Append(local_220_2.MinCount).Append(", Max=").Append(local_220_2.MaxCount));
        }
        auto local_432 = local_84.SelectedEventPointIndexes.Iterator();
        for (; local_432.CanProceed;)
        {
            int local_101_3 = local_432.Proceed();
            FRuntimeEventPointData& local_440 = local_84.RandomLevelEventPointData[local_101_3];
            local_170 = FString("NULL");
            local_441 = ELevelRandomEventType(0);
            if (int(local_440.SelectedLBPIndex) >= 0 && local_440.EventInfoConfigs.IsValidIndex(int(local_440.SelectedLBPIndex)))
            {
                TDataObjectPtr<FLevelEventInfoConfigBase>& local_174_2 = local_440.EventInfoConfigs[int(local_440.SelectedLBPIndex)];
                local_441 = this.GetEventTypeFromEventInfo(local_174_2);
                if (local_174_2)
                {
                    local_170 = local_174_2.GetDataName().ToString();
                }
            }
            XLog(ELog(22), FString().Append("Init Level Random Event: Selected [").Append(local_440.RandomEventPoint.GetActorNameOrLabel()).Append("] idx=").Append(local_101_3).Append(", config=[").Append(local_170).Append("], type=").Append(int(local_441)));
        }
        XLog(ELog(22), local_170.Append("Init Level Random Event: ===== End Summary ====="));
        return;
    }
    void ExecutePhase1_GuaranteeMinCount(FCS_LevelRandomEventData &inout LevelRandomEventData, TArray<int> &inout AvailableEventPointIndexes, const TArray<FRandomEventTypeCountLimit> &inout SortedTypeLimits, const TArray<FRandomEventDistanceTier> &inout DistanceTiers, FRandomGenerator &inout RandomGenerator, const FEventScoreContext &inout ScoreContext) const
    {
        int local_39;
        int local_40;
        ELevelRandomEventType local_41;
        TMap<ELevelRandomEventType, FRandomEventTypeCountLimit> local_20;
        for (auto& local_36 : SortedTypeLimits)
        {
            if (int(local_36.MinCount) <= 0)
            {
                continue;
            }
            local_39 = LevelRandomEventData.EventTypeCountMap.FindOrAdd(local_36.LevelRandomEventType);
            int local_38 = int(local_36.MinCount) - local_39;
            if (local_38 <= 0)
            {
                continue;
            }
            local_41 = local_36.LevelRandomEventType;
            XLog(ELog(22), FString().Append("Init Level Random Event: Phase1 - Guaranteeing MinCount for type ").Append(int(local_41)).Append(", need ").Append(local_38).Append(" more"));
            while (local_38 > 0 && (AvailableEventPointIndexes.Num() > 0) && (int(LevelRandomEventData.CurrentEventCount) < int(LevelRandomEventData.MaxEventCount)))
            {
                if (this.TrySelectOneEventPoint(LevelRandomEventData, AvailableEventPointIndexes, DistanceTiers, RandomGenerator, ScoreContext, local_20, ELevelRandomEventType(local_41), true, true, "Phase1") < 0)
                {
                    break;
                }
                else
                {
                    --local_38;
                }
            }
            if (local_38 > 0)
            {
                if (AvailableEventPointIndexes.Num() <= 0)
                {
                    int local_49 = int(local_41);
                    XLog(ELog(22), FString().Append("Init Level Random Event: Phase1 - Type ").Append(local_49).Append(" loop ended: no available event points left, deficit=").Append(local_38));
                }
                else
                {
                    if (int(LevelRandomEventData.CurrentEventCount) >= int(LevelRandomEventData.MaxEventCount))
                    {
                        int local_49_2 = int(local_41);
                        XLog(ELog(22), FString().Append("Init Level Random Event: Phase1 - Type ").Append(local_49_2).Append(" loop ended: reached MaxEventCount=").Append(LevelRandomEventData.MaxEventCount).Append(", deficit=").Append(local_38));
                    }
                }
            }
            local_40 = LevelRandomEventData.EventTypeCountMap.FindOrAdd(local_41);
            if (local_40 < int(local_36.MinCount))
            {
                int local_49_3 = int(local_41);
                XWarning(ELog(22), FString().Append("Init Level Random Event: Phase1 - Type ").Append(local_49_3).Append(" MinCount not satisfied, need ").Append(local_36.MinCount).Append(" but only got ").Append(local_40));
                continue;
            }
            XLog(ELog(22), FString().Append("Init Level Random Event: Phase1 - Type ").Append(int(local_41)).Append(" MinCount satisfied, count=").Append(local_40));
        }
        return;
    }
    void ExecutePhase2_FreeFill(FCS_LevelRandomEventData &inout LevelRandomEventData, TArray<int> &inout AvailableEventPointIndexes, const TMap<ELevelRandomEventType, FRandomEventTypeCountLimit> &inout TypeCountLimitMap, const TArray<FRandomEventDistanceTier> &inout DistanceTiers, FRandomGenerator &inout RandomGenerator, const FEventScoreContext &inout ScoreContext) const
    {
        int local_1 = 0;
        while (AvailableEventPointIndexes.Num() > 0 && (int(LevelRandomEventData.CurrentEventCount) < int(LevelRandomEventData.MaxEventCount)))
        {
            ++local_1;
            if (this.TrySelectOneEventPoint(LevelRandomEventData, AvailableEventPointIndexes, DistanceTiers, RandomGenerator, ScoreContext, TypeCountLimitMap, ELevelRandomEventType(0), false, false, FString().Append("Phase2-R").Append(local_1)) < 0)
            {
                break;
            }
            else
            {
            }
        }
        if (AvailableEventPointIndexes.Num() <= 0)
        {
            XLog(ELog(22), FString().Append("Init Level Random Event: Phase2 done - no available points left, selected ").Append(LevelRandomEventData.CurrentEventCount).Append(" events total in ").Append(local_1).Append(" rounds"));
            return;
        }
        if (int(LevelRandomEventData.CurrentEventCount) >= int(LevelRandomEventData.MaxEventCount))
        {
            XLog(ELog(22), FString().Append("Init Level Random Event: Phase2 done - reached MaxEventCount=").Append(LevelRandomEventData.MaxEventCount).Append(", selected ").Append(LevelRandomEventData.CurrentEventCount).Append(" events total in ").Append(local_1).Append(" rounds"));
            return;
        }
        XLog(ELog(22), FString().Append("Init Level Random Event: Phase2 done, selected ").Append(LevelRandomEventData.CurrentEventCount).Append(" events total in ").Append(local_1).Append(" rounds"));
        return;
    }
    int TrySelectOneEventPoint(FCS_LevelRandomEventData &inout LevelRandomEventData, TArray<int> &inout AvailableEventPointIndexes, const TArray<FRandomEventDistanceTier> &inout DistanceTiers, FRandomGenerator &inout RandomGenerator, const FEventScoreContext &inout ScoreContext, const TMap<ELevelRandomEventType, FRandomEventTypeCountLimit> &inout TypeCountLimitMap, const ELevelRandomEventType TargetType, const bool bFilterByType, const bool bGuaranteeMode, const FString &inout PhaseLabel) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        int __r; return __r;
    }
    void BuildDistanceWeightedCandidatePoints(const FCS_LevelRandomEventData &inout LevelRandomEventData, const TArray<int> &inout AvailableEventPointIndexes, const TArray<int> &inout SkippedIndexes, const TArray<FRandomEventDistanceTier> &inout DistanceTiers, const ELevelRandomEventType TargetType, const bool bFilterByType, const bool bGuaranteeMode, TArray<int> &inout OutCandidates, TArray<float32> &inout OutWeights) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    ELevelRandomEventType GetEventTypeFromEventInfo(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout EventInfoConfig) const
    {
        int local_55 = 0;
        if (EventInfoConfig)
        {
            CastTo local_6;
            if (local_6.opCall())
            {
                return ELevelRandomEventType(local_55);
            }
        }
        return ELevelRandomEventType(0);
    }
    void OnEventPointSelected(FCS_LevelRandomEventData &inout LevelRandomEventData, TArray<int> &inout AvailableEventPointIndexes, const int EventPointIdx) const
    {
        LevelRandomEventData.SelectedEventPointIndexes.Add(EventPointIdx);
        ++LevelRandomEventData.CurrentEventCount;
        FRuntimeEventPointData& local_4 = LevelRandomEventData.RandomLevelEventPointData[EventPointIdx];
        int local_1 = int(local_4.SelectedLBPIndex);
        ELevelRandomEventType local_8 = this.GetEventTypeFromEventInfo(local_4.EventInfoConfigs[int(local_4.SelectedLBPIndex)]);
        LevelRandomEventData.EventTypeCountMap.FindOrAdd(local_8);
        FString local_12 = "NULL";
        if (local_4.EventInfoConfigs.IsValidIndex(int(local_4.SelectedLBPIndex)))
        {
            TDataObjectPtr<FLevelEventInfoConfigBase>& local_14 = local_4.EventInfoConfigs[int(local_4.SelectedLBPIndex)];
            if (local_14)
            {
                local_12 = local_14.GetDataName().ToString();
            }
        }
        XLog(ELog(22), FString().Append("Init Level Random Event: Selected EventPoint [").Append(local_4.RandomEventPoint.GetActorNameOrLabel()).Append("] idx=").Append(EventPointIdx).Append(", config=[").Append(local_12).Append("], type=").Append(int(local_8)).Append(", totalCount=").Append(LevelRandomEventData.CurrentEventCount));
        UClass local_40 = (Cast<UClass>(local_4.LBPs[int(local_4.SelectedLBPIndex)].ToSoftObjectPath().TryLoad()));
        if (local_40 != nullptr)
        {
            this.ActivateDatalayer(TSubclassOf<AKLLevelScriptAreaTargetEvent>(local_40));
        }
        AvailableEventPointIndexes = this.ReGenerateAvailableEventPointIndexes(LevelRandomEventData);
        return;
    }
    bool AreSameEventFamily(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout ConfigA, const TDataObjectPtr<FLevelEventInfoConfigBase> &inout ConfigB) const
    {
        bool local_77;
        bool local_78 = false;
        CastTo local_4;
        TDataObjectPtr<FLevelRandomEventInfoConfig> local_28 = local_4.opCall();
        TDataObjectPtr<FLevelRandomEventInfoConfig> local_52 = local_4.opCall();
        if (!(local_28))
        {
            local_77 = false;
        }
        else
        {
            local_78 = local_52;
            local_77 = local_78;
        }
        local_77 = local_77 && local_78;
        local_77 = local_77 && local_78;
        if (local_77)
        {
            return local_78;
        }
        return (ConfigA == ConfigB.opImplConv());
    }
    bool CheckSameConfigDistanceConstraint(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout EventInfoConfig, const FRuntimeEventPointData &inout EventPointData, const FCS_LevelRandomEventData &inout LevelRandomEventData) const
    {
        bool local_13 = false;
        FString local_42;
        for (auto local_14 : LevelRandomEventData.SelectedEventPointIndexes)
        {
            const FRuntimeEventPointData& local_18 = LevelRandomEventData.RandomLevelEventPointData[local_14];
            int local_15 = int(local_18.SelectedLBPIndex);
            const TDataObjectPtr<FLevelEventInfoConfigBase>& local_22 = local_18.EventInfoConfigs[int(local_18.SelectedLBPIndex)];
            if (this.AreSameEventFamily(EventInfoConfig, local_22))
            {
                float local_26 = EventPointData.Location.DistSquared(local_18.Location);
                if (local_26 < 10000000000.0)
                {
                    float local_28 = float32(FMath::Sqrt(local_26));
                    float32 local_29 = 100.0f;
                    local_28 = local_28 / local_29;
                    local_29 = 10000000000.0f;
                    local_29 = FMath::Sqrt(local_29) / 100.0f;
                    FString local_46;
                    if (EventInfoConfig)
                    {
                        local_46 = EventInfoConfig.GetDataName().ToString();
                    }
                    else
                    {
                        local_46 = "NULL";
                    }
                    FString local_36;
                    if (local_22)
                    {
                        local_42 = local_22.GetDataName().ToString();
                        local_36 = local_42;
                    }
                    else
                    {
                        local_36 = "NULL";
                    }
                    FString local_54 = "None";
                    CastTo local_58;
                    if (local_58.opCall() && local_13)
                    {
                        local_54 = local_42;
                    }
                    XLog(ELog(22), local_42.Append("Init Level Random Event: SameConfigDistCheck - EventPoint [").Append(EventPointData.RandomEventPoint.GetActorNameOrLabel()).Append("] config=[").Append(local_46).Append("] (family=[").Append(local_54).Append("]) too close to selected EventPoint [").Append(local_18.RandomEventPoint.GetActorNameOrLabel()).Append("] config=[").Append(local_36).Append("] (idx=").Append(local_14).Append("), dist=").Append(local_28).Append("m < minRequired=").Append(local_29).Append("m"));
                    return false;
                }
            }
        }
        return true;
    }
    float32 GetBaseScoreFromEventInfo(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout EventInfoConfig) const
    {
        float32 local_2 = 0.0f;
        if (!(EventInfoConfig))
        {
            return 100.0f;
        }
        CastTo local_6;
        if (!(local_6.opCall()))
        {
            return 100.0f;
        }
        return local_2;
    }
    float32 CalculateEventScore(const TDataObjectPtr<FLevelEventInfoConfigBase> &inout EventInfoConfig, const FEventScoreContext &inout ScoreContext) const
    {
        float32 local_1 = 0.0f;
        float32 local_10 = 0.0f;
        float32 local_2 = this.GetBaseScoreFromEventInfo(EventInfoConfig);
        float32 local_3 = local_2;
        if (!(EventInfoConfig))
        {
            XLog(ELog(22), FString().Append("CalculateEventScore: config=[NULL], BaseScore=").Append(local_2).Append(", FinalScore=").Append(local_3));
            return FMath::Max(local_3, 0.0f);
        }
        FString local_8 = EventInfoConfig.GetDataName().ToString();
        CastTo local_20;
        if (!(local_20.opCall()) || !(GetScoreModifierConfig()))
        {
            XLog(ELog(22), FString().Append("CalculateEventScore: config=[").Append(local_8).Append("], BaseScore=").Append(local_2).Append(", no ScoreModifier, FinalScore=").Append(local_3));
            return FMath::Max(local_3, 0.0f);
        }
        FEventScoreModifierConfig local_72;
        FString local_14 = local_72.Name.ToString();
        if (ScoreContext.CurrentWeather && (local_72.GetWeatherModifier().Num() > 0))
        {
            float32 local_83;
            if (local_72.GetWeatherModifier().Find(ScoreContext.CurrentWeather))
            {
                local_83 = local_1;
                local_3 = local_3 + local_83;
                FString local_76 = ScoreContext.CurrentWeather.GetDataName().ToString();
                FString local_88 = FString();
                XLog(ELog(22), local_88.Append("CalculateEventScore: config=[").Append(local_8).Append("], modifier=[").Append(local_14).Append("], Weather=[").Append(local_76).Append("] bonus=").Append(local_83));
            }
        }
        if (ScoreContext.TargetMonsters.Num() > 0 && (local_72.GetCommissionBossModifier().Num() > 0))
        {
            float32 local_83;
            for (auto& local_102 : ScoreContext.TargetMonsters)
            {
                if (!(local_102))
                {
                    continue;
                }
                if (local_72.GetCommissionBossModifier().Find(local_102))
                {
                    local_83 = local_10;
                    local_3 = local_3 + local_83;
                    FString local_88_2 = local_102.GetDataName().ToString();
                    FString local_76_2 = FString();
                    XLog(ELog(22), local_76_2.Append("CalculateEventScore: config=[").Append(local_8).Append("], modifier=[").Append(local_14).Append("], Boss=[").Append(local_88_2).Append("] bonus=").Append(local_83));
                }
            }
        }
        if (ScoreContext.CurrentTimeConfig && (local_72.GetCommissionTimeModifier().Num() > 0))
        {
            float32 local_83;
            if (local_72.GetCommissionTimeModifier().Find(ScoreContext.CurrentTimeConfig))
            {
                local_83 = local_1;
                local_3 = local_3 + local_83;
                FString local_76_3 = ScoreContext.CurrentTimeConfig.GetDataName().ToString();
                FString local_88_3 = FString();
                XLog(ELog(22), local_88_3.Append("CalculateEventScore: config=[").Append(local_8).Append("], modifier=[").Append(local_14).Append("], TimeConfig=[").Append(local_76_3).Append("] bonus=").Append(local_83));
            }
        }
        local_3 = FMath::Max(local_3, 0.0f);
        FString local_88_4 = FString();
        XLog(ELog(22), local_88_4.Append("CalculateEventScore: config=[").Append(local_8).Append("], modifier=[").Append(local_14).Append("], BaseScore=").Append(local_2).Append(", FinalScore=").Append(local_3));
        return local_3;
    }
    int WeightedRandomSelectFromCandidates(const TArray<int> &inout CandidateIndices, const TArray<float32> &inout Weights, FRandomGenerator &inout RandomGenerator) const
    {
        if (CandidateIndices.Num() <= 0)
        {
            return -1;
        }
        if (CandidateIndices.Num() == 1)
        {
            return CandidateIndices[0];
        }
        float32 local_4 = 0.0f;
        for (auto local_19 : Weights)
        {
            local_4 = local_4 + local_19;
        }
        if (local_4 <= 0.0f)
        {
            XWarning(ELog(22), FString().Append("WeightedRandomSelect: TotalWeight=0, all candidates have zero weight, returning -1"));
            return -1;
        }
        float32 local_26 = RandomGenerator.NextRange(0.0f, local_4);
        float32 local_27 = 0.0f;
        int local_28 = 0;
        for (; local_28 < CandidateIndices.Num(); ++local_28)
        {
            float32 local_5 = Weights[local_28];
            local_27 = local_27 + local_5;
            if (local_26 < local_27)
            {
                XLog(ELog(22), FString().Append("WeightedRandomSelect: Roll=").Append(local_26).Append(", TotalWeight=").Append(local_4).Append(", selected candidate[").Append(local_28).Append("]=").Append(CandidateIndices[local_28]).Append(", weight=").Append(Weights[local_28]));
                return CandidateIndices[local_28];
            }
        }
        int local_1 = CandidateIndices.Num() - 1;
        XLog(ELog(22), FString().Append("WeightedRandomSelect: Roll=").Append(local_26).Append(", TotalWeight=").Append(local_4).Append(", fallback to last candidate[").Append(local_1).Append("]=").Append(CandidateIndices[local_1]));
        return CandidateIndices[local_1];
    }
    float32 GetEventPointDistanceWeight(const float32 DistToNearestResourceM, const TArray<FRandomEventDistanceTier> &inout Tiers) const
    {
        float32 local_7;
        if (Tiers.Num() <= 0 || (DistToNearestResourceM < 0.0f))
        {
            return 1.0f;
        }
        int local_6 = 0;
        for (; local_6 < Tiers.Num(); ++local_6)
        {
            if (Tiers[local_6].MaxDistance >= DistToNearestResourceM)
            {
                local_7 = Tiers[local_6].Weight;
                if (local_7 < 0.0f)
                {
                    XWarning(ELog(22), FString().Append("GetEventPointDistanceWeight: Tier[").Append(local_6).Append("] MaxDistance=").Append(Tiers[local_6].MaxDistance).Append("m has negative Weight=").Append(local_7).Append(", clamping to 0"));
                    local_7 = 0.0f;
                }
                return local_7;
            }
        }
        local_7 = Tiers.Last(0).Weight;
        if (local_7 < 0.0f)
        {
            XWarning(ELog(22), FString().Append("GetEventPointDistanceWeight: dist=").Append(DistToNearestResourceM).Append("m exceeds all tiers, lastTier Weight=").Append(local_7).Append(" is negative, clamping to 0"));
            local_7 = 0.0f;
        }
        return local_7;
    }
    bool TrySelectLBPForEventPointWithType(FRuntimeEventPointData &inout EventPointData, const FCS_LevelRandomEventData &inout LevelRandomEventData, FRandomGenerator &inout RandomGenerator, const ELevelRandomEventType TargetType, const FEventScoreContext &inout ScoreContext) const
    {
        if (EventPointData.EventInfoConfigs.Num() <= 0)
        {
            XLog(ELog(22), FString().Append("Init Level Random Event: Phase1 - EventPoint [").Append(EventPointData.RandomEventPoint.GetActorNameOrLabel()).Append("] has no EventInfoConfigs, skip"));
            return false;
        }
        TArray<int> local_18;
        TArray<float32> local_22;
        int local_23 = 0;
        while (local_23 < 0)
        {
            TDataObjectPtr<FLevelEventInfoConfigBase>& local_26 = EventPointData.EventInfoConfigs[local_23];
            if (!(local_26))
            {
                XLog(ELog(22), FString().Append("Init Level Random Event: Phase1 - EventPoint [").Append(EventPointData.RandomEventPoint.GetActorNameOrLabel()).Append("] LBP[").Append(local_23).Append("] EventInfo is null, skip"));
            }
            else
            {
                FString local_8 = local_26.GetDataName().ToString();
                ELevelRandomEventType local_34 = this.GetEventTypeFromEventInfo(local_26);
                if (int(local_34) != int(TargetType))
                {
                    XLog(ELog(22), FString().Append("Init Level Random Event: Phase1 - EventPoint [").Append(EventPointData.RandomEventPoint.GetActorNameOrLabel()).Append("] config=[").Append(local_8).Append("] type=").Append(int(local_34)).Append(" != target=").Append(int(TargetType)).Append(", skip"));
                }
                else
                {
                    if (!(this.CheckSameConfigDistanceConstraint(local_26, EventPointData, LevelRandomEventData)))
                    {
                    }
                    else
                    {
                        float32 local_37 = this.CalculateEventScore(local_26, ScoreContext);
                        if (local_37 <= 0.0f)
                        {
                            XLog(ELog(22), FString().Append("Init Level Random Event: Phase1 - EventPoint [").Append(EventPointData.RandomEventPoint.GetActorNameOrLabel()).Append("] config=[").Append(local_8).Append("] score=").Append(local_37).Append(" <= 0, skip"));
                        }
                        else
                        {
                            local_18.Add(local_23);
                            local_22.Add(local_37);
                            XLog(ELog(22), FString().Append("Init Level Random Event: Phase1 - EventPoint [").Append(EventPointData.RandomEventPoint.GetActorNameOrLabel()).Append("] candidate config=[").Append(local_8).Append("] weight=").Append(local_37));
                        }
                    }
                }
            }
            ++local_23;
        }
        if (local_18.Num() <= 0)
        {
            XLog(ELog(22), FString().Append("Init Level Random Event: Phase1 - EventPoint [").Append(EventPointData.RandomEventPoint.GetActorNameOrLabel()).Append("] no valid candidates for type=").Append(int(TargetType)));
            return false;
        }
        int local_1 = this.WeightedRandomSelectFromCandidates(local_18, local_22, RandomGenerator);
        if (local_1 < 0)
        {
            return false;
        }
        EventPointData.SelectedLBPIndex = local_1;
        return true;
    }
    bool TrySelectLBPForEventPoint(FRuntimeEventPointData &inout EventPointData, const FCS_LevelRandomEventData &inout LevelRandomEventData, FRandomGenerator &inout RandomGenerator, const TMap<ELevelRandomEventType, FRandomEventTypeCountLimit> &inout TypeCountLimitMap, const FEventScoreContext &inout ScoreContext) const
    {
        int local_2 = 0;
        int local_27 = 0;
        int local_35;
        if ((EventPointData.EventInfoConfigs.Num()) <= 0)
        {
            XLog(ELog(22), FString().Append("Init Level Random Event: Phase2 - EventPoint [").Append(EventPointData.RandomEventPoint.GetActorNameOrLabel()).Append("] has no EventInfoConfigs, skip"));
            return false;
        }
        TArray<int> local_18;
        TArray<float32> local_22;
        int local_23 = 0;
        while (local_23 < local_2)
        {
            TDataObjectPtr<FLevelEventInfoConfigBase>& local_26 = EventPointData.EventInfoConfigs[local_23];
            if (!(local_26))
            {
                local_2 = TypeCountLimitMap.Num();
                if (local_2 > 0)
                {
                    int local_28;
                    local_28 = ELevelRandomEventType(0);
                    if (TypeCountLimitMap.Find(ELevelRandomEventType(local_28)))
                    {
                        local_35 = 0;
                        if (LevelRandomEventData.EventTypeCountMap.Find(ELevelRandomEventType(local_28)))
                        {
                            local_35 = local_2;
                        }
                        if (local_35 >= local_27)
                        {
                            FString local_12 = EventPointData.RandomEventPoint.GetActorNameOrLabel();
                            FString local_8 = FString();
                        }
                        else
                        {
                        }
                    }
                }
                float32 local_42 = this.CalculateEventScore(local_26, ScoreContext);
                local_18.Add(local_23);
                local_22.Add(local_42);
                XLog(ELog(22), FString().Append("Init Level Random Event: Phase2 - EventPoint [").Append(EventPointData.RandomEventPoint.GetActorNameOrLabel()).Append("] LBP[").Append(local_23).Append("] EventInfo is null, candidate weight=").Append(local_42));
            }
            else
            {
                FString local_8_2 = local_26.GetDataName().ToString();
                local_2 = TypeCountLimitMap.Num();
                if (local_2 > 0)
                {
                    ELevelRandomEventType local_29 = this.GetEventTypeFromEventInfo(local_26);
                    if (TypeCountLimitMap.Find(local_29))
                    {
                        local_35 = 0;
                        if (LevelRandomEventData.EventTypeCountMap.Find(local_29))
                        {
                            local_35 = local_27;
                        }
                        if (local_35 >= local_2)
                        {
                            local_2 = int(local_29);
                            FString local_12_2 = EventPointData.RandomEventPoint.GetActorNameOrLabel();
                            FString local_46 = FString();
                        }
                        else
                        {
                        }
                    }
                }
                if (!(this.CheckSameConfigDistanceConstraint(local_26, EventPointData, LevelRandomEventData)))
                {
                }
                else
                {
                    float32 local_41 = this.CalculateEventScore(local_26, ScoreContext);
                    if (local_41 <= 0.0f)
                    {
                        XLog(ELog(22), FString().Append("Init Level Random Event: Phase2 - EventPoint [").Append(EventPointData.RandomEventPoint.GetActorNameOrLabel()).Append("] config=[").Append(local_8_2).Append("] score=").Append(local_41).Append(" <= 0, skip"));
                    }
                    else
                    {
                        local_18.Add(local_23);
                        local_22.Add(local_41);
                        XLog(ELog(22), FString().Append("Init Level Random Event: Phase2 - EventPoint [").Append(EventPointData.RandomEventPoint.GetActorNameOrLabel()).Append("] candidate config=[").Append(local_8_2).Append("] weight=").Append(local_41));
                    }
                }
            }
            ++local_23;
        }
        if (local_18.Num() <= 0)
        {
            XLog(ELog(22), FString().Append("Init Level Random Event: Phase2 - EventPoint [").Append(EventPointData.RandomEventPoint.GetActorNameOrLabel()).Append("] no valid candidates"));
            return false;
        }
        local_27 = this.WeightedRandomSelectFromCandidates(local_18, local_22, RandomGenerator);
        if (local_27 < 0)
        {
            return false;
        }
        EventPointData.SelectedLBPIndex = local_27;
        return true;
    }
    TArray<int> ReGenerateAvailableEventPointIndexes(FCS_LevelRandomEventData &inout LevelRandomEventData) const
    {
        TArray<int> local_4;
        int local_5 = 0;
        int local_7 = 0;
        int local_8 = 0;
        float32 local_10 = FMath::Sqrt(144000000.0f) / 100.0f;
        float32 local_12_2 = 2500000000.0f;
        float local_9 = FMath::Sqrt(local_12_2);
        float32 local_12_3 = local_9 / 100.0f;
        int local_14 = 0;
        while (local_14 < 0)
        {
            FRuntimeEventPointData& local_18 = LevelRandomEventData.RandomLevelEventPointData[local_14];
            if (local_18.LBPs.Num() <= 0)
            {
            }
            else
            {
                if (int(local_18.SelectedLBPIndex) >= 0)
                {
                    ++local_8;
                }
                else
                {
                    bool local_20;
                    bool local_16;
                    local_20 = true;
                    local_16 = (LevelRandomEventData.SelectedEventPointIndexes.Num() == 0);
                    int local_22 = -1;
                    float local_24 = 0.0;
                    for (auto local_39 : LevelRandomEventData.SelectedEventPointIndexes)
                    {
                        float local_26 = local_18.Location.DistSquared(LevelRandomEventData.RandomLevelEventPointData[local_39].Location);
                        if (local_26 < 144000000.0)
                        {
                            local_20 = false;
                            local_22 = local_39;
                            local_24 = local_26;
                            break;
                        }
                        if (local_26 < 2500000000.0)
                        {
                            local_16 = true;
                        }
                    }
                    if (!(local_20))
                    {
                        ++local_5;
                        float local_9_2 = float32(FMath::Sqrt(local_24)) / 100.0f;
                        XLog(ELog(22), FString().Append("Init Level Random Event: RegenAvailable - EventPoint [").Append(local_18.RandomEventPoint.GetActorNameOrLabel()).Append("] idx=").Append(local_14).Append(" too close to selected [").Append(LevelRandomEventData.RandomLevelEventPointData[local_22].RandomEventPoint.GetActorNameOrLabel()).Append("] idx=").Append(local_22).Append(", dist=").Append(local_9_2).Append("m < minRequired=").Append(local_10).Append("m"));
                    }
                    else
                    {
                        if (!(local_16))
                        {
                            ++local_7;
                            XLog(ELog(22), FString().Append("Init Level Random Event: RegenAvailable - EventPoint [").Append(local_18.RandomEventPoint.GetActorNameOrLabel()).Append("] idx=").Append(local_14).Append(" too far from all selected points, no selected point within ").Append(local_12_3).Append("m"));
                        }
                        else
                        {
                            local_4.Add(local_14);
                        }
                    }
                }
            }
            ++local_14;
        }
        XLog(ELog(22), FString().Append("Init Level Random Event: RegenAvailable - available=").Append(local_4.Num()).Append(", alreadySelected=").Append(local_8).Append(", filteredByMinDist=").Append(local_5).Append(", filteredByMaxDist=").Append(local_7));
        return local_4;
    }
    void ActivateDatalayer(const TSubclassOf<AKLLevelScriptAreaTargetEvent> &inout LBPClass) const
    {
        UClass local_2;
        ::FLevelDataLayerUtils::SetDatalayerRuntimeStateByName(this.GetWorld(), local_2.GetFName(), EDataLayerRuntimeState(2));
        bool local_8 = ::FInitialLevelLoadingPassUtils::TryToAddGroupToInitialLoadingPass(FLevelGroupLoadingPassNames::RandomEventPassName, local_2.GetFName());
        if (local_8)
        {
            XLog(ELog(22), FString().Append("Init Level Random Event:: ActivateDatalayer: ").Append(local_2.GetFName()));
            return;
        }
        XError(ELog(22), FString().Append("Init Level Random Event:: Failed to Activate Datalayer: ").Append(local_2.GetFName()));
        return;
    }
    TSet<TDataObjectPtr<FEcologyCreatureDefinitionRow>> FindTargetMonsterCreatureTypes(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig) const
    {
        TSet<TDataObjectPtr<FEcologyCreatureDefinitionRow>> local_20;
        if (!(CommissionConfig))
        {
            return local_20;
        }
        TArray<TDataObjectPtr<FEcologyCreatureDefinitionRow>> local_26 = GetRandomEventFilterTargetCreatures();
        if (local_26.Num() > 0)
        {
            for (auto& local_42 : local_26)
            {
                if (local_42)
                {
                    local_20.Add(local_42);
                }
            }
        }
        else
        {
            TArray<TDataObjectPtr<FMonsterMainConfig>> local_46 = ::FLevelUtils::GetTargetMonsterConfigsFromCommission(CommissionConfig);
            for (auto& local_64 : local_46)
            {
                local_64;
                if (GetCreature())
                {
                    local_20.Add(GetCreature());
                }
            }
        }
        return local_20;
    }
    bool FindMatchedResourcePrefabsFromCommission(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig, const AAS_ECSWorldSettings WorldSettings, TArray<AEcologyResourcePrefab> &inout OutResourcePrefabs) const
    {
        FVirtualConfigData local_104;
        FName local_130;
        TSet<TDataObjectPtr<FEcologyCreatureDefinitionRow>> local_40 = this.FindTargetMonsterCreatureTypes(CommissionConfig);
        if (local_40.Num() <= 0)
        {
            XWarning(ELog(22), FString().Append("Init Level Random Event: FindMatchedResources - No TargetMonsterCreatureTypes found"));
            return false;
        }
        TSet<TDataObjectPtr<FEcologyResourceDefinitionRow>> local_70;
        TDataObjectIterator<FEcologyActivityDefinitionRow> local_86;
        for (; local_86; )
        {
            if (local_40.Contains(local_86.GetData().GetCreature()))
            {
                local_70.Add(local_86.GetData().GetResource());
            }
            local_86.Next();
        }
        XLog(ELog(22), FString().Append("Init Level Random Event: FindMatchedResources - TargetCreatureTypes=").Append(local_40.Num()).Append(", MatchedResourceTypes=").Append(local_70.Num()).Append(", EcologyResources=").Append(WorldSettings.EcologyResources.Num()));
        int local_88 = 0;
        for (auto local_102 : WorldSettings.EcologyResources)
        {
            if ((!((local_102 != nullptr))))
            {
                continue;
            }
            if (!(::FLevelDataLayerUtils::IsActorInActivatedDataLayer(local_102)))
            {
                ++local_88;
                continue;
            }
            if (FInstancedStruct::GetPtr(local_104.GetConfigData()).opCall())
            {
                if (local_70.Contains(unresolved.ResourceType))
                {
                    FVector local_124 = local_102.GetActorLocation();
                    XLog(ELog(22), FString().Append("Init Level Random Event: FindMatchedResources - Matched ResourcePrefab [").Append(local_102.GetActorNameOrLabel()).Append("] (Single), resourceType=[").Append(local_130).Append("], location=(").Append(local_124.X).Append(", ").Append(local_124.Y).Append(", ").Append(local_124).Append(")"));
                    OutResourcePrefabs.Add(local_102);
                }
            }
            else
            {
                if (FInstancedStruct::GetPtr(local_104.GetConfigData()).opCall())
                {
                    if (local_70.Contains(unresolved.ResourceType))
                    {
                        FVector local_118 = local_102.GetActorLocation();
                        XLog(ELog(22), FString().Append("Init Level Random Event: FindMatchedResources - Matched ResourcePrefab [").Append(local_102.GetActorNameOrLabel()).Append("] (Area), resourceType=[").Append(local_130).Append("], location=(").Append(local_118.X).Append(", ").Append(local_118.Y).Append(", ").Append(local_118).Append(")"));
                        OutResourcePrefabs.Add(local_102);
                    }
                }
            }
        }
        XLog(ELog(22), FString().Append("Init Level Random Event: FindMatchedResources - Total matched: ").Append(OutResourcePrefabs.Num()).Append(", SkippedByDataLayer: ").Append(local_88));
        return true;
    }
    TArray<ALevelRandomEventPoint> FilterRandomEventPointByDistance(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig, const AAS_ECSWorldSettings WorldSettings, TArray<float32> &inout OutDistancesM) const
    {
        float32 local_12 = 0.0f;
        int local_2 = WorldSettings.RandomEventPoints.Num();
        if (!(CommissionConfig))
        {
            XLog(ELog(22), FString().Append("Init Level Random Event: FilterByDistance - No CommissionConfig, skipping distance filter, returning all ").Append(local_2).Append(" points"));
            OutDistancesM.SetNum(local_2);
            int local_10 = 0;
            for (; local_10 < local_2; )
            {
                local_12 = -1.0f;
                OutDistancesM[local_10] = -1.0f;
                ++local_10;
            }
            return WorldSettings.RandomEventPoints;
        }
        TArray<AEcologyResourcePrefab> local_16;
        this.FindMatchedResourcePrefabsFromCommission(CommissionConfig, WorldSettings, local_16);
        float32 local_17 = local_12;
        XLog(ELog(22), FString().Append("Init Level Random Event: FilterByDistance - TotalPoints=").Append(local_2).Append(", MatchedResources=").Append(local_16.Num()).Append(", FilterDistance=").Append(local_17).Append("m"));
        if (local_16.Num() <= 0)
        {
            XLog(ELog(22), FString().Append("Init Level Random Event: FilterByDistance - No matched resources found, skipping distance filter, returning all ").Append(local_2).Append(" points"));
            OutDistancesM.SetNum(local_2);
            int local_10_2 = 0;
            for (; local_10_2 < local_2; )
            {
                OutDistancesM[local_10_2] = -1.0f;
                ++local_10_2;
            }
            return WorldSettings.RandomEventPoints;
        }
        local_12 = local_17 * 100.0f;
        float local_20 = FMath::Square(local_12);
        TArray<ALevelRandomEventPoint> local_28;
        TArray<FString> local_32;
        for (auto local_46 : WorldSettings.RandomEventPoints)
        {
            if ((!((local_46 != nullptr))))
            {
                continue;
            }
            FVector local_58 = local_46.GetActorLocation();
            float local_60 = 3.4028234663852886e38;
            FString local_64;
            for (auto local_78 : local_16)
            {
                if ((!((local_78 != nullptr))))
                {
                    continue;
                }
                float local_24 = local_78.GetActorLocation().DistSquared2D(local_58);
                if (local_24 < local_60)
                {
                    local_60 = local_24;
                    local_64 = local_78.GetActorNameOrLabel();
                }
            }
            if (local_60 < local_20)
            {
                local_28.Add(local_46);
                local_12 = float32(FMath::Sqrt(local_60));
                local_12 = local_12 / 100.0f;
                OutDistancesM.Add(local_12);
                local_32.Add(local_64);
            }
            else
            {
                float32 local_21 = float32(FMath::Sqrt(local_60));
                local_12 = 100.0f;
                local_21 = local_21 / local_12;
                XLog(ELog(22), FString().Append("Init Level Random Event: FilterByDistance - EventPoint [").Append(local_46.GetActorNameOrLabel()).Append("] filtered out, nearestResource=[").Append(local_64).Append("], nearestResourceDist=").Append(local_21).Append("m > threshold=").Append(local_17).Append("m"));
            }
        }
        XLog(ELog(22), FString().Append("Init Level Random Event: FilterByDistance - Result: ").Append(local_28.Num()).Append("/").Append(local_2).Append(" points passed distance filter"));
        int local_10_3 = 0;
        for (; local_10_3 < local_28.Num(); )
        {
            XLog(ELog(22), FString().Append("Init Level Random Event: FilterByDistance - [").Append(local_10_3).Append("] EventPoint [").Append(local_28[local_10_3].GetActorNameOrLabel()).Append("] nearestResource=[").Append(local_32[local_10_3]).Append("], nearestResourceDist=").Append(OutDistancesM[local_10_3]).Append("m"));
            ++local_10_3;
        }
        return local_28;
    }
    UFUNCTION()
    void Run_ServerJob_InitRandomEventData() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_LevelLoadingPassBegin> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_LevelLoadingPassBegin& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_InitRandomEventData(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


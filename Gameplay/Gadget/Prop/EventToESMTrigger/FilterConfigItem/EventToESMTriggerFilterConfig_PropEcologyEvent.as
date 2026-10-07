

struct FEventToESMTriggerFilterConfigItem_PropEcologyEvent : FEventToESMTriggerFilterConfigItemBase
{
    FEventToESMTriggerFilterConfigItemBase _base_FEventToESMTriggerFilterConfigItemBase;
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForSelf;
    UPROPERTY()
    FGameplayTagContainer WeatherTags;
    UPROPERTY()
    FGameplayTagContainer TimeSegmentTags;

    FEventToESMTriggerFilterConfigItem_PropEcologyEvent()
    {
        super();
        return;
    }
    bool EvaluateAndTrigger(const FECSEntity &inout Entity, bool &out bEcologyInfoReady) const
    {
        int local_82 = 0;
        bool local_96;
        bEcologyInfoReady = false;
        bEcologyInfoReady = true;
        bool local_4 = true;
        for (auto& local_18 : this.ConditionsForSelf)
        {
            local_4 = local_4 && FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_18, Entity);
            if (!(local_4))
            {
                break;
            }
        }
        if (local_4)
        {
            int local_75;
            int local_74;
            int local_73;
            FName local_23 = ::EventToESMTriggerUtils::GetWeatherName(Entity);
            if ((local_23 == NAME_None))
            {
                bEcologyInfoReady = false;
                return false;
            }
            TDataObjectPtr<FWeatherConfig> local_48 = ::FWeatherUtils::GetWeatherConfig(local_23);
            int local_77 = ::FTimeOfDayUtils::GetCurrentTimeOfDayInSeconds();
            ::FTimeOfDayUtils::GetTimeOfDayHourAndMinute(local_77, local_73, local_74, local_75);
            int local_76 = ::FEcologySceneInfoUtils::CombineDayTime(local_74, local_75);
            FECSWorldPtr local_80 = ECS::GetECSWorld();
            FGameplayTagContainer local_94;
            if (local_82)
            {
                if (local_82.DataCache.TimeGameplayTags.Contains(local_76))
                {
                    local_94 = local_82.DataCache.TimeGameplayTags[local_76];
                }
            }
            else
            {
                bEcologyInfoReady = false;
                return false;
            }
            if (this.WeatherTags.Num() != 0)
            {
                if (!(local_48.IsSet()) || !(local_48.opArrow().WeatherElements.HasAll(this.WeatherTags)))
                {
                    local_4 = false;
                }
            }
            if (local_4 && (this.TimeSegmentTags.Num() != 0))
            {
                if (!(local_94.HasAll(this.TimeSegmentTags)))
                {
                    local_4 = false;
                }
            }
        }
        bool local_3_4 = this._base_FEventToESMTriggerFilterConfigItemBase;
        if (local_3_4)
        {
            local_96 = !(local_4);
        }
        else
        {
            local_96 = local_4;
        }
        bool local_4_2 = local_96;
        if (local_4_2)
        {
            if (this.bActivateESMTriggerIfConditionMet)
            {
                if (this.bSuccessClearAllTriggers)
                {
                    FESMTriggerUtils::ClearAllESMTriggers(Entity);
                }
                else
                {
                    for (auto& local_110 : this.SuccessClearTriggerNames)
                    {
                        FESMTriggerUtils::ClearESMTrigger(Entity, local_110.Name);
                    }
                }
                FESMTriggerUtils::ActivateESMTrigger(Entity, this.SuccessTriggerName.Name, ECS::GetContextTime(), FFPTime(this.ValidTime), 0);
            }
        }
        return local_4_2;
    }
}


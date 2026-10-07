
enum EESMTriggerAttributeThresholdMode
{
    Absolute,
    PercentOfAttribute,
}


struct FEventToESMTriggerFilterConfigItem_GameAttributeChanged : FEventToESMTriggerFilterConfigItemBase
{
    FEventToESMTriggerFilterConfigItemBase _base_FEventToESMTriggerFilterConfigItemBase;
    UPROPERTY()
    FGameAttributeRef Attribute = Attribute::HP;
    UPROPERTY()
    EArithmeticKeyOperation ComparisonType = EArithmeticKeyOperation(3);
    UPROPERTY()
    float32 Threshold = 0.0f;
    UPROPERTY()
    EESMTriggerAttributeThresholdMode ThresholdMode = EESMTriggerAttributeThresholdMode(0);
    UPROPERTY()
    FGameAttributeRef ReferenceAttribute = Attribute::HPMax;
    UPROPERTY()
    TArray<FESMBlackboardCondition> ConditionsForSelf;


    bool CompareValues(const float32 Left, const float32 Right) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    bool EvaluateAndTrigger(const FECSEntity &inout Entity, const FC_GameAttribute &inout GameAttribute, const FC_GameAttributeChanged &inout GameAttributeChanged) const
    {
        bool local_48;
        int local_2 = this.Attribute.GetGlobalIndex();
        bool local_3 = false;
        int local_5 = 0;
        for (; local_5 < GameAttributeChanged.GetChangedAttributeNum(); ++local_5)
        {
            if (GameAttribute.GetAttributeRef(GameAttributeChanged.GetChangedAttributeLocalIndex(local_5)).GetGlobalIndex() == local_2)
            {
                local_3 = true;
                break;
            }
        }
        bool local_4 = !(local_3);
        if (local_4)
        {
            return false;
        }
        float32 local_27 = GameAttribute.GetAttributeValue(this.Attribute, ECS::GetContextTime());
        float32 local_28 = this.Threshold;
        if (int(this.ThresholdMode) == 1)
        {
            float32 local_23 = GameAttribute.GetAttributeValue(this.ReferenceAttribute, ECS::GetContextTime());
            if (local_23 <= 0.0f)
            {
                return false;
            }
            local_28 = local_23 * this.Threshold;
        }
        bool local_4_2 = this.CompareValues(local_27, local_28);
        if (local_4_2)
        {
            for (auto& local_46 : this.ConditionsForSelf)
            {
                local_4_2 = local_4_2 && FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_46, Entity);
                if (!(local_4_2))
                {
                    break;
                }
            }
        }
        if (this._base_FEventToESMTriggerFilterConfigItemBase)
        {
            local_48 = !(local_4_2);
        }
        else
        {
            local_48 = local_4_2;
        }
        bool local_4_3 = local_48;
        if (local_4_3)
        {
            if (this.bActivateESMTriggerIfConditionMet)
            {
                if (this.bSuccessClearAllTriggers)
                {
                    FESMTriggerUtils::ClearAllESMTriggers(Entity);
                }
                else
                {
                    for (auto& local_62 : this.SuccessClearTriggerNames)
                    {
                        FESMTriggerUtils::ClearESMTrigger(Entity, local_62.Name);
                    }
                }
                FESMTriggerUtils::ActivateESMTrigger(Entity, this.SuccessTriggerName.Name, ECS::GetContextTime(), FFPTime(this.ValidTime), 0);
            }
        }
        return local_4_3;
    }
}


class UBTTask_EcologyGetCreatureActivityData : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector bIsDefaultBehaviorKey;
    UPROPERTY()
    FBlackboardKeySelector bIsLoopBehavior;
    UPROPERTY()
    FBlackboardKeySelector BehaviorNameKey;
    UPROPERTY()
    FBlackboardKeySelector LoopDurationKey;
    UPROPERTY()
    FBlackboardKeySelector LoopRandKey;
    UPROPERTY()
    FBlackboardKeySelector DyncBehaviorMark;
    UPROPERTY()
    bool ForNoResourceBehavior;

    default SetNodeName("GetCreatureActivityData");

    UBTTask_EcologyGetCreatureActivityData()
    {
        this.ForNoResourceBehavior = false;
        this.bIsDefaultBehaviorKey.SelectedKeyName = n"LIsDefaultBehaviorKey";
        this.bIsDefaultBehaviorKey.AddBoolFilter(this, n"LIsDefaultBehaviorKey");
        this.bIsLoopBehavior.SelectedKeyName = n"LIsMultiSectionBehavior";
        this.bIsLoopBehavior.AddBoolFilter(this, n"LIsMultiSectionBehavior");
        this.BehaviorNameKey.SelectedKeyName = n"LBehaviorName";
        this.BehaviorNameKey.AddNameFilter(this, n"LBehaviorName");
        this.LoopDurationKey.SelectedKeyName = n"LBehaviorLoopDuration";
        this.LoopDurationKey.AddFloatFilter(this, n"LBehaviorLoopDuration");
        this.LoopRandKey.SelectedKeyName = n"LBehaviorLoopRand";
        this.LoopRandKey.AddFloatFilter(this, n"LBehaviorLoopRand");
        this.DyncBehaviorMark.SelectedKeyName = n"LHasDyncBTIdle";
        this.DyncBehaviorMark.AddBoolFilter(this, n"LHasDyncBTIdle");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FC_CreatureEcologyState local_10;
        int local_46 = 0;
        bool local_51;
        float32 local_61;
        float32 local_62;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_10))
        {
            return EBTNodeResult(1);
        }
        FCreatureActivityData local_14 = local_10.ActivityData;
        UBlackboardComponent local_16 = Context.GetBlackboardComponent();
        TObjectPtr<UEcologyBehaviorDefine> local_20;
        if (!(this.ForNoResourceBehavior))
        {
            local_20 = local_10.ActivityData.BehaviorDefine;
            if (!((local_20.Get() != nullptr)))
            {
                return EBTNodeResult(1);
            }
        }
        else
        {
            TArray<TDataObjectPtr<FEcologyActivityDefinitionRow>> local_34;
            FRandomGenerator local_30 = ::FASCommonUtils::CreateRandomGenerator(FECSEntity(local_4), Context.GetWorldTime(), 0);
            if (local_34.Num() <= 0)
            {
                return EBTNodeResult(1);
            }
            int local_38 = local_30.NextRangeInt(0, (local_34.Num() - 1));
            if (!(local_34[local_38]))
            {
                return EBTNodeResult(1);
            }
            local_20 = local_34[local_38].Get().BehaviorDefine;
            if (!((local_20.Get() != nullptr)))
            {
                return EBTNodeResult(1);
            }
            local_46.ActivityData.BehaviorDefine = local_20;
        }
        bool local_11 = local_20.Get().bHasBehaviorTreeAsset;
        if (local_11)
        {
            local_16.SetValueAsBool(this.DyncBehaviorMark.SelectedKeyName, true);
        }
        else
        {
            local_16.SetValueAsBool(this.DyncBehaviorMark.SelectedKeyName, false);
        }
        if (local_20.Get() != nullptr)
        {
            local_51 = local_20.Get().bIsDefaultBehavior;
        }
        else
        {
            local_51 = false;
        }
        local_16.SetValueAsBool(this.bIsDefaultBehaviorKey.SelectedKeyName, local_51);
        if (local_20.Get() != nullptr)
        {
            local_11 = local_20.Get().bIsLoopBehavior;
        }
        else
        {
            local_11 = false;
        }
        local_16.SetValueAsBool(this.bIsLoopBehavior.SelectedKeyName, local_11);
        FName local_58;
        if (local_20.Get() != nullptr)
        {
            local_58 = local_20.Get().LegacyBehaviorName;
        }
        else
        {
            local_58 = NAME_None;
        }
        local_16.SetValueAsName(this.BehaviorNameKey.SelectedKeyName, local_58);
        if (local_20.Get() != nullptr)
        {
            local_61 = local_20.Get().LoopDuration;
        }
        else
        {
            local_61 = 0.0f;
        }
        local_16.SetValueAsFloat(this.LoopDurationKey.SelectedKeyName, local_61);
        if (local_20.Get() != nullptr)
        {
            local_62 = local_20.Get().LoopRand;
        }
        else
        {
            local_62 = 0.0f;
        }
        local_16.SetValueAsFloat(this.LoopRandKey.SelectedKeyName, local_62);
        return EBTNodeResult(0);
    }
}


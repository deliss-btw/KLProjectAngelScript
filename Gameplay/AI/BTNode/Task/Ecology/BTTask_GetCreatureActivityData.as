

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
        UEcologyBehaviorDefine local_22;
        UEcologyBehaviorDefine local_40;
        int local_46 = 0;
        UEcologyBehaviorDefine local_50;
        bool local_51;
        UEcologyBehaviorDefine local_54;
        UEcologyBehaviorDefine local_56;
        UEcologyBehaviorDefine local_60;
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
            if (!((local_22 != nullptr)))
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
            if (!(local_34[local_30.NextRangeInt(0, (local_34.Num() - 1))]))
            {
                return EBTNodeResult(1);
            }
            if (!((local_40 != nullptr)))
            {
                return EBTNodeResult(1);
            }
            local_46.ActivityData.BehaviorDefine = local_20;
        }
        UEcologyBehaviorDefine local_48;
        bool local_11 = local_48.bHasBehaviorTreeAsset;
        if (local_11)
        {
            local_16.SetValueAsBool(this.DyncBehaviorMark.SelectedKeyName, true);
        }
        else
        {
            local_16.SetValueAsBool(this.DyncBehaviorMark.SelectedKeyName, false);
        }
        if (local_48 != nullptr)
        {
            local_51 = local_50.bIsDefaultBehavior;
        }
        else
        {
            local_51 = false;
        }
        local_16.SetValueAsBool(this.bIsDefaultBehaviorKey.SelectedKeyName, local_51);
        if (local_50 != nullptr)
        {
            local_11 = local_54.bIsLoopBehavior;
        }
        else
        {
            local_11 = false;
        }
        local_16.SetValueAsBool(this.bIsLoopBehavior.SelectedKeyName, local_11);
        FName local_58;
        if (local_54 != nullptr)
        {
            local_58 = local_56.LegacyBehaviorName;
        }
        else
        {
            local_58 = NAME_None;
        }
        local_16.SetValueAsName(this.BehaviorNameKey.SelectedKeyName, local_58);
        if (local_56 != nullptr)
        {
            local_61 = local_60.LoopDuration;
        }
        else
        {
            local_61 = 0.0f;
        }
        local_16.SetValueAsFloat(this.LoopDurationKey.SelectedKeyName, local_61);
        if (local_60 != nullptr)
        {
            UEcologyBehaviorDefine local_64;
            local_62 = local_64.LoopRand;
        }
        else
        {
            local_62 = 0.0f;
        }
        local_16.SetValueAsFloat(this.LoopRandKey.SelectedKeyName, local_62);
        return EBTNodeResult(0);
    }
}


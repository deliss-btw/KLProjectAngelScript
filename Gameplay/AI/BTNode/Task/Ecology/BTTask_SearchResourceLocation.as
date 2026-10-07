

class UBTTask_SearchResourceLocation : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector OutputLocation;
    UPROPERTY()
    FResourceRequestFilterConfig ResourceRequest;

    default SetNodeName("Demo_SearchResourceLocation_DoNotUse");

    UBTTask_SearchResourceLocation()
    {
        this.OutputLocation.SelectedKeyName = n"ResourceLocation";
        this.OutputLocation.AddVectorFilter(this, n"ResourceLocation");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_132 = 0;
        int local_156 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        FResourceSearchRequest local_94;
        this.ResourceRequest.MakeRequest(local_4, local_94);
        TArray<FEntitySearchResult> local_98 = ::FEcologySceneInfoUtils::RequestResource(local_94);
        if (local_98.Num() <= 0)
        {
            return EBTNodeResult(1);
        }
        FECSEntity local_110;
        float local_112 = 1.7976931348623157e308;
        FVector local_120(FVector::ZeroVector);
        FVector local_126(FVector::ZeroVector);
        if (!(local_132))
        {
            return EBTNodeResult(1);
        }
        local_120 = local_132.GetPosition();
        for (auto& local_146 : local_98)
        {
            FECSEntity local_154 = FECSEntity(local_146.EntityId);
            if (!(local_154.IsValid()))
            {
                continue;
            }
            if (!(local_156))
            {
                continue;
            }
            float local_114 = local_120.DistSquared2D(local_156.GetPosition());
            if (local_114 < local_112)
            {
                local_112 = local_114;
                local_110 = local_154;
                local_126 = local_156.GetPosition();
            }
        }
        if (!(local_110.IsValid()))
        {
            return EBTNodeResult(1);
        }
        UBlackboardComponent local_160 = Context.GetBlackboardComponent();
        local_160.SetValueAsVector(this.OutputLocation.SelectedKeyName, local_126);
        return EBTNodeResult(0);
    }
}


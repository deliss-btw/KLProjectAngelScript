

class UBTDecorator_HasScenePointInRange : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    float32 SearchRadius = 8000.0f;
    UPROPERTY()
    int MaxResultCount = 1;
    UPROPERTY()
    TArray<TDataObjectPtr<FEcologyResourceDefinitionRow>> IncludeResourceTypes;
    UPROPERTY()
    bool bFilterByCreatureType = false;
    UPROPERTY()
    TDataObjectPtr<FEcologyCreatureDefinitionRow> CreatureRow;
    UPROPERTY()
    bool bCheckSpaceCost = false;
    UPROPERTY()
    bool bIncludeClaimed = true;
    UPROPERTY()
    FKLGameplayTagQuery TagFilter;

    default SetNodeName("е‘Ёе›ґжЇеђ¦жњ‰жЊ‡е®љиµ„жєђз‚№");
    default SetbAllowAbortLowerPri(true);
    default SetbAllowAbortChildNodes(true);


    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_12 = 0;
        int local_150 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            return false;
        }
        if (!(local_12))
        {
            return false;
        }
        FResourceSearchRequest local_102;
        local_102.Requester = local_4.GetId();
        local_102.Center = local_12.GetPosition();
        local_102.SearchRadius = uint(int(this.SearchRadius));
        local_102.MaxResultCount = this.MaxResultCount;
        local_102.bCheckSpaceCost = this.bCheckSpaceCost;
        local_102.bIncludeClaimed = this.bIncludeClaimed;
        local_102.TagFilter = this.TagFilter;
        for (auto& local_120 : this.IncludeResourceTypes)
        {
            if (local_120)
            {
                local_102.IncludeResourceTypes.Add(local_120);
            }
        }
        local_102.bFilterByCreatureType = this.bFilterByCreatureType;
        bool local_5 = this.bFilterByCreatureType;
        if (!(local_5))
        {
            local_5 = false;
        }
        else
        {
            local_5 = this.CreatureRow;
        }
        if (local_5)
        {
            local_102.CreatureRow = this.CreatureRow;
            FECSWorldPtr local_148 = local_4.GetWorld();
            if (local_150)
            {
                local_102.WeatherName = ::FEcologySceneInfoUtils::GetWeatherByPosition(local_150, local_12.GetPosition());
                local_102.TimeSegments = ::FEcologySceneInfoUtils::GetCurrentTimeSegments(local_150);
            }
        }
        TArray<FEntitySearchResult> local_160 = ::FEcologySceneInfoUtils::RequestResource(local_102);
        return (local_160.Num() > 0);
    }
}




class UEQG_ScenePoints : UEnvQueryGenerator_ECS_BlueprintBase
{
    UPROPERTY()
    float32 SearchDistance = 10000.0f;
    UPROPERTY()
    int MaxResultCount = 50;
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

    default GeneratedItemType = UEnvQueryItemType_Point;


    UFUNCTION()
    void DoItemGenerationFromEntities_Implementation(const TArray<FECSEntityId> &inout ContextEntities) const
    {
        int local_30 = 0;
        int local_166 = 0;
        int local_196 = 0;
        for (auto& local_16 : ContextEntities)
        {
            FECSEntity local_24 = FECSEntity(local_16);
            if (!(local_24.IsValid()))
            {
                continue;
            }
            if (!(local_30))
            {
                continue;
            }
            FResourceSearchRequest local_120;
            local_120.Requester = local_16;
            local_120.Center = local_30.GetPosition();
            local_120.SearchRadius = uint(int(this.SearchDistance));
            local_120.MaxResultCount = this.MaxResultCount;
            local_120.bCheckSpaceCost = this.bCheckSpaceCost;
            local_120.bIncludeClaimed = this.bIncludeClaimed;
            local_120.TagFilter = this.TagFilter;
            for (auto& local_136 : this.IncludeResourceTypes)
            {
                if (local_136)
                {
                    local_120.IncludeResourceTypes.Add(local_136);
                }
            }
            local_120.bFilterByCreatureType = this.bFilterByCreatureType;
            bool local_13 = this.bFilterByCreatureType;
            if (!(local_13))
            {
                local_13 = false;
            }
            else
            {
                local_13 = this.CreatureRow;
            }
            if (local_13)
            {
                local_120.CreatureRow = this.CreatureRow;
                FECSWorldPtr local_164 = local_24.GetWorld();
                if (local_166)
                {
                    local_120.WeatherName = ::FEcologySceneInfoUtils::GetWeatherByPosition(local_166, local_30.GetPosition());
                    local_120.TimeSegments = ::FEcologySceneInfoUtils::GetCurrentTimeSegments(local_166);
                }
            }
            TArray<FEntitySearchResult> local_176 = ::FEcologySceneInfoUtils::RequestResource(local_120);
            for (auto& local_190 : local_176)
            {
                if (!(FECSEntity(local_190.EntityId).IsValid()))
                {
                    continue;
                }
                if (local_196)
                {
                    this.AddGeneratedVector(local_196.GetPosition());
                }
            }
        }
        return;
    }
}


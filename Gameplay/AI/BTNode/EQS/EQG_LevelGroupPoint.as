

class UEQG_LevelGroupPoint : UEnvQueryGenerator_ECS_BlueprintBase
{
    UPROPERTY()
    float32 SearchDistance = 10000.0f;
    UPROPERTY()
    int MaxResultCount = 0;
    UPROPERTY()
    FConfigGUID OwnerGroup;
    UPROPERTY()
    FKLGameplayTagQuery DomainTagQuery;

    default GeneratedItemType = UEnvQueryItemType_Point;


    UFUNCTION()
    void DoItemGenerationFromEntities_Implementation(const TArray<FECSEntityId> &inout ContextEntities) const
    {
        int local_30 = 0;
        int local_34 = 0;
        int local_138 = 0;
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
            FECSWorldPtr local_32 = local_24.GetWorld();
            FEcologyPointQuery local_68;
            local_68.Bounds.SphereRadius = this.SearchDistance;
            local_68.OwnerGroup = this.OwnerGroup;
            local_68.DomainTagQuery = this.DomainTagQuery;
            FEcologyPointQueryResult local_92 = ::FEcologyPointUtils::QueryPoints(local_30.GetPosition(), local_34, local_68);
            int local_113 = 0;
            for (auto& local_132 : local_92.ActivatePoint)
            {
                if (!(FECSEntity(local_132).IsValid()))
                {
                    continue;
                }
                if (!(local_138))
                {
                    continue;
                }
                this.AddGeneratedVector(local_138.GetPosition());
                if (this.MaxResultCount > 0)
                {
                    local_113 = local_113 + 1;
                    if (local_113 >= this.MaxResultCount)
                    {
                        break;
                    }
                }
            }
        }
        return;
    }
}


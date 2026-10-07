

class UEQG_EntityOfClass : UEnvQueryGenerator_ECS_BlueprintBase
{
    UPROPERTY()
    float32 SearchDistance = 10000.0f;
    UPROPERTY()
    FECSQueryParam Param;

    default GeneratedItemType = UEnvQueryItemType_ECSEntity;


    UFUNCTION()
    void DoItemGenerationFromEntities_Implementation(const TArray<FECSEntityId> &inout ContextEntities) const
    {
        for (auto& local_16 : ContextEntities)
        {
            FECSEntity local_24 = FECSEntity(local_16);
            Get local_28;
            FECSRuntimeQuery local_72 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(local_24, local_28.opCall().GetPosition(), this.SearchDistance, EECSQueryRegsitryType(3), false);
            ::ECSQueryUtils::AddQueryFilterByParams(local_72, local_24, this.Param);
            Include local_116;
            local_116.opCall();
            Include local_120;
            local_120.opCall();
            FECSRuntimeQueryIterator local_142 = local_72.Iterator();
            for (; local_142.CanProceed;)
            {
                const FECSEntity& local_166 = local_142.Proceed();
                this.AddGeneratedEntity(local_166.GetId());
            }
        }
        return;
    }
}




class UEQG_FindReachableAndCloseToTargetPoint : UEnvQueryGenerator_ECS_BlueprintBase
{
    UPROPERTY()
    float32 SampleInterval = 200.0f;
    UPROPERTY()
    int MaxSampleCount = 12;
    UPROPERTY()
    float32 MaxHeightDifference = 300.0f;
    UPROPERTY()
    float32 ProjectionVerticalExtent = 300.0f;
    UPROPERTY()
    bool bDebugDraw = false;
    UPROPERTY()
    float32 DebugDrawDuration = 5.0f;

    default GeneratedItemType = UEnvQueryItemType_Point;
    default Context = UEQC_Self;


    UFUNCTION()
    void DoItemGenerationFromEntities_Implementation(const TArray<FECSEntityId> &inout ContextEntities) const
    {
        int local_46 = 0;
        int local_60 = 0;
        float32 local_4 = FMath::Max(this.SampleInterval, 1.0f);
        int local_8 = FMath::Max(this.MaxSampleCount, 1);
        FVector local_20 = FVector(this.ProjectionVerticalExtent, this.ProjectionVerticalExtent, this.ProjectionVerticalExtent);
        FECSEntity local_34 = this.GetQuerierEntity();
        FECSEntity local_30 = FECSEntity(::FAIKnowledgeUtils::GetAIBlackboardValueEntityId(local_34, n"SelfEntity"));
        if (!(local_30.IsValid()))
        {
            local_30 = local_34;
        }
        if (!(local_30.IsValid()))
        {
            return;
        }
        if (!(local_46))
        {
            return;
        }
        FVector local_52 = local_46.GetPosition();
        if (!(FECSEntity(::FAIKnowledgeUtils::GetAIBlackboardValueEntityId(local_30, n"TargetEntityID")).IsValid()))
        {
            this.AddGeneratedVector(local_52);
            return;
        }
        if (!(local_60))
        {
            this.AddGeneratedVector(local_52);
            return;
        }
        FVector local_66 = local_60.GetPosition();
        FVector local_14 = (local_66 - local_52);
        float local_22 = local_14.Size();
        float32 local_3 = float32(local_22);
        if (local_3 < 1.0f)
        {
            this.AddGeneratedVector(local_52);
            return;
        }
        FVector local_72 = (local_14 / local_3);
        bool local_81 = false;
        int local_82 = 0;
        for (; (int(local_82) < int(local_8)) && (!(local_81)); ++local_82)
        {
            float32 local_2 = local_82 * local_4;
            if (local_2 >= local_3)
            {
                break;
            }
            FVector local_96 = (local_66 - (local_72 * local_2));
            if (!(FAIPathFollowUtils::IsPointOnNavigation(local_30, local_96, local_20)))
            {
                if (this.bDebugDraw)
                {
                    FECSDebugDraw::DrawDebugSphere(n"PathFindingDebugDraw", local_96, 30.0f, 8, FColor::Red, FColor::Red, this.DebugDrawDuration, uint8(0), 3.0f);
                }
                continue;
            }
            FVector local_90 = FAIPathFollowUtils::ProjectPointToNavigation(local_30, local_96, local_20);
            if (FMath::Abs((float32(local_90.Z) - float32(local_96.Z))) > this.MaxHeightDifference)
            {
                if (this.bDebugDraw)
                {
                    FECSDebugDraw::DrawDebugSphere(n"PathFindingDebugDraw", local_90, 30.0f, 8, FColor::Yellow, FColor::Yellow, this.DebugDrawDuration, uint8(0), 3.0f);
                }
                continue;
            }
            if (FAIPathSessionUtils::IsPathConnectedForEntity(local_30, local_52, local_90))
            {
                if (this.bDebugDraw)
                {
                    FECSDebugDraw::DrawDebugSphere(n"PathFindingDebugDraw", local_90, 60.0f, 12, FColor::Green, FColor::Green, this.DebugDrawDuration, uint8(0), 5.0f);
                }
                this.AddGeneratedVector(local_90);
                local_81 = true;
                continue;
            }
            if (this.bDebugDraw)
            {
                FECSDebugDraw::DrawDebugSphere(n"PathFindingDebugDraw", local_90, 30.0f, 8, FColor(uint8(128), uint8(128), uint8(128), uint8(255)), FColor(uint8(128), uint8(128), uint8(128), uint8(255)), this.DebugDrawDuration, uint8(0), 3.0f);
            }
        }
        if (!(local_81))
        {
            this.AddGeneratedVector(local_52);
        }
        return;
    }
}


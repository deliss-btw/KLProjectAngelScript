

class APatrolTargetPoint : ATargetPoint
{
    UPROPERTY()
    TArray<FPatrolTargetPointData> NextPatrolPointList;
    UPROPERTY()
    float32 StayTimeInCurrentPoint = 0.0f;


    UFUNCTION()
    void ConstructionScript_Implementation()
    {
        return;
    }
    UFUNCTION()
    APatrolTargetPoint GetNextPatrolPoint() const
    {
        APatrolTargetPoint local_6;
        if (this.NextPatrolPointList.Num() == 0)
        {
            return nullptr;
        }
        float32 local_8 = FMath::FRand();
        float32 local_9 = 0.0f;
        for (auto& local_24 : this.NextPatrolPointList)
        {
            local_9 = local_9 + local_24.Probability;
            if (local_8 <= local_9)
            {
                return local_6;
            }
        }
        return local_6;
    }
}


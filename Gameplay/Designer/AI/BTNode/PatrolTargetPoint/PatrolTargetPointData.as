struct FPatrolTargetPointData
{
    UPROPERTY()
    TSoftObjectPtr<APatrolTargetPoint> TargetPoint;
    UPROPERTY()
    int Weight = 1;
    UPROPERTY()
    float32 Probability = 1.0f;

}

struct FPatrolTargetPointConfig
{
    UPROPERTY()
    bool bUsePatrolTargetPoint = true;
    UPROPERTY()
    bool bRandomSpawnPoint = false;
    UPROPERTY()
    TArray<TSoftObjectPtr<APatrolTargetPoint>> PatrolTargetPoints;
    UPROPERTY()
    TArray<TSoftObjectPtr<ATargetPoint>> PlainTargetPoints;

    ATargetPoint PickSpawnPoint() const
    {
        int local_2;
        int local_9;
        if (this.bUsePatrolTargetPoint)
        {
            if (this.PatrolTargetPoints.Num() == 0)
            {
                return nullptr;
            }
            else
            {
                if (this.bRandomSpawnPoint)
                {
                    local_9 = FMath::RandRange(0, (this.PatrolTargetPoints.Num() - 1));
                }
                else
                {
                    local_9 = 0;
                }
                return this.PatrolTargetPoints[local_9].Get();
            }
        }
        else
        {
            if (this.PlainTargetPoints.Num() == 0)
            {
                return nullptr;
            }
            else
            {
                if (this.bRandomSpawnPoint)
                {
                    local_2 = FMath::RandRange(0, (this.PlainTargetPoints.Num() - 1));
                }
                else
                {
                    local_2 = 0;
                }
                return this.PlainTargetPoints[local_2].Get();
            }
        }
    }
    ATargetPoint GetNextPoint(int &inout CurrentIndex)
    {
        if (this.bUsePatrolTargetPoint)
        {
            if (this.PatrolTargetPoints.Num() == 0)
            {
                return nullptr;
            }
            else
            {
                if (CurrentIndex < 0 || (CurrentIndex >= this.PatrolTargetPoints.Num()))
                {
                    CurrentIndex = 0;
                }
                APatrolTargetPoint local_10 = this.PatrolTargetPoints[CurrentIndex].Get();
                if (local_10 == nullptr)
                {
                    return nullptr;
                }
                else
                {
                    APatrolTargetPoint local_14 = local_10.GetNextPatrolPoint();
                    if (local_14 == nullptr)
                    {
                        return nullptr;
                    }
                    else
                    {
                        bool local_15;
                        local_15 = false;
                        int local_16 = 0;
                        for (; local_16 < this.PatrolTargetPoints.Num(); ++local_16)
                        {
                            if (this.PatrolTargetPoints[local_16].Get() == local_14)
                            {
                                CurrentIndex = local_16;
                                local_15 = true;
                                break;
                            }
                        }
                        if (!(local_15))
                        {
                            this.PatrolTargetPoints.Add(TSoftObjectPtr<APatrolTargetPoint>(local_14));
                            CurrentIndex = (this.PatrolTargetPoints.Num() - 1);
                        }
                        return local_14;
                    }
                }
            }
        }
        else
        {
            if (this.PlainTargetPoints.Num() == 0)
            {
                return nullptr;
            }
            else
            {
                if (CurrentIndex < 0 || (CurrentIndex >= this.PlainTargetPoints.Num()))
                {
                    CurrentIndex = 0;
                }
                CurrentIndex = ((CurrentIndex + 1) % this.PlainTargetPoints.Num());
                return this.PlainTargetPoints[CurrentIndex].Get();
            }
        }
    }
}




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
                    int local_8 = FMath::RandRange(0, (this.PatrolTargetPoints.Num() - 1));
                }
                else
                {
                }
                APatrolTargetPoint local_12;
                return local_12;
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
                ATargetPoint local_6;
                return local_6;
            }
        }
    }
    ATargetPoint GetNextPoint(int &inout CurrentIndex)
    {
        APatrolTargetPoint local_10;
        APatrolTargetPoint local_12;
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
                int local_2 = CurrentIndex;
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
                            if (local_12 == local_14)
                            {
                                CurrentIndex = local_16;
                                local_15 = true;
                                break;
                            }
                        }
                        if (!(local_15))
                        {
                            this.PatrolTargetPoints.Add(TSoftObjectPtr<APatrolTargetPoint>(local_14));
                            local_2 = this.PatrolTargetPoints.Num();
                            local_2 = local_2 - 1;
                            CurrentIndex = local_2;
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
                int local_3 = CurrentIndex;
                ATargetPoint local_6;
                return local_6;
            }
        }
    }
}


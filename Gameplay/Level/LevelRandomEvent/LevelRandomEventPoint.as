

UCLASS(Abstract)
class ALevelRandomEventPoint : ALevelRandomEventPointBase
{
    UPROPERTY()
    TArray<TSoftClassPtr<AKLLevelScriptAreaTargetEvent>> RandomEventLBPClasses;

    ALevelRandomEventPoint()
    {
        return;
    }
    UFUNCTION()
    void GenerateRandomEventLBPClass_Implementation()
    {
        return;
    }
    UFUNCTION()
    void BeginPlay_Implementation()
    {
        AAS_ECSWorldSettings local_8;
        if ((int(this.GetWorld().GetNetMode())) != 3)
        {
            local_8 = (Cast<AAS_ECSWorldSettings>(this.GetWorld().GetWorldSettings()));
            if (local_8 != nullptr)
            {
                local_8.RandomEventPoints.Add(this);
            }
        }
        return;
    }
    UFUNCTION()
    void DrawVisualisationOnSelected_Implementation() const
    {
        return;
    }
}


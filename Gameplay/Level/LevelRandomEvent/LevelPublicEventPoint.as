

UCLASS(Abstract)
class ALevelPublicEventPoint : ALevelRandomEventPointBase
{
    UPROPERTY()
    TArray<TSoftClassPtr<AKLLevelScriptPublicEvent>> PublicEventLBPClasses;

    ALevelPublicEventPoint()
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
                local_8.PublicEventPoints.Add(this);
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


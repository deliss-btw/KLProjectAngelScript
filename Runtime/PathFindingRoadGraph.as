

class AKLRoad : AActor
{
    UPROPERTY()
    UKLRoadSpline Path;

    AKLRoad()
    {
        return;
    }
    UFUNCTION()
    void ConstructionScript_Implementation()
    {
        this.Path.SetUnselectedSplineSegmentColor(FLinearColor(FColor::Yellow));
        return;
    }
}

struct FKLConjunctionEntry
{
    UPROPERTY()
    AKLRoad RoadActor;
    UPROPERTY()
    FVector CurvePoint = FVector::ZeroVector;
    UPROPERTY()
    int PointIndex = -1;
    UPROPERTY()
    FVector Direction = FVector::ZeroVector;


}

class UKLGraphRoadConnectionInfo : UAssetUserData
{
    UPROPERTY()
    int EntryA = -1;
    UPROPERTY()
    int EntryB = -1;


}

class AKLRoadConjunction : AKLNoCollisionVolume
{
    AKLRoadConjunction()
    {
        return;
    }
}


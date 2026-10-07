

class AEcosimAIRegionVolume : AECSRegionVolumeBase
{
    UPROPERTY()
    UBillboardComponent BillboardComponent;
    TArray<FECSEntity> ContainedMarkEntities;
    bool bIsAreaMarked = false;
    FString AreaCustomName;


    UFUNCTION()
    void ConstructionScript_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnEntityBeginOverlap_Implementation(const FECSContext &inout Context, const FECSEntity &inout Entity)
    {
        return;
    }
    UFUNCTION()
    void OnEntityEndOverlap_Implementation(const FECSContext &inout Context, const FECSEntity &inout Entity)
    {
        return;
    }
    UFUNCTION()
    FString GetAreaName()
    {
        return this.AreaCustomName;
    }
}


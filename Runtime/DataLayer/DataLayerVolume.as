

struct FKLDataLayerAction
{
    UPROPERTY()
    UDataLayerAsset DataLayer;
    UPROPERTY()
    EDataLayerRuntimeState State;


}

struct FKLLoadingRangeOverride
{
    UPROPERTY()
    FName GridName;
    UPROPERTY()
    float32 MinLoadingRange = 1600.0f;
    UPROPERTY()
    float32 TransitionAreaRange = 50.0f;


}

class AKLAggregatedVolume : AKLAggregatedVolumeBase
{
    UPROPERTY()
    TArray<FKLDataLayerAction> OnEnterDataLayerActions;
    UPROPERTY()
    TArray<FKLDataLayerAction> OnLeaveDataLayerActions;

    AKLAggregatedVolume()
    {
        return;
    }
    UFUNCTION()
    void OnEnter_Implementation()
    {
        for (auto& local_16 : this.OnEnterDataLayerActions)
        {
            this.GetWorld().SetDataLayerState(local_16.DataLayer, local_16.State);
        }
        return;
    }
    UFUNCTION()
    void OnLeave_Implementation()
    {
        for (auto& local_16 : this.OnLeaveDataLayerActions)
        {
            this.GetWorld().SetDataLayerState(local_16.DataLayer, local_16.State);
        }
        return;
    }
}


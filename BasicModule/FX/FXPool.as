class UFXPoolMeta : UECSEntityPoolMeta
{
    UFXPoolMeta()
    {
        return;
    }
    UFUNCTION()
    void Init_Implementation()
    {
        this.AddManagedComponent(FC_FXSyncInfoDurational);
        this.AddManagedComponent(FC_SyncFXStop);
        this.AddManagedComponent(FC_FXBakedParamData);
        this.AddManagedComponent(FC_FXSyncParams);
        this.AddManagedComponent(FC_FXAnimCurve);
        this.AddManagedComponent(FC_InterpoTime);
        this.AddManagedComponent(FC_SyncFXBeamEndParam);
        this.AddManagedComponent(FC_FXInitTickTransform);
        this.AddManagedComponent(FC_SyncFXCustomEvent);
        return;
    }
}


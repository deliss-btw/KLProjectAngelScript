

// NOTE: class defaults are not authored in this module: UFXPoolMeta (default scalar field UECSEntityPoolMeta.InitSize has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

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


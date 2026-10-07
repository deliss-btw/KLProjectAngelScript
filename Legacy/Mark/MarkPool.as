

// NOTE: class defaults are not authored in this module: UMarkPoolMeta (default scalar field UECSEntityPoolMeta.InitSize has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UMarkPoolMeta : UECSEntityPoolMeta
{
    UMarkPoolMeta()
    {
        return;
    }
    UFUNCTION()
    void Init_Implementation()
    {
        this.AddManagedTrait(FT_Mark);
        this.AddManagedComponent(FC_Transform);
        this.AddManagedComponent(FC_NetRelevancePolicy);
        this.AddManagedComponent(FC_Mark_RemoveWhenCreaterApproachDistanceTag);
        this.AddManagedComponent(FC_Mark_RemoveWhenNoLongerGuidingTargetTag);
        this.AddManagedComponent(FC_AttachmentParent);
        this.AddManagedComponent(FC_TransformAttachmentLogic);
        this.AddManagedComponent(FC_SyncTransformAttachmentPresentation);
        this.AddManagedComponent(FC_LevelSpot);
        return;
    }
}


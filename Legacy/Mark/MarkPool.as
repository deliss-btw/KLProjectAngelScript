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


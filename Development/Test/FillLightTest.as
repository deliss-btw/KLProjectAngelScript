

class UFillLightTestComponent : UActorComponent
{
    AActor CachedParentActor;

    UFillLightTestComponent()
    {
        this.SetbTickInEditor(true);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const float32 DeltaTime)
    {
        AActor local_2 = this.GetOwner();
        if (local_2 == nullptr)
        {
            return;
        }
        AActor local_8 = local_2.GetAttachParentActor();
        if (local_8 == this.CachedParentActor)
        {
            return;
        }
        this.CachedParentActor = local_8;
        if (local_8 != nullptr)
        {
            this.ApplyParentRenderId(local_2, local_8);
            return;
        }
        this.RestoreOwnRenderId(local_2);
        return;
    }
    void ApplyParentRenderId(const AActor OwnerActor, const AActor ParentActor)
    {
        this.OverrideMeshComponentsRenderId(OwnerActor, int(ParentActor.CharacterRenderId));
        this.SetOwnFillLightsVisibility(OwnerActor, false);
        return;
    }
    void RestoreOwnRenderId(const AActor OwnerActor)
    {
        this.OverrideMeshComponentsRenderId(OwnerActor, -1);
        this.SetOwnFillLightsVisibility(OwnerActor, true);
        return;
    }
    void OverrideMeshComponentsRenderId(const AActor OwnerActor, const int RenderId)
    {
        TArray<UMeshComponent> local_8 = OwnerActor.GetComponentsByClass(UMeshComponent);
        for (auto local_24 : local_8)
        {
            local_24.SetCharacterRenderIdOverride(RenderId);
        }
        return;
    }
    void SetOwnFillLightsVisibility(const AActor OwnerActor, const bool bVisible)
    {
        TArray<UFillLightComponent> local_8 = OwnerActor.GetComponentsByClass(UFillLightComponent);
        for (auto local_24 : local_8)
        {
            local_24.SetVisibility(bVisible, false);
        }
        return;
    }
}


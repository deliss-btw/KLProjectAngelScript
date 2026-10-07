

// NOTE: class defaults are not authored in this module: AInteractiveField (default scalar field UMiFoliageInteractDomainComponent.DomainHeight has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class AInteractiveField : AKLEditorTickableActor
{
    UPROPERTY()
    USceneComponent DefaultSceneRoot;
    UPROPERTY()
    UMiLocalWindFieldComponent MiWindField;
    UPROPERTY()
    UMiFoliageInteractDomainComponent MiFoliageInteractDomain;
    UPROPERTY()
    UAquaRuntimeSimComponent AquaRuntimeSim;
    UPROPERTY()
    URainOccluderRenderDomainComponent RainOccluderRenderDomain;
    UPROPERTY()
    bool bNeedRefresh = true;


    UFUNCTION()
    void ConstructionScript_Implementation()
    {
        return;
    }
    UFUNCTION()
    void EditorPostEditChange_Implementation()
    {
        this.bNeedRefresh = true;
        return;
    }
    UFUNCTION()
    void EditorTick_Implementation(const float32 DeltaTime)
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const float32 DeltaTime)
    {
        if (!(System::IsServer(__GetWorldContext())))
        {
            if (ECS::GetECSWorld().IsValid())
            {
                if (::FASCommonUtils::GetLocalPlayerPawnEntity().IsValid())
                {
                    GetDefaulted local_26;
                    this.SetActorLocation(FVector(local_26.opCall().GetPosition()));
                }
            }
        }
        return;
    }
}


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


class AFacturePrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_InteractTrait Interact;

    AFacturePrefab()
    {
        this.bStatic = true;
        this.bHasActor = true;
        this.bHasTransform = true;
        return;
    }
}


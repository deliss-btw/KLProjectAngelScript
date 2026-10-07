

class AKLHeightFieldActor : AActor
{
    UPROPERTY()
    UKLHeightFieldComponent Root;

    AKLHeightFieldActor()
    {
        return;
    }
}

class AKLHeightFieldTracer : AKLEditorTickableActor
{
    UPROPERTY()
    UBillboardComponent Billboard;
    UPROPERTY()
    bool bTraceComplex = true;


}

class AKLHeightMapVisibleProbe : AKLEditorTickableActor
{
    UPROPERTY()
    UBillboardComponent Billboard;
    UPROPERTY()
    int FloorIndex = 0;


    UFUNCTION()
    void ConstructionScript_Implementation()
    {
        UTexture2D local_2 = (Cast<UTexture2D>(LoadObject(nullptr, "/Engine/EditorResources/S_ReflActorIcon.S_ReflActorIcon")));
        this.Billboard.SetSprite(local_2);
        return;
    }
}


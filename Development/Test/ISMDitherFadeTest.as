

class AISMDitherFadeTestActor : AKLEditorTickableActor
{
    UPROPERTY()
    USceneComponent Root;
    UPROPERTY()
    UInstancedStaticMeshComponent MainISM;
    UPROPERTY()
    UInstancedStaticMeshComponent DitherFadeISM;
    UPROPERTY()
    int GridSize = 5;
    UPROPERTY()
    float32 GridSpacing = 3000.0f;
    UPROPERTY()
    float32 FadeDuration = 2.0f;
    TArray<int> DestroyedIndices;
    TMap<int, FTransform> SavedTransforms;
    bool bFadeInProgress = false;
    float32 FadeElapsedTime = 0.0f;


    UFUNCTION()
    void ConstructionScript_Implementation()
    {
        UStaticMesh local_6 = (Cast<UStaticMesh>(LoadObject(nullptr, "/Script/Engine.StaticMesh'/Game/OriginalRes/Dev/Stages/Area/Xb/Common/Tree/Mesh/SM_Area_Xb_Common_Tree_By_A_01.SM_Area_Xb_Common_Tree_By_A_01'")));
        this.MainISM.SetStaticMesh(local_6);
        this.DitherFadeISM.SetStaticMesh(local_6);
        this.MainISM.SetbCanEverAffectNavigation(false);
        this.DitherFadeISM.SetbCanEverAffectNavigation(false);
        this.MainISM.ClearInstances();
        int local_8 = 0;
        for (; local_8 < this.GridSize; ++local_8)
        {
            int local_11 = 0;
            for (; local_11 < this.GridSize; )
            {
                FTransform local_36;
                float32 local_38 = this.GridSpacing * 0.4f;
                float32 local_37 = local_8;
                local_37 = local_37 * this.GridSpacing;
                float local_52 = (local_37 + FMath::RandRange(-local_38, local_38));
                local_37 = local_11;
                local_37 = local_37 * this.GridSpacing;
                local_36.SetLocation(FVector((local_37 + FMath::RandRange(-local_38, local_38)), local_52, 0.0));
                local_36.SetRotation(FQuat(FRotator(0.0, FMath::RandRange(0.0f, 360.0f), 0.0)));
                this.MainISM.AddInstance(local_36, false);
                ++local_11;
            }
        }
        return;
    }
    UFUNCTION()
    void EditorTick_Implementation(const float32 DeltaTime)
    {
        if (this.bFadeInProgress)
        {
            this.FadeElapsedTime += DeltaTime;
            if (this.FadeElapsedTime >= this.FadeDuration)
            {
                this.bFadeInProgress = false;
                this.OnFadeComplete();
            }
        }
        return;
    }
    UFUNCTION()
    void DestroyRandomInstance()
    {
        int local_4 = 0;
        int local_2 = this.MainISM.GetInstanceCount();
        if (this.DestroyedIndices.Num() >= local_2)
        {
            return;
        }
        while (this.DestroyedIndices.Contains(0))
        {
            local_4 = FMath::RandRange(0, local_2 - 1);
        }
        FTransform local_32;
        this.MainISM.GetInstanceTransform(local_4, local_32, false);
        this.SavedTransforms.Add(local_4, local_32);
        local_32.SetScale3D(FVector::ZeroVector);
        this.MainISM.UpdateInstanceTransform(local_4, local_32, false, false, false);
        this.DestroyedIndices.Add(local_4);
        return;
    }
    UFUNCTION()
    void RespawnWithDitherFade()
    {
        if (this.DestroyedIndices.Num() == 0)
        {
            return;
        }
        this.DitherFadeISM.ClearInstances();
        for (auto local_17 : this.DestroyedIndices)
        {
            this.DitherFadeISM.AddInstance(this.SavedTransforms[local_17], false);
        }
        this.DitherFadeISM.StartTimedDitherFadeIn(this.FadeDuration);
        this.bFadeInProgress = true;
        this.FadeElapsedTime = 0.0f;
        return;
    }
    void OnFadeComplete()
    {
        for (auto local_14 : this.DestroyedIndices)
        {
            this.MainISM.UpdateInstanceTransform(local_14, this.SavedTransforms[local_14], false, false, false);
        }
        this.DitherFadeISM.ClearInstances();
        this.DestroyedIndices.Empty(0);
        this.SavedTransforms.Empty(0);
        return;
    }
}


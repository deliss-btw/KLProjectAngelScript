

class ALandscapeDecal : AActor
{
    UPROPERTY()
    UStaticMesh DefaultMesh;
    UPROPERTY()
    TArray<TObjectPtr<URuntimeVirtualTexture>> RVTextures;
    UPROPERTY()
    UStaticMeshComponent MeshComp;
    UPROPERTY()
    UMaterialInstanceConstant Material;

    ALandscapeDecal()
    {
        return;
    }
    UFUNCTION()
    void ConstructionScript_Implementation()
    {
        if (this.Material == nullptr)
        {
            this.Material = Cast<UMaterialInstanceConstant>(LoadObject(nullptr, "/Script/Engine.MaterialInstanceConstant'/Game/Shader/Scene/MI_TerrainDecalBase.MI_TerrainDecalBase'"));
        }
        if (this.RVTextures.IsEmpty())
        {
            this.RVTextures.Add(TObjectPtr<URuntimeVirtualTexture>((Cast<URuntimeVirtualTexture>(LoadObject(nullptr, "/Script/Engine.RuntimeVirtualTexture'/Game/Shader/DefaultTexture/RVT_TerrainCommon.RVT_TerrainCommon'")))));
        }
        if (this.DefaultMesh == nullptr)
        {
            this.DefaultMesh = Cast<UStaticMesh>(LoadObject(nullptr, "/Script/Engine.StaticMesh'/Engine/BasicShapes/Cube.Cube'"));
        }
        UStaticMesh local_14 = this.MeshComp.GetStaticMesh();
        if (local_14 != this.DefaultMesh)
        {
            this.MeshComp.SetStaticMesh(this.DefaultMesh);
        }
        this.MeshComp.RuntimeVirtualTextures = this.RVTextures;
        this.MeshComp.VirtualTextureRenderPassType = false;
        if (this.Material != nullptr)
        {
            this.MeshComp.SetMaterial(0, this.Material);
        }
        this.MeshComp.SetCollisionEnabled(ECollisionEnabled(0));
        return;
    }
}


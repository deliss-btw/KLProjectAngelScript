struct FGodraySetting
{
    UPROPERTY()
    bool bFollowEnvironmentSystem = true;
    UPROPERTY()
    FLinearColor GodrayColor = FLinearColor(1.0f, 1.0f, 1.0f, 0.0f);
    UPROPERTY()
    float32 FadeInDistance = 0.0f;
    UPROPERTY()
    float32 FadeInOffset = 0.0f;

}

class ASceneVolumeLight : AActor
{
    UPROPERTY()
    UStaticMesh DefaultMesh;
    UPROPERTY()
    UStaticMeshComponent MeshComp;
    UPROPERTY()
    UMaterialInstanceConstant Material;
    UPROPERTY()
    FGodraySetting GodraySetting;

    default MeshComp.SetRelativeScale3D(FVector(25.0, 25.0, 70.0));
    default Material = Cast<UMaterialInstanceConstant>(LoadObject(nullptr, "/Script/Engine.MaterialInstanceConstant'/Game/Shader/Effect/MI_SceneVolumeLight.MI_SceneVolumeLight'"));
    default DefaultMesh = Cast<UStaticMesh>(LoadObject(nullptr, "/Script/Engine.StaticMesh'/Engine/BasicShapes/Cube.Cube'"));
    default MeshComp.SetStaticMesh(DefaultMesh);
    default MeshComp.SetMaterial(0, Material);
    default MeshComp.SetCollisionEnabled(ECollisionEnabled(0));

    ASceneVolumeLight()
    {
        return;
    }
    UFUNCTION()
    void ConstructionScript_Implementation()
    {
        this.ApplyGodraySetting();
        return;
    }
    UFUNCTION()
    void BeginPlay_Implementation()
    {
        this.ApplyGodraySetting();
        return;
    }
    void ApplyGodraySetting()
    {
        this.MeshComp.SetCustomPrimitiveDataFloat(0, this.GodraySetting.GodrayColor.R);
        this.MeshComp.SetCustomPrimitiveDataFloat(1, this.GodraySetting.GodrayColor.G);
        float32 local_1_3 = this.GodraySetting.GodrayColor.B;
        this.MeshComp.SetCustomPrimitiveDataFloat(2, local_1_3);
        if (this.GodraySetting.bFollowEnvironmentSystem)
        {
            local_1_3 = 1.0f;
        }
        else
        {
            local_1_3 = 0.0f;
        }
        this.MeshComp.SetCustomPrimitiveDataFloat(3, local_1_3);
        this.MeshComp.SetCustomPrimitiveDataFloat(4, this.GodraySetting.FadeInDistance);
        this.MeshComp.SetCustomPrimitiveDataFloat(5, this.GodraySetting.FadeInOffset);
        return;
    }
}


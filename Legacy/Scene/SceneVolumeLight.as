

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
        this.MeshComp.SetCustomPrimitiveDataFloat(0, int(this.GodraySetting.GodrayColor.R));
        this.MeshComp.SetCustomPrimitiveDataFloat(1, int(this.GodraySetting.GodrayColor.G));
        this.MeshComp.SetCustomPrimitiveDataFloat(2, int(this.GodraySetting.GodrayColor.B));
        this.MeshComp.SetCustomPrimitiveDataFloat(3, (this.GodraySetting.bFollowEnvironmentSystem ? 1065353216 : 0));
        this.MeshComp.SetCustomPrimitiveDataFloat(4, int(this.GodraySetting.FadeInDistance));
        this.MeshComp.SetCustomPrimitiveDataFloat(5, int(this.GodraySetting.FadeInOffset));
        return;
    }
}


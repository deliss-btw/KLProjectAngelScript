

struct FFogCardSetting
{
    UPROPERTY()
    float32 Alpha = 1.0f;
    UPROPERTY()
    UTexture2D Tex = (Cast<UTexture2D>(LoadObject(nullptr, "/Script/Engine.Texture2D'/Game/Shader/Effect/FogCard2DType/T_FogCard_02.T_FogCard_02'")));
    UPROPERTY()
    FLinearColor Albedo = FLinearColor(1.0f, 1.0f, 1.0f, 0.0f);
    UPROPERTY()
    FLinearColor EmissiveColor = FLinearColor(0.0f, 0.0f, 0.0f, 0.0f);
    UPROPERTY()
    float32 FogNoiseUV = 1.0f;
    UPROPERTY()
    float32 NoiseScale = 0.1f;
    UPROPERTY()
    float32 NearFadeDistance = 0.0f;
    UPROPERTY()
    float32 NearFadeSmooth = 1000.0f;
    UPROPERTY()
    float32 WindSpeed = 0.1f;


}

class ASceneFogCard2D : AActor
{
    UPROPERTY()
    UStaticMesh DefaultMesh;
    UPROPERTY()
    UStaticMeshComponent MeshComp;
    UPROPERTY()
    UMaterialInterface SourceMaterial;
    UPROPERTY()
    UMaterialInstanceDynamic MID;
    UPROPERTY()
    FFogCardSetting FogSetting;

    default MeshComp.SetRelativeScale3D(FVector(10.0, 10.0, 10.0));
    default DefaultMesh = Cast<UStaticMesh>(LoadObject(nullptr, "/Script/Engine.StaticMesh'/Engine/BasicShapes/Plane.Plane'"));
    default MeshComp.SetStaticMesh(DefaultMesh);
    default MeshComp.SetCollisionEnabled(ECollisionEnabled(0));
    default SourceMaterial = Cast<UMaterialInterface>(LoadObject(nullptr, "/Script/Engine.MaterialInstanceConstant'/Game/Shader/Effect/MI_FogCard.MI_FogCard'"));

    ASceneFogCard2D()
    {
        return;
    }
    UFUNCTION()
    void ConstructionScript_Implementation()
    {
        if ((this.SourceMaterial != nullptr && ((this.MID == nullptr))))
        {
            this.MID = this.MeshComp.CreateDynamicMaterialInstance(0, this.SourceMaterial, NAME_None);
        }
        this.ApplyMaterialParameters();
        return;
    }
    UFUNCTION()
    void BeginPlay_Implementation()
    {
        if ((this.SourceMaterial != nullptr && ((this.MID == nullptr))))
        {
            this.MID = this.MeshComp.CreateDynamicMaterialInstance(0, this.SourceMaterial, NAME_None);
        }
        this.ApplyMaterialParameters();
        return;
    }
    void ApplyMaterialParameters()
    {
        if (this.MID == nullptr)
        {
            return;
        }
        this.MID.SetScalarParameterValue(n"Alpha", int(this.FogSetting.Alpha));
        this.MID.SetVectorParameterValue(n"Base Color Tint", this.FogSetting.Albedo);
        this.MID.SetVectorParameterValue(n"EmissiveColor", this.FogSetting.EmissiveColor);
        this.MID.SetScalarParameterValue(n"NoiseTilling", int(this.FogSetting.FogNoiseUV));
        this.MID.SetScalarParameterValue(n"NoiseScale", int(this.FogSetting.NoiseScale));
        this.MID.SetTextureParameterValue(n"Opacity", this.FogSetting.Tex);
        this.MID.SetScalarParameterValue(n"Camera Fading Distance", int(this.FogSetting.NearFadeDistance));
        this.MID.SetScalarParameterValue(n"Camera Fading Range", int(this.FogSetting.NearFadeSmooth));
        this.MID.SetScalarParameterValue(n"WindSpeed", int(this.FogSetting.WindSpeed));
        return;
    }
}


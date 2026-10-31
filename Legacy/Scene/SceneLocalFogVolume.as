struct FFogEffectSetting
{
    UPROPERTY()
    float32 Alpha = 1.0f;
    UPROPERTY()
    int MaskShape = 0;
    UPROPERTY()
    FLinearColor Albedo = FLinearColor(1.0f, 1.0f, 1.0f, 0.0f);
    UPROPERTY()
    FLinearColor AlbedoSec = FLinearColor(1.0f, 1.0f, 1.0f, 0.0f);
    UPROPERTY()
    float32 AlbedoLerpFactor = 1.0f;
    UPROPERTY()
    FLinearColor Emissive = FLinearColor(0.0f, 0.0f, 0.0f, 0.0f);
    UPROPERTY()
    float32 FogNoiseUV = 25.0f;
    UPROPERTY()
    float32 NoiseContrast = 5.0f;
    UPROPERTY()
    float32 NoiseFade = 0.2f;
    UPROPERTY()
    float32 NearFadeDistance = 0.0f;
    UPROPERTY()
    float32 NearFadeStrength = 0.0f;
    UPROPERTY()
    float32 NearFadeSmooth = 1000.0f;
    UPROPERTY()
    bool EnableYAlphaMask = false;
    UPROPERTY()
    float32 YAlphaOffset = 0.0f;
    UPROPERTY()
    float32 YAlphaRange = 1.0f;
    UPROPERTY()
    float32 WindSpeed = 0.01f;

}

class ASceneLocalFogVolume : AActor
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
    FFogEffectSetting FogSetting;

    default MeshComp.SetRelativeScale3D(FVector(100.0, 100.0, 100.0));
    default DefaultMesh = Cast<UStaticMesh>(LoadObject(nullptr, "/Script/Engine.StaticMesh'/Engine/BasicShapes/Cube.Cube'"));
    default MeshComp.SetStaticMesh(DefaultMesh);
    default MeshComp.SetCollisionEnabled(ECollisionEnabled(0));
    default SourceMaterial = Cast<UMaterialInterface>(LoadObject(nullptr, "/Script/Engine.MaterialInstanceConstant'/Game/Shader/Effect/MI_LocalVolumeFog.MI_LocalVolumeFog'"));

    ASceneLocalFogVolume()
    {
        return;
    }
    UFUNCTION()
    void ConstructionScript_Implementation()
    {
        this.EnsureMID();
        this.ApplyMaterialParameters();
        return;
    }
    UFUNCTION()
    void BeginPlay_Implementation()
    {
        this.EnsureMID();
        this.ApplyMaterialParameters();
        return;
    }
    void EnsureMID()
    {
        if (this.MID != nullptr)
        {
            return;
        }
        if (this.SourceMaterial == nullptr)
        {
            return;
        }
        this.MID = this.MeshComp.CreateDynamicMaterialInstance(0, this.SourceMaterial, NAME_None);
        return;
    }
    void ApplyMaterialParameters()
    {
        if (this.MID == nullptr)
        {
            return;
        }
        this.MID.SetScalarParameterValue(n"æ•´ä½“é€æ˜Žåº¦", this.FogSetting.Alpha);
        this.MID.SetScalarParameterValue(n"é®ç½©å½¢çŠ¶", this.FogSetting.MaskShape);
        this.MID.SetVectorParameterValue(n"ä¸»é¢œè‰²", this.FogSetting.Albedo);
        this.MID.SetVectorParameterValue(n"æ¬¡é¢œè‰²", this.FogSetting.AlbedoSec);
        this.MID.SetScalarParameterValue(n"é¢œè‰²æ··åˆç³»æ•°", this.FogSetting.AlbedoLerpFactor);
        this.MID.SetVectorParameterValue(n"è‡ªå‘å…‰", this.FogSetting.Emissive);
        this.MID.SetScalarParameterValue(n"å™ªå£°UVç¼©æ”¾", this.FogSetting.FogNoiseUV);
        this.MID.SetScalarParameterValue(n"å™ªå£°å¯¹æ¯”åº¦", this.FogSetting.NoiseContrast);
        this.MID.SetScalarParameterValue(n"å™ªå£°æ·¡åŒ–å¼ºåº¦", this.FogSetting.NoiseFade);
        this.MID.SetScalarParameterValue(n"é è¿‘Fadeè·ç¦»", this.FogSetting.NearFadeDistance);
        this.MID.SetScalarParameterValue(n"é è¿‘Fadeå¼ºåº¦", this.FogSetting.NearFadeStrength);
        float32 local_5_2 = this.FogSetting.NearFadeSmooth;
        this.MID.SetScalarParameterValue(n"é è¿‘Fadeè¿‡æ¸¡è·ç¦»", local_5_2);
        if (this.FogSetting.EnableYAlphaMask)
        {
            local_5_2 = 1.0f;
        }
        else
        {
            local_5_2 = 0.0f;
        }
        this.MID.SetScalarParameterValue(n"Yå‘é¢å¤–Alphaå¼€å…³", local_5_2);
        this.MID.SetScalarParameterValue(n"Yå‘é¢å¤–Alpha Offset", this.FogSetting.YAlphaOffset);
        this.MID.SetScalarParameterValue(n"Yå‘é¢å¤–Alpha Range", this.FogSetting.YAlphaRange);
        this.MID.SetScalarParameterValue(n"é£Žé€Ÿ", this.FogSetting.WindSpeed);
        return;
    }
}


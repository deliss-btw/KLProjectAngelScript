

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
        this.MID.SetScalarParameterValue(n"Г¦вЂўВґГ¤ВЅвЂњГ©в‚¬ВЏГ¦ЛњЕЅГҐВєВ¦", this.FogSetting.Alpha);
        this.MID.SetScalarParameterValue(n"Г©ВЃВ®Г§ВЅВ©ГҐВЅВўГ§Е В¶", this.FogSetting.MaskShape);
        this.MID.SetVectorParameterValue(n"Г¤ВёВ»Г©ВўЕ“ГЁвЂ°ВІ", this.FogSetting.Albedo);
        this.MID.SetVectorParameterValue(n"Г¦В¬ВЎГ©ВўЕ“ГЁвЂ°ВІ", this.FogSetting.AlbedoSec);
        this.MID.SetScalarParameterValue(n"Г©ВўЕ“ГЁвЂ°ВІГ¦В·В·ГҐВђЛ†Г§ВіВ»Г¦вЂўВ°", this.FogSetting.AlbedoLerpFactor);
        this.MID.SetVectorParameterValue(n"ГЁвЂЎВЄГҐВЏвЂГҐвЂ¦вЂ°", this.FogSetting.Emissive);
        this.MID.SetScalarParameterValue(n"ГҐв„ўВЄГҐВЈВ°UVГ§ВјВ©Г¦вЂќВѕ", this.FogSetting.FogNoiseUV);
        this.MID.SetScalarParameterValue(n"ГҐв„ўВЄГҐВЈВ°ГҐВЇВ№Г¦ВЇвЂќГҐВєВ¦", this.FogSetting.NoiseContrast);
        this.MID.SetScalarParameterValue(n"ГҐв„ўВЄГҐВЈВ°Г¦В·ВЎГҐЕ’вЂ“ГҐВјВєГҐВєВ¦", this.FogSetting.NoiseFade);
        this.MID.SetScalarParameterValue(n"Г©ВќВ ГЁВївЂFadeГЁВ·ВќГ§В¦В»", this.FogSetting.NearFadeDistance);
        this.MID.SetScalarParameterValue(n"Г©ВќВ ГЁВївЂFadeГҐВјВєГҐВєВ¦", this.FogSetting.NearFadeStrength);
        float32 local_5_2 = this.FogSetting.NearFadeSmooth;
        this.MID.SetScalarParameterValue(n"Г©ВќВ ГЁВївЂFadeГЁВївЂЎГ¦ВёВЎГЁВ·ВќГ§В¦В»", local_5_2);
        if (this.FogSetting.EnableYAlphaMask)
        {
            local_5_2 = 1.0f;
        }
        else
        {
            local_5_2 = 0.0f;
        }
        this.MID.SetScalarParameterValue(n"YГҐВђвЂГ©ВўВќГҐВ¤вЂ“AlphaГҐВјв‚¬ГҐвЂ¦Ві", local_5_2);
        this.MID.SetScalarParameterValue(n"YГҐВђвЂГ©ВўВќГҐВ¤вЂ“Alpha Offset", int(this.FogSetting.YAlphaOffset));
        this.MID.SetScalarParameterValue(n"YГҐВђвЂГ©ВўВќГҐВ¤вЂ“Alpha Range", int(this.FogSetting.YAlphaRange));
        this.MID.SetScalarParameterValue(n"Г©ВЈЕЅГ©в‚¬Её", int(this.FogSetting.WindSpeed));
        return;
    }
}


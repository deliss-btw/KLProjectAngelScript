
enum ELandedMaterialType
{
    Default,
    Flesh,
    Grass,
    LandGrass,
    LandSoil,
    LandStone,
    Metal,
    Stone,
    Water,
    Wood,
}

enum ELandedStrength
{
    Default,
    Light,
    Moderate,
    High,
    Extreme,
}


struct FLISStrengthData
{
    UPROPERTY()
    bool bCheckImpactStrength = true;
    UPROPERTY()
    float32 MinImpactStrength = 0.0f;
    UPROPERTY()
    float32 MaxImpactStrength = 9999999.0f;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> Event;


}

struct FLISCharacterSizeData
{
    UPROPERTY()
    FLISStrengthData Default;
    UPROPERTY()
    FLISStrengthData Light;
    UPROPERTY()
    FLISStrengthData Moderate;
    UPROPERTY()
    FLISStrengthData High;
    UPROPERTY()
    FLISStrengthData Extreme;

    FLISCharacterSizeData()
    {
        return;
    }
    void Preload()
    {
        ::FPreloadAssetUtils::LoadAkEvent(this.Event);
        ::FPreloadAssetUtils::LoadAkEvent(this.Light.Event);
        ::FPreloadAssetUtils::LoadAkEvent(this.Moderate.Event);
        ::FPreloadAssetUtils::LoadAkEvent(this.High.Event);
        ::FPreloadAssetUtils::LoadAkEvent(this.Extreme.Event);
        return;
    }
}

struct FLandedImpactSFXData
{
    UPROPERTY()
    FLISCharacterSizeData Default;
    UPROPERTY()
    FLISCharacterSizeData Small;
    UPROPERTY()
    FLISCharacterSizeData Medium;
    UPROPERTY()
    FLISCharacterSizeData Large;
    UPROPERTY()
    FLISCharacterSizeData ExtraLarge;
    UPROPERTY()
    bool bFallBack = false;
    UPROPERTY()
    ELandedMaterialType FallBack = ELandedMaterialType(0);


    void Preload()
    {
        this.Preload();
        this.Small.Preload();
        this.Medium.Preload();
        this.Large.Preload();
        this.ExtraLarge.Preload();
        return;
    }
}

struct FLIVStrengthData
{
    UPROPERTY()
    bool bCheckImpactStrength = true;
    UPROPERTY()
    float32 MinImpactStrength = 0.0f;
    UPROPERTY()
    float32 MaxImpactStrength = 9999999.0f;
    UPROPERTY()
    TSoftClassPtr<AFXActor> FXActor;
    UPROPERTY()
    FVector3f Scale = FVector3f::OneVector;
    UPROPERTY()
    FVector3f LocationOffset = FVector3f::ZeroVector;
    UPROPERTY()
    FRotator3f RotationOffset = FRotator3f::ZeroRotator;


    bool IsInImpactForceRange(const float32 ImpactForce)
    {
        if ((ImpactForce >= this.MinImpactStrength && (ImpactForce < this.MaxImpactStrength)))
        {
            return true;
        }
        return false;
    }
}

struct FLIVCharacterSizeData
{
    UPROPERTY()
    FLIVStrengthData Default;
    UPROPERTY()
    FLIVStrengthData Light;
    UPROPERTY()
    FLIVStrengthData Moderate;
    UPROPERTY()
    FLIVStrengthData High;
    UPROPERTY()
    FLIVStrengthData Extreme;

    FLIVCharacterSizeData()
    {
        return;
    }
    void Preload()
    {
        ::FPreloadAssetUtils::LoadFXActor(this.FXActor);
        ::FPreloadAssetUtils::LoadFXActor(this.Light.FXActor);
        ::FPreloadAssetUtils::LoadFXActor(this.Moderate.FXActor);
        ::FPreloadAssetUtils::LoadFXActor(this.High.FXActor);
        ::FPreloadAssetUtils::LoadFXActor(this.Extreme.FXActor);
        return;
    }
}

struct FLandedImpactVFXData
{
    UPROPERTY()
    FLIVCharacterSizeData Default;
    UPROPERTY()
    FLIVCharacterSizeData Small;
    UPROPERTY()
    FLIVCharacterSizeData Medium;
    UPROPERTY()
    FLIVCharacterSizeData Large;
    UPROPERTY()
    FLIVCharacterSizeData ExtraLarge;
    UPROPERTY()
    bool bFallBack = false;
    UPROPERTY()
    ELandedMaterialType FallBack = ELandedMaterialType(0);


    void Preload()
    {
        this.Preload();
        this.Small.Preload();
        this.Medium.Preload();
        this.Large.Preload();
        this.ExtraLarge.Preload();
        return;
    }
}


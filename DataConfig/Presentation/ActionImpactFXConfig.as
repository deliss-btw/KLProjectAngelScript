
enum EActionImpactType
{
    Default,
    Jump,
    Land,
}


struct FActionSFXData
{
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> Event;

    FActionSFXData()
    {
        return;
    }
}

struct FAICharacterSizeSFXData
{
    UPROPERTY()
    FActionSFXData Default;
    UPROPERTY()
    FActionSFXData Jump;
    UPROPERTY()
    FActionSFXData Land;

    FAICharacterSizeSFXData()
    {
        return;
    }
    void Preload()
    {
        ::FPreloadAssetUtils::LoadAkEvent(this.Event);
        ::FPreloadAssetUtils::LoadAkEvent(this.Jump.Event);
        ::FPreloadAssetUtils::LoadAkEvent(this.Land.Event);
        return;
    }
}

struct FActionImpactSFXData
{
    UPROPERTY()
    FAICharacterSizeSFXData Default;
    UPROPERTY()
    FAICharacterSizeSFXData Small;
    UPROPERTY()
    FAICharacterSizeSFXData Medium;
    UPROPERTY()
    FAICharacterSizeSFXData Large;
    UPROPERTY()
    FAICharacterSizeSFXData ExtraLarge;
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

struct FActionVFXData
{
    UPROPERTY()
    TSoftClassPtr<AFXActor> FXActor;
    UPROPERTY()
    FVector3f Scale = FVector3f::OneVector;
    UPROPERTY()
    FVector3f LocationOffset = FVector3f::ZeroVector;
    UPROPERTY()
    FRotator3f RotationOffset = FRotator3f::ZeroRotator;

    FActionVFXData()
    {
        return;
    }
}

struct FAICharacterSizeVFXData
{
    UPROPERTY()
    FActionVFXData Default;
    UPROPERTY()
    FActionVFXData Jump;
    UPROPERTY()
    FActionVFXData Land;

    FAICharacterSizeVFXData()
    {
        return;
    }
    void Preload()
    {
        ::FPreloadAssetUtils::LoadFXActor(this.FXActor);
        ::FPreloadAssetUtils::LoadFXActor(this.Jump.FXActor);
        ::FPreloadAssetUtils::LoadFXActor(this.Land.FXActor);
        return;
    }
}

struct FActionImpactVFXData
{
    UPROPERTY()
    FAICharacterSizeVFXData Default;
    UPROPERTY()
    FAICharacterSizeVFXData Small;
    UPROPERTY()
    FAICharacterSizeVFXData Medium;
    UPROPERTY()
    FAICharacterSizeVFXData Large;
    UPROPERTY()
    FAICharacterSizeVFXData ExtraLarge;
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


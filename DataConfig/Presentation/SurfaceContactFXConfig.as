
enum ESurfaceMaterialType
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

enum ECharacterBodySize
{
    Default,
    Small,
    Medium,
    Large,
    ExtraLarge,
}


struct FImpactFXData
{
    UPROPERTY()
    TSoftClassPtr<AFXActor> FXActor;
    UPROPERTY()
    bool bIsLoop = false;
    UPROPERTY()
    FVector3f Scale = FVector3f::OneVector;
    UPROPERTY()
    FVector3f LocationOffset = FVector3f::ZeroVector;
    UPROPERTY()
    FRotator3f RotationOffset = FRotator3f::ZeroRotator;
    UPROPERTY()
    float32 RandomRotationAngle = 0.0f;


    void OnDataTableRowChanged()
    {
        return;
    }
}

struct FCharacterSizeVFXData
{
    UPROPERTY()
    FImpactFXData Default;
    UPROPERTY()
    FImpactFXData Small;
    UPROPERTY()
    FImpactFXData Medium;
    UPROPERTY()
    FImpactFXData Large;
    UPROPERTY()
    FImpactFXData ExtraLarge;
    UPROPERTY()
    bool bFallBack = false;
    UPROPERTY()
    ESurfaceMaterialType FallBack = ESurfaceMaterialType(0);


    void Preload()
    {
        ::FPreloadAssetUtils::LoadFXActor(this.FXActor);
        ::FPreloadAssetUtils::LoadFXActor(this.Small.FXActor);
        ::FPreloadAssetUtils::LoadFXActor(this.Medium.FXActor);
        ::FPreloadAssetUtils::LoadFXActor(this.Large.FXActor);
        ::FPreloadAssetUtils::LoadFXActor(this.ExtraLarge.FXActor);
        return;
    }
    void OnDataTableRowChanged()
    {
        return;
    }
}

struct FArealStrikeEnvSurfaceVFXData
{
    UPROPERTY()
    FImpactFXData Default;
    UPROPERTY()
    FImpactFXData WithSparks;
    UPROPERTY()
    FImpactFXData WithoutSparks;
    UPROPERTY()
    bool bFallBack = false;
    UPROPERTY()
    ECharacterBodySize FallBack = ECharacterBodySize(0);


    void Preload()
    {
        ::FPreloadAssetUtils::LoadFXActor(this.FXActor);
        ::FPreloadAssetUtils::LoadFXActor(this.WithSparks.FXActor);
        ::FPreloadAssetUtils::LoadFXActor(this.WithoutSparks.FXActor);
        return;
    }
    void OnDataTableRowChanged()
    {
        return;
    }
}

struct FEnableDisableColliderItem1
{
    UPROPERTY()
    FName ColliderName;
    UPROPERTY()
    bool bColliderEnabled = true;


}

struct FVFXCode
{
    UPROPERTY()
    int Code;


}

struct FVFXCodeData
{
    UPROPERTY()
    TArray<FVFXCode> Code;
    UPROPERTY()
    bool bFallBack;
    UPROPERTY()
    ESurfaceMaterialType FallBack;


}


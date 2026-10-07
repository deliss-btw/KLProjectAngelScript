
namespace __INTENRAL_FCE_ImpactFXEvent_NS
{
    const TECSEventDerivedPtr<FCE_ImpactFXEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ImpactFXEvent>();
}
namespace __INTENRAL_FCE_SyncImpactFXEvent_NS
{
    const TECSEventDerivedPtr<FCE_SyncImpactFXEvent> DerivedPtr = TECSEventDerivedPtr<FCE_SyncImpactFXEvent>();

}
struct FSomeStruct
{
    FSomeStruct()
    {
        return;
    }
}

struct FCE_ImpactFXEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bHasVFX;
    UPROPERTY()
    bool bHasSFX;
    UPROPERTY()
    bool bDurational;
    UPROPERTY()
    EImpactStrength ImpactStrength;
    UPROPERTY()
    FVector ImpactPosition;
    UPROPERTY()
    FVector ImpactOutDir;
    UPROPERTY()
    FRotator3f ImpactRotation;
    UPROPERTY()
    TSoftObjectPtr<UGamePhysicalMaterial> PhysicalMaterial;
    UPROPERTY()
    EImpactType ImpactType;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> ImpactSFXEvent;

    FCE_ImpactFXEvent()
    {
        this.bHasVFX = true;
        this.bHasSFX = true;
        this.bDurational = false;
        this.ImpactStrength = EImpactStrength(0);
        this.ImpactType = EImpactType(0);
        this.SetbPredictable(false);
        return;
    }
}

struct FCE_SyncImpactFXEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FVector ImpactPosition;
    UPROPERTY()
    FRotator3f ImpactRotation;
    UPROPERTY()
    EImpactType ImpactType = EImpactType(0);


}


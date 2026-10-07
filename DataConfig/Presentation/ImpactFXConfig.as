
enum EImpactType
{
    Default,
    Cut,
    Stab,
    Smash,
    BossBattle,
}


struct FImpactSFXData
{
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> Event;
    UPROPERTY()
    bool bFallBack;
    UPROPERTY()
    EImpactType FallBack;


}

struct FImpactVFXData
{
    UPROPERTY()
    TSoftClassPtr<AFXActor> FXActor;
    UPROPERTY()
    FVector3f Scale = FVector3f::OneVector;
    UPROPERTY()
    FVector3f LocationOffset = FVector3f::ZeroVector;
    UPROPERTY()
    FRotator3f RotationOffset = FRotator3f::ZeroRotator;
    UPROPERTY()
    float32 RandomRotationAngle = 0.0f;
    UPROPERTY()
    bool bFallBack;
    UPROPERTY()
    EImpactType FallBack;


}

struct FImpactVFXDataWithStrength
{
    UPROPERTY()
    FImpactVFXData Light;
    UPROPERTY()
    FImpactVFXData Moderate;
    UPROPERTY()
    FImpactVFXData High;
    UPROPERTY()
    bool bFallBack;
    UPROPERTY()
    EImpactType FallBack;


}



enum ETransformMode
{
    Absolute,
    RelativeToEntity,
}


// NOTE: class defaults are not authored in this module: UESMAction_SpawnPrefab (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_SpawnPrefab : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bRemakeSelf = false;
    UPROPERTY()
    TSubclassOf<AECSPrefab> PrefabClass;
    UPROPERTY()
    ETransformMode LocationOffsetMode = ETransformMode(1);
    UPROPERTY()
    FVector Location = FVector::ZeroVector;
    UPROPERTY()
    ETransformMode RotationOffsetMode = ETransformMode(1);
    UPROPERTY()
    FRotator Rotation = FRotator::ZeroRotator;
    UPROPERTY()
    bool bSpawnOnGround = false;
    UPROPERTY()
    float32 SpawnOnGroundMaxTraceDownDist = 1000.0f;
    UPROPERTY()
    float32 SpawnOnGroundHeightFromGround = 50.0f;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}


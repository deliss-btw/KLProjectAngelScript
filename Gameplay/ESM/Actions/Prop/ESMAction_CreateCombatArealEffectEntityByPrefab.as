

// NOTE: class defaults are not authored in this module: UESMAction_CreateCombatArealEffectEntityByPrefab (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_CreateCombatArealEffectEntityByPrefab : UESMBPBaseInstantAction
{
    UPROPERTY()
    TSubclassOf<ACombatArealEffectPrefab> PrefabClass;
    UPROPERTY()
    ETransformMode LocationOffsetMode = ETransformMode(1);
    UPROPERTY()
    FVector Location = FVector::ZeroVector;
    UPROPERTY()
    ETransformMode RotationOffsetMode = ETransformMode(1);
    UPROPERTY()
    FRotator Rotation = FRotator::ZeroRotator;
    UPROPERTY()
    float32 LifeTime = 1.0f;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_2 = 0;
        if (!(local_2))
        {
            return;
        }
        FVector local_14 = this.Location;
        if (int(this.LocationOffsetMode) == 1)
        {
            local_14 += local_2.GetPosition();
        }
        FRotator local_30 = this.Rotation;
        if (int(this.RotationOffsetMode) == 1)
        {
            local_30 += local_2.GetRotation().Rotator();
        }
        ::BlueprintFunctions_Common::CreateCombatArealEffectEntityByPrefab(FECSEntityAdapter(Context.GetEntity()), this.PrefabClass, local_14, local_30, this.LifeTime);
        return;
    }
}




// NOTE: class defaults are not authored in this module: AMonsterPrefab (default scalar field AECSPrefab.PerformanceStatCategory has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

UCLASS(Abstract)
class AMonsterPrefab : ACharacterPrefab
{
    UPROPERTY()
    FT_DropItemSource DropItemSource;
    UPROPERTY()
    FT_PoseControl PoseControl;
    UPROPERTY()
    FT_SnapToFloor SnapToFloor;
    UPROPERTY()
    FT_CombatPresentation CombatPresentation;
    UPROPERTY()
    FT_MonsterAudio MonsterAudio;
    UPROPERTY()
    FT_BreathSFX MonsterBreathSFX;
    UPROPERTY()
    FT_WeaponBowSelf WeaponBow;

    AMonsterPrefab()
    {
        super();
        return;
    }
}


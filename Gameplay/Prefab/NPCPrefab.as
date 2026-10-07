

// NOTE: class defaults are not authored in this module: ANPCPrefab (default scalar field AECSPrefab.PerformanceStatCategory has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

UCLASS(Abstract)
class ANPCPrefab : ACharacterPrefab
{
    UPROPERTY()
    FT_DropItemSource DropItemSource;
    UPROPERTY()
    FT_EcosimAIV2NPC EcosimAIV2NPC;
    UPROPERTY()
    FT_WeaponAttach WeaponAttach;

    ANPCPrefab()
    {
        super();
        return;
    }
}


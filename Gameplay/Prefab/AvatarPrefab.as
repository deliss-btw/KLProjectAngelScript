

// NOTE: class defaults are not authored in this module: AAvatarPrefab (default scalar field AECSPrefab.PerformanceStatCategory has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class AAvatarPrefab : ACharacterPrefab
{
    UPROPERTY()
    FT_WeaponAttach WeaponAttach;
    UPROPERTY()
    FT_PawnSocialInteraction PawnSocialInteraction;
    UPROPERTY()
    FT_MpmClothControl MpmClothControl;
    UPROPERTY()
    FT_Input Input;

    AAvatarPrefab()
    {
        super();
        return;
    }
}




// NOTE: class defaults are not authored in this module: AGTCEmptyPrefab (default scalar field AECSPrefab.bHasActor has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class AGTCEmptyPrefab : AKLLevelPrefabBase
{
    AGTCEmptyPrefab()
    {
        return;
    }
}

class AGTCGameTestPrefab : AGTCEmptyPrefab
{
    UPROPERTY()
    FT_GameTest GameTestConfig;

    AGTCGameTestPrefab()
    {
        super();
        return;
    }
}


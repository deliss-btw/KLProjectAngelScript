

class AOculusPrefabBase : AAccountExclusivePropPrefabBase
{
    UPROPERTY()
    FT_OculusConfig OculusConfigTrait;
    UPROPERTY()
    FT_LevelObjectStat LevelObjectStatTrait;
    UPROPERTY()
    FT_InteractTrait InteractTrait;
    UPROPERTY()
    FT_Collision CollisionTrait;

    AOculusPrefabBase()
    {
        super();
        return;
    }
}


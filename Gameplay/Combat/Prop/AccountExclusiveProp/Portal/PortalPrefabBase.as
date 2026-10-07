

class APortalPrefabBase : AAccountExclusivePropPrefabBase
{
    UPROPERTY()
    FT_PortalConfig PortalConfigTrait;
    UPROPERTY()
    FT_LevelObjectStat LevelObjectStatTrait;
    UPROPERTY()
    FT_InteractTrait InteractTrait;
    UPROPERTY()
    FT_Collision CollisionTrait;

    APortalPrefabBase()
    {
        super();
        return;
    }
}


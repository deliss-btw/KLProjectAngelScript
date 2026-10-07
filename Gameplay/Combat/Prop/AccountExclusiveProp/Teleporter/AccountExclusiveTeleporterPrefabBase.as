

class AAccountExclusiveTeleporterPrefabBase : AAccountExclusivePropPrefabBase
{
    UPROPERTY()
    FT_AccountExclusiveTeleporter AccountExclusiveTeleporterTrait;
    UPROPERTY()
    FT_TeleportSlotConfig TeleportSlotConfigTrait;
    UPROPERTY()
    FT_InteractTrait InteractTrait;
    UPROPERTY()
    FT_Collision CollisionTrait;

    AAccountExclusiveTeleporterPrefabBase()
    {
        super();
        return;
    }
}


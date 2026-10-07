

class ATreasureBoxPrefabBase : AAccountExclusivePropPrefabBase
{
    UPROPERTY()
    FT_TreasureBox TreasureBoxTrait;
    UPROPERTY()
    FT_LevelObjectStat LevelObjectStatTrait;
    UPROPERTY()
    FT_InteractTrait InteractTrait;
    UPROPERTY()
    FT_Collision CollisionTrait;

    ATreasureBoxPrefabBase()
    {
        super();
        return;
    }
}


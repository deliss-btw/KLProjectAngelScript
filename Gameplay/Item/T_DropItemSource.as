

struct FT_DropItemSource : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_DropItemConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_DropItemConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_DropItemConfig = true;
    UPROPERTY()
    FC_DropItemConfig Config_FC_DropItemConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_DropEnergyBallSource_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_DropEnergyBallSource, NAME_None);
    UPROPERTY()
    bool bHas_FC_DropEnergyBallSource = false;
    UPROPERTY()
    FC_DropEnergyBallSource Config_FC_DropEnergyBallSource;


}

struct FT_DropItem : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_Collision_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_Collision, NAME_None);
    UPROPERTY()
    bool bHas_FC_Collision = false;
    UPROPERTY()
    FC_Collision Config_FC_Collision;


}

struct FT_DropItemSpawner : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_DropItemConfig_Defination;
    UPROPERTY()
    FC_DropItemConfig Config_FC_DropItemConfig;

    default CustomName = FName("жЋ‰иђЅз‰© (FT_DropItemSpawner)");

    FT_DropItemSpawner()
    {
        this.FC_DropItemConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_DropItemConfig, NAME_None);
        this.__InitDefaults();
        return;
    }
}

struct FT_EnergyBallSource : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_DropEnergyBallSource_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_DropEnergyBallSource, NAME_None);
    UPROPERTY()
    FC_DropEnergyBallSource Config_FC_DropEnergyBallSource;

    FT_EnergyBallSource()
    {
        return;
    }
}

struct FT_TreasureBoxDropItemSpawner : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_TreasureBoxDropItemConfig_Defination;
    UPROPERTY()
    FC_TreasureBoxDropItemConfig Config_FC_TreasureBoxDropItemConfig;

    default CustomName = FName("е®ќз®±жЋ‰иђЅз‰© (FT_TreasureBoxDropItemSpawner)");

    FT_TreasureBoxDropItemSpawner()
    {
        this.FC_TreasureBoxDropItemConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_TreasureBoxDropItemConfig, NAME_None);
        this.__InitDefaults();
        return;
    }
}


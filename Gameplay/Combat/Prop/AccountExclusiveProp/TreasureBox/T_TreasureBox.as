

struct FT_TreasureBox : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_TreasureBoxConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_TreasureBoxConfig, NAME_None);
    UPROPERTY()
    FC_TreasureBoxConfig Config_FC_TreasureBoxConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_TreasureBoxDropItemConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_TreasureBoxDropItemConfig, NAME_None);
    UPROPERTY()
    FC_TreasureBoxDropItemConfig Config_FC_TreasureBoxDropItemConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_TreasureBoxRuntime_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_TreasureBoxRuntime, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AccountExclusivePropTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AccountExclusivePropTag, NAME_None);

    FT_TreasureBox()
    {
        return;
    }
}


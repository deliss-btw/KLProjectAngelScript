

struct FT_EquipmentHolder : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EquipmentHolder_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EquipmentHolder, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_GameplayModifierOwner_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_GameplayModifierOwner, NAME_None);

    FT_EquipmentHolder()
    {
        return;
    }
}


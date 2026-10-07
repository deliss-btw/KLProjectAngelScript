

struct FT_Faction : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_Faction_Defination;
    UPROPERTY()
    bool bHas_FC_Faction;
    UPROPERTY()
    FC_Faction Config_FC_Faction;

    default CustomName = FName("йµиђҐ (FT_Faction)");

    FT_Faction()
    {
        this.FC_Faction_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_Faction, NAME_None);
        this.bHas_FC_Faction = true;
        this.__InitDefaults();
        return;
    }
}


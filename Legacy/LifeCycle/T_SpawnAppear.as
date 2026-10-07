

struct FT_SpawnAppear : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SpawnAppearConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SpawnAppearConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_SpawnAppearConfig = false;
    UPROPERTY()
    FC_SpawnAppearConfig Config_FC_SpawnAppearConfig;


}


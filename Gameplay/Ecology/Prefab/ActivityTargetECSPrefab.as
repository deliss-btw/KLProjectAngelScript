

struct FT_EcologyActivityTargetConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcologyActivityTargetConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcologyActivityTargetConfig, NAME_None);
    UPROPERTY()
    FC_EcologyActivityTargetConfig Config_FC_EcologyActivityTargetConfig;

    FT_EcologyActivityTargetConfig()
    {
        return;
    }
}

class AEcologyActivityTargetPrefab : AEcologyUnitECSPrefab
{
    UPROPERTY()
    FT_EcologyActivityTargetConfig ActivityTargetConfig;

    AEcologyActivityTargetPrefab()
    {
        super();
        return;
    }
}


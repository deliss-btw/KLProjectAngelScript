

struct FT_EcologyConfigTrait : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcologyTestConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcologyTestConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_EcologyTestConfig = true;
    UPROPERTY()
    FC_EcologyTestConfig Config_FC_EcologyTestConfig;


}

class AEcologyTestPrefab : AEcologyUnitECSPrefab
{
    UPROPERTY()
    FT_EcologyConfigTrait Ecology;

    AEcologyTestPrefab()
    {
        super();
        return;
    }
}


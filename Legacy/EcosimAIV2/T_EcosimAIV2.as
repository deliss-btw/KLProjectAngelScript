

struct FT_EcosimAIV2StaticPoint : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcosimAIV2StaticPointConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcosimAIV2StaticPointConfig, NAME_None);
    UPROPERTY()
    FC_EcosimAIV2StaticPointConfig Config_FC_EcosimAIV2StaticPointConfig;

    FT_EcosimAIV2StaticPoint()
    {
        return;
    }
}

struct FT_EcosimAIV2NPC : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcosimAIV2EntityInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcosimAIV2EntityInfo, NAME_None);

    FT_EcosimAIV2NPC()
    {
        return;
    }
}

struct FT_EcosimAIV2Chain : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcosimAIV2ChainStateConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcosimAIV2ChainStateConfig, NAME_None);
    UPROPERTY()
    FC_EcosimAIV2ChainStateConfig Config_FC_EcosimAIV2ChainStateConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcosimAIV2ChainParentConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcosimAIV2ChainParentConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_EcosimAIV2ChainParentConfig = false;
    UPROPERTY()
    FC_EcosimAIV2ChainParentConfig Config_FC_EcosimAIV2ChainParentConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcosimAIV2ChainChildConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcosimAIV2ChainChildConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_EcosimAIV2ChainChildConfig = false;
    UPROPERTY()
    FC_EcosimAIV2ChainChildConfig Config_FC_EcosimAIV2ChainChildConfig;


}


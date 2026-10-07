

struct FT_AccountExclusiveCollectionPrefab : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AccountExclusivePropTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AccountExclusivePropTag, NAME_None);

    FT_AccountExclusiveCollectionPrefab()
    {
        return;
    }
}

struct FT_AccountExclusiveCollectionPrefabPresentationConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AccountExclusiveCollectionPrefabPresentationConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AccountExclusiveCollectionPrefabPresentationConfig, NAME_None);
    UPROPERTY()
    FC_AccountExclusiveCollectionPrefabPresentationConfig Config_FC_AccountExclusiveCollectionPrefabPresentationConfig;

    FT_AccountExclusiveCollectionPrefabPresentationConfig()
    {
        return;
    }
}


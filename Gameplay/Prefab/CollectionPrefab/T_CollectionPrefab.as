

struct FT_CollectionPrefabPresentationConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CollectionPrefabPresentationConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CollectionPrefabPresentationConfig, NAME_None);
    UPROPERTY()
    FC_CollectionPrefabPresentationConfig Config_FC_CollectionPrefabPresentationConfig;

    FT_CollectionPrefabPresentationConfig()
    {
        return;
    }
}


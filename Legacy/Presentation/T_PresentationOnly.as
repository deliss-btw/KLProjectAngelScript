

struct FT_PresentationOnly : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PresentationOnlyEntityTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PresentationOnlyEntityTag, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PresentationOnlyEntityInitTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PresentationOnlyEntityInitTag, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LifeTime_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LifeTime, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LifeTimeCommonControlTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LifeTimeCommonControlTag, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LifeTimeInitConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LifeTimeInitConfig, NAME_None);
    UPROPERTY()
    FC_LifeTimeInitConfig Config_FC_LifeTimeInitConfig;

    FT_PresentationOnly()
    {
        return;
    }
}


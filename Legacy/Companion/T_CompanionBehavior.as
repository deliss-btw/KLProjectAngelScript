

struct FT_CompanionBehavior : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CompanionBehaviorConfigTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CompanionBehaviorConfigTag, NAME_None);
    UPROPERTY()
    FC_CompanionBehaviorConfigTag Config_FC_CompanionBehaviorConfigTag;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CompanionSpeakingInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CompanionSpeakingInfo, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CompanionBehaviorInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CompanionBehaviorInfo, NAME_None);

    FT_CompanionBehavior()
    {
        return;
    }
}




struct FT_PlayerSocialInteraction : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SocialInteractionConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SocialInteractionConfig, NAME_None);
    UPROPERTY()
    FC_SocialInteractionConfig Config_FC_SocialInteractionConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SocialInteractionInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SocialInteractionInfo, NAME_None);

    FT_PlayerSocialInteraction()
    {
        return;
    }
}

struct FT_PawnSocialInteraction : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SocialInteractionPresentationInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SocialInteractionPresentationInfo, NAME_None);

    FT_PawnSocialInteraction()
    {
        return;
    }
}

struct FT_SocialExpression : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SocialExpressionInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SocialExpressionInfo, NAME_None);

    FT_SocialExpression()
    {
        return;
    }
}


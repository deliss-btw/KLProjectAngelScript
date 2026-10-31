class APlayerControllerPrefab : AKLECSPrefab
{
    UPROPERTY()
    FT_Inventory Inventory;
    UPROPERTY()
    FT_PlayerSocialInteraction PlayerSocialInteraction;
    UPROPERTY()
    FT_SwitchPlayerInfo SwitchPlayerInfo;
    UPROPERTY()
    FT_SocialExpression SocialExpression;
    UPROPERTY()
    FT_PlayerAudio PlayerAudio;
    UPROPERTY()
    FT_EntityBlackboard EBB;

    APlayerControllerPrefab()
    {
        return;
    }
}


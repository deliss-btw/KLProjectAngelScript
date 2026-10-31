class AAvatarPrefab : ACharacterPrefab
{
    UPROPERTY()
    FT_WeaponAttach WeaponAttach;
    UPROPERTY()
    FT_PawnSocialInteraction PawnSocialInteraction;
    UPROPERTY()
    FT_MpmClothControl MpmClothControl;
    UPROPERTY()
    FT_Input Input;

    AAvatarPrefab()
    {
        super();
        return;
    }
}


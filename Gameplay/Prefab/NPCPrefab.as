UCLASS(Abstract)
class ANPCPrefab : ACharacterPrefab
{
    UPROPERTY()
    FT_DropItemSource DropItemSource;
    UPROPERTY()
    FT_EcosimAIV2NPC EcosimAIV2NPC;
    UPROPERTY()
    FT_WeaponAttach WeaponAttach;

    ANPCPrefab()
    {
        super();
        return;
    }
}


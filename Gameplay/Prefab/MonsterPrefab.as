UCLASS(Abstract)
class AMonsterPrefab : ACharacterPrefab
{
    UPROPERTY()
    FT_DropItemSource DropItemSource;
    UPROPERTY()
    FT_PoseControl PoseControl;
    UPROPERTY()
    FT_SnapToFloor SnapToFloor;
    UPROPERTY()
    FT_CombatPresentation CombatPresentation;
    UPROPERTY()
    FT_MonsterAudio MonsterAudio;
    UPROPERTY()
    FT_BreathSFX MonsterBreathSFX;
    UPROPERTY()
    FT_WeaponBowSelf WeaponBow;

    AMonsterPrefab()
    {
        super();
        return;
    }
}


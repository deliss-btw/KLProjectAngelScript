

class AGameCharacterActor : AGameCharacter
{
    UPROPERTY()
    bool bOverrideAbnormalFXPrefabType;
    UPROPERTY()
    EAbnormalFXPrefabType AbnormalFXPrefabType;

    AGameCharacterActor()
    {
        this.bOverrideAbnormalFXPrefabType = false;
        this.Capsule.SetCollisionProfileName(n"Pawn", true);
        return;
    }
    void PostCDOCompiled()
    {
        return;
    }
    void PostInitComponent()
    {
        return;
    }
}


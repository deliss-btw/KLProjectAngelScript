

struct FT_PropAddBuffToPlayer : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PropAddBuffConfig_Defination;
    UPROPERTY()
    FC_PropAddBuffConfig Config_FC_PropAddBuffConfig;

    default CustomName = FName("дёєзЋ©е®¶ж·»еЉ Buff (FT_PropAddBuffToPlayer)");

    FT_PropAddBuffToPlayer()
    {
        this.FC_PropAddBuffConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PropAddBuffConfig, NAME_None);
        this.__InitDefaults();
        return;
    }
    FString ValidateConfig(const AECSPrefab Prefab) const
    {
        return this.Config_FC_PropAddBuffConfig.ValidateConfig(Prefab);
    }
}


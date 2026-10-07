

struct FT_Prop_LifeAndDeath : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    bool bDealWithDeath = false;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_DeathConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_DeathConfig, FName("bDealWithDeath"));
    UPROPERTY()
    FC_DeathConfig Config_FC_DeathConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PropDeathConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PropDeathConfig, FName("bDealWithDeath"));
    UPROPERTY()
    FC_PropDeathConfig Config_FC_PropDeathConfig;


}


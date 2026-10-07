

struct FT_Prop : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_Prop_Defination;
    UPROPERTY()
    FC_Prop Config_FC_Prop;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PropDeathConfig_Defination;
    UPROPERTY()
    bool bHas_FC_PropDeathConfig;
    UPROPERTY()
    FC_PropDeathConfig Config_FC_PropDeathConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_Faction_Defination;
    UPROPERTY()
    bool bHas_FC_Faction;
    UPROPERTY()
    FC_Faction Config_FC_Faction;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LifeTimeInitConfig_Defination;
    UPROPERTY()
    bool bHas_FC_LifeTimeInitConfig;
    UPROPERTY()
    FC_LifeTimeInitConfig Config_FC_LifeTimeInitConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_NumLimited_Defination;
    UPROPERTY()
    bool bHas_FC_NumLimited;
    UPROPERTY()
    FC_NumLimited Config_FC_NumLimited;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_DeathConfig_Defination;
    UPROPERTY()
    bool bHas_FC_DeathConfig;
    UPROPERTY()
    FC_DeathConfig Config_FC_DeathConfig;
    UPROPERTY()
    bool bEnableTrackOwner;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_TrackMovementConfig_Defination;
    UPROPERTY()
    FC_TrackMovementConfig Config_FC_TrackMovementConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PropTrackOwner_Defination;
    UPROPERTY()
    FC_PropTrackOwner Config_FC_PropTrackOwner;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MovementInfo_Defination;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_InitAbilityConfig_Defination;
    UPROPERTY()
    bool bHas_FC_InitAbilityConfig;
    UPROPERTY()
    FC_InitAbilityConfig Config_FC_InitAbilityConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_DropItemConfig_Defination;
    UPROPERTY()
    bool bHas_FC_DropItemConfig;
    UPROPERTY()
    FC_DropItemConfig Config_FC_DropItemConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LockableTag_Defination;
    UPROPERTY()
    bool bHas_FC_LockableTag;
    UPROPERTY()
    FC_LockableTag Config_FC_LockableTag;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LockableConfig_Defination;
    UPROPERTY()
    bool bHas_FC_LockableConfig;
    UPROPERTY()
    FC_LockableConfig Config_FC_LockableConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ManipulateProp_Defination;
    UPROPERTY()
    bool bHas_FC_ManipulateProp;
    UPROPERTY()
    FC_ManipulateProp Config_FC_ManipulateProp;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AIAvoidanceConfig_Defination;
    UPROPERTY()
    bool bHas_FC_AIAvoidanceConfig;
    UPROPERTY()
    FC_AIAvoidanceConfig Config_FC_AIAvoidanceConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PropEnvBreakableConfig_Defination;
    UPROPERTY()
    bool bHas_FC_PropEnvBreakableConfig;
    UPROPERTY()
    FC_PropEnvBreakableConfig Config_FC_PropEnvBreakableConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ThrowProjectilePropConfig_Defination;
    UPROPERTY()
    bool bHas_FC_ThrowProjectilePropConfig;
    UPROPERTY()
    FC_ThrowProjectilePropConfig Config_FC_ThrowProjectilePropConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SimpleCollisionConfig_Defination;
    UPROPERTY()
    bool bHas_FC_SimpleCollisionConfig;
    UPROPERTY()
    FC_SimpleCollisionConfig Config_FC_SimpleCollisionConfig;

    FT_Prop()
    {
        this.FC_Prop_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_Prop, NAME_None);
        this.FC_PropDeathConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PropDeathConfig, NAME_None);
        this.bHas_FC_PropDeathConfig = false;
        this.FC_Faction_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_Faction, NAME_None);
        this.bHas_FC_Faction = false;
        this.FC_LifeTimeInitConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LifeTimeInitConfig, NAME_None);
        this.bHas_FC_LifeTimeInitConfig = false;
        this.FC_NumLimited_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_NumLimited, NAME_None);
        this.bHas_FC_NumLimited = false;
        this.FC_DeathConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_DeathConfig, NAME_None);
        this.bHas_FC_DeathConfig = true;
        this.bEnableTrackOwner = false;
        this.FC_TrackMovementConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_TrackMovementConfig, FName("bEnableTrackOwner"));
        this.FC_PropTrackOwner_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PropTrackOwner, FName("bEnableTrackOwner"));
        this.FC_MovementInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MovementInfo, FName("bEnableTrackOwner"));
        this.FC_InitAbilityConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_InitAbilityConfig, NAME_None);
        this.bHas_FC_InitAbilityConfig = false;
        this.FC_DropItemConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_DropItemConfig, NAME_None);
        this.bHas_FC_DropItemConfig = false;
        this.FC_LockableTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LockableTag, NAME_None);
        this.bHas_FC_LockableTag = false;
        this.FC_LockableConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LockableConfig, NAME_None);
        this.bHas_FC_LockableConfig = false;
        this.FC_ManipulateProp_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ManipulateProp, NAME_None);
        this.bHas_FC_ManipulateProp = false;
        this.FC_AIAvoidanceConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AIAvoidanceConfig, NAME_None);
        this.bHas_FC_AIAvoidanceConfig = false;
        this.FC_PropEnvBreakableConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PropEnvBreakableConfig, NAME_None);
        this.bHas_FC_PropEnvBreakableConfig = false;
        this.FC_ThrowProjectilePropConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ThrowProjectilePropConfig, NAME_None);
        this.bHas_FC_ThrowProjectilePropConfig = false;
        this.FC_SimpleCollisionConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SimpleCollisionConfig, NAME_None);
        this.bHas_FC_SimpleCollisionConfig = false;
        this.Config_FC_LifeTimeInitConfig.ConfigLifeDuration = 10;
        return;
    }
    FString ValidateConfig(const AECSPrefab Prefab) const
    {
        if (this.bHas_FC_PropEnvBreakableConfig)
        {
            if (!(this.Config_FC_PropEnvBreakableConfig.CheckValidSorted()))
            {
                return FString().Append("Prefab [").Append(Prefab.GetPathName(nullptr)).Append("] ValidateConfig Fail: PropEnvBreakableConfig BreakPhasesжІЎжњ‰й™ЌеєЏжЋ’е€—");
            }
        }
        return "";
    }
}


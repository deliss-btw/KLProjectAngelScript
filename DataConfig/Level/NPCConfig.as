
enum ENPCCombatPriority
{
    Low,
    High,
}

enum ENPCRuntimeComponentFeature
{
    AI,
    Advanced,
    Combat,
    Collision,
}

enum ENPCComponentSwitchAction
{
    UsePrefabDefault,
    ForceDisable,
}


struct FNPCComponentSwitchOverride
{
    UPROPERTY()
    ENPCRuntimeComponentFeature Feature = ENPCRuntimeComponentFeature(2);
    UPROPERTY()
    ENPCComponentSwitchAction Action = ENPCComponentSwitchAction(0);


}

struct FNPCRoleConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    uint DataId;


}

struct FNPCPresentationConfig : FPresentationConfig
{
    FPresentationConfig _base_FPresentationConfig;

    default SpotOffset = FPresentationSpotOffset::DefaultAnchorTop;
    default SpotType = GameplayTags::SpotType_NPC;

    FNPCPresentationConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FNPCSkinOverride : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    TSoftClassPtr<ACharacterPrefab> PrefabOverride;

    FNPCSkinOverride()
    {
        return;
    }
}

struct FNPCMainConfig : FCreatureUnitConfig
{
    FCreatureUnitConfig _base_FCreatureUnitConfig;
    UPROPERTY()
    FDataObjectPtr m_Role;
    UPROPERTY()
    FDataObjectPtr m_PresentationConfig;
    UPROPERTY()
    FDataObjectPtr m_SkinOverride;
    UPROPERTY()
    FDataObjectPtr m_DailyRouteConfig;
    UPROPERTY()
    ENPCCombatPriority CombatPriority = ENPCCombatPriority(0);
    UPROPERTY()
    bool bShowInWorldMap;
    UPROPERTY()
    FVector2D WorldMapFixedPosition = FVector2D(0.0, 0.0);
    UPROPERTY()
    FDataObjectPtr m_WorldMapRegion;
    UPROPERTY()
    TArray<FNPCComponentSwitchOverride> ComponentSwitchOverrides;


    FText GetNpcName() const
    {
        FText __return;
        if (this.GetPresentationConfig().IsSet())
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    const TDataObjectPtr<FNPCRoleConfig> GetRole() const property
    {
        const TDataObjectPtr<FNPCRoleConfig> __r;
        return __r;
    }
    void SetRole(const TDataObjectPtr<FNPCRoleConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FNPCRoleConfig>> local_2;
        this.m_Role = local_2;
        return;
    }
    TDataObjectPtr<FNPCPresentationConfig> GetPresentationConfig() const property
    {
        TDataObjectPtr<FNPCPresentationConfig> __r;
        return __r;
    }
    void SetPresentationConfig(const TDataObjectPtr<FNPCPresentationConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FNPCPresentationConfig>> local_2;
        this.m_PresentationConfig = local_2;
        return;
    }
    const TDataObjectPtr<FNPCSkinOverride> GetSkinOverride() const property
    {
        const TDataObjectPtr<FNPCSkinOverride> __r;
        return __r;
    }
    void SetSkinOverride(const TDataObjectPtr<FNPCSkinOverride> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FNPCSkinOverride>> local_2;
        this.m_SkinOverride = local_2;
        return;
    }
    const TDataObjectPtr<FNPCDailyRouteConfig> GetDailyRouteConfig() const property
    {
        const TDataObjectPtr<FNPCDailyRouteConfig> __r;
        return __r;
    }
    void SetDailyRouteConfig(const TDataObjectPtr<FNPCDailyRouteConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FNPCDailyRouteConfig>> local_2;
        this.m_DailyRouteConfig = local_2;
        return;
    }
    const TDataObjectPtr<FLevelInfoConfig> GetWorldMapRegion() const property
    {
        const TDataObjectPtr<FLevelInfoConfig> __r;
        return __r;
    }
    void SetWorldMapRegion(const TDataObjectPtr<FLevelInfoConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FLevelInfoConfig>> local_2;
        this.m_WorldMapRegion = local_2;
        return;
    }
}

struct FNPCBaseConfig : FCombatUnitBaseConfig
{
    FCombatUnitBaseConfig _base_FCombatUnitBaseConfig;

    FNPCBaseConfig()
    {
        super();
        return;
    }
}


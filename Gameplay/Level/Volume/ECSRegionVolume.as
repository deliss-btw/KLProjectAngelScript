

// NOTE: class defaults are not authored in this module: AECSRegionVolume (default scalar field AECSVolumeBase.bServerOnly has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FRegionVolumeUnitConfig : FSceneUnitConfigWithJsonData
{
    FSceneUnitConfigWithJsonData _base_FSceneUnitConfigWithJsonData;
    UPROPERTY()
    TDataObjectPtr<FWorldAreaConfig> AreaConfig;
    UPROPERTY()
    bool bAffectWeather = false;


}

class AECSRegionVolume : AECSRegionVolumeBase
{
    UPROPERTY()
    EESMBlackboardConditionTagQueryType CheckTagCondition = EESMBlackboardConditionTagQueryType(0);
    UPROPERTY()
    FGameplayTagContainer CheckTags;
    UPROPERTY()
    TDataObjectPtr<FWorldAreaConfig> AreaConfig;
    UPROPERTY()
    bool bAffectWeather = false;
    UPROPERTY()
    int WeatherPriority = -1;
    UPROPERTY()
    TDataObjectPtr<FWeatherGenerateTemplate> WeatherTemplate;
    UPROPERTY()
    bool bAffectAudio = false;
    UPROPERTY()
    int AudioPriority = -1;
    UPROPERTY()
    FDataObjectPtr AudioTemplate;
    UPROPERTY()
    FOnWeatherChanged OnRegionWeatherChanged;
    UPROPERTY()
    bool bAffectMovment = false;
    UPROPERTY()
    bool bOverrideWallRun = false;
    UPROPERTY()
    bool bEnableWallRun = false;
    UPROPERTY()
    bool bOverrideVaultOver = false;
    UPROPERTY()
    bool bEnableVaultOver = false;
    UPROPERTY()
    bool bOverrideUpstair = false;
    UPROPERTY()
    bool bEnableUpstair = false;
    UPROPERTY()
    bool bMutePreventEdgeFalling = false;
    UPROPERTY()
    bool bAffectMount = false;
    UPROPERTY()
    bool bAllowMount = false;
    UPROPERTY()
    bool bAffectCombat = false;
    UPROPERTY()
    bool bSafeZone = false;
    UPROPERTY()
    bool bRemoveTemporarySkillOnLeave = false;
    UPROPERTY()
    TSet<TSoftObjectPtr<USkillConfig>> RemoveTemporarySkills;
    UPROPERTY()
    bool bAffectDSTransit = false;
    UPROPERTY()
    bool bAffectAINavigation = false;
    UPROPERTY()
    FNavZoneConfig BakedNavZoneConfig;
    int RegisteredNavZoneId = -1;
    FBoxSphereBounds CachedBounds;
    bool bCachedBounds = false;


    UFUNCTION()
    bool ShouldCreateDynamicEntity_Implementation()
    {
        return (this.bAffectWeather || this.bAffectAudio) || this.bAffectCombat;
    }
    UFUNCTION()
    void BeginPlay_Implementation()
    {
        if (this.bAffectAINavigation && (this.BakedNavZoneConfig.Portals.Num() > 0))
        {
            this.RegisteredNavZoneId = FAINavZoneUtils::RegisterNavZoneWithVolume(this.GetWorld(), this.BakedNavZoneConfig, this);
        }
        return;
    }
    UFUNCTION()
    void EndPlay_Implementation(const EEndPlayReason EndPlayReason)
    {
        if (this.RegisteredNavZoneId >= 0)
        {
            FAINavZoneUtils::UnregisterNavZone(this.GetWorld(), this.RegisteredNavZoneId);
            this.RegisteredNavZoneId = -1;
        }
        return;
    }
    UFUNCTION()
    bool CheckShouldOverlapEntity_Implementation(const FECSContext &inout Context, const FECSEntity &inout Entity) const
    {
        if (!(this.CheckTags.IsEmpty()))
        {
            if (int(this.CheckTagCondition) == 0)
            {
                return Entity.MatchAnyGameplayTags(this.CheckTags);
            }
            if (int(this.CheckTagCondition) == 2)
            {
                return !(Entity.MatchAnyGameplayTags(this.CheckTags));
            }
        }
        return true;
    }
    UFUNCTION()
    void OnPlayerControllerEntityBeginOverlap_Implementation(const FECSContext &inout Context, const FECSEntity &inout PlayerControllerEntity)
    {
        if (this.bSafeZone)
        {
            Get local_6;
            if (local_6.opCall())
            {
                UCombatGlobalSettings local_12 = ::UCombatGlobalSettings::Get();
                ECS::GetContextTime();
            }
        }
        return;
    }
    UFUNCTION()
    void OnPlayerControllerEntityEndOverlap_Implementation(const FECSContext &inout Context, const FECSEntity &inout PlayerControllerEntity)
    {
        if (this.bSafeZone)
        {
            Get local_6;
            if (local_6.opCall())
            {
                UCombatGlobalSettings local_12 = ::UCombatGlobalSettings::Get();
                ECS::GetContextTime();
            }
        }
        return;
    }
    UFUNCTION()
    void OnEntityBeginOverlap_Implementation(const FECSContext &inout Context, const FECSEntity &inout Entity)
    {
        Has local_26;
        int local_34 = 0;
        int local_40 = 0;
        if (Context.Runtime.IsServer)
        {
            if (this.bAffectMovment)
            {
                Modify local_6;
                FC_CharacterVaulting& local_8 = local_6.opCall();
                if (local_8)
                {
                    if (this.bOverrideWallRun)
                    {
                        local_8.OverrideEnableWallRun(this.bEnableWallRun);
                    }
                    if (this.bOverrideVaultOver)
                    {
                        local_8.OverrideEnableVaultOver(this.bEnableVaultOver);
                    }
                    if (this.bOverrideUpstair)
                    {
                        local_8.OverrideEnableMoveUpstairs(this.bEnableUpstair);
                    }
                }
                if (this.bMutePreventEdgeFalling)
                {
                    Modify local_12;
                    FC_CharacterMovement& local_14 = local_12.opCall();
                    if (local_14)
                    {
                        local_14.SetMutePreventEdgeFalling((local_14.GetMutePreventEdgeFalling() + 1));
                    }
                }
            }
            if (this.bAffectCombat)
            {
                Modify local_20;
                FC_AIKnowledge& local_22 = local_20.opCall();
                if (local_22)
                {
                    local_22.bIsInCombatArea = true;
                }
                if (!(local_26.opCall()))
                {
                    FFPTime local_32 = FFPTime(-1);
                    local_34.CombatAreaEntity = this.GetRegionEntity();
                }
                else
                {
                    FFPTime local_32_2 = FFPTime(-1);
                    local_40.CombatAreaEntity = this.GetRegionEntity();
                }
            }
            if (this.bSafeZone && !(local_26.opCall()))
            {
                FBuffUtils::AddBuff(Entity, ::UCombatGlobalSettings::Get().SafeZoneBuff, ECS::GetContextTime(), ENTITY_NULL, false, -1.0f, 1, false);
            }
            if ((this.bAffectMount && !(this.bAllowMount)))
            {
                ModifyOrAdd local_56;
                local_56.opCall().SetbIsDisallowed(true);
            }
        }
        return;
    }
    UFUNCTION()
    void OnEntityEndOverlap_Implementation(const FECSContext &inout Context, const FECSEntity &inout Entity)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    int GetWeatherPriority() const
    {
        int local_1 = this.WeatherPriority;
        if (local_1 >= 0)
        {
        }
        else
        {
        }
        return local_1;
    }
    int GetAudioPriority() const
    {
        int local_1 = this.AudioPriority;
        if (local_1 >= 0)
        {
        }
        else
        {
        }
        return local_1;
    }
    FBoxSphereBounds GetVolumeBoundsWithCache()
    {
        if (!(this.bCachedBounds))
        {
            this.bCachedBounds = true;
            this.CachedBounds = this.GetBounds();
        }
        return this.CachedBounds;
    }
    bool QuickEncompassesPoint(const FVector &inout Point)
    {
        if (!(this.GetVolumeBoundsWithCache().GetBox().IsInside(Point)))
        {
            return false;
        }
        return this.EncompassesPoint(Point, 0.0f);
    }
}

event void FOnWeatherChanged(const FName &inout PrevWeatherName, const FName &inout NewWeatherName);


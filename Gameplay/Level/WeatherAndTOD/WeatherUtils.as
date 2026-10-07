
namespace FWeatherUtils
{
FName GetWeatherNameFromRegionVolume(const AECSRegionVolume RegionVolume = nullptr)
{
    FECSEntity local_8 = FWeatherUtils::GetWeatherRegionEntity(RegionVolume);
    if (local_8.IsValid())
    {
        return FWeatherUtils::GetWeatherNameFromRegionEntity(local_8);
    }
    return NAME_None;
}
FName GetWeatherNameFromRegionEntity(const FECSEntity &inout RegionEntity)
{
    bool local_1;
    int local_14 = 0;
    if (!(RegionEntity.IsValid()))
    {
        local_1 = false;
    }
    else
    {
        Has local_6;
        local_1 = local_6.opCall();
    }
    if (local_1)
    {
        if (local_14.IsValid())
        {
            GetDefaulted local_18;
            TDataObjectPtr<FWeatherConfig> local_42 = local_18.opCall().GetWeatherConfig();
            FName local_70;
            if (local_42.IsSet())
            {
                local_70 = local_42.GetDataName();
            }
            else
            {
                local_70 = NAME_None;
            }
            return local_70;
        }
    }
    return NAME_None;
}
TDataObjectPtr<FWeatherConfig> GetWeatherConfig(const FName &inout WeatherName)
{
    UDataTable local_276;
    FWeatherConfig local_272;
    if (local_276.FindRow(WeatherName, local_272))
    {
        return TDataObjectPtr<FWeatherConfig>();
    }
    return TDataObjectPtr<FWeatherConfig>(nullptr);
}
void SetWeatherPausedByRegionEntity(const FECSEntity &inout RegionEntity, const bool bPaused)
{
    if (RegionEntity.IsValid())
    {
        if (bPaused)
        {
            FC_WeatherUpdatePausedTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
            return;
        }
        Remove local_12;
        local_12.opCall();
    }
    return;
}
void OverrideRegionWeatherByRegionEntity(const FECSEntity &inout RegionEntity, const TDataObjectPtr<FWeatherConfig> &inout WeatherConfig, const float32 InDuration = -1.f, const float32 ArtWeatherBlendTime = -1.f)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if ((RegionEntity == ENTITY_NULL) || !(WeatherConfig.IsSet()))
    {
        return;
    }
    FC_RuntimeOverrideRegionWeather local_8;
    local_8.WeatherConfig = WeatherConfig;
    local_8.Duration = InDuration;
    local_8.ArtWeatherBlendTime = ArtWeatherBlendTime;
    FECSWorldPtr local_34 = ECS::GetECSWorld();
    Get local_38;
    GetDefaulted local_42;
    FWeatherUtils::ChangeRegionWeather(RegionEntity, WeatherConfig, local_42.opCall().GetUsingWeatherTemplate(), InDuration, local_38.opCall().Time);
    FString local_74 = ((FString("OverrideRegionWeatherByRegionEntity success RegionEntity:") + RegionEntity) + " WeatherName:");
    FString local_78_2 = (local_74 + WeatherConfig.GetDataName());
    FString local_74_2 = (local_78_2 + " Duration:");
    FWeatherUtils::DebugWeatherLog((local_74_2 + InDuration));
    return;
}
void OverrideRegionVolumeWeather(const TDataObjectPtr<FWeatherConfig> &inout WeatherConfig, const AECSRegionVolume RegionVolume = nullptr, const float32 Duration = -1.f, const float32 ArtWeatherBlendTime = -1.f)
{
    FString local_12 = (FString("OverrideRegionVolumeWeather ") + WeatherConfig.ToString());
    FString local_12_2 = (((local_12 + " ") + Duration) + " ");
    FWeatherUtils::DebugWeatherLog((local_12_2 + RegionVolume));
    FECSEntity local_16 = FWeatherUtils::GetWeatherRegionEntity(RegionVolume);
    if ((!((local_16 == ENTITY_NULL))))
    {
        FWeatherUtils::OverrideRegionWeatherByRegionEntity(local_16, WeatherConfig, Duration, ArtWeatherBlendTime);
    }
    else
    {
        XWarning(ELog(0), "OverrideRegionVolumeWeather Failed, RegionEntity is null");
    }
    return;
}
void RestoreRegionWeatherOverrideByVolume(const AECSRegionVolume RegionVolume = nullptr)
{
    FWeatherUtils::DebugWeatherLog((FString("RestoreRegionWeatherByVolume:") + RegionVolume));
    FECSEntity local_12 = FWeatherUtils::GetWeatherRegionEntity(RegionVolume);
    if ((!((local_12 == ENTITY_NULL))))
    {
        FWeatherUtils::RestoreRegionWeatherOverrideByRegionEntity(local_12);
    }
    else
    {
        XWarning(ELog(0), "RestoreRegionWeatherByVolume Failed, RegionEntity is null");
    }
    return;
}
void RestoreRegionWeatherOverrideByRegionEntity(const FECSEntity &inout RegionEntity)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if ((RegionEntity == ENTITY_NULL))
    {
        return;
    }
    bool local_2 = false;
    Has local_6;
    if (local_6.opCall())
    {
        local_2 = true;
        Remove local_10;
        local_10.opCall();
        FWeatherUtils::DebugWeatherLog((FString("RestoreRegionWeatherOverrideByRegionEntity Begin RegionEntity:") + RegionEntity));
    }
    Modify local_22;
    FC_RegionWeatherData& local_24 = local_22.opCall();
    if (local_24)
    {
        if (local_2)
        {
            Get local_108;
            TDataObjectPtr<FWeatherConfig> local_48 = TDataObjectPtr<FWeatherConfig>(nullptr);
            if (local_24.GetWeatherEntity().IsValid())
            {
                Get local_100;
                local_48 = local_100.opCall().GetWeatherConfig();
            }
            FECSWorldPtr local_104 = ECS::GetECSWorld();
            if (FWeatherUtils::GetRandomWeatherIndexForRegion(RegionEntity, local_24.GetUsingWeatherTemplate(), local_48, local_108.opCall().Time) >= 0)
            {
                FWeatherChanceConfig local_136;
                TDataObjectPtr<FWeatherGenerateTemplate> local_132 = local_24.GetUsingWeatherTemplate();
                float32 local_140 = FMath::RandRange(local_136.MinDuration, local_136.MaxDuration);
                FECSWorldPtr local_104_2 = ECS::GetECSWorld();
                FWeatherUtils::ChangeRegionWeather(RegionEntity, local_136.WeatherName, local_24.GetUsingWeatherTemplate(), local_140, local_108.opCall().Time);
                FString local_14_2 = (((FString("RestoreRegionWeatherOverrideByRegionEntity success RegionEntity:") + RegionEntity) + " NewWeatherEntity:") + local_24.GetWeatherEntity());
                FString local_18_2 = (local_14_2 + " NewWeatherConfig:");
                FWeatherUtils::DebugWeatherLog((local_18_2 + local_136.WeatherName));
            }
            else
            {
                FString local_14_3 = (FString("RestoreRegionWeatherOverrideByRegionEntity failed, RegionEntity:") + RegionEntity);
                FString local_18_3 = (local_14_3 + " keep PrevWeatherEntity:");
                FString local_14_4 = (local_18_3 + local_24.GetWeatherEntity());
                FWeatherUtils::DebugWeatherLog(local_14_4);
            }
            return;
        }
        FWeatherUtils::DebugWeatherLog((FString("RestoreRegionWeatherOverrideByRegionEntity skip, RegionWeatherData is not override weather:") + RegionEntity));
    }
    return;
}
void OverrideRegionWeatherTemplateByVolume(const TDataObjectPtr<FWeatherGenerateTemplate> &inout WeatherTemplate, const AECSRegionVolume RegionVolume = nullptr)
{
    FString local_4 = ((FString("OverrideRegionWeatherTemplateByVolume ") + WeatherTemplate.GetDataName()) + " ");
    FWeatherUtils::DebugWeatherLog((local_4 + RegionVolume));
    FECSEntity local_14 = FWeatherUtils::GetWeatherRegionEntity(RegionVolume);
    if ((!((local_14 == ENTITY_NULL))))
    {
        FWeatherUtils::OverrideRegionWeatherTemplateByRegionEntity(WeatherTemplate, local_14);
    }
    else
    {
        XWarning(ELog(0), "OverrideRegionWeatherTemplateByVolume Failed, RegionEntity is null");
    }
    return;
}
void OverrideRegionWeatherTemplateByRegionEntity(const TDataObjectPtr<FWeatherGenerateTemplate> &inout WeatherTemplate, const FECSEntity &inout RegionEntity)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if ((RegionEntity == ENTITY_NULL))
    {
        return;
    }
    ModifyOrAdd local_6;
    FC_RegionWeatherData& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.SetRuntimeOverrideWeatherTemplate(WeatherTemplate);
        FString local_12 = ((FString("OverrideRegionWeatherTemplateByRegionEntity success OverrideTemplateName:") + WeatherTemplate.GetDataName()) + " RegionEntity:");
        FWeatherUtils::DebugWeatherLog((local_12 + RegionEntity));
    }
    return;
}
void RestoreRegionWeatherTemplateByVolume(const AECSRegionVolume RegionVolume = nullptr)
{
    FWeatherUtils::DebugWeatherLog((FString("RestoreRegionWeatherTemplateByVolume:") + RegionVolume));
    FECSEntity local_12 = FWeatherUtils::GetWeatherRegionEntity(RegionVolume);
    if ((!((local_12 == ENTITY_NULL))))
    {
        FWeatherUtils::RestoreRegionWeatherTemplateByRegionEntity(local_12);
    }
    else
    {
        XWarning(ELog(0), "RestoreRegionWeatherTemplateByVolume Failed, RegionEntity is null");
    }
    return;
}
void RestoreRegionWeatherTemplateByRegionEntity(const FECSEntity &inout RegionEntity)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if ((RegionEntity == ENTITY_NULL))
    {
        return;
    }
    Modify local_6;
    FC_RegionWeatherData& local_8 = local_6.opCall();
    if (local_8)
    {
        FString local_12 = ((FString("RestoreRegionWeatherTemplateByRegionEntity success OverrideTemplateName:") + local_8.GetRuntimeOverrideWeatherTemplate().GetDataName()) + " RegionEntity:");
        FWeatherUtils::DebugWeatherLog((local_12 + RegionEntity));
        local_8.SetRuntimeOverrideWeatherTemplate(TDataObjectPtr<FWeatherGenerateTemplate>(nullptr));
    }
    return;
}
FECSEntity GetWeatherRegionEntity(const AECSRegionVolume RegionVolume = nullptr)
{
    if ((!((RegionVolume != nullptr))))
    {
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        GetDefaulted local_8;
        return local_8.opCall().GetRegionEntity();
    }
    if (!(RegionVolume.bAffectWeather))
    {
        return ENTITY_NULL;
    }
    return RegionVolume.GetRegionEntity();
}
FECSEntity GetWeatherRegionEntityByPath(const FName &inout BPPathName)
{
    if ((BPPathName == NAME_None))
    {
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        GetDefaulted local_8;
        return local_8.opCall().GetRegionEntity();
    }
    FECSRuntimeView local_46 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
    Include local_50;
    local_50.opCall();
    Include local_54;
    local_54.opCall();
    FECSRuntimeViewIterator local_88 = local_46.Iterator();
    Get local_128;
    for (; local_88.CanProceed;)
    {
        const FECSEntity& local_124 = local_88.Proceed();
        if ((local_128.opCall().GetBPPathName() == BPPathName))
        {
            return FECSEntity(local_124);
        }
    }
    return ENTITY_NULL;
}
FECSEntity GetWeatherRegionEntityBySoftPtr(const TSoftObjectPtr<AECSRegionVolume> &inout SoftPtr)
{
    if (SoftPtr.IsNull())
    {
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        GetDefaulted local_8;
        return local_8.opCall().GetRegionEntity();
    }
    FName local_24 = FName(SoftPtr.ToSoftObjectPath().ToString());
    return FWeatherUtils::GetWeatherRegionEntityByPath(local_24);
}
FECSEntity CreateDynamicWeatherTintEntity(const TSubclassOf<ADynamicWeatherTintPrefab> &inout Prefab, const FECSEntity &inout SourceEntity, const FVector &inout Location, const FRotator &inout Rotation)
{
    int local_50 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return ENTITY_NULL;
    }
    FECSEntity local_8 = ECS::RequestEntityByPrefabDeferred(Prefab, Location, Rotation, EPrefabCollisionAlignment(2), EECSRegType(0), false);
    ADynamicWeatherTintPrefab local_14 = Prefab.GetDefaultObject();
    FC_DynamicWeatherTintConfig local_16;
    FECSEntity local_12 = FWeatherUtils::CreateWeatherEntity(local_16.WeatherName, TDataObjectPtr<FWeatherGenerateTemplate>(nullptr), local_8);
    local_50.SetWeatherEntity(local_12);
    local_50.SetSourceEntity(SourceEntity);
    FString local_54 = ((FString("CreateDynamicWeatherTintEntity:") + local_8) + " WeatherEntity:");
    FString local_58_2 = (local_54 + local_12);
    FString local_54_2 = (local_58_2 + " SourceEntity:");
    FWeatherUtils::DebugWeatherLog((local_54_2 + SourceEntity));
    return local_8;
}
void DestroyDynamicWeatherTintEntity(const FECSEntity &inout TintEntity)
{
    int local_22 = 0;
    int local_32 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    int local_2 = TintEntity.GetIdValue();
    FString local_6 = ((FString("DestroyDynamicWeatherTintEntity:") + local_2) + "  valid?");
    FWeatherUtils::DebugWeatherLog((local_6 + TintEntity.IsValid()));
    if (!(TintEntity.IsValid()))
    {
        return;
    }
    FFPTime local_18 = FFPTime(-1);
    FECSWorldPtr local_12 = ECS::GetECSWorld();
    local_22.Entity = TintEntity;
    Has local_26;
    bool local_1 = local_26.opCall();
    if (local_1)
    {
        if ((!((FECSEntity(local_32.GetWeatherEntity()) == ENTITY_NULL))))
        {
            FC_WeatherPendingDestroyTag local_42;
            Assign local_40;
            local_40.opCall(local_42);
        }
    }
    return;
}
FECSEntity GetCharacterRegionEntity(const FECSEntity &inout CharacterEntity)
{
    if (!(CharacterEntity.IsValid()))
    {
        return ENTITY_NULL;
    }
    Get local_6;
    const FC_CharacterWeatherRegionEntity& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.GetRegionEntity();
    }
    return ENTITY_NULL;
}
TDataObjectPtr<FWorldAreaConfig> GetWorldAreaConfigFromRegionEntity(const FECSEntity &inout RegionEntity)
{
    if (!(RegionEntity.IsValid()))
    {
        return TDataObjectPtr<FWorldAreaConfig>(nullptr);
    }
    Get local_54;
    const FC_RegionWorldAreaConfig& local_56 = local_54.opCall();
    if (local_56)
    {
        return local_56.GetWorldAreaConfig();
    }
    return TDataObjectPtr<FWorldAreaConfig>(nullptr);
}
void BuildWeatherInitConfigFromCommission(FCS_WeatherInitConfig &inout Config)
{
    FName local_44;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_8;
    const FCS_CommissionDSGlobalInfo& local_10 = local_8.opCall();
    if (local_10)
    {
        if (local_10.SpawnAreaConfig.IsSet() && local_10.StartWeatherConfig.IsSet())
        {
            Config.AreaOverrides.FindOrAdd(local_10.SpawnAreaConfig).StartWeatherConfig = local_10.StartWeatherConfig;
            FString local_42 = "BuildWeatherInitConfig Commission: StartWeather for area:";
            local_44.GetDataName();
            FString local_42_2 = ((local_42 + local_44) + " Weather:");
            local_44 = local_10.StartWeatherConfig.GetDataName();
            FWeatherUtils::DebugWeatherLog((local_42_2 + local_44));
        }
        for (auto& local_66 : local_10.WeatherTemplateMap)
        {
            FWeatherInitOverrideEntry& local_14_2 = Config.AreaOverrides.FindOrAdd(local_66.GetKey());
            TDataObjectPtr<FWeatherGenerateTemplate> local_90;
            local_14_2.WeatherTemplate = local_90;
            FString local_42_3 = "BuildWeatherInitConfig Commission: WeatherTemplate for area:";
            local_44.GetDataName();
            FString local_48_2 = (local_42_3 + local_44);
            local_42_3 = (local_48_2 + " Template:");
            local_44.GetDataName();
            FWeatherUtils::DebugWeatherLog((local_42_3 + local_44));
        }
    }
    return;
}
void BuildWeatherInitConfigFromOverride(FCS_WeatherInitConfig &inout Config, const TDataObjectPtr<FAreaWeatherTemplateConfig> &inout WeatherAreaTemplate)
{
    bool local_21 = false;
    FName local_54;
    if (!(WeatherAreaTemplate.IsSet()))
    {
        return;
    }
    for (auto& local_20 : GetWeatherTemplateByRegion())
    {
        bool local_1 = !(local_20.GetKey().IsSet());
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            local_21 = !local_21;
            local_1 = local_21;
        }
        if (local_1)
        {
            continue;
        }
        Config.AreaOverrides.FindOrAdd(local_20.GetKey());
        FString local_52 = "BuildWeatherInitConfig Override: area:";
        local_54.GetDataName();
        local_52 = ((local_52 + local_54) + " Template:");
        FWeatherUtils::DebugWeatherLog((local_52 + local_54));
    }
    return;
}
void InitWeatherForRegion(const FECSEntity &inout RegionEntity, const TDataObjectPtr<FWeatherGenerateTemplate> &inout WeatherTemplate)
{
    int local_56 = 0;
    TDataObjectPtr<FWeatherGenerateTemplate> local_24 = WeatherTemplate;
    FECSWorldPtr local_50 = ECS::GetECSWorld();
    TDataObjectPtr<FWeatherConfig> local_80 = TDataObjectPtr<FWeatherConfig>(nullptr);
    Get local_132;
    const FC_RegionWeatherInitOverride& local_134 = local_132.opCall();
    if (local_134)
    {
        if (local_134.WeatherTemplate.IsSet())
        {
            local_24 = local_134.WeatherTemplate;
        }
        local_80 = local_134.StartWeatherConfig;
    }
    if (!(local_24))
    {
        XWarning(ELog(0), (FString("InitWeatherListForRegion: WeatherGenerateTemplate is null, RegionEntity:") + RegionEntity));
        return;
    }
    if (local_80.IsSet())
    {
        const FWeatherChanceConfig& local_154;
        if (local_80.GetWeatherChanceConfigIndex() < 0)
        {
            FName local_151;
            local_151.GetDataName();
            XError(ELog(44), FString().Append("StartWeatherConfig ").Append(local_80.GetDataName()).Append(" not found in WeatherTemplate: ").Append(local_151).Append(", Region:").Append(RegionEntity).Append(" !"));
            return;
        }
        FWeatherUtils::CreateNewWeatherForRegion(RegionEntity, local_80, local_24, FMath::RandRange(local_154.MinDuration, local_154.MaxDuration), local_56.Time);
        return;
    }
    if (FWeatherUtils::GetRandomWeatherIndexForRegion(RegionEntity, local_24, (TDataObjectPtr<FWeatherConfig>(nullptr)), local_56.Time) >= 0)
    {
        const FWeatherChanceConfig& local_154;
        FWeatherUtils::CreateNewWeatherForRegion(RegionEntity, local_154.WeatherName, local_24, FMath::RandRange(local_154.MinDuration, local_154.MaxDuration), local_56.Time);
    }
    return;
}
FECSEntity ChangeRegionWeather(const FECSEntity &inout RegionEntity, const TDataObjectPtr<FWeatherConfig> &inout WeatherConfig, const TDataObjectPtr<FWeatherGenerateTemplate> &inout WeatherTemplate, const float32 Duration, const FFPTime &inout TimeStamp)
{
    if (!(RegionEntity.IsValid()) || !(WeatherConfig.IsSet()))
    {
        return ENTITY_NULL;
    }
    TDataObjectPtr<FWeatherConfig> local_26 = TDataObjectPtr<FWeatherConfig>(nullptr);
    Get local_78;
    const FC_RegionWeatherData& local_80 = local_78.opCall();
    if (local_80)
    {
        if (local_80.GetWeatherEntity().IsValid())
        {
            Get local_84;
            local_26 = local_84.opCall().GetWeatherConfig();
        }
    }
    if ((WeatherConfig == local_26.opImplConv()))
    {
        local_80.SetDuration(Duration);
        local_80.SetElapsedTime(0.0f);
        local_80.SetUpdatedTimeStamp(TimeStamp);
        local_80.SetWeatherTemplate(WeatherTemplate);
        FString local_118 = ((FString("ChangeRegionWeather same weather, reset timers: Region:") + RegionEntity) + " Weather:");
        FString local_122_2 = (local_118 + WeatherConfig.GetDataName());
        FString local_118_2 = (local_122_2 + " Duration:");
        FWeatherUtils::DebugWeatherLog((local_118_2 + Duration));
        return local_80.GetWeatherEntity();
    }
    return FWeatherUtils::CreateNewWeatherForRegion(RegionEntity, WeatherConfig, WeatherTemplate, Duration, TimeStamp);
}
FECSEntity CreateNewWeatherForRegion(const FECSEntity &inout RegionEntity, const TDataObjectPtr<FWeatherConfig> &inout WeatherConfig, const TDataObjectPtr<FWeatherGenerateTemplate> &inout WeatherTemplate, const float32 Duration, const FFPTime &inout TimeStamp)
{
    if (!(RegionEntity.IsValid()))
    {
        return ENTITY_NULL;
    }
    FECSEntity local_6 = FECSEntity(ENTITY_NULL);
    TDataObjectPtr<FWeatherConfig> local_30 = TDataObjectPtr<FWeatherConfig>(nullptr);
    Get local_82;
    FC_RegionWeatherData local_84 = local_82.opCall();
    if (local_84)
    {
        local_6 = local_84.GetWeatherEntity();
    }
    ModifyOrAdd local_88;
    FC_RegionWeatherData local_84_2 = local_88.opCall();
    if (local_84_2)
    {
        FECSEntity local_92 = FWeatherUtils::CreateWeatherEntity(WeatherConfig, WeatherTemplate, RegionEntity);
        local_84_2.SetWeatherEntity(local_92);
        local_84_2.SetUpdatedTimeStamp(TimeStamp);
        local_84_2.SetDuration(Duration);
        local_84_2.SetElapsedTime(0.0f);
        local_84_2.SetWeatherTemplate(WeatherTemplate);
        if (local_92.IsValid())
        {
            FString local_106_2 = (((FString(" CreateNewWeatherForRegion ") + RegionEntity) + " PrevWeatherEntity: ") + local_6);
            FString local_102_2 = (local_106_2 + "  NewWeatherEntity: ");
            FWeatherUtils::DebugWeatherLog((local_102_2 + local_92));
            if (local_6.IsValid())
            {
                FC_WeatherPendingDestroyTag local_112;
                Assign local_110;
                local_110.opCall(local_112);
                Get local_116;
                local_30 = local_116.opCall().GetWeatherConfig();
            }
            FWeatherUtils::SendRegionWeatherChangedEvent(RegionEntity, local_30, WeatherConfig, local_92);
        }
        else
        {
            FString local_102_3 = (FString("Failed to create weather entity for ") + RegionEntity);
            FString local_106_3 = (local_102_3 + " NewWeatherConfig: ");
            XWarning(ELog(44), (local_106_3 + WeatherConfig.GetDataName()));
        }
        Get local_124;
        const FC_RegionOverlappingEntities& local_126 = local_124.opCall();
        if (local_126)
        {
            for (auto& local_140 : local_126.OverlappingEntities)
            {
                FWeatherUtils::CheckAssignCharacterNeedUpdateWeatherTag(local_140);
            }
        }
        return local_84_2.GetWeatherEntity();
    }
    return ENTITY_NULL;
}
int GetRandomWeatherIndexForRegion(const FECSEntity &inout RegionEntity, const TDataObjectPtr<FWeatherGenerateTemplate> &inout WeatherTemplate, const TDataObjectPtr<FWeatherConfig> &inout CurrentWeatherConfig, const FFPTime &inout TimeStamp)
{
    int local_2 = 0;
    int local_10 = 0;
    const FWeatherChanceConfig& local_12;
    if (!(RegionEntity.IsValid()))
    {
        return -1;
    }
    if (!(WeatherTemplate.IsSet()))
    {
        return -1;
    }
    TArray<int> local_6;
    int local_7 = 0;
    bool local_8 = false;
    int local_9 = 0;
    for (; local_9 < local_10; ++local_9)
    {
        TDataObjectPtr<FWeatherConfig> local_36;
        local_36 = local_12.WeatherName;
        if ((local_36 == CurrentWeatherConfig.opImplConv()))
        {
            local_8 = true;
            continue;
        }
        if (int(local_12.Weight) > 0)
        {
            local_6.Add(local_9);
            local_7 = local_7 + int(local_12.Weight);
        }
    }
    if (local_6.Num() == 0)
    {
        return local_8 ? 0 : -1;
    }
    local_10 = FMath::RandRange(1, local_7);
    for (auto local_100 : local_6)
    {
        int local_85 = int(local_100);
        local_10 = local_10 - local_2;
        if (local_10 <= 0)
        {
            return int(local_100);
        }
    }
    return -1;
}
void DestroyWeatherEntity(const FECSEntity &inout WeatherEntity)
{
    int local_12 = 0;
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        FAbilityUtils::RemoveAbility(local_12.GetEntity(), EEASAbilityEndType(0));
        local_12.GetEntity().DestroyDeferred();
    }
    FWeatherUtils::DebugWeatherLog((FString("DestroyWeatherEntity: ") + WeatherEntity));
    WeatherEntity.DestroyDeferred();
    return;
}
FECSEntity CreateWeatherEntity(const TDataObjectPtr<FWeatherConfig> &inout WeatherConfig, const TDataObjectPtr<FWeatherGenerateTemplate> &inout WeatherTemplate, const FECSEntity &inout SourceEntity)
{
    TSubclassOf<AECSPrefab> local_4;
    int local_36 = 0;
    int local_42 = 0;
    WeatherConfig.IsSet();
    if ((local_4 == nullptr))
    {
        XWarning(ELog(0), (FString("Weather Prefab is null ") + WeatherConfig.ToString()));
        return ENTITY_NULL;
    }
    FECSEntity local_26 = ECS::RequestEntityByPrefabDeferred(local_4, FVector::ZeroVector, FRotator::ZeroRotator, EPrefabCollisionAlignment(2), EECSRegType(0), false);
    local_36.SetWeatherTemplate(WeatherTemplate);
    local_36.SetWeatherConfig(WeatherConfig);
    local_36.SetSourceEntity(SourceEntity);
    FC_NeedUpdatedArtWeatherNameTag local_48;
    Assign local_46;
    local_46.opCall(local_48);
    FName local_52;
    if (WeatherTemplate.IsSet())
    {
        FName local_50;
        local_50.GetDataName();
        local_52 = local_50;
    }
    else
    {
        local_52 = NAME_None;
    }
    FString local_14 = (FString("Weather_") + WeatherConfig.GetDataName());
    FString local_14_2 = (((local_14 + "_") + local_52) + "_");
    int local_55 = local_26.GetIdValue();
    local_42.Name = FName((local_14_2 + local_55));
    FString local_10_2 = (FString("CreateWeatherEntity success: WeatherConfig:") + WeatherConfig.ToString());
    FString local_14_3 = (local_10_2 + " WeatherTemplate:");
    FString local_18_2 = (local_14_3 + local_52);
    FString local_10_3 = (local_18_2 + " WeatherEntity:");
    int local_55_2 = local_26.GetIdValue();
    FString local_18_3 = (local_10_3 + local_55_2);
    FString local_14_4 = (local_18_3 + " SourceEntity:");
    int local_55_3 = SourceEntity.GetIdValue();
    FWeatherUtils::DebugWeatherLog((local_14_4 + local_55_3));
    return local_26;
}
TArray<FECSEntity> GetWeatherRegionEntityListByAreaConfig(const TDataObjectPtr<FWorldAreaConfig> &inout AreaConfig)
{
    AECSRegionVolume local_26;
    const TArray<AECSRegionVolumeBase>& local_4 = ULevelActorManager::Get().GetRegionVolumes();
    TArray<FECSEntity> local_8;
    for (auto local_24 : local_4)
    {
        local_26 = Cast<AECSRegionVolume>(local_24);
        bool local_29 = local_26 != nullptr && local_26.bAffectWeather;
        if (!(local_29))
        {
            local_29 = false;
        }
        else
        {
            TDataObjectPtr<FWorldAreaConfig> local_54;
            local_54 = local_26.AreaConfig;
            local_29 = (local_54 == AreaConfig.opImplConv());
        }
        if (local_29)
        {
            local_8.Add(local_26.GetRegionEntity());
        }
    }
    AAS_ECSWorldSettings local_112 = (Cast<AAS_ECSWorldSettings>(ECS::GetUEWorld().GetWorldSettings()));
    if ((local_112 != nullptr && (local_112.GlobalWeatherAreaConfig == AreaConfig.opImplConv())))
    {
        FECSWorldPtr local_114 = ECS::GetECSWorld();
        GetDefaulted local_118;
        local_8.Add(local_118.opCall().GetRegionEntity());
    }
    return local_8;
}
FECSEntity GetHighestPriorityWeatherRegionEntityAtLocation(const FVector &inout Location)
{
    AECSRegionVolume local_28;
    int local_32;
    const TArray<AECSRegionVolumeBase>& local_4 = ULevelActorManager::Get().GetRegionVolumes();
    FECSEntity local_8 = FECSEntity(ENTITY_NULL);
    int local_9 = -1;
    for (auto local_26 : local_4)
    {
        local_28 = Cast<AECSRegionVolume>(local_26);
        local_32 = local_28 != nullptr ? local_28.GetWeatherPriority() : -1;
        if (local_28 != nullptr && local_28.bAffectWeather && (local_32 > local_9) && local_28.EncompassesPoint(Location, 0.0f))
        {
            local_8 = local_28.GetRegionEntity();
            local_9 = local_32;
        }
    }
    if ((local_8 == ENTITY_NULL))
    {
        FECSWorldPtr local_36 = ECS::GetECSWorld();
        GetDefaulted local_40;
        local_8 = local_40.opCall().GetRegionEntity();
    }
    return local_8;
}
void SendRegionWeatherChangedEvent(const FECSEntity &inout RegionEntity, const TDataObjectPtr<FWeatherConfig> &inout PrevWeatherConfig, const TDataObjectPtr<FWeatherConfig> &inout NewWeatherConfig, const FECSEntity &inout NewWeatherEntity)
{
    int local_10 = 0;
    FFPTime local_6 = FFPTime(-1);
    local_10.PrevWeatherConfig = PrevWeatherConfig;
    local_10.NewWeatherConfig = NewWeatherConfig;
    local_10.NewWeatherEntity = NewWeatherEntity;
    return;
}
void CheckAssignCharacterNeedUpdateWeatherTag(const FECSEntity &inout Entity)
{
    GetDefaulted local_4;
    bool local_9;
    if (!(FECSEntity(local_4.opCall().GetPlayerEntity()).IsValid()))
    {
        local_9 = false;
    }
    else
    {
        Has local_14;
        local_9 = local_14.opCall();
    }
    Get local_20;
    local_9 = local_9 && (FECSEntity(local_20.opCall().GetPlayerPawnEntity()) == Entity);
    if (local_9)
    {
        FC_CharacterNeedUpdateWeatherTag local_30;
        Assign local_28;
        local_28.opCall(local_30);
        FWeatherUtils::DebugWeatherLog((FString(" CheckAssignCharacterNeedUpdateWeatherTag: ") + Entity));
    }
    return;
}
void AddWeatherBuffToPlayer(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FWeatherConfig> &inout WeatherConfig, const FFPTime &inout TimeStamp)
{
    bool local_1 = false;
    bool local_2 = false;
    if (PlayerEntity.IsValid() && WeatherConfig.IsSet() && local_2)
    {
        FASCommonUtils::GetUniqueAvatarPawnEntity(PlayerEntity);
        local_2 = false;
        local_1 = false;
        if (GetBuffMessageHintConfig().IsSet())
        {
            MessageHintUtils::ShowMessageHint(PlayerEntity, GetBuffMessageHintConfig(), TArray<FTextArgument>());
        }
    }
    return;
}
void RemoveWeatherBuffFromPlayer(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FWeatherConfig> &inout WeatherConfig, const FFPTime &inout TimeStamp)
{
    bool local_2 = false;
    if (PlayerEntity.IsValid() && WeatherConfig.IsSet() && local_2)
    {
        FASCommonUtils::GetUniqueAvatarPawnEntity(PlayerEntity);
    }
    return;
}
void DebugWeatherLog(const FString &inout LogString)
{
    float32 local_4 = FTimeOfDayUtils::GetTimeOfDayInHoursClamp24(FTimeOfDayUtils::GetCurrentTimeOfDayInSeconds());
    ELog local_12;
    (FString(" DebugWeather: Time:") + local_12);
    FString local_8 = (local_12 + "(");
    (local_8 + int(local_12));
    FString local_8_2 = (local_12 + ")	 ");
    return;
}
int64 GetPlayerControllerWeatherDataId(const FECSEntity &inout PlayerEntity)
{
    bool local_1;
    if (!(PlayerEntity.IsValid()))
    {
        local_1 = false;
    }
    else
    {
        Has local_6;
        local_1 = local_6.opCall();
    }
    if (local_1)
    {
        Get local_12;
        return local_12.opCall().GetWeatherDataId();
    }
    return 0;
}
}

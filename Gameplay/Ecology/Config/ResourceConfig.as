

// NOTE: class defaults are not authored in this module: FSingleResourceConfig (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

struct FEcologyResourceSlotData
{
    UPROPERTY()
    FVector Position;
    UPROPERTY()
    FVector LookAt;
    UPROPERTY()
    FGameplayTag ActivityGameplayTag;

    FEcologyResourceSlotData()
    {
        return;
    }
}

struct FEcologyUserCondition
{
    UPROPERTY()
    bool bEnable = false;
    UPROPERTY()
    FGameplayTagContainer UserGameplayTagCondition;
    UPROPERTY()
    FKLGameplayTagQuery UserEcologyGameplayTagQuery;


    bool Enable() const
    {
        return this.bEnable && (!(this.UserGameplayTagCondition.IsEmpty()) || !(this.UserEcologyGameplayTagQuery.IsEmpty()));
    }
}

struct FEcologyDOTCondition
{
    UPROPERTY()
    bool bEnable = false;
    UPROPERTY()
    FKLGameplayTagQuery DOTConditionQuery;


    bool Enable() const
    {
        return this.bEnable && !(this.DOTConditionQuery.IsEmpty());
    }
}

struct FEcologyResourceConfig : FEcologyConfig
{
    FEcologyConfig _base_FEcologyConfig;
    UPROPERTY()
    bool bHighPriorityForSpawn = false;
    UPROPERTY()
    FEcologyDOTCondition DOTCondition;


}

struct FSingleResourceConfig : FEcologyResourceConfig
{
    FEcologyResourceConfig _base_FEcologyResourceConfig;
    UPROPERTY()
    TDataObjectPtr<FEcologyResourceDefinitionRow> ResourceType;
    UPROPERTY()
    int MaxTeamCount;
    UPROPERTY()
    TArray<FEcologyResourceSlotData> SlotData;
    UPROPERTY()
    FGameplayTagContainer InstanceGameplayTags;

    FSingleResourceConfig()
    {
        super();
        this.MaxTeamCount = 1;
        this.__InitDefaults();
        return;
    }
    FECSEntity GenerateRuntimeEntity_Implementation(const FEcologyConfigGenerateContext &inout Context) const
    {
        int local_148 = 0;
        int local_248 = 0;
        int local_250 = 0;
        int local_262 = 0;
        FECSEntity local_4 = FECSEntity(Context.OuterEntity);
        FECSEntity local_14 = ECS::GetECSWorld().Create(EECSRegType(2), EEntityType(10), n"EcologyResourceProvider");
        FConfigReference local_90 = FConfigReference(local_4.GetId());
        FC_EcologyResourceProviderSummary local_88;
        local_88.ResourceType = this.ResourceType;
        local_88.MaxTeamCount = this.MaxTeamCount;
        local_88.bHaveSlot = (this.SlotData.Num() > 0);
        local_88.bEnableDynamicSlot = true;
        local_88.bHighPriorityResource = this.bHighPriorityForSpawn;
        if (this.SlotData.Num() > 0)
        {
            local_148.SlotData = this.SlotData;
        }
        const FTransform& local_150 = Context.GetDefaultedTransform();
        local_14.InitTransform(local_150.GetLocation(), local_150.GetRotation());
        local_248.Append(this.InstanceGameplayTags);
        if (this.ResourceType)
        {
        }
        if (::FEcologyConditionUtils::SetupConditionComponent(local_14, this.DOTCondition))
        {
            FECSWorldPtr local_6 = ECS::GetECSWorld();
            ::FEcologyConditionUtils::UpdateEntityConditionResultAboutDOT(local_14, local_262, ::FEcologySceneInfoUtils::GetWeatherByPosition(local_250, local_150.GetLocation()), ::FEcologySceneInfoUtils::GetCurrentTimeSegments(local_250), ::FEcologyUtils::ModifyDataCacheContext(ECS::GetECSWorld()));
        }
        Assign local_266;
        local_266.opCall(FC_LocalTag());
        return local_14;
    }
}

struct FResourceAreaConfig : FEcologyResourceConfig
{
    FEcologyResourceConfig _base_FEcologyResourceConfig;
    UPROPERTY()
    TDataObjectPtr<FEcologyResourceDefinitionRow> ResourceType;
    UPROPERTY()
    FBox Volume;

    FResourceAreaConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
    FECSEntity GenerateRuntimeEntity_Implementation(const FEcologyConfigGenerateContext &inout Context) const
    {
        int local_88 = 0;
        FECSEntity local_4 = FECSEntity(Context.OuterEntity);
        FECSEntity local_14 = ECS::GetECSWorld().Create(EECSRegType(2), EEntityType(10), n"EcologyResourceProvider");
        FConfigReference local_90 = FConfigReference(local_4.GetId());
        local_88.ResourceType = this.ResourceType;
        local_88.Region = this.Volume;
        const FTransform& local_118 = Context.GetDefaultedTransform();
        local_14.InitTransform(local_118.GetLocation(), local_118.GetRotation());
        return local_14;
    }
}

struct FResourceRequestFilterConfig
{
    UPROPERTY()
    FVector Center;
    UPROPERTY()
    int SearchRadius = 1000;
    UPROPERTY()
    int MaxResultCount = 10;
    UPROPERTY()
    TSet<TDataObjectPtr<FEcologyResourceDefinitionRow>> IncludeResourceTypes;
    UPROPERTY()
    FGameplayTagQuery IncludeTagQuery;
    UPROPERTY()
    bool bUseRequesterPosition = false;
    UPROPERTY()
    bool bCheckSpaceCost = false;
    UPROPERTY()
    bool bIncludeClaimed = false;
    UPROPERTY()
    bool bUseEntitySpawnerVolume = true;
    UPROPERTY()
    bool bFilterByCreatureType = true;
    UPROPERTY()
    bool bUseRequesterEcologyInfo = false;
    UPROPERTY()
    bool bExcludeCurrentCombatArea = false;
    UPROPERTY()
    TDataObjectPtr<FEcologyCreatureDefinitionRow> CreatureRow;
    UPROPERTY()
    FName WeatherName;
    UPROPERTY()
    int TimeSegments = 0;


    void MakeRequest(const FECSEntity &inout Entity, FResourceSearchRequest &inout NewRequest) const
    {
        int local_50 = 0;
        AECSRegionVolume local_96;
        if (!(Entity.IsValid()))
        {
            return;
        }
        NewRequest.Requester = Entity.GetId();
        NewRequest.SearchRadius = this.SearchRadius;
        NewRequest.MaxResultCount = this.MaxResultCount;
        NewRequest.IncludeResourceTypes = this.IncludeResourceTypes;
        NewRequest.bCheckSpaceCost = this.bCheckSpaceCost;
        NewRequest.bIncludeClaimed = this.bIncludeClaimed;
        if (this.bUseRequesterPosition)
        {
            Get local_8;
            const FC_Transform& local_10 = local_8.opCall();
            if (local_10)
            {
                NewRequest.Center = local_10.GetPosition();
            }
        }
        else
        {
            NewRequest.Center = this;
        }
        if (this.bUseRequesterEcologyInfo)
        {
            Get local_14;
            const FC_EcologyFlockComponent& local_16 = local_14.opCall();
            if (local_16)
            {
                NewRequest.CreatureRow = local_16.FlockMainCreature;
            }
            else
            {
                Get local_44;
                const FC_CreatureMeta& local_46 = local_44.opCall();
                if (local_46)
                {
                    NewRequest.CreatureRow = local_46.CreatureType;
                }
            }
            FECSWorldPtr local_48 = Entity.GetWorld();
            NewRequest.TimeSegments = ::FEcologySceneInfoUtils::GetCurrentTimeSegments(local_50);
            NewRequest.WeatherName = ::FEcologySceneInfoUtils::GetWeatherByPosition(local_50, NewRequest.Center);
        }
        else
        {
            NewRequest.CreatureRow = this.CreatureRow;
            NewRequest.TimeSegments = this.TimeSegments;
            NewRequest.WeatherName = this.WeatherName;
        }
        NewRequest.bFilterByCreatureType = this.bFilterByCreatureType && NewRequest.CreatureRow.IsSet();
        if (this.bUseEntitySpawnerVolume)
        {
            Get local_14;
            const FC_EcologyFlockComponent& local_16_2 = local_14.opCall();
            if (local_16_2)
            {
                for (auto& local_70 : local_16_2.ActivityVolumes)
                {
                    local_70;
                    FVolumeProxy local_72;
                    AECSRegionVolume local_74;
                    local_72.Volume = local_74;
                    NewRequest.IncludeVolumes.Add(local_72);
                }
            }
        }
        if (this.bExcludeCurrentCombatArea)
        {
            ::FEcologySceneInfoUtils::FindCombatRegionByEntity(FECSEntity(::FEcologyBehaviorUtils::FindMainTargetResource(Entity)));
            Get local_92;
            if (local_92.opCall())
            {
                AActor local_98;
                local_96 = Cast<AECSRegionVolume>(local_98);
                if (local_96 != nullptr)
                {
                    NewRequest.ExcludeVolumes.Add(FVolumeProxy(local_96));
                }
            }
        }
        return;
    }
}


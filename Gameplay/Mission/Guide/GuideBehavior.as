
enum EGuideStyleType
{
    MainMission = 1,
    SideMission,
    Level,
    CommissionNormal,
    CommissionHard,
    CommissionMission,
    CommissionExtreme,
    CommissionRace,
}

enum EGuideStartResult
{
    Success,
    DeferRetry,
    Failed,
}


struct FGuideTargetInfo
{
    UPROPERTY()
    FECSEntity m_Entity;
    UPROPERTY()
    FVector m_ServerPosition;

    FGuideTargetInfo()
    {
        return;
    }
    FGuideTargetInfo(const FECSEntity &inout InEntity, const FVector &inout InPosition)
    {
        this.SetEntity(InEntity);
        this.SetServerPosition(InPosition);
        return;
    }
    FECSEntity GetEntity() const property
    {
        FECSEntity __r;
        return __r;
    }
    FECSEntity GetEntity() property
    {
        FECSEntity __r;
        return __r;
    }
    void SetEntity(const FECSEntity &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    const FVector GetServerPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetServerPosition() property
    {
        FVector __r;
        return __r;
    }
    void SetServerPosition(const FVector &inout __Value) property
    {
        this.m_ServerPosition = __Value;
        return;
    }
}

struct FGuideContext
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_RequesterEntity;
    UPROPERTY()
    FGuideDataSourceConfig m_DataSourceConfig;
    UPROPERTY()
    TArray<FGuideTargetInfo> m_GuideTargets;
    UPROPERTY()
    TDataObjectPtr<FGuidePresentationConfig> m_GuidePresentationConfig;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> m_LevelInfo;
    UPROPERTY()
    uint m_GuideUniqueId;
    UPROPERTY()
    bool m_bClientAutoSelectIcon;
    UPROPERTY()
    bool m_bShowGuidingPath;
    UPROPERTY()
    float m_RegionRadius;
    UPROPERTY()
    bool m_bShowGuideFX;

    FGuideContext()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FGuideContext(const FGuideContext &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FGuideContext(const FECSEntity &inout InRequesterEntity, const FGuideDataSourceConfig &inout InDataSourceConfig)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FGuideContext opAssign(const FGuideContext &inout Other)
    {
        FGuideContext __r;
        this.SetRequesterEntity(Other.GetRequesterEntity());
        this.SetDataSourceConfig(Other.GetDataSourceConfig());
        this.SetGuideTargets(Other.GetGuideTargets());
        this.SetGuidePresentationConfig(Other.GetGuidePresentationConfig());
        this.SetLevelInfo(Other.GetLevelInfo());
        this.SetGuideUniqueId(Other.GetGuideUniqueId());
        this.SetbClientAutoSelectIcon(Other.GetbClientAutoSelectIcon());
        this.SetbShowGuidingPath(Other.GetbShowGuidingPath());
        this.SetRegionRadius(Other.GetRegionRadius());
        this.SetbShowGuideFX(Other.GetbShowGuideFX());
        return __r;
    }
    FECSEntity GetPrimaryTargetEntity() const
    {
        FECSEntity local_8;
        if (this.GetGuideTargets().Num() > 0)
        {
            local_8 = this.GetGuideTargets()[0].GetEntity();
        }
        else
        {
            local_8 = ENTITY_NULL;
        }
        return local_8;
    }
    FVector GetPrimaryTargetPosition() const
    {
        FVector local_10;
        if (this.GetGuideTargets().Num() > 0)
        {
            local_10 = this.GetGuideTargets()[0].GetServerPosition();
        }
        else
        {
            local_10 = FVector::ZeroVector;
        }
        return local_10;
    }
    FInstancedStruct GetGuideData() const
    {
        FInstancedStruct local_4;
        if (this.GetDataSourceConfig().TryGetData(local_4))
        {
            return local_4;
        }
        else
        {
            XError(ELog(62), FString().Append("Failed to get guide data for data source config ").Append(this.GetDataSourceConfig()));
            return local_4;
        }
    }
    const FECSEntity GetRequesterEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_RequesterEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRequesterEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RequesterEntity = __Value;
        return;
    }
    const FGuideDataSourceConfig GetDataSourceConfig() const property
    {
        const FGuideDataSourceConfig __r;
        return __r;
    }
    FGuideDataSourceConfig GetDataSourceConfig() property
    {
        FGuideDataSourceConfig __r;
        return __r;
    }
    void SetDataSourceConfig(const FGuideDataSourceConfig &inout __Value) property
    {
        this.m_DataSourceConfig = __Value;
        return;
    }
    const TArray<FGuideTargetInfo> GetGuideTargets() const property
    {
        const TArray<FGuideTargetInfo> __r;
        return __r;
    }
    TArray<FGuideTargetInfo> GetModify_GuideTargets() property
    {
        TArray<FGuideTargetInfo> __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetGuideTargets(const TArray<FGuideTargetInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_GuideTargets = __Value;
        return;
    }
    const TDataObjectPtr<FGuidePresentationConfig> GetGuidePresentationConfig() const property
    {
        const TDataObjectPtr<FGuidePresentationConfig> __r;
        return __r;
    }
    TDataObjectPtr<FGuidePresentationConfig> GetModify_GuidePresentationConfig() property
    {
        TDataObjectPtr<FGuidePresentationConfig> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetGuidePresentationConfig(const TDataObjectPtr<FGuidePresentationConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_GuidePresentationConfig = __Value;
        return;
    }
    TDataObjectPtr<FLevelInfoConfig> GetLevelInfo() const property
    {
        TDataObjectPtr<FLevelInfoConfig> __r;
        return __r;
    }
    TDataObjectPtr<FLevelInfoConfig> GetModify_LevelInfo() property
    {
        TDataObjectPtr<FLevelInfoConfig> __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetLevelInfo(const TDataObjectPtr<FLevelInfoConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_LevelInfo = __Value;
        return;
    }
    uint GetGuideUniqueId() const property
    {
        return this.m_GuideUniqueId;
    }
    void SetGuideUniqueId(const uint __Value) property
    {
        if (this.m_GuideUniqueId == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_GuideUniqueId = __Value;
        return;
    }
    bool GetbClientAutoSelectIcon() const property
    {
        return this.m_bClientAutoSelectIcon;
    }
    void SetbClientAutoSelectIcon(const bool __Value) property
    {
        if (!(this.m_bClientAutoSelectIcon) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_bClientAutoSelectIcon = __Value;
        return;
    }
    bool GetbShowGuidingPath() const property
    {
        return this.m_bShowGuidingPath;
    }
    void SetbShowGuidingPath(const bool __Value) property
    {
        if (!(this.m_bShowGuidingPath) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_bShowGuidingPath = __Value;
        return;
    }
    float GetRegionRadius() const property
    {
        return this.m_RegionRadius;
    }
    void SetRegionRadius(const float __Value) property
    {
        if (this.m_RegionRadius == __Value)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_RegionRadius = __Value;
        return;
    }
    bool GetbShowGuideFX() const property
    {
        return this.m_bShowGuideFX;
    }
    void SetbShowGuideFX(const bool __Value) property
    {
        if (!(this.m_bShowGuideFX) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_bShowGuideFX = __Value;
        return;
    }
}

UCLASS(Abstract)
class UGuideBehavior : UObject
{
    UGuideBehavior()
    {
        return;
    }
    bool TryCalculateDistance(const FInstancedStruct &inout GuideData, const FECSEntity &inout PlayerEntity, float &inout Distance) const
    {
        return false;
    }
    FVector GetTargetPosition(const FInstancedStruct &inout GuideData) const
    {
        return FVector::ZeroVector;
    }
    EGuideStartResult StartGuideInternal(const uint InstanceId, FGuideContext &inout Context) const
    {
        return EGuideStartResult(2);
    }
    void StopGuideInternal(const FECSEntity &inout RequesterEntity, const FGuideContext &inout Context) const
    {
        XLog(ELog(62), FString().Append("StopGuideInternal ").Append(RequesterEntity.GetEntityName()));
        this.RemoveGuidePresentation(Context);
        return;
    }
    void SetupGuidePresentation(FGuideContext &inout Context) const
    {
        return;
    }
    void RemoveGuidePresentation(const FGuideContext &inout Context) const
    {
        return;
    }
    bool IsContinuousGuide(const FInstancedStruct &inout GuideData) const
    {
        return false;
    }
    bool AppendGuideInternal(const uint InstanceId, FGuideContext &inout Context) const
    {
        return false;
    }
    EGuideStartResult StartGuide(const uint InstanceId, FGuideContext &inout Context) const
    {
        int local_12 = 0;
        EGuideStartResult local_1 = this.StartGuideInternal(InstanceId, Context);
        if ((int(local_1)) == 0)
        {
            this.SetupGuidePresentation(Context);
            Context.SetGuideUniqueId(InstanceId);
            local_12.GetModify_GuideInfoMap().FindOrAdd(InstanceId) = Context;
        }
        return local_1;
    }
    bool AppendGuide(const uint InstanceId, FGuideContext &inout Context) const
    {
        int local_8 = 0;
        if (!(this.AppendGuideInternal(InstanceId, Context)))
        {
            return false;
        }
        this.SetupGuidePresentation(Context);
        Context.SetGuideUniqueId(InstanceId);
        local_8.GetModify_GuideInfoMap().FindOrAdd(InstanceId) = Context;
        return true;
    }
    void StopGuide(const uint InstanceId, const FECSEntity &inout RequesterEntity) const
    {
        int local_16 = 0;
        Modify local_4;
        FC_GuidingInfoList& local_6 = local_4.opCall();
        if (local_6)
        {
            FECSWorldPtr local_10 = ECS::GetECSWorld();
            if (!(local_16.GuideInfoMap.Contains(InstanceId)) || !(local_6.GetGuideInfoMap().Contains(InstanceId)))
            {
                XError(ELog(62), FString().Append("Failed to stop guide for custom unique id ").Append(InstanceId).Append(", guide info not found"));
                return;
            }
            XLog(ELog(62), FString().Append("Stop guide for custom unique id ").Append(InstanceId));
            FGuideContext local_164 = FGuideContext(local_6.GetGuideInfoMap()[InstanceId]);
            FGuideRuntimeInfoContainer& local_166 = local_16.GuideInfoMap[InstanceId];
            if (local_166.Requesters.Contains(RequesterEntity))
            {
                this.StopGuideInternal(RequesterEntity, local_164);
            }
            if (local_166.Requesters.IsEmpty())
            {
            }
            return;
        }
        XError(ELog(62), FString().Append("Failed to stop guide for custom unique id ").Append(InstanceId).Append(", FC_GuidingInfoList not found"));
        return;
    }
}

UCLASS(Abstract)
class UGuideEntityCommonBehavior : UGuideBehavior
{
    UGuideEntityCommonBehavior()
    {
        super();
        return;
    }
    bool TryCalculateDistance(const FInstancedStruct &inout GuideData, const FECSEntity &inout PlayerEntity, float &inout Distance) const
    {
        FECSEntity local_4 = this.FindTargetEntity(GuideData);
        if (!(local_4.IsValid()))
        {
            return false;
        }
        FECSEntity local_8 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(PlayerEntity);
        if (!(local_8.IsValid()))
        {
            XError(ELog(62), FString().Append("Failed to calculate distance for guide, requester entity is not a player"));
            return false;
        }
        Distance = ::FASCommonUtils::CalculateEntityDistance2D(local_4, local_8, false);
        return true;
    }
    FVector GetTargetPosition(const FInstancedStruct &inout GuideData) const
    {
        FECSEntity local_4 = this.FindTargetEntity(GuideData);
        if (!(local_4.IsValid()))
        {
            XError(ELog(62), FString().Append("Failed to get target position for guide, target entity is not valid"));
            return FVector::ZeroVector;
        }
        return ::FASCommonUtils::GetEntityLocation(local_4);
    }
    EGuideStartResult StartGuideInternal(const uint InstanceId, FGuideContext &inout Context) const
    {
        int local_154 = 0;
        XLog(ELog(62), FString().Append("StartGuide Entity ").Append(InstanceId).Append(" ").Append(Context.GetDataSourceConfig()));
        FECSEntity local_10;
        TDataObjectPtr<FLevelInfoConfig> local_34 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
        bool local_59 = !(Context.GetLevelInfo().IsSet());
        if (local_59)
        {
            local_59 = true;
        }
        else
        {
            TDataObjectPtr<FLevelInfoConfig> local_58;
            local_58 = Context.GetLevelInfo();
            local_59 = (local_58 == local_34.opImplConv());
        }
        if (local_59)
        {
            local_10 = this.FindTargetEntity(Context.GetGuideData());
        }
        if (local_10.IsValid())
        {
            XLog(ELog(62), FString().Append("FindTargetEntity ").Append(local_10.GetEntityName()));
            Context.GetModify_GuideTargets().Add(FGuideTargetInfo(local_10, ::FASCommonUtils::GetEntityLocation(local_10)));
        }
        else
        {
            bool local_109 = !(Context.GetLevelInfo().IsSet());
            if (local_109)
            {
                local_109 = true;
            }
            else
            {
                TDataObjectPtr<FLevelInfoConfig> local_84;
                local_84 = Context.GetLevelInfo();
                local_109 = (local_84 == local_34.opImplConv());
            }
            if (local_109)
            {
                XLog(ELog(62), FString().Append("Entity not found for guide ").Append(InstanceId).Append(", deferring for retry"));
                return EGuideStartResult(1);
            }
            FVector local_146;
            if (this.TryFindTargetPositionInLevel(Context.GetLevelInfo(), Context.GetGuideData(), local_146))
            {
                XLog(ELog(62), FString().Append("Found target position in level ").Append(Context.GetLevelInfo().GetDataName()).Append(" at ").Append(local_146));
                Context.GetModify_GuideTargets().Add(FGuideTargetInfo(ENTITY_NULL, local_146));
            }
            else
            {
                XError(ELog(62), FString().Append("Failed to start guide for custom unique id ").Append(InstanceId).Append(", cross-level target position not found"));
                return EGuideStartResult(2);
            }
        }
        FECSWorldPtr local_148 = ECS::GetECSWorld();
        local_154.GuideInfoMap.FindOrAdd(InstanceId).Requesters.AddUnique(Context.GetRequesterEntity());
        return EGuideStartResult(0);
    }
    void SetupGuidePresentation(FGuideContext &inout Context) const
    {
        if (!(Context.GetGuidePresentationConfig().IsSet()))
        {
            return;
        }
        if (!(Context.GetGuidePresentationConfig().opArrow().GetPresentationRule().IsSet()))
        {
            return;
        }
        for (auto& local_64 : Context.GetGuideTargets())
        {
            if (!(local_64.GetEntity().IsValid()))
            {
                continue;
            }
            if (::EntityLevelSpotUtils::GetSpotData(local_64.GetEntity(), ELevelSpotDataSource(2)).IsEmpty())
            {
            }
            else
            {
                ::EntityLevelSpotUtils::SetSpotDataVisibilityForViewer(local_64.GetEntity(), ELevelSpotDataSource(2), Context.GetRequesterEntity(), true);
            }
        }
        return;
    }
    void RemoveGuidePresentation(const FGuideContext &inout Context) const
    {
        for (auto& local_16 : Context.GetGuideTargets())
        {
            if (local_16.GetEntity().IsValid())
            {
                ::EntityLevelSpotUtils::SetSpotDataVisibilityForViewer(local_16.GetEntity(), ELevelSpotDataSource(2), Context.GetRequesterEntity(), false);
            }
        }
        return;
    }
    FECSEntity FindTargetEntity(const FInstancedStruct &inout GuideData) const
    {
        return FECSEntity();
    }
    bool TryFindTargetPositionInLevel(const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfo, const FInstancedStruct &inout GuideData, FVector &inout TargetPosition) const
    {
        return false;
    }
}

class UGuideNpcBehavior : UGuideEntityCommonBehavior
{
    UGuideNpcBehavior()
    {
        super();
        return;
    }
    FECSEntity FindTargetEntity(const FInstancedStruct &inout GuideData) const
    {
        FECSEntity local_14;
        if (FInstancedStruct::GetPtr(GuideData).opCall())
        {
            if (unresolved.TargetNpc)
            {
                return local_14;
            }
        }
        return local_14;
    }
    bool TryFindTargetPositionInLevel(const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfo, const FInstancedStruct &inout GuideData, FVector &inout TargetPosition) const
    {
        bool local_2;
        bool local_1 = !(LevelInfo) || !(GetMapConfig());
        if (local_1)
        {
            return false;
        }
        if (FInstancedStruct::GetPtr(GuideData).opCall())
        {
            if (unresolved.OwnerLevelGroup.IsNull())
            {
                local_2 = true;
            }
            else
            {
                local_1 = !local_1;
                local_2 = local_1;
            }
            if (local_2)
            {
                return false;
            }
            FString local_18;
            FName local_14 = FName(local_18);
            return local_2;
        }
        return false;
    }
}

class UGuidePrefabBehavior : UGuideEntityCommonBehavior
{
    UGuidePrefabBehavior()
    {
        super();
        return;
    }
    FECSEntity FindTargetEntity(const FInstancedStruct &inout GuideData) const
    {
        FDataObjectPtr local_196;
        if (FInstancedStruct::GetPtr(GuideData).opCall())
        {
            if (unresolved.Target.IsSet())
            {
                FECSRuntimeView local_50 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
                Include local_54;
                local_54.opCall();
                FECSRuntimeViewIterator local_88 = local_50.Iterator();
                for (; local_88.CanProceed;)
                {
                    const FECSEntity& local_124 = local_88.Proceed();
                    TDataObjectPtr<FBasePrefabConfig> local_148 = ::GetPrefabConfigPtr(local_124);
                    local_196;
                    if ((local_148 == local_196))
                    {
                        return local_124;
                    }
                }
            }
        }
        return FECSEntity();
    }
}

class UGuideRegionBehavior : UGuideBehavior
{
    UGuideRegionBehavior()
    {
        super();
        return;
    }
    bool TryCalculateDistance(const FInstancedStruct &inout GuideData, const FECSEntity &inout PlayerEntity, float &inout Distance) const
    {
        FECSEntity local_4 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(PlayerEntity);
        if (!(local_4.IsValid()))
        {
            XError(ELog(62), FString().Append("Failed to calculate distance for region guide, requester entity is not a player"));
            return false;
        }
        if (FInstancedStruct::GetPtr(GuideData).opCall())
        {
            FVector local_42;
            Distance = FMath::Max(0.0, ::FASCommonUtils::GetEntityLocation(local_4).Dist2D(local_42));
            return true;
        }
        XError(ELog(62), FString().Append("Failed to calculate distance for region guide, guide data is not a region data"));
        return false;
    }
    FVector GetTargetPosition(const FInstancedStruct &inout GuideData) const
    {
        FVector __return;
        if (FInstancedStruct::GetPtr(GuideData).opCall())
        {
        }
        else
        {
            XError(ELog(62), FString().Append("Failed to get target position for region guide, guide data is not a region data"));
            __return = FVector::ZeroVector;
        }
        return __return;
    }
    EGuideStartResult StartGuideInternal(const uint InstanceId, FGuideContext &inout Context) const
    {
        int local_42 = 0;
        XLog(ELog(62), FString().Append("StartGuide ").Append(InstanceId).Append(" ").Append(Context.GetDataSourceConfig()));
        Context.GetModify_GuideTargets().Add(FGuideTargetInfo(ENTITY_NULL, this.GetTargetPosition(Context.GetGuideData())));
        FECSWorldPtr local_36 = ECS::GetECSWorld();
        local_42.GuideInfoMap.FindOrAdd(InstanceId).Requesters.AddUnique(Context.GetRequesterEntity());
        return EGuideStartResult(0);
    }
    void SetupGuidePresentation(FGuideContext &inout Context) const
    {
        bool local_17 = false;
        float32 local_18 = 0.0f;
        FInstancedStruct local_4 = Context.GetGuideData();
        if (FInstancedStruct::GetPtr(local_4).opCall())
        {
            Context.SetRegionRadius(local_18);
            Context.SetbShowGuideFX(local_17);
        }
        return;
    }
}

class UGuideMonsterBehavior : UGuideEntityCommonBehavior
{
    UGuideMonsterBehavior()
    {
        super();
        return;
    }
    EGuideStartResult StartGuideInternal(const uint InstanceId, FGuideContext &inout Context) const
    {
        int local_58 = 0;
        FInstancedStruct local_4 = Context.GetGuideData();
        if (!(this.IsContinuousGuide(local_4)))
        {
            return Super::StartGuideInternal(InstanceId, Context);
        }
        TArray<FECSEntity> local_14 = this.FindAllTargetEntities(local_4);
        if (local_14.IsEmpty())
        {
            return EGuideStartResult(1);
        }
        for (auto& local_32 : local_14)
        {
            Context.GetModify_GuideTargets().Add(FGuideTargetInfo(local_32, ::FASCommonUtils::GetEntityLocation(local_32)));
        }
        FECSWorldPtr local_52 = ECS::GetECSWorld();
        local_58.GuideInfoMap.FindOrAdd(InstanceId).Requesters.AddUnique(Context.GetRequesterEntity());
        return EGuideStartResult(0);
    }
    bool IsContinuousGuide(const FInstancedStruct &inout GuideData) const
    {
        bool local_9 = false;
        return FInstancedStruct::GetPtr(GuideData).opCall() && local_9;
    }
    bool AppendGuideInternal(const uint InstanceId, FGuideContext &inout Context) const
    {
        bool local_33;
        TArray<FECSEntity> local_12 = this.FindAllTargetEntities(Context.GetGuideData());
        bool local_17 = false;
        for (auto& local_32 : local_12)
        {
            local_33 = false;
            for (auto& local_48 : Context.GetGuideTargets())
            {
                if ((FECSEntity(local_48.GetEntity()) == local_32))
                {
                    local_33 = true;
                    break;
                }
            }
            if (!(local_33))
            {
                Context.GetModify_GuideTargets().Add(FGuideTargetInfo(local_32, ::FASCommonUtils::GetEntityLocation(local_32)));
                local_17 = true;
            }
        }
        return local_17;
    }
    FECSEntity FindTargetEntity(const FInstancedStruct &inout GuideData) const
    {
        TArray<FECSEntity> local_4 = this.FindAllTargetEntities(GuideData);
        FECSEntity local_20;
        if (local_4.Num() > 0)
        {
            local_20 = local_4[0];
        }
        else
        {
            local_20 = FECSEntity();
        }
        return local_20;
    }
    TArray<FECSEntity> FindAllTargetEntities(const FInstancedStruct &inout GuideData) const
    {
        TArray<FECSEntity> local_4;
        bool local_14 = false;
        FDataObjectPtr local_226;
        bool local_13 = !(FInstancedStruct::GetPtr(GuideData).opCall());
        if (local_13)
        {
            local_13 = true;
        }
        else
        {
            local_14 = !local_14;
            local_13 = local_14;
        }
        if (local_13)
        {
            return local_4;
        }
        local_14 = !local_14;
        FName local_17;
        if (local_14)
        {
            FString local_22;
            local_17 = FName(local_22);
        }
        FECSRuntimeView local_64 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_68;
        local_68.opCall();
        Include local_72;
        local_72.opCall();
        Exclude(local_64).opCall();
        Exclude(local_64).opCall();
        FECSRuntimeViewIterator local_114 = local_64.Iterator();
        for (; local_114.CanProceed;)
        {
            const FECSEntity& local_150 = local_114.Proceed();
            TDataObjectPtr<FMonsterMainConfig> local_178;
            Get local_154;
            local_178 = local_154.opCall().GetMonsterConfig();
            local_226;
            if ((!((local_178 == local_226))))
            {
                continue;
            }
            if (local_14 && !(this.IsEntityInLevelGroup(local_150, local_17)))
            {
                continue;
            }
            local_4.Add(local_150);
        }
        return local_4;
    }
    bool IsEntityInLevelGroup(const FECSEntity &inout Entity, const FName &inout TargetGroupName) const
    {
        int local_6 = 0;
        int local_24 = 0;
        int local_52 = 0;
        if (!(local_6))
        {
            return false;
        }
        if (!(FECSEntity(Entity.GetWorld(), local_6.FlockProxyEntity).IsValid()))
        {
            return false;
        }
        if (!(local_24))
        {
            return false;
        }
        FECSEntity local_18 = FECSEntity(Entity.GetWorld(), local_24.SpawnerDataRef.SpawnerEntity);
        Has local_32;
        if (!(local_18.IsValid()) || !(local_32.opCall()))
        {
            return false;
        }
        Get local_38;
        Has local_46;
        if (!(FECSEntity(local_18.GetWorld(), local_38.opCall().ConfigRef).IsValid()) || !(local_46.opCall()))
        {
            return false;
        }
        if (!(local_52.OwnerGroupRef.IsValid()))
        {
            return false;
        }
        const FLevelGroupConfig& local_54 = LevelConfig::FindLevelGroupConfig(local_52.OwnerGroupRef);
        if (!(local_54.IsValid()))
        {
            return false;
        }
        if (local_54.LinkedDataLayer.Num() > 0)
        {
            return (FName(local_54.LinkedDataLayer[0]) == TargetGroupName);
        }
        return (FName(local_54.GroupName) == TargetGroupName);
    }
}

namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FGuideContext &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FGuideContext &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FGuideContext
{
int __IndexOf_RequesterEntity()
{
    return 0;
}
int __IndexOf_DataSourceConfig()
{
    return 1;
}
int __IndexOf_GuideTargets()
{
    return 5;
}
int __IndexOf_GuidePresentationConfig()
{
    return 6;
}
int __IndexOf_LevelInfo()
{
    return 7;
}
int __IndexOf_GuideUniqueId()
{
    return 8;
}
int __IndexOf_bClientAutoSelectIcon()
{
    return 9;
}
int __IndexOf_bShowGuidingPath()
{
    return 10;
}
int __IndexOf_RegionRadius()
{
    return 11;
}
int __IndexOf_bShowGuideFX()
{
    return 12;
}
}

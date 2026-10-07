
namespace FM_EcosimChangeAreaDisplay
{
    const int ModelId = 0;
}
namespace FMS_EcosimChangeAreaDisplayManager
{
    const int ModelId = 0;

}
struct FM_EcosimChangeAreaDisplay : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    FECSEntityId m_EntityId;
    UPROPERTY()
    FVector m_TargetLocation;
    UPROPERTY()
    FMinimapIconHandle m_TargetLocationIconHandle;
    UPROPERTY()
    FMinimapIconInfo m_TargetLocationIconInfo;
    UPROPERTY()
    FMinimapPath m_MinimapPath;
    UPROPERTY()
    bool m_bNeedUpdateTargetIcon;
    UPROPERTY()
    UMinimapGlobalConfig m_GlobalConfig;

    FM_EcosimChangeAreaDisplay()
    {
        this.m_bNeedUpdateTargetIcon = false;
        this.m_GlobalConfig = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_EcosimChangeAreaDisplay' by default constructor.");
        return;
    }
    FM_EcosimChangeAreaDisplay(const FM_EcosimChangeAreaDisplay &inout Other)
    {
        this.m_bNeedUpdateTargetIcon = false;
        this.m_GlobalConfig = nullptr;
        this.m_EntityId = Other.m_EntityId;
        this.m_TargetLocation = Other.m_TargetLocation;
        this.m_TargetLocationIconHandle = Other.m_TargetLocationIconHandle;
        this.m_TargetLocationIconInfo = Other.m_TargetLocationIconInfo;
        this.m_MinimapPath = Other.m_MinimapPath;
        this.m_bNeedUpdateTargetIcon = Other.m_bNeedUpdateTargetIcon;
        this.m_GlobalConfig = Other.m_GlobalConfig;
        return;
    }
    FM_EcosimChangeAreaDisplay(const FECSEntityId &inout InEntityId, const FVector &inout InTargetLocation)
    {
        this.m_bNeedUpdateTargetIcon = false;
        this.m_GlobalConfig = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEntityId(InEntityId);
        this.SetTargetLocation(InTargetLocation);
        return;
    }
    FM_EcosimChangeAreaDisplay opAssign(const FM_EcosimChangeAreaDisplay &inout Other)
    {
        FM_EcosimChangeAreaDisplay __r;
        this.m_EntityId = Other.m_EntityId;
        this.m_TargetLocation = Other.m_TargetLocation;
        this.m_TargetLocationIconHandle = Other.m_TargetLocationIconHandle;
        this.m_TargetLocationIconInfo = Other.m_TargetLocationIconInfo;
        this.m_MinimapPath = Other.m_MinimapPath;
        this.m_bNeedUpdateTargetIcon = Other.m_bNeedUpdateTargetIcon;
        this.m_GlobalConfig = Other.m_GlobalConfig;
        return __r;
    }
    void PostConstruct()
    {
        this.SetGlobalConfig(::MinimapUtils::GetMinimapGlobalConfig());
        this.GetModify_TargetLocationIconInfo().IconWidget = this.GetGlobalConfig().ChangeAreaIconWidget;
        this.GetModify_TargetLocationIconInfo().IconSize = this.GetGlobalConfig().ChangeAreaIconSize;
        this.GetModify_TargetLocationIconInfo().ZOrder = int(this.GetGlobalConfig().ChangeAreaIconZOrder);
        this.UpdateTargetLocationIconDisplaySettings();
        this.UpdateTargetLocationIconPosition();
        this.UpdateTargetLocationIconVisibility(::MinimapUtils::FindRegisteredEntityMinimapIconHandle(this.GetEntityId()));
        return;
    }
    void BeginDestroy()
    {
        ::MinimapUtils::UnregisterIcon(this.GetTargetLocationIconHandle());
        return;
    }
    void Tick()
    {
        FMinimapIconHandle local_3 = ::MinimapUtils::FindRegisteredEntityMinimapIconHandle(this.GetEntityId());
        this.UpdateTargetLocationIconVisibility(local_3);
        if (this.GetbNeedUpdateTargetIcon())
        {
            ::MinimapUtils::UpdateIconInfo(this.GetTargetLocationIconHandle(), this.GetModify_TargetLocationIconInfo());
            this.SetbNeedUpdateTargetIcon(false);
        }
        if (::MinimapUtils::IsValidHandle(local_3))
        {
            FVector2D local_96 = FVector2D(::MinimapUtils::GetIconInfo(local_3).WorldPosition);
            TArray<FVector2D> local_100;
            local_100.Add(local_96);
            local_100.Add(::MinimapUtils::GamePositionToMapPosition(this.GetTargetLocation()));
            FMinimapPath local_116;
            local_116 = Minimap::MakeSimpleMinimapPath(local_100, this.GetGlobalConfig().ChangeAreaPathStyle, 0.0f);
            this.SetMinimapPath(local_116);
        }
        else
        {
            FMinimapPath local_116;
            this.SetMinimapPath(local_116);
        }
        return;
    }
    void OnTargetLocationChanged()
    {
        this.UpdateTargetLocationIconPosition();
        return;
    }
    void OnEntityMinimapIconChanged(const FMsg_MinimapIconInfoChanged &inout Msg)
    {
        this.UpdateTargetLocationIconDisplaySettings();
        return;
    }
    void UpdateTargetLocationIconDisplaySettings()
    {
        FMinimapIconHandle local_3 = ::MinimapUtils::FindRegisteredEntityMinimapIconHandle(this.GetEntityId());
        if (::MinimapUtils::IsValidHandle(local_3))
        {
            this.GetModify_TargetLocationIconInfo().DisplaySettings = ::MinimapUtils::GetIconInfo(local_3).DisplaySettings;
            this.SetbNeedUpdateTargetIcon(true);
        }
        return;
    }
    void UpdateTargetLocationIconPosition()
    {
        this.GetModify_TargetLocationIconInfo().WorldPosition = ::MinimapUtils::GamePositionToMapPosition(this.GetTargetLocation());
        this.SetbNeedUpdateTargetIcon(true);
        return;
    }
    void UpdateTargetLocationIconVisibility(const FMinimapIconHandle &inout EntityIconHandle)
    {
        if (::MinimapUtils::IsValidHandle(EntityIconHandle))
        {
            if (!(::MinimapUtils::IsValidHandle(this.GetTargetLocationIconHandle())))
            {
                this.SetTargetLocationIconHandle(::MinimapUtils::AddSystemIcon(this.GetTargetLocationIconInfo()));
                this.SetbNeedUpdateTargetIcon(false);
            }
            return;
        }
        if (::MinimapUtils::IsValidHandle(this.GetTargetLocationIconHandle()))
        {
            ::MinimapUtils::UnregisterIcon(this.GetTargetLocationIconHandle());
            this.SetbNeedUpdateTargetIcon(false);
        }
        return;
    }
    FECSEntityId GetEntityId() const property
    {
        FECSEntityId __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntityId GetModify_EntityId() property
    {
        FECSEntityId __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetEntityId(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EntityId = __Value;
        return;
    }
    const FVector GetTargetLocation() const property
    {
        const FVector __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FVector GetModify_TargetLocation() property
    {
        FVector __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTargetLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TargetLocation = __Value;
        return;
    }
    const FMinimapIconHandle GetTargetLocationIconHandle() const property
    {
        const FMinimapIconHandle __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FMinimapIconHandle GetModify_TargetLocationIconHandle() property
    {
        FMinimapIconHandle __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTargetLocationIconHandle(const FMinimapIconHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TargetLocationIconHandle = __Value;
        return;
    }
    const FMinimapIconInfo GetTargetLocationIconInfo() const property
    {
        const FMinimapIconInfo __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FMinimapIconInfo GetModify_TargetLocationIconInfo() property
    {
        FMinimapIconInfo __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetTargetLocationIconInfo(const FMinimapIconInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TargetLocationIconInfo = __Value;
        return;
    }
    const FMinimapPath GetMinimapPath() const property
    {
        const FMinimapPath __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FMinimapPath GetModify_MinimapPath() property
    {
        FMinimapPath __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetMinimapPath(const FMinimapPath &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_MinimapPath = __Value;
        return;
    }
    bool GetbNeedUpdateTargetIcon() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bNeedUpdateTargetIcon;
    }
    void SetbNeedUpdateTargetIcon(const bool __Value) property
    {
        if (!(this.m_bNeedUpdateTargetIcon) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bNeedUpdateTargetIcon = __Value;
        return;
    }
    UMinimapGlobalConfig GetGlobalConfig() const property
    {
        this.TrackPropertyRead(6);
        return this.m_GlobalConfig;
    }
    void SetGlobalConfig(const UMinimapGlobalConfig __Value) property
    {
        if (this.m_GlobalConfig == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        return;
    }
}

struct FMS_EcosimChangeAreaDisplayManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<FECSEntityId, TEUIModelRef<FM_EcosimChangeAreaDisplay>> m_MonsterChangeAreaDisplays;

    FMS_EcosimChangeAreaDisplayManager()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_EcosimChangeAreaDisplayManager(const FMS_EcosimChangeAreaDisplayManager &inout Other)
    {
        this.m_MonsterChangeAreaDisplays = Other.m_MonsterChangeAreaDisplays;
        return;
    }
    FMS_EcosimChangeAreaDisplayManager& opAssign(const FMS_EcosimChangeAreaDisplayManager &inout Other)
    {
        return Other.m_MonsterChangeAreaDisplays;
    }
    TArray<FMinimapPath> GetDisplayPaths() const
    {
        TArray<FMinimapPath> local_4;
        for (auto& local_24 : this.GetMonsterChangeAreaDisplays())
        {
            local_24;
            FMinimapPath local_30 = FMinimapPath(opArrow().GetMinimapPath());
            if (!(local_30.IsEmpty()))
            {
                local_4.Add(local_30);
            }
        }
        return local_4;
    }
    bool HasChangeAreaDisplay() const
    {
        return !(this.GetMonsterChangeAreaDisplays().IsEmpty());
    }
    void DS_OnBossMonsterChangeAreaSummaryChanged(const FCS_BossMonsterChangeAreaSummary &inout C_BossMonsterChangeAreaSummary)
    {
        if (!(C_BossMonsterChangeAreaSummary))
        {
            this.GetModify_MonsterChangeAreaDisplays().Empty(0);
            return;
        }
        TArray<FECSEntityId> local_6;
        for (auto& local_24 : this.GetMonsterChangeAreaDisplays())
        {
            if (!(C_BossMonsterChangeAreaSummary.GetMonsterTargetLocationMap().Contains(local_24.GetKey())))
            {
                local_6.Add(local_24.GetKey());
            }
        }
        for (auto& local_38 : local_6)
        {
            local_38;
        }
        for (auto& local_56 : C_BossMonsterChangeAreaSummary.GetMonsterTargetLocationMap())
        {
            if (this.GetModify_MonsterChangeAreaDisplays().Find(local_56.GetKey()))
            {
                opArrow().SetTargetLocation();
                continue;
            }
            this.GetModify_MonsterChangeAreaDisplays().Add(local_56.GetKey(), TEUIModelRef<FM_EcosimChangeAreaDisplay>(::FM_EcosimChangeAreaDisplay::Create(this.GetContext().Manager, local_56.GetKey())));
        }
        return;
    }
    const TMap<FECSEntityId, TEUIModelRef<FM_EcosimChangeAreaDisplay>> GetMonsterChangeAreaDisplays() const property
    {
        const TMap<FECSEntityId, TEUIModelRef<FM_EcosimChangeAreaDisplay>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<FECSEntityId, TEUIModelRef<FM_EcosimChangeAreaDisplay>> GetModify_MonsterChangeAreaDisplays() property
    {
        TMap<FECSEntityId, TEUIModelRef<FM_EcosimChangeAreaDisplay>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMonsterChangeAreaDisplays(const TMap<FECSEntityId, TEUIModelRef<FM_EcosimChangeAreaDisplay>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MonsterChangeAreaDisplays = __Value;
        return;
    }
}

namespace FM_EcosimChangeAreaDisplay
{
FM_EcosimChangeAreaDisplay& Create(const UObject ContextObject, const FECSEntityId &inout EntityId, const FVector &inout TargetLocation)
{
    return FM_EcosimChangeAreaDisplay::CreateByManager(EUIInternal::GetContextManager(ContextObject), EntityId, TargetLocation);
}
FM_EcosimChangeAreaDisplay CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntityId &inout EntityId, const FVector &inout TargetLocation)
{
    FM_EcosimChangeAreaDisplay __r;
    TEUIModelRef<FM_EcosimChangeAreaDisplay> local_6 = TEUIModelRef<FM_EcosimChangeAreaDisplay>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_EcosimChangeAreaDisplay::ModelId, 0, EntityId, TargetLocation));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelDirtyDefine local_12;
    local_12.FunctionName = "__OnTargetLocationChanged";
    local_12.DirtyFlags.Set(FM_EcosimChangeAreaDisplay::__IndexOf_TargetLocation());
    Result.DirtyFunctions.Add(local_12);
    FEUIModelMsgHandleDefine local_22;
    local_22.FunctionName = "__OnEntityMinimapIconChanged";
    local_22.MessageTypeName = "Msg_MinimapIconInfoChanged";
    local_22.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_22);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_EcosimChangeAreaDisplay;
}
void __Tick(FM_EcosimChangeAreaDisplay &inout Model)
{
    Model.Tick();
    return;
}
void __OnTargetLocationChanged(FM_EcosimChangeAreaDisplay &inout Model)
{
    Model.OnTargetLocationChanged();
    return;
}
void __OnEntityMinimapIconChanged(FM_EcosimChangeAreaDisplay &inout Model, const FMsg_MinimapIconInfoChanged &inout Message)
{
    Model.OnEntityMinimapIconChanged(Message);
    return;
}
int __IndexOf_EntityId()
{
    return 0;
}
int __IndexOf_TargetLocation()
{
    return 1;
}
int __IndexOf_TargetLocationIconHandle()
{
    return 2;
}
int __IndexOf_TargetLocationIconInfo()
{
    return 3;
}
int __IndexOf_MinimapPath()
{
    return 4;
}
int __IndexOf_bNeedUpdateTargetIcon()
{
    return 5;
}
int __IndexOf_GlobalConfig()
{
    return 6;
}
}
namespace FMS_EcosimChangeAreaDisplayManager
{
FMS_EcosimChangeAreaDisplayManager& Get(const UObject ContextObject)
{
    return FMS_EcosimChangeAreaDisplayManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_EcosimChangeAreaDisplayManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_EcosimChangeAreaDisplayManager __r;
    TEUIModelRef<FMS_EcosimChangeAreaDisplayManager> local_6 = TEUIModelRef<FMS_EcosimChangeAreaDisplayManager>(EUIInternal::MakeModelWithManager(Manager, FMS_EcosimChangeAreaDisplayManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__DS_OnBossMonsterChangeAreaSummaryChanged";
    local_14.ComponentType = FCS_BossMonsterChangeAreaSummary;
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_EcosimChangeAreaDisplayManager;
}
void __DS_OnBossMonsterChangeAreaSummaryChanged(FMS_EcosimChangeAreaDisplayManager &inout Model, const FECSEntity &inout Entity, const FCS_BossMonsterChangeAreaSummary &inout Component)
{
    Get local_4;
    Model.DS_OnBossMonsterChangeAreaSummaryChanged(local_4.opCall());
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_MonsterChangeAreaDisplays()
{
    return 0;
}
}

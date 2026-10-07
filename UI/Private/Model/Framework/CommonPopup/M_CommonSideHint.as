
namespace FM_CommonSideHintManager
{
    const int ModelId = 0;
}
namespace FMS_CommonSideHintManagerAccessor
{
    const int ModelId = 0;

}
struct FMsg_DisplayCommonSideHint : FEUIMessage
{
    UPROPERTY()
    FEUIDynamicWidgetData SideHintInfo;

    FMsg_DisplayCommonSideHint()
    {
        return;
    }
}

struct FM_CommonSideHintManager : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    float32 m_DisplayInterval;
    UPROPERTY()
    FGameplayTag m_PopupType;
    UPROPERTY()
    TMap<int, FEUIDynamicWidgetData> m_PendingSideHintInfos;
    UPROPERTY()
    FFPTime m_IntervalCooldown;
    UPROPERTY()
    int m_PrivateCurrentOccupyingSideHintId;

    FM_CommonSideHintManager()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FM_CommonSideHintManager(const FM_CommonSideHintManager &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FM_CommonSideHintManager(const float32 InDisplayInterval)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FM_CommonSideHintManager opAssign(const FM_CommonSideHintManager &inout Other)
    {
        FM_CommonSideHintManager __r;
        this.m_DisplayInterval = Other.m_DisplayInterval;
        this.m_PopupType = Other.m_PopupType;
        this.m_PendingSideHintInfos = Other.m_PendingSideHintInfos;
        this.m_IntervalCooldown = Other.m_IntervalCooldown;
        this.m_PrivateCurrentOccupyingSideHintId = int(Other.m_PrivateCurrentOccupyingSideHintId);
        return __r;
    }
    void ShowSideHint(const FEUIDynamicWidgetData &inout SideHintInfo, const int Priority = 0)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnCommonPopupChanged(const FCE_NotifyCommonPopupManagerChanged &inout Event)
    {
        int local_50 = 0;
        if (!(::CommonPopupUtils::HasMatchingPopupType(Event.AffectedPopupTypes, this.GetPopupType())))
        {
            return;
        }
        for (auto local_16 : Event.RemovedPopupIds)
        {
            XLog(ELog(16), FString().Append("Side hint removed when pending: ").Append(local_16));
        }
        if (Event.NewDisplayingPopupIds.Contains(this.GetCurrentOccupyingSideHintId()))
        {
            this.SetCurrentOccupyingSideHintId(INDEX_NONE);
        }
        for (auto local_23 : Event.NewDisplayingPopupIds)
        {
            FEUIDynamicWidgetData local_48;
            if (this.GetPendingSideHintInfos().Find(local_23, local_48))
            {
                FEUIModelRef local_56 = FEUIModelRef(this);
                FEUIMessageBus::Publish(EUIMessageBus);
                local_50.SideHintInfo = local_48;
                XLog(ELog(16), FString().Append("Displaying side hint: ").Append(local_23));
                this.SetCurrentOccupyingSideHintId(local_23);
                break;
            }
        }
        return;
    }
    void Tick()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    int GetCurrentOccupyingSideHintId() const property
    {
        return this.GetPrivateCurrentOccupyingSideHintId();
    }
    void SetCurrentOccupyingSideHintId(const int InCurrentOccupyingSideHintId)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    const float32 GetDisplayInterval() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_DisplayInterval() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDisplayInterval(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DisplayInterval = __Value;
        return;
    }
    const FGameplayTag GetPopupType() const property
    {
        const FGameplayTag __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FGameplayTag GetModify_PopupType() property
    {
        FGameplayTag __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetPopupType(const FGameplayTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PopupType = __Value;
        return;
    }
    const TMap<int, FEUIDynamicWidgetData> GetPendingSideHintInfos() const property
    {
        const TMap<int, FEUIDynamicWidgetData> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TMap<int, FEUIDynamicWidgetData> GetModify_PendingSideHintInfos() property
    {
        TMap<int, FEUIDynamicWidgetData> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPendingSideHintInfos(const TMap<int, FEUIDynamicWidgetData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PendingSideHintInfos = __Value;
        return;
    }
    const FFPTime GetIntervalCooldown() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FFPTime GetModify_IntervalCooldown() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetIntervalCooldown(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_IntervalCooldown = __Value;
        return;
    }
    int GetPrivateCurrentOccupyingSideHintId() const property
    {
        this.TrackPropertyRead(4);
        return this.m_PrivateCurrentOccupyingSideHintId;
    }
    void SetPrivateCurrentOccupyingSideHintId(const int __Value) property
    {
        if (this.m_PrivateCurrentOccupyingSideHintId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PrivateCurrentOccupyingSideHintId = __Value;
        return;
    }
}

struct FMS_CommonSideHintManagerAccessor : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_CommonSideHintManager> m_SmallSideHintManager;
    UPROPERTY()
    TEUIModelRef<FM_CommonSideHintManager> m_LargeSideHintManager;

    FMS_CommonSideHintManagerAccessor()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_CommonSideHintManagerAccessor(const FMS_CommonSideHintManagerAccessor &inout Other)
    {
        this.m_SmallSideHintManager = Other.m_SmallSideHintManager;
        this.m_LargeSideHintManager = Other.m_LargeSideHintManager;
        return;
    }
    FMS_CommonSideHintManagerAccessor& opAssign(const FMS_CommonSideHintManagerAccessor &inout Other)
    {
        this.m_SmallSideHintManager = Other.m_SmallSideHintManager;
        return Other.m_LargeSideHintManager;
    }
    TEUIModelRef<FM_CommonSideHintManager> GetSmallSideHintManager() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SmallSideHintManager;
    }
    void SetSmallSideHintManager(const TEUIModelRef<FM_CommonSideHintManager> &inout __Value) property
    {
        TEUIModelRef<FM_CommonSideHintManager> local_2;
        local_2 = this.m_SmallSideHintManager;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SmallSideHintManager = __Value;
        return;
    }
    TEUIModelRef<FM_CommonSideHintManager> GetLargeSideHintManager() const property
    {
        this.TrackPropertyRead(1);
        return this.m_LargeSideHintManager;
    }
    void SetLargeSideHintManager(const TEUIModelRef<FM_CommonSideHintManager> &inout __Value) property
    {
        TEUIModelRef<FM_CommonSideHintManager> local_2;
        local_2 = this.m_LargeSideHintManager;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_LargeSideHintManager = __Value;
        return;
    }
}

namespace FM_CommonSideHintManager
{
FM_CommonSideHintManager& Create(const UObject ContextObject, const float32 DisplayInterval)
{
    return FM_CommonSideHintManager::CreateByManager(EUIInternal::GetContextManager(ContextObject), DisplayInterval);
}
FM_CommonSideHintManager CreateByManager(const UEUIManagerSubsystem Manager, const float32 DisplayInterval)
{
    FM_CommonSideHintManager __r;
    TEUIModelRef<FM_CommonSideHintManager> local_6 = TEUIModelRef<FM_CommonSideHintManager>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_CommonSideHintManager::ModelId, 0, DisplayInterval));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    FEUIModelEventDefine local_10;
    local_10.FunctionName = "__OnCommonPopupChanged";
    local_10.EventType = FCE_NotifyCommonPopupManagerChanged;
    Result.EventFunctions.Add(local_10);
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_CommonSideHintManager;
}
void __OnCommonPopupChanged(FM_CommonSideHintManager &inout Model, const FCE_NotifyCommonPopupManagerChanged &inout Event)
{
    Model.OnCommonPopupChanged(Event);
    return;
}
void __Tick(FM_CommonSideHintManager &inout Model)
{
    Model.Tick();
    return;
}
int __IndexOf_DisplayInterval()
{
    return 0;
}
int __IndexOf_PopupType()
{
    return 1;
}
int __IndexOf_PendingSideHintInfos()
{
    return 2;
}
int __IndexOf_IntervalCooldown()
{
    return 3;
}
int __IndexOf_PrivateCurrentOccupyingSideHintId()
{
    return 4;
}
}
namespace FMS_CommonSideHintManagerAccessor
{
FMS_CommonSideHintManagerAccessor& Get(const UObject ContextObject)
{
    return FMS_CommonSideHintManagerAccessor::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_CommonSideHintManagerAccessor GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_CommonSideHintManagerAccessor __r;
    TEUIModelRef<FMS_CommonSideHintManagerAccessor> local_6 = TEUIModelRef<FMS_CommonSideHintManagerAccessor>(EUIInternal::MakeModelWithManager(Manager, FMS_CommonSideHintManagerAccessor::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_CommonSideHintManagerAccessor;
}
int __IndexOf_SmallSideHintManager()
{
    return 0;
}
int __IndexOf_LargeSideHintManager()
{
    return 1;
}
}

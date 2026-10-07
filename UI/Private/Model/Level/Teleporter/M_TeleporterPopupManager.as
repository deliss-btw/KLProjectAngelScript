
namespace FMS_TeleporterPopupManager
{
    const int ModelId = 0;

}
struct FTeleporterPopupData
{
    UPROPERTY()
    TDataObjectPtr<FTeleporterConfig> TeleporterConfig;

    FTeleporterPopupData()
    {
        return;
    }
    FTeleporterPopupData(const TDataObjectPtr<FTeleporterConfig> &inout InTeleporterConfig)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FMS_TeleporterPopupManager : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    FEUIWidgetRef m_DisplayingWidget;
    UPROPERTY()
    int m_DisplayingPopupId;
    UPROPERTY()
    TMap<int, TDataObjectPtr<FTeleporterConfig>> m_PendingTeleporterActivePopups;

    FMS_TeleporterPopupManager()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FMS_TeleporterPopupManager(const FMS_TeleporterPopupManager &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FMS_TeleporterPopupManager& opAssign(const FMS_TeleporterPopupManager &inout Other)
    {
        this.m_DisplayingWidget = Other.m_DisplayingWidget;
        this.m_DisplayingPopupId = int(Other.m_DisplayingPopupId);
        return Other.m_PendingTeleporterActivePopups;
    }
    void HandleTeleporterActivated(const FMsg_TeleporterActivated &inout Msg)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void HandleCommonPopup(const FCE_NotifyCommonPopupManagerChanged &inout Event)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnTick()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void NodifyDisplayingWidgetRemoved()
    {
        ::CommonPopupUtils::DequeuePopupInternal(this.GetDisplayingPopupId());
        this.SetDisplayingPopupId(INDEX_NONE);
        this.SetDisplayingWidget(FEUIWidgetRef());
        return;
    }
    const FEUIWidgetRef GetDisplayingWidget() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIWidgetRef GetModify_DisplayingWidget() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDisplayingWidget(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DisplayingWidget = __Value;
        return;
    }
    int GetDisplayingPopupId() const property
    {
        this.TrackPropertyRead(1);
        return this.m_DisplayingPopupId;
    }
    void SetDisplayingPopupId(const int __Value) property
    {
        if (this.m_DisplayingPopupId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DisplayingPopupId = __Value;
        return;
    }
    const TMap<int, TDataObjectPtr<FTeleporterConfig>> GetPendingTeleporterActivePopups() const property
    {
        const TMap<int, TDataObjectPtr<FTeleporterConfig>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TMap<int, TDataObjectPtr<FTeleporterConfig>> GetModify_PendingTeleporterActivePopups() property
    {
        TMap<int, TDataObjectPtr<FTeleporterConfig>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPendingTeleporterActivePopups(const TMap<int, TDataObjectPtr<FTeleporterConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PendingTeleporterActivePopups = __Value;
        return;
    }
}

namespace FMS_TeleporterPopupManager
{
FMS_TeleporterPopupManager& Get(const UObject ContextObject)
{
    return FMS_TeleporterPopupManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_TeleporterPopupManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_TeleporterPopupManager __r;
    TEUIModelRef<FMS_TeleporterPopupManager> local_6 = TEUIModelRef<FMS_TeleporterPopupManager>(EUIInternal::MakeModelWithManager(Manager, FMS_TeleporterPopupManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__HandleTeleporterActivated";
    local_14.MessageTypeName = "Msg_TeleporterActivated";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    FEUIModelEventDefine local_24;
    local_24.FunctionName = "__HandleCommonPopup";
    local_24.EventType = FCE_NotifyCommonPopupManagerChanged;
    Result.EventFunctions.Add(local_24);
    Result.TickFunction.FunctionName = "__OnTick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_TeleporterPopupManager;
}
void __HandleTeleporterActivated(FMS_TeleporterPopupManager &inout Model, const FMsg_TeleporterActivated &inout Message)
{
    Model.HandleTeleporterActivated(Message);
    return;
}
void __HandleCommonPopup(FMS_TeleporterPopupManager &inout Model, const FCE_NotifyCommonPopupManagerChanged &inout Event)
{
    Model.HandleCommonPopup(Event);
    return;
}
void __OnTick(FMS_TeleporterPopupManager &inout Model)
{
    Model.OnTick();
    return;
}
int __IndexOf_DisplayingWidget()
{
    return 0;
}
int __IndexOf_DisplayingPopupId()
{
    return 1;
}
int __IndexOf_PendingTeleporterActivePopups()
{
    return 2;
}
}

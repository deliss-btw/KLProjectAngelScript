
namespace FMS_PendingConfirmMessage
{
    const int ModelId = 0;

}
struct FPendingConfirmEntry
{
    UPROPERTY()
    int CommonPopupId;
    UPROPERTY()
    int64 MessageId;
    UPROPERTY()
    TEUIModelRef<FM_Player> Player;
    UPROPERTY()
    FText Title;
    UPROPERTY()
    FText Content;
    UPROPERTY()
    int Priority;
    UPROPERTY()
    FFPTime StartTime;
    UPROPERTY()
    FFPTime EndTime;
    UPROPERTY()
    TArray<EPendingConfirmAction> ActionBar;
    UPROPERTY()
    EPendingConfirmTimeOutAction DurationTimeOutAutoAction;
    UPROPERTY()
    EPendingConfirmScenePersistence ScenePersistence;
    UPROPERTY()
    TDataObjectPtr<FPendingConfirmHintConfig> Config;
    UPROPERTY()
    EPendingConfirmFeature Feature;

    FPendingConfirmEntry()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

struct FMS_PendingConfirmMessage : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<int, FPendingConfirmHintData> m_PendingPopups;
    UPROPERTY()
    int m_CurrentDisplayingPopupId;
    UPROPERTY()
    FEUIWidgetRef m_CurrentBubbleWidget;
    UPROPERTY()
    TEUIModelRef<FVM_PendingConfirmItem> m_CurrentBubbleVM;
    UPROPERTY()
    TArray<FPendingConfirmEntry> m_PendingEntries;

    FMS_PendingConfirmMessage()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FMS_PendingConfirmMessage(const FMS_PendingConfirmMessage &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FMS_PendingConfirmMessage& opAssign(const FMS_PendingConfirmMessage &inout Other)
    {
        this.m_PendingPopups = Other.m_PendingPopups;
        this.m_CurrentDisplayingPopupId = int(Other.m_CurrentDisplayingPopupId);
        this.m_CurrentBubbleWidget = Other.m_CurrentBubbleWidget;
        this.m_CurrentBubbleVM = Other.m_CurrentBubbleVM;
        return Other.m_PendingEntries;
    }
    void EnqueuePendingConfirmData(const FPendingConfirmHintData &inout Data)
    {
        TDataObjectPtr<FPendingConfirmHintConfig> local_26 = this.FindConfigByFeature(Data.GetFeature());
        if (!(local_26))
        {
            return;
        }
        FPendingConfirmEntry local_106;
        local_106.MessageId = Data.GetMessageId();
        local_106.Feature = Data.GetFeature();
        local_106.Player = ::FMS_PlayerData::Get(this.GetManager()).UpdateOrCreateByBriefInfo(Data.GetSenderPlayerInfo(), EPlayerInfoTrust(2));
        FPendingConfirmHintConfig local_54;
        local_106.Title = local_54.Title;
        local_106.Content = local_54.Content;
        local_106.Priority = int(local_54.Priority);
        local_106.StartTime = this.GetContext().Time;
        local_106.EndTime = (FFPTime(this.GetContext().Time) + FFPTime(local_54.Duration));
        local_106.ActionBar = local_54.ActionBar;
        local_106.DurationTimeOutAutoAction = local_54.DurationTimeOutAutoAction;
        local_106.ScenePersistence = local_54.ScenePersistence;
        local_106.Config = local_26;
        this.AddEntryAndEnqueuePopup(local_106, Data);
        return;
    }
    void OnPendingConfirmHintFormMessage(const FMsg_PendingConfirmHintFormMessage &inout Message)
    {
        this.EnqueuePendingConfirmData(Message.Data);
        return;
    }
    void OnPendingConfirmHint(const FCE_PendingConfirmHint &inout Event)
    {
        this.EnqueuePendingConfirmData(Event.Data);
        return;
    }
    void OnPendingConfirmHint(const FCE_DebugPendingConfirmHint &inout DebugEvent)
    {
        FCE_PendingConfirmHint local_46;
        local_46.Data.SetMessageId(DebugEvent.Data.GetMessageId());
        local_46.Data.SetFeature(DebugEvent.Data.GetFeature());
        local_46.Data.SetSenderPlayerInfo(DebugEvent.Data.GetSenderPlayerInfo());
        this.OnPendingConfirmHint(local_46);
        return;
    }
    void AddEntryAndEnqueuePopup(FPendingConfirmEntry &inout Entry, const FPendingConfirmHintData &inout HintData)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnCommonPopupChanged(const FCE_NotifyCommonPopupManagerChanged &inout Event)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void Tick()
    {
        this.TickBubbleLifetime();
        this.TickPendingEntriesTimeout();
        return;
    }
    void TickBubbleLifetime()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void TickPendingEntriesTimeout()
    {
        int local_4 = this.GetPendingEntries().Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            if (FFPTime(this.GetContext().Time).opCmp(this.GetPendingEntries()[local_4].EndTime) >= 0)
            {
                const FPendingConfirmEntry& local_10 = this.GetPendingEntries()[local_4];
                if (int(local_10.CommonPopupId) != this.GetCurrentDisplayingPopupId())
                {
                    int local_14 = int(local_10.CommonPopupId);
                    this.ExecuteTimeOutActionForEntry(local_10);
                    this.GetModify_PendingEntries().RemoveAt(local_4);
                    this.PurgePopupFromQueue(local_14);
                }
            }
        }
        return;
    }
    void ExecuteTimeOutAction(const int64 CommonPopupId)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void ExecuteTimeOutActionForEntry(const FPendingConfirmEntry &inout Entry)
    {
        FCE_PendingTimeoutResult local_16;
        switch (int(Entry.DurationTimeOutAutoAction))
        {
        case 0:
        {
            FFPTime local_14 = FFPTime(-1);
            FECSEntity local_8 = this.GetContext().GetLocalPlayer();
            local_16.MessageId = Entry.MessageId;
            local_16.Result = EPendingConfirmAction(0);
            return;
        }
        case 1:
        {
            FFPTime local_14_2 = FFPTime(-1);
            FECSEntity local_8_2 = this.GetContext().GetLocalPlayer();
            local_16.MessageId = Entry.MessageId;
            local_16.Result = EPendingConfirmAction(1);
            return;
        }
        case 2:
        {
            return;
        }
        }
        return;
    }
    void OnSceneChanged()
    {
        int local_4 = this.GetPendingEntries().Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            if (int(this.GetPendingEntries()[local_4].ScenePersistence) == 1)
            {
                int64 local_12 = this.GetPendingEntries()[local_4].CommonPopupId;
                int local_10 = local_12;
                if (this.GetPendingEntries()[local_4].CommonPopupId == this.GetCurrentDisplayingPopupId())
                {
                    this.DequeueAndRemoveBubble();
                }
                this.GetModify_PendingEntries().RemoveAt(local_4);
                this.PurgePopupFromQueue(local_10);
            }
        }
        return;
    }
    void OnBubbleAction(const int64 CommonPopupId, const EPendingConfirmAction Action)
    {
        this.SendConfirmResult(CommonPopupId, EPendingConfirmAction(Action));
        this.RemovePendingEntry(CommonPopupId);
        if (this.GetCurrentDisplayingPopupId() == CommonPopupId)
        {
            this.DequeueAndRemoveBubble();
        }
        return;
    }
    void ConfirmMessage(const int64 CommonPopupId, const EPendingConfirmAction Action)
    {
        this.SendConfirmResult(CommonPopupId, EPendingConfirmAction(Action));
        this.RemovePendingEntry(CommonPopupId);
        if (this.GetCurrentDisplayingPopupId() == CommonPopupId)
        {
            this.DequeueAndRemoveBubble();
        }
        return;
    }
    void DequeueAndRemoveBubble()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void SendConfirmResult(const int64 CommonPopupId, const EPendingConfirmAction Action)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void SendConfirmResultToDS(const int64 MessageId, const EPendingConfirmAction Action)
    {
        FFPTime local_10 = FFPTime(-1);
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        FCE_PendingConfirmResult local_14;
        local_14.MessageId = MessageId;
        local_14.Result = Action;
        return;
    }
    void SendConfirmResultToGS(const int64 MessageId, const EPendingConfirmAction Action)
    {
        return;
    }
    void RemovePendingEntry(const int64 CommonPopupId)
    {
        int local_1 = 0;
        for (; local_1 < this.GetPendingEntries().Num(); ++local_1)
        {
            if (this.GetPendingEntries()[local_1].CommonPopupId == CommonPopupId)
            {
                this.GetModify_PendingEntries().RemoveAt(local_1);
                this.PurgePopupFromQueue(CommonPopupId);
                break;
            }
        }
        return;
    }
    void PurgePopupFromQueue(const int64 CommonPopupId)
    {
        int local_1 = CommonPopupId;
        ::CommonPopupUtils::DequeuePopupInternal(local_1);
        int local_1_2 = CommonPopupId;
        return;
    }
    void InsertEntryByPriority(const FPendingConfirmEntry &inout Entry)
    {
        int local_2 = this.GetPendingEntries().Num();
        int local_3 = 0;
        for (; local_3 < this.GetPendingEntries().Num(); ++local_3)
        {
            if (int(Entry.Priority) > this.GetPendingEntries()[local_3].Priority)
            {
                local_2 = local_3;
                break;
            }
        }
        this.GetModify_PendingEntries().Insert(Entry, local_2);
        return;
    }
    TDataObjectPtr<FPendingConfirmHintConfig> FindConfigByFeature(const EPendingConfirmFeature Feature)
    {
        UCommonPopupSettings local_4 = ::CommonPopupSettings::Get();
        TDataObjectPtr<FPendingConfirmHintConfig> local_28;
        if (local_4.PendingConfirmConfigs.Find(Feature, local_28))
        {
            return local_28;
        }
        return local_28;
    }
    int FindEntryIndexByCommonPopupId(const int64 CommonPopupId)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    const TMap<int, FPendingConfirmHintData> GetPendingPopups() const property
    {
        const TMap<int, FPendingConfirmHintData> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<int, FPendingConfirmHintData> GetModify_PendingPopups() property
    {
        TMap<int, FPendingConfirmHintData> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPendingPopups(const TMap<int, FPendingConfirmHintData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PendingPopups = __Value;
        return;
    }
    int GetCurrentDisplayingPopupId() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurrentDisplayingPopupId;
    }
    void SetCurrentDisplayingPopupId(const int __Value) property
    {
        if (this.m_CurrentDisplayingPopupId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentDisplayingPopupId = __Value;
        return;
    }
    const FEUIWidgetRef GetCurrentBubbleWidget() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIWidgetRef GetModify_CurrentBubbleWidget() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCurrentBubbleWidget(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurrentBubbleWidget = __Value;
        return;
    }
    TEUIModelRef<FVM_PendingConfirmItem> GetCurrentBubbleVM() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CurrentBubbleVM;
    }
    void SetCurrentBubbleVM(const TEUIModelRef<FVM_PendingConfirmItem> &inout __Value) property
    {
        TEUIModelRef<FVM_PendingConfirmItem> local_2;
        local_2 = this.m_CurrentBubbleVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrentBubbleVM = __Value;
        return;
    }
    const TArray<FPendingConfirmEntry> GetPendingEntries() const property
    {
        const TArray<FPendingConfirmEntry> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<FPendingConfirmEntry> GetModify_PendingEntries() property
    {
        TArray<FPendingConfirmEntry> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetPendingEntries(const TArray<FPendingConfirmEntry> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PendingEntries = __Value;
        return;
    }
}

namespace FMS_PendingConfirmMessage
{
FMS_PendingConfirmMessage& Get(const UObject ContextObject)
{
    return FMS_PendingConfirmMessage::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_PendingConfirmMessage GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_PendingConfirmMessage __r;
    TEUIModelRef<FMS_PendingConfirmMessage> local_6 = TEUIModelRef<FMS_PendingConfirmMessage>(EUIInternal::MakeModelWithManager(Manager, FMS_PendingConfirmMessage::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__OnPendingConfirmHintFormMessage";
    local_14.MessageTypeName = "Msg_PendingConfirmHintFormMessage";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    FEUIModelEventDefine local_24;
    local_24.FunctionName = "__OnPendingConfirmHint";
    local_24.EventType = FCE_PendingConfirmHint;
    Result.EventFunctions.Add(local_24);
    local_24.FunctionName = "__OnPendingConfirmHint";
    local_24.EventType = FCE_DebugPendingConfirmHint;
    Result.EventFunctions.Add(local_24);
    local_24.FunctionName = "__OnCommonPopupChanged";
    local_24.EventType = FCE_NotifyCommonPopupManagerChanged;
    Result.EventFunctions.Add(local_24);
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_PendingConfirmMessage;
}
void __OnPendingConfirmHintFormMessage(FMS_PendingConfirmMessage &inout Model, const FMsg_PendingConfirmHintFormMessage &inout Message)
{
    Model.OnPendingConfirmHintFormMessage(Message);
    return;
}
void __OnPendingConfirmHint(FMS_PendingConfirmMessage &inout Model, const FCE_PendingConfirmHint &inout Event)
{
    Model.OnPendingConfirmHint(Event);
    return;
}
void __OnPendingConfirmHint(FMS_PendingConfirmMessage &inout Model, const FCE_DebugPendingConfirmHint &inout Event)
{
    Model.OnPendingConfirmHint(Event);
    return;
}
void __OnCommonPopupChanged(FMS_PendingConfirmMessage &inout Model, const FCE_NotifyCommonPopupManagerChanged &inout Event)
{
    Model.OnCommonPopupChanged(Event);
    return;
}
void __Tick(FMS_PendingConfirmMessage &inout Model)
{
    Model.Tick();
    return;
}
int __IndexOf_PendingPopups()
{
    return 0;
}
int __IndexOf_CurrentDisplayingPopupId()
{
    return 1;
}
int __IndexOf_CurrentBubbleWidget()
{
    return 2;
}
int __IndexOf_CurrentBubbleVM()
{
    return 3;
}
int __IndexOf_PendingEntries()
{
    return 4;
}
}


namespace FVM_ChatChannelPanel
{
    const int ModelId = 0;

}
struct FVM_ChatChannelPanel : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FMS_ChatDataModel> m_ChatDataModel;
    UPROPERTY()
    TEUIModelRef<FMS_ChatRuntimeData> m_ChatRuntimeData;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ChatChannelTab>> m_ChannelTabs;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ChatMessage>> m_PanelMessages;
    UPROPERTY()
    TArray<TEUIModelRef<FM_ChatMessage>> m_VirtualTimeDividerModels;
    UPROPERTY()
    EChatChannelTab m_SelectedChannelTab;

    FVM_ChatChannelPanel()
    {
        this.m_SelectedChannelTab = EChatChannelTab(1);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_ChatChannelPanel(const FVM_ChatChannelPanel &inout Other)
    {
        this.m_SelectedChannelTab = EChatChannelTab(1);
        this.m_ChatDataModel = Other.m_ChatDataModel;
        this.m_ChatRuntimeData = Other.m_ChatRuntimeData;
        this.m_ChannelTabs = Other.m_ChannelTabs;
        this.m_PanelMessages = Other.m_PanelMessages;
        this.m_VirtualTimeDividerModels = Other.m_VirtualTimeDividerModels;
        this.m_SelectedChannelTab = Other.m_SelectedChannelTab;
        return;
    }
    FVM_ChatChannelPanel opAssign(const FVM_ChatChannelPanel &inout Other)
    {
        FVM_ChatChannelPanel __r;
        this.m_ChatDataModel = Other.m_ChatDataModel;
        this.m_ChatRuntimeData = Other.m_ChatRuntimeData;
        this.m_ChannelTabs = Other.m_ChannelTabs;
        this.m_PanelMessages = Other.m_PanelMessages;
        this.m_VirtualTimeDividerModels = Other.m_VirtualTimeDividerModels;
        this.m_SelectedChannelTab = Other.m_SelectedChannelTab;
        return __r;
    }
    void PostConstruct()
    {
        this.SetChatDataModel(TEUIModelRef<FMS_ChatDataModel>(::FMS_ChatDataModel::Get(this.GetContext().Manager)));
        this.SetChatRuntimeData(TEUIModelRef<FMS_ChatRuntimeData>(::FMS_ChatRuntimeData::Get(this.GetContext().Manager)));
        this.RebuildChannelTabs();
        this.RefreshChannelTab();
        return;
    }
    void TryRebuildChannelTabs()
    {
        if (int(this.GetChatRuntimeData().opArrow().GetLastChannelTabsLevelType()) == (int(::FLevelUtils::GetCurrentLevelType())))
        {
            return;
        }
        this.RebuildChannelTabs();
        this.RefreshChannelTab();
        return;
    }
    void RefreshChannelTab()
    {
        this.SyncChannelTabVisualFromRuntime();
        this.RefreshPanelMessages();
        return;
    }
    void OnRecentMessagesUpdated(const FMsg_OnReceiveChatMessage &inout Msg)
    {
        if (int(Msg.ChannelType) != this.GetProtoChannelTypeForRuntimeSelection())
        {
            return;
        }
        this.RefreshPanelMessages();
        return;
    }
    bool CanSendOnChannelTab() const
    {
        return ::ChatSystemUtil::CanSendByChannelType(this.GetChatRuntimeData().opArrow().GetSelectChannelTab());
    }
    uint GetProtoChannelTypeForRuntimeSelection() const
    {
        return ::ChatSystemUtil::ResolveToProtoByChannelType(this.GetChatRuntimeData().opArrow().GetSelectChannelTab());
    }
    void RebuildChannelTabs()
    {
        const UChatSettings local_4;
        this.GetModify_ChannelTabs().Empty(0);
        GetGameplaySettings<UChatSettings> local_6;
        local_4 = local_6;
        if (!((local_4 != nullptr)))
        {
            return;
        }
        bool local_9 = local_4.InnerLevelTypes.Contains(::FLevelUtils::GetCurrentLevelType());
        TEUIModelRef<FMS_ChatRuntimeData> local_16 = this.GetChatRuntimeData();
        int local_13 = GetSelectChannelTab();
        bool local_18 = false;
        int local_19 = 0;
        for (; local_19 < local_4.ChatChannelTabInfoConfigs.Num(); ++local_19)
        {
            FChatChannelTabInfoConfig& local_22 = local_4.ChatChannelTabInfoConfigs[local_19];
            if (local_22.bHide)
            {
                continue;
            }
            if (int(local_22.StateInLevel) == 2 && !(local_9))
            {
                continue;
            }
            if (int(local_22.StateInLevel) == 1 && local_9)
            {
                continue;
            }
            if (local_13 == int(local_22.ChannelTab))
            {
                local_18 = true;
            }
            FChatFriendChannelTab local_84;
            local_84.FullWihtChatTab(local_22);
            this.GetModify_ChannelTabs().Add(TEUIModelRef<FVM_ChatChannelTab>(::FVM_ChatChannelTab::Create(this.GetContext().Manager, local_84)));
        }
        if (!(local_18) && (this.GetChannelTabs().Num() > 0))
        {
            EChatChannelTab local_17_2 = GetTabInfo().ChannelID;
            TEUIModelRef<FMS_ChatRuntimeData> local_16_2 = this.GetChatRuntimeData();
            SetSelectChannelTab();
        }
        TEUIModelRef<FMS_ChatRuntimeData> local_16_3 = this.GetChatRuntimeData();
        SetLastChannelTabsLevelType();
        return;
    }
    void SyncChannelTabVisualFromRuntime()
    {
        this.SetSelectedChannelTab(EChatChannelTab(this.GetChatRuntimeData().opArrow().GetSelectChannelTab()));
        int local_4 = 0;
        for (; local_4 < this.GetChannelTabs().Num(); )
        {
            EChatChannelTab local_3_2 = this.GetChannelTabs()[local_4].opArrow().GetTabChannelID();
            this.GetChannelTabs()[local_4].opArrow().SetSelectedVisualState((int(local_3_2) == int(this.GetSelectedChannelTab())));
            ++local_4;
        }
        return;
    }
    void EnsureVirtualTimeDividerAtIndex(const int InIndex, const uint InChannelType, const uint64 InUnixTimestampMs)
    {
        while (this.GetVirtualTimeDividerModels().Num() <= InIndex)
        {
            this.GetModify_VirtualTimeDividerModels().Add(TEUIModelRef<FM_ChatMessage>(::FM_ChatMessage::Create(this.GetContext().Manager)));
        }
        this.GetVirtualTimeDividerModels()[InIndex].opArrow().FullToTimeSystemMessage(InChannelType, InUnixTimestampMs);
        return;
    }
    void RefreshPanelMessages()
    {
        int local_20 = 0;
        FM_ChatMessage& local_28;
        this.GetModify_PanelMessages().Empty(0);
        int local_6 = ::ChatSystemUtil::ResolveToProtoByChannelType(this.GetChatRuntimeData().opArrow().GetSelectChannelTab());
        if (local_6 != 0 && this.GetChatDataModel().opArrow().GetRecentMessagesByChannel().Contains(local_6))
        {
            XLog(ELog(74), FString().Append("RefreshPanelMessages PbCh=").Append(local_6));
            TEUIModelRef<FMS_ChatDataModel> local_10 = this.GetChatDataModel();
            int local_21 = -1;
            int local_22 = 0;
            int local_23 = 0;
            for (; local_23 < local_20.Num(); )
            {
                TEUIModelRef<FM_ChatMessage> local_26 = TEUIModelRef<FM_ChatMessage>(local_20[local_23]);
                int local_24 = ::ChatSystemUtil::GetUnixTimestampDisplayDayKey(::ChatSystemUtil::MsToUnixSeconds(local_28.GetSendTimeMs()));
                if (local_24 != local_21)
                {
                    this.EnsureVirtualTimeDividerAtIndex(local_22, local_6, local_28.GetSendTimeMs());
                    this.GetModify_PanelMessages().Add(TEUIModelRef<FVM_ChatMessage>(::FVM_ChatMessage::Create(this.GetContext().Manager, this.GetVirtualTimeDividerModels()[local_22])));
                    ++local_22;
                    local_21 = local_24;
                }
                this.GetModify_PanelMessages().Add(TEUIModelRef<FVM_ChatMessage>(::FVM_ChatMessage::Create(this.GetContext().Manager, local_26)));
                ++local_23;
            }
        }
        return;
    }
    TEUIModelRef<FMS_ChatDataModel> GetChatDataModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ChatDataModel;
    }
    void SetChatDataModel(const TEUIModelRef<FMS_ChatDataModel> &inout __Value) property
    {
        TEUIModelRef<FMS_ChatDataModel> local_2;
        local_2 = this.m_ChatDataModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ChatDataModel = __Value;
        return;
    }
    TEUIModelRef<FMS_ChatRuntimeData> GetChatRuntimeData() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ChatRuntimeData;
    }
    void SetChatRuntimeData(const TEUIModelRef<FMS_ChatRuntimeData> &inout __Value) property
    {
        TEUIModelRef<FMS_ChatRuntimeData> local_2;
        local_2 = this.m_ChatRuntimeData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ChatRuntimeData = __Value;
        return;
    }
    TArray<TEUIModelRef<FVM_ChatChannelTab>> GetChannelTabs() const property
    {
        TArray<TEUIModelRef<FVM_ChatChannelTab>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ChatChannelTab>> GetModify_ChannelTabs() property
    {
        TArray<TEUIModelRef<FVM_ChatChannelTab>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetChannelTabs(const TArray<TEUIModelRef<FVM_ChatChannelTab>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ChannelTabs = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_ChatMessage>> GetPanelMessages() const property
    {
        const TArray<TEUIModelRef<FVM_ChatMessage>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ChatMessage>> GetModify_PanelMessages() property
    {
        TArray<TEUIModelRef<FVM_ChatMessage>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetPanelMessages(const TArray<TEUIModelRef<FVM_ChatMessage>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PanelMessages = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_ChatMessage>> GetVirtualTimeDividerModels() const property
    {
        const TArray<TEUIModelRef<FM_ChatMessage>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FM_ChatMessage>> GetModify_VirtualTimeDividerModels() property
    {
        TArray<TEUIModelRef<FM_ChatMessage>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetVirtualTimeDividerModels(const TArray<TEUIModelRef<FM_ChatMessage>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_VirtualTimeDividerModels = __Value;
        return;
    }
    EChatChannelTab GetSelectedChannelTab() const property
    {
        this.TrackPropertyRead(5);
        return this.m_SelectedChannelTab;
    }
    void SetSelectedChannelTab(const EChatChannelTab __Value) property
    {
        if (int(this.m_SelectedChannelTab) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SelectedChannelTab = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ChatChannelPanel
{
    UPROPERTY()
    TEUIModelRef<FVM_ChatChannelPanel> Self;

    __GeneratedProperties_FVM_ChatChannelPanel()
    {
        return;
    }
}

namespace FVM_ChatChannelPanel
{
FVM_ChatChannelPanel& Create(const UObject ContextObject)
{
    return FVM_ChatChannelPanel::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ChatChannelPanel CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_ChatChannelPanel __r;
    TEUIModelRef<FVM_ChatChannelPanel> local_6 = TEUIModelRef<FVM_ChatChannelPanel>(EUIInternal::MakeModelWithManager(Manager, FVM_ChatChannelPanel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_ChatChannelPanel;
}
void __RefreshChannelTab(FVM_ChatChannelPanel &inout Model)
{
    Model.RefreshChannelTab();
    return;
}
void __OnRecentMessagesUpdated(FVM_ChatChannelPanel &inout Model, const FMsg_OnReceiveChatMessage &inout Message)
{
    Model.OnRecentMessagesUpdated(Message);
    return;
}
TArray<TEUIModelRef<FVM_ChatChannelTab>> __UIGetter_ChannelTabs(const FVM_ChatChannelPanel &inout Model)
{
    return Model.GetChannelTabs();
}
TArray<TEUIModelRef<FVM_ChatMessage>> __UIGetter_PanelMessages(const FVM_ChatChannelPanel &inout Model)
{
    return Model.GetPanelMessages();
}
TEUIModelRef<FVM_ChatChannelPanel> __UIGetter_Self(const FVM_ChatChannelPanel &inout Model)
{
    return TEUIModelRef<FVM_ChatChannelPanel>(Model);
}
int __IndexOf_ChatDataModel()
{
    return 0;
}
int __IndexOf_ChatRuntimeData()
{
    return 1;
}
int __IndexOf_ChannelTabs()
{
    return 2;
}
int __IndexOf_PanelMessages()
{
    return 3;
}
int __IndexOf_VirtualTimeDividerModels()
{
    return 4;
}
int __IndexOf_SelectedChannelTab()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_ChatChannelPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

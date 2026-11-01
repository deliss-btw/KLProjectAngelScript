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
        int local_11 = int(::FLevelUtils::GetCurrentLevelType());
        bool local_9 = local_4.InnerLevelTypes.Contains(ELevelType(local_11));
        int local_13 = int(this.GetChatRuntimeData().Get().GetSelectChannelTab());
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
            this.GetChatRuntimeData().Get().SetSelectChannelTab(EChatChannelTab(this.GetChannelTabs()[0].Get().GetTabInfo().ChannelID));
        }
        this.GetChatRuntimeData().Get().SetLastChannelTabsLevelType(ELevelType(local_11));
        return;
    }
    void SyncChannelTabVisualFromRuntime()
    {
        this.SetSelectedChannelTab(this.GetChatRuntimeData().opArrow().GetSelectChannelTab());
        int local_4 = 0;
        for (; local_4 < this.GetChannelTabs().Num(); )
        {
            this.GetChannelTabs()[local_4].opArrow().SetSelectedVisualState((this.GetChannelTabs()[local_4].opArrow().GetTabChannelID() == int(this.GetSelectedChannelTab())));
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
                FM_ChatMessage& local_28 = local_26.Get();
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
FVM_ChatChannelPanel& CreateByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FVM_ChatChannelPanel>(EUIInternal::MakeModelWithManager(Manager, FVM_ChatChannelPanel::ModelId)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ChannelTabs";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ChatChannelTab>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PanelMessages";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_ChatMessage>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ChatChannelPanel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ChatChannelPanel;
    FEUIModelRefPropertyDirtyIndexer local_22 = FEUIModelRefPropertyDirtyIndexer(6);
    local_22.AddRefPropertyDirty(0, 1, FMS_ChatRuntimeData::__IndexOf_SelectChannelTab());
    local_22.ApplySort();
    FEUIModelRefPropertyDirty local_30;
    local_30.PropertyName = FName("ChatRuntimeData");
    local_30.PropertyModelId = FMS_ChatRuntimeData::ModelId;
    local_30.MappingDirtyOffset = local_22.GetMappingDirtyOffset(1);
    local_30.RelatedDirtyMask.SetBit(FMS_ChatRuntimeData::__IndexOf_SelectChannelTab(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    FEUIModelDirtyDefine local_40;
    local_40.FunctionName = "__RefreshChannelTab";
    local_40.DirtyFlags.Set(FVM_ChatChannelPanel::__IndexOf_ChatRuntimeData());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(0));
    Result.DirtyFunctions.Add(local_40);
    FEUIModelMsgHandleDefine local_50;
    local_50.FunctionName = "__OnRecentMessagesUpdated";
    local_50.MessageTypeName = "Msg_OnReceiveChatMessage";
    local_50.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_50);
    return;
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
    return __GeneratedProperties_FVM_ChatChannelPanel.Get();
}
}

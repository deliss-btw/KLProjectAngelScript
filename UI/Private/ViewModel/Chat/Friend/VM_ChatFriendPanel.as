
enum EFriendContextStateIndex
{
    NoFriend,
    FriendOrApplyList,
    SearchFriend,
}

enum ESearchFriendContextStateIndex
{
    SearchResult,
    NoSearchResult,
    SearchTips,
}

namespace FVM_ChatFriendPanel
{
    const int ModelId = 0;

}
struct FVM_ChatFriendPanel : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FMS_FriendDataModel> m_FriendDataModel;
    UPROPERTY()
    TEUIModelRef<FMS_ChatRuntimeData> m_ChatRuntimeData;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_ChatChannelTab>> m_FriendTabs;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_FriendItem>> m_SearchFriendItemList;
    UPROPERTY()
    EChatFriendTab m_SelectedFriendTab;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_FriendItem>> m_ContextFriendItemList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_FriendItem>> m_FriendItemList;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_FriendItem>> m_ApplyItemList;
    UPROPERTY()
    int m_FriendContextStateIndex;
    UPROPERTY()
    bool m_bIsShowFriendNum;
    UPROPERTY()
    EFriendContextStateIndex m_FriendContextState;

    FVM_ChatFriendPanel()
    {
        this.m_SelectedFriendTab = EChatFriendTab(0);
        this.m_FriendContextStateIndex = 0;
        this.m_bIsShowFriendNum = false;
        this.m_FriendContextState = EFriendContextStateIndex(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_ChatFriendPanel(const FVM_ChatFriendPanel &inout Other)
    {
        this.m_SelectedFriendTab = EChatFriendTab(0);
        this.m_FriendContextStateIndex = 0;
        this.m_bIsShowFriendNum = false;
        this.m_FriendContextState = EFriendContextStateIndex(0);
        this.m_FriendDataModel = Other.m_FriendDataModel;
        this.m_ChatRuntimeData = Other.m_ChatRuntimeData;
        this.m_FriendTabs = Other.m_FriendTabs;
        this.m_SearchFriendItemList = Other.m_SearchFriendItemList;
        this.m_SelectedFriendTab = Other.m_SelectedFriendTab;
        this.m_ContextFriendItemList = Other.m_ContextFriendItemList;
        this.m_FriendItemList = Other.m_FriendItemList;
        this.m_ApplyItemList = Other.m_ApplyItemList;
        this.m_FriendContextStateIndex = int(Other.m_FriendContextStateIndex);
        this.m_bIsShowFriendNum = Other.m_bIsShowFriendNum;
        this.m_FriendContextState = Other.m_FriendContextState;
        return;
    }
    FVM_ChatFriendPanel opAssign(const FVM_ChatFriendPanel &inout Other)
    {
        FVM_ChatFriendPanel __r;
        this.m_FriendDataModel = Other.m_FriendDataModel;
        this.m_ChatRuntimeData = Other.m_ChatRuntimeData;
        this.m_FriendTabs = Other.m_FriendTabs;
        this.m_SearchFriendItemList = Other.m_SearchFriendItemList;
        this.m_SelectedFriendTab = Other.m_SelectedFriendTab;
        this.m_ContextFriendItemList = Other.m_ContextFriendItemList;
        this.m_FriendItemList = Other.m_FriendItemList;
        this.m_ApplyItemList = Other.m_ApplyItemList;
        this.m_FriendContextStateIndex = int(Other.m_FriendContextStateIndex);
        this.m_bIsShowFriendNum = Other.m_bIsShowFriendNum;
        this.m_FriendContextState = Other.m_FriendContextState;
        return __r;
    }
    void PostConstruct()
    {
        this.SetFriendDataModel(TEUIModelRef<FMS_FriendDataModel>(::FMS_FriendDataModel::Get(this.GetContext().Manager)));
        this.SetChatRuntimeData(TEUIModelRef<FMS_ChatRuntimeData>(::FMS_ChatRuntimeData::Get(this.GetContext().Manager)));
        this.BuildFriendTabList();
        return;
    }
    void OnInitPanelData()
    {
        if (!(this.GetFriendDataModel().opArrow().GetbIsInit()))
        {
            return;
        }
        this.RefreshFriendList();
        this.RefreshApplyList();
        this.RefreshChannelTab();
        return;
    }
    void RefreshChannelTab()
    {
        this.SyncTabVisualFromRuntime();
        this.RefreshFriendContextStateIndex();
        this.RefreshContextFriendItemList();
        if ((int(this.GetSelectedFriendTab())) == 2)
        {
            this.GetFriendDataModel().opArrow().GS_RequestFriendApplyList();
        }
        return;
    }
    void OnSearchFriendResultUpdated()
    {
        this.RefreshSearchFriendList();
        this.RefreshFriendContextStateIndex();
        return;
    }
    void OnUpdateFriendList()
    {
        this.RefreshFriendList();
        this.RefreshContextFriendItemList();
        this.RefreshFriendContextStateIndex();
        return;
    }
    void OnUpdateApplyList()
    {
        this.RefreshApplyList();
        this.RefreshContextFriendItemList();
        this.RefreshFriendContextStateIndex();
        return;
    }
    void OnFriendDataUpdated(const FMsg_FriendDataUpdated &inout Msg)
    {
        this.RefreshFriendList();
        return;
    }
    void HandleAddFriendRequest(const FMsg_AddFriendRsp &inout Msg)
    {
        if (int(Msg.TargetUid) == 0)
        {
            return;
        }
        FCommonTipsParam local_12;
        ::CommonPopup::Tips(NSLOCTEXT("Friend", "SendAddFriendSuccess", "еҐЅеЏ‹з”іиЇ·е·ІеЏ‘йЂЃ"), local_12);
        return;
    }
    FText GetFriendSystemOpenTips()
    {
        return ::FriendUtil::GetFriendSystemOpenTips();
    }
    bool GetIsShowSearchFriendResult() const
    {
        return this.GetChatRuntimeData().opArrow().GetbShowFriendSearchResult();
    }
    FText GetNoFriendTipsTips() const
    {
        return ::FriendUtil::GetNoFriendTipsTips();
    }
    int GetSearchFriendContextStateIndex() const
    {
        if (!(this.GetIsShowSearchFriendResult()))
        {
            return 2;
        }
        return this.GetSearchFriendItemList().Num() > 0 ? 0 : 1;
    }
    void BuildFriendTabList()
    {
        const UChatSettings local_4;
        this.GetModify_FriendTabs().Empty(0);
        GetGameplaySettings<UChatSettings> local_6;
        local_4 = local_6;
        if ((!((local_4 != nullptr))))
        {
            return;
        }
        int local_10 = 0;
        for (; local_10 < local_4.FriendTabInfoConfigs.Num(); ++local_10)
        {
            FFriendTabInfoConfig& local_14 = local_4.FriendTabInfoConfigs[local_10];
            if (local_14.bHide)
            {
                continue;
            }
            FChatFriendChannelTab local_72;
            local_72.FullWihtFriendTab(local_14);
            FVM_ChatChannelTab& local_74 = ::FVM_ChatChannelTab::Create(this.GetContext().Manager, local_72);
            local_74.SetSelectedVisualState((int(local_14.FriendTab) == int(this.GetSelectedFriendTab())));
            this.GetModify_FriendTabs().Add(TEUIModelRef<FVM_ChatChannelTab>(local_74));
        }
        return;
    }
    void SyncTabVisualFromRuntime()
    {
        this.SetSelectedFriendTab(EChatFriendTab(this.GetChatRuntimeData().opArrow().GetSelectFriendTab()));
        int local_4 = 0;
        for (; local_4 < this.GetFriendTabs().Num(); )
        {
            EChatFriendTab local_3_2 = this.GetFriendTabs()[local_4].opArrow().GetTabChannelID();
            this.GetFriendTabs()[local_4].opArrow().SetSelectedVisualState((int(local_3_2) == int(this.GetSelectedFriendTab())));
            ++local_4;
        }
        return;
    }
    void RefreshFriendList()
    {
        this.GetModify_FriendItemList().Empty(0);
        int local_2 = 0;
        for (; local_2 < this.GetFriendDataModel().opArrow().GetFriendList().Num(); )
        {
            TEUIModelRef<FVM_FriendItem> local_8 = TEUIModelRef<FVM_FriendItem>(::FVM_FriendItem::Create(this.GetContext().Manager, this.GetFriendDataModel().opArrow().GetFriendList()[local_2]));
            this.GetModify_FriendItemList().Add(local_8);
            ++local_2;
        }
        return;
    }
    void RefreshContextFriendItemList()
    {
        this.GetModify_ContextFriendItemList().Empty(0);
        if (int(this.GetSelectedFriendTab()) == 0)
        {
            this.GetModify_ContextFriendItemList().Append(this.GetFriendItemList());
            return;
        }
        if (int(this.GetSelectedFriendTab()) == 2)
        {
            this.GetModify_ContextFriendItemList().Append(this.GetApplyItemList());
            this.GetFriendDataModel().opArrow().ClearApplyRedDotHud();
        }
        return;
    }
    void RefreshApplyList()
    {
        this.GetModify_ApplyItemList().Empty(0);
        int local_2 = 0;
        for (; local_2 < this.GetFriendDataModel().opArrow().GetApplyList().Num(); )
        {
            TEUIModelRef<FVM_FriendItem> local_8 = TEUIModelRef<FVM_FriendItem>(::FVM_FriendItem::Create(this.GetContext().Manager, this.GetFriendDataModel().opArrow().GetApplyList()[local_2]));
            this.GetModify_ApplyItemList().Add(local_8);
            ++local_2;
        }
        return;
    }
    void RefreshFriendContextStateIndex()
    {
        int local_9;
        this.SetbIsShowFriendNum(false);
        if (int(this.GetSelectedFriendTab()) == 0)
        {
            if ((this.GetFriendDataModel().opArrow().GetFriendList().Num()) > 0)
            {
                local_9 = EFriendContextStateIndex(1);
            }
            else
            {
                local_9 = EFriendContextStateIndex(0);
            }
            this.SetFriendContextState(EFriendContextStateIndex(local_9));
            this.SetbIsShowFriendNum(true);
        }
        else
        {
            if (int(this.GetSelectedFriendTab()) == 2)
            {
                this.SetFriendContextState(EFriendContextStateIndex(1));
            }
            else
            {
                if ((int(this.GetSelectedFriendTab())) == 1)
                {
                    this.SetFriendContextState(EFriendContextStateIndex(2));
                }
            }
        }
        EFriendContextStateIndex local_10 = this.GetFriendContextState();
        this.SetFriendContextStateIndex(int(local_10));
        return;
    }
    void RefreshSearchFriendList()
    {
        this.GetModify_SearchFriendItemList().Empty(0);
        int local_2 = 0;
        for (; local_2 < this.GetFriendDataModel().opArrow().GetSearchResults().Num(); )
        {
            TEUIModelRef<FVM_FriendItem> local_8 = TEUIModelRef<FVM_FriendItem>(::FVM_FriendItem::Create(this.GetContext().Manager, this.GetFriendDataModel().opArrow().GetSearchResults()[local_2]));
            this.GetModify_SearchFriendItemList().Add(local_8);
            ++local_2;
        }
        return;
    }
    TEUIModelRef<FMS_FriendDataModel> GetFriendDataModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_FriendDataModel;
    }
    void SetFriendDataModel(const TEUIModelRef<FMS_FriendDataModel> &inout __Value) property
    {
        TEUIModelRef<FMS_FriendDataModel> local_2;
        local_2 = this.m_FriendDataModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_FriendDataModel = __Value;
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
    TArray<TEUIModelRef<FVM_ChatChannelTab>> GetFriendTabs() const property
    {
        TArray<TEUIModelRef<FVM_ChatChannelTab>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_ChatChannelTab>> GetModify_FriendTabs() property
    {
        TArray<TEUIModelRef<FVM_ChatChannelTab>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetFriendTabs(const TArray<TEUIModelRef<FVM_ChatChannelTab>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_FriendTabs = __Value;
        return;
    }
    TArray<TEUIModelRef<FVM_FriendItem>> GetSearchFriendItemList() const property
    {
        TArray<TEUIModelRef<FVM_FriendItem>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_FriendItem>> GetModify_SearchFriendItemList() property
    {
        TArray<TEUIModelRef<FVM_FriendItem>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetSearchFriendItemList(const TArray<TEUIModelRef<FVM_FriendItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SearchFriendItemList = __Value;
        return;
    }
    EChatFriendTab GetSelectedFriendTab() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SelectedFriendTab;
    }
    void SetSelectedFriendTab(const EChatFriendTab __Value) property
    {
        if (int(this.m_SelectedFriendTab) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SelectedFriendTab = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_FriendItem>> GetContextFriendItemList() const property
    {
        const TArray<TEUIModelRef<FVM_FriendItem>> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<TEUIModelRef<FVM_FriendItem>> GetModify_ContextFriendItemList() property
    {
        TArray<TEUIModelRef<FVM_FriendItem>> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetContextFriendItemList(const TArray<TEUIModelRef<FVM_FriendItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ContextFriendItemList = __Value;
        return;
    }
    TArray<TEUIModelRef<FVM_FriendItem>> GetFriendItemList() const property
    {
        TArray<TEUIModelRef<FVM_FriendItem>> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<TEUIModelRef<FVM_FriendItem>> GetModify_FriendItemList() property
    {
        TArray<TEUIModelRef<FVM_FriendItem>> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetFriendItemList(const TArray<TEUIModelRef<FVM_FriendItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_FriendItemList = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_FriendItem>> GetApplyItemList() const property
    {
        const TArray<TEUIModelRef<FVM_FriendItem>> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<TEUIModelRef<FVM_FriendItem>> GetModify_ApplyItemList() property
    {
        TArray<TEUIModelRef<FVM_FriendItem>> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetApplyItemList(const TArray<TEUIModelRef<FVM_FriendItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ApplyItemList = __Value;
        return;
    }
    int GetFriendContextStateIndex() const property
    {
        this.TrackPropertyRead(8);
        return this.m_FriendContextStateIndex;
    }
    void SetFriendContextStateIndex(const int __Value) property
    {
        if (this.m_FriendContextStateIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_FriendContextStateIndex = __Value;
        return;
    }
    bool GetbIsShowFriendNum() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bIsShowFriendNum;
    }
    void SetbIsShowFriendNum(const bool __Value) property
    {
        if (!(this.m_bIsShowFriendNum) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bIsShowFriendNum = __Value;
        return;
    }
    EFriendContextStateIndex GetFriendContextState() const property
    {
        this.TrackPropertyRead(10);
        return this.m_FriendContextState;
    }
    void SetFriendContextState(const EFriendContextStateIndex __Value) property
    {
        if (int(this.m_FriendContextState) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_FriendContextState = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ChatFriendPanel
{
    UPROPERTY()
    TEUIModelRef<FVM_ChatFriendPanel> Self;

    __GeneratedProperties_FVM_ChatFriendPanel()
    {
        return;
    }
}

namespace FVM_ChatFriendPanel
{
FVM_ChatFriendPanel& Create(const UObject ContextObject)
{
    return FVM_ChatFriendPanel::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ChatFriendPanel CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_ChatFriendPanel __r;
    TEUIModelRef<FVM_ChatFriendPanel> local_6 = TEUIModelRef<FVM_ChatFriendPanel>(EUIInternal::MakeModelWithManager(Manager, FVM_ChatFriendPanel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_ChatFriendPanel;
}
void __OnInitPanelData(FVM_ChatFriendPanel &inout Model)
{
    Model.OnInitPanelData();
    return;
}
void __RefreshChannelTab(FVM_ChatFriendPanel &inout Model)
{
    Model.RefreshChannelTab();
    return;
}
void __OnSearchFriendResultUpdated(FVM_ChatFriendPanel &inout Model)
{
    Model.OnSearchFriendResultUpdated();
    return;
}
void __OnUpdateFriendList(FVM_ChatFriendPanel &inout Model)
{
    Model.OnUpdateFriendList();
    return;
}
void __OnUpdateApplyList(FVM_ChatFriendPanel &inout Model)
{
    Model.OnUpdateApplyList();
    return;
}
void __OnFriendDataUpdated(FVM_ChatFriendPanel &inout Model, const FMsg_FriendDataUpdated &inout Message)
{
    Model.OnFriendDataUpdated(Message);
    return;
}
void __HandleAddFriendRequest(FVM_ChatFriendPanel &inout Model, const FMsg_AddFriendRsp &inout Message)
{
    Model.HandleAddFriendRequest(Message);
    return;
}
TArray<TEUIModelRef<FVM_FriendItem>> __UIGetter_SearchFriendItemList(const FVM_ChatFriendPanel &inout Model)
{
    return Model.GetSearchFriendItemList();
}
TEUIModelRef<FVM_ChatFriendPanel> __UIGetter_Self(const FVM_ChatFriendPanel &inout Model)
{
    return TEUIModelRef<FVM_ChatFriendPanel>(Model);
}
int __IndexOf_FriendDataModel()
{
    return 0;
}
int __IndexOf_ChatRuntimeData()
{
    return 1;
}
int __IndexOf_FriendTabs()
{
    return 2;
}
int __IndexOf_SearchFriendItemList()
{
    return 3;
}
int __IndexOf_SelectedFriendTab()
{
    return 4;
}
int __IndexOf_ContextFriendItemList()
{
    return 5;
}
int __IndexOf_FriendItemList()
{
    return 6;
}
int __IndexOf_ApplyItemList()
{
    return 7;
}
int __IndexOf_FriendContextStateIndex()
{
    return 8;
}
int __IndexOf_bIsShowFriendNum()
{
    return 9;
}
int __IndexOf_FriendContextState()
{
    return 10;
}
}
namespace __GeneratedProperties_FVM_ChatFriendPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

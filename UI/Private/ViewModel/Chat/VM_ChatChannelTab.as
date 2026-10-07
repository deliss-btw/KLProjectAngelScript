
enum EChatChannelParentType
{
    Chat,
    Friend,
}

namespace FVM_ChatChannelTab
{
    const int ModelId = 0;

}
struct FChatFriendChannelTab
{
    UPROPERTY()
    EChatChannelParentType ParentType;
    UPROPERTY()
    FText TabNameShow;
    UPROPERTY()
    FSoftBrush TabIcon;
    UPROPERTY()
    int ChannelID;
    UPROPERTY()
    FGameplayTag RedDotTag;


    void FullWihtChatTab(const FChatChannelTabInfoConfig &inout Config)
    {
        this.ParentType = EChatChannelParentType(0);
        this.TabNameShow = ::ChatSystemUtil::GetChannelTabDisplayName(Config.ChannelTab);
        this.TabIcon = Config.ChannelTabIcon;
        this.ChannelID = int(Config.ChannelTab);
        this.RedDotTag = FGameplayTag();
        return;
    }
    void FullWihtFriendTab(const FFriendTabInfoConfig &inout Config)
    {
        this.ParentType = EChatChannelParentType(1);
        this.TabNameShow = ::FriendUtil::GetTabDisplayName(Config.FriendTab);
        this.TabIcon = Config.FriendTabIcon;
        this.ChannelID = int(Config.FriendTab);
        this.RedDotTag = Config.RedDotTag;
        return;
    }
}

struct FVM_ChatChannelTab : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FChatFriendChannelTab m_TabInfo;
    UPROPERTY()
    FText m_TabNameShow;
    UPROPERTY()
    bool m_bIsSelected;
    UPROPERTY()
    FSoftBrush m_TabIcon;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;

    FVM_ChatChannelTab()
    {
        this.m_bIsSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ChatChannelTab' by default constructor.");
        return;
    }
    FVM_ChatChannelTab(const FVM_ChatChannelTab &inout Other)
    {
        this.m_bIsSelected = false;
        this.m_TabNameShow = Other.m_TabNameShow;
        this.m_bIsSelected = Other.m_bIsSelected;
        this.m_TabIcon = Other.m_TabIcon;
        this.m_RedDotVM = Other.m_RedDotVM;
        return;
    }
    FVM_ChatChannelTab(const FChatFriendChannelTab &inout InTabInfo)
    {
        this.m_bIsSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTabInfo(InTabInfo);
        return;
    }
    FVM_ChatChannelTab& opAssign(const FVM_ChatChannelTab &inout Other)
    {
        this.m_TabNameShow = Other.m_TabNameShow;
        this.m_bIsSelected = Other.m_bIsSelected;
        this.m_TabIcon = Other.m_TabIcon;
        return Other.m_RedDotVM;
    }
    void PostConstruct()
    {
        this.SetTabNameShow(this.GetTabInfo().TabNameShow);
        this.SetTabIcon(this.GetTabInfo().TabIcon);
        if (this.GetTabInfo().RedDotTag.IsValid())
        {
            this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(this.GetTabInfo().RedDotTag, 0))));
        }
        return;
    }
    int GetChannelSelectedState() const
    {
        return this.GetbIsSelected() ? 1 : 0;
    }
    FText GetTabName() const
    {
        return this.GetTabNameShow();
    }
    FSoftBrush GetChannelTabIcon() const
    {
        return this.GetTabIcon();
    }
    EChatChannelParentType GetParentType() const
    {
        return this.GetTabInfo().ParentType;
    }
    int GetTabChannelID() const
    {
        return this.GetTabInfo().ChannelID;
    }
    void SetSelectedVisualState(const bool bSelected)
    {
        if (!(bSelected) != !(this.GetbIsSelected()))
        {
            this.SetbIsSelected(bSelected);
        }
        return;
    }
    const FChatFriendChannelTab GetTabInfo() const property
    {
        const FChatFriendChannelTab __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FChatFriendChannelTab GetModify_TabInfo() property
    {
        FChatFriendChannelTab __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTabInfo(const FChatFriendChannelTab &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    const FText GetTabNameShow() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_TabNameShow() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTabNameShow(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TabNameShow = __Value;
        return;
    }
    bool GetbIsSelected() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsSelected;
    }
    void SetbIsSelected(const bool __Value) property
    {
        if (!(this.m_bIsSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsSelected = __Value;
        return;
    }
    const FSoftBrush GetTabIcon() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FSoftBrush GetModify_TabIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetTabIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TabIcon = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(4);
        return this.m_RedDotVM;
    }
    void SetRedDotVM(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDotVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_RedDotVM = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ChatChannelTab
{
    UPROPERTY()
    int ChannelSelectedState;
    UPROPERTY()
    FText TabName;
    UPROPERTY()
    FSoftBrush ChannelTabIcon;
    UPROPERTY()
    TEUIModelRef<FVM_ChatChannelTab> Self;


}

namespace FVM_ChatChannelTab
{
FVM_ChatChannelTab& Create(const UObject ContextObject, const FChatFriendChannelTab &inout TabInfo)
{
    return FVM_ChatChannelTab::CreateByManager(EUIInternal::GetContextManager(ContextObject), TabInfo);
}
FVM_ChatChannelTab CreateByManager(const UEUIManagerSubsystem Manager, const FChatFriendChannelTab &inout TabInfo)
{
    FVM_ChatChannelTab __r;
    TEUIModelRef<FVM_ChatChannelTab> local_6 = TEUIModelRef<FVM_ChatChannelTab>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ChatChannelTab::ModelId, 0, TabInfo));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RedDotVM";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ChannelSelectedState";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TabName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ChannelTabIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ChatChannelTab>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ChatChannelTab;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ChatChannelTab;
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_ChatChannelTab &inout Model)
{
    return Model.GetRedDotVM();
}
int __UIGetter_ChannelSelectedState(const FVM_ChatChannelTab &inout Model)
{
    return Model.GetChannelSelectedState();
}
FText __UIGetter_TabName(const FVM_ChatChannelTab &inout Model)
{
    return Model.GetTabName();
}
FSoftBrush __UIGetter_ChannelTabIcon(const FVM_ChatChannelTab &inout Model)
{
    return Model.GetChannelTabIcon();
}
TEUIModelRef<FVM_ChatChannelTab> __UIGetter_Self(const FVM_ChatChannelTab &inout Model)
{
    return TEUIModelRef<FVM_ChatChannelTab>(Model);
}
int __IndexOf_TabInfo()
{
    return 0;
}
int __IndexOf_TabNameShow()
{
    return 1;
}
int __IndexOf_bIsSelected()
{
    return 2;
}
int __IndexOf_TabIcon()
{
    return 3;
}
int __IndexOf_RedDotVM()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_ChatChannelTab
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

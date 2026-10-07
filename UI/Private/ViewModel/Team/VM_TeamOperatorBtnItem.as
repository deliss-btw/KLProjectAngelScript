
namespace FVM_TeamOperatorBtnItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnButtonClick = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectListenSocial = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectListenBattle = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectListenOff = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectSpeakSocial = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectSpeakBattle = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectSpeakOff = FEUIModelCallbackSignature();

}
struct FVM_TeamOperatorBtnItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FVM_TeamPanel> m_TeamPanel;
    UPROPERTY()
    ETeamOperatorBtnType m_ButtonType;
    UPROPERTY()
    bool m_bLast;
    UPROPERTY()
    FCommonHoverHandle m_HoverHandle;
    UPROPERTY()
    TEUIModelRef<FVM_BtnOperationList> m_HoverListModel;
    UPROPERTY()
    int m_VoiceStateVersion;

    FVM_TeamOperatorBtnItem()
    {
        this.m_ButtonType = ETeamOperatorBtnType(0);
        this.m_bLast = false;
        this.m_VoiceStateVersion = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TeamOperatorBtnItem' by default constructor.");
        return;
    }
    FVM_TeamOperatorBtnItem(const FVM_TeamOperatorBtnItem &inout Other)
    {
        this.m_ButtonType = ETeamOperatorBtnType(0);
        this.m_bLast = false;
        this.m_VoiceStateVersion = 0;
        this.m_TeamPanel = Other.m_TeamPanel;
        this.m_ButtonType = Other.m_ButtonType;
        this.m_bLast = Other.m_bLast;
        this.m_HoverListModel = Other.m_HoverListModel;
        this.m_VoiceStateVersion = int(Other.m_VoiceStateVersion);
        return;
    }
    FVM_TeamOperatorBtnItem(const TEUIModelWeakRef<FVM_TeamPanel> &inout InTeamPanel, const ETeamOperatorBtnType InButtonType)
    {
        this.m_ButtonType = ETeamOperatorBtnType(0);
        this.m_bLast = false;
        this.m_VoiceStateVersion = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTeamPanel(InTeamPanel);
        this.SetButtonType(ETeamOperatorBtnType(InButtonType));
        return;
    }
    FVM_TeamOperatorBtnItem opAssign(const FVM_TeamOperatorBtnItem &inout Other)
    {
        FVM_TeamOperatorBtnItem __r;
        this.m_TeamPanel = Other.m_TeamPanel;
        this.m_ButtonType = Other.m_ButtonType;
        this.m_bLast = Other.m_bLast;
        this.m_HoverListModel = Other.m_HoverListModel;
        this.m_VoiceStateVersion = int(Other.m_VoiceStateVersion);
        return __r;
    }
    void NotifyVoiceStateChanged()
    {
        this.SetVoiceStateVersion((this.GetVoiceStateVersion() + 1));
        return;
    }
    bool GetRightLineIsVisiable() const
    {
        return !(this.GetbLast());
    }
    void OnButtonClick(const UWidget Widget)
    {
        if (!(this.GetTeamPanel().IsValid()))
        {
            return;
        }
        switch (int(this.GetButtonType()))
        {
        case 0:
        {
            TEUIModelWeakRef<FVM_TeamPanel> local_2 = this.GetTeamPanel();
            InviteTeam();
            return;
        }
        case 1:
        {
            TEUIModelWeakRef<FVM_TeamPanel> local_2_2 = this.GetTeamPanel();
            if (IsSpecialMapForVoice())
            {
                TEUIModelWeakRef<FVM_TeamPanel> local_2_3 = this.GetTeamPanel();
                CycleListenState();
            }
            else
            {
                this.ShowListenDropdown(Widget);
            }
            return;
        }
        case 2:
        {
            TEUIModelWeakRef<FVM_TeamPanel> local_2_4 = this.GetTeamPanel();
            if (IsSpecialMapForVoice())
            {
                TEUIModelWeakRef<FVM_TeamPanel> local_2_5 = this.GetTeamPanel();
                CycleSpeakState();
            }
            else
            {
                this.ShowSpeakDropdown(Widget);
            }
            return;
        }
        case 3:
        {
            TEUIModelWeakRef<FVM_TeamPanel> local_2_6 = this.GetTeamPanel();
            LeaveTeam();
            return;
        }
        case 4:
        {
            TEUIModelWeakRef<FVM_TeamPanel> local_2_7 = this.GetTeamPanel();
            InviteTeamIntoDS();
            return;
        }
        }
        return;
    }
    void CloseHoverMenu()
    {
        if (this.GetHoverHandle())
        {
            ::CommonPopup::CloseHover(this.GetHoverHandle(), this.GetManager(), false);
            this.SetHoverHandle(FCommonHoverHandle::InvalidHandle);
            this.SetHoverListModel(TEUIModelRef<FVM_BtnOperationList>(nullptr));
        }
        return;
    }
    void ShowListenDropdown(const UWidget AnchorWidget)
    {
        const UTeamSettings local_2;
        this.CloseHoverMenu();
        GetGameplaySettings<UTeamSettings> local_4;
        local_2 = local_4;
        TArray<TEUIModelRef<FVM_BtnOperationItem>> local_10;
        if (local_2.OperatorTeamMuteIconConfigs.Contains(ETeamListenState(1)))
        {
            FOperatorBtnData local_104;
            TEUIModelRef<FVM_BtnOperationItem> local_106 = TEUIModelRef<FVM_BtnOperationItem>(::FVM_BtnOperationItem::Create(this.GetContext().Manager, local_104.ButtonText, local_104.Icon));
            GetOnClickGoToCallback().Bind(this, FVM_TeamOperatorBtnItem::OnSelectListenSocial);
            FEUIModelRef(this).SetClickModelRef();
            local_10.Add(local_106);
        }
        if (local_2.OperatorTeamMuteIconConfigs.Contains(ETeamListenState(2)))
        {
            FOperatorBtnData local_104;
            TEUIModelRef<FVM_BtnOperationItem> local_106 = TEUIModelRef<FVM_BtnOperationItem>(::FVM_BtnOperationItem::Create(this.GetContext().Manager, local_104.ButtonText, local_104.Icon));
            GetOnClickGoToCallback().Bind(this, FVM_TeamOperatorBtnItem::OnSelectListenBattle);
            FEUIModelRef(this).SetClickModelRef();
            local_10.Add(local_106);
        }
        if (local_2.OperatorTeamMuteIconConfigs.Contains(ETeamListenState(0)))
        {
            FOperatorBtnData local_104;
            TEUIModelRef<FVM_BtnOperationItem> local_108 = TEUIModelRef<FVM_BtnOperationItem>(::FVM_BtnOperationItem::Create(this.GetContext().Manager, local_104.ButtonText, local_104.Icon));
            TEUIModelRef<FVM_BtnOperationItem> local_106;
            GetOnClickGoToCallback().Bind(this, FVM_TeamOperatorBtnItem::OnSelectListenOff);
            FEUIModelRef(this).SetClickModelRef();
            local_10.Add(local_108);
        }
        this.ShowDropdown(AnchorWidget, local_10, local_2);
        return;
    }
    void ShowSpeakDropdown(const UWidget AnchorWidget)
    {
        const UTeamSettings local_2;
        this.CloseHoverMenu();
        GetGameplaySettings<UTeamSettings> local_4;
        local_2 = local_4;
        TArray<TEUIModelRef<FVM_BtnOperationItem>> local_10;
        if (local_2.OperatorTeamSpeakIconConfigs.Contains(ETeamSpeakState(1)))
        {
            FOperatorBtnData local_104;
            TEUIModelRef<FVM_BtnOperationItem> local_106 = TEUIModelRef<FVM_BtnOperationItem>(::FVM_BtnOperationItem::Create(this.GetContext().Manager, local_104.ButtonText, local_104.Icon));
            GetOnClickGoToCallback().Bind(this, FVM_TeamOperatorBtnItem::OnSelectSpeakSocial);
            FEUIModelRef(this).SetClickModelRef();
            local_10.Add(local_106);
        }
        if (local_2.OperatorTeamSpeakIconConfigs.Contains(ETeamSpeakState(2)))
        {
            FOperatorBtnData local_104;
            TEUIModelRef<FVM_BtnOperationItem> local_106 = TEUIModelRef<FVM_BtnOperationItem>(::FVM_BtnOperationItem::Create(this.GetContext().Manager, local_104.ButtonText, local_104.Icon));
            GetOnClickGoToCallback().Bind(this, FVM_TeamOperatorBtnItem::OnSelectSpeakBattle);
            FEUIModelRef(this).SetClickModelRef();
            local_10.Add(local_106);
        }
        if (local_2.OperatorTeamSpeakIconConfigs.Contains(ETeamSpeakState(0)))
        {
            FOperatorBtnData local_104;
            TEUIModelRef<FVM_BtnOperationItem> local_108 = TEUIModelRef<FVM_BtnOperationItem>(::FVM_BtnOperationItem::Create(this.GetContext().Manager, local_104.ButtonText, local_104.Icon));
            TEUIModelRef<FVM_BtnOperationItem> local_106;
            GetOnClickGoToCallback().Bind(this, FVM_TeamOperatorBtnItem::OnSelectSpeakOff);
            FEUIModelRef(this).SetClickModelRef();
            local_10.Add(local_108);
        }
        this.ShowDropdown(AnchorWidget, local_10, local_2);
        return;
    }
    void ShowDropdown(const UWidget AnchorWidget, TArray<TEUIModelRef<FVM_BtnOperationItem>> &inout BtnList, const UTeamSettings TeamSettings)
    {
        if (BtnList.IsEmpty())
        {
            return;
        }
        TEUIModelRef<FVM_BtnOperationList> local_4 = TEUIModelRef<FVM_BtnOperationList>(::FVM_BtnOperationList::Create(this.GetContext().Manager, BtnList));
        this.SetHoverListModel(local_4);
        FEUIModelContainer local_20;
        local_20.AddModel(local_4.opImplConv(), false);
        this.SetHoverHandle(::CommonPopup::HoverCustom(AnchorWidget, TeamSettings.ListInfoHover, local_20, true, true, ECommonHoverLayout(0), EEUILayoutLayer(0), false));
        return;
    }
    bool OnSelectListenSocial(const FEUIModelRef &inout ModelRef)
    {
        if (this.GetTeamPanel().IsValid())
        {
            TEUIModelWeakRef<FVM_TeamPanel> local_2 = this.GetTeamPanel();
            1.SetListenStateDirect();
        }
        this.CloseHoverMenu();
        return true;
    }
    bool OnSelectListenBattle(const FEUIModelRef &inout ModelRef)
    {
        if (this.GetTeamPanel().IsValid())
        {
            TEUIModelWeakRef<FVM_TeamPanel> local_2 = this.GetTeamPanel();
            2.SetListenStateDirect();
        }
        this.CloseHoverMenu();
        return true;
    }
    bool OnSelectListenOff(const FEUIModelRef &inout ModelRef)
    {
        if (this.GetTeamPanel().IsValid())
        {
            TEUIModelWeakRef<FVM_TeamPanel> local_2 = this.GetTeamPanel();
            0.SetListenStateDirect();
        }
        this.CloseHoverMenu();
        return true;
    }
    bool OnSelectSpeakSocial(const FEUIModelRef &inout ModelRef)
    {
        if (this.GetTeamPanel().IsValid())
        {
            TEUIModelWeakRef<FVM_TeamPanel> local_2 = this.GetTeamPanel();
            1.SetSpeakStateDirect();
        }
        this.CloseHoverMenu();
        return true;
    }
    bool OnSelectSpeakBattle(const FEUIModelRef &inout ModelRef)
    {
        if (this.GetTeamPanel().IsValid())
        {
            TEUIModelWeakRef<FVM_TeamPanel> local_2 = this.GetTeamPanel();
            2.SetSpeakStateDirect();
        }
        this.CloseHoverMenu();
        return true;
    }
    bool OnSelectSpeakOff(const FEUIModelRef &inout ModelRef)
    {
        if (this.GetTeamPanel().IsValid())
        {
            TEUIModelWeakRef<FVM_TeamPanel> local_2 = this.GetTeamPanel();
            0.SetSpeakStateDirect();
        }
        this.CloseHoverMenu();
        return true;
    }
    TEUIModelWeakRef<FVM_TeamPanel> GetTeamPanel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_TeamPanel;
    }
    void SetTeamPanel(const TEUIModelWeakRef<FVM_TeamPanel> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_TeamPanel> local_2;
        local_2 = this.m_TeamPanel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeamPanel = __Value;
        return;
    }
    ETeamOperatorBtnType GetButtonType() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ButtonType;
    }
    void SetButtonType(const ETeamOperatorBtnType __Value) property
    {
        if (int(this.m_ButtonType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ButtonType = __Value;
        return;
    }
    bool GetbLast() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bLast;
    }
    void SetbLast(const bool __Value) property
    {
        if (!(this.m_bLast) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bLast = __Value;
        return;
    }
    const FCommonHoverHandle GetHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FCommonHoverHandle GetModify_HoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        return;
    }
    TEUIModelRef<FVM_BtnOperationList> GetHoverListModel() const property
    {
        this.TrackPropertyRead(4);
        return this.m_HoverListModel;
    }
    void SetHoverListModel(const TEUIModelRef<FVM_BtnOperationList> &inout __Value) property
    {
        TEUIModelRef<FVM_BtnOperationList> local_2;
        local_2 = this.m_HoverListModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_HoverListModel = __Value;
        return;
    }
    int GetVoiceStateVersion() const property
    {
        this.TrackPropertyRead(5);
        return this.m_VoiceStateVersion;
    }
    void SetVoiceStateVersion(const int __Value) property
    {
        if (this.m_VoiceStateVersion == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_VoiceStateVersion = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TeamOperatorBtnItem
{
    UPROPERTY()
    bool RightLineIsVisiable;
    UPROPERTY()
    TEUIModelRef<FVM_TeamOperatorBtnItem> Self;


}

namespace FVM_TeamOperatorBtnItem
{
FVM_TeamOperatorBtnItem& Create(const UObject ContextObject, const TEUIModelWeakRef<FVM_TeamPanel> &inout TeamPanel, const ETeamOperatorBtnType ButtonType)
{
    return FVM_TeamOperatorBtnItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), TeamPanel);
}
FVM_TeamOperatorBtnItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FVM_TeamPanel> &inout TeamPanel, const ETeamOperatorBtnType ButtonType)
{
    FVM_TeamOperatorBtnItem __r;
    TEUIModelRef<FVM_TeamOperatorBtnItem> local_6 = TEUIModelRef<FVM_TeamOperatorBtnItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TeamOperatorBtnItem::ModelId, 0, TeamPanel, ButtonType));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ButtonType";
    local_14.TypeName = "ETeamOperatorBtnType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "VoiceStateVersion";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightLineIsVisiable";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TeamOperatorBtnItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TeamOperatorBtnItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TeamOperatorBtnItem;
}
ETeamOperatorBtnType __UIGetter_ButtonType(const FVM_TeamOperatorBtnItem &inout Model)
{
    return Model.GetButtonType();
}
int __UIGetter_VoiceStateVersion(const FVM_TeamOperatorBtnItem &inout Model)
{
    return Model.GetVoiceStateVersion();
}
bool __UIGetter_RightLineIsVisiable(const FVM_TeamOperatorBtnItem &inout Model)
{
    return Model.GetRightLineIsVisiable();
}
TEUIModelRef<FVM_TeamOperatorBtnItem> __UIGetter_Self(const FVM_TeamOperatorBtnItem &inout Model)
{
    return TEUIModelRef<FVM_TeamOperatorBtnItem>(Model);
}
int __IndexOf_TeamPanel()
{
    return 0;
}
int __IndexOf_ButtonType()
{
    return 1;
}
int __IndexOf_bLast()
{
    return 2;
}
int __IndexOf_HoverHandle()
{
    return 3;
}
int __IndexOf_HoverListModel()
{
    return 4;
}
int __IndexOf_VoiceStateVersion()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_TeamOperatorBtnItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

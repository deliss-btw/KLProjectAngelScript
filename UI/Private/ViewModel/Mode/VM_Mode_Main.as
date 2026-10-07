
namespace FVM_Mode_Main
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnHoveredModeConfirm = FEUIModelCallbackSignature();

}
struct FVM_Mode_Main : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FSoftBrush m_DefaultBG;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_Mode_EntranceItem>> m_DisplayingModes;
    UPROPERTY()
    FText m_CurHoveredModeName;
    UPROPERTY()
    FText m_CurHoveredModeDesc;
    UPROPERTY()
    FSoftBrush m_CurHoveredModeBG;
    UPROPERTY()
    TEUIModelWeakRef<FVM_Mode_EntranceItem> m_CurHoveredMode;
    UPROPERTY()
    TArray<TEUIModelRef<FM_ModeItem>> m_ModeList;

    FVM_Mode_Main()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_Mode_Main(const FVM_Mode_Main &inout Other)
    {
        this.m_DefaultBG = Other.m_DefaultBG;
        this.m_DisplayingModes = Other.m_DisplayingModes;
        this.m_CurHoveredModeName = Other.m_CurHoveredModeName;
        this.m_CurHoveredModeDesc = Other.m_CurHoveredModeDesc;
        this.m_CurHoveredModeBG = Other.m_CurHoveredModeBG;
        this.m_CurHoveredMode = Other.m_CurHoveredMode;
        this.m_ModeList = Other.m_ModeList;
        return;
    }
    FVM_Mode_Main& opAssign(const FVM_Mode_Main &inout Other)
    {
        this.m_DefaultBG = Other.m_DefaultBG;
        this.m_DisplayingModes = Other.m_DisplayingModes;
        this.m_CurHoveredModeName = Other.m_CurHoveredModeName;
        this.m_CurHoveredModeDesc = Other.m_CurHoveredModeDesc;
        this.m_CurHoveredModeBG = Other.m_CurHoveredModeBG;
        this.m_CurHoveredMode = Other.m_CurHoveredMode;
        return Other.m_ModeList;
    }
    void LoadConfig(const FConfigVM_Mode_Main &inout InConfig)
    {
        this.SetDefaultBG(InConfig.DefaultBG);
        return;
    }
    void PostConstruct()
    {
        TDataObjectIterator<FMatchConfig> local_16;
        for (; local_16; )
        {
            const FMatchConfig& local_20 = local_16.GetData();
            if (!(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemLockedByLockSources(local_20.GetSystemControlCfg())))
            {
                FM_ModeItem& local_24 = ::FM_ModeItem::Create(this.GetContext().Manager, int(local_20.DataId));
                this.GetModify_ModeList().Add(TEUIModelRef<FM_ModeItem>(local_24));
                TEUIModelRef<FVM_Mode_EntranceItem> local_32 = TEUIModelRef<FVM_Mode_EntranceItem>(::FVM_Mode_EntranceItem::Create(this.GetContext().Manager, (TEUIModelWeakRef<FM_ModeItem>(local_24))));
                this.GetModify_DisplayingModes().Add(local_32);
            }
            local_16.Next();
        }
        return;
    }
    void PostLoad()
    {
        this.SetCurHoveredModeBG(this.GetDefaultBG());
        if (this.GetDisplayingModes().IsValidIndex(0))
        {
            TEUIModelWeakRef<FVM_Mode_EntranceItem> local_6;
            this.SetCurHoveredMode(local_6);
            if (this.GetCurHoveredMode().IsValid())
            {
                local_6 = this.GetCurHoveredMode();
                SetHovered();
            }
        }
        return;
    }
    void OnHoveredModeConfirm()
    {
        int local_10 = 0;
        int local_26 = 0;
        int local_34 = 0;
        bool local_3 = this.GetCurHoveredMode().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelWeakRef<FVM_Mode_EntranceItem> local_2 = this.GetCurHoveredMode();
            TEUIModelWeakRef<FM_ModeItem> local_6;
            local_6.GetMode();
            local_3 = local_6.IsValid();
        }
        if (local_3)
        {
            TEUIModelWeakRef<FM_ModeItem> local_6;
            TEUIModelWeakRef<FVM_Mode_EntranceItem> local_2_2 = this.GetCurHoveredMode();
            local_6.GetMode();
            int64 local_14 = local_10.GetDataId();
            TEUIModelWeakRef<FVM_Mode_EntranceItem> local_2_3 = this.GetCurHoveredMode();
            ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(GetRedDotEntranceTag(), local_14);
            if (local_10.GetMatchConfig())
            {
                const FMatchConfig& local_16;
                if (!(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(local_16.GetSystemControlCfg(), true)))
                {
                    return;
                }
                if (int(local_16.MatchMode) == 0)
                {
                    FEUIModelWeakRef local_22 = FEUIModelWeakRef(FEUIModelRef(local_10));
                    local_6 = TEUIModelWeakRef<FM_ModeItem>(local_22);
                    FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, local_16.WidgetTag, FEUIModelRef(local_26));
                    return;
                }
                if (int(local_16.MatchMode) == 1)
                {
                    TEUIModelRef<FM_ModeItem> local_32 = TEUIModelRef<FM_ModeItem>(local_10);
                    FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, local_16.WidgetTag, FEUIModelRef(local_34));
                }
            }
        }
        return;
    }
    void OnModeEntranceItemHovered(const FMsg_ModeEntranceItemHovered &inout Msg)
    {
        if (this.GetCurHoveredMode().IsValid())
        {
            TEUIModelWeakRef<FVM_Mode_EntranceItem> local_2 = this.GetCurHoveredMode();
            SetUnHovered();
        }
        if (Msg.HoveredModeItem.IsValid())
        {
            this.SetCurHoveredMode(Msg.HoveredModeItem);
            TEUIModelWeakRef<FVM_Mode_EntranceItem> local_2_2 = this.GetCurHoveredMode();
            SetHovered();
        }
        return;
    }
    void OnModeEntranceItemClicked(const FMsg_ModeEntranceItemClicked &inout Msg)
    {
        bool local_1;
        if (!(Msg.ClickedModeItem.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            TEUIModelWeakRef<FVM_Mode_EntranceItem> local_4;
            local_4 = Msg.ClickedModeItem;
            local_1 = (local_4 == this.GetCurHoveredMode().opImplConv());
        }
        if (local_1)
        {
            this.OnHoveredModeConfirm();
        }
        return;
    }
    void OnCurHoveredModeChanged()
    {
        if (this.GetCurHoveredMode().IsValid())
        {
            TEUIModelWeakRef<FVM_Mode_EntranceItem> local_2 = this.GetCurHoveredMode();
            this.SetCurHoveredModeName(GetModeName());
            TEUIModelWeakRef<FVM_Mode_EntranceItem> local_2_2 = this.GetCurHoveredMode();
            this.SetCurHoveredModeDesc(GetModeDesc());
            FSoftBrush local_48;
            TEUIModelWeakRef<FVM_Mode_EntranceItem> local_2_3 = this.GetCurHoveredMode();
            if (GetModeBG().IsSet())
            {
                TEUIModelWeakRef<FVM_Mode_EntranceItem> local_2_4 = this.GetCurHoveredMode();
                local_48 = GetModeBG();
            }
            else
            {
                local_48 = this.GetDefaultBG();
            }
            this.SetCurHoveredModeBG(local_48);
        }
        return;
    }
    const FSoftBrush GetDefaultBG() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FSoftBrush GetModify_DefaultBG() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDefaultBG(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DefaultBG = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_Mode_EntranceItem>> GetDisplayingModes() const property
    {
        const TArray<TEUIModelRef<FVM_Mode_EntranceItem>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_Mode_EntranceItem>> GetModify_DisplayingModes() property
    {
        TArray<TEUIModelRef<FVM_Mode_EntranceItem>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDisplayingModes(const TArray<TEUIModelRef<FVM_Mode_EntranceItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DisplayingModes = __Value;
        return;
    }
    const FText GetCurHoveredModeName() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_CurHoveredModeName() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCurHoveredModeName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurHoveredModeName = __Value;
        return;
    }
    const FText GetCurHoveredModeDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_CurHoveredModeDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCurHoveredModeDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurHoveredModeDesc = __Value;
        return;
    }
    const FSoftBrush GetCurHoveredModeBG() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FSoftBrush GetModify_CurHoveredModeBG() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCurHoveredModeBG(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CurHoveredModeBG = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_Mode_EntranceItem> GetCurHoveredMode() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CurHoveredMode;
    }
    void SetCurHoveredMode(const TEUIModelWeakRef<FVM_Mode_EntranceItem> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_Mode_EntranceItem> local_2;
        local_2 = this.m_CurHoveredMode;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CurHoveredMode = __Value;
        return;
    }
    const TArray<TEUIModelRef<FM_ModeItem>> GetModeList() const property
    {
        const TArray<TEUIModelRef<FM_ModeItem>> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<TEUIModelRef<FM_ModeItem>> GetModify_ModeList() property
    {
        TArray<TEUIModelRef<FM_ModeItem>> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetModeList(const TArray<TEUIModelRef<FM_ModeItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ModeList = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Mode_Main
{
    UPROPERTY()
    TEUIModelRef<FVM_Mode_Main> Self;

    __GeneratedProperties_FVM_Mode_Main()
    {
        return;
    }
}

namespace FVM_Mode_Main
{
FVM_Mode_Main& Create(const UObject ContextObject)
{
    return FVM_Mode_Main::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_Mode_Main CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_Mode_Main __r;
    TEUIModelRef<FVM_Mode_Main> local_6 = TEUIModelRef<FVM_Mode_Main>(EUIInternal::MakeModelWithManager(Manager, FVM_Mode_Main::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayingModes";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_Mode_EntranceItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurHoveredModeName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurHoveredModeDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurHoveredModeBG";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Mode_Main>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Mode_Main;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnModeEntranceItemHovered";
    local_26.MessageTypeName = "Msg_ModeEntranceItemHovered";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnModeEntranceItemClicked";
    local_26.MessageTypeName = "Msg_ModeEntranceItemClicked";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    FEUIModelDirtyDefine local_38;
    local_38.FunctionName = "__OnCurHoveredModeChanged";
    local_38.DirtyFlags.Set(FVM_Mode_Main::__IndexOf_CurHoveredMode());
    Result.DirtyFunctions.Add(local_38);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Mode_Main;
}
void __OnModeEntranceItemHovered(FVM_Mode_Main &inout Model, const FMsg_ModeEntranceItemHovered &inout Message)
{
    Model.OnModeEntranceItemHovered(Message);
    return;
}
void __OnModeEntranceItemClicked(FVM_Mode_Main &inout Model, const FMsg_ModeEntranceItemClicked &inout Message)
{
    Model.OnModeEntranceItemClicked(Message);
    return;
}
void __OnCurHoveredModeChanged(FVM_Mode_Main &inout Model)
{
    Model.OnCurHoveredModeChanged();
    return;
}
TArray<TEUIModelRef<FVM_Mode_EntranceItem>> __UIGetter_DisplayingModes(const FVM_Mode_Main &inout Model)
{
    return Model.GetDisplayingModes();
}
FText __UIGetter_CurHoveredModeName(const FVM_Mode_Main &inout Model)
{
    return Model.GetCurHoveredModeName();
}
FText __UIGetter_CurHoveredModeDesc(const FVM_Mode_Main &inout Model)
{
    return Model.GetCurHoveredModeDesc();
}
FSoftBrush __UIGetter_CurHoveredModeBG(const FVM_Mode_Main &inout Model)
{
    return Model.GetCurHoveredModeBG();
}
TEUIModelRef<FVM_Mode_Main> __UIGetter_Self(const FVM_Mode_Main &inout Model)
{
    return TEUIModelRef<FVM_Mode_Main>(Model);
}
int __IndexOf_DefaultBG()
{
    return 0;
}
int __IndexOf_DisplayingModes()
{
    return 1;
}
int __IndexOf_CurHoveredModeName()
{
    return 2;
}
int __IndexOf_CurHoveredModeDesc()
{
    return 3;
}
int __IndexOf_CurHoveredModeBG()
{
    return 4;
}
int __IndexOf_CurHoveredMode()
{
    return 5;
}
int __IndexOf_ModeList()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_Mode_Main
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

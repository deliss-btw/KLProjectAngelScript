
namespace FVM_Mode_EntranceItem
{
    const int ModelId = 0;

}
struct FVM_Mode_EntranceItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FM_ModeItem> m_Mode;
    UPROPERTY()
    FText m_ModeName;
    UPROPERTY()
    FSoftBrush m_ModeImage;
    UPROPERTY()
    FText m_ModeDesc;
    UPROPERTY()
    FSoftBrush m_ModeBG;
    UPROPERTY()
    bool m_bHovered;
    UPROPERTY()
    bool m_bIsForbidden;
    UPROPERTY()
    FGameplayTag m_RedDotEntranceTag;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;

    FVM_Mode_EntranceItem()
    {
        this.m_bHovered = false;
        this.m_bIsForbidden = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_Mode_EntranceItem' by default constructor.");
        return;
    }
    FVM_Mode_EntranceItem(const FVM_Mode_EntranceItem &inout Other)
    {
        this.m_bHovered = false;
        this.m_bIsForbidden = true;
        this.m_Mode = Other.m_Mode;
        this.m_ModeName = Other.m_ModeName;
        this.m_ModeImage = Other.m_ModeImage;
        this.m_ModeDesc = Other.m_ModeDesc;
        this.m_ModeBG = Other.m_ModeBG;
        this.m_bHovered = Other.m_bHovered;
        this.m_bIsForbidden = Other.m_bIsForbidden;
        this.m_RedDotEntranceTag = Other.m_RedDotEntranceTag;
        this.m_RedDotVM = Other.m_RedDotVM;
        return;
    }
    FVM_Mode_EntranceItem(const TEUIModelWeakRef<FM_ModeItem> &inout InMode)
    {
        this.m_bHovered = false;
        this.m_bIsForbidden = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMode(InMode);
        return;
    }
    FVM_Mode_EntranceItem& opAssign(const FVM_Mode_EntranceItem &inout Other)
    {
        this.m_Mode = Other.m_Mode;
        this.m_ModeName = Other.m_ModeName;
        this.m_ModeImage = Other.m_ModeImage;
        this.m_ModeDesc = Other.m_ModeDesc;
        this.m_ModeBG = Other.m_ModeBG;
        this.m_bHovered = Other.m_bHovered;
        this.m_bIsForbidden = Other.m_bIsForbidden;
        this.m_RedDotEntranceTag = Other.m_RedDotEntranceTag;
        return Other.m_RedDotVM;
    }
    void LoadConfig(const FConfigVM_Mode_EntranceItem &inout InConfig)
    {
        this.SetRedDotEntranceTag(InConfig.RedDotEntranceTag);
        return;
    }
    void PostConstruct()
    {
        bool local_3 = this.GetMode().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelWeakRef<FM_ModeItem> local_2 = this.GetMode();
            local_3 = GetMatchConfig().IsSet();
        }
        if (local_3)
        {
            TEUIModelWeakRef<FM_ModeItem> local_2_2 = this.GetMode();
            TEUIModelWeakRef<FM_ModeItem> local_2_3 = this.GetMode();
            TEUIModelWeakRef<FM_ModeItem> local_2_4 = this.GetMode();
            TEUIModelWeakRef<FM_ModeItem> local_2_5 = this.GetMode();
        }
        this.RefreshForbiddenState();
        return;
    }
    void RefreshForbiddenState()
    {
        bool local_3 = this.GetMode().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelWeakRef<FM_ModeItem> local_2 = this.GetMode();
            local_3 = GetMatchConfig().IsSet();
        }
        if (local_3)
        {
            TEUIModelWeakRef<FM_ModeItem> local_2_2 = this.GetMode();
            this.SetbIsForbidden(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemBlocked(GetSystemControlCfg()));
        }
        return;
    }
    void OnSystemBlockChanged(const FMsg_SystemBlockChanged &inout Msg)
    {
        this.RefreshForbiddenState();
        return;
    }
    void OnSystemControlAllNotify(const FMsg_SystemControlAllNotify &inout Msg)
    {
        this.RefreshForbiddenState();
        return;
    }
    void PostLoad()
    {
        bool local_3 = this.GetMode().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelWeakRef<FM_ModeItem> local_2 = this.GetMode();
            local_3 = GetMatchConfig().IsSet();
        }
        if (local_3)
        {
            TEUIModelWeakRef<FM_ModeItem> local_2_2 = this.GetMode();
            this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(this.GetRedDotEntranceTag(), GetDataId()))));
        }
        return;
    }
    void SetHovered()
    {
        this.SetbHovered(true);
        return;
    }
    void SetUnHovered()
    {
        this.SetbHovered(false);
        return;
    }
    TEUIModelWeakRef<FM_ModeItem> GetMode() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Mode;
    }
    void SetMode(const TEUIModelWeakRef<FM_ModeItem> &inout __Value) property
    {
        TEUIModelWeakRef<FM_ModeItem> local_2;
        local_2 = this.m_Mode;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Mode = __Value;
        return;
    }
    const FText GetModeName() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_ModeName() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetModeName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ModeName = __Value;
        return;
    }
    const FSoftBrush GetModeImage() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSoftBrush GetModify_ModeImage() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetModeImage(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ModeImage = __Value;
        return;
    }
    const FText GetModeDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_ModeDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetModeDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ModeDesc = __Value;
        return;
    }
    const FSoftBrush GetModeBG() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FSoftBrush GetModify_ModeBG() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetModeBG(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ModeBG = __Value;
        return;
    }
    bool GetbHovered() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bHovered;
    }
    void SetbHovered(const bool __Value) property
    {
        if (!(this.m_bHovered) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bHovered = __Value;
        return;
    }
    bool GetbIsForbidden() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bIsForbidden;
    }
    void SetbIsForbidden(const bool __Value) property
    {
        if (!(this.m_bIsForbidden) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bIsForbidden = __Value;
        return;
    }
    const FGameplayTag GetRedDotEntranceTag() const property
    {
        const FGameplayTag __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FGameplayTag GetModify_RedDotEntranceTag() property
    {
        FGameplayTag __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetRedDotEntranceTag(const FGameplayTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_RedDotEntranceTag = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(8);
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
        this.MarkPropertyDirty(8);
        this.m_RedDotVM = __Value;
        return;
    }
}

struct FMsg_ModeEntranceItemHovered : FEUIMessage
{
    UPROPERTY()
    TEUIModelWeakRef<FVM_Mode_EntranceItem> HoveredModeItem;

    FMsg_ModeEntranceItemHovered()
    {
        return;
    }
}

struct FMsg_ModeEntranceItemClicked : FEUIMessage
{
    UPROPERTY()
    TEUIModelWeakRef<FVM_Mode_EntranceItem> ClickedModeItem;

    FMsg_ModeEntranceItemClicked()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_Mode_EntranceItem
{
    UPROPERTY()
    TEUIModelRef<FVM_Mode_EntranceItem> Self;

    __GeneratedProperties_FVM_Mode_EntranceItem()
    {
        return;
    }
}

namespace FVM_Mode_EntranceItem
{
FVM_Mode_EntranceItem& Create(const UObject ContextObject, const TEUIModelWeakRef<FM_ModeItem> &inout Mode)
{
    return FVM_Mode_EntranceItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Mode);
}
FVM_Mode_EntranceItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FM_ModeItem> &inout Mode)
{
    FVM_Mode_EntranceItem __r;
    TEUIModelRef<FVM_Mode_EntranceItem> local_6 = TEUIModelRef<FVM_Mode_EntranceItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_Mode_EntranceItem::ModelId, 0, Mode));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ModeName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ModeImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHovered";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsForbidden";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RedDotVM";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Mode_EntranceItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Mode_EntranceItem;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnSystemBlockChanged";
    local_26.MessageTypeName = "Msg_SystemBlockChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnSystemControlAllNotify";
    local_26.MessageTypeName = "Msg_SystemControlAllNotify";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Mode_EntranceItem;
}
void __OnSystemBlockChanged(FVM_Mode_EntranceItem &inout Model, const FMsg_SystemBlockChanged &inout Message)
{
    Model.OnSystemBlockChanged(Message);
    return;
}
void __OnSystemControlAllNotify(FVM_Mode_EntranceItem &inout Model, const FMsg_SystemControlAllNotify &inout Message)
{
    Model.OnSystemControlAllNotify(Message);
    return;
}
FText __UIGetter_ModeName(const FVM_Mode_EntranceItem &inout Model)
{
    return Model.GetModeName();
}
FSoftBrush __UIGetter_ModeImage(const FVM_Mode_EntranceItem &inout Model)
{
    return Model.GetModeImage();
}
bool __UIGetter_bHovered(const FVM_Mode_EntranceItem &inout Model)
{
    return Model.GetbHovered();
}
bool __UIGetter_bIsForbidden(const FVM_Mode_EntranceItem &inout Model)
{
    return Model.GetbIsForbidden();
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_Mode_EntranceItem &inout Model)
{
    return Model.GetRedDotVM();
}
TEUIModelRef<FVM_Mode_EntranceItem> __UIGetter_Self(const FVM_Mode_EntranceItem &inout Model)
{
    return TEUIModelRef<FVM_Mode_EntranceItem>(Model);
}
int __IndexOf_Mode()
{
    return 0;
}
int __IndexOf_ModeName()
{
    return 1;
}
int __IndexOf_ModeImage()
{
    return 2;
}
int __IndexOf_ModeDesc()
{
    return 3;
}
int __IndexOf_ModeBG()
{
    return 4;
}
int __IndexOf_bHovered()
{
    return 5;
}
int __IndexOf_bIsForbidden()
{
    return 6;
}
int __IndexOf_RedDotEntranceTag()
{
    return 7;
}
int __IndexOf_RedDotVM()
{
    return 8;
}
}
namespace __GeneratedProperties_FVM_Mode_EntranceItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

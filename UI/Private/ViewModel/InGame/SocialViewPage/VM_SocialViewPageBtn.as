
namespace FVM_SocialViewPageBigBtn
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnAction = FEUIModelCallbackSignature();
}
namespace FVM_SocialViewPageSmallBtn
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnAction = FEUIModelCallbackSignature();

}
struct FVM_SocialViewPageBigBtn : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FSocialViewPageButtonConfig> m_ButtonConfig;

    FVM_SocialViewPageBigBtn()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_SocialViewPageBigBtn' by default constructor.");
        return;
    }
    FVM_SocialViewPageBigBtn(const FVM_SocialViewPageBigBtn &inout Other)
    {
        this.m_ButtonConfig = Other.m_ButtonConfig;
        return;
    }
    FVM_SocialViewPageBigBtn(const TDataObjectPtr<FSocialViewPageButtonConfig> &inout InButtonConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetButtonConfig(InButtonConfig);
        return;
    }
    FVM_SocialViewPageBigBtn& opAssign(const FVM_SocialViewPageBigBtn &inout Other)
    {
        return Other.m_ButtonConfig;
    }
    FText GetText() const
    {
        FText local_10;
        if (this.GetButtonConfig())
        {
            local_10 = this.GetButtonConfig().opArrow().Name;
        }
        else
        {
            local_10 = FText();
        }
        return local_10;
    }
    FSoftBrush GetIcon() const
    {
        FSoftBrush local_92;
        if (this.GetButtonConfig())
        {
            local_92 = this.GetButtonConfig().opArrow().Icon;
        }
        else
        {
            local_92 = FSoftBrush();
        }
        return local_92;
    }
    TArray<FEUIInputAction> GetAction() const
    {
        UInputAction local_6;
        TArray<FEUIInputAction> local_4;
        if (this.GetButtonConfig() && (local_6 != nullptr))
        {
            local_4.Add(FEUIInputAction(this.GetButtonConfig().opArrow().InputAction));
        }
        return local_4;
    }
    void OnAction()
    {
        if (!(this.GetButtonConfig()))
        {
            return;
        }
        USocialViewPageOperator local_6 = ::SocialViewPageOperatorUtils::GetOperator(this.GetButtonConfig().opArrow().OperatorType);
        if ((!((local_6 != nullptr))))
        {
            FCommonTipsParam local_14;
            ::CommonPopup::Tips(NSLOCTEXT("SocialViewPage", "OperatorNotFound", "еЉџиѓЅжљ‚жњЄејЂж”ѕ"), local_14);
            return;
        }
        local_6.Execute(::FVMS_SocialViewPage::Get(this.GetContext().UELocalPlayer.GetWorld()).BuildOperatorContext(), this.GetButtonConfig());
        return;
    }
    const TDataObjectPtr<FSocialViewPageButtonConfig> GetButtonConfig() const property
    {
        const TDataObjectPtr<FSocialViewPageButtonConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FSocialViewPageButtonConfig> GetModify_ButtonConfig() property
    {
        TDataObjectPtr<FSocialViewPageButtonConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetButtonConfig(const TDataObjectPtr<FSocialViewPageButtonConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ButtonConfig = __Value;
        return;
    }
}

struct FVM_SocialViewPageSmallBtn : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FSocialViewPageButtonConfig> m_ButtonConfig;

    FVM_SocialViewPageSmallBtn()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_SocialViewPageSmallBtn' by default constructor.");
        return;
    }
    FVM_SocialViewPageSmallBtn(const FVM_SocialViewPageSmallBtn &inout Other)
    {
        this.m_ButtonConfig = Other.m_ButtonConfig;
        return;
    }
    FVM_SocialViewPageSmallBtn(const TDataObjectPtr<FSocialViewPageButtonConfig> &inout InButtonConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetButtonConfig(InButtonConfig);
        return;
    }
    FVM_SocialViewPageSmallBtn& opAssign(const FVM_SocialViewPageSmallBtn &inout Other)
    {
        return Other.m_ButtonConfig;
    }
    FText GetText() const
    {
        FText local_10;
        if (this.GetButtonConfig())
        {
            local_10 = this.GetButtonConfig().opArrow().Name;
        }
        else
        {
            local_10 = FText();
        }
        return local_10;
    }
    FSoftBrush GetIcon() const
    {
        FSoftBrush local_92;
        if (this.GetButtonConfig())
        {
            local_92 = this.GetButtonConfig().opArrow().Icon;
        }
        else
        {
            local_92 = FSoftBrush();
        }
        return local_92;
    }
    TArray<FEUIInputAction> GetAction() const
    {
        UInputAction local_6;
        TArray<FEUIInputAction> local_4;
        if (this.GetButtonConfig() && (local_6 != nullptr))
        {
            local_4.Add(FEUIInputAction(this.GetButtonConfig().opArrow().InputAction));
        }
        return local_4;
    }
    void OnAction()
    {
        if (!(this.GetButtonConfig()))
        {
            return;
        }
        USocialViewPageOperator local_6 = ::SocialViewPageOperatorUtils::GetOperator(this.GetButtonConfig().opArrow().OperatorType);
        if ((!((local_6 != nullptr))))
        {
            return;
        }
        local_6.Execute(::FVMS_SocialViewPage::Get(this.GetContext().UELocalPlayer.GetWorld()).BuildOperatorContext(), this.GetButtonConfig());
        return;
    }
    const TDataObjectPtr<FSocialViewPageButtonConfig> GetButtonConfig() const property
    {
        const TDataObjectPtr<FSocialViewPageButtonConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FSocialViewPageButtonConfig> GetModify_ButtonConfig() property
    {
        TDataObjectPtr<FSocialViewPageButtonConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetButtonConfig(const TDataObjectPtr<FSocialViewPageButtonConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ButtonConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SocialViewPageBigBtn
{
    UPROPERTY()
    FText Text;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    TArray<FEUIInputAction> Action;
    UPROPERTY()
    TEUIModelRef<FVM_SocialViewPageBigBtn> Self;

    __GeneratedProperties_FVM_SocialViewPageBigBtn()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_SocialViewPageSmallBtn
{
    UPROPERTY()
    FText Text;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    TArray<FEUIInputAction> Action;
    UPROPERTY()
    TEUIModelRef<FVM_SocialViewPageSmallBtn> Self;

    __GeneratedProperties_FVM_SocialViewPageSmallBtn()
    {
        return;
    }
}

namespace FVM_SocialViewPageBigBtn
{
FVM_SocialViewPageBigBtn& Create(const UObject ContextObject, const TDataObjectPtr<FSocialViewPageButtonConfig> &inout ButtonConfig)
{
    return FVM_SocialViewPageBigBtn::CreateByManager(EUIInternal::GetContextManager(ContextObject), ButtonConfig);
}
FVM_SocialViewPageBigBtn CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FSocialViewPageButtonConfig> &inout ButtonConfig)
{
    FVM_SocialViewPageBigBtn __r;
    TEUIModelRef<FVM_SocialViewPageBigBtn> local_6 = TEUIModelRef<FVM_SocialViewPageBigBtn>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_SocialViewPageBigBtn::ModelId, 0, ButtonConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ButtonConfig";
    local_14.TypeName = "TDataObjectPtr<FSocialViewPageButtonConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Text";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Icon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Action";
    local_14.TypeName = "TArray<FEUIInputAction>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SocialViewPageBigBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SocialViewPageBigBtn;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SocialViewPageBigBtn;
}
TDataObjectPtr<FSocialViewPageButtonConfig> __UIGetter_ButtonConfig(const FVM_SocialViewPageBigBtn &inout Model)
{
    return Model.GetButtonConfig();
}
FText __UIGetter_Text(const FVM_SocialViewPageBigBtn &inout Model)
{
    return Model.GetText();
}
FSoftBrush __UIGetter_Icon(const FVM_SocialViewPageBigBtn &inout Model)
{
    return Model.GetIcon();
}
TArray<FEUIInputAction> __UIGetter_Action(const FVM_SocialViewPageBigBtn &inout Model)
{
    return Model.GetAction();
}
TEUIModelRef<FVM_SocialViewPageBigBtn> __UIGetter_Self(const FVM_SocialViewPageBigBtn &inout Model)
{
    return TEUIModelRef<FVM_SocialViewPageBigBtn>(Model);
}
int __IndexOf_ButtonConfig()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_SocialViewPageBigBtn
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_SocialViewPageSmallBtn
{
FVM_SocialViewPageSmallBtn& Create(const UObject ContextObject, const TDataObjectPtr<FSocialViewPageButtonConfig> &inout ButtonConfig)
{
    return FVM_SocialViewPageSmallBtn::CreateByManager(EUIInternal::GetContextManager(ContextObject), ButtonConfig);
}
FVM_SocialViewPageSmallBtn CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FSocialViewPageButtonConfig> &inout ButtonConfig)
{
    FVM_SocialViewPageSmallBtn __r;
    TEUIModelRef<FVM_SocialViewPageSmallBtn> local_6 = TEUIModelRef<FVM_SocialViewPageSmallBtn>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_SocialViewPageSmallBtn::ModelId, 0, ButtonConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ButtonConfig";
    local_14.TypeName = "TDataObjectPtr<FSocialViewPageButtonConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Text";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Icon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Action";
    local_14.TypeName = "TArray<FEUIInputAction>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SocialViewPageSmallBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SocialViewPageSmallBtn;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SocialViewPageSmallBtn;
}
TDataObjectPtr<FSocialViewPageButtonConfig> __UIGetter_ButtonConfig(const FVM_SocialViewPageSmallBtn &inout Model)
{
    return Model.GetButtonConfig();
}
FText __UIGetter_Text(const FVM_SocialViewPageSmallBtn &inout Model)
{
    return Model.GetText();
}
FSoftBrush __UIGetter_Icon(const FVM_SocialViewPageSmallBtn &inout Model)
{
    return Model.GetIcon();
}
TArray<FEUIInputAction> __UIGetter_Action(const FVM_SocialViewPageSmallBtn &inout Model)
{
    return Model.GetAction();
}
TEUIModelRef<FVM_SocialViewPageSmallBtn> __UIGetter_Self(const FVM_SocialViewPageSmallBtn &inout Model)
{
    return TEUIModelRef<FVM_SocialViewPageSmallBtn>(Model);
}
int __IndexOf_ButtonConfig()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_SocialViewPageSmallBtn
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

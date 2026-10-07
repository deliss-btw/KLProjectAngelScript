
namespace FVM_MinimapIconDecoratorTooltip
{
    const int ModelId = 0;
}
namespace FVM_MinimapIconDecoratorExtraModel
{
    const int ModelId = 0;
}
namespace FVM_MinimapIconDecoratorTooltipPanel
{
    const int ModelId = 0;

}
struct FVM_MinimapIconDecoratorTooltip : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FMinimapIconDecoratorTooltip m_Tooltip;
    UPROPERTY()
    UWidget m_TipsFromWidget;
    UPROPERTY()
    FText m_TooltipText;
    UPROPERTY()
    FText m_DetailText;
    UPROPERTY()
    TArray<FEUIModelRef> m_Actions;

    FVM_MinimapIconDecoratorTooltip()
    {
        this.m_TipsFromWidget = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MinimapIconDecoratorTooltip' by default constructor.");
        return;
    }
    FVM_MinimapIconDecoratorTooltip(const FVM_MinimapIconDecoratorTooltip &inout Other)
    {
        this.m_TipsFromWidget = nullptr;
        this.m_TipsFromWidget = Other.m_TipsFromWidget;
        this.m_TooltipText = Other.m_TooltipText;
        this.m_DetailText = Other.m_DetailText;
        this.m_Actions = Other.m_Actions;
        return;
    }
    FVM_MinimapIconDecoratorTooltip(const FMinimapIconDecoratorTooltip &inout InTooltip)
    {
        this.m_TipsFromWidget = nullptr;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTooltip(InTooltip);
        return;
    }
    FVM_MinimapIconDecoratorTooltip& opAssign(const FVM_MinimapIconDecoratorTooltip &inout Other)
    {
        this.m_TipsFromWidget = Other.m_TipsFromWidget;
        this.m_TooltipText = Other.m_TooltipText;
        this.m_DetailText = Other.m_DetailText;
        return Other.m_Actions;
    }
    void PostConstruct()
    {
        this.SetTooltipText(this.GetTooltip().Tooltip);
        this.SetDetailText(this.GetTooltip().Detail);
        return;
    }
    void AddAction(const UObject ContextObject, const UInputAction InputAction, const FEUIViewModel &inout Model, const FEUIModelCallbackSignature &inout ModelCallback)
    {
        FSimpleModelEvent local_22;
        local_22.Add(Model, ModelCallback);
        FEUIInputAction local_28 = FEUIInputAction(InputAction);
        FEUIModelRef local_30;
        this.GetModify_Actions().Add(local_30);
        return;
    }
    const FMinimapIconDecoratorTooltip GetTooltip() const property
    {
        const FMinimapIconDecoratorTooltip __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FMinimapIconDecoratorTooltip GetModify_Tooltip() property
    {
        FMinimapIconDecoratorTooltip __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTooltip(const FMinimapIconDecoratorTooltip &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    UWidget GetTipsFromWidget() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TipsFromWidget;
    }
    void SetTipsFromWidget(const UWidget __Value) property
    {
        if (this.m_TipsFromWidget == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    const FText GetTooltipText() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_TooltipText() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTooltipText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TooltipText = __Value;
        return;
    }
    const FText GetDetailText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_DetailText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetDetailText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_DetailText = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetActions() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_Actions() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetActions(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Actions = __Value;
        return;
    }
}

struct FVM_MinimapIconDecoratorExtraModel : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FEUIModelRef m_ExtraModel;

    FVM_MinimapIconDecoratorExtraModel()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MinimapIconDecoratorExtraModel' by default constructor.");
        return;
    }
    FVM_MinimapIconDecoratorExtraModel(const FVM_MinimapIconDecoratorExtraModel &inout Other)
    {
        this.m_ExtraModel = Other.m_ExtraModel;
        return;
    }
    FVM_MinimapIconDecoratorExtraModel(const FEUIModelRef &inout InExtraModel)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetExtraModel(InExtraModel);
        return;
    }
    FVM_MinimapIconDecoratorExtraModel& opAssign(const FVM_MinimapIconDecoratorExtraModel &inout Other)
    {
        return Other.m_ExtraModel;
    }
    const FEUIModelRef GetExtraModel() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelRef GetModify_ExtraModel() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetExtraModel(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ExtraModel = __Value;
        return;
    }
}

struct FVM_MinimapIconDecoratorTooltipPanel : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FEUIModelRef m_BaseTooltip;
    UPROPERTY()
    FEUIModelRef m_ExtraModel;
    UPROPERTY()
    TArray<FEUIModelRef> m_DecoratorTooltips;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> m_BaseTooltipWidgetClass;

    FVM_MinimapIconDecoratorTooltipPanel()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MinimapIconDecoratorTooltipPanel(const FVM_MinimapIconDecoratorTooltipPanel &inout Other)
    {
        this.m_BaseTooltip = Other.m_BaseTooltip;
        this.m_ExtraModel = Other.m_ExtraModel;
        this.m_DecoratorTooltips = Other.m_DecoratorTooltips;
        this.m_BaseTooltipWidgetClass = Other.m_BaseTooltipWidgetClass;
        return;
    }
    FVM_MinimapIconDecoratorTooltipPanel& opAssign(const FVM_MinimapIconDecoratorTooltipPanel &inout Other)
    {
        this.m_BaseTooltip = Other.m_BaseTooltip;
        this.m_ExtraModel = Other.m_ExtraModel;
        this.m_DecoratorTooltips = Other.m_DecoratorTooltips;
        return Other.m_BaseTooltipWidgetClass;
    }
    ESlateVisibility GetBaseTooltipVisibility() const
    {
        int local_2;
        if (this.GetBaseTooltip().IsValid())
        {
            local_2 = 4;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility GetDecoratorTooltipVisibility() const
    {
        int local_2;
        if (this.GetDecoratorTooltips().IsEmpty())
        {
            local_2 = 1;
        }
        else
        {
            local_2 = 4;
        }
        return ESlateVisibility(local_2);
    }
    FEUIModelContainer GetBaseTooltipModelContainer() const
    {
        FEUIModelContainer local_14 = FEUIModelContainer(this.GetBaseTooltip());
        if (this.GetExtraModel().IsValid())
        {
            local_14.AddModel(this.GetExtraModel(), false);
        }
        return local_14;
    }
    const FEUIModelRef GetBaseTooltip() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelRef GetModify_BaseTooltip() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetBaseTooltip(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_BaseTooltip = __Value;
        return;
    }
    const FEUIModelRef GetExtraModel() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIModelRef GetModify_ExtraModel() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetExtraModel(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ExtraModel = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetDecoratorTooltips() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_DecoratorTooltips() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDecoratorTooltips(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DecoratorTooltips = __Value;
        return;
    }
    TSoftClassPtr<UUserWidget> GetBaseTooltipWidgetClass() const property
    {
        this.TrackPropertyRead(3);
        return this.m_BaseTooltipWidgetClass;
    }
    void SetBaseTooltipWidgetClass(const TSoftClassPtr<UUserWidget> &inout __Value) property
    {
        if ((this.m_BaseTooltipWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_BaseTooltipWidgetClass = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MinimapIconDecoratorTooltip
{
    UPROPERTY()
    TEUIModelRef<FVM_MinimapIconDecoratorTooltip> Self;

    __GeneratedProperties_FVM_MinimapIconDecoratorTooltip()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_MinimapIconDecoratorExtraModel
{
    UPROPERTY()
    TEUIModelRef<FVM_MinimapIconDecoratorExtraModel> Self;

    __GeneratedProperties_FVM_MinimapIconDecoratorExtraModel()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_MinimapIconDecoratorTooltipPanel
{
    UPROPERTY()
    ESlateVisibility BaseTooltipVisibility;
    UPROPERTY()
    ESlateVisibility DecoratorTooltipVisibility;
    UPROPERTY()
    FEUIModelContainer BaseTooltipModelContainer;
    UPROPERTY()
    TEUIModelRef<FVM_MinimapIconDecoratorTooltipPanel> Self;


}

namespace FVM_MinimapIconDecoratorTooltip
{
FVM_MinimapIconDecoratorTooltip& Create(const UObject ContextObject, const FMinimapIconDecoratorTooltip &inout Tooltip)
{
    return FVM_MinimapIconDecoratorTooltip::CreateByManager(EUIInternal::GetContextManager(ContextObject), Tooltip);
}
FVM_MinimapIconDecoratorTooltip CreateByManager(const UEUIManagerSubsystem Manager, const FMinimapIconDecoratorTooltip &inout Tooltip)
{
    FVM_MinimapIconDecoratorTooltip __r;
    TEUIModelRef<FVM_MinimapIconDecoratorTooltip> local_6 = TEUIModelRef<FVM_MinimapIconDecoratorTooltip>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MinimapIconDecoratorTooltip::ModelId, 0, Tooltip));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TipsFromWidget";
    local_14.TypeName = "UWidget";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TooltipText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DetailText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Actions";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MinimapIconDecoratorTooltip>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MinimapIconDecoratorTooltip;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MinimapIconDecoratorTooltip;
}
UWidget __UIGetter_TipsFromWidget(const FVM_MinimapIconDecoratorTooltip &inout Model)
{
    return Model.GetTipsFromWidget();
}
FText __UIGetter_TooltipText(const FVM_MinimapIconDecoratorTooltip &inout Model)
{
    return Model.GetTooltipText();
}
FText __UIGetter_DetailText(const FVM_MinimapIconDecoratorTooltip &inout Model)
{
    return Model.GetDetailText();
}
TArray<FEUIModelRef> __UIGetter_Actions(const FVM_MinimapIconDecoratorTooltip &inout Model)
{
    return Model.GetActions();
}
TEUIModelRef<FVM_MinimapIconDecoratorTooltip> __UIGetter_Self(const FVM_MinimapIconDecoratorTooltip &inout Model)
{
    return TEUIModelRef<FVM_MinimapIconDecoratorTooltip>(Model);
}
int __IndexOf_Tooltip()
{
    return 0;
}
int __IndexOf_TipsFromWidget()
{
    return 1;
}
int __IndexOf_TooltipText()
{
    return 2;
}
int __IndexOf_DetailText()
{
    return 3;
}
int __IndexOf_Actions()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_MinimapIconDecoratorTooltip
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_MinimapIconDecoratorExtraModel
{
FVM_MinimapIconDecoratorExtraModel& Create(const UObject ContextObject, const FEUIModelRef &inout ExtraModel)
{
    return FVM_MinimapIconDecoratorExtraModel::CreateByManager(EUIInternal::GetContextManager(ContextObject), ExtraModel);
}
FVM_MinimapIconDecoratorExtraModel CreateByManager(const UEUIManagerSubsystem Manager, const FEUIModelRef &inout ExtraModel)
{
    FVM_MinimapIconDecoratorExtraModel __r;
    TEUIModelRef<FVM_MinimapIconDecoratorExtraModel> local_6 = TEUIModelRef<FVM_MinimapIconDecoratorExtraModel>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MinimapIconDecoratorExtraModel::ModelId, 0, ExtraModel));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MinimapIconDecoratorExtraModel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MinimapIconDecoratorExtraModel;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MinimapIconDecoratorExtraModel;
}
TEUIModelRef<FVM_MinimapIconDecoratorExtraModel> __UIGetter_Self(const FVM_MinimapIconDecoratorExtraModel &inout Model)
{
    return TEUIModelRef<FVM_MinimapIconDecoratorExtraModel>(Model);
}
int __IndexOf_ExtraModel()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_MinimapIconDecoratorExtraModel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_MinimapIconDecoratorTooltipPanel
{
FVM_MinimapIconDecoratorTooltipPanel& Create(const UObject ContextObject)
{
    return FVM_MinimapIconDecoratorTooltipPanel::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MinimapIconDecoratorTooltipPanel CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MinimapIconDecoratorTooltipPanel __r;
    TEUIModelRef<FVM_MinimapIconDecoratorTooltipPanel> local_6 = TEUIModelRef<FVM_MinimapIconDecoratorTooltipPanel>(EUIInternal::MakeModelWithManager(Manager, FVM_MinimapIconDecoratorTooltipPanel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DecoratorTooltips";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BaseTooltipWidgetClass";
    local_14.TypeName = "TSoftClassPtr<UUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BaseTooltipVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DecoratorTooltipVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BaseTooltipModelContainer";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MinimapIconDecoratorTooltipPanel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MinimapIconDecoratorTooltipPanel;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MinimapIconDecoratorTooltipPanel;
}
TArray<FEUIModelRef> __UIGetter_DecoratorTooltips(const FVM_MinimapIconDecoratorTooltipPanel &inout Model)
{
    return Model.GetDecoratorTooltips();
}
TSoftClassPtr<UUserWidget> __UIGetter_BaseTooltipWidgetClass(const FVM_MinimapIconDecoratorTooltipPanel &inout Model)
{
    return Model.GetBaseTooltipWidgetClass();
}
ESlateVisibility __UIGetter_BaseTooltipVisibility(const FVM_MinimapIconDecoratorTooltipPanel &inout Model)
{
    return Model.GetBaseTooltipVisibility();
}
ESlateVisibility __UIGetter_DecoratorTooltipVisibility(const FVM_MinimapIconDecoratorTooltipPanel &inout Model)
{
    return Model.GetDecoratorTooltipVisibility();
}
FEUIModelContainer __UIGetter_BaseTooltipModelContainer(const FVM_MinimapIconDecoratorTooltipPanel &inout Model)
{
    return Model.GetBaseTooltipModelContainer();
}
TEUIModelRef<FVM_MinimapIconDecoratorTooltipPanel> __UIGetter_Self(const FVM_MinimapIconDecoratorTooltipPanel &inout Model)
{
    return TEUIModelRef<FVM_MinimapIconDecoratorTooltipPanel>(Model);
}
int __IndexOf_BaseTooltip()
{
    return 0;
}
int __IndexOf_ExtraModel()
{
    return 1;
}
int __IndexOf_DecoratorTooltips()
{
    return 2;
}
int __IndexOf_BaseTooltipWidgetClass()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_MinimapIconDecoratorTooltipPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

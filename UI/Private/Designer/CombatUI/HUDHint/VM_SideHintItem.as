
namespace FVM_SideHintItem
{
    const int ModelId = 0;

}
struct FVM_SideHintItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bShowHint;
    UPROPERTY()
    UTexture2D m_Icon;
    UPROPERTY()
    FText m_HintTitle;
    UPROPERTY()
    FText m_HintText;
    UPROPERTY()
    ESlateVisibility m_IconVisibility;

    FVM_SideHintItem()
    {
        this.m_Icon = nullptr;
        this.m_bShowHint = false;
        this.m_IconVisibility = ESlateVisibility(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SideHintItem(const FVM_SideHintItem &inout Other)
    {
        this.m_Icon = nullptr;
        this.m_bShowHint = false;
        this.m_IconVisibility = ESlateVisibility(0);
        this.m_bShowHint = Other.m_bShowHint;
        this.m_Icon = Other.m_Icon;
        this.m_HintTitle = Other.m_HintTitle;
        this.m_HintText = Other.m_HintText;
        this.m_IconVisibility = Other.m_IconVisibility;
        return;
    }
    FVM_SideHintItem opAssign(const FVM_SideHintItem &inout Other)
    {
        FVM_SideHintItem __r;
        this.m_bShowHint = Other.m_bShowHint;
        this.m_Icon = Other.m_Icon;
        this.m_HintTitle = Other.m_HintTitle;
        this.m_HintText = Other.m_HintText;
        this.m_IconVisibility = Other.m_IconVisibility;
        return __r;
    }
    void Tick()
    {
        this.SetbShowHint(false);
        if (this.GetIcon() == nullptr && (int(this.GetIconVisibility()) == 0))
        {
            this.SetIconVisibility(ESlateVisibility(ESlateVisibility(2)));
        }
        return;
    }
    bool GetbShowHint() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bShowHint;
    }
    void SetbShowHint(const bool __Value) property
    {
        if (!(this.m_bShowHint) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bShowHint = __Value;
        return;
    }
    UTexture2D GetIcon() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Icon;
    }
    void SetIcon(const UTexture2D __Value) property
    {
        if (this.m_Icon == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    const FText GetHintTitle() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_HintTitle() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetHintTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_HintTitle = __Value;
        return;
    }
    const FText GetHintText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_HintText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetHintText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_HintText = __Value;
        return;
    }
    ESlateVisibility GetIconVisibility() const property
    {
        this.TrackPropertyRead(4);
        return this.m_IconVisibility;
    }
    void SetIconVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_IconVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_IconVisibility = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SideHintItem
{
    UPROPERTY()
    TEUIModelRef<FVM_SideHintItem> Self;

    __GeneratedProperties_FVM_SideHintItem()
    {
        return;
    }
}

namespace FVM_SideHintItem
{
FVM_SideHintItem& Create(const UObject ContextObject)
{
    return FVM_SideHintItem::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SideHintItem CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SideHintItem __r;
    TEUIModelRef<FVM_SideHintItem> local_6 = TEUIModelRef<FVM_SideHintItem>(EUIInternal::MakeModelWithManager(Manager, FVM_SideHintItem::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bShowHint";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Icon";
    local_14.TypeName = "UTexture2D";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HintTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HintText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SideHintItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SideHintItem;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SideHintItem;
}
void __Tick(FVM_SideHintItem &inout Model)
{
    Model.Tick();
    return;
}
bool __UIGetter_bShowHint(const FVM_SideHintItem &inout Model)
{
    return Model.GetbShowHint();
}
UTexture2D __UIGetter_Icon(const FVM_SideHintItem &inout Model)
{
    return Model.GetIcon();
}
FText __UIGetter_HintTitle(const FVM_SideHintItem &inout Model)
{
    return Model.GetHintTitle();
}
FText __UIGetter_HintText(const FVM_SideHintItem &inout Model)
{
    return Model.GetHintText();
}
ESlateVisibility __UIGetter_IconVisibility(const FVM_SideHintItem &inout Model)
{
    return Model.GetIconVisibility();
}
TEUIModelRef<FVM_SideHintItem> __UIGetter_Self(const FVM_SideHintItem &inout Model)
{
    return TEUIModelRef<FVM_SideHintItem>(Model);
}
int __IndexOf_bShowHint()
{
    return 0;
}
int __IndexOf_Icon()
{
    return 1;
}
int __IndexOf_HintTitle()
{
    return 2;
}
int __IndexOf_HintText()
{
    return 3;
}
int __IndexOf_IconVisibility()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_SideHintItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

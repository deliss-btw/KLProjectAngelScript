
namespace FVM_CommonActionEntry
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ExecuteClick = FEUIModelCallbackSignature();

}
struct FVM_CommonActionEntry : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_NameText;
    UPROPERTY()
    FEUIInputAction m_InputAction;
    UPROPERTY()
    FSimpleModelEvent m_OnExecute;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> m_HoverWidgetClass;
    UPROPERTY()
    FEUIModelContainer m_HoverModels;
    UPROPERTY()
    bool m_bAllowArrow;
    UPROPERTY()
    TWeakObjectPtr<UWidget> m_SharedHoverAnchor;

    FVM_CommonActionEntry()
    {
        this.m_bAllowArrow = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CommonActionEntry(const FVM_CommonActionEntry &inout Other)
    {
        this.m_bAllowArrow = true;
        this.m_NameText = Other.m_NameText;
        this.m_InputAction = Other.m_InputAction;
        this.m_HoverWidgetClass = Other.m_HoverWidgetClass;
        this.m_HoverModels = Other.m_HoverModels;
        this.m_bAllowArrow = Other.m_bAllowArrow;
        this.m_SharedHoverAnchor = Other.m_SharedHoverAnchor;
        return;
    }
    FVM_CommonActionEntry& opAssign(const FVM_CommonActionEntry &inout Other)
    {
        this.m_NameText = Other.m_NameText;
        this.m_InputAction = Other.m_InputAction;
        this.m_HoverWidgetClass = Other.m_HoverWidgetClass;
        this.m_HoverModels = Other.m_HoverModels;
        this.m_bAllowArrow = Other.m_bAllowArrow;
        return Other.m_SharedHoverAnchor;
    }
    void Setup(const FText &inout InNameText)
    {
        this.SetNameText(InNameText);
        this.SetInputAction(FEUIInputAction());
        FSimpleModelEvent local_28;
        this.SetOnExecute(local_28);
        this.SetHoverWidgetClass(TSoftClassPtr<UUserWidget>());
        this.SetHoverModels(FEUIModelContainer());
        this.SetbAllowArrow(true);
        return;
    }
    void UseExecute(const FSimpleModelEvent &inout InOnExecute, const FEUIInputAction &inout InInputAction = FEUIInputAction())
    {
        this.SetOnExecute(InOnExecute);
        this.SetInputAction(InInputAction);
        this.SetHoverWidgetClass(TSoftClassPtr<UUserWidget>());
        this.SetHoverModels(FEUIModelContainer());
        return;
    }
    void UseHover(const TSoftClassPtr<UUserWidget> &inout InHoverWidgetClass, const FEUIModelContainer &inout InHoverModels = FEUIModelContainer(), const FEUIInputAction &inout InInputAction = FEUIInputAction())
    {
        FSimpleModelEvent local_22;
        this.SetOnExecute(local_22);
        this.SetInputAction(InInputAction);
        this.SetHoverWidgetClass(InHoverWidgetClass);
        this.SetHoverModels(InHoverModels);
        return;
    }
    void AllowArrow(const bool bInAllowArrow = true)
    {
        this.SetbAllowArrow(bInAllowArrow);
        return;
    }
    FText UIGetDisplayNameText() const
    {
        return this.GetNameText();
    }
    FEUIInputAction UIGetDisplayedInputAction() const
    {
        if (!(this.IsActionableOrHoverable()))
        {
            return FEUIInputAction();
        }
        return this.GetInputAction();
    }
    bool HasClickAction() const
    {
        return this.GetOnExecute().IsBound();
    }
    bool HasHoverContent() const
    {
        return !(this.GetHoverWidgetClass().IsNull());
    }
    TSoftClassPtr<UUserWidget> UIGetDisplayedHoverWidgetClass() const
    {
        return this.GetHoverWidgetClass();
    }
    FEUIModelContainer UIGetDisplayedHoverModels() const
    {
        return this.GetHoverModels();
    }
    bool IsActionableOrHoverable() const
    {
        return this.HasClickAction() || this.HasHoverContent();
    }
    ESlateVisibility UIGetInputActionVisibility() const
    {
        int local_3;
        if (this.IsActionableOrHoverable() && !(this.GetInputAction().IsNull()))
        {
            local_3 = 4;
        }
        else
        {
            local_3 = 1;
        }
        return ESlateVisibility(local_3);
    }
    ESlateVisibility UIGetClickButtonVisibility() const
    {
        int local_2;
        if (this.HasClickAction())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility UIGetHoverProviderVisibility() const
    {
        int local_2;
        if (this.HasHoverContent())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility UIGetArrowVisibility() const
    {
        int local_3;
        if (this.GetbAllowArrow() && this.IsActionableOrHoverable())
        {
            local_3 = 4;
        }
        else
        {
            local_3 = 1;
        }
        return ESlateVisibility(local_3);
    }
    int UIGetArrowActiveIndex() const
    {
        return !(this.HasClickAction()) && this.HasHoverContent() ? 0 : 1;
    }
    int UIGetStateActiveIndex() const
    {
        return this.IsActionableOrHoverable() ? 0 : 1;
    }
    float32 UIGetContentOpacity() const
    {
        return this.IsActionableOrHoverable() ? 1.0f : 0.5f;
    }
    void ExecuteClick()
    {
        if (this.GetOnExecute().IsBound())
        {
            this.GetOnExecute().Broadcast();
        }
        return;
    }
    void SetSharedHoverAnchor(const UWidget InHoverAnchor)
    {
        this.SetSharedHoverAnchor(TWeakObjectPtr<UWidget>(InHoverAnchor));
        return;
    }
    UWidget ResolveSharedHoverAnchorWidget() const
    {
        TWeakObjectPtr<UWidget> local_2 = this.GetSharedHoverAnchor();
        UWidget local_4;
        return local_4;
    }
    const FText GetNameText() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_NameText() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetNameText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_NameText = __Value;
        return;
    }
    FEUIInputAction GetInputAction() const property
    {
        FEUIInputAction __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIInputAction GetModify_InputAction() property
    {
        FEUIInputAction __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetInputAction(const FEUIInputAction &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_InputAction = __Value;
        return;
    }
    const FSimpleModelEvent GetOnExecute() const property
    {
        const FSimpleModelEvent __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSimpleModelEvent GetModify_OnExecute() property
    {
        FSimpleModelEvent __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOnExecute(const FSimpleModelEvent &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
    TSoftClassPtr<UUserWidget> GetHoverWidgetClass() const property
    {
        this.TrackPropertyRead(3);
        return this.m_HoverWidgetClass;
    }
    void SetHoverWidgetClass(const TSoftClassPtr<UUserWidget> &inout __Value) property
    {
        if ((this.m_HoverWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_HoverWidgetClass = __Value;
        return;
    }
    FEUIModelContainer GetHoverModels() const property
    {
        FEUIModelContainer __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIModelContainer GetModify_HoverModels() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetHoverModels(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_HoverModels = __Value;
        return;
    }
    bool GetbAllowArrow() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bAllowArrow;
    }
    void SetbAllowArrow(const bool __Value) property
    {
        if (!(this.m_bAllowArrow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bAllowArrow = __Value;
        return;
    }
    TWeakObjectPtr<UWidget> GetSharedHoverAnchor() const property
    {
        this.TrackPropertyRead(6);
        return this.m_SharedHoverAnchor;
    }
    void SetSharedHoverAnchor(const TWeakObjectPtr<UWidget> &inout __Value) property
    {
        if ((this.m_SharedHoverAnchor == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_SharedHoverAnchor = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommonActionEntry
{
    UPROPERTY()
    FText DisplayNameText;
    UPROPERTY()
    FEUIInputAction DisplayedInputAction;
    UPROPERTY()
    bool HasClickAction;
    UPROPERTY()
    bool HasHoverContent;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> DisplayedHoverWidgetClass;
    UPROPERTY()
    FEUIModelContainer DisplayedHoverModels;
    UPROPERTY()
    bool IsActionableOrHoverable;
    UPROPERTY()
    ESlateVisibility InputActionVisibility;
    UPROPERTY()
    ESlateVisibility ClickButtonVisibility;
    UPROPERTY()
    ESlateVisibility HoverProviderVisibility;
    UPROPERTY()
    ESlateVisibility ArrowVisibility;
    UPROPERTY()
    int ArrowActiveIndex;
    UPROPERTY()
    int StateActiveIndex;
    UPROPERTY()
    float32 ContentOpacity;
    UPROPERTY()
    TEUIModelRef<FVM_CommonActionEntry> Self;


}

namespace FVM_CommonActionEntry
{
FVM_CommonActionEntry& Create(const UObject ContextObject)
{
    return FVM_CommonActionEntry::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommonActionEntry CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommonActionEntry __r;
    TEUIModelRef<FVM_CommonActionEntry> local_6 = TEUIModelRef<FVM_CommonActionEntry>(EUIInternal::MakeModelWithManager(Manager, FVM_CommonActionEntry::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayNameText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayedInputAction";
    local_14.TypeName = "FEUIInputAction";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasClickAction";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasHoverContent";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayedHoverWidgetClass";
    local_14.TypeName = "TSoftClassPtr<UUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayedHoverModels";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsActionableOrHoverable";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "InputActionVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ClickButtonVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoverProviderVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ArrowVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ArrowActiveIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "StateActiveIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ContentOpacity";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonActionEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonActionEntry;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonActionEntry;
}
FText __UIGetter_DisplayNameText(const FVM_CommonActionEntry &inout Model)
{
    return Model.UIGetDisplayNameText();
}
FEUIInputAction __UIGetter_DisplayedInputAction(const FVM_CommonActionEntry &inout Model)
{
    return Model.UIGetDisplayedInputAction();
}
bool __UIGetter_HasClickAction(const FVM_CommonActionEntry &inout Model)
{
    return Model.HasClickAction();
}
bool __UIGetter_HasHoverContent(const FVM_CommonActionEntry &inout Model)
{
    return Model.HasHoverContent();
}
TSoftClassPtr<UUserWidget> __UIGetter_DisplayedHoverWidgetClass(const FVM_CommonActionEntry &inout Model)
{
    return Model.UIGetDisplayedHoverWidgetClass();
}
FEUIModelContainer __UIGetter_DisplayedHoverModels(const FVM_CommonActionEntry &inout Model)
{
    return Model.UIGetDisplayedHoverModels();
}
bool __UIGetter_IsActionableOrHoverable(const FVM_CommonActionEntry &inout Model)
{
    return Model.IsActionableOrHoverable();
}
ESlateVisibility __UIGetter_InputActionVisibility(const FVM_CommonActionEntry &inout Model)
{
    return Model.UIGetInputActionVisibility();
}
ESlateVisibility __UIGetter_ClickButtonVisibility(const FVM_CommonActionEntry &inout Model)
{
    return Model.UIGetClickButtonVisibility();
}
ESlateVisibility __UIGetter_HoverProviderVisibility(const FVM_CommonActionEntry &inout Model)
{
    return Model.UIGetHoverProviderVisibility();
}
ESlateVisibility __UIGetter_ArrowVisibility(const FVM_CommonActionEntry &inout Model)
{
    return Model.UIGetArrowVisibility();
}
int __UIGetter_ArrowActiveIndex(const FVM_CommonActionEntry &inout Model)
{
    return Model.UIGetArrowActiveIndex();
}
int __UIGetter_StateActiveIndex(const FVM_CommonActionEntry &inout Model)
{
    return Model.UIGetStateActiveIndex();
}
float32 __UIGetter_ContentOpacity(const FVM_CommonActionEntry &inout Model)
{
    return Model.UIGetContentOpacity();
}
TEUIModelRef<FVM_CommonActionEntry> __UIGetter_Self(const FVM_CommonActionEntry &inout Model)
{
    return TEUIModelRef<FVM_CommonActionEntry>(Model);
}
int __IndexOf_NameText()
{
    return 0;
}
int __IndexOf_InputAction()
{
    return 1;
}
int __IndexOf_OnExecute()
{
    return 2;
}
int __IndexOf_HoverWidgetClass()
{
    return 3;
}
int __IndexOf_HoverModels()
{
    return 4;
}
int __IndexOf_bAllowArrow()
{
    return 5;
}
int __IndexOf_SharedHoverAnchor()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_CommonActionEntry
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}


namespace FVM_AttributeValueItem
{
    const int ModelId = 0;

}
struct FVM_AttributeValueItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FGameAttributeRef m_Attribute;
    UPROPERTY()
    float32 m_Value;
    UPROPERTY()
    FEUIModelRef m_HoverTips;

    FVM_AttributeValueItem()
    {
        this.m_Value = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AttributeValueItem' by default constructor.");
        return;
    }
    FVM_AttributeValueItem(const FVM_AttributeValueItem &inout Other)
    {
        this.m_Value = 0.0f;
        this.m_Attribute = Other.m_Attribute;
        this.m_Value = Other.m_Value;
        this.m_HoverTips = Other.m_HoverTips;
        return;
    }
    FVM_AttributeValueItem(const FGameAttributeRef &inout InAttribute, const float32 InValue)
    {
        this.m_Value = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAttribute(InAttribute);
        this.SetValue(InValue);
        return;
    }
    FVM_AttributeValueItem& opAssign(const FVM_AttributeValueItem &inout Other)
    {
        this.m_Attribute = Other.m_Attribute;
        this.m_Value = Other.m_Value;
        return Other.m_HoverTips;
    }
    void UpdateHoverTips()
    {
        FText local_4 = this.GetDescription();
        FText local_8 = this.GetName();
        this.SetHoverTips(FEUIModelRef());
        return;
    }
    FSoftBrush GetIcon() const
    {
        TDataObjectPtr<FAttributeConfig> local_24 = this.GetAttrConfig();
        if (local_24)
        {
            if (UICommonUtil::CVar_UI_UseAttributePresentation.GetBool())
            {
                return local_24.opArrow().Presentation.GetIcon();
            }
            return local_24.opArrow().AttributeIcon;
        }
        return FSoftBrush();
    }
    FText GetName() const
    {
        TDataObjectPtr<FAttributeConfig> local_24 = this.GetAttrConfig();
        if (local_24)
        {
            if (UICommonUtil::CVar_UI_UseAttributePresentation.GetBool())
            {
                return local_24.opArrow().Presentation.GetDisplayName();
            }
            return local_24.opArrow().AttributeName;
        }
        return FText();
    }
    FText GetValueText() const
    {
        float32 local_19 = 0.0f;
        FNumberFormattingOptions local_12;
        local_12 = FNumberFormattingOptions::DefaultWithGrouping();
        local_12.SetMinimumFractionalDigits(0).SetMaximumFractionalDigits(1);
        FText local_24;
        FText::AsNumber(local_24, local_19);
        if (local_19 > 0.0f)
        {
            return FText::Format(FText::AsCultureInvariant("+{0}"), local_24);
        }
        return local_24;
    }
    bool IsGreaterOrEqualZero() const
    {
        return (0.0f >= 0.0f);
    }
    TDataObjectPtr<FAttributeConfig> GetAttrConfig() const
    {
        const UAttributeSettingsSettings local_2;
        GetGameplaySettings<UAttributeSettingsSettings> local_4;
        local_2 = local_4;
        return local_2.GetAttributeConfig(this.GetAttribute());
    }
    FText GetDescription() const
    {
        TDataObjectPtr<FAttributeConfig> local_24 = this.GetAttrConfig();
        if (local_24)
        {
            if (UICommonUtil::CVar_UI_UseAttributePresentation.GetBool())
            {
                return local_24.opArrow().Presentation.GetDescription();
            }
            return local_24.opArrow().AttributeDescription;
        }
        return FText();
    }
    FGameAttributeRef GetAttribute() const property
    {
        FGameAttributeRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FGameAttributeRef GetModify_Attribute() property
    {
        FGameAttributeRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAttribute(const FGameAttributeRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Attribute = __Value;
        return;
    }
    float32 GetValue() const property
    {
        float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_Value() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetValue(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Value = __Value;
        return;
    }
    FEUIModelRef GetHoverTips() const property
    {
        FEUIModelRef __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FEUIModelRef GetModify_HoverTips() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetHoverTips(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_HoverTips = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AttributeValueItem
{
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FText ValueText;
    UPROPERTY()
    bool IsGreaterOrEqualZero;
    UPROPERTY()
    TEUIModelRef<FVM_AttributeValueItem> Self;


}

namespace FVM_AttributeValueItem
{
FVM_AttributeValueItem& Create(const UObject ContextObject, const FGameAttributeRef &inout Attribute, const float32 Value)
{
    return FVM_AttributeValueItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), Attribute, Value);
}
FVM_AttributeValueItem CreateByManager(const UEUIManagerSubsystem Manager, const FGameAttributeRef &inout Attribute, const float32 Value)
{
    FVM_AttributeValueItem __r;
    TEUIModelRef<FVM_AttributeValueItem> local_6 = TEUIModelRef<FVM_AttributeValueItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AttributeValueItem::ModelId, 0, Attribute, Value));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Value";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoverTips";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Icon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Name";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ValueText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsGreaterOrEqualZero";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AttributeValueItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AttributeValueItem;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__UpdateHoverTips";
    local_24.DirtyFlags.Set(FVM_AttributeValueItem::__IndexOf_Attribute());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AttributeValueItem;
}
void __UpdateHoverTips(FVM_AttributeValueItem &inout Model)
{
    Model.UpdateHoverTips();
    return;
}
float32 __UIGetter_Value(const FVM_AttributeValueItem &inout Model)
{
    return 0.0f;
}
FEUIModelRef __UIGetter_HoverTips(const FVM_AttributeValueItem &inout Model)
{
    return Model.GetHoverTips();
}
FSoftBrush __UIGetter_Icon(const FVM_AttributeValueItem &inout Model)
{
    return Model.GetIcon();
}
FText __UIGetter_Name(const FVM_AttributeValueItem &inout Model)
{
    return Model.GetName();
}
FText __UIGetter_ValueText(const FVM_AttributeValueItem &inout Model)
{
    return Model.GetValueText();
}
bool __UIGetter_IsGreaterOrEqualZero(const FVM_AttributeValueItem &inout Model)
{
    return Model.IsGreaterOrEqualZero();
}
TEUIModelRef<FVM_AttributeValueItem> __UIGetter_Self(const FVM_AttributeValueItem &inout Model)
{
    return TEUIModelRef<FVM_AttributeValueItem>(Model);
}
int __IndexOf_Attribute()
{
    return 0;
}
int __IndexOf_Value()
{
    return 1;
}
int __IndexOf_HoverTips()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_AttributeValueItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

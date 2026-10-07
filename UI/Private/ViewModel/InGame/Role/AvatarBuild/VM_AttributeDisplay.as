
namespace FVM_AttributeDisplay
{
    const int ModelId = 0;

}
struct FVM_AttributeDisplay : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Attribute> m_Attribute;
    UPROPERTY()
    FEUIModelRef m_HoverTips;

    FVM_AttributeDisplay()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AttributeDisplay' by default constructor.");
        return;
    }
    FVM_AttributeDisplay(const FVM_AttributeDisplay &inout Other)
    {
        this.m_Attribute = Other.m_Attribute;
        this.m_HoverTips = Other.m_HoverTips;
        return;
    }
    FVM_AttributeDisplay(const TEUIModelRef<FM_Attribute> &inout InAttribute)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAttribute(InAttribute);
        return;
    }
    FVM_AttributeDisplay& opAssign(const FVM_AttributeDisplay &inout Other)
    {
        this.m_Attribute = Other.m_Attribute;
        return Other.m_HoverTips;
    }
    void UpdateHoverTips()
    {
        FM_Attribute& local_4;
        TEUIModelRef<FM_Attribute> local_2 = this.GetAttribute();
        if (local_4)
        {
            FText local_10 = local_4.GetAttributeDescription();
            FText local_14 = local_4.GetAttributeDisplayName();
            UEUIManagerSubsystem local_16 = this.GetManager();
            this.SetHoverTips(FEUIModelRef());
        }
        return;
    }
    FText GetAttributeName() const
    {
        FM_Attribute& local_4;
        TEUIModelRef<FM_Attribute> local_2 = this.GetAttribute();
        if (local_4)
        {
            return local_4.GetAttributeDisplayName();
        }
        return FText();
    }
    FText GetAttributeDescription() const
    {
        FM_Attribute& local_4;
        TEUIModelRef<FM_Attribute> local_2 = this.GetAttribute();
        if (local_4)
        {
            return local_4.GetAttributeDescription();
        }
        return FText();
    }
    FText GetAttributeValue() const
    {
        FM_Attribute& local_4;
        TEUIModelRef<FM_Attribute> local_2 = this.GetAttribute();
        if (local_4)
        {
            return local_4.GetAttributeValueText();
        }
        return FText();
    }
    FSoftBrush GetAttributeIcon() const
    {
        FM_Attribute& local_4;
        TEUIModelRef<FM_Attribute> local_2 = this.GetAttribute();
        if (local_4)
        {
            return local_4.GetAttributeIcon();
        }
        return FSoftBrush();
    }
    TEUIModelRef<FM_Attribute> GetAttribute() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Attribute;
    }
    void SetAttribute(const TEUIModelRef<FM_Attribute> &inout __Value) property
    {
        TEUIModelRef<FM_Attribute> local_2;
        local_2 = this.m_Attribute;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Attribute = __Value;
        return;
    }
    FEUIModelRef GetHoverTips() const property
    {
        FEUIModelRef __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIModelRef GetModify_HoverTips() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetHoverTips(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_HoverTips = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AttributeDisplay
{
    UPROPERTY()
    FText AttributeName;
    UPROPERTY()
    FText AttributeDescription;
    UPROPERTY()
    FText AttributeValue;
    UPROPERTY()
    FSoftBrush AttributeIcon;
    UPROPERTY()
    TEUIModelRef<FVM_AttributeDisplay> Self;

    __GeneratedProperties_FVM_AttributeDisplay()
    {
        return;
    }
}

namespace FVM_AttributeDisplay
{
FVM_AttributeDisplay& Create(const UObject ContextObject, const TEUIModelRef<FM_Attribute> &inout Attribute)
{
    return FVM_AttributeDisplay::CreateByManager(EUIInternal::GetContextManager(ContextObject), Attribute);
}
FVM_AttributeDisplay CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Attribute> &inout Attribute)
{
    FVM_AttributeDisplay __r;
    TEUIModelRef<FVM_AttributeDisplay> local_6 = TEUIModelRef<FVM_AttributeDisplay>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AttributeDisplay::ModelId, 0, Attribute));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_AttributeDisplay;
}
void __UpdateHoverTips(FVM_AttributeDisplay &inout Model)
{
    Model.UpdateHoverTips();
    return;
}
FEUIModelRef __UIGetter_HoverTips(const FVM_AttributeDisplay &inout Model)
{
    return Model.GetHoverTips();
}
FText __UIGetter_AttributeName(const FVM_AttributeDisplay &inout Model)
{
    return Model.GetAttributeName();
}
FText __UIGetter_AttributeDescription(const FVM_AttributeDisplay &inout Model)
{
    return Model.GetAttributeDescription();
}
FText __UIGetter_AttributeValue(const FVM_AttributeDisplay &inout Model)
{
    return Model.GetAttributeValue();
}
FSoftBrush __UIGetter_AttributeIcon(const FVM_AttributeDisplay &inout Model)
{
    return Model.GetAttributeIcon();
}
TEUIModelRef<FVM_AttributeDisplay> __UIGetter_Self(const FVM_AttributeDisplay &inout Model)
{
    return TEUIModelRef<FVM_AttributeDisplay>(Model);
}
int __IndexOf_Attribute()
{
    return 0;
}
int __IndexOf_HoverTips()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_AttributeDisplay
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

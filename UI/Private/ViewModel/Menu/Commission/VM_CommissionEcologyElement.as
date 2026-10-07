
namespace FVM_CommissionEcologyElement
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectEcologyElement = FEUIModelCallbackSignature();

}
struct FVM_CommissionEcologyElement : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FVM_CommissionEcologyInfo> m_EcologyInfo;
    UPROPERTY()
    EEcologyElementType m_ElementType;
    UPROPERTY()
    bool m_bIsUnknown;
    UPROPERTY()
    FText m_UnknownElementDescription;

    FVM_CommissionEcologyElement()
    {
        this.m_ElementType = EEcologyElementType(0);
        this.m_bIsUnknown = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionEcologyElement' by default constructor.");
        return;
    }
    FVM_CommissionEcologyElement(const FVM_CommissionEcologyElement &inout Other)
    {
        this.m_ElementType = EEcologyElementType(0);
        this.m_bIsUnknown = false;
        this.m_EcologyInfo = Other.m_EcologyInfo;
        this.m_ElementType = Other.m_ElementType;
        this.m_bIsUnknown = Other.m_bIsUnknown;
        this.m_UnknownElementDescription = Other.m_UnknownElementDescription;
        return;
    }
    FVM_CommissionEcologyElement(const TEUIModelWeakRef<FVM_CommissionEcologyInfo> &inout InEcologyInfo, const EEcologyElementType InElementType)
    {
        this.m_ElementType = EEcologyElementType(0);
        this.m_bIsUnknown = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEcologyInfo(InEcologyInfo);
        this.SetElementType(EEcologyElementType(InElementType));
        return;
    }
    FVM_CommissionEcologyElement& opAssign(const FVM_CommissionEcologyElement &inout Other)
    {
        this.m_EcologyInfo = Other.m_EcologyInfo;
        this.m_ElementType = Other.m_ElementType;
        this.m_bIsUnknown = Other.m_bIsUnknown;
        return Other.m_UnknownElementDescription;
    }
    void SetIsUnknown(const bool InIsUnknown, const FText &inout InUnknownElementDescription)
    {
        this.SetbIsUnknown(InIsUnknown);
        this.SetUnknownElementDescription(InUnknownElementDescription);
        return;
    }
    ESlateVisibility GetUnknownVisibility() const
    {
        int local_2;
        if (this.GetbIsUnknown())
        {
            local_2 = 1;
        }
        else
        {
            local_2 = 4;
        }
        return ESlateVisibility(local_2);
    }
    FSoftBrush GetElementIcon() const
    {
        FSoftBrush __return;
        if (this.GetbIsUnknown())
        {
            return FSoftBrush();
        }
        TEUIModelRef<FM_Commission> local_50 = this.GetCommissionModel();
        if (local_50)
        {
            int local_54 = int(this.GetElementType());
            if (local_54 <= 1)
            {
                if (local_54 != 0)
                {
                    if (local_54 != 1)
                    {
                    }
                }
                else
                {
                    __return = local_50.opArrow().GetWeatherConfig().opArrow().DisplayIcon;
                    __return = local_50.opArrow().GetIntrusionPolicyConfig().opArrow().IntrusionIcon;
                }
            }
            return FSoftBrush();
        }
        __return = FSoftBrush();
        return __return;
    }
    FText GetElementName() const
    {
        FText __return;
        if (this.GetbIsUnknown())
        {
            return FText();
        }
        TEUIModelRef<FM_Commission> local_8 = this.GetCommissionModel();
        if (local_8)
        {
            int local_12 = int(this.GetElementType());
            if (local_12 <= 1)
            {
                if (local_12 != 0)
                {
                    if (local_12 != 1)
                    {
                    }
                }
                else
                {
                    __return = local_8.opArrow().GetWeatherConfig().opArrow().DisplayName;
                    __return = local_8.opArrow().GetIntrusionPolicyConfig().opArrow().IntrusionName;
                }
            }
            return FText();
        }
        __return = FText();
        return __return;
    }
    FText GetElementDesc() const
    {
        FText __return;
        if (this.GetbIsUnknown())
        {
            return this.GetUnknownElementDescription();
        }
        TEUIModelRef<FM_Commission> local_4 = this.GetCommissionModel();
        if (local_4)
        {
            int local_8 = int(this.GetElementType());
            if (local_8 <= 1)
            {
                if (local_8 != 0)
                {
                    if (local_8 != 1)
                    {
                    }
                }
                else
                {
                    __return = local_4.opArrow().GetWeatherConfig().opArrow().DisplayHintContent;
                    __return = local_4.opArrow().GetIntrusionPolicyConfig().opArrow().IntrusionDescription;
                }
            }
            return FText();
        }
        __return = FText();
        return __return;
    }
    FText GetAdditionalElementDesc() const
    {
        FText __return;
        if (this.GetbIsUnknown())
        {
            return FText();
        }
        TEUIModelRef<FM_Commission> local_8 = this.GetCommissionModel();
        if (local_8)
        {
            int local_12 = int(this.GetElementType());
            if (local_12 <= 0)
            {
                if (local_12 != 0)
                {
                }
                else
                {
                    __return = local_8.opArrow().GetWeatherConfig().opArrow().WeatherAbilityDescription;
                }
            }
            return FText();
        }
        __return = FText();
        return __return;
    }
    bool IsSelected() const
    {
        if (this.GetEcologyInfo().IsValid())
        {
            if (this.GetEcologyInfo().opArrow().GetEcologyElementList().Num() == 1)
            {
                return false;
            }
            return (this.GetEcologyInfo().opArrow().GetSelectedEcologyElement() == FEUIModelRef(this));
        }
        return false;
    }
    bool IsBadWeather() const
    {
        if (this.GetbIsUnknown())
        {
            return false;
        }
        if ((int(this.GetElementType())) == 0)
        {
            TEUIModelRef<FM_Commission> local_6 = this.GetCommissionModel();
            if (local_6)
            {
                TDataObjectPtr<FWeatherConfig> local_32 = local_6.opArrow().GetWeatherConfig();
                if (local_32)
                {
                    return local_32.opArrow().bBadWeather;
                }
            }
        }
        return false;
    }
    void SelectEcologyElement()
    {
        if (this.GetEcologyInfo().IsValid())
        {
            this.GetEcologyInfo().opArrow().SetSelectedEcologyElement(TEUIModelRef<FVM_CommissionEcologyElement>(this));
        }
        return;
    }
    TEUIModelRef<FM_Commission> GetCommissionModel() const
    {
        if (this.GetEcologyInfo().IsValid())
        {
            return this.GetEcologyInfo().opArrow().GetCommissionModel();
        }
        return TEUIModelRef<FM_Commission>();
    }
    TEUIModelWeakRef<FVM_CommissionEcologyInfo> GetEcologyInfo() const property
    {
        this.TrackPropertyRead(0);
        return this.m_EcologyInfo;
    }
    void SetEcologyInfo(const TEUIModelWeakRef<FVM_CommissionEcologyInfo> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_CommissionEcologyInfo> local_2;
        local_2 = this.m_EcologyInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EcologyInfo = __Value;
        return;
    }
    EEcologyElementType GetElementType() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ElementType;
    }
    void SetElementType(const EEcologyElementType __Value) property
    {
        if (int(this.m_ElementType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ElementType = __Value;
        return;
    }
    bool GetbIsUnknown() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsUnknown;
    }
    void SetbIsUnknown(const bool __Value) property
    {
        if (!(this.m_bIsUnknown) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsUnknown = __Value;
        return;
    }
    const FText GetUnknownElementDescription() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_UnknownElementDescription() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetUnknownElementDescription(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_UnknownElementDescription = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionEcologyElement
{
    UPROPERTY()
    ESlateVisibility UnknownVisibility;
    UPROPERTY()
    FSoftBrush ElementIcon;
    UPROPERTY()
    FText ElementName;
    UPROPERTY()
    FText ElementDesc;
    UPROPERTY()
    FText AdditionalElementDesc;
    UPROPERTY()
    bool IsSelected;
    UPROPERTY()
    bool IsBadWeather;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionEcologyElement> Self;


}

namespace FVM_CommissionEcologyElement
{
FVM_CommissionEcologyElement& Create(const UObject ContextObject, const TEUIModelWeakRef<FVM_CommissionEcologyInfo> &inout EcologyInfo, const EEcologyElementType ElementType)
{
    return FVM_CommissionEcologyElement::CreateByManager(EUIInternal::GetContextManager(ContextObject), EcologyInfo);
}
FVM_CommissionEcologyElement CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FVM_CommissionEcologyInfo> &inout EcologyInfo, const EEcologyElementType ElementType)
{
    FVM_CommissionEcologyElement __r;
    TEUIModelRef<FVM_CommissionEcologyElement> local_6 = TEUIModelRef<FVM_CommissionEcologyElement>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionEcologyElement::ModelId, 0, EcologyInfo, ElementType));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bIsUnknown";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UnknownVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ElementIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ElementName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ElementDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AdditionalElementDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsBadWeather";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionEcologyElement>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionEcologyElement;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionEcologyElement;
}
bool __UIGetter_bIsUnknown(const FVM_CommissionEcologyElement &inout Model)
{
    return Model.GetbIsUnknown();
}
ESlateVisibility __UIGetter_UnknownVisibility(const FVM_CommissionEcologyElement &inout Model)
{
    return Model.GetUnknownVisibility();
}
FSoftBrush __UIGetter_ElementIcon(const FVM_CommissionEcologyElement &inout Model)
{
    return Model.GetElementIcon();
}
FText __UIGetter_ElementName(const FVM_CommissionEcologyElement &inout Model)
{
    return Model.GetElementName();
}
FText __UIGetter_ElementDesc(const FVM_CommissionEcologyElement &inout Model)
{
    return Model.GetElementDesc();
}
FText __UIGetter_AdditionalElementDesc(const FVM_CommissionEcologyElement &inout Model)
{
    return Model.GetAdditionalElementDesc();
}
bool __UIGetter_IsSelected(const FVM_CommissionEcologyElement &inout Model)
{
    return Model.IsSelected();
}
bool __UIGetter_IsBadWeather(const FVM_CommissionEcologyElement &inout Model)
{
    return Model.IsBadWeather();
}
TEUIModelRef<FVM_CommissionEcologyElement> __UIGetter_Self(const FVM_CommissionEcologyElement &inout Model)
{
    return TEUIModelRef<FVM_CommissionEcologyElement>(Model);
}
int __IndexOf_EcologyInfo()
{
    return 0;
}
int __IndexOf_ElementType()
{
    return 1;
}
int __IndexOf_bIsUnknown()
{
    return 2;
}
int __IndexOf_UnknownElementDescription()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_CommissionEcologyElement
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

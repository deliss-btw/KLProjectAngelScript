
namespace FVM_CookBuffInfo
{
    const int ModelId = 0;
}
namespace FVM_CookCompleted
{
    const int ModelId = 0;

}
struct FVM_CookBuffInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FSoftBrush m_BuffIcon;
    UPROPERTY()
    FText m_AttributeName;
    UPROPERTY()
    int m_AttributeValue;

    FVM_CookBuffInfo()
    {
        this.m_AttributeValue = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CookBuffInfo' by default constructor.");
        return;
    }
    FVM_CookBuffInfo(const FVM_CookBuffInfo &inout Other)
    {
        this.m_AttributeValue = 0;
        this.m_BuffIcon = Other.m_BuffIcon;
        this.m_AttributeName = Other.m_AttributeName;
        this.m_AttributeValue = int(Other.m_AttributeValue);
        return;
    }
    FVM_CookBuffInfo(const FSoftBrush &inout InBuffIcon, const FText &inout InAttributeName, const int InAttributeValue)
    {
        this.m_AttributeValue = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetBuffIcon(InBuffIcon);
        this.SetAttributeName(InAttributeName);
        this.SetAttributeValue(InAttributeValue);
        return;
    }
    FVM_CookBuffInfo opAssign(const FVM_CookBuffInfo &inout Other)
    {
        FVM_CookBuffInfo __r;
        this.m_BuffIcon = Other.m_BuffIcon;
        this.m_AttributeName = Other.m_AttributeName;
        this.m_AttributeValue = int(Other.m_AttributeValue);
        return __r;
    }
    FSoftBrush GetIcon() const
    {
        return this.GetBuffIcon();
    }
    FText GetName() const
    {
        return this.GetAttributeName();
    }
    int GetValue() const
    {
        return this.GetAttributeValue();
    }
    ESlateVisibility GetAttributeNameVisibility() const
    {
        int local_2;
        if (this.GetAttributeName().IsEmpty())
        {
            local_2 = 1;
        }
        else
        {
            local_2 = 0;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility GetAttributeValueVisibility() const
    {
        int local_4;
        if (this.GetAttributeValue() == 0)
        {
            local_4 = 1;
        }
        else
        {
            local_4 = 0;
        }
        return ESlateVisibility(local_4);
    }
    FSoftBrush GetBuffIcon() const property
    {
        FSoftBrush __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FSoftBrush GetModify_BuffIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetBuffIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_BuffIcon = __Value;
        return;
    }
    FText GetAttributeName() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_AttributeName() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAttributeName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AttributeName = __Value;
        return;
    }
    int GetAttributeValue() const property
    {
        this.TrackPropertyRead(2);
        return this.m_AttributeValue;
    }
    void SetAttributeValue(const int __Value) property
    {
        if (this.m_AttributeValue == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AttributeValue = __Value;
        return;
    }
}

struct FVM_CookCompleted : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_BuffIcon> m_BuffIcon;
    UPROPERTY()
    FECSEntity m_CookPropEntity;
    UPROPERTY()
    TDataObjectPtr<FFoodProductConfig> m_ProductFood;
    UPROPERTY()
    TArray<TDataObjectPtr<FGameplayModifierConfig>> m_FoodModifiers;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CookBuffInfo>> m_CurCookBuffInfos;

    FVM_CookCompleted()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CookCompleted(const FVM_CookCompleted &inout Other)
    {
        this.m_BuffIcon = Other.m_BuffIcon;
        this.m_CookPropEntity = Other.m_CookPropEntity;
        this.m_ProductFood = Other.m_ProductFood;
        this.m_FoodModifiers = Other.m_FoodModifiers;
        this.m_CurCookBuffInfos = Other.m_CurCookBuffInfos;
        return;
    }
    FVM_CookCompleted& opAssign(const FVM_CookCompleted &inout Other)
    {
        this.m_BuffIcon = Other.m_BuffIcon;
        this.m_CookPropEntity = Other.m_CookPropEntity;
        this.m_ProductFood = Other.m_ProductFood;
        this.m_FoodModifiers = Other.m_FoodModifiers;
        return Other.m_CurCookBuffInfos;
    }
    void OnProductFoodChanged()
    {
        TDataObjectPtr<FBuffConfig> local_350;
        const UAttributeSettingsSettings local_474;
        int local_598 = 0;
        this.GetModify_CurCookBuffInfos().Empty(0);
        FFoodProductConfig local_100;
        TDataObjectPtr<FMetaBuffConfig> local_220;
        local_220 = local_100.GetMetaBuffConfig();
        if ((local_220 == nullptr))
        {
            return;
        }
        if (!(FDataObjectPtr(local_350.opArrow().PresentationConfig)))
        {
            return;
        }
        TArray<FBuffHintDescParamItem> local_378;
        TDataObjectPtr<FBuffPresentationConfig> local_402;
        FSoftBrush local_472 = FSoftBrush(local_402.opArrow().IconBrush);
        GetGameplaySettings<UAttributeSettingsSettings> local_476;
        local_474 = local_476;
        TArray<FBuffModifierAttributeDescriptionInfos> local_482;
        TArray<FBuffModifierAttributeDescriptionInfos> local_486;
        local_482 = local_486;
        local_482.Append(FGameplayModifierUtils::GetModifierAttributeDescriptionBGameplayModifierConfig(this.GetFoodModifiers()));
        if (!(local_402.opArrow().HintDescAdditional.IsEmpty()))
        {
            FBuffHintDescParamItem local_544;
            local_544.Icon = local_472;
            FString local_552 = local_402.opArrow().HintDescAdditional.ToString();
            local_544.Desc = FText::FromString(FString());
            local_378.Add(local_544);
            this.GetModify_CurCookBuffInfos().Add(TEUIModelRef<FVM_CookBuffInfo>(::FVM_CookBuffInfo::Create(this.GetContext().Manager, local_472, local_544.Desc, 0)));
        }
        for (auto& local_572 : local_482)
        {
            if (local_572.bUseDefaultDescription)
            {
                if (local_474.GetAttributeConfig(local_572.Attribute))
                {
                    FBuffHintDescParamItem local_544;
                    TDataObjectPtr<FAttributeConfig> local_596 = local_474.GetAttributeConfig(local_572.Attribute);
                    if (UICommonUtil::CVar_UI_UseAttributePresentation.GetBool())
                    {
                        local_544.Icon = local_598.Presentation.GetIcon();
                    }
                    else
                    {
                        local_544.Icon = local_598.AttributeIcon;
                    }
                    TArray<FTextArgument> local_648;
                    FDataObjectPtr local_678 = local_474.GetAttributeConfig(local_572.Attribute).opImplConv();
                    Make local_654;
                    local_648.Add(local_654.opImplConv());
                    FInstancedStruct local_692 = FInstancedStruct::Make(local_572);
                    if (local_692.IsValid())
                    {
                        local_648.Add(FTextArgument(local_692));
                        local_544.Desc = ::MessageHintUtils::ParseText(local_402.opArrow().ShortAttributeDesc, local_648);
                        if (local_544.Desc.IsEmpty())
                        {
                            local_544.Desc = ::MessageHintUtils::ParseText(local_402.opArrow().DefaultAttributeDesc, local_648);
                        }
                        local_378.Add(local_544);
                        int local_693 = int(local_572.Value);
                        this.GetModify_CurCookBuffInfos().Add(TEUIModelRef<FVM_CookBuffInfo>(::FVM_CookBuffInfo::Create(this.GetContext().Manager, local_544.Icon, local_544.Desc)));
                    }
                }
            }
        }
        bool local_245 = !((::FMetaBuffUtils::GetMetaBuffBySlot(this.GetContext().GetLocalPlayerPawn(), EMetaBuffSlot(1)) == nullptr));
        if (!(local_245))
        {
            local_245 = false;
        }
        else
        {
            bool local_727;
            FECSEntity local_698 = this.GetContext().GetLocalPlayerPawn();
            Has local_726;
            local_727 = local_726.opCall();
            local_245 = local_727;
        }
        if (local_245)
        {
            bool local_727;
            int local_734;
            FECSEntity local_698_2 = this.GetContext().GetLocalPlayerPawn();
            for (auto& local_748 : local_734.GetBuffData())
            {
                local_350 = TDataObjectPtr<FBuffConfig>(local_748.ConfigRef);
                if (!(local_748.ConfigRef.IsValid() && (0 == local_748.ConfigRef.GetUniqueID())))
                {
                    local_727 = false;
                }
                else
                {
                    local_727 = local_350.opArrow().bHasPresentationConfig;
                }
                if (local_727)
                {
                    TArray<FBuffEntityData> local_782;
                    this.SetBuffIcon(TEUIModelRef<FVM_BuffIcon>(::FVM_BuffIcon::Create(this.GetContext().Manager, this.GetContext().GetLocalPlayerPawn(), local_748, local_782)));
                }
            }
        }
        return;
    }
    FText GetMetaBuffDuration() const
    {
        TDataObjectPtr<FFoodProductConfig> local_24;
        int local_106 = 0;
        local_24 = this.GetProductFood();
        bool local_49 = (local_24 == nullptr);
        if (local_49)
        {
            local_49 = true;
        }
        else
        {
            TDataObjectPtr<FMetaBuffConfig> local_74;
            local_74 = GetMetaBuffConfig();
            local_49 = (local_74 == nullptr);
        }
        if (local_49)
        {
            return FText::AsCultureInvariant("ж— ж•€Buff");
        }
        int local_105 = local_106;
        local_106 = FMath::FloorToInt((local_105 / 60.0f));
        int local_107 = FMath::FloorToInt(local_105) % 60;
        FString local_134;
        if (local_107 < 10)
        {
            local_134 = (FString("0") + local_107);
        }
        else
        {
            local_134 = (FString("") + local_107);
        }
        FString local_118 = (FString("ж•€жћњж—¶й—ґ:") + local_106);
        return FText::AsCultureInvariant(((local_118 + ":") + local_134));
    }
    ESlateVisibility GetNowMetaBuff() const
    {
        int local_8;
        if (::FMetaBuffUtils::HasMetaBuffBySlot(this.GetContext().GetLocalPlayerPawn(), EMetaBuffSlot(1)))
        {
            local_8 = 0;
        }
        else
        {
            local_8 = 1;
        }
        return ESlateVisibility(local_8);
    }
    FSoftBrush GetIcon() const
    {
        TDataObjectPtr<FFoodProductConfig> local_24;
        FSoftBrush __return;
        local_24 = this.GetProductFood();
        if ((!((local_24 == nullptr))))
        {
        }
        else
        {
            __return = FSoftBrush();
        }
        return __return;
    }
    FText GetName() const
    {
        TDataObjectPtr<FFoodProductConfig> local_24;
        FText __return;
        local_24 = this.GetProductFood();
        if ((!((local_24 == nullptr))))
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    FText GeDescription() const
    {
        TDataObjectPtr<FFoodProductConfig> local_24;
        FText __return;
        local_24 = this.GetProductFood();
        if ((!((local_24 == nullptr))))
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    TEUIModelRef<FVM_BuffIcon> GetBuffIcon() const property
    {
        this.TrackPropertyRead(0);
        return this.m_BuffIcon;
    }
    void SetBuffIcon(const TEUIModelRef<FVM_BuffIcon> &inout __Value) property
    {
        TEUIModelRef<FVM_BuffIcon> local_2;
        local_2 = this.m_BuffIcon;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_BuffIcon = __Value;
        return;
    }
    const FECSEntity GetCookPropEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FECSEntity GetModify_CookPropEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCookPropEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CookPropEntity = __Value;
        return;
    }
    const TDataObjectPtr<FFoodProductConfig> GetProductFood() const property
    {
        const TDataObjectPtr<FFoodProductConfig> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TDataObjectPtr<FFoodProductConfig> GetModify_ProductFood() property
    {
        TDataObjectPtr<FFoodProductConfig> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetProductFood(const TDataObjectPtr<FFoodProductConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ProductFood = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FGameplayModifierConfig>> GetFoodModifiers() const property
    {
        const TArray<TDataObjectPtr<FGameplayModifierConfig>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TDataObjectPtr<FGameplayModifierConfig>> GetModify_FoodModifiers() property
    {
        TArray<TDataObjectPtr<FGameplayModifierConfig>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetFoodModifiers(const TArray<TDataObjectPtr<FGameplayModifierConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_FoodModifiers = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CookBuffInfo>> GetCurCookBuffInfos() const property
    {
        const TArray<TEUIModelRef<FVM_CookBuffInfo>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CookBuffInfo>> GetModify_CurCookBuffInfos() property
    {
        TArray<TEUIModelRef<FVM_CookBuffInfo>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetCurCookBuffInfos(const TArray<TEUIModelRef<FVM_CookBuffInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CurCookBuffInfos = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CookBuffInfo
{
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    int Value;
    UPROPERTY()
    ESlateVisibility AttributeNameVisibility;
    UPROPERTY()
    ESlateVisibility AttributeValueVisibility;
    UPROPERTY()
    TEUIModelRef<FVM_CookBuffInfo> Self;


}

struct __GeneratedProperties_FVM_CookCompleted
{
    UPROPERTY()
    FText MetaBuffDuration;
    UPROPERTY()
    ESlateVisibility NowMetaBuff;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FText GeDescription;
    UPROPERTY()
    TEUIModelRef<FVM_CookCompleted> Self;


}

namespace FVM_CookBuffInfo
{
FVM_CookBuffInfo& Create(const UObject ContextObject, const FSoftBrush &inout BuffIcon, const FText &inout AttributeName, const int AttributeValue)
{
    return FVM_CookBuffInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), BuffIcon, AttributeName, AttributeValue);
}
FVM_CookBuffInfo CreateByManager(const UEUIManagerSubsystem Manager, const FSoftBrush &inout BuffIcon, const FText &inout AttributeName, const int AttributeValue)
{
    FVM_CookBuffInfo __r;
    TEUIModelRef<FVM_CookBuffInfo> local_6 = TEUIModelRef<FVM_CookBuffInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CookBuffInfo::ModelId, 0, BuffIcon, AttributeName, AttributeValue));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
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
    local_14.PropertyName = "Value";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AttributeNameVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AttributeValueVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CookBuffInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CookBuffInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CookBuffInfo;
}
FSoftBrush __UIGetter_Icon(const FVM_CookBuffInfo &inout Model)
{
    return Model.GetIcon();
}
FText __UIGetter_Name(const FVM_CookBuffInfo &inout Model)
{
    return Model.GetName();
}
int __UIGetter_Value(const FVM_CookBuffInfo &inout Model)
{
    return 0;
}
ESlateVisibility __UIGetter_AttributeNameVisibility(const FVM_CookBuffInfo &inout Model)
{
    return Model.GetAttributeNameVisibility();
}
ESlateVisibility __UIGetter_AttributeValueVisibility(const FVM_CookBuffInfo &inout Model)
{
    return Model.GetAttributeValueVisibility();
}
TEUIModelRef<FVM_CookBuffInfo> __UIGetter_Self(const FVM_CookBuffInfo &inout Model)
{
    return TEUIModelRef<FVM_CookBuffInfo>(Model);
}
int __IndexOf_BuffIcon()
{
    return 0;
}
int __IndexOf_AttributeName()
{
    return 1;
}
int __IndexOf_AttributeValue()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_CookBuffInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_CookCompleted
{
FVM_CookCompleted& Create(const UObject ContextObject)
{
    return FVM_CookCompleted::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CookCompleted CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CookCompleted __r;
    TEUIModelRef<FVM_CookCompleted> local_6 = TEUIModelRef<FVM_CookCompleted>(EUIInternal::MakeModelWithManager(Manager, FVM_CookCompleted::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "BuffIcon";
    local_14.TypeName = "TEUIModelRef<FVM_BuffIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurCookBuffInfos";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CookBuffInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MetaBuffDuration";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "NowMetaBuff";
    local_14.TypeName = "ESlateVisibility";
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
    local_14.PropertyName = "GeDescription";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CookCompleted>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CookCompleted;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnProductFoodChanged";
    local_24.DirtyFlags.Set(FVM_CookCompleted::__IndexOf_ProductFood());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CookCompleted;
}
void __OnProductFoodChanged(FVM_CookCompleted &inout Model)
{
    Model.OnProductFoodChanged();
    return;
}
TEUIModelRef<FVM_BuffIcon> __UIGetter_BuffIcon(const FVM_CookCompleted &inout Model)
{
    return Model.GetBuffIcon();
}
TArray<TEUIModelRef<FVM_CookBuffInfo>> __UIGetter_CurCookBuffInfos(const FVM_CookCompleted &inout Model)
{
    return Model.GetCurCookBuffInfos();
}
FText __UIGetter_MetaBuffDuration(const FVM_CookCompleted &inout Model)
{
    return Model.GetMetaBuffDuration();
}
ESlateVisibility __UIGetter_NowMetaBuff(const FVM_CookCompleted &inout Model)
{
    return Model.GetNowMetaBuff();
}
FSoftBrush __UIGetter_Icon(const FVM_CookCompleted &inout Model)
{
    return Model.GetIcon();
}
FText __UIGetter_Name(const FVM_CookCompleted &inout Model)
{
    return Model.GetName();
}
FText __UIGetter_GeDescription(const FVM_CookCompleted &inout Model)
{
    return Model.GeDescription();
}
TEUIModelRef<FVM_CookCompleted> __UIGetter_Self(const FVM_CookCompleted &inout Model)
{
    return TEUIModelRef<FVM_CookCompleted>(Model);
}
int __IndexOf_BuffIcon()
{
    return 0;
}
int __IndexOf_CookPropEntity()
{
    return 1;
}
int __IndexOf_ProductFood()
{
    return 2;
}
int __IndexOf_FoodModifiers()
{
    return 3;
}
int __IndexOf_CurCookBuffInfos()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_CookCompleted
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

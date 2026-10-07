
namespace FVM_AvatarAttributeItem
{
    const int ModelId = 0;

}
struct FVM_AvatarAttributeItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FEUIModelRef m_InnerModel;
    UPROPERTY()
    bool m_bIsCategory;
    UPROPERTY()
    TEUIModelRef<FM_Attribute> m_Attribute;

    FVM_AvatarAttributeItem()
    {
        this.m_bIsCategory = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarAttributeItem' by default constructor.");
        return;
    }
    FVM_AvatarAttributeItem(const FVM_AvatarAttributeItem &inout Other)
    {
        this.m_bIsCategory = false;
        this.m_InnerModel = Other.m_InnerModel;
        this.m_bIsCategory = Other.m_bIsCategory;
        this.m_Attribute = Other.m_Attribute;
        return;
    }
    FVM_AvatarAttributeItem(const bool bInIsCategory, const FText &inout InCategoryName, const TEUIModelRef<FM_Attribute> &inout InAttribute)
    {
        this.m_bIsCategory = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetbIsCategory(bInIsCategory);
        this.SetAttribute(InAttribute);
        if (this.GetbIsCategory())
        {
            this.SetInnerModel(FEUIModelRef());
            return;
        }
        TEUIModelRef<FM_Attribute> local_8 = this.GetAttribute();
        this.SetInnerModel(FEUIModelRef());
        this.UpdateAvatarAttribute();
        return;
    }
    FVM_AvatarAttributeItem& opAssign(const FVM_AvatarAttributeItem &inout Other)
    {
        this.m_InnerModel = Other.m_InnerModel;
        this.m_bIsCategory = Other.m_bIsCategory;
        return Other.m_Attribute;
    }
    TSoftClassPtr<UUserWidget> GetWidgetClass() const
    {
        if (this.GetbIsCategory())
        {
            return ::UICommonUtil::WidgetPathFromString("/Game/MoleRes/Dev/UI/UMG/Role/Widgets/UI_AttributeCategory.UI_AttributeCategory");
        }
        else
        {
            return ::UICommonUtil::WidgetPathFromString("/Game/MoleRes/Dev/UI/UMG/Role/Widgets/UI_AttributeDisplay.UI_AttributeDisplay");
        }
    }
    void OnPlayerAttributeChanged(const FC_GameAttributeView &inout C_AttributeView)
    {
        bool local_1 = !(this.GetbIsCategory());
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            TEUIModelRef<FM_Attribute> local_4 = this.GetAttribute();
            local_1 = C_AttributeView.HasAttribute(GetAttribute());
        }
        if (local_1)
        {
            this.UpdateAvatarAttribute();
        }
        return;
    }
    void UpdateAvatarAttribute()
    {
        FM_Attribute& local_4;
        TEUIModelRef<FM_Attribute> local_2 = this.GetAttribute();
        if (local_4)
        {
            float32 local_23 = FGameAttributeUtils::GetAttributeValue(this.GetContext().GetLocalPlayerPawn(), local_4.GetAttribute(), this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            local_4.SetValue(local_23);
        }
        return;
    }
    const FEUIModelRef GetInnerModel() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelRef GetModify_InnerModel() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetInnerModel(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_InnerModel = __Value;
        return;
    }
    bool GetbIsCategory() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsCategory;
    }
    void SetbIsCategory(const bool __Value) property
    {
        if (!(this.m_bIsCategory) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsCategory = __Value;
        return;
    }
    TEUIModelRef<FM_Attribute> GetAttribute() const property
    {
        this.TrackPropertyRead(2);
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
        this.MarkPropertyDirty(2);
        this.m_Attribute = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarAttributeItem
{
    UPROPERTY()
    TSoftClassPtr<UUserWidget> WidgetClass;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarAttributeItem> Self;

    __GeneratedProperties_FVM_AvatarAttributeItem()
    {
        return;
    }
}

namespace FVM_AvatarAttributeItem
{
TEUIModelRef<FVM_AvatarAttributeItem> CreateCategory(const UObject Context, const FText &inout CategoryName)
{
    return TEUIModelRef<FVM_AvatarAttributeItem>(FVM_AvatarAttributeItem::Create(Context, true, CategoryName, (TEUIModelRef<FM_Attribute>(nullptr))));
}
TEUIModelRef<FVM_AvatarAttributeItem> CreateAttribute(const UObject Context, const FGameAttributeRef &inout Attribute, const EAttributeDisplayType DisplayType)
{
    return TEUIModelRef<FVM_AvatarAttributeItem>(FVM_AvatarAttributeItem::Create(Context, false, FText(), (TEUIModelRef<FM_Attribute>(FM_Attribute::Create(Context, Attribute, EAttributeDisplayType(DisplayType), 0.0f)))));
}
FVM_AvatarAttributeItem& Create(const UObject ContextObject, const bool bIsCategory, const FText &inout CategoryName, const TEUIModelRef<FM_Attribute> &inout Attribute)
{
    return FVM_AvatarAttributeItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), bIsCategory, CategoryName, Attribute);
}
FVM_AvatarAttributeItem CreateByManager(const UEUIManagerSubsystem Manager, const bool bIsCategory, const FText &inout CategoryName, const TEUIModelRef<FM_Attribute> &inout Attribute)
{
    FVM_AvatarAttributeItem __r;
    TEUIModelRef<FVM_AvatarAttributeItem> local_6 = TEUIModelRef<FVM_AvatarAttributeItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarAttributeItem::ModelId, 0, bIsCategory, CategoryName, Attribute));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "InnerModel";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WidgetClass";
    local_14.TypeName = "TSoftClassPtr<UUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarAttributeItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarAttributeItem;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnPlayerAttributeChanged";
    local_26.ComponentType = FC_GameAttributeView;
    Result.MonitorFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarAttributeItem;
}
void __OnPlayerAttributeChanged(FVM_AvatarAttributeItem &inout Model, const FECSEntity &inout Entity, const FC_GameAttributeView &inout Component)
{
    Model.OnPlayerAttributeChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
FEUIModelRef __UIGetter_InnerModel(const FVM_AvatarAttributeItem &inout Model)
{
    return Model.GetInnerModel();
}
TSoftClassPtr<UUserWidget> __UIGetter_WidgetClass(const FVM_AvatarAttributeItem &inout Model)
{
    return Model.GetWidgetClass();
}
TEUIModelRef<FVM_AvatarAttributeItem> __UIGetter_Self(const FVM_AvatarAttributeItem &inout Model)
{
    return TEUIModelRef<FVM_AvatarAttributeItem>(Model);
}
int __IndexOf_InnerModel()
{
    return 0;
}
int __IndexOf_bIsCategory()
{
    return 1;
}
int __IndexOf_Attribute()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_AvatarAttributeItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

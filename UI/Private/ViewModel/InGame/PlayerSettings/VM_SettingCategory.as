
namespace FVM_SettingSubTitle
{
    const int ModelId = 0;
}
namespace FVM_SettingCategory
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectTab = FEUIModelCallbackSignature();

}
struct FVM_SettingSubTitle : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_SubTitleName;
    UPROPERTY()
    FText m_SubTitleDesc;
    UPROPERTY()
    FGameplayTag m_SubTitleTag;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_SettingItem>> m_Items;
    UPROPERTY()
    int m_SelectedIndex;
    UPROPERTY()
    TEUIModelWeakRef<FVMS_SettingPage> m_OwnerPage;
    UPROPERTY()
    float32 m_RenderOpacity;
    UPROPERTY()
    TDataObjectPtr<FSettingSubTitleConfig> m_SubTitleConfig;

    FVM_SettingSubTitle()
    {
        this.m_SelectedIndex = 0;
        this.m_RenderOpacity = 1.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_SettingSubTitle' by default constructor.");
        return;
    }
    FVM_SettingSubTitle(const FVM_SettingSubTitle &inout Other)
    {
        this.m_SelectedIndex = 0;
        this.m_RenderOpacity = 1.0f;
        this.m_SubTitleName = Other.m_SubTitleName;
        this.m_SubTitleDesc = Other.m_SubTitleDesc;
        this.m_SubTitleTag = Other.m_SubTitleTag;
        this.m_Items = Other.m_Items;
        this.m_SelectedIndex = int(Other.m_SelectedIndex);
        this.m_OwnerPage = Other.m_OwnerPage;
        this.m_RenderOpacity = Other.m_RenderOpacity;
        this.m_SubTitleConfig = Other.m_SubTitleConfig;
        return;
    }
    FVM_SettingSubTitle(const TEUIModelWeakRef<FVMS_SettingPage> &inout InOwnerPage, const TDataObjectPtr<FSettingSubTitleConfig> &inout InSubTitleConfig)
    {
        this.m_SelectedIndex = 0;
        this.m_RenderOpacity = 1.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetOwnerPage(InOwnerPage);
        this.SetSubTitleConfig(InSubTitleConfig);
        return;
    }
    FVM_SettingSubTitle& opAssign(const FVM_SettingSubTitle &inout Other)
    {
        this.m_SubTitleName = Other.m_SubTitleName;
        this.m_SubTitleDesc = Other.m_SubTitleDesc;
        this.m_SubTitleTag = Other.m_SubTitleTag;
        this.m_Items = Other.m_Items;
        this.m_SelectedIndex = int(Other.m_SelectedIndex);
        this.m_OwnerPage = Other.m_OwnerPage;
        this.m_RenderOpacity = Other.m_RenderOpacity;
        return Other.m_SubTitleConfig;
    }
    void PostConstruct()
    {
        TDataObjectPtr<FSettingSubTitleConfig> local_24;
        local_24 = this.GetSubTitleConfig();
        FGameplayTag local_51;
        if ((!((local_24 == nullptr))))
        {
            local_51;
            this.SetSubTitleTag(local_51);
            return;
        }
        this.SetSubTitleName(FText::FromString(FString()));
        this.SetSubTitleDesc(FText::FromString(FString()));
        this.SetSubTitleTag(local_51);
        this.SetRenderOpacity(0.0f);
        return;
    }
    const FText GetSubTitleName() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_SubTitleName() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetSubTitleName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SubTitleName = __Value;
        return;
    }
    const FText GetSubTitleDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_SubTitleDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSubTitleDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SubTitleDesc = __Value;
        return;
    }
    const FGameplayTag GetSubTitleTag() const property
    {
        const FGameplayTag __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FGameplayTag GetModify_SubTitleTag() property
    {
        FGameplayTag __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetSubTitleTag(const FGameplayTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SubTitleTag = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_SettingItem>> GetItems() const property
    {
        const TArray<TEUIModelRef<FVM_SettingItem>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_SettingItem>> GetModify_Items() property
    {
        TArray<TEUIModelRef<FVM_SettingItem>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetItems(const TArray<TEUIModelRef<FVM_SettingItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Items = __Value;
        return;
    }
    int GetSelectedIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SelectedIndex;
    }
    void SetSelectedIndex(const int __Value) property
    {
        if (this.m_SelectedIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SelectedIndex = __Value;
        return;
    }
    TEUIModelWeakRef<FVMS_SettingPage> GetOwnerPage() const property
    {
        this.TrackPropertyRead(5);
        return this.m_OwnerPage;
    }
    void SetOwnerPage(const TEUIModelWeakRef<FVMS_SettingPage> &inout __Value) property
    {
        TEUIModelWeakRef<FVMS_SettingPage> local_2;
        local_2 = this.m_OwnerPage;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_OwnerPage = __Value;
        return;
    }
    float32 GetRenderOpacity() const property
    {
        float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_RenderOpacity() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetRenderOpacity(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_RenderOpacity = __Value;
        return;
    }
    const TDataObjectPtr<FSettingSubTitleConfig> GetSubTitleConfig() const property
    {
        const TDataObjectPtr<FSettingSubTitleConfig> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TDataObjectPtr<FSettingSubTitleConfig> GetModify_SubTitleConfig() property
    {
        TDataObjectPtr<FSettingSubTitleConfig> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetSubTitleConfig(const TDataObjectPtr<FSettingSubTitleConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_SubTitleConfig = __Value;
        return;
    }
}

struct FVM_SettingCategory : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_CategoryName;
    UPROPERTY()
    FText m_CategoryDesc;
    UPROPERTY()
    FSoftBrush m_CategoryIcon;
    UPROPERTY()
    FGameplayTag m_CategoryTag;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_SettingSubTitle>> m_SubTitles;
    UPROPERTY()
    bool m_bSelected;
    UPROPERTY()
    int m_TabIndex;
    UPROPERTY()
    TEUIModelWeakRef<FVMS_SettingPage> m_OwnerPage;
    UPROPERTY()
    TDataObjectPtr<FSettingCategoryConfig> m_CategoryConfig;

    FVM_SettingCategory()
    {
        this.m_bSelected = false;
        this.m_TabIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_SettingCategory' by default constructor.");
        return;
    }
    FVM_SettingCategory(const FVM_SettingCategory &inout Other)
    {
        this.m_bSelected = false;
        this.m_TabIndex = 0;
        this.m_CategoryName = Other.m_CategoryName;
        this.m_CategoryDesc = Other.m_CategoryDesc;
        this.m_CategoryIcon = Other.m_CategoryIcon;
        this.m_CategoryTag = Other.m_CategoryTag;
        this.m_SubTitles = Other.m_SubTitles;
        this.m_bSelected = Other.m_bSelected;
        this.m_TabIndex = int(Other.m_TabIndex);
        this.m_OwnerPage = Other.m_OwnerPage;
        this.m_CategoryConfig = Other.m_CategoryConfig;
        return;
    }
    FVM_SettingCategory(const int InTabIndex, const TEUIModelWeakRef<FVMS_SettingPage> &inout InOwnerPage, const TDataObjectPtr<FSettingCategoryConfig> &inout InCategoryConfig)
    {
        this.m_bSelected = false;
        this.m_TabIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTabIndex(InTabIndex);
        this.SetOwnerPage(InOwnerPage);
        this.SetCategoryConfig(InCategoryConfig);
        return;
    }
    FVM_SettingCategory& opAssign(const FVM_SettingCategory &inout Other)
    {
        this.m_CategoryName = Other.m_CategoryName;
        this.m_CategoryDesc = Other.m_CategoryDesc;
        this.m_CategoryIcon = Other.m_CategoryIcon;
        this.m_CategoryTag = Other.m_CategoryTag;
        this.m_SubTitles = Other.m_SubTitles;
        this.m_bSelected = Other.m_bSelected;
        this.m_TabIndex = int(Other.m_TabIndex);
        this.m_OwnerPage = Other.m_OwnerPage;
        return Other.m_CategoryConfig;
    }
    void SelectTab()
    {
        FVMS_SettingPage& local_2;
        TEUIModelWeakRef<FVMS_SettingPage> local_4 = this.GetOwnerPage();
        if (local_2)
        {
            local_2.SelectCategory(this.GetTabIndex());
        }
        return;
    }
    void AddSubTitle(const TEUIModelRef<FVM_SettingSubTitle> &inout SubTitle)
    {
        this.GetModify_SubTitles().Add(SubTitle);
        return;
    }
    void PostConstruct()
    {
        FGameplayTag local_2;
        local_2;
        this.SetCategoryTag(local_2);
        this.SetSubTitles(TArray<TEUIModelRef<FVM_SettingSubTitle>>());
        return;
    }
    FText GetCategoryName() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_CategoryName() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCategoryName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CategoryName = __Value;
        return;
    }
    const FText GetCategoryDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_CategoryDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCategoryDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CategoryDesc = __Value;
        return;
    }
    FSoftBrush GetCategoryIcon() const property
    {
        FSoftBrush __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSoftBrush GetModify_CategoryIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCategoryIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CategoryIcon = __Value;
        return;
    }
    const FGameplayTag GetCategoryTag() const property
    {
        const FGameplayTag __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FGameplayTag GetModify_CategoryTag() property
    {
        FGameplayTag __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetCategoryTag(const FGameplayTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CategoryTag = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_SettingSubTitle>> GetSubTitles() const property
    {
        const TArray<TEUIModelRef<FVM_SettingSubTitle>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_SettingSubTitle>> GetModify_SubTitles() property
    {
        TArray<TEUIModelRef<FVM_SettingSubTitle>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetSubTitles(const TArray<TEUIModelRef<FVM_SettingSubTitle>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SubTitles = __Value;
        return;
    }
    bool GetbSelected() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bSelected;
    }
    void SetbSelected(const bool __Value) property
    {
        if (!(this.m_bSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bSelected = __Value;
        return;
    }
    int GetTabIndex() const property
    {
        this.TrackPropertyRead(6);
        return this.m_TabIndex;
    }
    void SetTabIndex(const int __Value) property
    {
        if (this.m_TabIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_TabIndex = __Value;
        return;
    }
    TEUIModelWeakRef<FVMS_SettingPage> GetOwnerPage() const property
    {
        this.TrackPropertyRead(7);
        return this.m_OwnerPage;
    }
    void SetOwnerPage(const TEUIModelWeakRef<FVMS_SettingPage> &inout __Value) property
    {
        TEUIModelWeakRef<FVMS_SettingPage> local_2;
        local_2 = this.m_OwnerPage;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_OwnerPage = __Value;
        return;
    }
    const TDataObjectPtr<FSettingCategoryConfig> GetCategoryConfig() const property
    {
        const TDataObjectPtr<FSettingCategoryConfig> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TDataObjectPtr<FSettingCategoryConfig> GetModify_CategoryConfig() property
    {
        TDataObjectPtr<FSettingCategoryConfig> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetCategoryConfig(const TDataObjectPtr<FSettingCategoryConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CategoryConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SettingSubTitle
{
    UPROPERTY()
    TEUIModelRef<FVM_SettingSubTitle> Self;

    __GeneratedProperties_FVM_SettingSubTitle()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_SettingCategory
{
    UPROPERTY()
    TEUIModelRef<FVM_SettingCategory> Self;

    __GeneratedProperties_FVM_SettingCategory()
    {
        return;
    }
}

namespace FVM_SettingSubTitle
{
FVM_SettingSubTitle& Create(const UObject ContextObject, const TEUIModelWeakRef<FVMS_SettingPage> &inout OwnerPage, const TDataObjectPtr<FSettingSubTitleConfig> &inout SubTitleConfig)
{
    return FVM_SettingSubTitle::CreateByManager(EUIInternal::GetContextManager(ContextObject), OwnerPage, SubTitleConfig);
}
FVM_SettingSubTitle CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FVMS_SettingPage> &inout OwnerPage, const TDataObjectPtr<FSettingSubTitleConfig> &inout SubTitleConfig)
{
    FVM_SettingSubTitle __r;
    TEUIModelRef<FVM_SettingSubTitle> local_6 = TEUIModelRef<FVM_SettingSubTitle>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_SettingSubTitle::ModelId, 0, OwnerPage, SubTitleConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SubTitleName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SubTitleDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SubTitleTag";
    local_14.TypeName = "FGameplayTag";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Items";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_SettingItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RenderOpacity";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SettingSubTitle>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SettingSubTitle;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SettingSubTitle;
}
FText __UIGetter_SubTitleName(const FVM_SettingSubTitle &inout Model)
{
    return Model.GetSubTitleName();
}
FText __UIGetter_SubTitleDesc(const FVM_SettingSubTitle &inout Model)
{
    return Model.GetSubTitleDesc();
}
FGameplayTag __UIGetter_SubTitleTag(const FVM_SettingSubTitle &inout Model)
{
    return Model.GetSubTitleTag();
}
TArray<TEUIModelRef<FVM_SettingItem>> __UIGetter_Items(const FVM_SettingSubTitle &inout Model)
{
    return Model.GetItems();
}
int __UIGetter_SelectedIndex(const FVM_SettingSubTitle &inout Model)
{
    return Model.GetSelectedIndex();
}
float32 __UIGetter_RenderOpacity(const FVM_SettingSubTitle &inout Model)
{
    return Model.GetRenderOpacity();
}
TEUIModelRef<FVM_SettingSubTitle> __UIGetter_Self(const FVM_SettingSubTitle &inout Model)
{
    return TEUIModelRef<FVM_SettingSubTitle>(Model);
}
int __IndexOf_SubTitleName()
{
    return 0;
}
int __IndexOf_SubTitleDesc()
{
    return 1;
}
int __IndexOf_SubTitleTag()
{
    return 2;
}
int __IndexOf_Items()
{
    return 3;
}
int __IndexOf_SelectedIndex()
{
    return 4;
}
int __IndexOf_OwnerPage()
{
    return 5;
}
int __IndexOf_RenderOpacity()
{
    return 6;
}
int __IndexOf_SubTitleConfig()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_SettingSubTitle
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_SettingCategory
{
FVM_SettingCategory& Create(const UObject ContextObject, const int TabIndex, const TEUIModelWeakRef<FVMS_SettingPage> &inout OwnerPage, const TDataObjectPtr<FSettingCategoryConfig> &inout CategoryConfig)
{
    return FVM_SettingCategory::CreateByManager(EUIInternal::GetContextManager(ContextObject), TabIndex, OwnerPage, CategoryConfig);
}
FVM_SettingCategory CreateByManager(const UEUIManagerSubsystem Manager, const int TabIndex, const TEUIModelWeakRef<FVMS_SettingPage> &inout OwnerPage, const TDataObjectPtr<FSettingCategoryConfig> &inout CategoryConfig)
{
    FVM_SettingCategory __r;
    TEUIModelRef<FVM_SettingCategory> local_6 = TEUIModelRef<FVM_SettingCategory>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_SettingCategory::ModelId, 0, TabIndex, OwnerPage, CategoryConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CategoryName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CategoryDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CategoryIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CategoryTag";
    local_14.TypeName = "FGameplayTag";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SubTitles";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_SettingSubTitle>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (1 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SettingCategory>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SettingCategory;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SettingCategory;
}
FText __UIGetter_CategoryName(const FVM_SettingCategory &inout Model)
{
    return Model.GetCategoryName();
}
FText __UIGetter_CategoryDesc(const FVM_SettingCategory &inout Model)
{
    return Model.GetCategoryDesc();
}
FSoftBrush __UIGetter_CategoryIcon(const FVM_SettingCategory &inout Model)
{
    return Model.GetCategoryIcon();
}
FGameplayTag __UIGetter_CategoryTag(const FVM_SettingCategory &inout Model)
{
    return Model.GetCategoryTag();
}
TArray<TEUIModelRef<FVM_SettingSubTitle>> __UIGetter_SubTitles(const FVM_SettingCategory &inout Model)
{
    return Model.GetSubTitles();
}
void __UISetter_SubTitles(FVM_SettingCategory &inout Model, const TArray<TEUIModelRef<FVM_SettingSubTitle>> &inout Value)
{
    Model.SetSubTitles(Value);
    return;
}
bool __UIGetter_bSelected(const FVM_SettingCategory &inout Model)
{
    return Model.GetbSelected();
}
TEUIModelRef<FVM_SettingCategory> __UIGetter_Self(const FVM_SettingCategory &inout Model)
{
    return TEUIModelRef<FVM_SettingCategory>(Model);
}
int __IndexOf_CategoryName()
{
    return 0;
}
int __IndexOf_CategoryDesc()
{
    return 1;
}
int __IndexOf_CategoryIcon()
{
    return 2;
}
int __IndexOf_CategoryTag()
{
    return 3;
}
int __IndexOf_SubTitles()
{
    return 4;
}
int __IndexOf_bSelected()
{
    return 5;
}
int __IndexOf_TabIndex()
{
    return 6;
}
int __IndexOf_OwnerPage()
{
    return 7;
}
int __IndexOf_CategoryConfig()
{
    return 8;
}
}
namespace __GeneratedProperties_FVM_SettingCategory
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

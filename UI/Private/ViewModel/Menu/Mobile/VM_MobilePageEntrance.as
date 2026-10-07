
namespace FVM_MobilePageEntrance
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OpenPage = FEUIModelCallbackSignature();

}
struct FVM_MobilePageEntrance : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FEUIWidgetTag m_PageTag;
    UPROPERTY()
    FGameplayTag m_RedDotEntranceTag;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;

    FVM_MobilePageEntrance()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MobilePageEntrance(const FVM_MobilePageEntrance &inout Other)
    {
        this.m_PageTag = Other.m_PageTag;
        this.m_RedDotEntranceTag = Other.m_RedDotEntranceTag;
        this.m_RedDotVM = Other.m_RedDotVM;
        return;
    }
    FVM_MobilePageEntrance& opAssign(const FVM_MobilePageEntrance &inout Other)
    {
        this.m_PageTag = Other.m_PageTag;
        this.m_RedDotEntranceTag = Other.m_RedDotEntranceTag;
        return Other.m_RedDotVM;
    }
    void LoadConfig(const FConfigVM_MobilePageEntrance &inout InConfig)
    {
        this.SetRedDotEntranceTag(InConfig.RedDotEntranceTag);
        this.SetPageTag(InConfig.PageTag);
        return;
    }
    void PostLoad()
    {
        this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(this.GetRedDotEntranceTag(), 0))));
        return;
    }
    void OpenPage()
    {
        FEUIWidgetRef local_2;
        if (local_2)
        {
            FEUIWidget::RemoveWidget(local_2);
        }
        return;
    }
    const FEUIWidgetTag GetPageTag() const property
    {
        const FEUIWidgetTag __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIWidgetTag GetModify_PageTag() property
    {
        FEUIWidgetTag __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPageTag(const FEUIWidgetTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PageTag = __Value;
        return;
    }
    const FGameplayTag GetRedDotEntranceTag() const property
    {
        const FGameplayTag __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FGameplayTag GetModify_RedDotEntranceTag() property
    {
        FGameplayTag __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetRedDotEntranceTag(const FGameplayTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RedDotEntranceTag = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(2);
        return this.m_RedDotVM;
    }
    void SetRedDotVM(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDotVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RedDotVM = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MobilePageEntrance
{
    UPROPERTY()
    TEUIModelRef<FVM_MobilePageEntrance> Self;

    __GeneratedProperties_FVM_MobilePageEntrance()
    {
        return;
    }
}

namespace FVM_MobilePageEntrance
{
FVM_MobilePageEntrance& Create(const UObject ContextObject)
{
    return FVM_MobilePageEntrance::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MobilePageEntrance CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MobilePageEntrance __r;
    TEUIModelRef<FVM_MobilePageEntrance> local_6 = TEUIModelRef<FVM_MobilePageEntrance>(EUIInternal::MakeModelWithManager(Manager, FVM_MobilePageEntrance::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RedDotVM";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MobilePageEntrance>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MobilePageEntrance;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MobilePageEntrance;
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_MobilePageEntrance &inout Model)
{
    return Model.GetRedDotVM();
}
TEUIModelRef<FVM_MobilePageEntrance> __UIGetter_Self(const FVM_MobilePageEntrance &inout Model)
{
    return TEUIModelRef<FVM_MobilePageEntrance>(Model);
}
int __IndexOf_PageTag()
{
    return 0;
}
int __IndexOf_RedDotEntranceTag()
{
    return 1;
}
int __IndexOf_RedDotVM()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_MobilePageEntrance
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

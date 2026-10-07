
namespace FVM_PageIndicator
{
    const int ModelId = 0;

}
struct FVM_PageIndicator : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_MaxPage;
    UPROPERTY()
    int m_CurrentPage;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_PageDot>> m_PageDots;

    FVM_PageIndicator()
    {
        this.m_MaxPage = 0;
        this.m_CurrentPage = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_PageIndicator(const FVM_PageIndicator &inout Other)
    {
        this.m_MaxPage = 0;
        this.m_CurrentPage = 0;
        this.m_MaxPage = int(Other.m_MaxPage);
        this.m_CurrentPage = int(Other.m_CurrentPage);
        this.m_PageDots = Other.m_PageDots;
        return;
    }
    FVM_PageIndicator& opAssign(const FVM_PageIndicator &inout Other)
    {
        this.m_MaxPage = int(Other.m_MaxPage);
        this.m_CurrentPage = int(Other.m_CurrentPage);
        return Other.m_PageDots;
    }
    void Init(const int Total)
    {
        this.SetMaxPage(Total);
        this.SetCurrentPage(0);
        this.GetModify_PageDots().Empty(0);
        int local_2 = 0;
        for (; local_2 < Total; )
        {
            TEUIModelRef<FVM_PageDot> local_6 = TEUIModelRef<FVM_PageDot>(::FVM_PageDot::Create(this.GetManager(), local_2));
            (local_2 == 0).SetbActive();
            this.GetModify_PageDots().Add(local_6);
            ++local_2;
        }
        return;
    }
    void UpdateTo(const int Page)
    {
        this.SetCurrentPage(Page);
        int local_1 = 0;
        for (; local_1 < this.GetPageDots().Num(); )
        {
            (local_1 == this.GetCurrentPage()).SetbActive();
            ++local_1;
        }
        return;
    }
    int GetMaxPage() const property
    {
        this.TrackPropertyRead(0);
        return this.m_MaxPage;
    }
    void SetMaxPage(const int __Value) property
    {
        if (this.m_MaxPage == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MaxPage = __Value;
        return;
    }
    int GetCurrentPage() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurrentPage;
    }
    void SetCurrentPage(const int __Value) property
    {
        if (this.m_CurrentPage == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentPage = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_PageDot>> GetPageDots() const property
    {
        const TArray<TEUIModelRef<FVM_PageDot>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_PageDot>> GetModify_PageDots() property
    {
        TArray<TEUIModelRef<FVM_PageDot>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPageDots(const TArray<TEUIModelRef<FVM_PageDot>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PageDots = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PageIndicator
{
    UPROPERTY()
    TEUIModelRef<FVM_PageIndicator> Self;

    __GeneratedProperties_FVM_PageIndicator()
    {
        return;
    }
}

namespace FVM_PageIndicator
{
FVM_PageIndicator& Create(const UObject ContextObject)
{
    return FVM_PageIndicator::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_PageIndicator CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_PageIndicator __r;
    TEUIModelRef<FVM_PageIndicator> local_6 = TEUIModelRef<FVM_PageIndicator>(EUIInternal::MakeModelWithManager(Manager, FVM_PageIndicator::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MaxPage";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentPage";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PageDots";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_PageDot>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PageIndicator>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PageIndicator;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PageIndicator;
}
int __UIGetter_MaxPage(const FVM_PageIndicator &inout Model)
{
    return Model.GetMaxPage();
}
int __UIGetter_CurrentPage(const FVM_PageIndicator &inout Model)
{
    return Model.GetCurrentPage();
}
TArray<TEUIModelRef<FVM_PageDot>> __UIGetter_PageDots(const FVM_PageIndicator &inout Model)
{
    return Model.GetPageDots();
}
TEUIModelRef<FVM_PageIndicator> __UIGetter_Self(const FVM_PageIndicator &inout Model)
{
    return TEUIModelRef<FVM_PageIndicator>(Model);
}
int __IndexOf_MaxPage()
{
    return 0;
}
int __IndexOf_CurrentPage()
{
    return 1;
}
int __IndexOf_PageDots()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_PageIndicator
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

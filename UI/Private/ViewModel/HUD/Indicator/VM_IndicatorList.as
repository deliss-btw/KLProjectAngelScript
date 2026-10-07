
namespace FVM_IndicatorList
{
    const int ModelId = 0;

}
struct FVM_IndicatorList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_SpotFilter> m_SpotFilter;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_Indicator>> m_Indicators;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_Indicator>> PendingIndicators;

    FVM_IndicatorList()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_IndicatorList(const FVM_IndicatorList &inout Other)
    {
        this.m_SpotFilter = Other.m_SpotFilter;
        this.m_Indicators = Other.m_Indicators;
        return;
    }
    FVM_IndicatorList& opAssign(const FVM_IndicatorList &inout Other)
    {
        this.m_SpotFilter = Other.m_SpotFilter;
        return Other.m_Indicators;
    }
    void PostConstruct()
    {
        this.SetSpotFilter(::FMS_CommonSpotFilters::Get(this.GetContext().Manager).GetOrCreateFilter(this.GetContext().Manager, EPresentationSpotUsage(1)));
        return;
    }
    void ManualAsyncTick()
    {
        this.PendingIndicators.Reset(0);
        if (!(this.GetSpotFilter()))
        {
            this.CommitIndicatorsIfChanged(this.PendingIndicators);
            return;
        }
        this.PendingIndicators.Reserve(this.GetSpotFilter().opArrow().GetDisplayingSpots().Num());
        if (!(::FMS_UIViewProjection::Get(this.GetContext().Manager).IsSnapshotValid()))
        {
            this.CommitIndicatorsIfChanged(this.PendingIndicators);
            return;
        }
        for (auto& local_20 : this.GetSpotFilter().opArrow().GetDisplayingSpots())
        {
            if (!(local_20))
            {
                continue;
            }
            if (!(::IndicatorUtils::IsSpotOutOfScreen(local_20)))
            {
                continue;
            }
            this.PendingIndicators.Add(TEUIModelRef<FVM_Indicator>(::FVM_Indicator::Create(this.GetContext().Manager, local_20)));
        }
        this.CommitIndicatorsIfChanged(this.PendingIndicators);
        return;
    }
    void CommitIndicatorsIfChanged(const TArray<TEUIModelRef<FVM_Indicator>> &inout NextIndicators)
    {
        TArray<TEUIModelRef<FVM_Indicator>> local_4;
        local_4 = this.GetIndicators();
        if ((local_4 == NextIndicators))
        {
            return;
        }
        this.GetModify_Indicators() = NextIndicators;
        return;
    }
    TEUIModelRef<FM_SpotFilter> GetSpotFilter() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SpotFilter;
    }
    void SetSpotFilter(const TEUIModelRef<FM_SpotFilter> &inout __Value) property
    {
        TEUIModelRef<FM_SpotFilter> local_2;
        local_2 = this.m_SpotFilter;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SpotFilter = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_Indicator>> GetIndicators() const property
    {
        const TArray<TEUIModelRef<FVM_Indicator>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_Indicator>> GetModify_Indicators() property
    {
        TArray<TEUIModelRef<FVM_Indicator>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetIndicators(const TArray<TEUIModelRef<FVM_Indicator>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Indicators = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_IndicatorList
{
    UPROPERTY()
    TEUIModelRef<FVM_IndicatorList> Self;

    __GeneratedProperties_FVM_IndicatorList()
    {
        return;
    }
}

namespace FVM_IndicatorList
{
FVM_IndicatorList& Create(const UObject ContextObject)
{
    return FVM_IndicatorList::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_IndicatorList CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_IndicatorList __r;
    TEUIModelRef<FVM_IndicatorList> local_6 = TEUIModelRef<FVM_IndicatorList>(EUIInternal::MakeModelWithManager(Manager, FVM_IndicatorList::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Indicators";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_Indicator>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_IndicatorList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_IndicatorList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_IndicatorList;
}
TArray<TEUIModelRef<FVM_Indicator>> __UIGetter_Indicators(const FVM_IndicatorList &inout Model)
{
    return Model.GetIndicators();
}
TEUIModelRef<FVM_IndicatorList> __UIGetter_Self(const FVM_IndicatorList &inout Model)
{
    return TEUIModelRef<FVM_IndicatorList>(Model);
}
int __IndexOf_SpotFilter()
{
    return 0;
}
int __IndexOf_Indicators()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_IndicatorList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}


namespace FVM_HeadsUpDisplayList
{
    const int ModelId = 0;

}
struct FVM_HeadsUpDisplayList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_SpotFilter> m_SpotFilter;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_HeadsUpDisplay>> m_HeadsUpDisplays;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_HeadsUpDisplay>> PendingHeadsUpDisplays;

    FVM_HeadsUpDisplayList()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_HeadsUpDisplayList(const FVM_HeadsUpDisplayList &inout Other)
    {
        this.m_SpotFilter = Other.m_SpotFilter;
        this.m_HeadsUpDisplays = Other.m_HeadsUpDisplays;
        return;
    }
    FVM_HeadsUpDisplayList& opAssign(const FVM_HeadsUpDisplayList &inout Other)
    {
        this.m_SpotFilter = Other.m_SpotFilter;
        return Other.m_HeadsUpDisplays;
    }
    void PostConstruct()
    {
        this.SetSpotFilter(::FMS_CommonSpotFilters::Get(this.GetContext().Manager).GetOrCreateFilter(this.GetContext().Manager, EPresentationSpotUsage(3)));
        return;
    }
    void ManualAsyncTick()
    {
        AECSPlayerController local_18;
        this.PendingHeadsUpDisplays.Reset(0);
        if (!(HeadsUpDisplay_Dev::CVar_EnableHeadsUpDisplay.GetBool()) || !(this.GetSpotFilter()))
        {
            this.CommitHeadsUpDisplaysIfChanged(this.PendingHeadsUpDisplays);
            return;
        }
        this.PendingHeadsUpDisplays.Reserve(this.GetSpotFilter().opArrow().GetDisplayingSpots().Num());
        FECSEntity local_10 = this.GetContext().GetLocalPlayer();
        GetDefaulted local_14;
        TWeakObjectPtr<AECSPlayerController> local_16 = local_14.opCall().GetUEPlayerController();
        if (!((local_18 != nullptr)))
        {
            this.CommitHeadsUpDisplaysIfChanged(this.PendingHeadsUpDisplays);
            return;
        }
        for (auto& local_34 : this.GetSpotFilter().opArrow().GetDisplayingSpots())
        {
            if (!(local_34))
            {
                continue;
            }
            FSpotViewAdapter local_42;
            TDataObjectPtr<FHeadsUpDisplayConfig> local_66 = ::GetHeadsUpDisplayConfig(local_34.opArrow(), local_42);
            if (!(local_66) || (int(local_66.opArrow().DisplayType) != 1))
            {
                continue;
            }
            this.PendingHeadsUpDisplays.Add(TEUIModelRef<FVM_HeadsUpDisplay>(::FVM_HeadsUpDisplay::Create(this.GetContext().Manager, local_34)));
        }
        __Lambda_UI_Private_ViewModel_HUD_HeadsUpDisplay_VM_HeadsUpDisplayList_54(FTransformUtils::GetLocation(this.GetContext().GetLocalPlayerPawn(), FFPTime(-1)));
        this.CommitHeadsUpDisplaysIfChanged(this.PendingHeadsUpDisplays);
        return;
    }
    void CommitHeadsUpDisplaysIfChanged(const TArray<TEUIModelRef<FVM_HeadsUpDisplay>> &inout NextDisplays)
    {
        TArray<TEUIModelRef<FVM_HeadsUpDisplay>> local_4;
        local_4 = this.GetHeadsUpDisplays();
        if ((local_4 == NextDisplays))
        {
            return;
        }
        this.GetModify_HeadsUpDisplays() = NextDisplays;
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
    const TArray<TEUIModelRef<FVM_HeadsUpDisplay>> GetHeadsUpDisplays() const property
    {
        const TArray<TEUIModelRef<FVM_HeadsUpDisplay>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_HeadsUpDisplay>> GetModify_HeadsUpDisplays() property
    {
        TArray<TEUIModelRef<FVM_HeadsUpDisplay>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetHeadsUpDisplays(const TArray<TEUIModelRef<FVM_HeadsUpDisplay>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_HeadsUpDisplays = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_HUD_HeadsUpDisplay_VM_HeadsUpDisplayList_54
{
    UPROPERTY()
    FVector __PlayerLocation;

    __Lambda_UI_Private_ViewModel_HUD_HeadsUpDisplay_VM_HeadsUpDisplayList_54()
    {
        return;
    }
    __Lambda_UI_Private_ViewModel_HUD_HeadsUpDisplay_VM_HeadsUpDisplayList_54(const FVector &inout _InPlayerLocation)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FVector GetPlayerLocation() property
    {
        FVector __r;
        return __r;
    }
    bool opCall(const TEUIModelRef<FVM_HeadsUpDisplay> &inout A, const TEUIModelRef<FVM_HeadsUpDisplay> &inout B)
    {
        return ::PresentationSpotUtils::CompareDistance(this.GetPlayerLocation(), A.opArrow().GetSpot(), B.opArrow().GetSpot(), false);
    }
}

struct __GeneratedProperties_FVM_HeadsUpDisplayList
{
    UPROPERTY()
    TEUIModelRef<FVM_HeadsUpDisplayList> Self;

    __GeneratedProperties_FVM_HeadsUpDisplayList()
    {
        return;
    }
}

namespace FVM_HeadsUpDisplayList
{
FVM_HeadsUpDisplayList& Create(const UObject ContextObject)
{
    return FVM_HeadsUpDisplayList::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_HeadsUpDisplayList CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_HeadsUpDisplayList __r;
    TEUIModelRef<FVM_HeadsUpDisplayList> local_6 = TEUIModelRef<FVM_HeadsUpDisplayList>(EUIInternal::MakeModelWithManager(Manager, FVM_HeadsUpDisplayList::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "HeadsUpDisplays";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_HeadsUpDisplay>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_HeadsUpDisplayList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_HeadsUpDisplayList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_HeadsUpDisplayList;
}
TArray<TEUIModelRef<FVM_HeadsUpDisplay>> __UIGetter_HeadsUpDisplays(const FVM_HeadsUpDisplayList &inout Model)
{
    return Model.GetHeadsUpDisplays();
}
TEUIModelRef<FVM_HeadsUpDisplayList> __UIGetter_Self(const FVM_HeadsUpDisplayList &inout Model)
{
    return TEUIModelRef<FVM_HeadsUpDisplayList>(Model);
}
int __IndexOf_SpotFilter()
{
    return 0;
}
int __IndexOf_HeadsUpDisplays()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_HeadsUpDisplayList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

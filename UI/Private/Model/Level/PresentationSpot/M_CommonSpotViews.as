
namespace FMS_CommonSpotViews
{
    const int ModelId = 0;

}
struct FMS_CommonSpotViews : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<EPresentationDataType, TEUIModelWeakRef<FM_SpotView>> m_DefaultViews;
    UPROPERTY()
    FSpotView m_GlobalDefaultView;
    UPROPERTY()
    TDataObjectPtr<FMapConfig> m_GlobalDefaultViewMap;

    FMS_CommonSpotViews()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_CommonSpotViews(const FMS_CommonSpotViews &inout Other)
    {
        this.m_DefaultViews = Other.m_DefaultViews;
        this.m_GlobalDefaultViewMap = Other.m_GlobalDefaultViewMap;
        return;
    }
    FMS_CommonSpotViews& opAssign(const FMS_CommonSpotViews &inout Other)
    {
        this.m_DefaultViews = Other.m_DefaultViews;
        return Other.m_GlobalDefaultViewMap;
    }
    TEUIModelRef<FM_SpotView> GetOrCreateDefaultView(const UObject WorldContext, const EPresentationDataType DataType)
    {
        TEUIModelWeakRef<FM_SpotView> local_2;
        if (this.GetDefaultViews().Find(DataType, local_2) && local_2.IsValid())
        {
            return local_2.AsRef();
        }
        FMS_CommonSpotViews& local_8 = ::FMS_CommonSpotViews::Get(this.GetContext().Manager);
        FM_SpotView& local_10 = ::FM_SpotView::CreateDefault(WorldContext, EPresentationDataType(DataType));
        local_8.GetModify_DefaultViews().Add(DataType, TEUIModelWeakRef<FM_SpotView>(local_10));
        return TEUIModelRef<FM_SpotView>(local_10);
    }
    FSpotView GetOrCreateGlobalDefaultView()
    {
        FSpotView __r;
        TDataObjectPtr<FMapConfig> local_26 = ::PresentationSpotUtils::GetCurrentMapConfig(this.GetManager());
        if (!(local_26) && !(this.GetGlobalDefaultView()))
        {
            this.GetModify_GlobalDefaultView().Scope = EPresentationSpotDisplayScope(0);
            this.GetModify_GlobalDefaultView().SpotRegistries.Add(TEUIModelRef<FM_SpotRegistry>(::PresentationSpotUtils::GetLevelSpotRegistry(this.GetManager())));
            this.GetModify_GlobalDefaultView().SpotRegistries.Add(TEUIModelRef<FM_SpotRegistry>(::PresentationSpotUtils::GetDefaultRegistry(this.GetManager())));
        }
        TDataObjectPtr<FMapConfig> local_50;
        local_50 = this.GetGlobalDefaultViewMap();
        if (!((local_50 == local_26.opImplConv())))
        {
            this.SetGlobalDefaultViewMap(local_26);
            this.GetModify_GlobalDefaultView().Scope = EPresentationSpotDisplayScope(0);
            this.GetModify_GlobalDefaultView().SpotRegistries.Empty(0);
            this.GetModify_GlobalDefaultView().SpotRegistries.Add(TEUIModelRef<FM_SpotRegistry>(::PresentationSpotUtils::GetLevelSpotRegistry(this.GetManager())));
            this.GetModify_GlobalDefaultView().SpotRegistries.Add(TEUIModelRef<FM_SpotRegistry>(::PresentationSpotUtils::GetDefaultRegistry(this.GetManager())));
            FM_SpotRegistry& local_108 = ::PresentationSpotUtils::GetMapRegistry(this.GetManager(), local_26);
            if (local_108)
            {
                this.GetModify_GlobalDefaultView().SpotRegistries.Add(TEUIModelRef<FM_SpotRegistry>(local_108));
            }
        }
        return __r;
    }
    const TMap<EPresentationDataType, TEUIModelWeakRef<FM_SpotView>> GetDefaultViews() const property
    {
        const TMap<EPresentationDataType, TEUIModelWeakRef<FM_SpotView>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<EPresentationDataType, TEUIModelWeakRef<FM_SpotView>> GetModify_DefaultViews() property
    {
        TMap<EPresentationDataType, TEUIModelWeakRef<FM_SpotView>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDefaultViews(const TMap<EPresentationDataType, TEUIModelWeakRef<FM_SpotView>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DefaultViews = __Value;
        return;
    }
    const FSpotView GetGlobalDefaultView() const property
    {
        const FSpotView __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSpotView GetModify_GlobalDefaultView() property
    {
        FSpotView __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetGlobalDefaultView(const FSpotView &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    const TDataObjectPtr<FMapConfig> GetGlobalDefaultViewMap() const property
    {
        const TDataObjectPtr<FMapConfig> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TDataObjectPtr<FMapConfig> GetModify_GlobalDefaultViewMap() property
    {
        TDataObjectPtr<FMapConfig> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetGlobalDefaultViewMap(const TDataObjectPtr<FMapConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_GlobalDefaultViewMap = __Value;
        return;
    }
}

namespace FMS_CommonSpotViews
{
FMS_CommonSpotViews& Get(const UObject ContextObject)
{
    return FMS_CommonSpotViews::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_CommonSpotViews GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_CommonSpotViews __r;
    TEUIModelRef<FMS_CommonSpotViews> local_6 = TEUIModelRef<FMS_CommonSpotViews>(EUIInternal::MakeModelWithManager(Manager, FMS_CommonSpotViews::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_CommonSpotViews;
}
int __IndexOf_DefaultViews()
{
    return 0;
}
int __IndexOf_GlobalDefaultView()
{
    return 1;
}
int __IndexOf_GlobalDefaultViewMap()
{
    return 2;
}
}

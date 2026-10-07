
namespace FM_SpotView
{
    const int ModelId = 0;

}
struct FSpotView
{
    UPROPERTY()
    TArray<TEUIModelRef<FM_SpotRegistry>> SpotRegistries;
    UPROPERTY()
    EPresentationSpotDisplayScope Scope = EPresentationSpotDisplayScope(0);

    FSpotView(const TEUIModelRef<FM_SpotRegistry> &inout InSpotRegistry)
    {
        if (InSpotRegistry)
        {
            this.Add(InSpotRegistry);
            this.Scope = InSpotRegistry.opArrow().GetDefaultDisplayScope();
        }
        return;
    }
    FSpotView(const TArray<TEUIModelRef<FM_SpotRegistry>> &inout InSpotRegistries)
    {
        for (auto& local_16 : InSpotRegistries)
        {
            if (local_16)
            {
                this.Add(local_16);
            }
        }
        if (!(!(!(InSpotRegistries.IsEmpty()))) && InSpotRegistries[0])
        {
            this.Scope = InSpotRegistries[0].opArrow().GetDefaultDisplayScope();
        }
        return;
    }
    bool IsSpotVisible(const FM_Spot &inout Spot) const
    {
        if (!(Spot))
        {
            return false;
        }
        if (!(Spot.HasDisplayScope(this.Scope)))
        {
            return false;
        }
        for (auto& local_16 : this)
        {
            if (local_16 && local_16.opArrow().HasSpot((TEUIModelRef<FM_Spot>(Spot))))
            {
                return true;
            }
        }
        return false;
    }
    const FInstancedStruct GetPresentationData(const FM_Spot &inout Spot, const EPresentationDataType DataType) const
    {
        bool local_1 = false;
        const FInstancedStruct __r;
        if (this.IsSpotVisible(Spot))
        {
            for (auto& local_16 : this)
            {
                if (local_16 && local_16.opArrow().HasPresentationData((TEUIModelRef<FM_Spot>(Spot))))
                {
                    TEUIModelRef<FM_Spot> local_18 = TEUIModelRef<FM_Spot>(Spot);
                    return __r;
                }
            }
        }
        return local_1;
    }
    FDataObjectPtr GetConfigData(const FM_Spot &inout Spot, const EPresentationDataType DataType) const
    {
        if (this.IsSpotVisible(Spot))
        {
            for (auto& local_16 : this)
            {
                if (local_16 && local_16.opArrow().HasConfigData((TEUIModelRef<FM_Spot>(Spot))))
                {
                    return local_16.opArrow().GetConfigData((TEUIModelRef<FM_Spot>(Spot)));
                }
            }
        }
        return FDataObjectPtr();
    }
    FDataObjectPtr GetPresentationConfigData(const FM_Spot &inout Spot) const
    {
        if (this.IsSpotVisible(Spot))
        {
            for (auto& local_16 : this)
            {
                if (local_16 && local_16.opArrow().HasPresentationConfigData((TEUIModelRef<FM_Spot>(Spot))))
                {
                    return local_16.opArrow().GetPresentationConfigData((TEUIModelRef<FM_Spot>(Spot)));
                }
            }
        }
        return FDataObjectPtr();
    }
    FDataObjectPtr GetMinimapIconConfigData(const FM_Spot &inout Spot) const
    {
        if (this.IsSpotVisible(Spot))
        {
            for (auto& local_16 : this)
            {
                if (local_16 && local_16.opArrow().HasMinimapIconConfigData((TEUIModelRef<FM_Spot>(Spot))))
                {
                    return local_16.opArrow().GetMinimapIconConfigData((TEUIModelRef<FM_Spot>(Spot)));
                }
            }
        }
        return FDataObjectPtr();
    }
    FDataObjectPtr GetIndicatorConfigData(const FM_Spot &inout Spot) const
    {
        if (this.IsSpotVisible(Spot))
        {
            for (auto& local_16 : this)
            {
                if (local_16 && local_16.opArrow().HasIndicatorConfigData((TEUIModelRef<FM_Spot>(Spot))))
                {
                    return local_16.opArrow().GetIndicatorConfigData((TEUIModelRef<FM_Spot>(Spot)));
                }
            }
        }
        return FDataObjectPtr();
    }
    FDataObjectPtr GetNavigationBarIconConfigData(const FM_Spot &inout Spot) const
    {
        if (this.IsSpotVisible(Spot))
        {
            for (auto& local_16 : this)
            {
                if (local_16 && local_16.opArrow().HasNavigationBarIconConfigData((TEUIModelRef<FM_Spot>(Spot))))
                {
                    return local_16.opArrow().GetNavigationBarIconConfigData((TEUIModelRef<FM_Spot>(Spot)));
                }
            }
        }
        return FDataObjectPtr();
    }
    FDataObjectPtr GetHeadsUpDisplayConfigData(const FM_Spot &inout Spot) const
    {
        if (this.IsSpotVisible(Spot))
        {
            for (auto& local_16 : this)
            {
                if (local_16 && local_16.opArrow().HasHeadsUpDisplayConfigData((TEUIModelRef<FM_Spot>(Spot))))
                {
                    return local_16.opArrow().GetHeadsUpDisplayConfigData((TEUIModelRef<FM_Spot>(Spot)));
                }
            }
        }
        return FDataObjectPtr();
    }
    bool HasPresentationData(const FM_Spot &inout Spot, const EPresentationDataType DataType) const
    {
        if (!(this.IsSpotVisible(Spot)))
        {
            return false;
        }
        for (auto& local_16 : this)
        {
            if (local_16 && local_16.opArrow().HasPresentationData((TEUIModelRef<FM_Spot>(Spot))))
            {
                return true;
            }
        }
        return false;
    }
    bool IsValid() const
    {
        return !(this.IsEmpty());
    }
    bool opConv() const
    {
        return this.IsValid();
    }
}

struct FMsg_InterestedSpotAdded : FEUIMessage
{
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;

    FMsg_InterestedSpotAdded()
    {
        return;
    }
}

struct FMsg_InterestedSpotRemoved : FEUIMessage
{
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;

    FMsg_InterestedSpotRemoved()
    {
        return;
    }
}

struct FMsg_InterestedSpotDataModified : FEUIMessage
{
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;
    UPROPERTY()
    EPresentationDataType DataType;


}

struct FM_SpotView : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    FSpotView m_View;
    UPROPERTY()
    FBitSet32 m_InterestedDataTypes;
    UPROPERTY()
    TSet<TEUIModelRef<FM_Spot>> m_InterestedSpots;

    FM_SpotView()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_SpotView' by default constructor.");
        return;
    }
    FM_SpotView(const FM_SpotView &inout Other)
    {
        this.m_InterestedDataTypes = Other.m_InterestedDataTypes;
        this.m_InterestedSpots = Other.m_InterestedSpots;
        return;
    }
    FM_SpotView(const FSpotView &inout InView, const FBitSet32 &inout InInterestedDataTypes)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetView(InView);
        this.SetInterestedDataTypes(InInterestedDataTypes);
        for (auto& local_18 : this.GetView().SpotRegistries)
        {
            if (!(local_18))
            {
                continue;
            }
            for (auto& local_36 : local_18.opArrow().GetAllSpots())
            {
                if (!(this.GetInterestedSpots().Contains(local_36.GetKey())) && this.IsSpotInterestedInternal(local_36.GetKey()))
                {
                    this.GetModify_InterestedSpots().Add(local_36.GetKey());
                }
            }
        }
        for (auto& local_18 : this.GetView().SpotRegistries)
        {
            if (local_18)
            {
                local_18.opArrow().AddConcerningSpotViewInternal(this);
            }
        }
        return;
    }
    FM_SpotView& opAssign(const FM_SpotView &inout Other)
    {
        this.m_InterestedDataTypes = Other.m_InterestedDataTypes;
        return Other.m_InterestedSpots;
    }
    const TSet<TEUIModelRef<FM_Spot>>& GetAllInterestedSpots() const property
    {
        return this.GetInterestedSpots();
    }
    bool IsInterestedDataType(const EPresentationDataType DataType) const
    {
        int local_1 = int(DataType);
        return this.GetInterestedDataTypes().GetBit(local_1);
    }
    bool IsInterestedSpot(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        return this.GetInterestedSpots().Contains(Spot);
    }
    const FSpotView& AsSpotViewStruct() const
    {
        return this.GetView();
    }
    void NotifySpotPresentationDataModifiedInternal(const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationDataType DataType, const FM_SpotRegistry &inout Registry)
    {
        if (!(this.IsInterestedDataType(EPresentationDataType(DataType))))
        {
            return;
        }
        bool local_1 = this.GetInterestedSpots().Contains(Spot);
        if (this.IsSpotInterestedInternal(Spot))
        {
            if (local_1)
            {
                FMsg_InterestedSpotDataModified local_10;
                FEUIModelRef local_8 = FEUIModelRef(this);
                FEUIMessageBus::Publish(EUIMessageBus);
                local_10.Spot = Spot;
                local_10.DataType = DataType;
            }
            else
            {
                this.AddInterestedSpotInternal(Spot);
            }
            return;
        }
        if (local_1)
        {
            this.RemoveInterestedSpotInternal(Spot);
        }
        return;
    }
    void NotifySpotAddedInternal(const TEUIModelRef<FM_Spot> &inout Spot, const FM_SpotRegistry &inout Registry)
    {
        this.ReevaluateInterestedSpotInternal(Spot);
        return;
    }
    void NotifySpotScopeChangedInternal(const TEUIModelRef<FM_Spot> &inout Spot, const FM_SpotRegistry &inout Registry)
    {
        this.ReevaluateInterestedSpotInternal(Spot);
        return;
    }
    void NotifySpotRemovedInternal(const TEUIModelRef<FM_Spot> &inout Spot, const FM_SpotRegistry &inout Registry, const FBitSet32 &inout SpotDataTypesInRegistry)
    {
        bool local_2 = this.GetInterestedSpots().Contains(Spot);
        bool local_1 = this.IsSpotInterestedInternal(Spot);
        if (!(local_1))
        {
            if (local_2)
            {
                this.RemoveInterestedSpotInternal(Spot);
            }
            return;
        }
        if (!(local_2))
        {
            this.AddInterestedSpotInternal(Spot);
            return;
        }
        if (SpotDataTypesInRegistry.IsIntersect(this.GetInterestedDataTypes()))
        {
            int local_4 = 0;
            for (; local_4 < 12; ++local_4)
            {
                if (SpotDataTypesInRegistry.GetBit(local_4) && this.IsInterestedDataType(EPresentationDataType(local_4)))
                {
                    FMsg_InterestedSpotDataModified local_16;
                    FEUIModelRef local_14 = FEUIModelRef(this);
                    FEUIMessageBus::Publish(EUIMessageBus);
                    local_16.Spot = Spot;
                    local_16.DataType = EPresentationDataType(local_4);
                }
            }
        }
        return;
    }
    bool IsSpotInterestedInternal(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (!(Spot))
        {
            return false;
        }
        if (!(Spot.opArrow().HasDisplayScope(EPresentationSpotDisplayScope(this.GetView().Scope))))
        {
            return false;
        }
        bool local_3 = false;
        bool local_4 = false;
        for (auto& local_18 : this.GetView().SpotRegistries)
        {
            if (!(local_18))
            {
                continue;
            }
            if (local_18.opArrow().HasSpot(Spot))
            {
                local_3 = true;
            }
            if (local_18.opArrow().GetPresentationDataTypesAsBitSet(Spot).IsIntersect(this.GetInterestedDataTypes()))
            {
                local_4 = true;
            }
            if (local_3 && local_4)
            {
                return true;
            }
        }
        return false;
    }
    void ReevaluateInterestedSpotInternal(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        if (this.IsSpotInterestedInternal(Spot))
        {
            this.AddInterestedSpotInternal(Spot);
            return;
        }
        this.RemoveInterestedSpotInternal(Spot);
        return;
    }
    void AddInterestedSpotInternal(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        int local_10 = 0;
        if (Spot && !(this.GetInterestedSpots().Contains(Spot)))
        {
            this.GetModify_InterestedSpots().Add(Spot);
            FEUIModelRef local_8 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_10.Spot = Spot;
        }
        return;
    }
    void RemoveInterestedSpotInternal(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        bool local_1 = false;
        int local_10 = 0;
        if ((Spot && local_1))
        {
            FEUIModelRef local_8 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_10.Spot = Spot;
        }
        return;
    }
    FSpotView GetView() const property
    {
        FSpotView __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FSpotView GetModify_View() property
    {
        FSpotView __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetView(const FSpotView &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    const FBitSet32 GetInterestedDataTypes() const property
    {
        const FBitSet32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FBitSet32 GetModify_InterestedDataTypes() property
    {
        FBitSet32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetInterestedDataTypes(const FBitSet32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_InterestedDataTypes = __Value;
        return;
    }
    const TSet<TEUIModelRef<FM_Spot>> GetInterestedSpots() const property
    {
        const TSet<TEUIModelRef<FM_Spot>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TSet<TEUIModelRef<FM_Spot>> GetModify_InterestedSpots() property
    {
        TSet<TEUIModelRef<FM_Spot>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetInterestedSpots(const TSet<TEUIModelRef<FM_Spot>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_InterestedSpots = __Value;
        return;
    }
}

struct FSpotViewAdapter
{
    UPROPERTY()
    FSpotView SpotView;
    UPROPERTY()
    bool bDefaultView;

    FSpotViewAdapter()
    {
        this.bDefaultView = true;
        return;
    }
    FSpotViewAdapter(const TEUIModelRef<FM_SpotRegistry> &inout InSpotRegistry)
    {
        if (InSpotRegistry)
        {
            FSpotView local_8 = FSpotView(InSpotRegistry);
            return;
        }
        this.bDefaultView = true;
        return;
    }
    FSpotViewAdapter(const TEUIModelRef<FM_SpotView> &inout InSpotView)
    {
        if (InSpotView)
        {
        }
        return;
    }
    FSpotViewAdapter(const FM_SpotView &inout InSpotView)
    {
        return;
    }
    FSpotViewAdapter(const FSpotView &inout InSpotView)
    {
        return;
    }
    const FSpotView& GetSpotView(const UObject WorldContext)
    {
        bool local_1 = this.bDefaultView;
        if (local_1)
        {
            ::PresentationSpotUtils::GetDefaultView(WorldContext);
            local_1 = false;
            this.bDefaultView = local_1;
        }
        return local_1;
    }
    FDataObjectPtr GetConfigData(const FM_Spot &inout Spot, const EPresentationDataType DataType)
    {
        if (!(Spot))
        {
            return FDataObjectPtr();
        }
        return this.GetSpotView(Spot.GetManager()).GetConfigData(Spot);
    }
    FDataObjectPtr GetPresentationConfigData(const FM_Spot &inout Spot)
    {
        if (!(Spot))
        {
            return FDataObjectPtr();
        }
        return this.GetSpotView(Spot.GetManager()).GetPresentationConfigData(Spot);
    }
    FDataObjectPtr GetMinimapIconConfigData(const FM_Spot &inout Spot)
    {
        if (!(Spot))
        {
            return FDataObjectPtr();
        }
        return this.GetSpotView(Spot.GetManager()).GetMinimapIconConfigData(Spot);
    }
    FDataObjectPtr GetIndicatorConfigData(const FM_Spot &inout Spot)
    {
        if (!(Spot))
        {
            return FDataObjectPtr();
        }
        return this.GetSpotView(Spot.GetManager()).GetIndicatorConfigData(Spot);
    }
    FDataObjectPtr GetNavigationBarIconConfigData(const FM_Spot &inout Spot)
    {
        if (!(Spot))
        {
            return FDataObjectPtr();
        }
        return this.GetSpotView(Spot.GetManager()).GetNavigationBarIconConfigData(Spot);
    }
    FDataObjectPtr GetHeadsUpDisplayConfigData(const FM_Spot &inout Spot)
    {
        if (!(Spot))
        {
            return FDataObjectPtr();
        }
        return this.GetSpotView(Spot.GetManager()).GetHeadsUpDisplayConfigData(Spot);
    }
}

namespace FM_SpotView
{
FM_SpotView CreateDefault(const UObject WorldContext)
{
    FM_SpotView __r;
    PresentationSpotUtils::GetDefaultView(WorldContext);
    return __r;
}
FM_SpotView CreateDefault(const UObject WorldContext, const EPresentationDataType InInterestedDataType)
{
    FM_SpotView __r;
    PresentationSpotUtils::GetDefaultView(WorldContext);
    return __r;
}
FM_SpotView CreateDefault(const UObject WorldContext, const TArray<EPresentationDataType> &inout InInterestedDataTypes)
{
    FM_SpotView __r;
    PresentationSpotUtils::GetDefaultView(WorldContext);
    return __r;
}
FM_SpotView CreateFromRegistry(const UObject WorldContext, const TEUIModelRef<FM_SpotRegistry> &inout InSpotRegistry)
{
    FM_SpotView __r;
    FM_SpotView::GetAllDataTypes();
    FSpotView local_8 = FSpotView(InSpotRegistry);
    return __r;
}
FM_SpotView CreateFromRegistry(const UObject WorldContext, const TEUIModelRef<FM_SpotRegistry> &inout InSpotRegistry, const EPresentationDataType InInterestedDataType)
{
    FM_SpotView __r;
    FM_SpotView::GetDataTypesFromSingle(EPresentationDataType(InInterestedDataType));
    FSpotView local_8 = FSpotView(InSpotRegistry);
    return __r;
}
FM_SpotView CreateFromRegistry(const UObject WorldContext, const TEUIModelRef<FM_SpotRegistry> &inout InSpotRegistry, const TArray<EPresentationDataType> &inout InInterestedDataTypes)
{
    FM_SpotView __r;
    FM_SpotView::GetDataTypesFromArray(InInterestedDataTypes);
    FSpotView local_8 = FSpotView(InSpotRegistry);
    return __r;
}
FM_SpotView CreateFromRegistries(const UObject WorldContext, const TArray<TEUIModelRef<FM_SpotRegistry>> &inout InSpotRegistries)
{
    FM_SpotView __r;
    FM_SpotView::GetAllDataTypes();
    FSpotView local_8 = FSpotView(InSpotRegistries);
    return __r;
}
FM_SpotView CreateFromRegistries(const UObject WorldContext, const TArray<TEUIModelRef<FM_SpotRegistry>> &inout InSpotRegistries, const EPresentationDataType InInterestedDataType)
{
    FM_SpotView __r;
    FM_SpotView::GetDataTypesFromSingle(EPresentationDataType(InInterestedDataType));
    FSpotView local_8 = FSpotView(InSpotRegistries);
    return __r;
}
FM_SpotView CreateFromRegistries(const UObject WorldContext, const TArray<TEUIModelRef<FM_SpotRegistry>> &inout InSpotRegistries, const TArray<EPresentationDataType> &inout InInterestedDataTypes)
{
    FM_SpotView __r;
    FM_SpotView::GetDataTypesFromArray(InInterestedDataTypes);
    FSpotView local_8 = FSpotView(InSpotRegistries);
    return __r;
}
FM_SpotView CreateFromView(const UObject WorldContext, const FSpotView &inout InView)
{
    FM_SpotView __r;
    FM_SpotView::GetAllDataTypes();
    return __r;
}
FM_SpotView CreateFromView(const UObject WorldContext, const FSpotView &inout InView, const EPresentationDataType InInterestedDataType)
{
    FM_SpotView __r;
    FM_SpotView::GetDataTypesFromSingle(EPresentationDataType(InInterestedDataType));
    return __r;
}
FM_SpotView CreateFromView(const UObject WorldContext, const FSpotView &inout InView, const TArray<EPresentationDataType> &inout InInterestedDataTypes)
{
    FM_SpotView __r;
    FM_SpotView::GetDataTypesFromArray(InInterestedDataTypes);
    return __r;
}
FBitSet32 GetAllDataTypes()
{
    FBitSet32 local_1;
    int local_2 = 0;
    for (; local_2 < 12; )
    {
        local_1.SetBit(local_2, true);
        ++local_2;
    }
    return local_1;
}
FBitSet32 GetDataTypesFromSingle(const EPresentationDataType InDataType)
{
    FBitSet32 local_1;
    local_1.SetBit(int(InDataType), true);
    return local_1;
}
FBitSet32 GetDataTypesFromArray(const TArray<EPresentationDataType> &inout InDataTypes)
{
    FBitSet32 local_1;
    auto local_8 = InDataTypes.Iterator();
    for (; local_8.CanProceed;)
    {
        const int& local_18 = int(local_8.Proceed());
        local_1.SetBit(int(local_18), true);
    }
    return local_1;
}
FM_SpotView& Create(const UObject ContextObject, const FSpotView &inout View, const FBitSet32 &inout InterestedDataTypes)
{
    return FM_SpotView::CreateByManager(EUIInternal::GetContextManager(ContextObject), View, InterestedDataTypes);
}
FM_SpotView CreateByManager(const UEUIManagerSubsystem Manager, const FSpotView &inout View, const FBitSet32 &inout InterestedDataTypes)
{
    FM_SpotView __r;
    TEUIModelRef<FM_SpotView> local_6 = TEUIModelRef<FM_SpotView>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_SpotView::ModelId, 0, View, InterestedDataTypes));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_SpotView;
}
int __IndexOf_View()
{
    return 0;
}
int __IndexOf_InterestedDataTypes()
{
    return 1;
}
int __IndexOf_InterestedSpots()
{
    return 2;
}
}


namespace FM_SpotRegistry
{
    const int ModelId = 0;
}
namespace FMS_SpotRegistries
{
    const int ModelId = 0;

}
struct FMsg_SpotAddedToRegistry : FEUIMessage
{
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;

    FMsg_SpotAddedToRegistry()
    {
        return;
    }
}

struct FMsg_SpotRemovedFromRegistry : FEUIMessage
{
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;

    FMsg_SpotRemovedFromRegistry()
    {
        return;
    }
}

struct FMsg_SpotRegistryPresentationDataModified : FEUIMessage
{
    UPROPERTY()
    TEUIModelRef<FM_Spot> Spot;
    UPROPERTY()
    EPresentationDataType DataType;


}

struct FSpotPresentationData
{
    UPROPERTY()
    FDataObjectPtr PresentationConfig;
    UPROPERTY()
    FDataObjectPtr MinimapIconConfig;
    UPROPERTY()
    FDataObjectPtr IndicatorConfig;
    UPROPERTY()
    FDataObjectPtr NavigationBarIconConfig;
    UPROPERTY()
    FDataObjectPtr HeadsUpDisplayConfig;
    UPROPERTY()
    TMap<EPresentationDataType, FInstancedStruct> PresentationDataMap;

    FSpotPresentationData()
    {
        return;
    }
    FDataObjectPtr GetPresentationConfigData() const
    {
        return this;
    }
    FDataObjectPtr GetMinimapIconConfigData() const
    {
        return this.MinimapIconConfig;
    }
    FDataObjectPtr GetIndicatorConfigData() const
    {
        return this.IndicatorConfig;
    }
    FDataObjectPtr GetNavigationBarIconConfigData() const
    {
        return this.NavigationBarIconConfig;
    }
    FDataObjectPtr GetHeadsUpDisplayConfigData() const
    {
        return this.HeadsUpDisplayConfig;
    }
    bool HasPresentationConfigData() const
    {
        return !(!(this));
    }
    bool HasMinimapIconConfigData() const
    {
        return !(!(this.MinimapIconConfig));
    }
    bool HasIndicatorConfigData() const
    {
        return !(!(this.IndicatorConfig));
    }
    bool HasNavigationBarIconConfigData() const
    {
        return !(!(this.NavigationBarIconConfig));
    }
    bool HasHeadsUpDisplayConfigData() const
    {
        return !(!(this.HeadsUpDisplayConfig));
    }
    void SetPresentationConfigData(const FDataObjectPtr &inout ConfigData)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    void SetMinimapIconConfigData(const FDataObjectPtr &inout ConfigData)
    {
        this.MinimapIconConfig = ConfigData;
        return;
    }
    void SetIndicatorConfigData(const FDataObjectPtr &inout ConfigData)
    {
        this.IndicatorConfig = ConfigData;
        return;
    }
    void SetNavigationBarIconConfigData(const FDataObjectPtr &inout ConfigData)
    {
        this.NavigationBarIconConfig = ConfigData;
        return;
    }
    void SetHeadsUpDisplayConfigData(const FDataObjectPtr &inout ConfigData)
    {
        this.HeadsUpDisplayConfig = ConfigData;
        return;
    }
    FDataObjectPtr GetConfigData(const EPresentationDataType DataType) const
    {
        switch (int(DataType))
        {
        case 0:
        {
            return this.GetPresentationConfigData();
        }
        case 1:
        {
            return this.GetMinimapIconConfigData();
        }
        case 2:
        {
            return this.GetIndicatorConfigData();
        }
        case 3:
        {
            return this.GetNavigationBarIconConfigData();
        }
        case 4:
        {
            return this.GetHeadsUpDisplayConfigData();
        }
        }
        return FDataObjectPtr();
    }
    bool HasConfigData(const EPresentationDataType DataType) const
    {
        return !(!(this.GetConfigData(EPresentationDataType(DataType))));
    }
    void SetConfigData(const EPresentationDataType DataType, const FDataObjectPtr &inout ConfigData)
    {
        switch (int(DataType))
        {
        case 0:
        {
            this.SetPresentationConfigData(ConfigData);
            return;
        }
        case 1:
        {
            this.SetMinimapIconConfigData(ConfigData);
            return;
        }
        case 2:
        {
            this.SetIndicatorConfigData(ConfigData);
            return;
        }
        case 3:
        {
            this.SetNavigationBarIconConfigData(ConfigData);
            return;
        }
        case 4:
        {
            this.SetHeadsUpDisplayConfigData(ConfigData);
            return;
        }
        }
        return;
    }
}

struct FM_SpotRegistry : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    FName m_RegistryName;
    UPROPERTY()
    bool m_bBroadcastMessages;
    UPROPERTY()
    EPresentationSpotDisplayScope m_DefaultDisplayScope;
    UPROPERTY()
    TMap<TEUIModelRef<FM_Spot>, FSpotPresentationData> m_AllSpotsPrivate;
    UPROPERTY()
    TArray<TEUIModelWeakRef<FM_SpotView>> m_ConcerningSpotViews;

    FM_SpotRegistry()
    {
        this.m_bBroadcastMessages = false;
        this.m_DefaultDisplayScope = EPresentationSpotDisplayScope(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_SpotRegistry' by default constructor.");
        return;
    }
    FM_SpotRegistry(const FM_SpotRegistry &inout Other)
    {
        this.m_bBroadcastMessages = false;
        this.m_DefaultDisplayScope = EPresentationSpotDisplayScope(0);
        this.m_RegistryName = Other.m_RegistryName;
        this.m_bBroadcastMessages = Other.m_bBroadcastMessages;
        this.m_DefaultDisplayScope = Other.m_DefaultDisplayScope;
        this.m_AllSpotsPrivate = Other.m_AllSpotsPrivate;
        this.m_ConcerningSpotViews = Other.m_ConcerningSpotViews;
        return;
    }
    FM_SpotRegistry(const FName &inout InRegistryName, const bool InbBroadcastMessages)
    {
        this.m_bBroadcastMessages = false;
        this.m_DefaultDisplayScope = EPresentationSpotDisplayScope(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetRegistryName(InRegistryName);
        this.SetbBroadcastMessages(InbBroadcastMessages);
        return;
    }
    FM_SpotRegistry& opAssign(const FM_SpotRegistry &inout Other)
    {
        this.m_RegistryName = Other.m_RegistryName;
        this.m_bBroadcastMessages = Other.m_bBroadcastMessages;
        this.m_DefaultDisplayScope = Other.m_DefaultDisplayScope;
        this.m_AllSpotsPrivate = Other.m_AllSpotsPrivate;
        return Other.m_ConcerningSpotViews;
    }
    void SetDefaultDisplayScopeInternal(const EPresentationSpotDisplayScope Scope)
    {
        this.SetDefaultDisplayScope(EPresentationSpotDisplayScope(Scope));
        return;
    }
    FM_Spot& CreateSpot()
    {
        FM_Spot& local_2 = ::FM_Spot::Create(this.GetContext().Manager);
        FSpotPresentationData local_142;
        this.GetModify_AllSpotsPrivate().Add(TEUIModelRef<FM_Spot>(local_2), local_142);
        this.NotifySpotAddedInternal(TEUIModelRef<FM_Spot>(local_2));
        return local_2;
    }
    void AddSpot(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        if (Spot && !(this.GetAllSpots().Contains(Spot)))
        {
            FSpotPresentationData local_142;
            this.GetModify_AllSpotsPrivate().Add(Spot, local_142);
            this.NotifySpotAddedInternal(Spot);
        }
        return;
    }
    void RemoveSpot(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        if (Spot)
        {
            FSpotPresentationData local_142;
            if (this.GetModify_AllSpotsPrivate().RemoveAndCopyValue(Spot, local_142))
            {
                this.NotifySpotRemovedInternal(Spot, this.GetPresentationDataTypesAsBitSetInternal(local_142));
            }
        }
        return;
    }
    void RemoveAllSpots()
    {
        TMap<TEUIModelRef<FM_Spot>, FBitSet32> local_20;
        for (auto& local_40 : this.GetAllSpotsPrivate())
        {
            if (local_40.GetKey())
            {
                local_20.Add(local_40.GetKey(), this.GetPresentationDataTypesAsBitSetInternal());
            }
        }
        this.GetModify_AllSpotsPrivate().Empty(0);
        for (auto& local_60 : local_20)
        {
            this.NotifySpotRemovedInternal(local_60.GetKey());
        }
        return;
    }
    bool HasSpot(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        return this.GetAllSpots().Contains(Spot);
    }
    const FInstancedStruct GetPresentationData(const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationDataType DataType) const
    {
        const FInstancedStruct __r;
        if (Spot)
        {
            TConstRawPtr<FSpotPresentationData> local_4 = this.GetAllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                if (local_4.opArrow().PresentationDataMap.Find(DataType))
                {
                }
                else
                {
                }
            }
        }
        return __r;
    }
    void SetPresentationData(const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationDataType DataType, const FInstancedStruct &inout Data)
    {
        if (::SpotPresentationDataTypes::IsConfigDataType(EPresentationDataType(DataType)))
        {
            FDataObjectPtr local_26;
            if (Data.IsValid())
            {
                Get local_30;
                local_26 = local_30.opCall();
            }
            this.SetConfigData(Spot, EPresentationDataType(DataType), local_26);
            return;
        }
        if (Spot)
        {
            this.AddSpot(Spot);
            this.GetModify_AllSpotsPrivate()[Spot].PresentationDataMap.Add(DataType, Data);
            this.NotifySpotPresentationDataModifiedInternal(Spot, EPresentationDataType(DataType));
        }
        return;
    }
    FDataObjectPtr GetConfigData(const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationDataType DataType) const
    {
        if (Spot)
        {
            TConstRawPtr<FSpotPresentationData> local_4 = this.GetAllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                return local_4.opArrow().GetConfigData();
            }
        }
        return FDataObjectPtr();
    }
    FDataObjectPtr GetPresentationConfigData(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (Spot)
        {
            TConstRawPtr<FSpotPresentationData> local_4 = this.GetAllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                return local_4.opArrow().GetPresentationConfigData();
            }
        }
        return FDataObjectPtr();
    }
    FDataObjectPtr GetMinimapIconConfigData(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (Spot)
        {
            TConstRawPtr<FSpotPresentationData> local_4 = this.GetAllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                return local_4.opArrow().GetMinimapIconConfigData();
            }
        }
        return FDataObjectPtr();
    }
    FDataObjectPtr GetIndicatorConfigData(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (Spot)
        {
            TConstRawPtr<FSpotPresentationData> local_4 = this.GetAllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                return local_4.opArrow().GetIndicatorConfigData();
            }
        }
        return FDataObjectPtr();
    }
    FDataObjectPtr GetNavigationBarIconConfigData(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (Spot)
        {
            TConstRawPtr<FSpotPresentationData> local_4 = this.GetAllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                return local_4.opArrow().GetNavigationBarIconConfigData();
            }
        }
        return FDataObjectPtr();
    }
    FDataObjectPtr GetHeadsUpDisplayConfigData(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (Spot)
        {
            TConstRawPtr<FSpotPresentationData> local_4 = this.GetAllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                return local_4.opArrow().GetHeadsUpDisplayConfigData();
            }
        }
        return FDataObjectPtr();
    }
    void SetConfigData(const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationDataType DataType, const FDataObjectPtr &inout ConfigData)
    {
        switch (int(DataType))
        {
        case 0:
        {
            this.SetPresentationConfigData(Spot, ConfigData);
            return;
        }
        case 1:
        {
            this.SetMinimapIconConfigData(Spot, ConfigData);
            return;
        }
        case 2:
        {
            this.SetIndicatorConfigData(Spot, ConfigData);
            return;
        }
        case 3:
        {
            this.SetNavigationBarIconConfigData(Spot, ConfigData);
            return;
        }
        case 4:
        {
            this.SetHeadsUpDisplayConfigData(Spot, ConfigData);
            return;
        }
        }
        return;
    }
    void SetPresentationConfigData(const TEUIModelRef<FM_Spot> &inout Spot, const FDataObjectPtr &inout ConfigData)
    {
        if (!(Spot))
        {
            return;
        }
        if (!(ConfigData))
        {
            this.RemovePresentationConfigData(Spot);
            return;
        }
        this.AddSpot(Spot);
        FSpotPresentationData& local_4 = this.GetModify_AllSpotsPrivate()[Spot];
        if (local_4.GetPresentationConfigData().GetUniqueID() == ConfigData.GetUniqueID())
        {
            return;
        }
        local_4.SetPresentationConfigData(ConfigData);
        EPresentationDataType local_36;
        FInstancedStruct::Make(local_36);
        local_4.PresentationDataMap.Add(local_36, 0);
        this.NotifySpotPresentationDataModifiedInternal(Spot, EPresentationDataType(0));
        return;
    }
    void SetMinimapIconConfigData(const TEUIModelRef<FM_Spot> &inout Spot, const FDataObjectPtr &inout ConfigData)
    {
        if (!(Spot))
        {
            return;
        }
        if (!(ConfigData))
        {
            this.RemoveMinimapIconConfigData(Spot);
            return;
        }
        this.AddSpot(Spot);
        FSpotPresentationData& local_4 = this.GetModify_AllSpotsPrivate()[Spot];
        if (local_4.GetMinimapIconConfigData().GetUniqueID() == ConfigData.GetUniqueID())
        {
            return;
        }
        local_4.SetMinimapIconConfigData(ConfigData);
        EPresentationDataType local_36;
        FInstancedStruct::Make(local_36);
        local_4.PresentationDataMap.Add(local_36, 1);
        this.NotifySpotPresentationDataModifiedInternal(Spot, EPresentationDataType(1));
        return;
    }
    void SetIndicatorConfigData(const TEUIModelRef<FM_Spot> &inout Spot, const FDataObjectPtr &inout ConfigData)
    {
        if (!(Spot))
        {
            return;
        }
        if (!(ConfigData))
        {
            this.RemoveIndicatorConfigData(Spot);
            return;
        }
        this.AddSpot(Spot);
        FSpotPresentationData& local_4 = this.GetModify_AllSpotsPrivate()[Spot];
        if (local_4.GetIndicatorConfigData().GetUniqueID() == ConfigData.GetUniqueID())
        {
            return;
        }
        local_4.SetIndicatorConfigData(ConfigData);
        EPresentationDataType local_36;
        FInstancedStruct::Make(local_36);
        local_4.PresentationDataMap.Add(local_36, 2);
        this.NotifySpotPresentationDataModifiedInternal(Spot, EPresentationDataType(2));
        return;
    }
    void SetNavigationBarIconConfigData(const TEUIModelRef<FM_Spot> &inout Spot, const FDataObjectPtr &inout ConfigData)
    {
        if (!(Spot))
        {
            return;
        }
        if (!(ConfigData))
        {
            this.RemoveNavigationBarIconConfigData(Spot);
            return;
        }
        this.AddSpot(Spot);
        FSpotPresentationData& local_4 = this.GetModify_AllSpotsPrivate()[Spot];
        if (local_4.GetNavigationBarIconConfigData().GetUniqueID() == ConfigData.GetUniqueID())
        {
            return;
        }
        local_4.SetNavigationBarIconConfigData(ConfigData);
        EPresentationDataType local_36;
        FInstancedStruct::Make(local_36);
        local_4.PresentationDataMap.Add(local_36, 3);
        this.NotifySpotPresentationDataModifiedInternal(Spot, EPresentationDataType(3));
        return;
    }
    void SetHeadsUpDisplayConfigData(const TEUIModelRef<FM_Spot> &inout Spot, const FDataObjectPtr &inout ConfigData)
    {
        if (!(Spot))
        {
            return;
        }
        if (!(ConfigData))
        {
            this.RemoveHeadsUpDisplayConfigData(Spot);
            return;
        }
        this.AddSpot(Spot);
        FSpotPresentationData& local_4 = this.GetModify_AllSpotsPrivate()[Spot];
        if (local_4.GetHeadsUpDisplayConfigData().GetUniqueID() == ConfigData.GetUniqueID())
        {
            return;
        }
        local_4.SetHeadsUpDisplayConfigData(ConfigData);
        EPresentationDataType local_36;
        FInstancedStruct::Make(local_36);
        local_4.PresentationDataMap.Add(local_36, 4);
        this.NotifySpotPresentationDataModifiedInternal(Spot, EPresentationDataType(4));
        return;
    }
    void RemoveConfigData(const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationDataType DataType)
    {
        switch (int(DataType))
        {
        case 0:
        {
            this.RemovePresentationConfigData(Spot);
            return;
        }
        case 1:
        {
            this.RemoveMinimapIconConfigData(Spot);
            return;
        }
        case 2:
        {
            this.RemoveIndicatorConfigData(Spot);
            return;
        }
        case 3:
        {
            this.RemoveNavigationBarIconConfigData(Spot);
            return;
        }
        case 4:
        {
            this.RemoveHeadsUpDisplayConfigData(Spot);
            return;
        }
        }
        return;
    }
    void RemovePresentationConfigData(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        if (Spot)
        {
            TRawPtr<FSpotPresentationData> local_4 = this.GetModify_AllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                bool local_1 = local_4.opArrow().HasPresentationConfigData() || local_4.opArrow().PresentationDataMap.Contains(EPresentationDataType(0));
                local_4.opArrow().SetPresentationConfigData(FDataObjectPtr());
                if (local_1)
                {
                    this.NotifySpotPresentationDataModifiedInternal(Spot, EPresentationDataType(0));
                }
            }
        }
        return;
    }
    void RemoveMinimapIconConfigData(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        if (Spot)
        {
            TRawPtr<FSpotPresentationData> local_4 = this.GetModify_AllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                bool local_1 = local_4.opArrow().HasMinimapIconConfigData() || local_4.opArrow().PresentationDataMap.Contains(EPresentationDataType(1));
                local_4.opArrow().SetMinimapIconConfigData(FDataObjectPtr());
                if (local_1)
                {
                    this.NotifySpotPresentationDataModifiedInternal(Spot, EPresentationDataType(1));
                }
            }
        }
        return;
    }
    void RemoveIndicatorConfigData(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        if (Spot)
        {
            TRawPtr<FSpotPresentationData> local_4 = this.GetModify_AllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                bool local_1 = local_4.opArrow().HasIndicatorConfigData() || local_4.opArrow().PresentationDataMap.Contains(EPresentationDataType(2));
                local_4.opArrow().SetIndicatorConfigData(FDataObjectPtr());
                if (local_1)
                {
                    this.NotifySpotPresentationDataModifiedInternal(Spot, EPresentationDataType(2));
                }
            }
        }
        return;
    }
    void RemoveNavigationBarIconConfigData(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        if (Spot)
        {
            TRawPtr<FSpotPresentationData> local_4 = this.GetModify_AllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                bool local_1 = local_4.opArrow().HasNavigationBarIconConfigData() || local_4.opArrow().PresentationDataMap.Contains(EPresentationDataType(3));
                local_4.opArrow().SetNavigationBarIconConfigData(FDataObjectPtr());
                if (local_1)
                {
                    this.NotifySpotPresentationDataModifiedInternal(Spot, EPresentationDataType(3));
                }
            }
        }
        return;
    }
    void RemoveHeadsUpDisplayConfigData(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        if (Spot)
        {
            TRawPtr<FSpotPresentationData> local_4 = this.GetModify_AllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                bool local_1 = local_4.opArrow().HasHeadsUpDisplayConfigData() || local_4.opArrow().PresentationDataMap.Contains(EPresentationDataType(4));
                local_4.opArrow().SetHeadsUpDisplayConfigData(FDataObjectPtr());
                if (local_1)
                {
                    this.NotifySpotPresentationDataModifiedInternal(Spot, EPresentationDataType(4));
                }
            }
        }
        return;
    }
    bool HasConfigData(const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationDataType DataType) const
    {
        switch (int(DataType))
        {
        case 0:
        {
            return this.HasPresentationConfigData(Spot);
        }
        case 1:
        {
            return this.HasMinimapIconConfigData(Spot);
        }
        case 2:
        {
            return this.HasIndicatorConfigData(Spot);
        }
        case 3:
        {
            return this.HasNavigationBarIconConfigData(Spot);
        }
        case 4:
        {
            return this.HasHeadsUpDisplayConfigData(Spot);
        }
        }
        return false;
    }
    bool HasPresentationConfigData(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (Spot)
        {
            TConstRawPtr<FSpotPresentationData> local_4 = this.GetAllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                return local_4.opArrow().HasPresentationConfigData();
            }
        }
        return false;
    }
    bool HasMinimapIconConfigData(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (Spot)
        {
            TConstRawPtr<FSpotPresentationData> local_4 = this.GetAllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                return local_4.opArrow().HasMinimapIconConfigData();
            }
        }
        return false;
    }
    bool HasIndicatorConfigData(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (Spot)
        {
            TConstRawPtr<FSpotPresentationData> local_4 = this.GetAllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                return local_4.opArrow().HasIndicatorConfigData();
            }
        }
        return false;
    }
    bool HasNavigationBarIconConfigData(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (Spot)
        {
            TConstRawPtr<FSpotPresentationData> local_4 = this.GetAllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                return local_4.opArrow().HasNavigationBarIconConfigData();
            }
        }
        return false;
    }
    bool HasHeadsUpDisplayConfigData(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (Spot)
        {
            TConstRawPtr<FSpotPresentationData> local_4 = this.GetAllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                return local_4.opArrow().HasHeadsUpDisplayConfigData();
            }
        }
        return false;
    }
    void RemovePresentationData(const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationDataType DataType)
    {
        if (::SpotPresentationDataTypes::IsConfigDataType(EPresentationDataType(DataType)))
        {
            this.RemoveConfigData(Spot, EPresentationDataType(DataType));
            return;
        }
        if (Spot)
        {
            if (this.GetModify_AllSpotsPrivate().Find(Spot))
            {
                this.NotifySpotPresentationDataModifiedInternal(Spot, EPresentationDataType(DataType));
            }
        }
        return;
    }
    bool HasPresentationData(const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationDataType DataType) const
    {
        if (::SpotPresentationDataTypes::IsConfigDataType(EPresentationDataType(DataType)))
        {
            return this.HasConfigData(Spot, EPresentationDataType(DataType));
        }
        if (Spot)
        {
            TConstRawPtr<FSpotPresentationData> local_4 = this.GetAllSpotsPrivate().Find(Spot);
            if (local_4)
            {
                return local_4.opArrow().PresentationDataMap.Contains(DataType);
            }
        }
        return false;
    }
    FBitSet32 GetPresentationDataTypesAsBitSet(const TEUIModelRef<FM_Spot> &inout Spot) const
    {
        if (Spot)
        {
            if (this.GetAllSpotsPrivate().Find(Spot))
            {
                return this.GetPresentationDataTypesAsBitSetInternal();
            }
        }
        return FBitSet32();
    }
    const TMap<TEUIModelRef<FM_Spot>, FSpotPresentationData>& GetAllSpots() const property
    {
        return this.GetAllSpotsPrivate();
    }
    void AddConcerningSpotViewInternal(const FM_SpotView &inout SpotView)
    {
        this.GetModify_ConcerningSpotViews().Add(TEUIModelWeakRef<FM_SpotView>(SpotView));
        return;
    }
    void NotifySpotPresentationDataModifiedInternal(const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationDataType DataType)
    {
        if (this.GetbBroadcastMessages())
        {
            FMsg_SpotRegistryPresentationDataModified local_10;
            FEUIModelRef local_8 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_10.Spot = Spot;
            local_10.DataType = DataType;
        }
        Spot.opArrow().OnPresentationDataModifiedInternal(this);
        TArray<int> local_14;
        int local_15 = 0;
        for (; local_15 < this.GetConcerningSpotViews().Num(); ++local_15)
        {
            TEUIModelRef<FM_SpotView> local_20 = this.GetSpotViewOrMarkInvalid(local_14, local_15);
            if (local_20)
            {
                local_20.opArrow().NotifySpotPresentationDataModifiedInternal(Spot, this);
            }
        }
        this.RemoveInvalidSpotViewIndices(local_14);
        return;
    }
    void NotifySpotAddedInternal(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        int local_10 = 0;
        Spot.opArrow().OnAddedToRegistryInternal(this);
        if (this.GetbBroadcastMessages())
        {
            FEUIModelRef local_8 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_10.Spot = Spot;
        }
        TArray<int> local_14;
        int local_15 = 0;
        for (; local_15 < this.GetConcerningSpotViews().Num(); ++local_15)
        {
            TEUIModelRef<FM_SpotView> local_20 = this.GetSpotViewOrMarkInvalid(local_14, local_15);
            if (local_20)
            {
                local_20.opArrow().NotifySpotAddedInternal(Spot, this);
            }
        }
        this.RemoveInvalidSpotViewIndices(local_14);
        return;
    }
    void NotifySpotScopeChangedInternal(const TEUIModelRef<FM_Spot> &inout Spot)
    {
        TArray<int> local_4;
        int local_5 = 0;
        for (; local_5 < this.GetConcerningSpotViews().Num(); ++local_5)
        {
            TEUIModelRef<FM_SpotView> local_10 = this.GetSpotViewOrMarkInvalid(local_4, local_5);
            if (local_10)
            {
                local_10.opArrow().NotifySpotScopeChangedInternal(Spot, this);
            }
        }
        this.RemoveInvalidSpotViewIndices(local_4);
        return;
    }
    void NotifySpotRemovedInternal(const TEUIModelRef<FM_Spot> &inout Spot, const FBitSet32 &inout SpotDataTypes)
    {
        int local_10 = 0;
        Spot.opArrow().OnRemovedFromRegistryInternal(this);
        if (this.GetbBroadcastMessages())
        {
            FEUIModelRef local_8 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_10.Spot = Spot;
        }
        TArray<int> local_14;
        int local_15 = 0;
        for (; local_15 < this.GetConcerningSpotViews().Num(); ++local_15)
        {
            TEUIModelRef<FM_SpotView> local_20 = this.GetSpotViewOrMarkInvalid(local_14, local_15);
            if (local_20)
            {
                local_20.opArrow().NotifySpotRemovedInternal(Spot, this, SpotDataTypes);
            }
        }
        this.RemoveInvalidSpotViewIndices(local_14);
        return;
    }
    TEUIModelRef<FM_SpotView> GetSpotViewOrMarkInvalid(TArray<int> &inout InvalidIndices, const int Index) const
    {
        TEUIModelRef<FM_SpotView> local_2 = this.GetConcerningSpotViews()[Index].AsRef();
        if (local_2)
        {
            return local_2;
        }
        InvalidIndices.Add(Index);
        return TEUIModelRef<FM_SpotView>();
    }
    void RemoveInvalidSpotViewIndices(const TArray<int> &inout InvalidIndices)
    {
        int local_4 = InvalidIndices.Num() - 1;
        for (; local_4 >= 0; )
        {
            this.GetModify_ConcerningSpotViews().RemoveAtSwap(InvalidIndices[local_4]);
            --local_4;
        }
        return;
    }
    FBitSet32 GetPresentationDataTypesAsBitSetInternal(const FSpotPresentationData &inout SpotData) const
    {
        FBitSet32 local_1;
        if (SpotData.PresentationConfig)
        {
            local_1.SetBit(0, true);
        }
        if (SpotData.MinimapIconConfig)
        {
            local_1.SetBit(1, true);
        }
        if (SpotData.IndicatorConfig)
        {
            local_1.SetBit(2, true);
        }
        if (SpotData.NavigationBarIconConfig)
        {
            local_1.SetBit(3, true);
        }
        if (SpotData.HeadsUpDisplayConfig)
        {
            local_1.SetBit(4, true);
        }
        for (auto& local_22 : SpotData.PresentationDataMap)
        {
            local_1.SetBit(int(local_22.GetKey()), true);
        }
        return local_1;
    }
    const FName GetRegistryName() const property
    {
        const FName __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FName GetModify_RegistryName() property
    {
        FName __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetRegistryName(const FName &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_RegistryName = __Value;
        return;
    }
    bool GetbBroadcastMessages() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bBroadcastMessages;
    }
    void SetbBroadcastMessages(const bool __Value) property
    {
        if (!(this.m_bBroadcastMessages) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bBroadcastMessages = __Value;
        return;
    }
    EPresentationSpotDisplayScope GetDefaultDisplayScope() const property
    {
        this.TrackPropertyRead(2);
        return this.m_DefaultDisplayScope;
    }
    void SetDefaultDisplayScope(const EPresentationSpotDisplayScope __Value) property
    {
        if (int(this.m_DefaultDisplayScope) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DefaultDisplayScope = __Value;
        return;
    }
    const TMap<TEUIModelRef<FM_Spot>, FSpotPresentationData> GetAllSpotsPrivate() const property
    {
        const TMap<TEUIModelRef<FM_Spot>, FSpotPresentationData> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<TEUIModelRef<FM_Spot>, FSpotPresentationData> GetModify_AllSpotsPrivate() property
    {
        TMap<TEUIModelRef<FM_Spot>, FSpotPresentationData> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetAllSpotsPrivate(const TMap<TEUIModelRef<FM_Spot>, FSpotPresentationData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_AllSpotsPrivate = __Value;
        return;
    }
    const TArray<TEUIModelWeakRef<FM_SpotView>> GetConcerningSpotViews() const property
    {
        const TArray<TEUIModelWeakRef<FM_SpotView>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelWeakRef<FM_SpotView>> GetModify_ConcerningSpotViews() property
    {
        TArray<TEUIModelWeakRef<FM_SpotView>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetConcerningSpotViews(const TArray<TEUIModelWeakRef<FM_SpotView>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ConcerningSpotViews = __Value;
        return;
    }
}

struct FMS_SpotRegistries : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_SpotRegistry> m_DefaultRegistry;
    UPROPERTY()
    TEUIModelRef<FM_SpotRegistry> m_LevelSpotRegistry;
    UPROPERTY()
    TMap<TDataObjectPtr<FMapConfig>, TEUIModelRef<FM_SpotRegistry>> m_MapRegistries;

    FMS_SpotRegistries()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_SpotRegistries(const FMS_SpotRegistries &inout Other)
    {
        this.m_DefaultRegistry = Other.m_DefaultRegistry;
        this.m_LevelSpotRegistry = Other.m_LevelSpotRegistry;
        this.m_MapRegistries = Other.m_MapRegistries;
        return;
    }
    FMS_SpotRegistries& opAssign(const FMS_SpotRegistries &inout Other)
    {
        this.m_DefaultRegistry = Other.m_DefaultRegistry;
        this.m_LevelSpotRegistry = Other.m_LevelSpotRegistry;
        return Other.m_MapRegistries;
    }
    TEUIModelRef<FM_SpotRegistry> GetDefaultRegistry() const property
    {
        this.TrackPropertyRead(0);
        return this.m_DefaultRegistry;
    }
    void SetDefaultRegistry(const TEUIModelRef<FM_SpotRegistry> &inout __Value) property
    {
        TEUIModelRef<FM_SpotRegistry> local_2;
        local_2 = this.m_DefaultRegistry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DefaultRegistry = __Value;
        return;
    }
    TEUIModelRef<FM_SpotRegistry> GetLevelSpotRegistry() const property
    {
        this.TrackPropertyRead(1);
        return this.m_LevelSpotRegistry;
    }
    void SetLevelSpotRegistry(const TEUIModelRef<FM_SpotRegistry> &inout __Value) property
    {
        TEUIModelRef<FM_SpotRegistry> local_2;
        local_2 = this.m_LevelSpotRegistry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_LevelSpotRegistry = __Value;
        return;
    }
    const TMap<TDataObjectPtr<FMapConfig>, TEUIModelRef<FM_SpotRegistry>> GetMapRegistries() const property
    {
        const TMap<TDataObjectPtr<FMapConfig>, TEUIModelRef<FM_SpotRegistry>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TMap<TDataObjectPtr<FMapConfig>, TEUIModelRef<FM_SpotRegistry>> GetModify_MapRegistries() property
    {
        TMap<TDataObjectPtr<FMapConfig>, TEUIModelRef<FM_SpotRegistry>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetMapRegistries(const TMap<TDataObjectPtr<FMapConfig>, TEUIModelRef<FM_SpotRegistry>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MapRegistries = __Value;
        return;
    }
}

namespace SpotPresentationDataTypes
{
bool IsConfigDataType(const EPresentationDataType DataType)
{
    return (int(DataType) == 0 || (int(DataType) == 1) || (int(DataType) == 2) || (int(DataType) == 3) || (int(DataType) == 4));
}
}
namespace FM_SpotRegistry
{
FM_SpotRegistry& Create(const UObject ContextObject, const FName &inout RegistryName, const bool bBroadcastMessages)
{
    return FM_SpotRegistry::CreateByManager(EUIInternal::GetContextManager(ContextObject), RegistryName, bBroadcastMessages);
}
FM_SpotRegistry CreateByManager(const UEUIManagerSubsystem Manager, const FName &inout RegistryName, const bool bBroadcastMessages)
{
    FM_SpotRegistry __r;
    TEUIModelRef<FM_SpotRegistry> local_6 = TEUIModelRef<FM_SpotRegistry>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_SpotRegistry::ModelId, 0, RegistryName, bBroadcastMessages));
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
    return FM_SpotRegistry;
}
int __IndexOf_RegistryName()
{
    return 0;
}
int __IndexOf_bBroadcastMessages()
{
    return 1;
}
int __IndexOf_DefaultDisplayScope()
{
    return 2;
}
int __IndexOf_AllSpotsPrivate()
{
    return 3;
}
int __IndexOf_ConcerningSpotViews()
{
    return 4;
}
}
namespace FMS_SpotRegistries
{
FMS_SpotRegistries& Get(const UObject ContextObject)
{
    return FMS_SpotRegistries::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_SpotRegistries GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_SpotRegistries __r;
    TEUIModelRef<FMS_SpotRegistries> local_6 = TEUIModelRef<FMS_SpotRegistries>(EUIInternal::MakeModelWithManager(Manager, FMS_SpotRegistries::ModelId));
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
    return FMS_SpotRegistries;
}
int __IndexOf_DefaultRegistry()
{
    return 0;
}
int __IndexOf_LevelSpotRegistry()
{
    return 1;
}
int __IndexOf_MapRegistries()
{
    return 2;
}
}

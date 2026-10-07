
namespace FM_PresentationData_Mark
{
    const int ModelId = 0;

}
struct FPlayerMarkData
{
    UPROPERTY()
    TDataObjectPtr<FMarkConfig> MarkConfig;
    UPROPERTY()
    FFPTime MarkTime;

    FPlayerMarkData()
    {
        return;
    }
    FPlayerMarkData(const TDataObjectPtr<FMarkConfig> &inout InMarkConfig, const FFPTime &inout InMarkTime)
    {
        this.MarkTime = InMarkTime;
        return;
    }
}

struct FM_PresentationData_Mark : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    bool m_bIsPositionMark;
    UPROPERTY()
    TEUIModelWeakRef<FM_Spot> m_OwnerSpot;
    UPROPERTY()
    TEUIModelWeakRef<FM_SpotRegistry> m_OwnerRegistry;
    UPROPERTY()
    TMap<TEUIModelRef<FM_Player>, FPlayerMarkData> m_PlayerMarkDataMap;

    FM_PresentationData_Mark()
    {
        this.m_bIsPositionMark = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_PresentationData_Mark' by default constructor.");
        return;
    }
    FM_PresentationData_Mark(const FM_PresentationData_Mark &inout Other)
    {
        this.m_bIsPositionMark = false;
        this.m_bIsPositionMark = Other.m_bIsPositionMark;
        this.m_OwnerSpot = Other.m_OwnerSpot;
        this.m_OwnerRegistry = Other.m_OwnerRegistry;
        this.m_PlayerMarkDataMap = Other.m_PlayerMarkDataMap;
        return;
    }
    FM_PresentationData_Mark(const bool InbIsPositionMark, const TEUIModelWeakRef<FM_Spot> &inout InOwnerSpot, const TEUIModelWeakRef<FM_SpotRegistry> &inout InOwnerRegistry)
    {
        this.m_bIsPositionMark = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetbIsPositionMark(InbIsPositionMark);
        this.SetOwnerSpot(InOwnerSpot);
        this.SetOwnerRegistry(InOwnerRegistry);
        return;
    }
    FM_PresentationData_Mark& opAssign(const FM_PresentationData_Mark &inout Other)
    {
        this.m_bIsPositionMark = Other.m_bIsPositionMark;
        this.m_OwnerSpot = Other.m_OwnerSpot;
        this.m_OwnerRegistry = Other.m_OwnerRegistry;
        return Other.m_PlayerMarkDataMap;
    }
    void OnPlayerMarkDataMapChanged()
    {
        int local_4 = 0;
        int local_8 = 0;
        TEUIModelWeakRef<FM_Spot> local_2 = this.GetOwnerSpot();
        TEUIModelWeakRef<FM_SpotRegistry> local_6 = this.GetOwnerRegistry();
        if (!(!(local_4)) && local_8)
        {
            local_8.NotifySpotPresentationDataModifiedInternal(TEUIModelRef<FM_Spot>(local_4), EPresentationDataType(6));
        }
        return;
    }
    TEUIModelRef<FM_Player> GetLatestMarkPlayer() const
    {
        TEUIModelRef<FM_Player> local_2;
        FFPTime local_4;
        FFPTime local_26;
        for (auto& local_24 : this.GetPlayerMarkDataMap())
        {
            if (!(local_2) || (local_26.opCmp(local_4) > 0))
            {
                local_2 = local_24.GetKey();
            }
        }
        return local_2;
    }
    TEUIModelRef<FM_Player> GetDisplayMarkPlayer() const
    {
        TEUIModelRef<FM_Player> local_2 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetLocalPlayerData();
        if (this.GetPlayerMarkDataMap().Contains(local_2))
        {
            return local_2;
        }
        return this.GetLatestMarkPlayer();
    }
    bool IsMarkedByLocalPlayer() const
    {
        return this.GetPlayerMarkDataMap().Contains(::FMS_PlayerData::Get(this.GetContext().Manager).GetLocalPlayerData());
    }
    bool GetbIsPositionMark() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bIsPositionMark;
    }
    void SetbIsPositionMark(const bool __Value) property
    {
        if (!(this.m_bIsPositionMark) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bIsPositionMark = __Value;
        return;
    }
    TEUIModelWeakRef<FM_Spot> GetOwnerSpot() const property
    {
        this.TrackPropertyRead(1);
        return this.m_OwnerSpot;
    }
    void SetOwnerSpot(const TEUIModelWeakRef<FM_Spot> &inout __Value) property
    {
        TEUIModelWeakRef<FM_Spot> local_2;
        local_2 = this.m_OwnerSpot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_OwnerSpot = __Value;
        return;
    }
    TEUIModelWeakRef<FM_SpotRegistry> GetOwnerRegistry() const property
    {
        this.TrackPropertyRead(2);
        return this.m_OwnerRegistry;
    }
    void SetOwnerRegistry(const TEUIModelWeakRef<FM_SpotRegistry> &inout __Value) property
    {
        TEUIModelWeakRef<FM_SpotRegistry> local_2;
        local_2 = this.m_OwnerRegistry;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_OwnerRegistry = __Value;
        return;
    }
    const TMap<TEUIModelRef<FM_Player>, FPlayerMarkData> GetPlayerMarkDataMap() const property
    {
        const TMap<TEUIModelRef<FM_Player>, FPlayerMarkData> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<TEUIModelRef<FM_Player>, FPlayerMarkData> GetModify_PlayerMarkDataMap() property
    {
        TMap<TEUIModelRef<FM_Player>, FPlayerMarkData> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetPlayerMarkDataMap(const TMap<TEUIModelRef<FM_Player>, FPlayerMarkData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PlayerMarkDataMap = __Value;
        return;
    }
}

TEUIModelRef<FM_PresentationData_Mark> GetMarkData(const FM_Spot &inout Spot, const FSpotViewAdapter &inout View = FSpotViewAdapter())
{
    if (Spot)
    {
        if (FInstancedStruct(PresentationDataUtils::GetPresentationData(Spot, EPresentationDataType(6), View)).IsValid())
        {
            Get local_16;
            return TEUIModelRef<FM_PresentationData_Mark>(local_16.opCall());
        }
    }
    return TEUIModelRef<FM_PresentationData_Mark>();
}
TEUIModelRef<FM_PresentationData_Mark> AddMarkData(FM_Spot &inout Spot, const bool bIsPositionMark, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    int local_6 = 0;
    TEUIModelWeakRef<FM_Spot> local_4 = TEUIModelWeakRef<FM_Spot>(Spot);
    FEUIModelRef local_8 = FEUIModelRef(local_6);
    EPresentationDataType local_12;
    FInstancedStruct::Make(local_12);
    return TEUIModelRef<FM_PresentationData_Mark>(local_6);
}
void RemoveMarkData(FM_Spot &inout Spot, const TEUIModelRef<FM_SpotRegistry> &inout Registry = FEUIModelRef())
{
    if (Spot)
    {
        PresentationDataUtils::RemovePresentationData(Spot, EPresentationDataType(6), Registry);
    }
    return;
}
namespace FM_PresentationData_Mark
{
FM_PresentationData_Mark& Create(const UObject ContextObject, const bool bIsPositionMark, const TEUIModelWeakRef<FM_Spot> &inout OwnerSpot, const TEUIModelWeakRef<FM_SpotRegistry> &inout OwnerRegistry)
{
    return FM_PresentationData_Mark::CreateByManager(EUIInternal::GetContextManager(ContextObject), bIsPositionMark, OwnerSpot, OwnerRegistry);
}
FM_PresentationData_Mark CreateByManager(const UEUIManagerSubsystem Manager, const bool bIsPositionMark, const TEUIModelWeakRef<FM_Spot> &inout OwnerSpot, const TEUIModelWeakRef<FM_SpotRegistry> &inout OwnerRegistry)
{
    FM_PresentationData_Mark __r;
    TEUIModelRef<FM_PresentationData_Mark> local_6 = TEUIModelRef<FM_PresentationData_Mark>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_PresentationData_Mark::ModelId, 0, bIsPositionMark, OwnerSpot, OwnerRegistry));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    FEUIModelDirtyDefine local_12;
    local_12.FunctionName = "__OnPlayerMarkDataMapChanged";
    local_12.DirtyFlags.Set(FM_PresentationData_Mark::__IndexOf_PlayerMarkDataMap());
    Result.DirtyFunctions.Add(local_12);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_PresentationData_Mark;
}
void __OnPlayerMarkDataMapChanged(FM_PresentationData_Mark &inout Model)
{
    Model.OnPlayerMarkDataMapChanged();
    return;
}
int __IndexOf_bIsPositionMark()
{
    return 0;
}
int __IndexOf_OwnerSpot()
{
    return 1;
}
int __IndexOf_OwnerRegistry()
{
    return 2;
}
int __IndexOf_PlayerMarkDataMap()
{
    return 3;
}
}

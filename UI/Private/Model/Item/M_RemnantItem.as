
namespace FMS_RemnantItemModel
{
    const int ModelId = 0;

}
struct FMS_RemnantItemModel : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FMS_PlayerInventory> m_PlayerInventory;
    UPROPERTY()
    TEUIModelRef<FM_ItemData> m_RemnantItemData;

    FMS_RemnantItemModel()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_RemnantItemModel(const FMS_RemnantItemModel &inout Other)
    {
        this.m_PlayerInventory = Other.m_PlayerInventory;
        this.m_RemnantItemData = Other.m_RemnantItemData;
        return;
    }
    FMS_RemnantItemModel& opAssign(const FMS_RemnantItemModel &inout Other)
    {
        this.m_PlayerInventory = Other.m_PlayerInventory;
        return Other.m_RemnantItemData;
    }
    void PostConstruct()
    {
        this.SetPlayerInventory(TEUIModelRef<FMS_PlayerInventory>(::FMS_PlayerInventory::Get(this.GetContext().Manager)));
        return;
    }
    void BeginDestroy()
    {
        this.GetPlayerInventory().opArrow().UnregisterExternalItem(this.GetRemnantItemData());
        return;
    }
    void InvalidateEntityCache()
    {
        this.GetPlayerInventory().opArrow().UnregisterExternalItem(this.GetRemnantItemData());
        this.SetRemnantItemData(TEUIModelRef<FM_ItemData>(nullptr));
        return;
    }
    void OnRemnantInfoChanged(const FC_RemnantInfo &inout RemnantInfo)
    {
        this.SyncFromRemnantInfo(RemnantInfo);
        return;
    }
    void OnRemnantSlotChanged(const FCE_RemnantSlotChangedEvent &inout Event)
    {
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        this.SyncFromRemnantInfo(0);
        return;
    }
    TEUIModelRef<FM_ItemData> GetCurrentRemnantData() const
    {
        return this.GetRemnantItemData();
    }
    int GetRemnantItemNum() const
    {
        if (this.GetRemnantItemData().IsValid())
        {
            TEUIModelRef<FM_ItemData> local_2 = this.GetRemnantItemData();
            return GetNum();
        }
        return 0;
    }
    void SyncFromRemnantInfo(const FC_RemnantInfo &inout RemnantInfo)
    {
        if (!(!(RemnantInfo)) && RemnantInfo.GetRemnantItemConfig())
        {
            bool local_2;
            local_2 = !(this.GetRemnantItemData().IsValid());
            if (local_2)
            {
                local_2 = true;
            }
            else
            {
                FDataObjectPtr local_76;
                TDataObjectPtr<FItemConfig> local_28;
                local_28 = this.GetRemnantItemData().opArrow().GetConfig();
                local_76;
                local_2 = !((local_28 == local_76));
            }
            if (local_2)
            {
                if (this.GetRemnantItemData().IsValid())
                {
                    this.GetPlayerInventory().opArrow().UnregisterExternalItem(this.GetRemnantItemData());
                }
                FM_ItemData& local_80 = ::FM_ItemData::Create(this.GetContext().Manager);
                CastTo local_84;
                local_80.SetConfig(local_84.opCall());
                local_80.SetNum(RemnantInfo.GetRemainUsableCount());
                this.SetRemnantItemData(TEUIModelRef<FM_ItemData>(local_80));
                this.GetPlayerInventory().opArrow().RegisterExternalItem(this.GetRemnantItemData());
            }
            else
            {
                int local_85 = RemnantInfo.GetRemainUsableCount();
                TEUIModelRef<FM_ItemData> local_4 = this.GetRemnantItemData();
                local_85.SetNum();
            }
            return;
        }
        if (this.GetRemnantItemData().IsValid())
        {
            this.GetPlayerInventory().opArrow().UnregisterExternalItem(this.GetRemnantItemData());
            this.SetRemnantItemData(TEUIModelRef<FM_ItemData>(nullptr));
        }
        return;
    }
    TEUIModelRef<FMS_PlayerInventory> GetPlayerInventory() const property
    {
        this.TrackPropertyRead(0);
        return this.m_PlayerInventory;
    }
    void SetPlayerInventory(const TEUIModelRef<FMS_PlayerInventory> &inout __Value) property
    {
        TEUIModelRef<FMS_PlayerInventory> local_2;
        local_2 = this.m_PlayerInventory;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerInventory = __Value;
        return;
    }
    TEUIModelRef<FM_ItemData> GetRemnantItemData() const property
    {
        this.TrackPropertyRead(1);
        return this.m_RemnantItemData;
    }
    void SetRemnantItemData(const TEUIModelRef<FM_ItemData> &inout __Value) property
    {
        TEUIModelRef<FM_ItemData> local_2;
        local_2 = this.m_RemnantItemData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RemnantItemData = __Value;
        return;
    }
}

namespace FMS_RemnantItemModel
{
FMS_RemnantItemModel& Get(const UObject ContextObject)
{
    return FMS_RemnantItemModel::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_RemnantItemModel GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_RemnantItemModel __r;
    TEUIModelRef<FMS_RemnantItemModel> local_6 = TEUIModelRef<FMS_RemnantItemModel>(EUIInternal::MakeModelWithManager(Manager, FMS_RemnantItemModel::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnRemnantInfoChanged";
    local_14.ComponentType = FC_RemnantInfo;
    Result.MonitorFunctions.Add(local_14);
    FEUIModelEventDefine local_24;
    local_24.FunctionName = "__OnRemnantSlotChanged";
    local_24.EventType = FCE_RemnantSlotChangedEvent;
    Result.EventFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_RemnantItemModel;
}
void __OnRemnantInfoChanged(FMS_RemnantItemModel &inout Model, const FECSEntity &inout Entity, const FC_RemnantInfo &inout Component)
{
    Model.OnRemnantInfoChanged(Component);
    return;
}
void __OnRemnantSlotChanged(FMS_RemnantItemModel &inout Model, const FCE_RemnantSlotChangedEvent &inout Event)
{
    Model.OnRemnantSlotChanged(Event);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_PlayerInventory()
{
    return 0;
}
int __IndexOf_RemnantItemData()
{
    return 1;
}
}

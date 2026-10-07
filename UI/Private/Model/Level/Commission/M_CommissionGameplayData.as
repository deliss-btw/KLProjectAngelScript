
namespace FMS_CommissionGameplayData
{
    const int ModelId = 0;

}
struct FMS_CommissionGameplayData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_Commission> m_CurrentCommission;

    FMS_CommissionGameplayData()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_CommissionGameplayData(const FMS_CommissionGameplayData &inout Other)
    {
        this.m_CurrentCommission = Other.m_CurrentCommission;
        return;
    }
    FMS_CommissionGameplayData& opAssign(const FMS_CommissionGameplayData &inout Other)
    {
        return Other.m_CurrentCommission;
    }
    void OnCommissionInfoChanged(const FCS_CommissionInfo &inout C_CommissionInfo)
    {
        this.UpdateCurrnetCommissionInfo();
        return;
    }
    void OnCommissionDSGlobalInfoViewChanged(const FCS_CommissionDSGlobalInfoView &inout C_CommissionDSGlobalInfoView)
    {
        this.UpdateCurrnetCommissionInfo();
        return;
    }
    void UpdateCurrnetCommissionInfo()
    {
        int local_6 = 0;
        int local_12 = 0;
        if (!(local_6))
        {
            this.SetCurrentCommission(TEUIModelRef<FM_Commission>());
            return;
        }
        bool local_13 = !(this.GetCurrentCommission());
        if (local_13)
        {
            local_13 = true;
        }
        else
        {
            FDataObjectPtr local_88;
            TDataObjectPtr<FCommissionConfig> local_40;
            local_40 = this.GetCurrentCommission().opArrow().GetCommissionConfig();
            local_88;
            local_13 = !((local_40 == local_88));
        }
        if (local_13)
        {
            this.SetCurrentCommission(TEUIModelRef<FM_Commission>(::FM_Commission::Create(this.GetContext().Manager)));
            this.GetCurrentCommission().opArrow().SetFromGameplayData(local_6, local_12);
        }
        return;
    }
    TEUIModelRef<FM_Commission> GetCurrentCommission() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CurrentCommission;
    }
    void SetCurrentCommission(const TEUIModelRef<FM_Commission> &inout __Value) property
    {
        TEUIModelRef<FM_Commission> local_2;
        local_2 = this.m_CurrentCommission;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentCommission = __Value;
        return;
    }
}

namespace FMS_CommissionGameplayData
{
FMS_CommissionGameplayData& Get(const UObject ContextObject)
{
    return FMS_CommissionGameplayData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_CommissionGameplayData GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_CommissionGameplayData __r;
    TEUIModelRef<FMS_CommissionGameplayData> local_6 = TEUIModelRef<FMS_CommissionGameplayData>(EUIInternal::MakeModelWithManager(Manager, FMS_CommissionGameplayData::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnCommissionInfoChanged";
    local_14.ComponentType = FCS_CommissionInfo;
    Result.MonitorFunctions.Add(local_14);
    local_14.FunctionName = "__OnCommissionDSGlobalInfoViewChanged";
    local_14.ComponentType = FCS_CommissionDSGlobalInfoView;
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_CommissionGameplayData;
}
void __OnCommissionInfoChanged(FMS_CommissionGameplayData &inout Model, const FECSEntity &inout Entity, const FCS_CommissionInfo &inout Component)
{
    Get local_4;
    Model.OnCommissionInfoChanged(local_4.opCall());
    return;
}
void __OnCommissionDSGlobalInfoViewChanged(FMS_CommissionGameplayData &inout Model, const FECSEntity &inout Entity, const FCS_CommissionDSGlobalInfoView &inout Component)
{
    Get local_4;
    Model.OnCommissionDSGlobalInfoViewChanged(local_4.opCall());
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_CurrentCommission()
{
    return 0;
}
}

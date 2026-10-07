
namespace FMS_CommissionModelFactory
{
    const int ModelId = 0;

}
struct FMS_CommissionModelFactory : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_CommissionPopup> m_CommissionPopup;

    FMS_CommissionModelFactory()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_CommissionModelFactory(const FMS_CommissionModelFactory &inout Other)
    {
        this.m_CommissionPopup = Other.m_CommissionPopup;
        return;
    }
    FMS_CommissionModelFactory& opAssign(const FMS_CommissionModelFactory &inout Other)
    {
        return Other.m_CommissionPopup;
    }
    void OnCommissionInfoChanged(const FCS_CommissionInfo &inout C_CommissionInfo)
    {
        if (C_CommissionInfo)
        {
            this.CreateCommissionModels();
        }
        return;
    }
    void CreateCommissionModels()
    {
        if (!(this.GetCommissionPopup()))
        {
            this.SetCommissionPopup(TEUIModelRef<FM_CommissionPopup>(::FM_CommissionPopup::Create(this.GetContext().Manager)));
        }
        return;
    }
    TEUIModelRef<FM_CommissionPopup> GetCommissionPopup() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CommissionPopup;
    }
    void SetCommissionPopup(const TEUIModelRef<FM_CommissionPopup> &inout __Value) property
    {
        TEUIModelRef<FM_CommissionPopup> local_2;
        local_2 = this.m_CommissionPopup;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommissionPopup = __Value;
        return;
    }
}

namespace FMS_CommissionModelFactory
{
FMS_CommissionModelFactory& Get(const UObject ContextObject)
{
    return FMS_CommissionModelFactory::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_CommissionModelFactory GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_CommissionModelFactory __r;
    TEUIModelRef<FMS_CommissionModelFactory> local_6 = TEUIModelRef<FMS_CommissionModelFactory>(EUIInternal::MakeModelWithManager(Manager, FMS_CommissionModelFactory::ModelId));
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
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_CommissionModelFactory;
}
void __OnCommissionInfoChanged(FMS_CommissionModelFactory &inout Model, const FECSEntity &inout Entity, const FCS_CommissionInfo &inout Component)
{
    Get local_4;
    Model.OnCommissionInfoChanged(local_4.opCall());
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_CommissionPopup()
{
    return 0;
}
}

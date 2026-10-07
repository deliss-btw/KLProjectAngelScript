
namespace FMS_Loading
{
    const int ModelId = 0;

}
struct FMS_Loading : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FM_Commission> m_Commission;

    FMS_Loading()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_Loading(const FMS_Loading &inout Other)
    {
        this.m_Commission = Other.m_Commission;
        return;
    }
    FMS_Loading& opAssign(const FMS_Loading &inout Other)
    {
        return Other.m_Commission;
    }
    float32 GetLoadingProgress() const
    {
        return 0.0f;
    }
    void ClearLoadingData()
    {
        this.SetCommission(TEUIModelRef<FM_Commission>());
        return;
    }
    void GS_OnCurCommissionDataNotify(const FPbCurCommissionDataNotify &inout Msg)
    {
        if (!(this.GetCommission()))
        {
            this.SetCommission(TEUIModelRef<FM_Commission>(::FM_Commission::Create(this.GetContext().Manager)));
        }
        this.GetCommission().opArrow().SetFromServerData(Msg.GetCurCommissionInfo(), true);
        return;
    }
    TEUIModelRef<FM_Commission> GetCommission() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Commission;
    }
    void SetCommission(const TEUIModelRef<FM_Commission> &inout __Value) property
    {
        TEUIModelRef<FM_Commission> local_2;
        local_2 = this.m_Commission;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Commission = __Value;
        return;
    }
}

namespace FMS_Loading
{
FMS_Loading& Get(const UObject ContextObject)
{
    return FMS_Loading::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_Loading GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_Loading __r;
    TEUIModelRef<FMS_Loading> local_6 = TEUIModelRef<FMS_Loading>(EUIInternal::MakeModelWithManager(Manager, FMS_Loading::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnCurCommissionDataNotify";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_Loading;
}
void __GS_OnCurCommissionDataNotify(FMS_Loading &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnCurCommissionDataNotify(FPbCurCommissionDataNotify::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_Commission()
{
    return 0;
}
}

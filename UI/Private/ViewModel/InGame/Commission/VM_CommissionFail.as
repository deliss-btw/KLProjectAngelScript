
namespace FVM_CommissionFail
{
    const int ModelId = 0;

}
struct FVM_CommissionFail : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_LeaveTime;

    FVM_CommissionFail()
    {
        this.m_LeaveTime = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionFail' by default constructor.");
        return;
    }
    FVM_CommissionFail(const FVM_CommissionFail &inout Other)
    {
        this.m_LeaveTime = 0.0f;
        this.m_LeaveTime = Other.m_LeaveTime;
        return;
    }
    FVM_CommissionFail(const float32 InLeaveTime)
    {
        this.m_LeaveTime = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetLeaveTime(InLeaveTime);
        return;
    }
    FVM_CommissionFail opAssign(const FVM_CommissionFail &inout Other)
    {
        FVM_CommissionFail __r;
        this.m_LeaveTime = Other.m_LeaveTime;
        return __r;
    }
    const float32 GetLeaveTime() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_LeaveTime() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetLeaveTime(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LeaveTime = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionFail
{
    UPROPERTY()
    TEUIModelRef<FVM_CommissionFail> Self;

    __GeneratedProperties_FVM_CommissionFail()
    {
        return;
    }
}

namespace FVM_CommissionFail
{
FVM_CommissionFail& Create(const UObject ContextObject, const float32 LeaveTime)
{
    return FVM_CommissionFail::CreateByManager(EUIInternal::GetContextManager(ContextObject), LeaveTime);
}
FVM_CommissionFail CreateByManager(const UEUIManagerSubsystem Manager, const float32 LeaveTime)
{
    FVM_CommissionFail __r;
    TEUIModelRef<FVM_CommissionFail> local_6 = TEUIModelRef<FVM_CommissionFail>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionFail::ModelId, 0, LeaveTime));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionFail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionFail;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionFail;
}
TEUIModelRef<FVM_CommissionFail> __UIGetter_Self(const FVM_CommissionFail &inout Model)
{
    return TEUIModelRef<FVM_CommissionFail>(Model);
}
int __IndexOf_LeaveTime()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_CommissionFail
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

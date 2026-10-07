
namespace FMS_GameServerStatus
{
    const int ModelId = 0;

}
struct FMS_GameServerStatus : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    uint m_EnterDsSource;
    UPROPERTY()
    bool m_bIsDsAllocating;

    FMS_GameServerStatus()
    {
        this.m_EnterDsSource = 0;
        this.m_bIsDsAllocating = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_GameServerStatus(const FMS_GameServerStatus &inout Other)
    {
        this.m_EnterDsSource = 0;
        this.m_bIsDsAllocating = false;
        this.m_EnterDsSource = int(Other.m_EnterDsSource);
        this.m_bIsDsAllocating = Other.m_bIsDsAllocating;
        return;
    }
    FMS_GameServerStatus opAssign(const FMS_GameServerStatus &inout Other)
    {
        FMS_GameServerStatus __r;
        this.m_EnterDsSource = int(Other.m_EnterDsSource);
        this.m_bIsDsAllocating = Other.m_bIsDsAllocating;
        return __r;
    }
    void GS_OnDsAllocatingNotify(const FPbDsAllocatingNotify &inout Notify)
    {
        this.SetEnterDsSource(Notify.GetEnterDsSource());
        this.SetbIsDsAllocating(Notify.GetIsStart());
        return;
    }
    uint GetEnterDsSource() const property
    {
        this.TrackPropertyRead(0);
        return this.m_EnterDsSource;
    }
    void SetEnterDsSource(const uint __Value) property
    {
        if (this.m_EnterDsSource == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EnterDsSource = __Value;
        return;
    }
    bool GetbIsDsAllocating() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsDsAllocating;
    }
    void SetbIsDsAllocating(const bool __Value) property
    {
        if (!(this.m_bIsDsAllocating) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsDsAllocating = __Value;
        return;
    }
}

namespace FMS_GameServerStatus
{
FMS_GameServerStatus& Get(const UObject ContextObject)
{
    return FMS_GameServerStatus::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_GameServerStatus GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_GameServerStatus __r;
    TEUIModelRef<FMS_GameServerStatus> local_6 = TEUIModelRef<FMS_GameServerStatus>(EUIInternal::MakeModelWithManager(Manager, FMS_GameServerStatus::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnDsAllocatingNotify";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_GameServerStatus;
}
void __GS_OnDsAllocatingNotify(FMS_GameServerStatus &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnDsAllocatingNotify(FPbDsAllocatingNotify::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_EnterDsSource()
{
    return 0;
}
int __IndexOf_bIsDsAllocating()
{
    return 1;
}
}

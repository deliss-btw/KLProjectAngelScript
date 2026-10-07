
namespace FVMS_LocalPlayerUid
{
    const int ModelId = 0;

}
struct FVMS_LocalPlayerUid : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    uint m_LocalPlayerUid;

    FVMS_LocalPlayerUid()
    {
        this.m_LocalPlayerUid = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_LocalPlayerUid(const FVMS_LocalPlayerUid &inout Other)
    {
        this.m_LocalPlayerUid = 0;
        this.m_LocalPlayerUid = int(Other.m_LocalPlayerUid);
        return;
    }
    FVMS_LocalPlayerUid opAssign(const FVMS_LocalPlayerUid &inout Other)
    {
        FVMS_LocalPlayerUid __r;
        this.m_LocalPlayerUid = int(Other.m_LocalPlayerUid);
        return __r;
    }
    void RefreshUid()
    {
        this.SetLocalPlayerUid(::FM_LocalPlayerLevel::GetByManager(this.GetManager()).GetLocalPlayerUid());
        return;
    }
    bool HasUid() const
    {
        int local_1 = this.GetLocalPlayerUid();
        return (local_1 != 0);
    }
    uint GetLocalPlayerUid() const property
    {
        this.TrackPropertyRead(0);
        return this.m_LocalPlayerUid;
    }
    void SetLocalPlayerUid(const uint __Value) property
    {
        if (this.m_LocalPlayerUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LocalPlayerUid = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_LocalPlayerUid
{
    UPROPERTY()
    bool HasUid;
    UPROPERTY()
    TEUIModelRef<FVMS_LocalPlayerUid> Self;


}

namespace FVMS_LocalPlayerUid
{
FVMS_LocalPlayerUid& Create(const UObject ContextObject)
{
    return FVMS_LocalPlayerUid::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_LocalPlayerUid CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_LocalPlayerUid __r;
    TEUIModelRef<FVMS_LocalPlayerUid> local_6 = TEUIModelRef<FVMS_LocalPlayerUid>(EUIInternal::MakeModelWithManager(Manager, FVMS_LocalPlayerUid::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "HasUid";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_LocalPlayerUid>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_LocalPlayerUid;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshUid";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_LocalPlayerUid;
}
bool __UIGetter_HasUid(const FVMS_LocalPlayerUid &inout Model)
{
    return Model.HasUid();
}
TEUIModelRef<FVMS_LocalPlayerUid> __UIGetter_Self(const FVMS_LocalPlayerUid &inout Model)
{
    return TEUIModelRef<FVMS_LocalPlayerUid>(Model);
}
int __IndexOf_LocalPlayerUid()
{
    return 0;
}
}
namespace __GeneratedProperties_FVMS_LocalPlayerUid
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

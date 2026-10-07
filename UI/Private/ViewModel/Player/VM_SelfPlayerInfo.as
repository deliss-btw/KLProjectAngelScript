
namespace FVMS_SelfPlayerInfo
{
    const int ModelId = 0;

}
struct FVMS_SelfPlayerInfo : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    int m_Nop;

    FVMS_SelfPlayerInfo()
    {
        this.m_Nop = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_SelfPlayerInfo(const FVMS_SelfPlayerInfo &inout Other)
    {
        this.m_Nop = 0;
        this.m_Nop = int(Other.m_Nop);
        return;
    }
    FVMS_SelfPlayerInfo opAssign(const FVMS_SelfPlayerInfo &inout Other)
    {
        FVMS_SelfPlayerInfo __r;
        this.m_Nop = int(Other.m_Nop);
        return __r;
    }
    FText GetSelfPlayerName() const
    {
        return ::FASCommonUtils::GetPlayerName(::FASCommonUtils::GetLocalUniquePlayerEntity());
    }
    int GetNop() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Nop;
    }
    void SetNop(const int __Value) property
    {
        if (this.m_Nop == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Nop = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_SelfPlayerInfo
{
    UPROPERTY()
    FText SelfPlayerName;
    UPROPERTY()
    TEUIModelRef<FVMS_SelfPlayerInfo> Self;

    __GeneratedProperties_FVMS_SelfPlayerInfo()
    {
        return;
    }
}

namespace FVMS_SelfPlayerInfo
{
FVMS_SelfPlayerInfo& Get(const UObject ContextObject)
{
    return FVMS_SelfPlayerInfo::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_SelfPlayerInfo GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_SelfPlayerInfo __r;
    TEUIModelRef<FVMS_SelfPlayerInfo> local_6 = TEUIModelRef<FVMS_SelfPlayerInfo>(EUIInternal::MakeModelWithManager(Manager, FVMS_SelfPlayerInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SelfPlayerName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_SelfPlayerInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_SelfPlayerInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_SelfPlayerInfo;
}
FText __UIGetter_SelfPlayerName(const FVMS_SelfPlayerInfo &inout Model)
{
    return Model.GetSelfPlayerName();
}
TEUIModelRef<FVMS_SelfPlayerInfo> __UIGetter_Self(const FVMS_SelfPlayerInfo &inout Model)
{
    return TEUIModelRef<FVMS_SelfPlayerInfo>(Model);
}
int __IndexOf_Nop()
{
    return 0;
}
}
namespace __GeneratedProperties_FVMS_SelfPlayerInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

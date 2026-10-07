
namespace FVM_PVX_MainAvatar_PlayerComp
{
    const int ModelId = 0;

}
struct FVM_PVX_MainAvatar_PlayerComp : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Name;
    UPROPERTY()
    bool m_bSelf;
    UPROPERTY()
    bool m_bReady;

    FVM_PVX_MainAvatar_PlayerComp()
    {
        this.m_bSelf = false;
        this.m_bReady = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PVX_MainAvatar_PlayerComp' by default constructor.");
        return;
    }
    FVM_PVX_MainAvatar_PlayerComp(const FVM_PVX_MainAvatar_PlayerComp &inout Other)
    {
        this.m_bSelf = false;
        this.m_bReady = false;
        this.m_Name = Other.m_Name;
        this.m_bSelf = Other.m_bSelf;
        this.m_bReady = Other.m_bReady;
        return;
    }
    FVM_PVX_MainAvatar_PlayerComp(const FText &inout InName, const bool InbSelf)
    {
        this.m_bSelf = false;
        this.m_bReady = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetName(InName);
        this.SetbSelf(InbSelf);
        return;
    }
    FVM_PVX_MainAvatar_PlayerComp opAssign(const FVM_PVX_MainAvatar_PlayerComp &inout Other)
    {
        FVM_PVX_MainAvatar_PlayerComp __r;
        this.m_Name = Other.m_Name;
        this.m_bSelf = Other.m_bSelf;
        this.m_bReady = Other.m_bReady;
        return __r;
    }
    void PostConstruct()
    {
        return;
    }
    FText GetName() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_Name() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Name = __Value;
        return;
    }
    bool GetbSelf() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bSelf;
    }
    void SetbSelf(const bool __Value) property
    {
        if (!(this.m_bSelf) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bSelf = __Value;
        return;
    }
    bool GetbReady() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bReady;
    }
    void SetbReady(const bool __Value) property
    {
        if (!(this.m_bReady) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bReady = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PVX_MainAvatar_PlayerComp
{
    UPROPERTY()
    TEUIModelRef<FVM_PVX_MainAvatar_PlayerComp> Self;

    __GeneratedProperties_FVM_PVX_MainAvatar_PlayerComp()
    {
        return;
    }
}

namespace FVM_PVX_MainAvatar_PlayerComp
{
FVM_PVX_MainAvatar_PlayerComp& Create(const UObject ContextObject, const FText &inout Name, const bool bSelf)
{
    return FVM_PVX_MainAvatar_PlayerComp::CreateByManager(EUIInternal::GetContextManager(ContextObject), Name, bSelf);
}
FVM_PVX_MainAvatar_PlayerComp CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout Name, const bool bSelf)
{
    FVM_PVX_MainAvatar_PlayerComp __r;
    TEUIModelRef<FVM_PVX_MainAvatar_PlayerComp> local_6 = TEUIModelRef<FVM_PVX_MainAvatar_PlayerComp>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PVX_MainAvatar_PlayerComp::ModelId, 0, Name, bSelf));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Name";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bSelf";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bReady";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PVX_MainAvatar_PlayerComp>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PVX_MainAvatar_PlayerComp;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PVX_MainAvatar_PlayerComp;
}
FText __UIGetter_Name(const FVM_PVX_MainAvatar_PlayerComp &inout Model)
{
    return Model.GetName();
}
bool __UIGetter_bSelf(const FVM_PVX_MainAvatar_PlayerComp &inout Model)
{
    return Model.GetbSelf();
}
bool __UIGetter_bReady(const FVM_PVX_MainAvatar_PlayerComp &inout Model)
{
    return Model.GetbReady();
}
TEUIModelRef<FVM_PVX_MainAvatar_PlayerComp> __UIGetter_Self(const FVM_PVX_MainAvatar_PlayerComp &inout Model)
{
    return TEUIModelRef<FVM_PVX_MainAvatar_PlayerComp>(Model);
}
int __IndexOf_Name()
{
    return 0;
}
int __IndexOf_bSelf()
{
    return 1;
}
int __IndexOf_bReady()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_PVX_MainAvatar_PlayerComp
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

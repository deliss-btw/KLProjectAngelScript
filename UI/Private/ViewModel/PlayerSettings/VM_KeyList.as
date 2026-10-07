
namespace FVM_KeyList
{
    const int ModelId = 0;

}
struct FVM_KeyList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<FEUIModelContainer> m_Keys;
    UPROPERTY()
    FText m_ActionName;

    FVM_KeyList()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_KeyList(const FVM_KeyList &inout Other)
    {
        this.m_Keys = Other.m_Keys;
        this.m_ActionName = Other.m_ActionName;
        return;
    }
    FVM_KeyList& opAssign(const FVM_KeyList &inout Other)
    {
        this.m_Keys = Other.m_Keys;
        return Other.m_ActionName;
    }
    TArray<FEUIModelContainer> GetKeys() const property
    {
        TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_Keys() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetKeys(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Keys = __Value;
        return;
    }
    const FText GetActionName() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_ActionName() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetActionName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ActionName = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_KeyList
{
    UPROPERTY()
    TEUIModelRef<FVM_KeyList> Self;

    __GeneratedProperties_FVM_KeyList()
    {
        return;
    }
}

namespace FVM_KeyList
{
FVM_KeyList& Create(const UObject ContextObject)
{
    return FVM_KeyList::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_KeyList CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_KeyList __r;
    TEUIModelRef<FVM_KeyList> local_6 = TEUIModelRef<FVM_KeyList>(EUIInternal::MakeModelWithManager(Manager, FVM_KeyList::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Keys";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ActionName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_KeyList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_KeyList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_KeyList;
}
TArray<FEUIModelContainer> __UIGetter_Keys(const FVM_KeyList &inout Model)
{
    return Model.GetKeys();
}
FText __UIGetter_ActionName(const FVM_KeyList &inout Model)
{
    return Model.GetActionName();
}
TEUIModelRef<FVM_KeyList> __UIGetter_Self(const FVM_KeyList &inout Model)
{
    return TEUIModelRef<FVM_KeyList>(Model);
}
int __IndexOf_Keys()
{
    return 0;
}
int __IndexOf_ActionName()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_KeyList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

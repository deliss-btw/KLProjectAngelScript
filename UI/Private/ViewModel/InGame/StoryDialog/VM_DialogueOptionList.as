
namespace FVM_DialogueOptionList
{
    const int ModelId = 0;

}
struct FVM_DialogueOptionList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_DialogueOptionItem>> m_OptionItems;

    FVM_DialogueOptionList()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_DialogueOptionList(const FVM_DialogueOptionList &inout Other)
    {
        this.m_OptionItems = Other.m_OptionItems;
        return;
    }
    FVM_DialogueOptionList& opAssign(const FVM_DialogueOptionList &inout Other)
    {
        return Other.m_OptionItems;
    }
    bool HasOptionItems() const
    {
        return (this.GetOptionItems().Num() > 0);
    }
    const TArray<TEUIModelRef<FVM_DialogueOptionItem>> GetOptionItems() const property
    {
        const TArray<TEUIModelRef<FVM_DialogueOptionItem>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_DialogueOptionItem>> GetModify_OptionItems() property
    {
        TArray<TEUIModelRef<FVM_DialogueOptionItem>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetOptionItems(const TArray<TEUIModelRef<FVM_DialogueOptionItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_OptionItems = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_DialogueOptionList
{
    UPROPERTY()
    bool HasOptionItems;
    UPROPERTY()
    TEUIModelRef<FVM_DialogueOptionList> Self;


}

namespace FVM_DialogueOptionList
{
FVM_DialogueOptionList& Create(const UObject ContextObject)
{
    return FVM_DialogueOptionList::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_DialogueOptionList CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_DialogueOptionList __r;
    TEUIModelRef<FVM_DialogueOptionList> local_6 = TEUIModelRef<FVM_DialogueOptionList>(EUIInternal::MakeModelWithManager(Manager, FVM_DialogueOptionList::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "OptionItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_DialogueOptionItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasOptionItems";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_DialogueOptionList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_DialogueOptionList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_DialogueOptionList;
}
TArray<TEUIModelRef<FVM_DialogueOptionItem>> __UIGetter_OptionItems(const FVM_DialogueOptionList &inout Model)
{
    return Model.GetOptionItems();
}
bool __UIGetter_HasOptionItems(const FVM_DialogueOptionList &inout Model)
{
    return Model.HasOptionItems();
}
TEUIModelRef<FVM_DialogueOptionList> __UIGetter_Self(const FVM_DialogueOptionList &inout Model)
{
    return TEUIModelRef<FVM_DialogueOptionList>(Model);
}
int __IndexOf_OptionItems()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_DialogueOptionList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

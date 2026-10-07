

struct FConfigVM_ItemCraft : FConfigEUIModelBase
{
    UPROPERTY()
    TArray<ECraftType> CraftTypes;

    FConfigVM_ItemCraft()
    {
        return;
    }
}

struct FCraftableItemSelected : FEUIModelDelegate
{
    FEUIModelDelegate _base_FEUIModelDelegate;

    FCraftableItemSelected()
    {
        FEUIModelDelegate local_26 = FEUIModelDelegate("bool", "FEUIModelRef");
        return;
    }
    bool Execute(const FEUIModelRef &inout Arg0) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().Execute(Arg0);
    }
    bool ExecuteIfBound(const FEUIModelRef &inout Arg0, bool &inout OutResult) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().ExecuteIfBound(Arg0, OutResult);
    }
}

namespace __FVM_CraftableItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CraftableItem> __ModelContainer_Require_FVM_CraftableItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CraftableItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CraftableItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CraftableItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CraftableItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CraftableItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_ItemCraft_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemCraft> __ModelContainer_Require_FVM_ItemCraft(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemCraft>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemCraft(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemCraft>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemCraft>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemCraft>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

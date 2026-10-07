

struct FItemSelected : FEUIModelDelegate
{
    FEUIModelDelegate _base_FEUIModelDelegate;

    FItemSelected()
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

namespace __FVM_Item_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Item> __ModelContainer_Require_FVM_Item(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Item>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Item(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Item>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Item>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Item>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_ItemIconAdapter_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemIconAdapter> __ModelContainer_Require_FVM_ItemIconAdapter(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemIconAdapter>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemIconAdapter(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemIconAdapter>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemIconAdapter>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemIconAdapter>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

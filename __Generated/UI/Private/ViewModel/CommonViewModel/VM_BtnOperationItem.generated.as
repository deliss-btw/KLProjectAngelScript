
namespace __FVM_BtnOperationItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BtnOperationItem> __ModelContainer_Require_FVM_BtnOperationItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BtnOperationItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BtnOperationItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BtnOperationItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BtnOperationItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BtnOperationItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

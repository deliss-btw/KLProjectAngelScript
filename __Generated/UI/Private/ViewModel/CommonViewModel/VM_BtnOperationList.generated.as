
namespace __FVM_BtnOperationList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BtnOperationList> __ModelContainer_Require_FVM_BtnOperationList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BtnOperationList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BtnOperationList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BtnOperationList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BtnOperationList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BtnOperationList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

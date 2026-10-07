
namespace __FVM_TeamOperatorBtnItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TeamOperatorBtnItem> __ModelContainer_Require_FVM_TeamOperatorBtnItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TeamOperatorBtnItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TeamOperatorBtnItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TeamOperatorBtnItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TeamOperatorBtnItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TeamOperatorBtnItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

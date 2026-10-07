
namespace __FVM_CommonRewardDialog_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonRewardDialog> __ModelContainer_Require_FVM_CommonRewardDialog(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonRewardDialog>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonRewardDialog(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonRewardDialog>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonRewardDialog>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonRewardDialog>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

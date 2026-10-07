
namespace __FVM_TrainingItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TrainingItem> __ModelContainer_Require_FVM_TrainingItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TrainingItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TrainingItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TrainingItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TrainingItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TrainingItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

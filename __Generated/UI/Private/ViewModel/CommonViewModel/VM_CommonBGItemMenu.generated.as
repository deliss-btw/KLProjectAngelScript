
namespace __FVM_CommonBGItemMenu_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonBGItemMenu> __ModelContainer_Require_FVM_CommonBGItemMenu(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonBGItemMenu>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonBGItemMenu(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonBGItemMenu>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonBGItemMenu>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonBGItemMenu>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

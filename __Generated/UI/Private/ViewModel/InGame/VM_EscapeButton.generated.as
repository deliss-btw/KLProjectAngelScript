
namespace __FVM_EscapeButton_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_EscapeButton> __ModelContainer_Require_FVM_EscapeButton(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_EscapeButton>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_EscapeButton(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_EscapeButton>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_EscapeButton>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_EscapeButton>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

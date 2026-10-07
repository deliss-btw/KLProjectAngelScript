
namespace __FVM_TimeOfDay_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TimeOfDay> __ModelContainer_Require_FVM_TimeOfDay(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TimeOfDay>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TimeOfDay(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TimeOfDay>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TimeOfDay>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TimeOfDay>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

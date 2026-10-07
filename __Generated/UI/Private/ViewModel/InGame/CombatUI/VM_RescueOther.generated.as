
namespace __FVM_RevivalTimeProgressBar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_RevivalTimeProgressBar> __ModelContainer_Require_FVM_RevivalTimeProgressBar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_RevivalTimeProgressBar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_RevivalTimeProgressBar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_RevivalTimeProgressBar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_RevivalTimeProgressBar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_RevivalTimeProgressBar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_RescueOther_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_RescueOther> __ModelContainer_Require_FVM_RescueOther(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_RescueOther>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_RescueOther(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_RescueOther>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_RescueOther>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_RescueOther>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

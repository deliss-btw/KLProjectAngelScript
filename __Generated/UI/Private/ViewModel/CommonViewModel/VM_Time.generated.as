
namespace __FVM_Lifetime_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Lifetime> __ModelContainer_Require_FVM_Lifetime(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Lifetime>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Lifetime(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Lifetime>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Lifetime>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Lifetime>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_FPTime_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_FPTime> __ModelContainer_Require_FVM_FPTime(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_FPTime>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_FPTime(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_FPTime>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_FPTime>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_FPTime>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

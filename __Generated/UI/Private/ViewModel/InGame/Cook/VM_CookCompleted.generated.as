
namespace __FVM_CookBuffInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CookBuffInfo> __ModelContainer_Require_FVM_CookBuffInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CookBuffInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CookBuffInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CookBuffInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CookBuffInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CookBuffInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CookCompleted_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CookCompleted> __ModelContainer_Require_FVM_CookCompleted(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CookCompleted>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CookCompleted(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CookCompleted>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CookCompleted>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CookCompleted>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

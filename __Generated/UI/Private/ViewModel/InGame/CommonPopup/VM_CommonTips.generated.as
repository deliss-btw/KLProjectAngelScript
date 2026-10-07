
namespace __FVM_CommonTips_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonTips> __ModelContainer_Require_FVM_CommonTips(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonTips>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonTips(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonTips>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonTips>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonTips>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_ImportantTips_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ImportantTips> __ModelContainer_Require_FVM_ImportantTips(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ImportantTips>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ImportantTips(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ImportantTips>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ImportantTips>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ImportantTips>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

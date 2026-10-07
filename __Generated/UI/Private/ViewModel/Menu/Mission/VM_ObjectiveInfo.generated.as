
namespace __FVM_ObjectiveInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ObjectiveInfo> __ModelContainer_Require_FVM_ObjectiveInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ObjectiveInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ObjectiveInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ObjectiveInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ObjectiveInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ObjectiveInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

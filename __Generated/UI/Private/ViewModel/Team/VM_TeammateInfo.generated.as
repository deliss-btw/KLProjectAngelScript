
namespace __FVM_TeammateInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TeammateInfo> __ModelContainer_Require_FVM_TeammateInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TeammateInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TeammateInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TeammateInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TeammateInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TeammateInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

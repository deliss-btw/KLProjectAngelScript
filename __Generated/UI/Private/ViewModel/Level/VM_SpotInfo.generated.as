
namespace __FVM_SpotInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SpotInfo> __ModelContainer_Require_FVM_SpotInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SpotInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SpotInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SpotInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SpotInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SpotInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

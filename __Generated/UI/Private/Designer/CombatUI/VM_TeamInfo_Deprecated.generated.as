
namespace __FVM_TeamInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TeamInfo> __ModelContainer_Require_FVM_TeamInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TeamInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TeamInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TeamInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TeamInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TeamInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}


namespace __FVM_MissionList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MissionList> __ModelContainer_Require_FVM_MissionList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MissionList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MissionList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MissionList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MissionList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MissionList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}


namespace __FVM_MissionDetailInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MissionDetailInfo> __ModelContainer_Require_FVM_MissionDetailInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MissionDetailInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MissionDetailInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MissionDetailInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MissionDetailInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MissionDetailInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

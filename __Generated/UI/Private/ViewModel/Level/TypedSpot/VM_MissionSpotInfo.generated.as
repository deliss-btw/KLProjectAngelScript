
namespace __FVM_MissionSpotInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MissionSpotInfo> __ModelContainer_Require_FVM_MissionSpotInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MissionSpotInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MissionSpotInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MissionSpotInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MissionSpotInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MissionSpotInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

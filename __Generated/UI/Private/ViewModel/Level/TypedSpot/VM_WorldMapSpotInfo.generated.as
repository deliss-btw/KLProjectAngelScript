
namespace __FVM_WorldMapSpotInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_WorldMapSpotInfo> __ModelContainer_Require_FVM_WorldMapSpotInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_WorldMapSpotInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_WorldMapSpotInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_WorldMapSpotInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_WorldMapSpotInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_WorldMapSpotInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

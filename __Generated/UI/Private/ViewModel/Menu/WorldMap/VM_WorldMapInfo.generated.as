

struct FConfigVM_WorldMapInfo : FConfigEUIModelBase
{
    UPROPERTY()
    bool bIsModeEntrance = false;
    UPROPERTY()
    TDataObjectPtr<FMapConfig> MapConfig;


}

namespace __FVM_WorldMapInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_WorldMapInfo> __ModelContainer_Require_FVM_WorldMapInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_WorldMapInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_WorldMapInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_WorldMapInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_WorldMapInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_WorldMapInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

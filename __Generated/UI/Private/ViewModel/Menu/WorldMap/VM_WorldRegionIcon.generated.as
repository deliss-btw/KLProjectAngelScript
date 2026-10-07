

struct FConfigVM_WorldRegionIcon : FConfigEUIModelBase
{
    UPROPERTY()
    bool bIsModeEntrance = false;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> LevelInfoConfig;


}

namespace __FVM_WorldRegionIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_WorldRegionIcon> __ModelContainer_Require_FVM_WorldRegionIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_WorldRegionIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_WorldRegionIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_WorldRegionIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_WorldRegionIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_WorldRegionIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

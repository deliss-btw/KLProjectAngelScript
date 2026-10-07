
namespace __FVM_MissionMinimapIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MissionMinimapIcon> __ModelContainer_Require_FVM_MissionMinimapIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MissionMinimapIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MissionMinimapIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MissionMinimapIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MissionMinimapIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MissionMinimapIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

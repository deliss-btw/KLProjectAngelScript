
namespace __FVM_MissionListEntry_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MissionListEntry> __ModelContainer_Require_FVM_MissionListEntry(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MissionListEntry>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MissionListEntry(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MissionListEntry>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MissionListEntry>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MissionListEntry>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

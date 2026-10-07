
namespace __FVM_MissionTabEntry_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MissionTabEntry> __ModelContainer_Require_FVM_MissionTabEntry(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MissionTabEntry>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MissionTabEntry(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MissionTabEntry>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MissionTabEntry>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MissionTabEntry>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

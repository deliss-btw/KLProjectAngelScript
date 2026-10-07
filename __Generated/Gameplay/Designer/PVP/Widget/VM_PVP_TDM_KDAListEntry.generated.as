
namespace __FVM_PVP_TDM_KDAListEntry_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PVP_TDM_KDAListEntry> __ModelContainer_Require_FVM_PVP_TDM_KDAListEntry(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PVP_TDM_KDAListEntry>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PVP_TDM_KDAListEntry(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PVP_TDM_KDAListEntry>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PVP_TDM_KDAListEntry>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PVP_TDM_KDAListEntry>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

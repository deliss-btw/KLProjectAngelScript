
namespace __FVM_PVX_Settlement_PhasePerformance_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PVX_Settlement_PhasePerformance> __ModelContainer_Require_FVM_PVX_Settlement_PhasePerformance(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PVX_Settlement_PhasePerformance>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PVX_Settlement_PhasePerformance(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PVX_Settlement_PhasePerformance>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PVX_Settlement_PhasePerformance>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PVX_Settlement_PhasePerformance>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

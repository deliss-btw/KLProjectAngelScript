
namespace __FVM_PVX_Settlement_PhaseResult_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PVX_Settlement_PhaseResult> __ModelContainer_Require_FVM_PVX_Settlement_PhaseResult(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PVX_Settlement_PhaseResult>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PVX_Settlement_PhaseResult(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PVX_Settlement_PhaseResult>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PVX_Settlement_PhaseResult>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PVX_Settlement_PhaseResult>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

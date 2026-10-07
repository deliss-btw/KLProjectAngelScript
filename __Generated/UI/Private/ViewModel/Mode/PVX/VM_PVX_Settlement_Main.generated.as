
namespace __FVM_PVX_Settlement_Main_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PVX_Settlement_Main> __ModelContainer_Require_FVM_PVX_Settlement_Main(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PVX_Settlement_Main>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PVX_Settlement_Main(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PVX_Settlement_Main>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PVX_Settlement_Main>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PVX_Settlement_Main>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

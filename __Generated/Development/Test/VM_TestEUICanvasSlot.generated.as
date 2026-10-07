
namespace __FVM_TestEUICanvasSlot_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TestEUICanvasSlot> __ModelContainer_Require_FVM_TestEUICanvasSlot(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TestEUICanvasSlot>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TestEUICanvasSlot(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TestEUICanvasSlot>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TestEUICanvasSlot>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TestEUICanvasSlot>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

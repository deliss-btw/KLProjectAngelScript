
namespace __FVM_MotionTab_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MotionTab> __ModelContainer_Require_FVM_MotionTab(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MotionTab>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MotionTab(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MotionTab>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MotionTab>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MotionTab>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

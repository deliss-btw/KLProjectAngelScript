
namespace __FVM_ArmWrestle_Progress_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ArmWrestle_Progress> __ModelContainer_Require_FVM_ArmWrestle_Progress(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ArmWrestle_Progress>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ArmWrestle_Progress(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ArmWrestle_Progress>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ArmWrestle_Progress>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ArmWrestle_Progress>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

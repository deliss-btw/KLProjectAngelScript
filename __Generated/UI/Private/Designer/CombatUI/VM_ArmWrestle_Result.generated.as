
namespace __FVM_ArmWrestle_Result_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ArmWrestle_Result> __ModelContainer_Require_FVM_ArmWrestle_Result(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ArmWrestle_Result>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ArmWrestle_Result(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ArmWrestle_Result>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ArmWrestle_Result>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ArmWrestle_Result>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

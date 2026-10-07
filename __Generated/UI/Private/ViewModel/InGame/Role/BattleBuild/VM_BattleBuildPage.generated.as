
namespace __FVMS_BattleBuildPage_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_BattleBuildPage> __ModelContainer_Require_FVMS_BattleBuildPage(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_BattleBuildPage>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_BattleBuildPage(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_BattleBuildPage>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_BattleBuildPage>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_BattleBuildPage>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

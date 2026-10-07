
namespace __FVMS_ExitLevel_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_ExitLevel> __ModelContainer_Require_FVMS_ExitLevel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_ExitLevel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_ExitLevel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_ExitLevel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_ExitLevel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_ExitLevel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

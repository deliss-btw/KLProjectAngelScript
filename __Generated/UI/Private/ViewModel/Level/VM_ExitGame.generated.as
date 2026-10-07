
namespace __FVMS_ExitGame_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_ExitGame> __ModelContainer_Require_FVMS_ExitGame(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_ExitGame>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_ExitGame(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_ExitGame>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_ExitGame>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_ExitGame>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}


namespace __FVMS_GameMode_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_GameMode> __ModelContainer_Require_FVMS_GameMode(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_GameMode>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_GameMode(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_GameMode>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_GameMode>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_GameMode>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

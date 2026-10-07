
namespace __FVMS_DynamicHUDManager_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_DynamicHUDManager> __ModelContainer_Require_FVMS_DynamicHUDManager(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_DynamicHUDManager>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_DynamicHUDManager(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_DynamicHUDManager>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_DynamicHUDManager>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_DynamicHUDManager>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

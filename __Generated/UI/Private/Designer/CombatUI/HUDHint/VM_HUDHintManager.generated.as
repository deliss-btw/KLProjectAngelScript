
namespace __FVMS_HUDHintManager_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_HUDHintManager> __ModelContainer_Require_FVMS_HUDHintManager(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_HUDHintManager>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_HUDHintManager(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_HUDHintManager>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_HUDHintManager>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_HUDHintManager>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

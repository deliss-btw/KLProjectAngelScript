
namespace __FVMS_ChatMain_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_ChatMain> __ModelContainer_Require_FVMS_ChatMain(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_ChatMain>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_ChatMain(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_ChatMain>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_ChatMain>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_ChatMain>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}


namespace __FVMS_DialogueMain_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_DialogueMain> __ModelContainer_Require_FVMS_DialogueMain(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_DialogueMain>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_DialogueMain(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_DialogueMain>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_DialogueMain>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_DialogueMain>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

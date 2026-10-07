
namespace __FVMS_ChangeName_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_ChangeName> __ModelContainer_Require_FVMS_ChangeName(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_ChangeName>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_ChangeName(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_ChangeName>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_ChangeName>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_ChangeName>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

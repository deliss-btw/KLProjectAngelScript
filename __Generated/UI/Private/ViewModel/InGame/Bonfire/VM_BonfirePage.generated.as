
namespace __FVMS_BonfirePage_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_BonfirePage> __ModelContainer_Require_FVMS_BonfirePage(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_BonfirePage>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_BonfirePage(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_BonfirePage>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_BonfirePage>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_BonfirePage>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

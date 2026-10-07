
namespace __FVMS_GameEntry_PVX_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_GameEntry_PVX> __ModelContainer_Require_FVMS_GameEntry_PVX(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_GameEntry_PVX>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_GameEntry_PVX(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_GameEntry_PVX>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_GameEntry_PVX>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_GameEntry_PVX>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

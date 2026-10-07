
namespace __FVMS_PVX_MainHUD_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_PVX_MainHUD> __ModelContainer_Require_FVMS_PVX_MainHUD(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_PVX_MainHUD>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_PVX_MainHUD(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_PVX_MainHUD>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_PVX_MainHUD>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_PVX_MainHUD>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

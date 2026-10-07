
namespace __FVMS_PVP_TDM_HUD_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_PVP_TDM_HUD> __ModelContainer_Require_FVMS_PVP_TDM_HUD(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_PVP_TDM_HUD>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_PVP_TDM_HUD(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_PVP_TDM_HUD>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_PVP_TDM_HUD>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_PVP_TDM_HUD>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

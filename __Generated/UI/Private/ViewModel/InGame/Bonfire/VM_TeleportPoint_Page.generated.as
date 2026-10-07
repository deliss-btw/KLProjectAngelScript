
namespace __FVMS_TeleportPoint_Page_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_TeleportPoint_Page> __ModelContainer_Require_FVMS_TeleportPoint_Page(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_TeleportPoint_Page>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_TeleportPoint_Page(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_TeleportPoint_Page>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_TeleportPoint_Page>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_TeleportPoint_Page>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

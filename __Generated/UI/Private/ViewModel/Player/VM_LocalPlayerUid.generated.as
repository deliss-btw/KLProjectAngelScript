
namespace __FVMS_LocalPlayerUid_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_LocalPlayerUid> __ModelContainer_Require_FVMS_LocalPlayerUid(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_LocalPlayerUid>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_LocalPlayerUid(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_LocalPlayerUid>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_LocalPlayerUid>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_LocalPlayerUid>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

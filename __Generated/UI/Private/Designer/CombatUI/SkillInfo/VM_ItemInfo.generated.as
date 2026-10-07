
namespace __FVMS_ItemInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_ItemInfo> __ModelContainer_Require_FVMS_ItemInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_ItemInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_ItemInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_ItemInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_ItemInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_ItemInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

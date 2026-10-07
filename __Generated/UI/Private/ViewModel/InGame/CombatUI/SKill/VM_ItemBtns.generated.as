
namespace __FVMS_ItemBtns_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_ItemBtns> __ModelContainer_Require_FVMS_ItemBtns(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_ItemBtns>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_ItemBtns(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_ItemBtns>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_ItemBtns>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_ItemBtns>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

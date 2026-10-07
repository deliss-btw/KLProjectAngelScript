
namespace __FVM_DropPreviewItemMeta_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_DropPreviewItemMeta> __ModelContainer_Require_FVM_DropPreviewItemMeta(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_DropPreviewItemMeta>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_DropPreviewItemMeta(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_DropPreviewItemMeta>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_DropPreviewItemMeta>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_DropPreviewItemMeta>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_DropPreview_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_DropPreview> __ModelContainer_Require_FVM_DropPreview(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_DropPreview>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_DropPreview(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_DropPreview>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_DropPreview>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_DropPreview>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

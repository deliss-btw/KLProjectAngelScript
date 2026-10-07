
namespace __FVM_AvatarAttributeItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarAttributeItem> __ModelContainer_Require_FVM_AvatarAttributeItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarAttributeItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarAttributeItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarAttributeItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarAttributeItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarAttributeItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

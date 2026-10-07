
namespace __FVM_SocialMotionItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SocialMotionItem> __ModelContainer_Require_FVM_SocialMotionItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SocialMotionItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SocialMotionItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SocialMotionItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SocialMotionItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SocialMotionItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

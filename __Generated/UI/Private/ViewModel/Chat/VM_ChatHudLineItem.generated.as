
namespace __FVM_ChatHudLineItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ChatHudLineItem> __ModelContainer_Require_FVM_ChatHudLineItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ChatHudLineItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ChatHudLineItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ChatHudLineItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ChatHudLineItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ChatHudLineItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

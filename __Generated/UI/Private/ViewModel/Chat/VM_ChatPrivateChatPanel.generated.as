
namespace __FVM_ChatPrivateChatPanel_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ChatPrivateChatPanel> __ModelContainer_Require_FVM_ChatPrivateChatPanel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ChatPrivateChatPanel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ChatPrivateChatPanel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ChatPrivateChatPanel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ChatPrivateChatPanel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ChatPrivateChatPanel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

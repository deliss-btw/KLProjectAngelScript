
namespace __FVM_ChatChannelPanel_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ChatChannelPanel> __ModelContainer_Require_FVM_ChatChannelPanel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ChatChannelPanel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ChatChannelPanel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ChatChannelPanel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ChatChannelPanel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ChatChannelPanel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

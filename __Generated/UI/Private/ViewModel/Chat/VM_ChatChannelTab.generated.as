
namespace __FVM_ChatChannelTab_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ChatChannelTab> __ModelContainer_Require_FVM_ChatChannelTab(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ChatChannelTab>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ChatChannelTab(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ChatChannelTab>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ChatChannelTab>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ChatChannelTab>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

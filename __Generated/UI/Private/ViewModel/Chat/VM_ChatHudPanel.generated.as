
namespace __FVM_ChatHudPanel_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ChatHudPanel> __ModelContainer_Require_FVM_ChatHudPanel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ChatHudPanel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ChatHudPanel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ChatHudPanel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ChatHudPanel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ChatHudPanel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

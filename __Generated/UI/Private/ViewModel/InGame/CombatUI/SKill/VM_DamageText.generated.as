
namespace __FVM_DmageText_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_DmageText> __ModelContainer_Require_FVM_DmageText(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_DmageText>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_DmageText(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_DmageText>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_DmageText>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_DmageText>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_DmageTextPanel_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_DmageTextPanel> __ModelContainer_Require_FVM_DmageTextPanel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_DmageTextPanel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_DmageTextPanel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_DmageTextPanel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_DmageTextPanel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_DmageTextPanel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

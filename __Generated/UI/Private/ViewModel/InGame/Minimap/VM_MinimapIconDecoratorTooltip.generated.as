
namespace __FVM_MinimapIconDecoratorTooltip_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MinimapIconDecoratorTooltip> __ModelContainer_Require_FVM_MinimapIconDecoratorTooltip(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MinimapIconDecoratorTooltip>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MinimapIconDecoratorTooltip(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MinimapIconDecoratorTooltip>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MinimapIconDecoratorTooltip>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MinimapIconDecoratorTooltip>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_MinimapIconDecoratorExtraModel_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MinimapIconDecoratorExtraModel> __ModelContainer_Require_FVM_MinimapIconDecoratorExtraModel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MinimapIconDecoratorExtraModel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MinimapIconDecoratorExtraModel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MinimapIconDecoratorExtraModel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MinimapIconDecoratorExtraModel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MinimapIconDecoratorExtraModel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_MinimapIconDecoratorTooltipPanel_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MinimapIconDecoratorTooltipPanel> __ModelContainer_Require_FVM_MinimapIconDecoratorTooltipPanel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MinimapIconDecoratorTooltipPanel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MinimapIconDecoratorTooltipPanel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MinimapIconDecoratorTooltipPanel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MinimapIconDecoratorTooltipPanel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MinimapIconDecoratorTooltipPanel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

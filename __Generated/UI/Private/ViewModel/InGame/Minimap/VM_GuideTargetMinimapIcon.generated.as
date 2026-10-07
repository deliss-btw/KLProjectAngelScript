
namespace __FVM_GuideTargetIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_GuideTargetIcon> __ModelContainer_Require_FVM_GuideTargetIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_GuideTargetIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_GuideTargetIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_GuideTargetIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_GuideTargetIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_GuideTargetIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_GuideTargetMinimapIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_GuideTargetMinimapIcon> __ModelContainer_Require_FVM_GuideTargetMinimapIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_GuideTargetMinimapIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_GuideTargetMinimapIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_GuideTargetMinimapIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_GuideTargetMinimapIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_GuideTargetMinimapIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}


namespace __FVMS_HeadsUpDisplayItem_Interaction_InternalCache_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache> __ModelContainer_Require_FVMS_HeadsUpDisplayItem_Interaction_InternalCache(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_HeadsUpDisplayItem_Interaction_InternalCache(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_HeadsUpDisplayItem_Interaction_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_HeadsUpDisplayItem_Interaction> __ModelContainer_Require_FVM_HeadsUpDisplayItem_Interaction(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_HeadsUpDisplayItem_Interaction>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_HeadsUpDisplayItem_Interaction(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_HeadsUpDisplayItem_Interaction>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_HeadsUpDisplayItem_Interaction>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_HeadsUpDisplayItem_Interaction>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

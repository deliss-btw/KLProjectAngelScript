
namespace __FVM_PlayerBasicItemExtend_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PlayerBasicItemExtend> __ModelContainer_Require_FVM_PlayerBasicItemExtend(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PlayerBasicItemExtend>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PlayerBasicItemExtend(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PlayerBasicItemExtend>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PlayerBasicItemExtend>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PlayerBasicItemExtend>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_PlayerBasicItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PlayerBasicItem> __ModelContainer_Require_FVM_PlayerBasicItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PlayerBasicItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PlayerBasicItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PlayerBasicItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PlayerBasicItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PlayerBasicItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

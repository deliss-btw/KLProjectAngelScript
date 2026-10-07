
namespace __FVM_CommonItemTipOperationItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonItemTipOperationItem> __ModelContainer_Require_FVM_CommonItemTipOperationItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonItemTipOperationItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonItemTipOperationItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonItemTipOperationItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonItemTipOperationItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonItemTipOperationItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CommonItemTipOperationList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonItemTipOperationList> __ModelContainer_Require_FVM_CommonItemTipOperationList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonItemTipOperationList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonItemTipOperationList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonItemTipOperationList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonItemTipOperationList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonItemTipOperationList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CommonItemTip_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonItemTip> __ModelContainer_Require_FVM_CommonItemTip(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonItemTip>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonItemTip(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonItemTip>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonItemTip>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonItemTip>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CommonItemTipHost_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonItemTipHost> __ModelContainer_Require_FVM_CommonItemTipHost(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonItemTipHost>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonItemTipHost(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonItemTipHost>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonItemTipHost>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonItemTipHost>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

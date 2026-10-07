
namespace __FVMS_CommonBottomActionList_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_CommonBottomActionList> __ModelContainer_Require_FVMS_CommonBottomActionList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_CommonBottomActionList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_CommonBottomActionList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_CommonBottomActionList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_CommonBottomActionList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_CommonBottomActionList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}


namespace __FVM_CommissionObjItemModel_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionObjItemModel> __ModelContainer_Require_FVM_CommissionObjItemModel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionObjItemModel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionObjItemModel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionObjItemModel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionObjItemModel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionObjItemModel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

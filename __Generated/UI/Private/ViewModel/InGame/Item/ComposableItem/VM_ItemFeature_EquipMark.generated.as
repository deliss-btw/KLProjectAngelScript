
namespace __FVM_ItemFeature_EquipMark_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemFeature_EquipMark> __ModelContainer_Require_FVM_ItemFeature_EquipMark(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemFeature_EquipMark>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemFeature_EquipMark(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemFeature_EquipMark>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemFeature_EquipMark>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemFeature_EquipMark>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

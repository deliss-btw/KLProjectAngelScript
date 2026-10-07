
namespace __FVM_FastEquipPage_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_FastEquipPage> __ModelContainer_Require_FVM_FastEquipPage(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_FastEquipPage>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_FastEquipPage(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_FastEquipPage>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_FastEquipPage>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_FastEquipPage>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_FastEquipPageItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_FastEquipPageItem> __ModelContainer_Require_FVM_FastEquipPageItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_FastEquipPageItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_FastEquipPageItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_FastEquipPageItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_FastEquipPageItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_FastEquipPageItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

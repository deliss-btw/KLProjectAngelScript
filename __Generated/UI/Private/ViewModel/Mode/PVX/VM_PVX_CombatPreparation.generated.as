
namespace __FVM_PVX_CombatPreparation_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PVX_CombatPreparation> __ModelContainer_Require_FVM_PVX_CombatPreparation(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PVX_CombatPreparation>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PVX_CombatPreparation(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PVX_CombatPreparation>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PVX_CombatPreparation>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PVX_CombatPreparation>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

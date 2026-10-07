
namespace __FVM_CombatSettingPresetSelector_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CombatSettingPresetSelector> __ModelContainer_Require_FVM_CombatSettingPresetSelector(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CombatSettingPresetSelector>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CombatSettingPresetSelector(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CombatSettingPresetSelector>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CombatSettingPresetSelector>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CombatSettingPresetSelector>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

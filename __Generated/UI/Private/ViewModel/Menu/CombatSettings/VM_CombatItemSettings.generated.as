

struct FConfigVM_CombatItemSettings : FConfigEUIModelBase
{
    UPROPERTY()
    TDataObjectPtr<FItemQuickSlotConfig> ItemQuickSlotConfig;

    FConfigVM_CombatItemSettings()
    {
        return;
    }
}

namespace __FVM_CombatItemSettings_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CombatItemSettings> __ModelContainer_Require_FVM_CombatItemSettings(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CombatItemSettings>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CombatItemSettings(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CombatItemSettings>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CombatItemSettings>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CombatItemSettings>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

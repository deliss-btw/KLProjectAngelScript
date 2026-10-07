

struct FConfigVM_BattleBuildEntry : FConfigEUIModelBase
{
    UPROPERTY()
    TDataObjectPtr<FItemQuickSlotConfig> QuickSlot;

    FConfigVM_BattleBuildEntry()
    {
        return;
    }
}

namespace __FVM_BattleBuildEntry_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BattleBuildEntry> __ModelContainer_Require_FVM_BattleBuildEntry(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BattleBuildEntry>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BattleBuildEntry(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BattleBuildEntry>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BattleBuildEntry>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BattleBuildEntry>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

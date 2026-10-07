

struct FConfigVM_MonsterWeaknessInfo : FConfigEUIModelBase
{
    UPROPERTY()
    FText RewardTitleText;
    UPROPERTY()
    TDataObjectPtr<FMonsterWeaknessPartConfig> WeaknessPartConfig;

    FConfigVM_MonsterWeaknessInfo()
    {
        return;
    }
}

namespace __FVM_MonsterWeaknessInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MonsterWeaknessInfo> __ModelContainer_Require_FVM_MonsterWeaknessInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MonsterWeaknessInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MonsterWeaknessInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MonsterWeaknessInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MonsterWeaknessInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MonsterWeaknessInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

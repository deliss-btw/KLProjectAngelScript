

struct FConfigVM_WeaponForge : FConfigEUIModelBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> PopupClass;
    UPROPERTY()
    FText WeaponCannotEquipTips;
    UPROPERTY()
    TArray<TDataObjectPtr<FVirtualItemConfig>> ShowCostTypes;

    FConfigVM_WeaponForge()
    {
        return;
    }
}

namespace __FVM_WeaponForge_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_WeaponForge> __ModelContainer_Require_FVM_WeaponForge(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_WeaponForge>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_WeaponForge(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_WeaponForge>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_WeaponForge>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_WeaponForge>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

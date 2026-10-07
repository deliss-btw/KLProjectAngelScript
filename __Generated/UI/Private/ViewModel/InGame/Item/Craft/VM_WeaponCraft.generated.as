

struct FConfigVM_WeaponCraft : FConfigEUIModelBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> PopupClass;

    FConfigVM_WeaponCraft()
    {
        return;
    }
}

namespace __FVM_WeaponCraftCategory_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_WeaponCraftCategory> __ModelContainer_Require_FVM_WeaponCraftCategory(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_WeaponCraftCategory>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_WeaponCraftCategory(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_WeaponCraftCategory>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_WeaponCraftCategory>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_WeaponCraftCategory>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_WeaponCraft_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_WeaponCraft> __ModelContainer_Require_FVM_WeaponCraft(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_WeaponCraft>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_WeaponCraft(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_WeaponCraft>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_WeaponCraft>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_WeaponCraft>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

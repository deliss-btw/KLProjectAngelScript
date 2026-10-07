

struct FConfigVM_AvatarEquipmentMain : FConfigEUIModelBase
{
    UPROPERTY()
    FText AvatarDecomposeTitleText;
    UPROPERTY()
    FText EquipmentDecomposePopupTitleText;
    UPROPERTY()
    FText EquipmentDecomposePopupDescText;
    UPROPERTY()
    FText EquipmentDecomposePopupRewardHintText;
    UPROPERTY()
    FText AvatarEquipmentTitleText;

    FConfigVM_AvatarEquipmentMain()
    {
        return;
    }
}

namespace __FVM_AvatarEquipmentMain_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarEquipmentMain> __ModelContainer_Require_FVM_AvatarEquipmentMain(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarEquipmentMain>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarEquipmentMain(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarEquipmentMain>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarEquipmentMain>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarEquipmentMain>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}


namespace __FVM_AvatarUnlockCondition_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarUnlockCondition> __ModelContainer_Require_FVM_AvatarUnlockCondition(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarUnlockCondition>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarUnlockCondition(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarUnlockCondition>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_AvatarAllUnlockConditions_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarAllUnlockConditions> __ModelContainer_Require_FVM_AvatarAllUnlockConditions(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarAllUnlockConditions>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarAllUnlockConditions(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarAllUnlockConditions>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarAllUnlockConditions>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarAllUnlockConditions>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

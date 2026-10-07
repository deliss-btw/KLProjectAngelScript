

struct FVM_PlayerAvatarIconConfigDefault : FConfigEUIModelDefaultBase
{
    UPROPERTY()
    TMap<EDamageType, FSlateBrush> DamageTypeSlateBrush;

    FVM_PlayerAvatarIconConfigDefault()
    {
        return;
    }
}

namespace __FVM_PlayerAvatarIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PlayerAvatarIcon> __ModelContainer_Require_FVM_PlayerAvatarIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PlayerAvatarIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PlayerAvatarIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PlayerAvatarIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PlayerAvatarIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PlayerAvatarIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

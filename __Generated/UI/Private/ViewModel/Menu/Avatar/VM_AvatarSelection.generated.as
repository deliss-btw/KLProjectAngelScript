

struct FConfigVM_AvatarSelection : FConfigEUIModelBase
{
    UPROPERTY()
    FGameplayTag RedDotNewAvatarTag;
    UPROPERTY()
    FSoftBrush AvatarIllustrateIconAll;

    FConfigVM_AvatarSelection()
    {
        return;
    }
}

struct FAvatarApplySelection : FEUIModelDelegate
{
    FEUIModelDelegate _base_FEUIModelDelegate;

    FAvatarApplySelection()
    {
        FEUIModelDelegate local_26 = FEUIModelDelegate("bool", "FEUIModelRef");
        return;
    }
    bool Execute(const FEUIModelRef &inout Arg0) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().Execute(Arg0);
    }
    bool ExecuteIfBound(const FEUIModelRef &inout Arg0, bool &inout OutResult) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().ExecuteIfBound(Arg0, OutResult);
    }
}

namespace __FVM_AvatarSelection_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarSelection> __ModelContainer_Require_FVM_AvatarSelection(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarSelection>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarSelection(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarSelection>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarSelection>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarSelection>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_AvatarSelectionShowcase_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarSelectionShowcase> __ModelContainer_Require_FVM_AvatarSelectionShowcase(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarSelectionShowcase>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarSelectionShowcase(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarSelectionShowcase>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarSelectionShowcase>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarSelectionShowcase>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

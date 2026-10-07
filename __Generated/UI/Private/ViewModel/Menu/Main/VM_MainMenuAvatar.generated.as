

struct FConfigVM_MainMenuAvatar : FConfigEUIModelBase
{
    UPROPERTY()
    FGameplayTag RedDotNewAvatarTag;

    FConfigVM_MainMenuAvatar()
    {
        return;
    }
}

struct FSimpleEntryClick : FEUIModelDelegate
{
    FEUIModelDelegate _base_FEUIModelDelegate;

    FSimpleEntryClick()
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

struct FOnHoverEquipSlotChanged : FEUIModelDelegate
{
    FEUIModelDelegate _base_FEUIModelDelegate;

    FOnHoverEquipSlotChanged()
    {
        FEUIModelDelegate local_26 = FEUIModelDelegate("bool", "int32");
        return;
    }
    bool Execute(const int Arg0) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().Execute();
    }
    bool ExecuteIfBound(const int Arg0, bool &inout OutResult) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().ExecuteIfBound(OutResult);
    }
}

namespace __FVM_MainMenuAvatarBuildTypeEntry_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry> __ModelContainer_Require_FVM_MainMenuAvatarBuildTypeEntry(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MainMenuAvatarBuildTypeEntry(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MainMenuAvatarBuildTypeEntry>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_MainMenuAvatarReturnBtnState_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MainMenuAvatarReturnBtnState> __ModelContainer_Require_FVM_MainMenuAvatarReturnBtnState(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MainMenuAvatarReturnBtnState>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MainMenuAvatarReturnBtnState(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MainMenuAvatarReturnBtnState>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MainMenuAvatarReturnBtnState>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MainMenuAvatarReturnBtnState>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_MainMenuAvatar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MainMenuAvatar> __ModelContainer_Require_FVM_MainMenuAvatar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MainMenuAvatar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MainMenuAvatar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MainMenuAvatar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MainMenuAvatar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MainMenuAvatar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

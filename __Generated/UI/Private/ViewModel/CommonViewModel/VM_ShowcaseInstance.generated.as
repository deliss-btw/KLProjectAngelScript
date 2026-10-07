

struct FConfigVM_AvatarShowcase : FConfigEUIModelBase
{
    UPROPERTY()
    TArray<TDataObjectPtr<FUIShowcaseConfig>> Configs;

    FConfigVM_AvatarShowcase()
    {
        return;
    }
}

namespace __FVM_KeepShowcaseVisible_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_KeepShowcaseVisible> __ModelContainer_Require_FVM_KeepShowcaseVisible(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_KeepShowcaseVisible>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_KeepShowcaseVisible(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_KeepShowcaseVisible>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_KeepShowcaseVisible>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_KeepShowcaseVisible>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_AvatarShowcase_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarShowcase> __ModelContainer_Require_FVM_AvatarShowcase(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarShowcase>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarShowcase(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarShowcase>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarShowcase>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarShowcase>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

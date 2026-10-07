

struct FConfigVM_CreatePlayer : FConfigEUIModelBase
{
    UPROPERTY()
    TArray<TDataObjectPtr<FUIShowcaseConfig>> Configs;

    FConfigVM_CreatePlayer()
    {
        return;
    }
}

namespace __FVM_CreatePlayer_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CreatePlayer> __ModelContainer_Require_FVM_CreatePlayer(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CreatePlayer>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CreatePlayer(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CreatePlayer>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CreatePlayer>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CreatePlayer>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

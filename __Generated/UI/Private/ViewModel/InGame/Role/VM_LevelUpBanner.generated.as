

struct FConfigVM_LevelUpBanner : FConfigEUIModelBase
{
    UPROPERTY()
    FFPTime ExpBarDuration;
    UPROPERTY()
    FFPTime PostExpBarDelay;
    UPROPERTY()
    FFPTime TimeForAnimOut;
    UPROPERTY()
    FFPTime ExpBarStartTime;

    FConfigVM_LevelUpBanner()
    {
        return;
    }
}

namespace __FVM_LevelUpBanner_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_LevelUpBanner> __ModelContainer_Require_FVM_LevelUpBanner(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_LevelUpBanner>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_LevelUpBanner(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_LevelUpBanner>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_LevelUpBanner>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_LevelUpBanner>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

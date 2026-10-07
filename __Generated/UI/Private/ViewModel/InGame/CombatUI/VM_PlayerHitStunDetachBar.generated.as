

struct FVM_PlayerHitStunDetachBarConfigDefault : FConfigEUIModelDefaultBase
{
    UPROPERTY()
    float32 PreviewDetachBarChaseSeconds = 0.7f;


}

namespace __FVM_PlayerHitStunDetachBar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PlayerHitStunDetachBar> __ModelContainer_Require_FVM_PlayerHitStunDetachBar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PlayerHitStunDetachBar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PlayerHitStunDetachBar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PlayerHitStunDetachBar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PlayerHitStunDetachBar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PlayerHitStunDetachBar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

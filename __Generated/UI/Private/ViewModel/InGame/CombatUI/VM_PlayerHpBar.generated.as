

struct FVM_PlayerHpBarConfigDefault : FConfigEUIModelDefaultBase
{
    UPROPERTY()
    float32 PreviewHpBarChaseSeconds = 0.7f;


}

namespace __FVM_PlayerHpBar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PlayerHpBar> __ModelContainer_Require_FVM_PlayerHpBar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PlayerHpBar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PlayerHpBar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PlayerHpBar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PlayerHpBar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PlayerHpBar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

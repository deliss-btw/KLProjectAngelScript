

struct FVMS_BossHpBarConfigDefault : FConfigEUIModelDefaultBase
{
    UPROPERTY()
    float32 HideHpBarDistance = 1500.0f;
    UPROPERTY()
    float32 DelayHideHpBarSeconds = 2.0f;
    UPROPERTY()
    float32 PreviewHpBarChaseSeconds = 0.7f;
    UPROPERTY()
    float32 HitShowHpBarDistance = 1500.0f;


}

namespace __FVMS_BossHpBar_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_BossHpBar> __ModelContainer_Require_FVMS_BossHpBar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_BossHpBar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_BossHpBar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_BossHpBar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_BossHpBar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_BossHpBar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

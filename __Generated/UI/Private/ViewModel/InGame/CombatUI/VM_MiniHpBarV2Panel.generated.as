

struct FVMS_MiniHpBarV2PanelConfigDefault : FConfigEUIModelDefaultBase
{
    UPROPERTY()
    float32 HideMiniHpBarDistance = 5000.0f;
    UPROPERTY()
    float32 DelayHideMiniHpBarSeconds = 2.0f;
    UPROPERTY()
    float32 AnimFadeOutSeconds = 0.2f;
    UPROPERTY()
    float32 EnemyAvatarAlwaysShowHpBarDistance = 700.0f;
    UPROPERTY()
    float32 HitShowMiniHpBarDistance = 5000.0f;


}

namespace __FVMS_MiniHpBarV2Panel_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_MiniHpBarV2Panel> __ModelContainer_Require_FVMS_MiniHpBarV2Panel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_MiniHpBarV2Panel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_MiniHpBarV2Panel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_MiniHpBarV2Panel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_MiniHpBarV2Panel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_MiniHpBarV2Panel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

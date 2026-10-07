
namespace __FVM_BossHpSegmentIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BossHpSegmentIcon> __ModelContainer_Require_FVM_BossHpSegmentIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BossHpSegmentIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BossHpSegmentIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BossHpSegmentIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BossHpSegmentIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BossHpSegmentIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

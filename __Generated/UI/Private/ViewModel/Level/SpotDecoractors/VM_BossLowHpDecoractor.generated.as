
namespace __FVM_BossLowHpDecoractor_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BossLowHpDecoractor> __ModelContainer_Require_FVM_BossLowHpDecoractor(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BossLowHpDecoractor>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BossLowHpDecoractor(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BossLowHpDecoractor>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BossLowHpDecoractor>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BossLowHpDecoractor>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

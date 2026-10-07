
namespace __FVM_HeadsUpDisplayItem_HitStunDetach_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_HeadsUpDisplayItem_HitStunDetach> __ModelContainer_Require_FVM_HeadsUpDisplayItem_HitStunDetach(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_HeadsUpDisplayItem_HitStunDetach>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_HeadsUpDisplayItem_HitStunDetach(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_HeadsUpDisplayItem_HitStunDetach>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_HeadsUpDisplayItem_HitStunDetach>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_HeadsUpDisplayItem_HitStunDetach>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

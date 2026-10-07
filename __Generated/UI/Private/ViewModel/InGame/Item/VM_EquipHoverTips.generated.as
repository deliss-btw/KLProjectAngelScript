

struct FEquipHoverTipsClicked : FEUIModelDelegate
{
    FEUIModelDelegate _base_FEUIModelDelegate;

    FEquipHoverTipsClicked()
    {
        FEUIModelDelegate local_26 = FEUIModelDelegate("bool", "FEUIModelRef");
        return;
    }
    bool Execute(const FEUIModelRef &inout Arg0) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().Execute(Arg0);
    }
    bool ExecuteIfBound(const FEUIModelRef &inout Arg0, bool &inout OutResult) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().ExecuteIfBound(Arg0, OutResult);
    }
}

namespace __FVM_EquipHoverTips_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_EquipHoverTips> __ModelContainer_Require_FVM_EquipHoverTips(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_EquipHoverTips>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_EquipHoverTips(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_EquipHoverTips>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_EquipHoverTips>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_EquipHoverTips>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

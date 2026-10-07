
namespace __FVM_DraftPlayerInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_DraftPlayerInfo> __ModelContainer_Require_FVM_DraftPlayerInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_DraftPlayerInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_DraftPlayerInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_DraftPlayerInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_DraftPlayerInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_DraftPlayerInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

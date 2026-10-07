
namespace __FVMS_SelfPlayerInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_SelfPlayerInfo> __ModelContainer_Require_FVMS_SelfPlayerInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_SelfPlayerInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_SelfPlayerInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_SelfPlayerInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_SelfPlayerInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_SelfPlayerInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

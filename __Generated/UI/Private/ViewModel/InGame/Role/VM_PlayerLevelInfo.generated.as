
namespace __FVMS_PlayerLevelInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_PlayerLevelInfo> __ModelContainer_Require_FVMS_PlayerLevelInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_PlayerLevelInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_PlayerLevelInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_PlayerLevelInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_PlayerLevelInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_PlayerLevelInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

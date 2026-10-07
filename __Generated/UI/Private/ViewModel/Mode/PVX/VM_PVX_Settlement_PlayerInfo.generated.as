
namespace __FVM_PVX_Settlement_PlayerInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PVX_Settlement_PlayerInfo> __ModelContainer_Require_FVM_PVX_Settlement_PlayerInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PVX_Settlement_PlayerInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PVX_Settlement_PlayerInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

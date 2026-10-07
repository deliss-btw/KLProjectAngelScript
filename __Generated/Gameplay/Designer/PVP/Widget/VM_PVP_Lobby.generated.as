
namespace __FVMS_PVP_Lobby_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_PVP_Lobby> __ModelContainer_Require_FVMS_PVP_Lobby(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_PVP_Lobby>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_PVP_Lobby(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_PVP_Lobby>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_PVP_Lobby>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_PVP_Lobby>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

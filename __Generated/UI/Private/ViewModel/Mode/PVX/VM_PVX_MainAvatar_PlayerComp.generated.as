
namespace __FVM_PVX_MainAvatar_PlayerComp_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PVX_MainAvatar_PlayerComp> __ModelContainer_Require_FVM_PVX_MainAvatar_PlayerComp(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PVX_MainAvatar_PlayerComp>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PVX_MainAvatar_PlayerComp(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PVX_MainAvatar_PlayerComp>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PVX_MainAvatar_PlayerComp>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PVX_MainAvatar_PlayerComp>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}



struct FPlayerMonitorReadyEvent : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent;

    FPlayerMonitorReadyEvent()
    {
        FEUIModelEvent local_22 = FEUIModelEvent("", "FECSEntity, bool, bool");
        return;
    }
    void Broadcast(const FECSEntity &inout Arg0, const bool Arg1, const bool Arg2) const
    {
        Z__CastTemplate local_4;
        local_4.opCall().Broadcast(Arg0, Arg1, Arg2);
        return;
    }
}

struct FPlayerMonitorAvatarEvent : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent;

    FPlayerMonitorAvatarEvent()
    {
        FEUIModelEvent local_22 = FEUIModelEvent("", "FECSEntity, uint32");
        return;
    }
    void Broadcast(const FECSEntity &inout Arg0, const uint Arg1) const
    {
        Z__CastTemplate local_4;
        local_4.opCall().Broadcast(Arg0);
        return;
    }
}

namespace __FVM_PVX_PlayerMonitor_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PVX_PlayerMonitor> __ModelContainer_Require_FVM_PVX_PlayerMonitor(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PVX_PlayerMonitor>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PVX_PlayerMonitor(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PVX_PlayerMonitor>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PVX_PlayerMonitor>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PVX_PlayerMonitor>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_PVX_MainAvatar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PVX_MainAvatar> __ModelContainer_Require_FVM_PVX_MainAvatar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PVX_MainAvatar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PVX_MainAvatar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PVX_MainAvatar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PVX_MainAvatar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PVX_MainAvatar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}

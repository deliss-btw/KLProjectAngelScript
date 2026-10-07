

class US_FrontendSystem : UECSScriptSystem
{
    US_FrontendSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_EnterSystem(const FCE_FrontendSystemEnter &inout Event) const
    {
        ::FrontendSystem_Internal::EnterSystem(Event.Sender, Event.FrontendSystem);
        return;
    }
    UFUNCTION()
    void ClientJob_ExitSystem(const FCE_FrontendSystemExit &inout Event) const
    {
        ::FrontendSystem_Internal::ExitSystem(Event.Sender, Event.FrontendSystem);
        return;
    }
    UFUNCTION()
    void ClientJob_OnPlayerDeath(const FCE_DeathEvent &inout Event, const FCS_LocalPlayer &inout C_LocalPlayer) const
    {
        if ((FECSEntity(Event.Sender) == C_LocalPlayer.GetPlayerPawnEntity()))
        {
            Get local_14;
            const FC_FrontendSystem& local_16 = local_14.opCall();
            if (local_16)
            {
                TArray<int> local_20;
                for (auto& local_34 : local_16.OpenedSystemInstances)
                {
                    if (local_34.Config.bForbitOnDeath)
                    {
                        local_20.Add(local_34.Handle);
                    }
                }
                for (auto local_50 : local_20)
                {
                    ::FrontendSystem_Internal::ExitSystemByHandle(C_LocalPlayer.PlayerEntity, int(local_50));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_EnterSystem() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_FrontendSystemEnter> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_FrontendSystemEnter& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_EnterSystem(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ExitSystem() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_FrontendSystemExit> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_FrontendSystemExit& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_ExitSystem(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_OnPlayerDeath() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        TECSEventConstIterator<FCE_DeathEvent> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_DeathEvent& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ClientJob_OnPlayerDeath(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

namespace FrontendSystem_Internal
{
void EnterSystem(const FECSEntity &inout PlayerEntity, const UFrontendSystemConfig FrontendSystem)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
bool ExitSystem(const FECSEntity &inout PlayerEntity, const UFrontendSystemConfig FrontendSystem)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    bool __r; return __r;
}
bool ExitSystemByHandle(const FECSEntity &inout PlayerEntity, const int SystemInstanceHandle)
{
    Get local_4;
    const FC_FrontendSystem& local_6 = local_4.opCall();
    if (local_6)
    {
        int local_8 = 0;
        for (; local_8 < local_6.OpenedSystemInstances.Num(); ++local_8)
        {
            if (local_6.OpenedSystemInstances[local_8].Handle == SystemInstanceHandle)
            {
                FrontendSystem_Internal::ExitByIndex(PlayerEntity, local_8);
                return true;
            }
        }
    }
    return false;
}
int FindLastIndexByConfig(const FECSEntity &inout PlayerEntity, const UFrontendSystemConfig Config)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    int __r; return __r;
}
void CreateAndEnterNewSystem(const FECSEntity &inout PlayerEntity, const UFrontendSystemConfig Config)
{
    FFrontendSystemInstance local_32;
    local_32.SystemPageGroup = Cast<UFrontendSystemInstancedPageGroup>(NewObject(FrontendSystem_Internal::GetBehaviorOuter(PlayerEntity), UFrontendSystemInstancedPageGroup, NAME_None, false));
    FC_FrontendSystem local_6;
    local_32.SystemPageGroup.FrontendSystemInstanceHandle = int(local_6.NextHandle);
    local_32.Handle = local_32.SystemPageGroup.FrontendSystemInstanceHandle;
    ++local_6.NextHandle;
    if ((!((int(local_6.NextHandle) >= 0))))
    {
        local_6.NextHandle = 0;
    }
    if (!(local_6.OpenedSystemInstances.IsEmpty()))
    {
        FrontendSystem_Internal::OnSystemBackgrounded(PlayerEntity, local_6.OpenedSystemInstances.Last(0));
    }
    local_6.OpenedSystemInstances.Add(local_32);
    FrontendSystem_Internal::OnSystemEnter(PlayerEntity, local_6.OpenedSystemInstances.Last(0));
    return;
}
void ReenterExistingSystemByIndex(const FECSEntity &inout PlayerEntity, const int Index)
{
    int local_6 = 0;
    FrontendSystem_Internal::OnSystemBackgrounded(PlayerEntity, local_6.OpenedSystemInstances.Last(0));
    FFrontendSystemInstance local_34;
    local_6.OpenedSystemInstances.RemoveAt(Index);
    local_6.OpenedSystemInstances.Add(local_34);
    FrontendSystem_Internal::OnSystemFocusedFromBackground(PlayerEntity, local_6.OpenedSystemInstances.Last(0));
    return;
}
void ExitByIndex(const FECSEntity &inout PlayerEntity, const int Index)
{
    int local_6 = 0;
    FFrontendSystemInstance& local_8 = local_6.OpenedSystemInstances[Index];
    FrontendSystem_Internal::OnSystemExit(PlayerEntity, local_8);
    local_6.OpenedSystemInstances.RemoveAt(Index);
    if (local_6.OpenedSystemInstances.IsEmpty())
    {
        Remove local_14;
        local_14.opCall();
        return;
    }
    if (Index == local_6.OpenedSystemInstances.Num())
    {
        FFrontendSystemInstance& local_18 = local_6.OpenedSystemInstances[Index - 1];
        FrontendSystem_Internal::OnSystemFocusedFromBackground(PlayerEntity, local_18);
    }
    return;
}
void OnSystemEnter(const FECSEntity &inout PlayerEntity, FFrontendSystemInstance &inout SystemInstance)
{
    FrontendSystem_Internal::BehaviorsEnterState(PlayerEntity, SystemInstance, EFrontendSystemState(0));
    FrontendSystem_Internal::BehaviorsEnterState(PlayerEntity, SystemInstance, EFrontendSystemState(1));
    bool local_11 = !(SystemInstance.SystemPageGroup.MainPage);
    XWarningIf(local_11, ELog(52), FString().Append("System ").Append(SystemInstance.Config.GetName()).Append(" doesn't open any page in \"System\" group, which will not exit until call exit system manually."));
    return;
}
void OnSystemExit(const FECSEntity &inout PlayerEntity, FFrontendSystemInstance &inout SystemInstance)
{
    SystemInstance.SystemPageGroup.bFrontendSystemWillExit = true;
    FrontendSystem_Internal::BehaviorsExitState(PlayerEntity, SystemInstance, EFrontendSystemState(1));
    FrontendSystem_Internal::BehaviorsExitState(PlayerEntity, SystemInstance, EFrontendSystemState(2));
    FrontendSystem_Internal::BehaviorsExitState(PlayerEntity, SystemInstance, EFrontendSystemState(0));
    return;
}
void OnSystemFocusedFromBackground(const FECSEntity &inout PlayerEntity, FFrontendSystemInstance &inout SystemInstance)
{
    FrontendSystem_Internal::BehaviorsExitState(PlayerEntity, SystemInstance, EFrontendSystemState(2));
    FrontendSystem_Internal::BehaviorsEnterState(PlayerEntity, SystemInstance, EFrontendSystemState(1));
    return;
}
void OnSystemBackgrounded(const FECSEntity &inout PlayerEntity, FFrontendSystemInstance &inout SystemInstance)
{
    FrontendSystem_Internal::BehaviorsExitState(PlayerEntity, SystemInstance, EFrontendSystemState(1));
    FrontendSystem_Internal::BehaviorsEnterState(PlayerEntity, SystemInstance, EFrontendSystemState(2));
    return;
}
void BehaviorsEnterState(const FECSEntity &inout PlayerEntity, FFrontendSystemInstance &inout SystemInstance, const EFrontendSystemState State)
{
    int local_10 = 0;
    for (auto& local_26 : SystemInstance.Config.Behaviors)
    {
        if (int(local_26.State) == int(State))
        {
            local_10.Add(local_26.Behavior);
        }
    }
    FFrontendSystemContext local_38;
    local_38.PlayerEntity = PlayerEntity;
    local_38.SystemPageGroup = SystemInstance.SystemPageGroup;
    local_38.SystemState = State;
    local_10.EnterState(local_38);
    return;
}
void BehaviorsExitState(const FECSEntity &inout PlayerEntity, FFrontendSystemInstance &inout SystemInstance, const EFrontendSystemState State)
{
    if (SystemInstance.Behaviors.Contains(State))
    {
        FFrontendSystemContext local_10;
        local_10.PlayerEntity = PlayerEntity;
        local_10.SystemPageGroup = SystemInstance.SystemPageGroup;
        local_10.SystemState = State;
        SystemInstance.Behaviors[State].ExitState(local_10);
    }
    return;
}
UObject GetBehaviorOuter(const FECSEntity &inout PlayerEntity)
{
    Get local_4;
    TWeakObjectPtr<AECSPlayerController> local_6 = local_4.opCall().GetUEPlayerController();
    AECSPlayerController local_8;
    return local_8;
}
}

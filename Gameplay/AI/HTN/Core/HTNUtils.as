namespace FHTNUtils
{
void StopHTN(const FECSEntity &inout Entity)
{
    FC_HTNInstance local_6;
    if (!(local_6))
    {
        return;
    }
    local_6.bRunAtInitialization = false;
    if (local_6.HTNComponent.IsValid())
    {
        local_6.HTNComponent.Get().StopHTN(true);
    }
    return;
}
void StartHTN(const FECSEntity &inout Entity, const TSoftObjectPtr<UHTN> &inout HTH, const TSoftObjectPtr<UBlackboardData> &inout BlackBoard)
{
    int local_6 = 0;
    local_6.HTNAsset = HTH;
    local_6.BlackboardAsset = BlackBoard;
    FC_HTNNeedRestartTag local_12;
    Assign local_10;
    local_10.opCall(local_12);
    return;
}
void CleanHTNActor(const FECSEntity &inout Entity, const FC_HTNInstance &inout HTNInstance)
{
    FAIExecuteGuard local_1 = FAIExecuteGuard(ECS::GetECSWorld().GetFixedTime(), Entity, Entity);
    if (HTNInstance.HTNComponent.IsValid())
    {
        HTNInstance.HTNComponent.Get().StopHTN(true);
    }
    AActor local_10 = Cast<AActor>(HTNInstance.TreeOwnerActor.Get());
    if (local_10 != nullptr)
    {
        local_10.DestroyActor();
    }
    Remove local_16;
    local_16.opCall();
    return;
}
void Internal_InitHTNInstance(const FECSEntity &inout Entity, FC_HTNInstance &inout ModifiableHTNInstance)
{
    if (ModifiableHTNInstance.TreeOwnerActor.IsValid())
    {
        return;
    }
    FName local_12 = FName(FString().Append(Entity.GetEntityName()).Append("_HTN"));
    AECSAIProxy local_14 = Cast<AECSAIProxy>(SpawnActor(AECSAIProxy, FVector::ZeroVector, FRotator::ZeroRotator, local_12, false, nullptr, nullptr));
    UBlackboardComponent local_18 = local_14.BlackBoardComponent;
    UECSHTNComponent local_20 = local_14.HTNComponent;
    local_20.ControllerEntity = Entity;
    local_20.PawnEntity = Entity;
    ModifiableHTNInstance.TreeOwnerActor = TWeakObjectPtr<AECSAIProxy>(local_14);
    ModifiableHTNInstance.HTNComponent = local_20;
    if (!(ModifiableHTNInstance.DynamicHTNSet.IsEmpty()))
    {
        local_20.InitializeDynamicAssets(ModifiableHTNInstance.DynamicHTNSet);
    }
    return;
}
void Internal_RunHTN(const FECSEntity &inout Entity, FC_HTNInstance &inout ModifiableHTNInstance)
{
    if (!(ModifiableHTNInstance.TreeOwnerActor.IsValid()))
    {
        return;
    }
    FAIExecuteGuard local_2 = FAIExecuteGuard(ECS::GetECSWorld().GetFixedTime(), Entity, Entity);
    AECSAIProxy local_6 = ModifiableHTNInstance.TreeOwnerActor.Get();
    UBlackboardComponent local_10 = local_6.BlackBoardComponent;
    UECSHTNComponent local_12 = local_6.HTNComponent;
    HTN::SyncLoadObjectPtr(ModifiableHTNInstance.BlackboardAsset.ToSoftObjectPath());
    HTN::SyncLoadObjectPtr(ModifiableHTNInstance.HTNAsset.ToSoftObjectPath());
    UHTN local_28 = ModifiableHTNInstance.HTNAsset.Get();
    FECSWorldPtr local_4 = Entity.GetWorld();
    ModifyOrAdd local_26;
    local_26.opCall().AddAICommandSource(local_28);
    FECSAIUtils::RegisterBehaviorTreeResource(Entity.GetWorld(), ModifiableHTNInstance.HTNAsset.Get());
    HTN::InitBlackBoard(local_10, ModifiableHTNInstance.BlackboardAsset.Get());
    local_10.SetValueAsEntityId(FAIBlackboardNativeKey::SelfEntity, Entity.GetId());
    local_12.StartHTN(ModifiableHTNInstance.HTNAsset.Get());
    FC_HTNRuningTag local_38;
    Assign local_36;
    local_36.opCall(local_38);
    ModifiableHTNInstance.LastExecutionTime = ECS::GetECSWorld().GetFixedTime().Time;
    return;
}
}

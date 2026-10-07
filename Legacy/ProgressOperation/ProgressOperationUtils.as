
namespace FProgressOperationUtils
{
FECSEntity StartProgressOperation(const FECSEntity &inout InitiatorEntity, const FECSEntity &inout TargetEntity, const TDataObjectPtr<FProgressOperationConfig> &inout ConfigPtr, const bool bLocalPrediction = false)
{
    int local_36 = 0;
    int local_104 = 0;
    int local_112 = 0;
    int local_118 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return FECSEntity();
    }
    if (!(ConfigPtr))
    {
        XError(ELog(0), FString().Append("ProgressOperationConfig is invalid! entity: ").Append(InitiatorEntity.GetEntityName()));
        return FECSEntity();
    }
    FECSEntity local_6 = ECS::CreateEmptyEntity(ECS::GetECSWorld(), EECSRegType(0), 9, n"ProgressOperation", false);
    ModifyOrAdd local_28;
    local_28.opCall().RelevancePolicyType = false;
    if (bLocalPrediction)
    {
        local_36.SetOwnerEntity(InitiatorEntity);
        local_28.opCall().RelevancePolicyType = (4 != 0);
        Get local_40;
        const FC_NetPredict& local_42 = local_40.opCall();
        if (local_42)
        {
            FECSNetUtils::SetNetPredict(local_6, local_42.GetMask());
        }
    }
    local_104.SetConfig(ConfigPtr);
    local_104.SetOperationEntity(local_6);
    local_104.SetInitiatorEntity(InitiatorEntity);
    local_104.SetTargetEntity(TargetEntity);
    local_104.SetState(EProgressOperationState(0));
    local_104.SetNextState(EProgressOperationState(1));
    FProgressOperationConfig local_16;
    local_104.SetProgressValue(local_16.InitProgressValue);
    local_104.SetProgressMaxValue(local_16.ProgressMaxValue);
    local_104.SetTotalTime(local_16.OperationTotalTime);
    local_104.SetProgressIncreseSpeed(local_16.InitProgressIncreaseSpeed);
    local_104.SetbLocalPrediction(bLocalPrediction);
    local_112.SetOperationEntity(local_6);
    local_112.SetConfig(ConfigPtr);
    local_112.SetbIsInitiator(true);
    if (TargetEntity.IsValid())
    {
        local_118.SetOperationEntity(local_6);
        local_118.SetConfig(ConfigPtr);
    }
    return local_6;
}
bool JoinProgressOperation(const FECSEntity &inout OperationEntity, const FECSEntity &inout ParticipantEntity)
{
    int local_8 = 0;
    const FProgressOperationConfig& local_14;
    int local_20 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return false;
    }
    if (!(local_8) || (int(local_8.GetState()) >= 3))
    {
        return false;
    }
    if (local_8.GetParticipantEntities().Num() >= (int(local_14.MaxOperationMemberNum)))
    {
        return false;
    }
    local_8.GetModify_ParticipantEntities().AddUnique(ParticipantEntity);
    local_8.SetbLocalPrediction(false);
    local_20.SetOperationEntity(OperationEntity);
    local_20.SetConfig(local_8.GetConfig());
    local_20.SetbIsInitiator(false);
    FProgressOperationActionArray local_24;
    int local_25 = 6;
    if (local_14.Actions.Find(local_24, local_25))
    {
        for (auto& local_40 : local_24.Actions)
        {
            local_40.ActivateAction(local_8, ParticipantEntity);
        }
    }
    return true;
}
void LeaveProgressOperation(const FECSEntity &inout OperationEntity, const FECSEntity &inout ParticipantEntity)
{
    int local_6 = 0;
    const FProgressOperationConfig& local_14;
    int local_40 = 0;
    if (!(local_6) || (int(local_6.GetState()) >= 3))
    {
        return;
    }
    if (!(ECS::GetRuntimeInfo().IsServer) && !(local_6.GetbLocalPrediction()))
    {
        return;
    }
    FProgressOperationActionArray local_18;
    int local_19 = 7;
    if (local_14.Actions.Find(local_18, local_19))
    {
        for (auto& local_34 : local_18.Actions)
        {
            local_34.ActivateAction(local_6, ParticipantEntity);
        }
    }
    local_40.SetFinalState(EProgressOperationState(local_6.GetState()));
    local_40.SetFinalProgressValue(local_6.GetProgressValue());
    local_40.SetFinalProgressMaxValue(local_6.GetProgressMaxValue());
    local_40.SetFinalProgressTime(float32(local_6.GetCurTime().ToSeconds()));
    local_40.SetFinalProgressTotalTime(float32(local_6.GetTotalTime().ToSeconds()));
    local_40.SetbIsLeave(true);
    Remove local_48;
    local_48.opCall();
    return;
}
void BreakProgressOperation(const FECSEntity &inout OperationEntity)
{
    int local_6 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer) && !(local_6.GetbLocalPrediction()))
    {
        return;
    }
    if ((int(local_6.GetState())) < 3 && (int(local_6.GetNextState()) < 3))
    {
        local_6.SetNextState(EProgressOperationState(EProgressOperationState(5)));
    }
    return;
}
void ProgressOperationSucceed(const FECSEntity &inout OperationEntity)
{
    int local_6 = 0;
    if ((int(local_6.GetState())) < 3 && (int(local_6.GetNextState()) < 3))
    {
        local_6.SetNextState(EProgressOperationState(EProgressOperationState(3)));
    }
    return;
}
}

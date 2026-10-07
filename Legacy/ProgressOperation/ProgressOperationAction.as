
enum EProgressOperationActionTarget
{
    Initiator,
    Participant,
    InitiatorAndParticipant,
    TriggerEntity,
    OperationEntity,
    TargetEntity,
}


// NOTE: class defaults are not authored in this module: FProgressOperationActionData_BreakOperation (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

UCLASS(Abstract)
class UProgressOperationActionBase : UObject
{
    UProgressOperationActionBase()
    {
        return;
    }
    void Activate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout TriggerEntity, const FInstancedStruct &inout InstanceData) const
    {
        this.OnActivate(Runtime, TriggerEntity, InstanceData);
        return;
    }
    void OnActivate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout Entity, const FInstancedStruct &inout InstanceData) const
    {
        return;
    }
}

struct FProgressOperationActionData
{
    UPROPERTY()
    TSubclassOf<UProgressOperationActionBase> ActionClass;

    FProgressOperationActionData()
    {
        return;
    }
}

struct FProgressOperationActionDataWithTarget : FProgressOperationActionData
{
    FProgressOperationActionData _base_FProgressOperationActionData;
    UPROPERTY()
    EProgressOperationActionTarget ActionTarget = EProgressOperationActionTarget(2);


}

UCLASS(Abstract)
class UProgressOperationActionWithTarget : UProgressOperationActionBase
{
    UProgressOperationActionWithTarget()
    {
        super();
        return;
    }
    void Activate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout TriggerEntity, const FInstancedStruct &inout InstanceData) const
    {
        FProgressOperationActionDataWithTarget local_6;
        TArray<FECSEntity> local_12 = this.GetActionTargetEntity(Runtime, TriggerEntity, local_6.ActionTarget);
        for (auto& local_32 : local_12)
        {
            if (local_32.IsValid())
            {
                this.OnActivate(Runtime, local_32, InstanceData);
            }
        }
        return;
    }
    TArray<FECSEntity> GetActionTargetEntity(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout TriggerEntity, const EProgressOperationActionTarget ActionTarget) const
    {
        TArray<FECSEntity> local_4;
        switch (int(ActionTarget))
        {
        case 0:
        {
            local_4.Add(Runtime.GetInitiatorEntity());
            break;
        }
        case 1:
        {
            local_4 = Runtime.GetParticipantEntities();
            break;
        }
        case 2:
        {
            local_4.Add(Runtime.GetInitiatorEntity());
            local_4.Append(Runtime.GetParticipantEntities());
            break;
        }
        case 3:
        {
            local_4.Add(TriggerEntity);
            break;
        }
        case 4:
        {
            local_4.Add(Runtime.GetOperationEntity());
            break;
        }
        case 5:
        {
            local_4.Add(Runtime.GetTargetEntity());
            break;
        }
        }
        return local_4;
    }
}

struct FProgressOperationActionData_BreakOperation : FProgressOperationActionData
{
    FProgressOperationActionData _base_FProgressOperationActionData;

    FProgressOperationActionData_BreakOperation()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

class UProgressOperationAction_BreakOperation : UProgressOperationActionBase
{
    UProgressOperationAction_BreakOperation()
    {
        super();
        return;
    }
    void OnActivate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout Entity, const FInstancedStruct &inout InstanceData) const
    {
        ::FProgressOperationUtils::BreakProgressOperation(Runtime.GetOperationEntity());
        return;
    }
}

struct FProgressOperationActionData_LeaveOperation : FProgressOperationActionData
{
    FProgressOperationActionData _base_FProgressOperationActionData;

    FProgressOperationActionData_LeaveOperation()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

class UProgressOperationAction_LeaveOperation : UProgressOperationActionBase
{
    UProgressOperationAction_LeaveOperation()
    {
        super();
        return;
    }
    void OnActivate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout Entity, const FInstancedStruct &inout InstanceData) const
    {
        ::FProgressOperationUtils::LeaveProgressOperation(Runtime.GetOperationEntity(), Entity);
        return;
    }
}

struct FProgressOperationActionData_OperationSucceed : FProgressOperationActionData
{
    FProgressOperationActionData _base_FProgressOperationActionData;

    FProgressOperationActionData_OperationSucceed()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

class UProgressOperationAction_OperationSucceed : UProgressOperationActionBase
{
    UProgressOperationAction_OperationSucceed()
    {
        super();
        return;
    }
    void OnActivate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout Entity, const FInstancedStruct &inout InstanceData) const
    {
        ::FProgressOperationUtils::ProgressOperationSucceed(Runtime.GetOperationEntity());
        return;
    }
}

struct FProgressOperationActionData_ModifyProgressValue : FProgressOperationActionData
{
    FProgressOperationActionData _base_FProgressOperationActionData;
    UPROPERTY()
    float32 ModifyValue;

    FProgressOperationActionData_ModifyProgressValue()
    {
        super();
        this.ModifyValue = 0.0f;
        this.__InitDefaults();
        return;
    }
}

class UProgressOperationAction_ModifyProgressValue : UProgressOperationActionBase
{
    UProgressOperationAction_ModifyProgressValue()
    {
        super();
        return;
    }
    void OnActivate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout Entity, const FInstancedStruct &inout InstanceData) const
    {
        if ((int(Runtime.GetState())) == 1)
        {
            float32 local_11 = Runtime.GetProgressValue();
            FProgressOperationActionData_ModifyProgressValue local_10;
            local_11 = local_11 + local_10.ModifyValue;
            Runtime.SetProgressValue(local_11);
        }
        return;
    }
}

struct FProgressOperationActionData_ModifyProgressMaxValue : FProgressOperationActionData
{
    FProgressOperationActionData _base_FProgressOperationActionData;
    UPROPERTY()
    float32 ModifyValue;

    FProgressOperationActionData_ModifyProgressMaxValue()
    {
        super();
        this.ModifyValue = 0.0f;
        this.__InitDefaults();
        return;
    }
}

class UProgressOperationAction_ModifyProgressMaxValue : UProgressOperationActionBase
{
    UProgressOperationAction_ModifyProgressMaxValue()
    {
        super();
        return;
    }
    void OnActivate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout Entity, const FInstancedStruct &inout InstanceData) const
    {
        if ((int(Runtime.GetState())) == 0 || (int(Runtime.GetState()) == 1))
        {
            float32 local_13 = Runtime.GetProgressMaxValue();
            FProgressOperationActionData_ModifyProgressMaxValue local_12;
            local_13 = local_13 + local_12.ModifyValue;
            Runtime.SetProgressMaxValue(local_13);
        }
        return;
    }
}

struct FProgressOperationActionData_ModifyProgressIncreaseSpeed : FProgressOperationActionData
{
    FProgressOperationActionData _base_FProgressOperationActionData;
    UPROPERTY()
    float32 ModifyValue;

    FProgressOperationActionData_ModifyProgressIncreaseSpeed()
    {
        super();
        this.ModifyValue = 0.0f;
        this.__InitDefaults();
        return;
    }
}

class UProgressOperationAction_ModifyProgressIncreaseSpeed : UProgressOperationActionBase
{
    UProgressOperationAction_ModifyProgressIncreaseSpeed()
    {
        super();
        return;
    }
    void OnActivate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout Entity, const FInstancedStruct &inout InstanceData) const
    {
        float32 local_7 = Runtime.GetProgressIncreseSpeed();
        FProgressOperationActionData_ModifyProgressIncreaseSpeed local_6;
        local_7 = local_7 + local_6.ModifyValue;
        Runtime.SetProgressIncreseSpeed(local_7);
        return;
    }
}

struct FProgressOperationActionData_ModifyProgressTotalTime : FProgressOperationActionData
{
    FProgressOperationActionData _base_FProgressOperationActionData;
    UPROPERTY()
    float32 ModifyValue;

    FProgressOperationActionData_ModifyProgressTotalTime()
    {
        super();
        this.ModifyValue = 0.0f;
        this.__InitDefaults();
        return;
    }
}

class UProgressOperationAction_ModifyProgressTotalTime : UProgressOperationActionBase
{
    UProgressOperationAction_ModifyProgressTotalTime()
    {
        super();
        return;
    }
    void OnActivate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout Entity, const FInstancedStruct &inout InstanceData) const
    {
        FProgressOperationActionData_ModifyProgressTotalTime local_6;
        Runtime.SetTotalTime((Runtime.GetTotalTime() + FFPTime(local_6.ModifyValue)));
        return;
    }
}

struct FProgressOperationActionData_ESMBBTrigger : FProgressOperationActionDataWithTarget
{
    FProgressOperationActionDataWithTarget _base_FProgressOperationActionDataWithTarget;
    UPROPERTY()
    FNameHandle_ESMBBTrigger ESMBBTrigger;
    UPROPERTY()
    FFPTime TriggerValidateTime;

    FProgressOperationActionData_ESMBBTrigger()
    {
        super();
        this.TriggerValidateTime = FFPTime(0.1);
        this.__InitDefaults();
        return;
    }
}

class UProgressOperationAction_ESMBBTrigger : UProgressOperationActionWithTarget
{
    UProgressOperationAction_ESMBBTrigger()
    {
        super();
        return;
    }
    void OnActivate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout Entity, const FInstancedStruct &inout InstanceData) const
    {
        int local_14 = 0;
        Modify local_6;
        FC_ESMTrigger& local_2 = local_6.opCall();
        if (local_2)
        {
            FECSWorldPtr local_16 = Entity.GetWorld();
            Get local_20;
            FESMTriggerUtils::ActivateTrigger(Entity, local_2.Storage, local_14.ESMBBTrigger.Name, local_20.opCall().Time, local_14.TriggerValidateTime, 0);
        }
        return;
    }
}

struct FProgressOperationActionData_AbilitySignal : FProgressOperationActionDataWithTarget
{
    FProgressOperationActionDataWithTarget _base_FProgressOperationActionDataWithTarget;
    UPROPERTY()
    TSoftClassPtr<UEASAbility> AbilityClass;
    UPROPERTY()
    FName AbilitySignal;

    FProgressOperationActionData_AbilitySignal()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

class UProgressOperationAction_AbilitySignal : UProgressOperationActionWithTarget
{
    UProgressOperationAction_AbilitySignal()
    {
        super();
        return;
    }
    void OnActivate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout Entity, const FInstancedStruct &inout InstanceData) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}

struct FProgressOperationActionData_AddBuff : FProgressOperationActionDataWithTarget
{
    FProgressOperationActionDataWithTarget _base_FProgressOperationActionDataWithTarget;
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    float32 OverrideDuration;
    UPROPERTY()
    int StackNum;

    FProgressOperationActionData_AddBuff()
    {
        super();
        this.OverrideDuration = -1.0f;
        this.StackNum = 1;
        this.__InitDefaults();
        return;
    }
}

class UProgressOperationAction_AddBuff : UProgressOperationActionWithTarget
{
    UProgressOperationAction_AddBuff()
    {
        super();
        return;
    }
    void OnActivate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout Entity, const FInstancedStruct &inout InstanceData) const
    {
        FProgressOperationActionData_AddBuff local_6;
        int local_14 = int(local_6.StackNum);
        FECSWorldPtr local_8 = Entity.GetWorld();
        Get local_12;
        FBuffUtils::AddBuff(Entity, local_6.BuffConfig, local_12.opCall().Time, Runtime.GetOperationEntity(), false, local_6.OverrideDuration, local_14, false);
        return;
    }
}

struct FProgressOperationActionData_Removeuff : FProgressOperationActionDataWithTarget
{
    FProgressOperationActionDataWithTarget _base_FProgressOperationActionDataWithTarget;
    UPROPERTY()
    FBuffConfigRef BuffConfig;

    FProgressOperationActionData_Removeuff()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

class UProgressOperationAction_Removeuff : UProgressOperationActionWithTarget
{
    UProgressOperationAction_Removeuff()
    {
        super();
        return;
    }
    void OnActivate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout Entity, const FInstancedStruct &inout InstanceData) const
    {
        int local_6 = 0;
        FECSWorldPtr local_8 = Entity.GetWorld();
        Get local_12;
        FBuffUtils::RemoveBuff(Entity, local_6.BuffConfig, local_12.opCall().Time, EBuffEndType(0));
        return;
    }
}

struct FProgressOperationActionData_ExecueQTESucess : FProgressOperationActionDataWithTarget
{
    FProgressOperationActionDataWithTarget _base_FProgressOperationActionDataWithTarget;

    FProgressOperationActionData_ExecueQTESucess()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

class UProgressOperationAction_ExecueQTESucess : UProgressOperationActionWithTarget
{
    UProgressOperationAction_ExecueQTESucess()
    {
        super();
        return;
    }
    void OnActivate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout Entity, const FInstancedStruct &inout InstanceData) const
    {
        Modify local_4;
        FC_ExecutedInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetbQTESuccess(true);
        }
        return;
    }
}

struct FProgressOperationActionData_CameraShake : FProgressOperationActionDataWithTarget
{
    FProgressOperationActionDataWithTarget _base_FProgressOperationActionDataWithTarget;
    UPROPERTY()
    FDataObjectPtr ConfigRef;

    FProgressOperationActionData_CameraShake()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

class UProgressOperationAction_CameraShake : UProgressOperationActionWithTarget
{
    UProgressOperationAction_CameraShake()
    {
        super();
        return;
    }
    void OnActivate(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout Entity, const FInstancedStruct &inout InstanceData) const
    {
        int local_6 = 0;
        FECSWorldPtr local_10 = Entity.GetWorld();
        Get local_14;
        FCameraUtils::StartCameraShakeForEntity(Entity, local_14.opCall().Time, n"ProgressOperation_CameraShakeAction", local_6.ConfigRef, 1.0f, false);
        return;
    }
}


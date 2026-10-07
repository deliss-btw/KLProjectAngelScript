

struct FESMActivateTargetTriggerInstanceData
{
    UPROPERTY()
    FECSEntity TargetEntity;

    FESMActivateTargetTriggerInstanceData()
    {
        return;
    }
}

class UESMAction_ActivateTargetTrigger : UESMBPBaseSpanAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;
    UPROPERTY()
    FNameHandle_ESMBBTrigger TargetTriggerAtEnter;
    UPROPERTY()
    float32 TargetTriggerAtEnterValidateTime = 0.1f;
    UPROPERTY()
    FNameHandle_ESMBBTrigger TargetTriggerAtNormalExit;
    UPROPERTY()
    float32 TargetTriggerAtNormalExitValidateTime = 0.1f;
    UPROPERTY()
    FNameHandle_ESMBBTrigger TargetTriggerAtInterruptExit;
    UPROPERTY()
    float32 TargetTriggerAtInterruptExitValidateTime = 0.1f;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMActivateTargetTriggerInstanceData);
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FNameHandle_EntityBBVarEntity local_4;
        local_4;
        FECSEntity local_8 = Context.GetEntity().GetBB_Entity(local_4);
        if (local_8.IsValid())
        {
            this.ModifyInstanceData(Context).TargetEntity = local_8;
            if ((!((FName(this.TargetTriggerAtEnter.Name) == NAME_None))))
            {
                FESMTriggerUtils::ActivateESMTrigger(local_8, this.TargetTriggerAtEnter.Name, Time.WorldTime, FFPTime(this.TargetTriggerAtEnterValidateTime), 0);
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_4;
        if (local_4.IsValid())
        {
            Modify local_10;
            FC_ESMTrigger& local_12 = local_10.opCall();
            if (local_12)
            {
                if (Time.IsEnd())
                {
                    if ((!((FName(this.TargetTriggerAtNormalExit.Name) == NAME_None))))
                    {
                        FESMTriggerUtils::ActivateTrigger(local_4, local_12.Storage, this.TargetTriggerAtNormalExit.Name, Time.WorldTime, FFPTime(this.TargetTriggerAtNormalExitValidateTime), 0);
                    }
                }
                else
                {
                    if ((!((FName(this.TargetTriggerAtInterruptExit.Name) == NAME_None))))
                    {
                        FESMTriggerUtils::ActivateTrigger(local_4, local_12.Storage, this.TargetTriggerAtInterruptExit.Name, Time.WorldTime, FFPTime(this.TargetTriggerAtInterruptExitValidateTime), 0);
                    }
                }
            }
        }
        return;
    }
    FESMActivateTargetTriggerInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMActivateTargetTriggerInstanceData __r;
        return __r;
    }
    FESMActivateTargetTriggerInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMActivateTargetTriggerInstanceData __r;
        return __r;
    }
}


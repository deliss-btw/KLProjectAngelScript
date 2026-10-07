
enum EProgressOperationActionTime
{
    Invalid,
    Begin,
    ProgressDone,
    Success,
    TimeOut,
    Break,
    ParticipantJoin,
    ParticipantLeave,
    ParticipantSucess,
    ParticipantFaliure,
}

enum EProgressOperationState
{
    Begin,
    InProgress,
    ProgressDone,
    Success,
    TimeOut,
    Break,
}

enum EProgressOperationInputType
{
    Initiator,
    Participant,
    InitiatorAndParticipant,
}

enum EProgressOperationBaseType
{
    SimpleProgress,
    SingleRangeProgress,
    InputPushProgress,
}


struct FProgressOperationAction
{
    UPROPERTY()
    FInstancedStruct InstanceData;

    FProgressOperationAction()
    {
        return;
    }
    void ActivateAction(FC_ProgressOperationRuntime &inout Runtime, const FECSEntity &inout TriggerEntity) const
    {
        0.ActionClass.GetDefaultObject().Activate(Runtime, TriggerEntity, this);
        return;
    }
}

struct FProgressOperationInputAction
{
    UPROPERTY()
    EProgressOperationInputType InputType = EProgressOperationInputType(2);
    UPROPERTY()
    uint8 ResponseState = (2 != 0);
    UPROPERTY()
    UESMInputTriggerAsset InputTrigger = nullptr;
    UPROPERTY()
    TArray<FProgressOperationAction> Actions;


}

struct FProgressOperationActionArray
{
    UPROPERTY()
    TArray<FProgressOperationAction> Actions;

    FProgressOperationActionArray()
    {
        return;
    }
}

struct FProgressOperationViewData
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    EProgressOperationState State = EProgressOperationState(0);
    UPROPERTY()
    float32 CurValue = 0.0f;
    UPROPERTY()
    float32 MaxValue = 100.0f;
    UPROPERTY()
    float32 CurTime = 0.0f;
    UPROPERTY()
    float32 TotalTime = 0.0f;
    UPROPERTY()
    int MemberNum = 1;
    UPROPERTY()
    bool bIsInitiator = false;
    UPROPERTY()
    bool bIsLeave = false;


}

UCLASS(Abstract)
class UProgressOperationBase : UObject
{
    UProgressOperationBase()
    {
        return;
    }
    bool NeedEndOperation(const FC_ProgressOperationRuntime &inout Runtime) const
    {
        return false;
    }
    void Tick(FC_ProgressOperationRuntime &inout Runtime, const FFPTime &inout DeltaTime) const
    {
        return;
    }
}

class UProgressOperation_SimpleProgress : UProgressOperationBase
{
    UProgressOperation_SimpleProgress()
    {
        super();
        return;
    }
    bool NeedEndOperation(const FC_ProgressOperationRuntime &inout Runtime) const
    {
        if (false)
        {
            return (int(Runtime.GetState())) >= 3 || (int(Runtime.GetState()) == 2);
        }
        else
        {
            int local_4 = int(Runtime.GetState());
            return (local_4 >= 3);
        }
    }
    void Tick(FC_ProgressOperationRuntime &inout Runtime, const FFPTime &inout DeltaTime) const
    {
        const FProgressOperationConfig& local_2;
        if (int(Runtime.GetState()) == 0)
        {
            FProgressOperationActionArray local_10;
            int local_11 = 1;
            if (local_2.Actions.Find(local_10, local_11))
            {
                for (auto& local_26 : local_10.Actions)
                {
                    local_26.ActivateAction(Runtime, Runtime.GetInitiatorEntity());
                }
            }
        }
        EProgressOperationState local_27;
        local_27 = Runtime.GetState();
        Runtime.SetState(EProgressOperationState(Runtime.GetNextState()));
        if (int(Runtime.GetState()) == 1)
        {
            FFPTime local_30 = (Runtime.GetCurTime() + DeltaTime);
            Runtime.SetCurTime(local_30);
            Runtime.SetProgressValue(Runtime.GetProgressValue() + (Runtime.GetProgressIncreseSpeed() * float32(DeltaTime.ToSeconds())));
            Runtime.SetProgressValue(FMath::Clamp(Runtime.GetProgressValue(), 0.0f, Runtime.GetProgressMaxValue()));
            if (Runtime.GetProgressValue() >= Runtime.GetProgressMaxValue())
            {
                EProgressOperationState local_3_2 = EProgressOperationState(2);
                Runtime.SetState(EProgressOperationState(local_3_2));
            }
            else
            {
                if (FFPTime(Runtime.GetCurTime()).opCmp(Runtime.GetTotalTime()) >= 0)
                {
                    Runtime.SetState(EProgressOperationState(EProgressOperationState(4)));
                }
            }
        }
        if (int(local_27) < 2 && (int(Runtime.GetState()) == 2))
        {
            bool local_37;
            local_37 = local_2.bAutoSuccessOnProgressDone;
            if (local_37)
            {
                Runtime.SetState(EProgressOperationState(EProgressOperationState(3)));
            }
            FProgressOperationActionArray local_10;
            int local_11_2 = 2;
            if (local_2.Actions.Find(local_10, local_11_2))
            {
                for (auto& local_26 : local_10.Actions)
                {
                    local_26.ActivateAction(Runtime, Runtime.GetInitiatorEntity());
                }
            }
        }
        if (int(Runtime.GetState()) >= 3)
        {
            bool local_37;
            int local_38;
            FProgressOperationActionArray local_10;
            int local_11_3 = 0;
            local_38 = local_11_3;
            switch (int(Runtime.GetState()))
            {
            case 3:
            {
                local_11_3 = 3;
                local_38 = local_11_3;
                break;
            }
            case 4:
            {
                local_11_3 = 4;
                local_38 = local_11_3;
                break;
            }
            case 5:
            {
                local_11_3 = 5;
                local_38 = local_11_3;
                break;
            }
            }
            int local_4 = local_38;
            if (local_4 == 0)
            {
                local_37 = false;
            }
            else
            {
                local_37 = local_2.Actions.Find(local_10, local_38);
            }
            if (local_37)
            {
                for (auto& local_26 : local_10.Actions)
                {
                    local_26.ActivateAction(Runtime, Runtime.GetInitiatorEntity());
                }
            }
        }
        return;
    }
}

class UProgressOperation_SingleRangeProgress : UProgressOperationBase
{
    UProgressOperation_SingleRangeProgress()
    {
        super();
        return;
    }
    bool NeedEndOperation(const FC_ProgressOperationRuntime &inout Runtime) const
    {
        if (false)
        {
            return (int(Runtime.GetState())) >= 3 || (int(Runtime.GetState()) == 2);
        }
        else
        {
            int local_4 = int(Runtime.GetState());
            return (local_4 >= 3);
        }
    }
    void Tick(FC_ProgressOperationRuntime &inout Runtime, const FFPTime &inout DeltaTime) const
    {
        const FProgressOperationConfig& local_2;
        if (int(Runtime.GetState()) == 0)
        {
            FProgressOperationActionArray local_10;
            int local_11 = 1;
            if (local_2.Actions.Find(local_10, local_11))
            {
                for (auto& local_26 : local_10.Actions)
                {
                    local_26.ActivateAction(Runtime, Runtime.GetInitiatorEntity());
                }
            }
        }
        EProgressOperationState local_27;
        local_27 = Runtime.GetState();
        Runtime.SetState(EProgressOperationState(Runtime.GetNextState()));
        if (int(Runtime.GetState()) == 1)
        {
            FFPTime local_30 = (Runtime.GetCurTime() + DeltaTime);
            Runtime.SetCurTime(local_30);
            float32 local_33 = Runtime.GetProgressValue();
            float32 local_34 = Runtime.GetProgressIncreseSpeed();
            float32 local_35 = float32(DeltaTime.ToSeconds());
            local_34 = local_34 * local_35;
            Runtime.SetProgressValue(local_33 + local_34);
            Runtime.SetProgressValue(FMath::Clamp(Runtime.GetProgressValue(), 0.0f, Runtime.GetProgressMaxValue()));
            if (local_2.bInputAcceptDetermin && (Runtime.GetProgressValueWhenAccurateInput() >= 0.0f))
            {
                local_35 = Runtime.GetProgressValueWhenAccurateInput() / Runtime.GetProgressMaxValue();
                if (local_35 >= local_2.RangeStartRatio && (local_35 <= local_2.RangeEndRatio))
                {
                    EProgressOperationState local_3_2 = EProgressOperationState(2);
                    Runtime.SetState(EProgressOperationState(local_3_2));
                }
                else
                {
                    Runtime.SetState(EProgressOperationState(EProgressOperationState(5)));
                }
            }
            else
            {
                if (!(local_2.bInputAcceptDetermin))
                {
                    float32 local_38 = Runtime.GetProgressValue() / Runtime.GetProgressMaxValue();
                    if (local_38 >= local_2.RangeStartRatio && (local_38 <= local_2.RangeEndRatio))
                    {
                        Runtime.SetState(EProgressOperationState(EProgressOperationState(2)));
                    }
                    else
                    {
                        if (FFPTime(Runtime.GetCurTime()).opCmp(Runtime.GetTotalTime()) >= 0)
                        {
                            Runtime.SetState(EProgressOperationState(EProgressOperationState(4)));
                        }
                    }
                }
                else
                {
                    if (FFPTime(Runtime.GetCurTime()).opCmp(Runtime.GetTotalTime()) >= 0)
                    {
                        Runtime.SetState(EProgressOperationState(EProgressOperationState(4)));
                    }
                }
            }
        }
        if (int(local_27) < 2 && (int(Runtime.GetState()) == 2))
        {
            bool local_6;
            local_6 = local_2.bAutoSuccessOnProgressDone;
            if (local_6)
            {
                Runtime.SetState(EProgressOperationState(EProgressOperationState(3)));
            }
            FProgressOperationActionArray local_10;
            int local_11_2 = 2;
            if (local_2.Actions.Find(local_10, local_11_2))
            {
                for (auto& local_26 : local_10.Actions)
                {
                    local_26.ActivateAction(Runtime, Runtime.GetInitiatorEntity());
                }
            }
        }
        if (int(Runtime.GetState()) >= 3)
        {
            bool local_6;
            int local_39;
            FProgressOperationActionArray local_10;
            int local_11_3 = 0;
            local_39 = local_11_3;
            switch (int(Runtime.GetState()))
            {
            case 3:
            {
                local_11_3 = 3;
                local_39 = local_11_3;
                break;
            }
            case 4:
            {
                local_11_3 = 4;
                local_39 = local_11_3;
                break;
            }
            case 5:
            {
                local_11_3 = 5;
                local_39 = local_11_3;
                break;
            }
            }
            if (local_39 == 0)
            {
                local_6 = false;
            }
            else
            {
                local_6 = local_2.Actions.Find(local_10, local_39);
            }
            if (local_6)
            {
                for (auto& local_26 : local_10.Actions)
                {
                    local_26.ActivateAction(Runtime, Runtime.GetInitiatorEntity());
                }
            }
        }
        return;
    }
}

class UProgressOperation_InputPushProgress : UProgressOperationBase
{
    UProgressOperation_InputPushProgress()
    {
        super();
        return;
    }
    bool NeedEndOperation(const FC_ProgressOperationRuntime &inout Runtime) const
    {
        if (false)
        {
            return (int(Runtime.GetState())) >= 3 || (int(Runtime.GetState()) == 2);
        }
        else
        {
            int local_4 = int(Runtime.GetState());
            return (local_4 >= 3);
        }
    }
    void Tick(FC_ProgressOperationRuntime &inout Runtime, const FFPTime &inout DeltaTime) const
    {
        const FProgressOperationConfig& local_2;
        if (int(Runtime.GetState()) == 0)
        {
            FProgressOperationActionArray local_10;
            int local_11 = 1;
            if (local_2.Actions.Find(local_10, local_11))
            {
                for (auto& local_26 : local_10.Actions)
                {
                    local_26.ActivateAction(Runtime, Runtime.GetInitiatorEntity());
                }
            }
        }
        EProgressOperationState local_27;
        local_27 = Runtime.GetState();
        Runtime.SetState(EProgressOperationState(Runtime.GetNextState()));
        if (int(Runtime.GetState()) == 1)
        {
            FFPTime local_30 = (Runtime.GetCurTime() + DeltaTime);
            Runtime.SetCurTime(local_30);
            Runtime.SetProgressValue(Runtime.GetProgressValue() + (Runtime.GetProgressIncreseSpeed() * float32(DeltaTime.ToSeconds())));
            Runtime.SetProgressValue(FMath::Clamp(Runtime.GetProgressValue(), 0.0f, Runtime.GetProgressMaxValue()));
            Runtime.SetProgressValue(Runtime.GetProgressValue() + ((local_2.ReversePushProgressForceByPos.GetFloatValue(Runtime.GetProgressValue(), 0.0f) * local_2.ReversePushProgressForceByTime.GetFloatValue(float32(Runtime.GetCurTime().ToSeconds()), 0.0f)) * float32(DeltaTime.ToSeconds())));
            if (Runtime.GetProgressValue() >= Runtime.GetProgressMaxValue())
            {
                EProgressOperationState local_3_2 = EProgressOperationState(2);
                Runtime.SetState(EProgressOperationState(local_3_2));
            }
            else
            {
                if (Runtime.GetProgressValue() < 0.0f)
                {
                    Runtime.SetState(EProgressOperationState(EProgressOperationState(5)));
                }
                else
                {
                    if (FFPTime(Runtime.GetCurTime()).opCmp(Runtime.GetTotalTime()) >= 0)
                    {
                        Runtime.SetState(EProgressOperationState(EProgressOperationState(4)));
                    }
                }
            }
        }
        if (int(local_27) < 2 && (int(Runtime.GetState()) == 2))
        {
            if (local_2.bAutoSuccessOnProgressDone)
            {
                Runtime.SetState(EProgressOperationState(EProgressOperationState(3)));
            }
            FProgressOperationActionArray local_10;
            int local_11_2 = 2;
            if (local_2.Actions.Find(local_10, local_11_2))
            {
                for (auto& local_26 : local_10.Actions)
                {
                    local_26.ActivateAction(Runtime, Runtime.GetInitiatorEntity());
                }
            }
        }
        if (int(Runtime.GetState()) >= 3)
        {
            int local_39;
            FProgressOperationActionArray local_10;
            int local_11_3 = 0;
            local_39 = local_11_3;
            switch (int(Runtime.GetState()))
            {
            case 3:
            {
                local_11_3 = 3;
                local_39 = local_11_3;
                break;
            }
            case 4:
            {
                local_11_3 = 4;
                local_39 = local_11_3;
                break;
            }
            case 5:
            {
                local_11_3 = 5;
                local_39 = local_11_3;
                break;
            }
            }
            if (!(local_39 == 0) && local_2.Actions.Find(local_10, local_39))
            {
                for (auto& local_26 : local_10.Actions)
                {
                    local_26.ActivateAction(Runtime, Runtime.GetInitiatorEntity());
                }
            }
        }
        return;
    }
}


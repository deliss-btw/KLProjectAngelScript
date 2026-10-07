

class US_AutoTestSystemAS : UECSScriptSystem
{
    US_AutoTestSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_CallServerFunction(const FCE_ServerFuncCallEvent &inout Event) const
    {
        XLog(ELog(50), FString().Append("Job_CallServerFunction,  ExecParamJsonStr: ").Append(Event.ExecParamJsonStr));
        FJsonObject local_10;
        bool local_12 = local_10.LoadFromString(Event.ExecParamJsonStr);
        if (!(local_12))
        {
            this.SendErrorRspEvent(Event, "ParseError", "ExecParamJsonStr parse failed.");
            return;
        }
        FJsonObject local_16;
        FString local_20;
        FString local_24;
        FJsonObject local_28;
        if (!(local_10.TryGetStringField("Namespace", local_20)))
        {
            this.SendErrorRspEvent(Event, "ParseError", "Namespace deserialize failed.");
            return;
        }
        if (!(local_10.TryGetStringField("FunctionName", local_24)))
        {
            this.SendErrorRspEvent(Event, "ParseError", "FunctionName deserialize failed.");
            return;
        }
        if (!(local_10.TryGetObjectField("ArgListWrapper", local_28)))
        {
            this.SendErrorRspEvent(Event, "ParseError", "ArgListWrapper deserialize failed.");
            return;
        }
        FJsonArray local_32;
        if (!(local_28.TryGetArrayField("ArgList", local_32)))
        {
            this.SendErrorRspEvent(Event, "ParseError", "ArgListJsonArray deserialize failed.");
            return;
        }
        local_16.SetStringField("FunctionName", ((local_20 + "::") + local_24));
        local_16.SetArrayField("Arguments", local_32);
        FJsonObject local_44 = AngelscriptUtils::DynamicCall(local_16);
        FString local_48;
        if (local_44.IsValid() && local_44.TryGetStringField("Error", local_48) && !(local_48.IsEmpty()))
        {
            this.SendErrorRspEvent(Event, "EXEC_FAILED", local_48);
            return;
        }
        this.SendSuccessRspEvent(Event, local_44);
        return;
    }
    UFUNCTION()
    void Job_GetServerFunctionReturn(const FCE_ServerFuncReturnEvent &inout Event) const
    {
        FCS_AutoTestJobPool local_8;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        if (int(local_8.LatestEventId) >= int(Event._base_FECSEvent))
        {
            return;
        }
        XLog(ELog(50), FString().Append("Job_GetServerFunctionReturn,  JobId: ").Append(Event.JobId).Append(", OutputJsonStr: ").Append(Event.OutputJsonStr));
        local_8.JobMap.Add(Event.JobId, Event.OutputJsonStr);
        local_8.LatestEventId = int(Event._base_FECSEvent);
        return;
    }
    UFUNCTION()
    void ServerJob_NotifyGTCFinished(const FCE_GameTestFinished &inout Event) const
    {
        int local_8 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        if (local_8.GTCMap.Contains(Event.GameTestId))
        {
            local_8.GTCMap[Event.GameTestId].IsFinished = true;
        }
        return;
    }
    void SendErrorRspEvent(const FCE_ServerFuncCallEvent &inout Event, const FString &inout ErrorCode, const FString &inout ErrorMsg = "") const
    {
        FJsonObject local_4;
        int local_20 = 0;
        local_4.SetStringField("error_code", ErrorCode);
        local_4.SetStringField("error_message", ErrorMsg);
        local_4.SetBoolField("success", false);
        FECSWorldPtr local_8 = Event.Sender.GetWorld();
        local_20.JobId = Event.JobId;
        local_20.OutputJsonStr = local_4.SaveToString(false);
        return;
    }
    void SendSuccessRspEvent(const FCE_ServerFuncCallEvent &inout Event, const FJsonObject &inout Result) const
    {
        FJsonObject local_4;
        int local_32 = 0;
        local_4.SetBoolField("success", true);
        bool local_6 = false;
        float local_8 = 0.0;
        FString local_14;
        FJsonArray local_18;
        FJsonObject local_22;
        if (Result.TryGetObjectField("Return", local_22))
        {
            local_4.SetObjectField("data", local_22);
        }
        else
        {
            if (Result.TryGetArrayField("Return", local_18))
            {
                local_4.SetArrayField("data", local_18);
            }
            else
            {
                if (Result.TryGetNumberField("Return", local_8))
                {
                    local_4.SetNumberField("data", local_8);
                }
                else
                {
                    if (Result.TryGetStringField("Return", local_14))
                    {
                        local_4.SetStringField("data", local_14);
                    }
                    else
                    {
                        if (Result.TryGetBoolField("Return", local_6))
                        {
                            local_4.SetBoolField("data", local_6);
                        }
                    }
                }
            }
        }
        FFPTime local_28 = FFPTime(-1);
        local_32.JobId = Event.JobId;
        local_32.OutputJsonStr = local_4.SaveToString(false);
        return;
    }
    UFUNCTION()
    void Run_Job_CallServerFunction() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ServerFuncCallEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ServerFuncCallEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_CallServerFunction(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_GetServerFunctionReturn() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ServerFuncReturnEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(3)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ServerFuncReturnEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_GetServerFunctionReturn(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_NotifyGTCFinished() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_GameTestFinished> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_GameTestFinished& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_NotifyGTCFinished(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


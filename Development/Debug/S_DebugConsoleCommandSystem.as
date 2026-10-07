

class US_DebugConsoleCommandSystemAS : UECSScriptSystem
{
    US_DebugConsoleCommandSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void ServerJob_DynamicCall(const FCE_DebugServerConsoleCommandEvent &inout Event) const
    {
        XLog(ELog(0), FString().Append("ServerJob_DynamicCall,  FunctionName: ").Append(Event.FunctionName).Append(", Arguments: ").Append(Event.ArgumentsStr));
        FJsonObject local_10;
        FString local_14 = FString().AppendChar(int16(123)).Append("\"FunctionName\": \"").Append(Event.FunctionName).Append("\", \"Arguments\": ").Append(Event.ArgumentsStr).AppendChar(int16(125));
        XLog(ELog(0), FString().Append("ExecParamJsonStr: ").Append(local_14));
        bool local_18 = local_10.LoadFromString(local_14);
        if (!(local_18))
        {
            XWarning(ELog(0), "ExecParamJsonStr parse failed.");
            return;
        }
        FJsonObject local_26 = AngelscriptUtils::DynamicCall(local_10);
        FString local_30;
        if (local_26.IsValid() && local_26.TryGetStringField("Error", local_30) && !(local_30.IsEmpty()))
        {
            XWarning(ELog(0), FString().Append("EXEC_FAILED: ").Append(local_30));
            return;
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DynamicCall() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DebugServerConsoleCommandEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DebugServerConsoleCommandEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DynamicCall(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


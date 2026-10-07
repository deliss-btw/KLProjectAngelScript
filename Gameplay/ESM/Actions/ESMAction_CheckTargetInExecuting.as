

class UESMAction_CheckTargetInExecuting : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;
    UPROPERTY()
    FName TriggerWhenCheckFailed;

    UESMAction_CheckTargetInExecuting()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(this.TriggerWhenCheckFailed.IsNone()) && !(this.CheckTargetInExecuting(Context)))
        {
            XWarning(ELog(42), FString().Append("[CheckTargetInExecuting] Entity[").Append(Context.GetEntity().GetIdValue()).Append("] з›®ж ‡е·ІйЂЂе‡єе¤„е†ізЉ¶жЂЃпјЊејєе€¶и§¦еЏ‘йЂЂе‡є Trigger=").Append(this.TriggerWhenCheckFailed));
            FESMTriggerUtils::ActivateESMTrigger(Context.GetEntity(), this.TriggerWhenCheckFailed, Time.WorldTime, FFPTime(0.1), 0);
        }
        return;
    }
    bool CheckTargetInExecuting(const FESMContext &inout Context) const
    {
        int local_20 = 0;
        FNameHandle_EntityBBVarEntity local_4;
        local_4;
        FECSEntity local_8 = Context.GetEntity().GetBB_Entity(local_4);
        if (!(local_8.IsValid()))
        {
            return false;
        }
        if (!(local_20) || (int(local_20.GetExecutionState()) == 0))
        {
            return false;
        }
        return true;
    }
}


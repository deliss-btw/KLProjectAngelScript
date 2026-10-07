

// NOTE: class defaults are not authored in this module: FMissionAction_RequestStartCommission (default scalar field FMissionActionBase.ActionType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FMissionAction_RequestStartCommission : FMissionActionBase
{
    FMissionActionBase _base_FMissionActionBase;
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> Commission;
    UPROPERTY()
    FFPTime DelayTime;
    UPROPERTY()
    FFPTime TriggerTime;
    UPROPERTY()
    bool bScheduled;

    FMissionAction_RequestStartCommission()
    {
        this.DelayTime = FFPTime(0.2);
        this.bScheduled = false;
        this.__InitDefaults();
        return;
    }
    EMissionActionStatus TickAction_Implementation(const FMissionActionContext &inout Context)
    {
        if (!(this.Commission.IsSet()))
        {
            XError(ELog(63), FString().Append("Commission has not been set, RequestStartCommission failed."));
            return EMissionActionStatus(4);
        }
        if (!(this.bScheduled))
        {
            this.TriggerTime = (FFPTime(ECS::GetRuntimeInfo().Time) + this.DelayTime);
            this.bScheduled = true;
        }
        if (FFPTime(ECS::GetRuntimeInfo().Time).opCmp(this.TriggerTime) < 0)
        {
            return EMissionActionStatus(2);
        }
        FName local_15;
        local_15.GetDataName();
        XLog(ELog(63), FString().Append("RequestStartCommission, Commission=").Append(local_15));
        if (!(::UScriptAsToCppModelFunctionRouter::Get().OnRequestStartCommission.Execute(this.Commission)))
        {
            XError(ELog(63), FString().Append("Request start commission failed"));
            this.bScheduled = false;
            return EMissionActionStatus(4);
        }
        this.bScheduled = false;
        return EMissionActionStatus(3);
    }
}

struct FMissionAction_RequestLeaveCurrentLevel : FMissionActionBase
{
    FMissionActionBase _base_FMissionActionBase;
    UPROPERTY()
    FFPTime DelayTime;
    UPROPERTY()
    FFPTime TriggerTime;
    UPROPERTY()
    bool bScheduled;

    FMissionAction_RequestLeaveCurrentLevel()
    {
        this.DelayTime = FFPTime(0.5);
        this.bScheduled = false;
        this.__InitDefaults();
        return;
    }
    EMissionActionStatus TickAction_Implementation(const FMissionActionContext &inout Context)
    {
        if (!(this.bScheduled))
        {
            this.TriggerTime = (FFPTime(ECS::GetRuntimeInfo().Time) + this.DelayTime);
            this.bScheduled = true;
        }
        if (FFPTime(ECS::GetRuntimeInfo().Time).opCmp(this.TriggerTime) < 0)
        {
            return EMissionActionStatus(2);
        }
        FECSEntity local_12 = ::FASCommonUtils::GetLocalPlayerProxy();
        if (!(local_12.IsValid()))
        {
            XError(ELog(63), FString().Append("PlayerEntity is invalid, RequestLeaveCurrentLevel failed."));
            this.bScheduled = false;
            return EMissionActionStatus(4);
        }
        if (!(::FLevelUtils::GetCurrentLevelInfoConfig(nullptr).IsSet()))
        {
            XError(ELog(63), FString().Append("CurrentLevelInfoConfig is empty, RequestLeaveCurrentLevel failed."));
            this.bScheduled = false;
            return EMissionActionStatus(4);
        }
        ELevelType local_72;
        ELevelType local_71 = local_72;
        if ((int(local_71) != 3 && (int(local_71) != 6) && (int(local_71) != 5)))
        {
            XError(ELog(63), FString().Append("Current level type is not supported for leaving, RequestLeaveCurrentLevel failed."));
            this.bScheduled = false;
            return EMissionActionStatus(4);
        }
        XLog(ELog(63), FString().Append("RequestLeaveCurrentLevel, PlayerEntity=").Append(local_12));
        ::FGameConnectionUtils::UICallLeaveCurrentLevel(local_12);
        this.bScheduled = false;
        return EMissionActionStatus(3);
    }
}


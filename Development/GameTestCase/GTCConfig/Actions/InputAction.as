

// NOTE: class defaults are not authored in this module: FGTCInputAction (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FSimulatedInput
{
    UPROPERTY()
    FName Name;
    UPROPERTY()
    FVector Value = FVector::ZeroVector;
    UPROPERTY()
    float32 TimeOffset = 0.0f;


    FInputData GetCopyData(const FFPTime &inout Time)
    {
        FInputData local_10;
        local_10.Name = this;
        local_10.Value = this.Value;
        local_10.Time = Time;
        return local_10;
    }
}

struct FGTCInputAction : FGTCAction
{
    FGTCAction _base_FGTCAction;
    UPROPERTY()
    bool bIsLocalInput;
    UPROPERTY()
    TArray<FSimulatedInput> InputGroup;

    FGTCInputAction()
    {
        this.bIsLocalInput = false;
        this.__InitDefaults();
        return;
    }
    FInputPacket& GetInputPacket(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        int local_10 = 0;
        int local_18 = 0;
        if (this.bIsLocalInput)
        {
            FECSWorldPtr local_4 = ECS::GetECSWorld();
            return local_10.GetOrAddPacket(int(Context.LocalTime.Frame));
        }
        else
        {
            return local_18.GetOrAddPacket(int(Context.FixedTime.Frame));
        }
    }
    void Execute_Implementation(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        int local_30 = 0;
        int local_46 = 0;
        if (ECS::GetRuntimeInfo().IsServer && this.bIsLocalInput)
        {
            return;
        }
        if (ECS::GetRuntimeInfo().IsClient && !(this.bIsLocalInput))
        {
            return;
        }
        int local_4 = int(this.ActionType);
        this.GetInputPacket(TargetEntity, Context);
        for (auto& local_22 : this.InputGroup)
        {
            if (this.bIsLocalInput)
            {
                FECSWorldPtr::Modify<FCS_InputLocal> local_28 = FECSWorldPtr::Modify<FCS_InputLocal>(ECS::GetECSWorld());
                local_30.GetOrAddPacket(int(Context.LocalTime.Frame)).ReplaceOrAdd(local_22.GetCopyData(Context.LocalTime.Time));
                continue;
            }
            local_46.GetOrAddPacket(int(Context.FixedTime.Frame)).ReplaceOrAdd(local_22.GetCopyData(Context.FixedTime.Time));
        }
        return;
    }
    void OnFinish_Implementation(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        if (ECS::GetRuntimeInfo().IsServer && this.bIsLocalInput)
        {
            return;
        }
        if (ECS::GetRuntimeInfo().IsClient && !(this.bIsLocalInput))
        {
            return;
        }
        FInputPacket& local_4 = this.GetInputPacket(TargetEntity, Context);
        for (auto& local_18 : this.InputGroup)
        {
            FInputData local_28 = this.bIsLocalInput ? local_18.GetCopyData(Context.LocalTime.Time) : local_18.GetCopyData(Context.FixedTime.Time);
            FVector local_44;
            local_28.Value = local_44;
            local_4.ReplaceOrAdd(local_28);
        }
        return;
    }
}


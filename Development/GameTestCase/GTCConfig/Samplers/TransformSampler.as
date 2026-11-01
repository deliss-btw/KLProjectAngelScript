struct FGTCTimeVector : FGTCSampleRecord
{
    FGTCSampleRecord _base_FGTCSampleRecord;
    UPROPERTY()
    FVector Vector;

    FGTCTimeVector()
    {
        return;
    }
}

struct FGTCTransformSampleResult : FGTCSampleResult
{
    FGTCSampleResult _base_FGTCSampleResult;
    UPROPERTY()
    FString EntityName;
    UPROPERTY()
    FTransform BeginTransform;
    UPROPERTY()
    TArray<FGTCTimeVector> Positions;
    UPROPERTY()
    TArray<FGTCTimeVector> Rotations;

    FGTCTransformSampleResult()
    {
        return;
    }
    void Clear()
    {
        this.bIsValid = true;
        this.EntityName = "";
        FTransform local_28;
        this.BeginTransform = local_28;
        this.Positions.Empty(0);
        this.Rotations.Empty(0);
        return;
    }
}

struct FGTCTransformSampler : FGTCSampler
{
    FGTCSampler _base_FGTCSampler;
    UPROPERTY()
    bool bIsRelative;
    UPROPERTY()
    bool bSamplePosition;
    UPROPERTY()
    bool bSampleRotation;
    UPROPERTY()
    FGTCBoxValidator PositionValidatorConfig;
    UPROPERTY()
    TMap<FString, FGTCTransformSampleResult> SampleResultMap;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FGTCTransformSampler.Get());

    FGTCTransformSampler()
    {
        this.bIsRelative = true;
        this.bSamplePosition = true;
        this.bSampleRotation = false;
        this.ActionType = EGTCActionType(2);
        this.__InitDefaults();
        return;
    }
    FGTCTransformSampleResult& GetSampleResult()
    {
        if (ECS::GetRuntimeInfo().IsClient)
        {
            return this.SampleResultMap.FindOrAdd("Client");
        }
        return this.SampleResultMap.FindOrAdd("Server");
    }
    void OnStart_Implementation(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        int local_8 = 0;
        FGTCTransformSampleResult& local_2 = this.GetSampleResult();
        local_2.Clear();
        local_2.BeginTransform = local_8.ToFTransform();
        local_2.EntityName = TargetEntity.GetEntityName().ToString();
        return;
    }
    void Execute_Implementation(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        Has local_4;
        int local_22 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        FGTCRecordTimeStamp local_14 = Super::GetCurTimeStamp(Context);
        FGTCTransformSampleResult& local_16 = this.GetSampleResult();
        if (this.bSamplePosition)
        {
            FVector local_46;
            if (this.bIsRelative)
            {
                local_46 = (FVector(local_22.GetPosition()) - local_16.BeginTransform.GetLocation());
            }
            else
            {
                local_46 = local_22.GetPosition();
            }
            if (local_16.Positions.Num() > 0 && (local_16.Positions.Last(0)._base_FGTCSampleRecord.LocalFrame == int(local_14.LocalFrame)))
            {
                FGTCTimeVector& local_58 = local_16.Positions.Last(0);
                local_58._base_FGTCSampleRecord = local_14;
                local_58.Vector = local_46;
            }
            else
            {
                FGTCTimeVector local_68;
                local_68._base_FGTCSampleRecord = Super::GetCurTimeStamp(Context);
                local_68.Vector = local_46;
                local_16.Positions.Add(local_68);
            }
        }
        if (this.bSampleRotation)
        {
            FRotator local_80 = local_16.BeginTransform.Rotator();
            FRotator local_74 = local_22.GetRotation().Rotator();
            FRotator local_98;
            if (this.bIsRelative)
            {
                local_98 = (local_74 - local_80);
            }
            else
            {
                local_98 = local_74;
            }
            if ((local_98.Yaw - local_80.Yaw) > 180.0)
            {
                local_98.Yaw = (local_98.Yaw - 360.0);
            }
            else
            {
                if ((local_98.Yaw - local_80.Yaw) < -180.0)
                {
                    local_98.Yaw = (local_98.Yaw + 360.0);
                }
            }
            FVector local_28 = local_98.Euler();
            if (local_16.Rotations.Num() > 0 && (local_16.Rotations.Last(0)._base_FGTCSampleRecord.LocalFrame == int(local_14.LocalFrame)))
            {
                FGTCTimeVector& local_58_2 = local_16.Rotations.Last(0);
                local_58_2._base_FGTCSampleRecord = local_14;
                local_58_2.Vector = local_28;
                return;
            }
            FGTCTimeVector local_68;
            local_68._base_FGTCSampleRecord = Super::GetCurTimeStamp(Context);
            local_68.Vector = local_28;
            local_16.Rotations.Add(local_68);
        }
        return;
    }
    bool ValidateSampleResult()
    {
        FGTCTransformSampleResult& local_2 = this.GetSampleResult();
        for (auto& local_18 : local_2.Positions)
        {
            if (!(this.PositionValidatorConfig.Validate(local_18.Vector)))
            {
                return false;
            }
        }
        return true;
    }
    bool TryCollectResult(const int64 StartTimeTicks, FString &out Result)
    {
        FString local_4;
        Result = local_4;
        FGTCTransformSampleResult& local_6 = this.GetSampleResult();
        for (auto& local_22 : local_6.Positions)
        {
            local_22._base_FGTCSampleRecord.TimeTicks = int64((FTimespan((local_22._base_FGTCSampleRecord.TimeTicks - StartTimeTicks)).GetTotalMilliseconds()));
        }
        for (auto& local_22 : local_6.Rotations)
        {
            local_22._base_FGTCSampleRecord.TimeTicks = int64((FTimespan((local_22._base_FGTCSampleRecord.TimeTicks - StartTimeTicks)).GetTotalMilliseconds()));
        }
        if (this.bNeedValidation)
        {
            local_6.bIsValid = this.ValidateSampleResult();
        }
        return FJsonObjectConverter::UStructToJsonObjectString(local_6, Result, 0, 0, 0, true);
    }
}


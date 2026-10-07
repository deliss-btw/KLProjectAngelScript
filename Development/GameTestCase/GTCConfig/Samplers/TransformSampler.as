

// NOTE: class defaults are not authored in this module: FGTCTransformSampler (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FGTCTimeVector : FGTCSampleRecord
{
    FGTCSampleRecord _base_FGTCSampleRecord;
    UPROPERTY()
    FVector Vector;

    FGTCTimeVector()
    {
        super();
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
        super();
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

    FGTCTransformSampler()
    {
        super();
        this.bIsRelative = true;
        this.bSamplePosition = true;
        this.bSampleRotation = false;
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
        local_2.BeginTransform = local_8.ToFTransform();
        local_2.EntityName = TargetEntity.GetEntityName().ToString();
        return;
    }
    void Execute_Implementation(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
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


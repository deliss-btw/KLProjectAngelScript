

// NOTE: class defaults are not authored in this module: FGTCAICommandAction (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FGTCAICommandInstancePreview
{
    UPROPERTY()
    int InstanceId;
    UPROPERTY()
    int Status;
    UPROPERTY()
    int CommandNodeId;
    UPROPERTY()
    FString CommandSource;
    UPROPERTY()
    float32 StartTime;
    UPROPERTY()
    float32 StopTime;
    UPROPERTY()
    bool bInstant;
    UPROPERTY()
    bool bManagedByService;
    UPROPERTY()
    FString InstanceDataType;
    UPROPERTY()
    FString InstanceText;
    UPROPERTY()
    FString InstanceDataJson;


}

struct FGTCAICommandAction : FGTCAction
{
    FGTCAction _base_FGTCAction;
    UPROPERTY()
    float32 Time;
    UPROPERTY()
    int NextInstanceId;
    UPROPERTY()
    TArray<FGTCAICommandInstancePreview> Instances;
    UPROPERTY()
    FString SnapshotJson;
    UPROPERTY()
    FString EntityIdRemap;

    FGTCAICommandAction()
    {
        this.Time = 0.0f;
        this.NextInstanceId = 0;
        this.__InitDefaults();
        return;
    }
    void Execute_Implementation(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        bool local_1;
        int local_84 = 0;
        int local_112 = 0;
        if (!(ECS::GetRuntimeInfo().IsServer))
        {
            return;
        }
        if (!(TargetEntity.IsValid()))
        {
            XLog(ELog(40), FString().Append("[GTC] AICommand FAIL: TargetEntity INVALID at t=").Append(this.Time));
            return;
        }
        if (!(::FASCommonUtils::IsMonsterPrefab(TargetEntity)))
        {
            XLog(ELog(40), FString().Append("[GTC] AICommand FAIL: IsMonsterPrefab=false for ").Append(TargetEntity.GetEntityName()).Append(" at t=").Append(this.Time));
            return;
        }
        FString local_14 = this.SnapshotJson;
        float32 local_16 = Context.FixedTime.Time;
        int local_17 = 0;
        int local_19 = 0;
        for (; local_19 < this.Instances.Num(); )
        {
            FString local_24 = FString("\"StartTime\": 0.0");
            int local_20 = local_14.Find(local_24, ESearchCase(0), ESearchDir(0), local_17);
            if (local_20 < 0)
            {
                break;
            }
            FString local_34 = FString().Append("\"StartTime\": ").Append((local_16 - (this.Time - this.Instances[local_19].StartTime)));
            FString local_38 = (local_14.Left(local_20) + local_34);
            local_14 = (local_38 + local_14.Mid((local_20 + local_24.Len()), 2147483647));
            local_17 = local_20 + local_34.Len();
            ++local_19;
        }
        TMap<int, int> local_64;
        if (!(this.EntityIdRemap.IsEmpty()))
        {
            if (!(FECSEntity(Context.TestCaseEntityId).IsValid()))
            {
                local_1 = false;
            }
            else
            {
                Has local_76;
                local_1 = local_76.opCall();
            }
            if (local_1)
            {
                TArray<FString> local_88;
                this.EntityIdRemap.ParseIntoArray(local_88, "|", true);
                for (auto& local_102 : local_88)
                {
                    int local_20_2 = -1;
                    if (!(local_102.FindChar(int16(58), local_20_2)))
                    {
                        continue;
                    }
                    FString local_44 = local_102.Left(local_20_2);
                    FString local_38_2 = local_102.Mid(local_20_2 + 1, 2147483647);
                    FECSEntityId local_104;
                    bool local_77 = local_84.TryFindEntityId(FName(local_38_2), local_104);
                    if (local_77)
                    {
                        local_64.Add(String::Conv_StringToInt(local_44), local_104.GetIdValue());
                    }
                    else
                    {
                        FString local_24_2 = FString();
                        XLog(ELog(40), local_24_2.Append("[GTC] AICommand: Remap FAILED for '").Append(local_38_2).Append("' (oldId=").Append(local_44).Append(") at t=").Append(this.Time));
                    }
                }
            }
            else
            {
                XLog(ELog(40), FString().Append("[GTC] AICommand: TestCaseEntity invalid or no FC_TestCase at t=").Append(this.Time));
            }
        }
        if (local_64.Num() > 0)
        {
            ::FGTCUtils::ApplyAICommandSnapshotWithRemap(TargetEntity, local_14, local_64);
        }
        else
        {
            ::FGTCUtils::ApplyAICommandSnapshot(TargetEntity, local_14);
        }
        local_112.SnapshotJson = local_14;
        local_112.IdRemap = local_64;
        return;
    }
}



const FConsoleVariable CVar_Debug_EnableFxTrail = FConsoleVariable();

struct FFXTrailCheckInstanceData
{
    UPROPERTY()
    float LastCheckTime = 0.0;


}

class UESMAction_FXTrail : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    float32 DetectionInterval = 0.06f;
    UPROPERTY()
    FSurfaceLineTraceConfig TraceConfig;


    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FFXTrailCheckInstanceData);
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(1);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void OnInitData_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        XLogIf(CVar_Debug_EnableFxTrail.GetBool(), ELog(49), "OnInitData---------------");
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        XLogIf(CVar_Debug_EnableFxTrail.GetBool(), ELog(49), "OnDataValidate---------------");
        return;
    }
    UFUNCTION()
    void PreviewBegin_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time, const bool bNewlyBegin)
    {
        XLogIf(CVar_Debug_EnableFxTrail.GetBool(), ELog(49), "PreviewBegin---------------");
        return;
    }
    UFUNCTION()
    void Preview_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time)
    {
        XLogIf(CVar_Debug_EnableFxTrail.GetBool(), ELog(49), FString().Append("Preview Action: ").Append(this.DebugGetPath()).Append(", Preview Time: ").Append(Time.ActionTime).Append(", Seconds: ").Append(Time.ActionTime.ToSeconds()).Append("---------------"));
        return;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        XLogIf(CVar_Debug_EnableFxTrail.GetBool(), ELog(49), "ViewEnter---------------");
        const FECSEntity& local_4 = Context.GetEntity();
        FECSWorldPtr local_6 = Context.GetECSWorld();
        ::FImpactFXUtils::SendSurfaceContactEvent(Context.GetECSWorld(), EApplyTargetType(1), Context.GetEntity(), Time, this.TraceConfig);
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        XLogIf(CVar_Debug_EnableFxTrail.GetBool(), ELog(49), "ViewExit---------------");
        const FECSEntity& local_4 = Context.GetEntity();
        Has local_8;
        bool local_2 = local_8.opCall();
        if (local_2)
        {
            FFPTime local_16 = FFPTime(-1);
            FECSWorldPtr local_10 = Context.GetECSWorld();
        }
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FFXTrailCheckInstanceData& local_2 = this.ModifyViewInstanceData(Context);
        XLogIf(CVar_Debug_EnableFxTrail.GetBool(), ELog(49), FString().Append("ViewTick--------------- ").Append(Time.WorldTime));
        float32 local_10 = Time.WorldTime;
        if ((local_10 - local_2.LastCheckTime) >= this.DetectionInterval)
        {
            ::FImpactFXUtils::SendSurfaceContactEvent(Context.GetECSWorld(), EApplyTargetType(1), Context.GetEntity(), Time, this.TraceConfig);
            local_2.LastCheckTime = local_10;
        }
        return;
    }
    const FFXTrailCheckInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FFXTrailCheckInstanceData __r;
        return __r;
    }
    FFXTrailCheckInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FFXTrailCheckInstanceData __r;
        return __r;
    }
}


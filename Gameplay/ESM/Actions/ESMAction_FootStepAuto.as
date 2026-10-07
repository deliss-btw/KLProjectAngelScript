
const FConsoleVariable CVar_Debug_EnableFootCurve = FConsoleVariable();

struct FAnimationFootStepCurve
{
    UPROPERTY()
    FName AnimPath;
    UPROPERTY()
    FName CurveName;
    UPROPERTY()
    TArray<float32> TimeKeys;

    FAnimationFootStepCurve()
    {
        return;
    }
}

struct FAnimationFootStepCurveList
{
    UPROPERTY()
    TArray<FAnimationFootStepCurve> CurveList;

    FAnimationFootStepCurveList()
    {
        return;
    }
}

struct FAnimCurveSimple
{
    UPROPERTY()
    FName CurveName;
    UPROPERTY()
    FName SocketName;
    UPROPERTY()
    TArray<float32> CurveKeys;
    UPROPERTY()
    TArray<float32> CurveValues;

    FAnimCurveSimple()
    {
        return;
    }
    FAnimCurveSimple(const FName &inout Name, const FName &inout Socket, TArray<float32> &inout Keys, const TArray<float32> &inout Values)
    {
        this.SocketName = Socket;
        this.CurveKeys = Keys;
        this.CurveValues = Values;
        return;
    }
}

struct FAnimSequenceSampleConfig
{
    UPROPERTY()
    FName AnimPath;
    UPROPERTY()
    float32 AssetLength;
    UPROPERTY()
    TArray<FAnimCurveSimple> CurveInfo;


    void Reset()
    {
        for (auto& local_16 : this.CurveInfo)
        {
            local_16.CurveName = NAME_None;
            local_16.CurveKeys.Empty(0);
            local_16.CurveValues.Empty(0);
        }
        this.CurveInfo.Empty(0);
        return;
    }
}

struct FBlendSpaceSampleConfig
{
    UPROPERTY()
    FName AnimPath;
    UPROPERTY()
    TSoftObjectPtr<UAnimSequence> Animation;
    UPROPERTY()
    float32 AssetLength;
    UPROPERTY()
    TArray<FAnimCurveSimple> CurveInfo;


}

struct FFootLineTraceConfig
{
    UPROPERTY()
    float32 TraceLengthForSurfaceDetection = 150.0f;
    UPROPERTY()
    FAttachRefName TraceStartBoneOrSocketName;
    UPROPERTY()
    FName RootBoneName = n"Rider_Point";
    UPROPERTY()
    FVector TraceStartOffset = FVector(0.0, 0.0, 20.0);
    UPROPERTY()
    FVector TraceDir = FVector::DownVector;
    UPROPERTY()
    ELandedStrength StepStrengthLevel = ELandedStrength(0);
    UPROPERTY()
    EImpactRotationType ImpactRotationType = EImpactRotationType(0);
    UPROPERTY()
    float32 VFXDelay = 0.0f;
    UPROPERTY()
    float32 SFXDelay = 0.0f;
    UPROPERTY()
    bool bManualUpdate = false;


    void CopyFromTemplate(const FFootLineTraceTemplateConfig &inout Template)
    {
        this.TraceLengthForSurfaceDetection = Template.TraceLengthForSurfaceDetection;
        this.TraceStartOffset = Template.TraceStartOffset;
        this.TraceDir = Template.TraceDir;
        this.StepStrengthLevel = Template.StepStrengthLevel;
        this.ImpactRotationType = Template.ImpactRotationType;
        this.VFXDelay = Template.VFXDelay;
        this.SFXDelay = Template.SFXDelay;
        return;
    }
}

struct FFootStepTimeConfig
{
    UPROPERTY()
    FFPTime FootLandedTime;
    UPROPERTY()
    FName FootStepType;
    UPROPERTY()
    FFootLineTraceConfig FootLineTraceConfig;
    UPROPERTY()
    EESMAnimStateType AnimStateType;


}

struct FFootLineTraceTemplateConfig
{
    UPROPERTY()
    float32 TraceLengthForSurfaceDetection = 150.0f;
    UPROPERTY()
    FVector TraceStartOffset = FVector(0.0, 0.0, 20.0);
    UPROPERTY()
    FVector TraceDir = FVector::DownVector;
    UPROPERTY()
    ELandedStrength StepStrengthLevel = ELandedStrength(0);
    UPROPERTY()
    EImpactRotationType ImpactRotationType = EImpactRotationType(0);
    UPROPERTY()
    float32 VFXDelay = 0.0f;
    UPROPERTY()
    float32 SFXDelay = 0.0f;


}

class UFootstepStrengthUserData : UAssetUserData
{
    UPROPERTY()
    ELandedStrength Strength;

    UFootstepStrengthUserData()
    {
        return;
    }
}

struct FESMFootStepAutoInstanceData
{
    UPROPERTY()
    TMap<FName, bool> CanTriggerFootStepEvent;
    UPROPERTY()
    float LastTriggerEventTime = -1.0;


}

struct FAnimStateInfo
{
    UPROPERTY()
    EESMAnimStateType AnimStateType;
    UPROPERTY()
    float32 AnimStateLength = -1.0f;
    UPROPERTY()
    float32 AnimStateLoopTotalTime = 0.0f;
    UPROPERTY()
    float32 AnimPlaySpeed = 1.0f;

    FAnimStateInfo(const EESMAnimStateType InAnimStateType, const float32 InAnimStateLength, const float32 InAnimStateLoopTotalTime, const float32 InAnimPlaySpeed)
    {
        this.AnimStateType = InAnimStateType;
        this.AnimStateLength = InAnimStateLength;
        this.AnimStateLoopTotalTime = InAnimStateLoopTotalTime;
        this.AnimPlaySpeed = InAnimPlaySpeed;
        return;
    }
}

class UESMAction_FootStepAuto : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    uint8 ImpactFeedbackType = (3 != 0);
    UPROPERTY()
    TArray<FAnimStateInfo> AnimStateInfos;
    UPROPERTY()
    TArray<FName> RuntimeFootStepBBNames;
    UPROPERTY()
    float32 ToeLandedMaxThreshold = 0.94f;
    UPROPERTY()
    float32 ToeLandedMinThreshold = 0.5f;
    UPROPERTY()
    float32 AutoFootStepDelay = 0.0f;
    UPROPERTY()
    FFootLineTraceTemplateConfig AsLineTraceTemplate;
    UPROPERTY()
    TArray<FFootStepTimeConfig> AsTimeConfigs;
    UPROPERTY()
    bool bUseRuntimeBlendSpaceSample = false;
    UPROPERTY()
    FFootLineTraceTemplateConfig BsLineTraceTemplate;
    UPROPERTY()
    bool bHasAsAsset = false;
    UPROPERTY()
    bool bHasBsAsset = false;
    UPROPERTY()
    bool bPreviewCanTriggerLeftEvent = true;
    UPROPERTY()
    bool bPreviewCanTriggerRightEvent = true;
    UPROPERTY()
    float PreviewLastTriggerEventTime = -1.0;
    UPROPERTY()
    EPrefabType PreivewEntityPrefabType = EPrefabType(0);


    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMFootStepAutoInstanceData);
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(2);
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
        XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), "OnInitData---------------");
        return;
    }
    UFUNCTION()
    void PreviewBegin_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time, const bool bNewlyBegin)
    {
        XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), "PreviewBegin---------------");
        return;
    }
    UFUNCTION()
    void Preview_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time)
    {
        XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), FString().Append("Action: ").Append(this.DebugGetPath()).Append(", Preview Time: ").Append(Time.ActionTime).Append(", Seconds: ").Append(Time.ActionTime.ToSeconds()).Append("---------------"));
        Has local_16;
        if (!(false) == !(local_16.opCall()))
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), "ViewEnter---------------");
        const FECSEntity& local_4 = Context.GetEntity();
        FECSWorldPtr local_6 = Context.GetECSWorld();
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), "ViewExit---------------");
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), FString().Append("ViewTick--------------- ").Append(Time.WorldTime));
        bool local_11 = !(false);
        Has local_10;
        if (local_11 == !(local_10.opCall()))
        {
            return;
        }
        FESMFootStepAutoInstanceData& local_14 = this.ModifyViewInstanceData(Context);
        for (auto& local_28 : this.AnimStateInfos)
        {
            if (int(local_28.AnimStateType) == 1)
            {
                if (this.bUseRuntimeBlendSpaceSample)
                {
                    for (auto& local_46 : this.RuntimeFootStepBBNames)
                    {
                        float32 local_53 = Context.GetEntity().GetBB_Float(local_46.opImplConv());
                        XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), FString().Append("Action: ").Append(this.DebugGetPath()).Append(", BBName: ").Append(local_46).Append(", RuntimeFootCurveValue :").Append(local_53));
                        if (!(local_14.CanTriggerFootStepEvent.Contains(local_46)))
                        {
                            local_14.CanTriggerFootStepEvent.Add(local_46, true);
                        }
                        if (local_14.CanTriggerFootStepEvent.FindOrAdd(local_46) && (local_53 >= this.ToeLandedMaxThreshold))
                        {
                            FFootLineTraceConfig local_82;
                            local_82.TraceStartBoneOrSocketName.Name = ::FAsAnimCurveUtils::GetCurveNameByBB(local_46);
                            local_82.CopyFromTemplate(this.BsLineTraceTemplate);
                            this.SendFootLandedEvent(Context.GetECSWorld(), Context.GetEntity(), Time, local_82, false, true);
                            XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), FString().Append("Action: ").Append(this.DebugGetPath()).Append(", BBName: ").Append(local_46).Append(", RuntimeFootCurveValue:").Append(local_53).Append(", foot landed---------------"));
                        }
                        if (local_53 <= this.ToeLandedMinThreshold)
                        {
                        }
                    }
                }
                else
                {
                    int local_87 = 0;
                    for (; local_87 < this.AsTimeConfigs.Num(); ++local_87)
                    {
                        float local_92 = Time.ActionTime.ToSeconds();
                        float local_90 = this.AsTimeConfigs[local_87].FootLandedTime.ToSeconds();
                        XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), FString().Append("Test: ").Append(this.DebugGetPath()).Append(", CurrentTime:").Append(Time.ActionTime).Append("--------------"));
                        if (local_92 >= local_90 && (local_90 > local_14.LastTriggerEventTime))
                        {
                            XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), FString().Append("SendFootLandedEvent: ").Append(this.DebugGetPath()).Append(", CurrentTime:").Append(local_92).Append(", LastTriggerEventTime: ").Append(local_14.LastTriggerEventTime).Append(", FootTriggerTime: ").Append(local_90).Append(" foot landed---------------"));
                            this.SendFootLandedEvent(Context.GetECSWorld(), Context.GetEntity(), Time, this.AsTimeConfigs[local_87].FootLineTraceConfig, false, false);
                            local_14.LastTriggerEventTime = local_92;
                        }
                        if (local_92 < local_14.LastTriggerEventTime)
                        {
                            XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), FString().Append("CurrentTime < LastTriggerEventTime: ").Append(this.DebugGetPath()).Append(", CurrentTime:").Append(local_92).Append(", LastTriggerEventTime: ").Append(local_14.LastTriggerEventTime).Append("------"));
                            local_14.LastTriggerEventTime = -1.0;
                        }
                    }
                }
                continue;
            }
            int local_87_2 = 0;
            for (; local_87_2 < this.AsTimeConfigs.Num(); ++local_87_2)
            {
                float local_94_2 = Time.ActionTime.ToSeconds();
                float local_92_2 = this.AsTimeConfigs[local_87_2].FootLandedTime.ToSeconds();
                XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), FString().Append("Test: ").Append(this.DebugGetPath()).Append(", CurrentTime:").Append(Time.ActionTime).Append("--------------"));
                if (local_94_2 >= local_92_2 && (local_92_2 > local_14.LastTriggerEventTime))
                {
                    XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), FString().Append("SendFootLandedEvent: ").Append(this.DebugGetPath()).Append(", CurrentTime:").Append(local_94_2).Append(", LastTriggerEventTime: ").Append(local_14.LastTriggerEventTime).Append(", FootTriggerTime: ").Append(local_92_2).Append(" foot landed---------------"));
                    this.SendFootLandedEvent(Context.GetECSWorld(), Context.GetEntity(), Time, this.AsTimeConfigs[local_87_2].FootLineTraceConfig, false, false);
                    local_14.LastTriggerEventTime = local_94_2;
                }
                if (local_94_2 < local_14.LastTriggerEventTime)
                {
                    XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), FString().Append("CurrentTime < LastTriggerEventTime: ").Append(this.DebugGetPath()).Append(", CurrentTime:").Append(local_94_2).Append(", LastTriggerEventTime: ").Append(local_14.LastTriggerEventTime).Append("------"));
                    local_14.LastTriggerEventTime = -1.0;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void GetExtraTimeStamp_Implementation(TArray<FESMExtraTimeStamp> &inout OutTimeStamps) const
    {
        return;
    }
    UFUNCTION()
    void OnExtraTimeStampChanged_Implementation(const int Index, const FESMExtraTimeStamp &inout ChangedExtraTimeStamp)
    {
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), FString().Append("Action: ").Append(this.DebugGetPath()).Append(", OnDataValidate---------------"));
        return;
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    bool IsNotifyTypeAllowed_Implementation(const EESMNotifyType InType) const
    {
        return (int(InType) == 1);
    }
    const FESMFootStepAutoInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMFootStepAutoInstanceData __r;
        return __r;
    }
    FESMFootStepAutoInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMFootStepAutoInstanceData __r;
        return __r;
    }
    UFUNCTION()
    void ResetTimeMarksFromAnimationCurveRaw()
    {
        return;
    }
    void GnererateFootStepTimeConfig(FAnimStateInfo &inout AnimStateInfo, const float32 AssetLength, const TArray<FAnimCurveSimple> &inout CurveInfo, const float32 InPreAnimStateTime, TArray<FFootStepTimeConfig> &inout OutFootStepTimeConfig)
    {
        bool local_28;
        float32 local_32;
        float32 local_34;
        for (auto& local_16 : CurveInfo)
        {
            if (local_16.CurveKeys.Num() != local_16.CurveValues.Num())
            {
                XWarning(ELog(0), FString().Append("CurveName: ").Append(local_16.CurveName).Append(", CurveKeys").Append(local_16.CurveKeys.Num()).Append(" Num not equal CurveValues").Append(local_16.CurveValues.Num()).Append(" Num. ESM: ").Append(this.DebugGetPath()));
                continue;
            }
            local_28 = true;
            int local_29 = 0;
            for (; local_29 < local_16.CurveValues.Num(); ++local_29)
            {
                if (!(::FAsAnimCurveUtils::CheckCurveNameIsValid(FName(local_16.CurveName))))
                {
                    continue;
                }
                local_32 = local_16.CurveValues[local_29];
                local_34 = local_16.CurveKeys[local_29];
                if (local_28 && (local_32 >= 0.99f))
                {
                    FFootStepTimeConfig local_64;
                    local_64.FootStepType = local_16.CurveName;
                    local_64.AnimStateType = AnimStateInfo.AnimStateType;
                    float32 local_33 = (InPreAnimStateTime + local_34) + this.AutoFootStepDelay;
                    local_64.FootLandedTime = local_33;
                    local_64.FootLineTraceConfig.TraceStartBoneOrSocketName.Name = ::FAsAnimCurveUtils::GetFootStepSocketName(local_16.CurveName);
                    if (int(AnimStateInfo.AnimStateType) == 0)
                    {
                        local_64.FootLineTraceConfig.CopyFromTemplate(this.AsLineTraceTemplate);
                    }
                    else
                    {
                        local_64.FootLineTraceConfig.CopyFromTemplate(this.BsLineTraceTemplate);
                    }
                    OutFootStepTimeConfig.Add(local_64);
                    if (AnimStateInfo.AnimStateLength == -1.0f)
                    {
                        int local_72 = 1;
                        for (; local_72 <= (uint((AnimStateInfo.AnimStateLoopTotalTime / AssetLength))); )
                        {
                            FFootStepTimeConfig local_100;
                            local_100.FootStepType = local_16.CurveName;
                            local_100.AnimStateType = AnimStateInfo.AnimStateType;
                            local_33 = InPreAnimStateTime + local_34;
                            local_33 = local_33 + (local_72 * AssetLength);
                            local_100.FootLandedTime = (local_33 + this.AutoFootStepDelay);
                            local_100.FootLineTraceConfig.TraceStartBoneOrSocketName.Name = ::FAsAnimCurveUtils::GetFootStepSocketName(local_16.CurveName);
                            if (int(AnimStateInfo.AnimStateType) == 0)
                            {
                                local_100.FootLineTraceConfig.CopyFromTemplate(this.AsLineTraceTemplate);
                            }
                            else
                            {
                                local_100.FootLineTraceConfig.CopyFromTemplate(this.BsLineTraceTemplate);
                            }
                            OutFootStepTimeConfig.Add(local_100);
                            ++local_72;
                        }
                    }
                    local_28 = false;
                    XLogIf(CVar_Debug_EnableFootCurve.GetBool(), ELog(1), FString().Append("Left Foot Contact at Key: ").Append(local_34).Append(", Value: ").Append(local_32));
                    continue;
                }
                if (local_32 <= 0.01f)
                {
                    local_28 = true;
                }
            }
        }
        return;
    }
    void SendFootLandedEvent(const FECSWorldPtr &inout ECSWorld, const FECSEntity &inout Entity, const FESMActionTime &inout Time, const FFootLineTraceConfig &inout Config, const bool bIsPreview, const bool bIsBlendSpace) const
    {
        int local_60 = 0;
        if (bIsPreview)
        {
            FEntityLandedInfo local_36;
            local_36.SetImpactEventType(EImpactEventType(0));
            ::FImpactFXUtils::FillLandedEventData(Entity, local_36, Config);
            return;
        }
        if (bIsBlendSpace)
        {
            int local_41 = this.ImpactFeedbackType & 1;
            if (local_41 != 0)
            {
                FFPTime local_52 = ((FFPTime(ECSWorld.GetLocalTime().Time) + FFPTime(this.AutoFootStepDelay)) + FFPTime(Config.VFXDelay));
                local_60.EntityLandedInfo.SetImpactEventType(EImpactEventType(1));
                ::FImpactFXUtils::FillLandedEventData(Entity, local_60.EntityLandedInfo, Config);
            }
            local_41 = this.ImpactFeedbackType & 2;
            if (local_41 != 0)
            {
                FFPTime local_52_2 = (FFPTime(ECSWorld.GetLocalTime().Time) + FFPTime(this.AutoFootStepDelay));
                FFPTime local_50 = (local_52_2 + FFPTime(Config.SFXDelay));
                local_60.EntityLandedInfo.SetImpactEventType(EImpactEventType(2));
                ::FImpactFXUtils::FillLandedEventData(Entity, local_60.EntityLandedInfo, Config);
            }
            return;
        }
        int local_42 = this.ImpactFeedbackType & 1;
        if (local_42 != 0)
        {
            FFPTime local_50_2 = (FFPTime(ECSWorld.GetLocalTime().Time) + FFPTime(this.AutoFootStepDelay));
            FFPTime local_52_3 = (local_50_2 + FFPTime(Config.VFXDelay));
            local_60.EntityLandedInfo.SetImpactEventType(EImpactEventType(1));
            ::FImpactFXUtils::FillLandedEventData(Entity, local_60.EntityLandedInfo, Config);
        }
        int local_41_2 = this.ImpactFeedbackType & 2;
        if (local_41_2 != 0)
        {
            FFPTime local_52_4 = (FFPTime(ECSWorld.GetLocalTime().Time) + FFPTime(this.AutoFootStepDelay));
            FFPTime local_50_3 = (local_52_4 + FFPTime(Config.SFXDelay));
            local_60.EntityLandedInfo.SetImpactEventType(EImpactEventType(2));
            ::FImpactFXUtils::FillLandedEventData(Entity, local_60.EntityLandedInfo, Config);
        }
        return;
    }
}

struct __Lambda_Gameplay_ESM_Actions_ESMAction_FootStepAuto_858
{
    __Lambda_Gameplay_ESM_Actions_ESMAction_FootStepAuto_858()
    {
        return;
    }
    bool opCall(const FFootStepTimeConfig &inout A, const FFootStepTimeConfig &inout B)
    {
        return (A.FootLandedTime.opCmp(B.FootLandedTime) < 0);
    }
}


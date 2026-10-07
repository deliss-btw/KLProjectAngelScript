

struct FESMThrowPredictBlendTimeInstanceData
{
    UPROPERTY()
    bool bExitPhaseInitialized = false;
    UPROPERTY()
    int TargetPlayerIndex = -1;


}

class UESMAction_ThrowPredictBlendTime : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;
    UPROPERTY()
    float32 BlendInDuration = 1.0f;
    UPROPERTY()
    float32 BlendOutDuration = 1.0f;


    UFUNCTION()
    FESMInstanceDataInfo GetInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMThrowPredictBlendTimeInstanceData);
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(5);
    }
    UFUNCTION()
    int GetActionPriority_Implementation() const
    {
        return -1000;
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.IdentifyName = UESMAction_ThrowPredictBlendTime.opArrow().GetFName();
        OutParam.bExclusive = true;
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.BlendInDuration < 0.0f)
        {
            this.BlendInDuration = 0.0f;
        }
        if (this.BlendOutDuration < 0.0f)
        {
            this.BlendOutDuration = 0.0f;
        }
        return;
    }
    UFUNCTION()
    void OnExtraTimeStampChanged_Implementation(const int Index, const FESMExtraTimeStamp &inout ChangedExtraTimeStamp)
    {
        if (Index == 0)
        {
            this.BlendInDuration = float32(ChangedExtraTimeStamp.ActionTime.ToSeconds());
            return;
        }
        if (Index == 1)
        {
            this.BlendOutDuration = (this.GetDuration() - float32(ChangedExtraTimeStamp.ActionTime.ToSeconds()));
        }
        return;
    }
    UFUNCTION()
    void GetExtraTimeStamp_Implementation(TArray<FESMExtraTimeStamp> &inout OutTimeStamps) const
    {
        FESMExtraTimeStamp local_4;
        local_4.ActionTime = this.BlendInDuration;
        OutTimeStamps.Add(local_4);
        local_4.ActionTime = (this.GetDuration() - this.BlendOutDuration);
        OutTimeStamps.Add(local_4);
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            return;
        }
        if (ECS::GetRuntimeInfo().IsServer)
        {
            this.ServerEnter(Context, Time);
            return;
        }
        this.ClientEnter(Context, Time);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (ECS::GetRuntimeInfo().IsServer)
        {
            this.ServerExit(Context, Time);
            return;
        }
        this.ClientExit(Context, Time);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_36 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            return;
        }
        FESMThrowPredictBlendTimeInstanceData local_8;
        FESMThrowPredictBlendTimeInstanceData local_10;
        local_8 = local_10;
        if ((local_8.bExitPhaseInitialized || ((int(local_8.TargetPlayerIndex) == -1))))
        {
            return;
        }
        if (FFPTime(Time.ActionLastTime).opCmp((FFPTime(Time.ActionDuration) - FFPTime(this.BlendOutDuration))) >= 0)
        {
            this.ModifyInstanceData(Context).bExitPhaseInitialized = true;
            if (this.BlendOutDuration > 0.0f)
            {
                FFPTime local_18 = FFPTime(this.GetExitTime());
                local_36.SetBlendPredictToServerTime(this.CalcRealPlayDuration(Context, FFPTime((this.GetExitTime() - this.BlendOutDuration)), local_18));
            }
        }
        return;
    }
    FESMThrowPredictBlendTimeInstanceData GetInstanceData(const FESMContext &inout Context) const
    {
        FESMThrowPredictBlendTimeInstanceData __r;
        return __r;
    }
    FESMThrowPredictBlendTimeInstanceData ModifyInstanceData(const FESMContext &inout Context) const
    {
        FESMThrowPredictBlendTimeInstanceData __r;
        return __r;
    }
    void ServerEnter(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_34 = 0;
        FNameHandle_EntityBBVarEntity local_4;
        local_4;
        FECSEntity local_8 = Context.GetEntity().GetBB_Entity(local_4);
        if (!(local_8.IsValid()))
        {
            return;
        }
        int local_15 = this.SwitchNetPredict(local_8, Context.GetEntity());
        if (local_15 != -1)
        {
            this.ModifyInstanceData(Context).TargetPlayerIndex = local_15;
            FC_ThrowPredictActiveTag local_24;
            Assign local_22;
            local_22.opCall(local_24);
            if (this.BlendInDuration > 0.0f)
            {
                local_34.SetBlendServerToPredictTime(this.CalcRealPlayDuration(Context, FFPTime(this.GetEnterTime()), FFPTime((this.GetEnterTime() + this.BlendInDuration))));
            }
        }
        return;
    }
    void ServerExit(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_2 = 0;
        int local_1 = local_2;
        if (local_1 == -1)
        {
            return;
        }
        local_2 = -1;
        this.ModifyInstanceData(Context).TargetPlayerIndex = local_2;
        Remove local_8;
        local_8.opCall();
        Remove local_12;
        local_12.opCall();
        Remove local_16;
        local_16.opCall();
        Has local_20;
        if (!(local_20.opCall()))
        {
            this.SwitchBackNetPredict(Context.GetEntity(), local_1);
        }
        return;
    }
    void ClientEnter(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        return;
    }
    void ClientExit(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        return;
    }
    int SwitchNetPredict(const FECSEntity &inout TargetEntity, const FECSEntity &inout SelfEntity) const
    {
        FECSEntity local_8;
        Get local_12;
        const FC_ControlledByPlayer& local_14 = local_12.opCall();
        if (local_14)
        {
            local_8 = local_14.GetPlayerEntity();
        }
        else
        {
            local_8 = TargetEntity;
        }
        Get local_20;
        const FC_PlayerController& local_22 = local_20.opCall();
        if (local_22)
        {
            GetDefaulted local_28;
            FNetPlayerMask local_24 = FNetPlayerMask(local_28.opCall().GetMask());
            local_24.SetBit(local_22.GetPlayerIndex(), true);
            FECSNetUtils::SetNetPredict(SelfEntity, local_24);
            return local_22.GetPlayerIndex();
        }
        return -1;
    }
    void SwitchBackNetPredict(const FECSEntity &inout SelfEntity, const int TargetPlayerIndex) const
    {
        GetDefaulted local_8;
        FNetPlayerMask local_4 = FNetPlayerMask(local_8.opCall().GetMask());
        local_4.SetBit(TargetPlayerIndex, false);
        FECSNetUtils::SetNetPredict(SelfEntity, local_4);
        return;
    }
}


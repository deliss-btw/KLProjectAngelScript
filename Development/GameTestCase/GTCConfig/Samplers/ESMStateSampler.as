

// NOTE: class defaults are not authored in this module: FGTCESMStateSampler (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FGTCTimeESMState
{
    UPROPERTY()
    FString StateName;
    UPROPERTY()
    float32 StateTime;
    UPROPERTY()
    float32 PlaySpeed;
    UPROPERTY()
    FString AssetName;


}

struct FGTCTransformStatus
{
    UPROPERTY()
    FVector3f Position;
    UPROPERTY()
    FVector3f Rotation;

    FGTCTransformStatus()
    {
        return;
    }
}

struct FGTCTimeESMStateCollection
{
    UPROPERTY()
    TArray<FGTCTimeESMState> EsmStateRecords;

    FGTCTimeESMStateCollection()
    {
        return;
    }
    void Clear()
    {
        this.Empty(0);
        return;
    }
}

struct FGTCStateRecord : FGTCSampleRecord
{
    FGTCSampleRecord _base_FGTCSampleRecord;
    UPROPERTY()
    FGTCTimeESMState ViewState;
    UPROPERTY()
    FGTCTransformStatus TransformStatus;
    UPROPERTY()
    TArray<FGTCTimeESMState> EsmStateRecords;
    UPROPERTY()
    float32 ClientTimeOffsetTime = 0.0f;
    UPROPERTY()
    int ClientTimeOffsetFrame = 0;


}

struct FGTCESMStateSampleResult : FGTCSampleResult
{
    FGTCSampleResult _base_FGTCSampleResult;
    UPROPERTY()
    FString EntityName;
    UPROPERTY()
    TArray<FGTCStateRecord> StateRecords;

    FGTCESMStateSampleResult()
    {
        super();
        return;
    }
    void Clear()
    {
        this.bIsValid = true;
        this.EntityName = "";
        this.StateRecords.Empty(0);
        return;
    }
}

struct FGTCESMStateSampler : FGTCSampler
{
    FGTCSampler _base_FGTCSampler;
    UPROPERTY()
    FString TargetAnimLayer;
    UPROPERTY()
    bool bSampleViewState;
    UPROPERTY()
    bool bSampleEsmStates;
    UPROPERTY()
    bool bSampleTransform;
    UPROPERTY()
    bool bSampleClientTimeOffset;
    UPROPERTY()
    bool bSampleServer;
    UPROPERTY()
    bool bSampleClient;
    UPROPERTY()
    TMap<FString, FGTCESMStateSampleResult> SampleResultMap;
    UPROPERTY()
    TMap<FString, FGTCTimeESMStateCollection> EsmStateCollectionMap;
    UPROPERTY()
    float32 CachedClientTimeOffsetTime;
    UPROPERTY()
    int CachedClientTimeOffsetFrame;

    FGTCESMStateSampler()
    {
        super();
        this.TargetAnimLayer = "MainLayer";
        this.bSampleViewState = true;
        this.bSampleEsmStates = true;
        this.bSampleTransform = true;
        this.bSampleClientTimeOffset = true;
        this.bSampleServer = true;
        this.bSampleClient = true;
        this.CachedClientTimeOffsetTime = 0.0f;
        this.CachedClientTimeOffsetFrame = 0;
        this.__InitDefaults();
        return;
    }
    FGTCESMStateSampleResult& GetSampleResult()
    {
        if (ECS::GetRuntimeInfo().IsClient)
        {
            return this.SampleResultMap.FindOrAdd("Client");
        }
        return this.SampleResultMap.FindOrAdd("Server");
    }
    FGTCTimeESMStateCollection& GetCurEsmStates()
    {
        if (ECS::GetRuntimeInfo().IsClient)
        {
            return this.EsmStateCollectionMap.FindOrAdd("Client");
        }
        return this.EsmStateCollectionMap.FindOrAdd("Server");
    }
    void OnStart_Implementation(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        FGTCESMStateSampleResult& local_2 = this.GetSampleResult();
        this.GetCurEsmStates();
        local_2.EntityName = TargetEntity.GetEntityName().ToString();
        return;
    }
    void Execute_Implementation(const FECSEntity &inout TargetEntity, const FGTCActionContext &inout Context)
    {
        Has local_4;
        int local_14 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        if (ECS::GetRuntimeInfo().IsClient && !(this.bSampleClient))
        {
            return;
        }
        bool local_5 = !(ECS::GetRuntimeInfo().IsClient) && !(this.bSampleServer);
        if (local_5)
        {
            return;
        }
        this.CachedClientTimeOffsetTime = 0.0f;
        this.CachedClientTimeOffsetFrame = 0;
        if (this.bSampleClientTimeOffset)
        {
            if (local_14)
            {
                this.CachedClientTimeOffsetTime = local_14.GetOffsetTime(int(Context.FixedTime.Frame));
                this.CachedClientTimeOffsetFrame = local_14.GetOffsetFrame(int(Context.FixedTime.Frame));
            }
        }
        FGTCRecordTimeStamp local_26 = Super::GetCurTimeStamp(Context);
        if (!(ECS::IsFixedFrameJob()))
        {
            local_5 = false;
        }
        else
        {
            local_5 = ECS::GetRuntimeInfo().IsClient;
        }
        if (local_5)
        {
            if (this.bSampleEsmStates)
            {
                this.ClientRecordByESMPlayer(TargetEntity, local_26);
            }
            return;
        }
        if (ECS::GetRuntimeInfo().IsClient)
        {
            this.ClientRecordByESMHistory(TargetEntity, local_26);
            return;
        }
        if (this.bSampleEsmStates)
        {
            this.ServerRecordByESMPlayer(TargetEntity, local_26);
        }
        this.ServerRecordByAnimState(TargetEntity, local_26);
        return;
    }
    void GetAnimStateDetail(const FESMAnimState &inout State, FString &inout StateName, float32 &inout StateTime, float32 &inout PlaySpeed)
    {
        StateName = State.GetState().ToString();
        if ((!((State.GetOverrideAnimAsset() == nullptr))))
        {
            StateName = State.GetOverrideAnimAsset().GetAssetName();
        }
        StateTime = (State.GetNormalizedPlayTime() * State.GetReferenceAnimLength());
        PlaySpeed = (State.GetNormalizedPlaySpeed() * State.GetReferenceAnimLength());
        return;
    }
    void AddSampleResult(const FECSEntity &inout TargetEntity, const FESMAnimState &inout State, FGTCRecordTimeStamp &inout RecordTime)
    {
        FGTCESMStateSampleResult& local_2 = this.GetSampleResult();
        FGTCStateRecord local_28;
        local_28._base_FGTCSampleRecord = RecordTime;
        if (this.bSampleViewState)
        {
            FString local_34;
            float32 local_35 = 0.0f;
            float32 local_37 = 0.0f;
            this.GetAnimStateDetail(State, local_34, local_35, local_37);
            FGTCTimeESMState local_48;
            local_48.StateName = local_34;
            local_48.StateTime = 0.0f;
            local_48.PlaySpeed = 0.0f;
        }
        if (this.bSampleTransform)
        {
            FTransform local_72;
            this.GetEntityWorldTransform(TargetEntity, local_72);
            local_28.TransformStatus.Position = FVector3f(local_72.GetLocation());
            local_28.TransformStatus.Rotation = FVector3f(local_72.GetRotation().Vector());
        }
        if (this.bSampleEsmStates)
        {
            local_28.EsmStateRecords = this.GetCurEsmStates().EsmStateRecords;
        }
        if (this.bSampleClientTimeOffset)
        {
            local_28.ClientTimeOffsetTime = this.CachedClientTimeOffsetTime;
            local_28.ClientTimeOffsetFrame = this.CachedClientTimeOffsetFrame;
        }
        local_2.StateRecords.Add(local_28);
        return;
    }
    void ServerRecordByAnimState(const FECSEntity &inout TargetEntity, FGTCRecordTimeStamp &inout RecordTime)
    {
        FC_AnimStateConstIterator local_16 = 0.Iterator();
        for (; local_16.CanProceed;)
        {
            const FESMAnimState& local_30 = local_16.Proceed();
            if ((!((local_30.GetLayer() == this.TargetAnimLayer))))
            {
                continue;
            }
            this.AddSampleResult(TargetEntity, local_30, RecordTime);
        }
        return;
    }
    void GetEntityWorldTransform(const FECSEntity &inout TargetEntity, FTransform &inout Transform)
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        Transform.SetLocation(local_6.GetPosition());
        Transform.SetRotation(local_6.GetRotation());
        return;
    }
    void ServerRecordByESMPlayer(const FECSEntity &inout TargetEntity, FGTCRecordTimeStamp &inout RecordTime)
    {
        int local_12 = 0;
        UESMAsset local_100;
        UESMAsset local_104;
        Get local_4;
        UESMAsset local_6 = local_4.opCall().Asset;
        int local_13 = 0;
        for (; local_13 < local_12.Player.GetSMRuntime().Num(); ++local_13)
        {
            FESMRT local_64 = FESMRT(local_12.Player.GetSMRuntime()[local_13]);
            UESMStateMachine local_68 = local_6.GetStateMachine(local_13);
            if (!((local_68.GetDataName().ToString() == "MainSM")))
            {
                continue;
            }
            UESMBaseState local_78 = local_68.GetBaseState(local_64.GetStateIndex());
            FGTCTimeESMState local_88;
            FString local_96;
            if (local_78 != nullptr)
            {
                local_96 = local_78.GetDataName().ToString();
            }
            else
            {
                local_96 = "Invalid";
            }
            local_88.StateName = local_96;
            local_88.StateTime = local_64.GetStateLastTime();
            local_88.PlaySpeed = local_64.GetSMPlaySpeed();
            if (local_78 != nullptr)
            {
                local_104 = local_78.GetSourceAsset();
            }
            else
            {
            }
            local_100 = local_104;
            FString local_108;
            if (local_100 != nullptr)
            {
                local_108 = local_100.GetName();
            }
            else
            {
                local_108 = local_6.GetName();
            }
            local_88.AssetName = local_108;
            this.GetCurEsmStates().EsmStateRecords.Add(local_88);
        }
        return;
    }
    void ClientRecordByESMPlayer(const FECSEntity &inout TargetEntity, FGTCRecordTimeStamp &inout RecordTime)
    {
        int local_18 = 0;
        UESMAsset local_102;
        UESMAsset local_106;
        Get local_4;
        UESMAsset local_6 = local_4.opCall().Asset;
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        int local_19 = 0;
        for (; local_19 < local_18.Player.GetSMRuntime().Num(); ++local_19)
        {
            FESMRT local_70 = FESMRT(local_18.Player.GetSMRuntime()[local_19]);
            UESMStateMachine local_74 = local_6.GetStateMachine(local_19);
            if (!((local_74.GetDataName().ToString() == "MainSM")))
            {
                continue;
            }
            UESMBaseState local_84 = local_74.GetBaseState(local_70.GetStateIndex());
            FGTCTimeESMState local_94;
            FString local_98;
            if (local_84 != nullptr)
            {
                local_98 = local_84.GetDataName().ToString();
            }
            else
            {
                local_98 = "Invalid";
            }
            local_94.StateName = local_98;
            local_94.StateTime = local_70.GetStateLastTime();
            local_94.PlaySpeed = local_70.GetSMPlaySpeed();
            if (local_84 != nullptr)
            {
                local_106 = local_84.GetSourceAsset();
            }
            else
            {
            }
            local_102 = local_106;
            FString local_110;
            if (local_102 != nullptr)
            {
                local_110 = local_102.GetName();
            }
            else
            {
                local_98 = local_6.GetName();
                local_110 = local_98;
            }
            local_94.AssetName = local_110;
            this.GetCurEsmStates().EsmStateRecords.Add(local_94);
        }
        return;
    }
    void ClientRecordByESMHistory(const FECSEntity &inout TargetEntity, FGTCRecordTimeStamp &inout RecordTime)
    {
        int local_6 = 0;
        int local_14 = 0;
        if (!(local_6))
        {
            return;
        }
        FC_AnimState local_254;
        local_14.GetInterpoValue(local_6.Time, local_254);
        local_254.SampleTo(local_6.Time);
        FC_AnimStateIterator local_264 = local_254.Iterator();
        for (; local_264.CanProceed;)
        {
            FESMAnimState& local_276 = local_264.Proceed();
            if ((!((local_276.GetLayer() == this.TargetAnimLayer))))
            {
                continue;
            }
            this.AddSampleResult(TargetEntity, local_276, RecordTime);
        }
        return;
    }
    bool TryCollectResult(const int64 StartTimeTicks, FString &out Result)
    {
        FString local_4;
        Result = local_4;
        FGTCESMStateSampleResult& local_6 = this.GetSampleResult();
        for (auto& local_22 : local_6.StateRecords)
        {
            local_22._base_FGTCSampleRecord.TimeTicks = int64((FTimespan((local_22._base_FGTCSampleRecord.TimeTicks - StartTimeTicks)).GetTotalMilliseconds()));
        }
        if (this.bNeedValidation)
        {
            local_6.bIsValid = true;
        }
        return FJsonObjectConverter::UStructToJsonObjectString(local_6, Result, 0, 0, 0, true);
    }
}


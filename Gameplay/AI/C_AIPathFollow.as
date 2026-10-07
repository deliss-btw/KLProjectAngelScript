
enum EAIPathFindingState
{
    NotStarted,
    Processing,
    Succeed,
    Failed,
}

enum EAIPathSimulateState
{
    NotStarted,
    Processing,
    Completed,
}

enum EAISimulateMoveType
{
    Start,
    StraightLine,
    StraightLine_Fly,
    KeepForward,
    KeepFollow,
    Jump,
    TakeOff,
    Land,
    Tactical,
    StandTurn,
}

namespace __INTENRAL_FC_AIPathFinding_AsyncInProcessTag_NS
{
    const TECSComponentDerivedPtr<FC_AIPathFinding_AsyncInProcessTag> DerivedPtr = TECSComponentDerivedPtr<FC_AIPathFinding_AsyncInProcessTag>();
    const FC_AIPathFinding_AsyncInProcessTag DefaultValue = FC_AIPathFinding_AsyncInProcessTag();
}
namespace __INTENRAL_FC_AIPathFinding_SucceedTag_NS
{
    const TECSComponentDerivedPtr<FC_AIPathFinding_SucceedTag> DerivedPtr = TECSComponentDerivedPtr<FC_AIPathFinding_SucceedTag>();
    const FC_AIPathFinding_SucceedTag DefaultValue = FC_AIPathFinding_SucceedTag();
}
namespace __INTENRAL_FC_AIPathFollowV2_NS
{
    const TECSComponentDerivedPtr<FC_AIPathFollowV2> DerivedPtr = TECSComponentDerivedPtr<FC_AIPathFollowV2>();
    const FC_AIPathFollowV2 DefaultValue = FC_AIPathFollowV2();
}
namespace __INTENRAL_FC_AIPathSimulateSyncData_NS
{
    const TECSComponentDerivedPtr<FC_AIPathSimulateSyncData> DerivedPtr = TECSComponentDerivedPtr<FC_AIPathSimulateSyncData>();
    const FC_AIPathSimulateSyncData DefaultValue = FC_AIPathSimulateSyncData();
}
namespace __INTENRAL_FC_AIPathSimulate_NS
{
    const TECSComponentDerivedPtr<FC_AIPathSimulate> DerivedPtr = TECSComponentDerivedPtr<FC_AIPathSimulate>();
    const FC_AIPathSimulate DefaultValue = FC_AIPathSimulate();
}
namespace __INTENRAL_FC_AIRVOLocalCorridor_NS
{
    const TECSComponentDerivedPtr<FC_AIRVOLocalCorridor> DerivedPtr = TECSComponentDerivedPtr<FC_AIRVOLocalCorridor>();
    const FC_AIRVOLocalCorridor DefaultValue = FC_AIRVOLocalCorridor();
}
namespace __INTENRAL_FC_AIStandTurnConfig_NS
{
    const TECSComponentDerivedPtr<FC_AIStandTurnConfig> DerivedPtr = TECSComponentDerivedPtr<FC_AIStandTurnConfig>();
    const FC_AIStandTurnConfig DefaultValue = FC_AIStandTurnConfig();
}
namespace __INTENRAL_FC_AIPredictedMovePath_NS
{
    const TECSComponentDerivedPtr<FC_AIPredictedMovePath> DerivedPtr = TECSComponentDerivedPtr<FC_AIPredictedMovePath>();
    const FC_AIPredictedMovePath DefaultValue = FC_AIPredictedMovePath();
}
namespace __INTENRAL_FC_AIPathFollowV2History_NS
{
    const TECSComponentDerivedPtr<FC_AIPathFollowV2History> DerivedPtr = TECSComponentDerivedPtr<FC_AIPathFollowV2History>();
    const FC_AIPathFollowV2History DefaultValue = FC_AIPathFollowV2History();

}
struct FC_AIPathFinding_AsyncInProcessTag : FECSComponent
{
    FC_AIPathFinding_AsyncInProcessTag()
    {
        return;
    }
}

struct FC_AIPathFinding_SucceedTag : FECSComponent
{
    FC_AIPathFinding_SucceedTag()
    {
        return;
    }
}

struct FAIPathFinding_API
{
    UPROPERTY()
    int Temp = 0;
    UPROPERTY()
    TArray<FVector> PathPoints;


    void Find()
    {
        this.Temp = 1;
        return;
    }
    void FindPath(const FECSEntity &inout Entity, const FVector &inout StartLocation, const FVector &inout TargetLocation)
    {
        this.PathPoints.Empty(0);
        FVector local_14 = (TargetLocation - StartLocation);
        float local_18 = local_14.Size2D();
        float32 local_19 = float32(local_18);
        if (local_19 <= 0.0f)
        {
            return;
        }
        local_14 = local_14.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        float32 local_21 = 0.0f;
        for (; local_21 <= local_19; )
        {
            this.PathPoints.Add((StartLocation + (local_14 * local_21)));
            local_21 = local_21 + 20.0f;
        }
        if (this.PathPoints.IsEmpty() || !(this.PathPoints.Last(0).Equals(TargetLocation, 9.999999747378752e-5)))
        {
            this.PathPoints.Add(TargetLocation);
        }
        return;
    }
    void GetPathSegmentsFromIndex(const FECSEntity &inout Entity, const int StartIndex, const float32 RequestDistance, int &inout EndIndex, TArray<FVector> &inout OutPathPos, const TArray<uint> &inout OutFlag)
    {
        OutPathPos.Empty(0);
        EndIndex = StartIndex;
        if (StartIndex < 0 || (StartIndex >= this.PathPoints.Num()))
        {
            return;
        }
        float32 local_4 = 0.0f;
        FVector local_12 = this.PathPoints[StartIndex];
        OutPathPos.Add(local_12);
        int local_14 = StartIndex + 1;
        for (; local_14 < this.PathPoints.Num(); ++local_14)
        {
            FVector local_20 = this.PathPoints[local_14];
            float32 local_5 = float32(((local_12 - local_20).Size2D()));
            if ((local_4 + local_5) <= RequestDistance)
            {
                local_4 = local_4 + local_5;
                OutPathPos.Add(local_20);
                local_12 = local_20;
                EndIndex = local_14;
                continue;
            }
            break;
        }
        return;
    }
}

struct FC_AIPathFollowV2 : FECSComponent
{
    UPROPERTY()
    int MovepurposeID;
    UPROPERTY()
    FVector StartLocation;
    UPROPERTY()
    FVector StartDirection;
    UPROPERTY()
    FVector TargetLocation;
    UPROPERTY()
    FVector TargetDirection;
    UPROPERTY()
    FVector OriginalTargetLocation;
    UPROPERTY()
    FVector OriginalTargetDirection;
    UPROPERTY()
    float32 AcceptanceRadius;
    UPROPERTY()
    bool bTargetDirectionValid;
    UPROPERTY()
    EAIMoveSimulateType MoveSimulateType = EAIMoveSimulateType(0);
    UPROPERTY()
    ECharacterMoveStance MoveStance = ECharacterMoveStance(0);
    UPROPERTY()
    EAIFollowPathStopType StopType = EAIFollowPathStopType(0);
    UPROPERTY()
    EAIPathFindingState PathFindState;
    UPROPERTY()
    bool bEcologyMove = false;
    UPROPERTY()
    bool bSendEcologyMovePathFindingEvent = false;
    UPROPERTY()
    FName EcologyMovePathFindingEventKey = NAME_None;
    UPROPERTY()
    bool bHasReach = false;
    UPROPERTY()
    bool bHasReached = false;
    UPROPERTY()
    uint64 PathSessionIndex;
    UPROPERTY()
    EAICommandMoveType ForceGroundOrAir = EAICommandMoveType(0);
    UPROPERTY()
    TDataObjectPtr<FAIMoveProclivityConfig> OverrideProclivityConfig;
    UPROPERTY()
    float32 RePathFindInterval = 0.0f;
    UPROPERTY()
    FFPTime NextRePathFindTime;
    UPROPERTY()
    bool bAllowChainedStartEntryPrefix = true;
    UPROPERTY()
    bool bHasSessionStuckDetailedLog = false;
    UPROPERTY()
    FFPTime LastSessionStuckDetailedLogTime = FFPTime(0);
    UPROPERTY()
    bool bSessionStuckDetailedLogEmitted = false;


    void Initialize()
    {
        this.MovepurposeID = 0;
        this.StartLocation = FVector::ZeroVector;
        this.StartDirection = FVector::ForwardVector;
        this.TargetLocation = FVector::ZeroVector;
        this.TargetDirection = FVector::ForwardVector;
        this.AcceptanceRadius = 50.0f;
        this.MoveSimulateType = EAIMoveSimulateType(0);
        this.MoveStance = ECharacterMoveStance(0);
        this.StopType = EAIFollowPathStopType(0);
        this.PathFindState = EAIPathFindingState(0);
        this.PathSessionIndex = 0;
        this.bHasReach = false;
        this.OverrideProclivityConfig = TDataObjectPtr<FAIMoveProclivityConfig>(nullptr);
        this.RePathFindInterval = 0.0f;
        this.NextRePathFindTime = FFPTime(0);
        this.bAllowChainedStartEntryPrefix = true;
        this.bSendEcologyMovePathFindingEvent = false;
        this.EcologyMovePathFindingEventKey = NAME_None;
        return;
    }
}

struct FSimulateData
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FVector m_TargetPoint;
    UPROPERTY()
    EAISimulateMoveType m_MoveType;
    UPROPERTY()
    ECharacterMoveStance m_MoveStance;
    UPROPERTY()
    EAIPathSimulateState m_SimulateState;
    UPROPERTY()
    bool m_bHasTrigger;
    UPROPERTY()
    EAIMoveSimulateType m_MoveSimulateType;
    UPROPERTY()
    FVector m_TurnTargetDirection;
    UPROPERTY()
    FVector m_JumpSorptionTargetLocation;
    UPROPERTY()
    FVector m_JumpSorptionStartLocation;
    UPROPERTY()
    TArray<FVector> m_PathPointListMoveList;
    UPROPERTY()
    int m_CurrentPathPointMoveIndex;
    UPROPERTY()
    bool m_bUseAIControlledMotion;
    UPROPERTY()
    int m_ESMTriggerListenerID;
    UPROPERTY()
    float32 m_ElapsedTime;
    UPROPERTY()
    bool m_bIsObstacleDetour;
    UPROPERTY()
    bool m_bIsChainedStartEntryPrefix;
    UPROPERTY()
    bool m_bSorptionCompleted;

    FSimulateData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSimulateData(const FSimulateData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSimulateData(const FC_AIPathFollowV2 &inout PathFollow)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSimulateData(const FC_AIPathFollowV2 &inout PathFollow, const FVector &inout InTargetPoint, const EAISimulateMoveType InMoveType)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSimulateData opAssign(const FSimulateData &inout Other)
    {
        FSimulateData __r;
        this.SetTargetPoint(Other.GetTargetPoint());
        this.SetMoveType(Other.GetMoveType());
        this.SetMoveStance(Other.GetMoveStance());
        this.SetSimulateState(Other.GetSimulateState());
        this.SetbHasTrigger(Other.GetbHasTrigger());
        this.SetMoveSimulateType(Other.GetMoveSimulateType());
        this.SetTurnTargetDirection(Other.GetTurnTargetDirection());
        this.SetJumpSorptionTargetLocation(Other.GetJumpSorptionTargetLocation());
        this.SetJumpSorptionStartLocation(Other.GetJumpSorptionStartLocation());
        this.SetPathPointListMoveList(Other.GetPathPointListMoveList());
        this.SetCurrentPathPointMoveIndex(Other.GetCurrentPathPointMoveIndex());
        this.SetbUseAIControlledMotion(Other.GetbUseAIControlledMotion());
        this.SetESMTriggerListenerID(Other.GetESMTriggerListenerID());
        this.SetElapsedTime(Other.GetElapsedTime());
        this.SetbIsObstacleDetour(Other.GetbIsObstacleDetour());
        this.SetbIsChainedStartEntryPrefix(Other.GetbIsChainedStartEntryPrefix());
        this.SetbSorptionCompleted(Other.GetbSorptionCompleted());
        return __r;
    }
    const FVector GetTargetPoint() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TargetPoint() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTargetPoint(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TargetPoint = __Value;
        return;
    }
    EAISimulateMoveType GetMoveType() const property
    {
        return this.m_MoveType;
    }
    void SetMoveType(const EAISimulateMoveType __Value) property
    {
        if (int(this.m_MoveType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MoveType = __Value;
        return;
    }
    ECharacterMoveStance GetMoveStance() const property
    {
        return this.m_MoveStance;
    }
    void SetMoveStance(const ECharacterMoveStance __Value) property
    {
        if (int(this.m_MoveStance) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_MoveStance = __Value;
        return;
    }
    EAIPathSimulateState GetSimulateState() const property
    {
        return this.m_SimulateState;
    }
    void SetSimulateState(const EAIPathSimulateState __Value) property
    {
        this.m_SimulateState = __Value;
        return;
    }
    bool GetbHasTrigger() const property
    {
        return this.m_bHasTrigger;
    }
    void SetbHasTrigger(const bool __Value) property
    {
        this.m_bHasTrigger = __Value;
        return;
    }
    EAIMoveSimulateType GetMoveSimulateType() const property
    {
        return this.m_MoveSimulateType;
    }
    void SetMoveSimulateType(const EAIMoveSimulateType __Value) property
    {
        if (int(this.m_MoveSimulateType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_MoveSimulateType = __Value;
        return;
    }
    const FVector GetTurnTargetDirection() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TurnTargetDirection() property
    {
        FVector __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetTurnTargetDirection(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_TurnTargetDirection = __Value;
        return;
    }
    const FVector GetJumpSorptionTargetLocation() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_JumpSorptionTargetLocation() property
    {
        FVector __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetJumpSorptionTargetLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_JumpSorptionTargetLocation = __Value;
        return;
    }
    const FVector GetJumpSorptionStartLocation() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetJumpSorptionStartLocation() property
    {
        FVector __r;
        return __r;
    }
    void SetJumpSorptionStartLocation(const FVector &inout __Value) property
    {
        this.m_JumpSorptionStartLocation = __Value;
        return;
    }
    const TArray<FVector> GetPathPointListMoveList() const property
    {
        const TArray<FVector> __r;
        return __r;
    }
    TArray<FVector> GetPathPointListMoveList() property
    {
        TArray<FVector> __r;
        return __r;
    }
    void SetPathPointListMoveList(const TArray<FVector> &inout __Value) property
    {
        this.m_PathPointListMoveList = __Value;
        return;
    }
    int GetCurrentPathPointMoveIndex() const property
    {
        return this.m_CurrentPathPointMoveIndex;
    }
    void SetCurrentPathPointMoveIndex(const int __Value) property
    {
        this.m_CurrentPathPointMoveIndex = __Value;
        return;
    }
    bool GetbUseAIControlledMotion() const property
    {
        return this.m_bUseAIControlledMotion;
    }
    void SetbUseAIControlledMotion(const bool __Value) property
    {
        if (!(this.m_bUseAIControlledMotion) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_bUseAIControlledMotion = __Value;
        return;
    }
    int GetESMTriggerListenerID() const property
    {
        return this.m_ESMTriggerListenerID;
    }
    void SetESMTriggerListenerID(const int __Value) property
    {
        this.m_ESMTriggerListenerID = __Value;
        return;
    }
    float32 GetElapsedTime() const property
    {
        return this.m_ElapsedTime;
    }
    void SetElapsedTime(const float32 __Value) property
    {
        this.m_ElapsedTime = __Value;
        return;
    }
    bool GetbIsObstacleDetour() const property
    {
        return this.m_bIsObstacleDetour;
    }
    void SetbIsObstacleDetour(const bool __Value) property
    {
        this.m_bIsObstacleDetour = __Value;
        return;
    }
    bool GetbIsChainedStartEntryPrefix() const property
    {
        return this.m_bIsChainedStartEntryPrefix;
    }
    void SetbIsChainedStartEntryPrefix(const bool __Value) property
    {
        if (!(this.m_bIsChainedStartEntryPrefix) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_bIsChainedStartEntryPrefix = __Value;
        return;
    }
    bool GetbSorptionCompleted() const property
    {
        return this.m_bSorptionCompleted;
    }
    void SetbSorptionCompleted(const bool __Value) property
    {
        this.m_bSorptionCompleted = __Value;
        return;
    }
}

struct FC_AIPathSimulateSyncData : FECSComponent
{
    UPROPERTY()
    TArray<FSimulateData> m_SimulateList;

    FC_AIPathSimulateSyncData()
    {
        return;
    }
    const TArray<FSimulateData> GetSimulateList() const property
    {
        const TArray<FSimulateData> __r;
        return __r;
    }
    TArray<FSimulateData> GetSimulateList() property
    {
        TArray<FSimulateData> __r;
        return __r;
    }
    void SetSimulateList(const TArray<FSimulateData> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FC_AIPathSimulate : FECSComponent
{
    UPROPERTY()
    TArray<FSimulateData> m_SimulateList;
    UPROPERTY()
    int m_SyncedSimulateSourceIndex = 0;
    UPROPERTY()
    bool m_bSimulateGenerateCompleted = false;
    UPROPERTY()
    int m_CurrentSimulateIndex = 0;
    UPROPERTY()
    int m_CurrentFollowPathIndex = 0;
    UPROPERTY()
    bool m_bChainedStartEntryPrefixTried = false;
    UPROPERTY()
    int m_ChainedStartEntryPrefixEndIndex = -1;
    UPROPERTY()
    float m_DistanceToCurrentEnd = 3.4028234663852886e38;
    UPROPERTY()
    float32 m_OffsetDistanceToCurrentSegment = 0.0f;
    UPROPERTY()
    FVector m_LastTickPostion;
    UPROPERTY()
    FVector m_RecentOffset;
    UPROPERTY()
    FVector2D m_RecentOffset2D;
    UPROPERTY()
    float32 m_StuckCheckElapsedTime = 0.0f;
    UPROPERTY()
    bool m_bNeedStuckTryUpstairs;
    UPROPERTY()
    bool m_bHasStuckUpstairs = false;
    UPROPERTY()
    bool m_bUpstairsTryFailed;
    UPROPERTY()
    bool m_bStuck;
    UPROPERTY()
    bool m_bSessionStuckSnapshotValid = false;
    UPROPERTY()
    FVector m_SessionStuckSnapshotPosition;
    UPROPERTY()
    FVector m_SessionStuckSnapshotNetOffset;
    UPROPERTY()
    float32 m_SessionStuckSnapshotElapsedTime = 0.0f;
    UPROPERTY()
    int m_SessionStuckSnapshotSimulateIndex = -1;
    UPROPERTY()
    FVector m_SessionStuckSnapshotSegmentTarget;
    UPROPERTY()
    bool m_bHasLastRequestedMoveInput = false;
    UPROPERTY()
    FVector m_LastRequestedMoveInput;
    UPROPERTY()
    EAIInputSpace m_LastRequestedInputSpace = EAIInputSpace(1);
    UPROPERTY()
    EAIMoveSimulateType m_LastRequestedMoveSimulateType = EAIMoveSimulateType(0);
    UPROPERTY()
    bool m_bLastRequestedUseAIControlledMotion = false;
    UPROPERTY()
    bool m_bMovementStateMismatch = false;
    UPROPERTY()
    TArray<FVector> m_ApproachPathPrediction;
    UPROPERTY()
    float32 m_ObstacleDetourCheckTimer = 0.0f;
    UPROPERTY()
    float32 m_RVOLocalCorridorCreateCooldown = 0.0f;


    const TArray<FSimulateData> GetSimulateList() const property
    {
        const TArray<FSimulateData> __r;
        return __r;
    }
    TArray<FSimulateData> GetSimulateList() property
    {
        TArray<FSimulateData> __r;
        return __r;
    }
    void SetSimulateList(const TArray<FSimulateData> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    int GetSyncedSimulateSourceIndex() const property
    {
        return this.m_SyncedSimulateSourceIndex;
    }
    void SetSyncedSimulateSourceIndex(const int __Value) property
    {
        this.m_SyncedSimulateSourceIndex = __Value;
        return;
    }
    bool GetbSimulateGenerateCompleted() const property
    {
        return this.m_bSimulateGenerateCompleted;
    }
    void SetbSimulateGenerateCompleted(const bool __Value) property
    {
        this.m_bSimulateGenerateCompleted = __Value;
        return;
    }
    int GetCurrentSimulateIndex() const property
    {
        return this.m_CurrentSimulateIndex;
    }
    void SetCurrentSimulateIndex(const int __Value) property
    {
        this.m_CurrentSimulateIndex = __Value;
        return;
    }
    int GetCurrentFollowPathIndex() const property
    {
        return this.m_CurrentFollowPathIndex;
    }
    void SetCurrentFollowPathIndex(const int __Value) property
    {
        this.m_CurrentFollowPathIndex = __Value;
        return;
    }
    bool GetbChainedStartEntryPrefixTried() const property
    {
        return this.m_bChainedStartEntryPrefixTried;
    }
    void SetbChainedStartEntryPrefixTried(const bool __Value) property
    {
        this.m_bChainedStartEntryPrefixTried = __Value;
        return;
    }
    int GetChainedStartEntryPrefixEndIndex() const property
    {
        return this.m_ChainedStartEntryPrefixEndIndex;
    }
    void SetChainedStartEntryPrefixEndIndex(const int __Value) property
    {
        this.m_ChainedStartEntryPrefixEndIndex = __Value;
        return;
    }
    float GetDistanceToCurrentEnd() const property
    {
        return this.m_DistanceToCurrentEnd;
    }
    void SetDistanceToCurrentEnd(const float __Value) property
    {
        this.m_DistanceToCurrentEnd = __Value;
        return;
    }
    float32 GetOffsetDistanceToCurrentSegment() const property
    {
        return this.m_OffsetDistanceToCurrentSegment;
    }
    void SetOffsetDistanceToCurrentSegment(const float32 __Value) property
    {
        this.m_OffsetDistanceToCurrentSegment = __Value;
        return;
    }
    const FVector GetLastTickPostion() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetLastTickPostion() property
    {
        FVector __r;
        return __r;
    }
    void SetLastTickPostion(const FVector &inout __Value) property
    {
        this.m_LastTickPostion = __Value;
        return;
    }
    const FVector GetRecentOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetRecentOffset() property
    {
        FVector __r;
        return __r;
    }
    void SetRecentOffset(const FVector &inout __Value) property
    {
        this.m_RecentOffset = __Value;
        return;
    }
    const FVector2D GetRecentOffset2D() const property
    {
        const FVector2D __r;
        return __r;
    }
    FVector2D GetRecentOffset2D() property
    {
        FVector2D __r;
        return __r;
    }
    void SetRecentOffset2D(const FVector2D &inout __Value) property
    {
        this.m_RecentOffset2D = __Value;
        return;
    }
    float32 GetStuckCheckElapsedTime() const property
    {
        return this.m_StuckCheckElapsedTime;
    }
    void SetStuckCheckElapsedTime(const float32 __Value) property
    {
        this.m_StuckCheckElapsedTime = __Value;
        return;
    }
    bool GetbNeedStuckTryUpstairs() const property
    {
        return this.m_bNeedStuckTryUpstairs;
    }
    void SetbNeedStuckTryUpstairs(const bool __Value) property
    {
        this.m_bNeedStuckTryUpstairs = __Value;
        return;
    }
    bool GetbHasStuckUpstairs() const property
    {
        return this.m_bHasStuckUpstairs;
    }
    void SetbHasStuckUpstairs(const bool __Value) property
    {
        this.m_bHasStuckUpstairs = __Value;
        return;
    }
    bool GetbUpstairsTryFailed() const property
    {
        return this.m_bUpstairsTryFailed;
    }
    void SetbUpstairsTryFailed(const bool __Value) property
    {
        this.m_bUpstairsTryFailed = __Value;
        return;
    }
    bool GetbStuck() const property
    {
        return this.m_bStuck;
    }
    void SetbStuck(const bool __Value) property
    {
        this.m_bStuck = __Value;
        return;
    }
    bool GetbSessionStuckSnapshotValid() const property
    {
        return this.m_bSessionStuckSnapshotValid;
    }
    void SetbSessionStuckSnapshotValid(const bool __Value) property
    {
        this.m_bSessionStuckSnapshotValid = __Value;
        return;
    }
    const FVector GetSessionStuckSnapshotPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetSessionStuckSnapshotPosition() property
    {
        FVector __r;
        return __r;
    }
    void SetSessionStuckSnapshotPosition(const FVector &inout __Value) property
    {
        this.m_SessionStuckSnapshotPosition = __Value;
        return;
    }
    const FVector GetSessionStuckSnapshotNetOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetSessionStuckSnapshotNetOffset() property
    {
        FVector __r;
        return __r;
    }
    void SetSessionStuckSnapshotNetOffset(const FVector &inout __Value) property
    {
        this.m_SessionStuckSnapshotNetOffset = __Value;
        return;
    }
    float32 GetSessionStuckSnapshotElapsedTime() const property
    {
        return this.m_SessionStuckSnapshotElapsedTime;
    }
    void SetSessionStuckSnapshotElapsedTime(const float32 __Value) property
    {
        this.m_SessionStuckSnapshotElapsedTime = __Value;
        return;
    }
    int GetSessionStuckSnapshotSimulateIndex() const property
    {
        return this.m_SessionStuckSnapshotSimulateIndex;
    }
    void SetSessionStuckSnapshotSimulateIndex(const int __Value) property
    {
        this.m_SessionStuckSnapshotSimulateIndex = __Value;
        return;
    }
    const FVector GetSessionStuckSnapshotSegmentTarget() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetSessionStuckSnapshotSegmentTarget() property
    {
        FVector __r;
        return __r;
    }
    void SetSessionStuckSnapshotSegmentTarget(const FVector &inout __Value) property
    {
        this.m_SessionStuckSnapshotSegmentTarget = __Value;
        return;
    }
    bool GetbHasLastRequestedMoveInput() const property
    {
        return this.m_bHasLastRequestedMoveInput;
    }
    void SetbHasLastRequestedMoveInput(const bool __Value) property
    {
        this.m_bHasLastRequestedMoveInput = __Value;
        return;
    }
    const FVector GetLastRequestedMoveInput() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetLastRequestedMoveInput() property
    {
        FVector __r;
        return __r;
    }
    void SetLastRequestedMoveInput(const FVector &inout __Value) property
    {
        this.m_LastRequestedMoveInput = __Value;
        return;
    }
    EAIInputSpace GetLastRequestedInputSpace() const property
    {
        return this.m_LastRequestedInputSpace;
    }
    void SetLastRequestedInputSpace(const EAIInputSpace __Value) property
    {
        this.m_LastRequestedInputSpace = __Value;
        return;
    }
    EAIMoveSimulateType GetLastRequestedMoveSimulateType() const property
    {
        return this.m_LastRequestedMoveSimulateType;
    }
    void SetLastRequestedMoveSimulateType(const EAIMoveSimulateType __Value) property
    {
        this.m_LastRequestedMoveSimulateType = __Value;
        return;
    }
    bool GetbLastRequestedUseAIControlledMotion() const property
    {
        return this.m_bLastRequestedUseAIControlledMotion;
    }
    void SetbLastRequestedUseAIControlledMotion(const bool __Value) property
    {
        this.m_bLastRequestedUseAIControlledMotion = __Value;
        return;
    }
    bool GetbMovementStateMismatch() const property
    {
        return this.m_bMovementStateMismatch;
    }
    void SetbMovementStateMismatch(const bool __Value) property
    {
        this.m_bMovementStateMismatch = __Value;
        return;
    }
    const TArray<FVector> GetApproachPathPrediction() const property
    {
        const TArray<FVector> __r;
        return __r;
    }
    TArray<FVector> GetApproachPathPrediction() property
    {
        TArray<FVector> __r;
        return __r;
    }
    void SetApproachPathPrediction(const TArray<FVector> &inout __Value) property
    {
        this.m_ApproachPathPrediction = __Value;
        return;
    }
    float32 GetObstacleDetourCheckTimer() const property
    {
        return this.m_ObstacleDetourCheckTimer;
    }
    void SetObstacleDetourCheckTimer(const float32 __Value) property
    {
        this.m_ObstacleDetourCheckTimer = __Value;
        return;
    }
    float32 GetRVOLocalCorridorCreateCooldown() const property
    {
        return this.m_RVOLocalCorridorCreateCooldown;
    }
    void SetRVOLocalCorridorCreateCooldown(const float32 __Value) property
    {
        this.m_RVOLocalCorridorCreateCooldown = __Value;
        return;
    }
}

struct FC_AIRVOLocalCorridor : FECSComponent
{
    UPROPERTY()
    bool bActive = false;
    UPROPERTY()
    int AnchorSimulateIndex = -1;
    UPROPERTY()
    TArray<FVector> Points;
    UPROPERTY()
    int CurrentPointIndex = 0;
    UPROPERTY()
    float32 ElapsedTime = 0.0f;
    UPROPERTY()
    float32 AllowedOffset = 0.0f;
    UPROPERTY()
    float32 HardRepathOffset = 0.0f;


}

struct FAIPathSimulateMoveParam
{
    UPROPERTY()
    bool bOnlyHorizontal;
    UPROPERTY()
    FVector AIControllMotionTarget;
    UPROPERTY()
    bool HasNextTarget;
    UPROPERTY()
    FVector AIControllMotionNextTarget;
    UPROPERTY()
    EAIInputSpace InputSpace = EAIInputSpace(1);
    UPROPERTY()
    bool bHorizontalOnly = true;
    UPROPERTY()
    ECharacterMoveStance MoveStance;
    UPROPERTY()
    EAIMoveSimulateType MoveSimulateType;
    UPROPERTY()
    bool bUseAIControlledMotion;
    UPROPERTY()
    TArray<FVector> MovePath;
    UPROPERTY()
    bool bHasMoveInput;
    UPROPERTY()
    FVector MoveInput;
    UPROPERTY()
    bool bHasViewInput;
    UPROPERTY()
    FRotator ViewInput;


    void SetMoveInput(const FVector &inout InMoveInput)
    {
        this.bHasMoveInput = true;
        this.MoveInput = InMoveInput;
        return;
    }
    void SetViewInput(const FRotator &inout InViewInput)
    {
        this.bHasViewInput = true;
        this.ViewInput = InViewInput;
        return;
    }
}

struct FC_AIStandTurnConfig : FECSComponent
{
    UPROPERTY()
    bool bEnableStartTurn = true;
    UPROPERTY()
    bool bEnableMidPathTurn = true;
    UPROPERTY()
    bool bEnableEndTurn = true;
    UPROPERTY()
    bool bEnableJumpStartTurn = false;
    UPROPERTY()
    float32 StartTurnAngleThreshold = 90.0f;
    UPROPERTY()
    float32 MidPathTurnAngleThreshold = 120.0f;
    UPROPERTY()
    float32 EndTurnAngleThreshold = 30.0f;
    UPROPERTY()
    float32 JumpStartTurnAngleThreshold = 10.0f;


}

struct FC_AIPredictedMovePath : FECSComponent
{
    UPROPERTY()
    FTransform NextDeltaTransform;

    FC_AIPredictedMovePath()
    {
        return;
    }
}

struct FAIPathFindingV2History
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FVector m_Origin = FVector::ZeroVector;
    UPROPERTY()
    FVector m_TargetPosition = FVector::ZeroVector;
    UPROPERTY()
    bool m_bUseDirPlanPath = false;
    UPROPERTY()
    FVector m_OriginDir = FVector::ZeroVector;
    UPROPERTY()
    FVector m_TargetDir = FVector::ZeroVector;
    UPROPERTY()
    bool m_bHasResurlt = false;
    UPROPERTY()
    TArray<int> m_ResultPathFlag;
    UPROPERTY()
    TArray<FVector> m_ResultPath;
    UPROPERTY()
    int64 m_CompleteTime;

    FAIPathFindingV2History(const FAIPathFindingV2History &inout Other)
    {
        this.m_Origin = Other.m_Origin;
        this.m_TargetPosition = Other.m_TargetPosition;
        this.m_bUseDirPlanPath = Other.m_bUseDirPlanPath;
        this.m_OriginDir = Other.m_OriginDir;
        this.m_TargetDir = Other.m_TargetDir;
        this.m_bHasResurlt = Other.m_bHasResurlt;
        this.m_ResultPathFlag = Other.m_ResultPathFlag;
        this.m_ResultPath = Other.m_ResultPath;
        this.m_CompleteTime = Other.m_CompleteTime;
        return;
    }
    FAIPathFindingV2History(const int64 InCompleteTime, const FC_AIPathFinding &inout PathFinding, const FC_AIPathFindingDebugInfo &inout DebugInfo)
    {
        this.SetCompleteTime(InCompleteTime);
        return;
    }
    FAIPathFindingV2History opAssign(const FAIPathFindingV2History &inout Other)
    {
        FAIPathFindingV2History __r;
        this.SetOrigin(Other.GetOrigin());
        this.SetTargetPosition(Other.GetTargetPosition());
        this.SetbUseDirPlanPath(Other.GetbUseDirPlanPath());
        this.SetOriginDir(Other.GetOriginDir());
        this.SetTargetDir(Other.GetTargetDir());
        this.SetbHasResurlt(Other.GetbHasResurlt());
        this.SetResultPathFlag(Other.GetResultPathFlag());
        this.SetResultPath(Other.GetResultPath());
        this.SetCompleteTime(Other.GetCompleteTime());
        return __r;
    }
    const FVector GetOrigin() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_Origin() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetOrigin(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Origin = __Value;
        return;
    }
    FVector GetTargetPosition() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_TargetPosition() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetTargetPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TargetPosition = __Value;
        return;
    }
    bool GetbUseDirPlanPath() const property
    {
        return this.m_bUseDirPlanPath;
    }
    void SetbUseDirPlanPath(const bool __Value) property
    {
        if (!(this.m_bUseDirPlanPath) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bUseDirPlanPath = __Value;
        return;
    }
    const FVector GetOriginDir() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_OriginDir() property
    {
        FVector __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetOriginDir(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_OriginDir = __Value;
        return;
    }
    const FVector GetTargetDir() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TargetDir() property
    {
        FVector __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetTargetDir(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_TargetDir = __Value;
        return;
    }
    bool GetbHasResurlt() const property
    {
        return this.m_bHasResurlt;
    }
    void SetbHasResurlt(const bool __Value) property
    {
        if (!(this.m_bHasResurlt) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bHasResurlt = __Value;
        return;
    }
    const TArray<int> GetResultPathFlag() const property
    {
        const TArray<int> __r;
        return __r;
    }
    TArray<int> GetModify_ResultPathFlag() property
    {
        TArray<int> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetResultPathFlag(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_ResultPathFlag = __Value;
        return;
    }
    const TArray<FVector> GetResultPath() const property
    {
        const TArray<FVector> __r;
        return __r;
    }
    TArray<FVector> GetModify_ResultPath() property
    {
        TArray<FVector> __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetResultPath(const TArray<FVector> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_ResultPath = __Value;
        return;
    }
    int64 GetCompleteTime() const property
    {
        return this.m_CompleteTime;
    }
    void SetCompleteTime(const int64 __Value) property
    {
        if (this.m_CompleteTime == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_CompleteTime = __Value;
        return;
    }
}

struct FC_AIPathFollowV2History : FECSComponent
{
    UPROPERTY()
    int HistoryNum = 3;
    UPROPERTY()
    TArray<FAIPathFindingV2History> History;


}

namespace ECSFunc_FC_AIPathFinding_AsyncInProcessTag
{
UFUNCTION()
bool HasAIPathFinding_AsyncInProcessTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIPathFinding_AsyncInProcessTag);
}
FC_AIPathFinding_AsyncInProcessTag& AssignAIPathFinding_AsyncInProcessTag(const FECSEntity &inout Entity, const FC_AIPathFinding_AsyncInProcessTag &inout DefaultValue = FC_AIPathFinding_AsyncInProcessTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIPathFinding_AsyncInProcessTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIPathFinding_AsyncInProcessTag_BP(const FECSEntity &inout Entity, const FC_AIPathFinding_AsyncInProcessTag &inout DefaultValue = FC_AIPathFinding_AsyncInProcessTag())
{
    ECSFunc_FC_AIPathFinding_AsyncInProcessTag::AssignAIPathFinding_AsyncInProcessTag(Entity, DefaultValue);
    return;
}
FC_AIPathFinding_AsyncInProcessTag& ModifyAIPathFinding_AsyncInProcessTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIPathFinding_AsyncInProcessTag));
    return local_12.GetComp();
}
FC_AIPathFinding_AsyncInProcessTag& ModifyOrAddAIPathFinding_AsyncInProcessTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIPathFinding_AsyncInProcessTag));
    return local_12.GetComp();
}
const FC_AIPathFinding_AsyncInProcessTag& GetAIPathFinding_AsyncInProcessTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIPathFinding_AsyncInProcessTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIPathFinding_AsyncInProcessTag GetAIPathFinding_AsyncInProcessTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIPathFinding_AsyncInProcessTag& local_4 = ECSFunc_FC_AIPathFinding_AsyncInProcessTag::GetAIPathFinding_AsyncInProcessTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIPathFinding_AsyncInProcessTag();
}
const FC_AIPathFinding_AsyncInProcessTag GetDefaultedAIPathFinding_AsyncInProcessTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIPathFinding_AsyncInProcessTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIPathFinding_AsyncInProcessTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AIPathFinding_AsyncInProcessTag GetDefaultedAIPathFinding_AsyncInProcessTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIPathFinding_AsyncInProcessTag::GetDefaultedAIPathFinding_AsyncInProcessTag(Entity);
}
UFUNCTION()
bool RemoveAIPathFinding_AsyncInProcessTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIPathFinding_AsyncInProcessTag);
}
}
FECSMonitorRuntimeView __GetMonitorAIPathFinding_AsyncInProcessTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIPathFinding_AsyncInProcessTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFinding_AsyncInProcessTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIPathFinding_AsyncInProcessTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFinding_AsyncInProcessTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIPathFinding_AsyncInProcessTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFinding_AsyncInProcessTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIPathFinding_AsyncInProcessTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFinding_AsyncInProcessTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIPathFinding_AsyncInProcessTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAIPathFinding_AsyncInProcessTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIPathFinding_AsyncInProcessTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathFinding_AsyncInProcessTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIPathFinding_AsyncInProcessTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathFinding_AsyncInProcessTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIPathFinding_AsyncInProcessTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIPathFinding_SucceedTag
{
UFUNCTION()
bool HasAIPathFinding_SucceedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIPathFinding_SucceedTag);
}
FC_AIPathFinding_SucceedTag& AssignAIPathFinding_SucceedTag(const FECSEntity &inout Entity, const FC_AIPathFinding_SucceedTag &inout DefaultValue = FC_AIPathFinding_SucceedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIPathFinding_SucceedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIPathFinding_SucceedTag_BP(const FECSEntity &inout Entity, const FC_AIPathFinding_SucceedTag &inout DefaultValue = FC_AIPathFinding_SucceedTag())
{
    ECSFunc_FC_AIPathFinding_SucceedTag::AssignAIPathFinding_SucceedTag(Entity, DefaultValue);
    return;
}
FC_AIPathFinding_SucceedTag& ModifyAIPathFinding_SucceedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIPathFinding_SucceedTag));
    return local_12.GetComp();
}
FC_AIPathFinding_SucceedTag& ModifyOrAddAIPathFinding_SucceedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIPathFinding_SucceedTag));
    return local_12.GetComp();
}
const FC_AIPathFinding_SucceedTag& GetAIPathFinding_SucceedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIPathFinding_SucceedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIPathFinding_SucceedTag GetAIPathFinding_SucceedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIPathFinding_SucceedTag& local_4 = ECSFunc_FC_AIPathFinding_SucceedTag::GetAIPathFinding_SucceedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIPathFinding_SucceedTag();
}
const FC_AIPathFinding_SucceedTag GetDefaultedAIPathFinding_SucceedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIPathFinding_SucceedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIPathFinding_SucceedTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AIPathFinding_SucceedTag GetDefaultedAIPathFinding_SucceedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIPathFinding_SucceedTag::GetDefaultedAIPathFinding_SucceedTag(Entity);
}
UFUNCTION()
bool RemoveAIPathFinding_SucceedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIPathFinding_SucceedTag);
}
}
FECSMonitorRuntimeView __GetMonitorAIPathFinding_SucceedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIPathFinding_SucceedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFinding_SucceedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIPathFinding_SucceedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFinding_SucceedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIPathFinding_SucceedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFinding_SucceedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIPathFinding_SucceedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFinding_SucceedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIPathFinding_SucceedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAIPathFinding_SucceedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIPathFinding_SucceedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathFinding_SucceedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIPathFinding_SucceedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathFinding_SucceedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIPathFinding_SucceedTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIPathFollowV2
{
UFUNCTION()
bool HasAIPathFollowV2(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowV2);
}
FC_AIPathFollowV2& AssignAIPathFollowV2(const FECSEntity &inout Entity, const FC_AIPathFollowV2 &inout DefaultValue = FC_AIPathFollowV2())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowV2, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIPathFollowV2_BP(const FECSEntity &inout Entity, const FC_AIPathFollowV2 &inout DefaultValue = FC_AIPathFollowV2())
{
    ECSFunc_FC_AIPathFollowV2::AssignAIPathFollowV2(Entity, DefaultValue);
    return;
}
FC_AIPathFollowV2& ModifyAIPathFollowV2(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowV2));
    return local_12.GetComp();
}
FC_AIPathFollowV2& ModifyOrAddAIPathFollowV2(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowV2));
    return local_12.GetComp();
}
const FC_AIPathFollowV2& GetAIPathFollowV2(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowV2));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIPathFollowV2 GetAIPathFollowV2_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AIPathFollowV2 __r;
    bValid = false;
    bValid = ECSFunc_FC_AIPathFollowV2::GetAIPathFollowV2(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AIPathFollowV2 GetDefaultedAIPathFollowV2(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIPathFollowV2 __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowV2);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AIPathFollowV2 GetDefaultedAIPathFollowV2_BP(const FECSEntity &inout Entity)
{
    FC_AIPathFollowV2 __r;
    return __r;
}
UFUNCTION()
bool RemoveAIPathFollowV2(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowV2);
}
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowV2OnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIPathFollowV2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowV2OnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIPathFollowV2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowV2OnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIPathFollowV2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowV2OnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIPathFollowV2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowV2OnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIPathFollowV2, bFixedFrame, bMustHandleAll);
}
void __MonitorAIPathFollowV2Lifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIPathFollowV2, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathFollowV2Activity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIPathFollowV2, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathFollowV2Modification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIPathFollowV2, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIPathSimulateSyncData
{
UFUNCTION()
bool HasAIPathSimulateSyncData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIPathSimulateSyncData);
}
FC_AIPathSimulateSyncData& AssignAIPathSimulateSyncData(const FECSEntity &inout Entity, const FC_AIPathSimulateSyncData &inout DefaultValue = FC_AIPathSimulateSyncData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIPathSimulateSyncData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIPathSimulateSyncData_BP(const FECSEntity &inout Entity, const FC_AIPathSimulateSyncData &inout DefaultValue = FC_AIPathSimulateSyncData())
{
    ECSFunc_FC_AIPathSimulateSyncData::AssignAIPathSimulateSyncData(Entity, DefaultValue);
    return;
}
FC_AIPathSimulateSyncData& ModifyAIPathSimulateSyncData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIPathSimulateSyncData));
    return local_12.GetComp();
}
FC_AIPathSimulateSyncData& ModifyOrAddAIPathSimulateSyncData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIPathSimulateSyncData));
    return local_12.GetComp();
}
const FC_AIPathSimulateSyncData& GetAIPathSimulateSyncData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIPathSimulateSyncData));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIPathSimulateSyncData GetAIPathSimulateSyncData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AIPathSimulateSyncData __r;
    bValid = false;
    bValid = ECSFunc_FC_AIPathSimulateSyncData::GetAIPathSimulateSyncData(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AIPathSimulateSyncData GetDefaultedAIPathSimulateSyncData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIPathSimulateSyncData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIPathSimulateSyncData);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AIPathSimulateSyncData GetDefaultedAIPathSimulateSyncData_BP(const FECSEntity &inout Entity)
{
    FC_AIPathSimulateSyncData __r;
    return __r;
}
UFUNCTION()
bool RemoveAIPathSimulateSyncData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIPathSimulateSyncData);
}
}
FECSMonitorRuntimeView __GetMonitorAIPathSimulateSyncDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIPathSimulateSyncData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathSimulateSyncDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIPathSimulateSyncData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathSimulateSyncDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIPathSimulateSyncData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathSimulateSyncDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIPathSimulateSyncData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathSimulateSyncDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIPathSimulateSyncData, bFixedFrame, bMustHandleAll);
}
void __MonitorAIPathSimulateSyncDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIPathSimulateSyncData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathSimulateSyncDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIPathSimulateSyncData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathSimulateSyncDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIPathSimulateSyncData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIPathSimulate
{
UFUNCTION()
bool HasAIPathSimulate(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIPathSimulate);
}
FC_AIPathSimulate& AssignAIPathSimulate(const FECSEntity &inout Entity, const FC_AIPathSimulate &inout DefaultValue = FC_AIPathSimulate())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIPathSimulate, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIPathSimulate_BP(const FECSEntity &inout Entity, const FC_AIPathSimulate &inout DefaultValue = FC_AIPathSimulate())
{
    ECSFunc_FC_AIPathSimulate::AssignAIPathSimulate(Entity, DefaultValue);
    return;
}
FC_AIPathSimulate& ModifyAIPathSimulate(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIPathSimulate));
    return local_12.GetComp();
}
FC_AIPathSimulate& ModifyOrAddAIPathSimulate(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIPathSimulate));
    return local_12.GetComp();
}
const FC_AIPathSimulate& GetAIPathSimulate(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIPathSimulate));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIPathSimulate GetAIPathSimulate_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AIPathSimulate __r;
    bValid = false;
    bValid = ECSFunc_FC_AIPathSimulate::GetAIPathSimulate(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AIPathSimulate GetDefaultedAIPathSimulate(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIPathSimulate __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIPathSimulate);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AIPathSimulate GetDefaultedAIPathSimulate_BP(const FECSEntity &inout Entity)
{
    FC_AIPathSimulate __r;
    return __r;
}
UFUNCTION()
bool RemoveAIPathSimulate(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIPathSimulate);
}
}
FECSMonitorRuntimeView __GetMonitorAIPathSimulateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIPathSimulate, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathSimulateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIPathSimulate, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathSimulateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIPathSimulate, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathSimulateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIPathSimulate, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathSimulateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIPathSimulate, bFixedFrame, bMustHandleAll);
}
void __MonitorAIPathSimulateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIPathSimulate, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathSimulateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIPathSimulate, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathSimulateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIPathSimulate, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIRVOLocalCorridor
{
UFUNCTION()
bool HasAIRVOLocalCorridor(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIRVOLocalCorridor);
}
FC_AIRVOLocalCorridor& AssignAIRVOLocalCorridor(const FECSEntity &inout Entity, const FC_AIRVOLocalCorridor &inout DefaultValue = FC_AIRVOLocalCorridor())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIRVOLocalCorridor, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIRVOLocalCorridor_BP(const FECSEntity &inout Entity, const FC_AIRVOLocalCorridor &inout DefaultValue = FC_AIRVOLocalCorridor())
{
    ECSFunc_FC_AIRVOLocalCorridor::AssignAIRVOLocalCorridor(Entity, DefaultValue);
    return;
}
FC_AIRVOLocalCorridor& ModifyAIRVOLocalCorridor(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIRVOLocalCorridor));
    return local_12.GetComp();
}
FC_AIRVOLocalCorridor& ModifyOrAddAIRVOLocalCorridor(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIRVOLocalCorridor));
    return local_12.GetComp();
}
const FC_AIRVOLocalCorridor& GetAIRVOLocalCorridor(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIRVOLocalCorridor));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIRVOLocalCorridor GetAIRVOLocalCorridor_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AIRVOLocalCorridor __r;
    bValid = false;
    bValid = ECSFunc_FC_AIRVOLocalCorridor::GetAIRVOLocalCorridor(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AIRVOLocalCorridor GetDefaultedAIRVOLocalCorridor(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIRVOLocalCorridor __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIRVOLocalCorridor);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AIRVOLocalCorridor GetDefaultedAIRVOLocalCorridor_BP(const FECSEntity &inout Entity)
{
    FC_AIRVOLocalCorridor __r;
    return __r;
}
UFUNCTION()
bool RemoveAIRVOLocalCorridor(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIRVOLocalCorridor);
}
}
FECSMonitorRuntimeView __GetMonitorAIRVOLocalCorridorOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIRVOLocalCorridor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIRVOLocalCorridorOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIRVOLocalCorridor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIRVOLocalCorridorOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIRVOLocalCorridor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIRVOLocalCorridorOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIRVOLocalCorridor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIRVOLocalCorridorOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIRVOLocalCorridor, bFixedFrame, bMustHandleAll);
}
void __MonitorAIRVOLocalCorridorLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIRVOLocalCorridor, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIRVOLocalCorridorActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIRVOLocalCorridor, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIRVOLocalCorridorModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIRVOLocalCorridor, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIStandTurnConfig
{
UFUNCTION()
bool HasAIStandTurnConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIStandTurnConfig);
}
FC_AIStandTurnConfig& AssignAIStandTurnConfig(const FECSEntity &inout Entity, const FC_AIStandTurnConfig &inout DefaultValue = FC_AIStandTurnConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIStandTurnConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIStandTurnConfig_BP(const FECSEntity &inout Entity, const FC_AIStandTurnConfig &inout DefaultValue = FC_AIStandTurnConfig())
{
    ECSFunc_FC_AIStandTurnConfig::AssignAIStandTurnConfig(Entity, DefaultValue);
    return;
}
FC_AIStandTurnConfig& ModifyAIStandTurnConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIStandTurnConfig));
    return local_12.GetComp();
}
FC_AIStandTurnConfig& ModifyOrAddAIStandTurnConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIStandTurnConfig));
    return local_12.GetComp();
}
const FC_AIStandTurnConfig& GetAIStandTurnConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIStandTurnConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIStandTurnConfig GetAIStandTurnConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIStandTurnConfig& local_4 = ECSFunc_FC_AIStandTurnConfig::GetAIStandTurnConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIStandTurnConfig();
}
const FC_AIStandTurnConfig GetDefaultedAIStandTurnConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIStandTurnConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIStandTurnConfig);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AIStandTurnConfig GetDefaultedAIStandTurnConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIStandTurnConfig::GetDefaultedAIStandTurnConfig(Entity);
}
UFUNCTION()
bool RemoveAIStandTurnConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIStandTurnConfig);
}
}
FECSMonitorRuntimeView __GetMonitorAIStandTurnConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIStandTurnConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIStandTurnConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIStandTurnConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIStandTurnConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIStandTurnConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIStandTurnConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIStandTurnConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIStandTurnConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIStandTurnConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorAIStandTurnConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIStandTurnConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIStandTurnConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIStandTurnConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIStandTurnConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIStandTurnConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIPredictedMovePath
{
UFUNCTION()
bool HasAIPredictedMovePath(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIPredictedMovePath);
}
FC_AIPredictedMovePath& AssignAIPredictedMovePath(const FECSEntity &inout Entity, const FC_AIPredictedMovePath &inout DefaultValue = FC_AIPredictedMovePath())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIPredictedMovePath, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIPredictedMovePath_BP(const FECSEntity &inout Entity, const FC_AIPredictedMovePath &inout DefaultValue = FC_AIPredictedMovePath())
{
    ECSFunc_FC_AIPredictedMovePath::AssignAIPredictedMovePath(Entity, DefaultValue);
    return;
}
FC_AIPredictedMovePath& ModifyAIPredictedMovePath(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIPredictedMovePath));
    return local_12.GetComp();
}
FC_AIPredictedMovePath& ModifyOrAddAIPredictedMovePath(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIPredictedMovePath));
    return local_12.GetComp();
}
const FC_AIPredictedMovePath& GetAIPredictedMovePath(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIPredictedMovePath));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIPredictedMovePath GetAIPredictedMovePath_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIPredictedMovePath& local_4 = ECSFunc_FC_AIPredictedMovePath::GetAIPredictedMovePath(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIPredictedMovePath();
}
const FC_AIPredictedMovePath GetDefaultedAIPredictedMovePath(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIPredictedMovePath __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIPredictedMovePath);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AIPredictedMovePath GetDefaultedAIPredictedMovePath_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIPredictedMovePath::GetDefaultedAIPredictedMovePath(Entity);
}
UFUNCTION()
bool RemoveAIPredictedMovePath(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIPredictedMovePath);
}
}
FECSMonitorRuntimeView __GetMonitorAIPredictedMovePathOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIPredictedMovePath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPredictedMovePathOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIPredictedMovePath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPredictedMovePathOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIPredictedMovePath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPredictedMovePathOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIPredictedMovePath, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPredictedMovePathOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIPredictedMovePath, bFixedFrame, bMustHandleAll);
}
void __MonitorAIPredictedMovePathLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIPredictedMovePath, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPredictedMovePathActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIPredictedMovePath, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPredictedMovePathModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIPredictedMovePath, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIPathFollowV2History
{
UFUNCTION()
bool HasAIPathFollowV2History(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowV2History);
}
FC_AIPathFollowV2History& AssignAIPathFollowV2History(const FECSEntity &inout Entity, const FC_AIPathFollowV2History &inout DefaultValue = FC_AIPathFollowV2History())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowV2History, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIPathFollowV2History_BP(const FECSEntity &inout Entity, const FC_AIPathFollowV2History &inout DefaultValue = FC_AIPathFollowV2History())
{
    ECSFunc_FC_AIPathFollowV2History::AssignAIPathFollowV2History(Entity, DefaultValue);
    return;
}
FC_AIPathFollowV2History& ModifyAIPathFollowV2History(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowV2History));
    return local_12.GetComp();
}
FC_AIPathFollowV2History& ModifyOrAddAIPathFollowV2History(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowV2History));
    return local_12.GetComp();
}
const FC_AIPathFollowV2History& GetAIPathFollowV2History(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowV2History));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIPathFollowV2History GetAIPathFollowV2History_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AIPathFollowV2History __r;
    bValid = false;
    bValid = ECSFunc_FC_AIPathFollowV2History::GetAIPathFollowV2History(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AIPathFollowV2History GetDefaultedAIPathFollowV2History(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIPathFollowV2History __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowV2History);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_AIPathFollowV2History GetDefaultedAIPathFollowV2History_BP(const FECSEntity &inout Entity)
{
    FC_AIPathFollowV2History __r;
    return __r;
}
UFUNCTION()
bool RemoveAIPathFollowV2History(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIPathFollowV2History);
}
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowV2HistoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIPathFollowV2History, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowV2HistoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIPathFollowV2History, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowV2HistoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIPathFollowV2History, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowV2HistoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIPathFollowV2History, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIPathFollowV2HistoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIPathFollowV2History, bFixedFrame, bMustHandleAll);
}
void __MonitorAIPathFollowV2HistoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIPathFollowV2History, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathFollowV2HistoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIPathFollowV2History, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIPathFollowV2HistoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIPathFollowV2History, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FSimulateData &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FSimulateData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FSimulateData
{
int __IndexOf_TargetPoint()
{
    return 0;
}
int __IndexOf_MoveType()
{
    return 1;
}
int __IndexOf_MoveStance()
{
    return 2;
}
int __IndexOf_MoveSimulateType()
{
    return 3;
}
int __IndexOf_TurnTargetDirection()
{
    return 4;
}
int __IndexOf_JumpSorptionTargetLocation()
{
    return 5;
}
int __IndexOf_bUseAIControlledMotion()
{
    return 6;
}
int __IndexOf_bIsChainedStartEntryPrefix()
{
    return 7;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FAIPathFindingV2History &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FAIPathFindingV2History &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAIPathFindingV2History
{
int __IndexOf_Origin()
{
    return 0;
}
int __IndexOf_TargetPosition()
{
    return 1;
}
int __IndexOf_bUseDirPlanPath()
{
    return 2;
}
int __IndexOf_OriginDir()
{
    return 3;
}
int __IndexOf_TargetDir()
{
    return 4;
}
int __IndexOf_bHasResurlt()
{
    return 5;
}
int __IndexOf_ResultPathFlag()
{
    return 6;
}
int __IndexOf_ResultPath()
{
    return 7;
}
int __IndexOf_CompleteTime()
{
    return 8;
}
}

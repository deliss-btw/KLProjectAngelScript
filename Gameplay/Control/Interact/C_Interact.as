
enum EInteractType
{
    None,
    SplineMove,
    HookMove,
    SocialConnect,
    Collect,
    TeammateRescueFromDeath,
    TeammateRescueFromExecution,
    Execute,
    ExecutionRescue,
    RideAsPassenger,
    DrivePublicMount,
    TeamFlag,
    RecycleTeamFlag,
    ControlCreature,
    Dialogue,
    JointCastFireRain,
    SocialViewPage,
    LevelEntry,
    Custom,
}

enum EInteractSourceType
{
    Default = 1,
    PVXControlMonster,
}

enum EInteractionBehaviorEvaluateResult
{
    NotChecked,
    Success,
    TargetAlreadyInteracting,
    SecondarySourceInvalid,
    SecondaryTypeMismatch,
    SecondarySubTypeMismatch,
    DistanceTooNear,
    DistanceTooFar,
    FaceYawMismatch,
    AngleToSourceMismatch,
    SourceConditionFailed,
    TargetConditionFailed,
    BehaviorConditionFailed,
    TraceBlocked,
}

namespace __INTENRAL_FC_InteractKeepingTag_NS
{
    const TECSComponentDerivedPtr<FC_InteractKeepingTag> DerivedPtr = TECSComponentDerivedPtr<FC_InteractKeepingTag>();
    const FC_InteractKeepingTag DefaultValue = FC_InteractKeepingTag();
}
namespace __INTENRAL_FC_InteractSourceConfig_NS
{
    const TECSComponentDerivedPtr<FC_InteractSourceConfig> DerivedPtr = TECSComponentDerivedPtr<FC_InteractSourceConfig>();
    const FC_InteractSourceConfig DefaultValue = FC_InteractSourceConfig();
}
namespace __INTENRAL_FC_InteractionTargetConfig_NS
{
    const TECSComponentDerivedPtr<FC_InteractionTargetConfig> DerivedPtr = TECSComponentDerivedPtr<FC_InteractionTargetConfig>();
    const FC_InteractionTargetConfig DefaultValue = FC_InteractionTargetConfig();
}
namespace __INTENRAL_FC_PendingInteractSourceCount_NS
{
    const TECSComponentDerivedPtr<FC_PendingInteractSourceCount> DerivedPtr = TECSComponentDerivedPtr<FC_PendingInteractSourceCount>();
    const FC_PendingInteractSourceCount DefaultValue = FC_PendingInteractSourceCount();
}
namespace __INTENRAL_FC_RuntimeInteractTargetStatus_NS
{
    const TECSComponentDerivedPtr<FC_RuntimeInteractTargetStatus> DerivedPtr = TECSComponentDerivedPtr<FC_RuntimeInteractTargetStatus>();
    const FC_RuntimeInteractTargetStatus DefaultValue = FC_RuntimeInteractTargetStatus();
}
namespace __INTENRAL_FC_IsBeingInteractedTag_NS
{
    const TECSComponentDerivedPtr<FC_IsBeingInteractedTag> DerivedPtr = TECSComponentDerivedPtr<FC_IsBeingInteractedTag>();
    const FC_IsBeingInteractedTag DefaultValue = FC_IsBeingInteractedTag();
}
namespace __INTENRAL_FC_InteractionCandidates_NS
{
    const TECSComponentDerivedPtr<FC_InteractionCandidates> DerivedPtr = TECSComponentDerivedPtr<FC_InteractionCandidates>();
    const FC_InteractionCandidates DefaultValue = FC_InteractionCandidates();
}
namespace __INTENRAL_FC_BestInteractionTargetInfo_NS
{
    const TECSComponentDerivedPtr<FC_BestInteractionTargetInfo> DerivedPtr = TECSComponentDerivedPtr<FC_BestInteractionTargetInfo>();
    const FC_BestInteractionTargetInfo DefaultValue = FC_BestInteractionTargetInfo();
}
namespace __INTENRAL_FC_InteractTipTargetInfo_NS
{
    const TECSComponentDerivedPtr<FC_InteractTipTargetInfo> DerivedPtr = TECSComponentDerivedPtr<FC_InteractTipTargetInfo>();
    const FC_InteractTipTargetInfo DefaultValue = FC_InteractTipTargetInfo();
}
namespace __INTENRAL_FC_InteractionInfoForESM_NS
{
    const TECSComponentDerivedPtr<FC_InteractionInfoForESM> DerivedPtr = TECSComponentDerivedPtr<FC_InteractionInfoForESM>();
    const FC_InteractionInfoForESM DefaultValue = FC_InteractionInfoForESM();
}
namespace __INTENRAL_FC_BestInteractionTargetInfoModeZ_NS
{
    const TECSComponentDerivedPtr<FC_BestInteractionTargetInfoModeZ> DerivedPtr = TECSComponentDerivedPtr<FC_BestInteractionTargetInfoModeZ>();
    const FC_BestInteractionTargetInfoModeZ DefaultValue = FC_BestInteractionTargetInfoModeZ();
}
namespace __INTENRAL_FC_InteractionInfoModeZ_NS
{
    const TECSComponentDerivedPtr<FC_InteractionInfoModeZ> DerivedPtr = TECSComponentDerivedPtr<FC_InteractionInfoModeZ>();
    const FC_InteractionInfoModeZ DefaultValue = FC_InteractionInfoModeZ();
}
namespace __INTENRAL_FC_SecondaryInteractSourceInfo_NS
{
    const TECSComponentDerivedPtr<FC_SecondaryInteractSourceInfo> DerivedPtr = TECSComponentDerivedPtr<FC_SecondaryInteractSourceInfo>();
    const FC_SecondaryInteractSourceInfo DefaultValue = FC_SecondaryInteractSourceInfo();
}
namespace __INTENRAL_FC_AutoInteractSourceConfig_NS
{
    const TECSComponentDerivedPtr<FC_AutoInteractSourceConfig> DerivedPtr = TECSComponentDerivedPtr<FC_AutoInteractSourceConfig>();
    const FC_AutoInteractSourceConfig DefaultValue = FC_AutoInteractSourceConfig();
}
namespace __INTENRAL_FC_LocalInteractProgress_NS
{
    const TECSComponentDerivedPtr<FC_LocalInteractProgress> DerivedPtr = TECSComponentDerivedPtr<FC_LocalInteractProgress>();
    const FC_LocalInteractProgress DefaultValue = FC_LocalInteractProgress();
}
namespace __INTENRAL_FC_LocalInteractWithTeam_NS
{
    const TECSComponentDerivedPtr<FC_LocalInteractWithTeam> DerivedPtr = TECSComponentDerivedPtr<FC_LocalInteractWithTeam>();
    const FC_LocalInteractWithTeam DefaultValue = FC_LocalInteractWithTeam();
}
namespace __INTENRAL_FC_SecondaryInteractTargetTag_NS
{
    const TECSComponentDerivedPtr<FC_SecondaryInteractTargetTag> DerivedPtr = TECSComponentDerivedPtr<FC_SecondaryInteractTargetTag>();
    const FC_SecondaryInteractTargetTag DefaultValue = FC_SecondaryInteractTargetTag();
}
namespace __INTENRAL_FC_EnableInteractProgressTag_NS
{
    const TECSComponentDerivedPtr<FC_EnableInteractProgressTag> DerivedPtr = TECSComponentDerivedPtr<FC_EnableInteractProgressTag>();
    const FC_EnableInteractProgressTag DefaultValue = FC_EnableInteractProgressTag();
}
namespace __INTENRAL_FC_AutoInteractHoldInput_NS
{
    const TECSComponentDerivedPtr<FC_AutoInteractHoldInput> DerivedPtr = TECSComponentDerivedPtr<FC_AutoInteractHoldInput>();
    const FC_AutoInteractHoldInput DefaultValue = FC_AutoInteractHoldInput();
}
namespace __INTENRAL_FC_InteractWaitForOtherPlayerTag_NS
{
    const TECSComponentDerivedPtr<FC_InteractWaitForOtherPlayerTag> DerivedPtr = TECSComponentDerivedPtr<FC_InteractWaitForOtherPlayerTag>();
    const FC_InteractWaitForOtherPlayerTag DefaultValue = FC_InteractWaitForOtherPlayerTag();
}
namespace __INTENRAL_FC_InteractUIPageInfo_NS
{
    const TECSComponentDerivedPtr<FC_InteractUIPageInfo> DerivedPtr = TECSComponentDerivedPtr<FC_InteractUIPageInfo>();
    const FC_InteractUIPageInfo DefaultValue = FC_InteractUIPageInfo();
}
namespace __INTENRAL_FC_DelayKeepInteractPresentationTag_NS
{
    const TECSComponentDerivedPtr<FC_DelayKeepInteractPresentationTag> DerivedPtr = TECSComponentDerivedPtr<FC_DelayKeepInteractPresentationTag>();
    const FC_DelayKeepInteractPresentationTag DefaultValue = FC_DelayKeepInteractPresentationTag();

}
struct FC_InteractKeepingTag : FECSComponent
{
    FC_InteractKeepingTag()
    {
        return;
    }
}

struct FInteractActionESMBB
{
    UPROPERTY()
    FNameHandle_ESMBBTrigger ESMBBTrigger;
    UPROPERTY()
    float32 TriggerValidateTime = 0.1f;


}

struct FC_InteractSourceConfig : FECSComponent
{
    UPROPERTY()
    FESMBlackboardConditionAndArray InteractSourceCondition;
    UPROPERTY()
    float32 InteractDistance = 100.0f;
    UPROPERTY()
    float32 InteractTipDistance = 200.0f;
    UPROPERTY()
    EInteractSourceType InteractSourceType = EInteractSourceType(1);
    UPROPERTY()
    TArray<UInteractCustomCheckConditionBase> InteractSourceCustomCheckConditions;


    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        UInteractCustomCheckConditionBase local_18;
        UInteractCustomCheckCondition_BlackboardConditionAndArray local_22;
        this.InitConditionRuntime(false);
        auto local_8 = this.InteractSourceCustomCheckConditions.Iterator();
        for (; local_8.CanProceed;)
        {
            local_18 = local_8.Proceed();
            local_22 = Cast<UInteractCustomCheckCondition_BlackboardConditionAndArray>(local_18);
            if (local_22 != nullptr)
            {
                local_22.BlackboardConditionAndArray.InitConditionRuntime(false);
            }
        }
        return;
    }
}

struct FInteractionPointHUDIconSettings
{
    UPROPERTY()
    bool bUseHUDIcon = false;
    UPROPERTY()
    bool bForceShowInteractPointWithIcon = false;
    UPROPERTY()
    FSoftBrush HUDIcon;
    UPROPERTY()
    FVector2D HUDIconUIOffset;


}

struct FInteractionPoint
{
    UPROPERTY()
    bool bInitialDisabled = false;
    UPROPERTY()
    FDataObjectPtr PointType;
    UPROPERTY()
    EInteractionSubTypeForESM SubType;
    UPROPERTY()
    FName IdentifierPointName;
    UPROPERTY()
    bool bUseSocket = false;
    UPROPERTY()
    FName SocketName;
    UPROPERTY()
    FTransform TransformOffset;
    UPROPERTY()
    TArray<FVector3f> TraceCheckOffsets;
    UPROPERTY()
    FVector UIDisplayOffsetFromInteractPoint;
    UPROPERTY()
    FVector2D InteractTargetHUDDisplayUIOffset;
    UPROPERTY()
    FInteractPointParam InteractPointParam;
    UPROPERTY()
    int AvailableSourceTypeMask = 1;
    UPROPERTY()
    bool bUsePointHUDContent = false;
    UPROPERTY()
    TDataObjectPtr<FKLTextData> HUDContentRow;
    UPROPERTY()
    bool bOverrideHUDIconSettings = false;
    UPROPERTY()
    FInteractionPointHUDIconSettings OverrideHUDIconSettings;
    UPROPERTY()
    bool bOverrideInteractTipPreset = false;
    UPROPERTY()
    TDataObjectPtr<FInteractTipPreset> OverrideInteractTipPreset;


    FText GetHUDContent() const
    {
        FText __return;
        if (this.HUDContentRow.IsSet())
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    void DebugDraw(const UWorld World, const FTransform &inout BaseTransform, const TArray<FVector3f> &inout InTraceCheckOffsets) const
    {
        if (InTraceCheckOffsets.Num() > 0)
        {
            FVector local_22 = BaseTransform.TransformPosition(this.TransformOffset.GetLocation());
            FQuat local_48 = BaseTransform.TransformRotation(this.TransformOffset.GetRotation());
            DebugDraw::DrawDebugSphere(World, local_22, 2.0f, 10, FColor::Green, false, -1.0f, uint8(0), 0.0f);
            for (auto& local_66 : InTraceCheckOffsets)
            {
                FVector local_16 = (local_22 + local_48.RotateVector(FVector(local_66)));
                DebugDraw::DrawDebugSphere(World, local_16, 2.0f, 10, FColor::Red, false, -1.0f, uint8(0), 0.0f);
                DebugDraw::DrawDebugLine(World, local_22, local_16, FColor::Red, false, -1.0f, uint8(0), 0.0f);
            }
        }
        return;
    }
}

struct FInteractionPointOverride
{
    UPROPERTY()
    bool bOverrideInitialDisabled = false;
    UPROPERTY()
    bool bInitialDisabled = false;
    UPROPERTY()
    bool bOverrideInteractDistanceMax = false;
    UPROPERTY()
    float32 InteractDistanceMax = -1.0f;
    UPROPERTY()
    bool bOverrideTraceCheckOffsets = false;
    UPROPERTY()
    TArray<FVector3f> TraceCheckOffsets;


}

struct FC_InteractionTargetConfig : FECSComponent
{
    UPROPERTY()
    float32 MaxInteractDistanceSQ = -1.0f;
    UPROPERTY()
    float32 MaxInteractTipDistanceSQ = -1.0f;
    UPROPERTY()
    int ModeMask = 0;
    UPROPERTY()
    bool bHasTip = false;
    UPROPERTY()
    bool bInitialDisabled = false;
    UPROPERTY()
    TArray<FInteractionPoint> InteractionPoints;
    UPROPERTY()
    TMap<FName, FInteractionPointOverride> InteractionPointOverrides;


    bool HasInteractPointWithMode(const EInteractMode InteractMode) const
    {
        int local_1 = this.ModeMask & (1 << int(InteractMode));
        return (local_1 != 0);
    }
    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        int local_26 = 0;
        float32 local_28;
        float32 local_29;
        float32 local_30 = 0.0f;
        UInteractCustomCheckConditionBase local_166;
        UInteractCustomCheckCondition_BlackboardConditionAndArray local_170;
        float32 local_171;
        float32 local_228;
        for (auto& local_16 : this.InteractionPoints)
        {
            if (local_16.IdentifierPointName.IsNone())
            {
                continue;
            }
            if (!(this.InteractionPointOverrides.Contains(local_16.IdentifierPointName)))
            {
                continue;
            }
            FInteractionPointOverride& local_18 = this.InteractionPointOverrides[local_16.IdentifierPointName];
            if (local_18.bOverrideInitialDisabled)
            {
                local_16.bInitialDisabled = local_18.bInitialDisabled;
            }
            if (local_18.bOverrideInteractDistanceMax)
            {
                local_16.InteractPointParam.DistanceMax = local_18.InteractDistanceMax;
            }
            if (local_18.bOverrideTraceCheckOffsets)
            {
                local_16.TraceCheckOffsets = local_18.TraceCheckOffsets;
            }
        }
        local_26.SetbRuntimeDisabled(this.bInitialDisabled);
        local_26.GetModify_RuntimePointsDisabled().Reserve(this.InteractionPoints.Num());
        this.MaxInteractDistanceSQ = 0.0f;
        float32 local_19_2 = 0.0f;
        this.MaxInteractTipDistanceSQ = 0.0f;
        this.ModeMask = 0;
        this.bHasTip = false;
        for (auto& local_16 : this.InteractionPoints)
        {
            local_26.GetModify_RuntimePointsDisabled().Add(local_16.bInitialDisabled);
            local_28 = local_16.InteractPointParam.DistanceMax;
            local_29 = -1.0f;
            local_19_2 = float32(local_16.TransformOffset.GetLocation().Size());
            if ((local_16.bUseSocket && !((local_16.SocketName == NAME_None))))
            {
                bool local_42;
                local_42 = false;
                FTransform local_68 = FTransformUtils::GetStaticSocketTransform(Entity, local_16.SocketName, local_42, false, FFPTime());
                if (local_42)
                {
                    local_30 = float32(local_68.GetLocation().Size());
                    local_19_2 = local_19_2 + local_30;
                }
                else
                {
                    Get local_96;
                    const FC_PushColliderConfig& local_98 = local_96.opCall();
                    if (local_98)
                    {
                        local_30 = local_98.PushColliderBoundingBox.GetExtent().Size();
                        local_19_2 = local_19_2 + local_30;
                    }
                }
            }
            if (local_16.PointType.IsValid())
            {
                FInteractionPointTypeConfig local_104;
                TDataObjectPtr<FInteractionPointTypeConfig> local_128 = TDataObjectPtr<FInteractionPointTypeConfig>(local_16.PointType);
                this.ModeMask |= (1 << int(local_104.InteractMode));
                for (auto& local_146 : local_104.Behaviors)
                {
                    if (!((local_146 == nullptr)))
                    {
                        UInteractionBehaviorBase local_150 = local_146.GetDefaultObject();
                        if (local_150 != nullptr)
                        {
                            local_150.InteractSourceCondition.InitConditionRuntime(false);
                            local_150.InteractTargetCondition.InitConditionRuntime(false);
                            auto local_156 = local_150.CustomCheckConditions.Iterator();
                            for (; local_156.CanProceed;)
                            {
                                local_166 = local_156.Proceed();
                                local_170 = Cast<UInteractCustomCheckCondition_BlackboardConditionAndArray>(local_166);
                                if (local_170 != nullptr)
                                {
                                    local_170.BlackboardConditionAndArray.InitConditionRuntime(false);
                                }
                            }
                            if (local_150.bOverrideInteractPointParam)
                            {
                                local_30 = local_150.OverrideInteractPointParam.DistanceMax;
                                local_28 = FMath::Max(local_28, local_30);
                            }
                            if (::FInteractUtils::GetInteractTipPreset(local_16, local_150).IsSet())
                            {
                                this.bHasTip = true;
                                local_29 = FMath::Max(local_29, local_30);
                            }
                            if (local_150.bIsSecondaryInteractTarget)
                            {
                                FC_SecondaryInteractTargetTag local_226;
                                Assign local_224;
                                local_224.opCall(local_226);
                            }
                        }
                    }
                }
            }
            if (local_28 > 0.0f)
            {
                local_171 = local_28 + local_19_2;
                local_30 = local_28 + local_19_2;
                local_171 = local_171 * local_30;
                this.MaxInteractDistanceSQ = FMath::Max(this.MaxInteractDistanceSQ, local_171);
            }
            if (local_29 > 0.0f)
            {
                local_171 = local_29 + local_19_2;
                local_30 = local_171 * (local_29 + local_19_2);
                this.MaxInteractTipDistanceSQ = FMath::Max(this.MaxInteractTipDistanceSQ, local_30);
            }
        }
        if (this.MaxInteractTipDistanceSQ > 0.0f)
        {
            local_171 = FMath::Sqrt(this.MaxInteractTipDistanceSQ);
        }
        else
        {
            local_171 = 0.0f;
        }
        if (this.MaxInteractDistanceSQ > 0.0f)
        {
            local_228 = FMath::Sqrt(this.MaxInteractDistanceSQ);
        }
        else
        {
            local_228 = 0.0f;
        }
        ::FInteractUtils::UpdateMaxInteractDistance(local_228);
        return;
    }
}

struct FInteractionPointAndBehaviorIndex
{
    UPROPERTY()
    int m_PointIndex = -1;
    UPROPERTY()
    int m_BehaviorIndex = -1;


    int GetPointIndex() const property
    {
        return this.m_PointIndex;
    }
    void SetPointIndex(const int __Value) property
    {
        this.m_PointIndex = __Value;
        return;
    }
    int GetBehaviorIndex() const property
    {
        return this.m_BehaviorIndex;
    }
    void SetBehaviorIndex(const int __Value) property
    {
        this.m_BehaviorIndex = __Value;
        return;
    }
}

struct FRuntimeInteractionPointStatus
{
    UPROPERTY()
    FInteractionPointAndBehaviorIndex m_PointAndBehaviorIndex;
    UPROPERTY()
    TArray<FECSEntity> m_InteractingSourceEntities;

    FRuntimeInteractionPointStatus()
    {
        return;
    }
    const FInteractionPointAndBehaviorIndex GetPointAndBehaviorIndex() const property
    {
        const FInteractionPointAndBehaviorIndex __r;
        return __r;
    }
    FInteractionPointAndBehaviorIndex GetPointAndBehaviorIndex() property
    {
        FInteractionPointAndBehaviorIndex __r;
        return __r;
    }
    void SetPointAndBehaviorIndex(const FInteractionPointAndBehaviorIndex &inout __Value) property
    {
        this = __Value;
        return;
    }
    const TArray<FECSEntity> GetInteractingSourceEntities() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetInteractingSourceEntities() property
    {
        TArray<FECSEntity> __r;
        return __r;
    }
    void SetInteractingSourceEntities(const TArray<FECSEntity> &inout __Value) property
    {
        this.m_InteractingSourceEntities = __Value;
        return;
    }
}

struct FRuntimeInteractionBehaviorStatus
{
    UPROPERTY()
    TSoftObjectPtr<UInteractionBehaviorBase> m_Behavior;
    UPROPERTY()
    float32 m_ProgressValue;


    const TSoftObjectPtr<UInteractionBehaviorBase> GetBehavior() const property
    {
        const TSoftObjectPtr<UInteractionBehaviorBase> __r;
        return __r;
    }
    TSoftObjectPtr<UInteractionBehaviorBase> GetBehavior() property
    {
        TSoftObjectPtr<UInteractionBehaviorBase> __r;
        return __r;
    }
    void SetBehavior(const TSoftObjectPtr<UInteractionBehaviorBase> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    float32 GetProgressValue() const property
    {
        return this.m_ProgressValue;
    }
    void SetProgressValue(const float32 __Value) property
    {
        this.m_ProgressValue = __Value;
        return;
    }
}

struct FPendingInteractSourceEntry
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_PointIndex;
    UPROPERTY()
    int m_BehaviorIndex;
    UPROPERTY()
    int m_PendingCount;

    FPendingInteractSourceEntry()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPendingInteractSourceEntry(const FPendingInteractSourceEntry &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPendingInteractSourceEntry opAssign(const FPendingInteractSourceEntry &inout Other)
    {
        FPendingInteractSourceEntry __r;
        this.SetPointIndex(Other.GetPointIndex());
        this.SetBehaviorIndex(Other.GetBehaviorIndex());
        this.SetPendingCount(Other.GetPendingCount());
        return __r;
    }
    int GetPointIndex() const property
    {
        return this.m_PointIndex;
    }
    void SetPointIndex(const int __Value) property
    {
        if (this.m_PointIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PointIndex = __Value;
        return;
    }
    int GetBehaviorIndex() const property
    {
        return this.m_BehaviorIndex;
    }
    void SetBehaviorIndex(const int __Value) property
    {
        if (this.m_BehaviorIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_BehaviorIndex = __Value;
        return;
    }
    int GetPendingCount() const property
    {
        return this.m_PendingCount;
    }
    void SetPendingCount(const int __Value) property
    {
        if (this.m_PendingCount == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_PendingCount = __Value;
        return;
    }
}

struct FC_PendingInteractSourceCount : FECSComponent
{
    UPROPERTY()
    TArray<FPendingInteractSourceEntry> Entries;

    FC_PendingInteractSourceCount()
    {
        return;
    }
    int GetPendingCount(const int InPointIndex, const int InBehaviorIndex) const
    {
        for (auto& local_16 : this)
        {
            if (local_16.GetPointIndex() == InPointIndex && (local_16.GetBehaviorIndex() == InBehaviorIndex))
            {
                return local_16.GetPendingCount();
            }
        }
        return 0;
    }
    void AddPending(const int InPointIndex, const int InBehaviorIndex)
    {
        for (auto& local_16 : this)
        {
            if (local_16.GetPointIndex() == InPointIndex && (local_16.GetBehaviorIndex() == InBehaviorIndex))
            {
                local_16.SetPendingCount((local_16.GetPendingCount() + 1));
                return;
            }
        }
        FPendingInteractSourceEntry local_24;
        local_24.SetPointIndex(InPointIndex);
        local_24.SetBehaviorIndex(InBehaviorIndex);
        local_24.SetPendingCount(1);
        this.Add(local_24);
        return;
    }
}

struct FC_RuntimeInteractTargetStatus : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bRuntimeDisabled;
    UPROPERTY()
    TArray<bool> m_RuntimePointsDisabled;
    UPROPERTY()
    TArray<FRuntimeInteractionPointStatus> m_InteractionPointStatus;
    UPROPERTY()
    TArray<FRuntimeInteractionBehaviorStatus> m_InteractionBehaviorStatus;

    FC_RuntimeInteractTargetStatus()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RuntimeInteractTargetStatus(const FC_RuntimeInteractTargetStatus &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_RuntimeInteractTargetStatus opAssign(const FC_RuntimeInteractTargetStatus &inout Other)
    {
        FC_RuntimeInteractTargetStatus __r;
        this.SetbRuntimeDisabled(Other.GetbRuntimeDisabled());
        this.SetRuntimePointsDisabled(Other.GetRuntimePointsDisabled());
        this.SetInteractionPointStatus(Other.GetInteractionPointStatus());
        this.SetInteractionBehaviorStatus(Other.GetInteractionBehaviorStatus());
        return __r;
    }
    int GetInteractingSourceCount() const
    {
        int local_1 = 0;
        for (auto& local_18 : this.GetInteractionPointStatus())
        {
            local_1 = local_1 + local_18.GetInteractingSourceEntities().Num();
        }
        return local_1;
    }
    int GetInteractionPointStatusIndex(const FInteractionPointAndBehaviorIndex &inout PointAndBehaviorIndex) const
    {
        int local_1 = 0;
        for (; local_1 < this.GetInteractionPointStatus().Num(); ++local_1)
        {
            if (this.GetInteractionPointStatus()[local_1].GetPointAndBehaviorIndex().GetPointIndex() == PointAndBehaviorIndex.GetPointIndex() && (this.GetInteractionPointStatus()[local_1].GetPointAndBehaviorIndex().GetBehaviorIndex() == PointAndBehaviorIndex.GetBehaviorIndex()))
            {
                return local_1;
            }
        }
        return -1;
    }
    int AddInteractionPointStatus(const FInteractionPointAndBehaviorIndex &inout PointAndBehaviorIndex)
    {
        int local_1 = 0;
        for (; local_1 < this.GetInteractionPointStatus().Num(); ++local_1)
        {
            if (this.GetInteractionPointStatus()[local_1].GetPointAndBehaviorIndex().GetPointIndex() == PointAndBehaviorIndex.GetPointIndex() && (this.GetInteractionPointStatus()[local_1].GetPointAndBehaviorIndex().GetBehaviorIndex() == PointAndBehaviorIndex.GetBehaviorIndex()))
            {
                return local_1;
            }
        }
        FRuntimeInteractionPointStatus local_12;
        local_12.SetPointAndBehaviorIndex(PointAndBehaviorIndex);
        this.GetModify_InteractionPointStatus().Add(local_12);
        return (this.GetInteractionPointStatus().Num() - 1);
    }
    int GetInteractionBehaviorStatusIndex(const UInteractionBehaviorBase Behavior) const
    {
        int local_1 = 0;
        for (; local_1 < this.GetInteractionBehaviorStatus().Num(); ++local_1)
        {
            TSoftObjectPtr<UInteractionBehaviorBase> local_14;
            local_14 = this.GetInteractionBehaviorStatus()[local_1].GetBehavior();
            if ((local_14 == Behavior))
            {
                return local_1;
            }
        }
        return -1;
    }
    int AddInteractionBehaviorStatus(const UInteractionBehaviorBase Behavior)
    {
        int local_1 = 0;
        for (; local_1 < this.GetInteractionBehaviorStatus().Num(); ++local_1)
        {
            if ((this.GetInteractionBehaviorStatus()[local_1].GetBehavior() == Behavior))
            {
                return local_1;
            }
        }
        FRuntimeInteractionBehaviorStatus local_26;
        local_26.SetBehavior(TSoftObjectPtr<UInteractionBehaviorBase>(Behavior));
        local_26.SetProgressValue(0.0f);
        this.GetModify_InteractionBehaviorStatus().Add(local_26);
        return (this.GetInteractionBehaviorStatus().Num() - 1);
    }
    bool IsRuntimePointEnabled(const int PointIndex) const
    {
        return PointIndex >= 0 && (PointIndex < this.GetRuntimePointsDisabled().Num()) && !(this.GetRuntimePointsDisabled()[PointIndex]);
    }
    int GetRuntimePointInteractingSourceEntitiesCount(const FInteractionPointAndBehaviorIndex &inout PointAndBehaviorIndex) const
    {
        for (auto& local_16 : this.GetInteractionPointStatus())
        {
            if (local_16.GetPointAndBehaviorIndex().GetPointIndex() == PointAndBehaviorIndex.GetPointIndex() && (local_16.GetPointAndBehaviorIndex().GetBehaviorIndex() == PointAndBehaviorIndex.GetBehaviorIndex()))
            {
                return local_16.GetInteractingSourceEntities().Num();
            }
        }
        return 0;
    }
    bool GetbRuntimeDisabled() const property
    {
        return this.m_bRuntimeDisabled;
    }
    void SetbRuntimeDisabled(const bool __Value) property
    {
        if (!(this.m_bRuntimeDisabled) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bRuntimeDisabled = __Value;
        return;
    }
    const TArray<bool> GetRuntimePointsDisabled() const property
    {
        const TArray<bool> __r;
        return __r;
    }
    TArray<bool> GetModify_RuntimePointsDisabled() property
    {
        TArray<bool> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetRuntimePointsDisabled(const TArray<bool> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_RuntimePointsDisabled = __Value;
        return;
    }
    const TArray<FRuntimeInteractionPointStatus> GetInteractionPointStatus() const property
    {
        const TArray<FRuntimeInteractionPointStatus> __r;
        return __r;
    }
    TArray<FRuntimeInteractionPointStatus> GetModify_InteractionPointStatus() property
    {
        TArray<FRuntimeInteractionPointStatus> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetInteractionPointStatus(const TArray<FRuntimeInteractionPointStatus> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_InteractionPointStatus = __Value;
        return;
    }
    const TArray<FRuntimeInteractionBehaviorStatus> GetInteractionBehaviorStatus() const property
    {
        const TArray<FRuntimeInteractionBehaviorStatus> __r;
        return __r;
    }
    TArray<FRuntimeInteractionBehaviorStatus> GetModify_InteractionBehaviorStatus() property
    {
        TArray<FRuntimeInteractionBehaviorStatus> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetInteractionBehaviorStatus(const TArray<FRuntimeInteractionBehaviorStatus> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_InteractionBehaviorStatus = __Value;
        return;
    }
}

struct FC_IsBeingInteractedTag : FECSComponent
{
    FC_IsBeingInteractedTag()
    {
        return;
    }
}

struct FInteractionCandidateEntity
{
    UPROPERTY()
    FECSEntity Entity;
    UPROPERTY()
    FBitSet32 PointIndices;
    UPROPERTY()
    bool bBestF = false;
    UPROPERTY()
    bool bBestZ = false;
    UPROPERTY()
    bool bTip = false;
    UPROPERTY()
    bool bIsSecondaryTarget = false;


}

struct FInteractionCandidateBehaviorInfo
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FInteractionPointAndBehaviorIndex PointAndBehaviorIndex;
    UPROPERTY()
    FVector Location;
    UPROPERTY()
    FQuat Rotation;
    UPROPERTY()
    int Priority = -1;
    UPROPERTY()
    float32 NonCameraScore = -1.0f;
    UPROPERTY()
    bool bBestF = false;
    UPROPERTY()
    bool bBestZ = false;
    UPROPERTY()
    bool bTip = false;
    UPROPERTY()
    bool bIsSecondaryTarget = false;
    UPROPERTY()
    int ShowFailConditionIndex = -1;
    UPROPERTY()
    bool bShowFailFromSource = false;


}

struct FC_InteractionCandidates : FECSComponent
{
    UPROPERTY()
    TArray<FInteractionCandidateEntity> CandidateEntities;
    UPROPERTY()
    TArray<FInteractionCandidateBehaviorInfo> CandidateBehaviors;
    UPROPERTY()
    TArray<int> PrioritySortedIndices;
    UPROPERTY()
    bool bSecondaryInteracting = false;


}

struct FC_BestInteractionTargetInfo : FECSComponent
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    bool bIsSecondaryTarget = false;
    UPROPERTY()
    FInteractionPointAndBehaviorIndex InteractTargetPointAndBehaviorIndex;
    UPROPERTY()
    int ShowFailConditionIndex = -1;
    UPROPERTY()
    bool bShowFailFromSource = false;


}

struct FC_InteractTipTargetInfo : FECSComponent
{
    UPROPERTY()
    TArray<FInteractTipTargetInfo> Targets;

    FC_InteractTipTargetInfo()
    {
        return;
    }
}

struct FC_InteractionInfoForESM : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    bool m_bIsAutoInteract;
    UPROPERTY()
    bool m_bIsSecondaryInteractSource;
    UPROPERTY()
    EInteractType m_InteractType;
    UPROPERTY()
    EInteractionSubTypeForESM m_SubType;
    UPROPERTY()
    FVector m_InteractTargetLocation;
    UPROPERTY()
    FRotator m_InteractTargetRotation;
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    FInteractionPointAndBehaviorIndex m_TargetPointAndBehaviorIndex;
    UPROPERTY()
    FFPTime m_ExpireTime;
    UPROPERTY()
    EInteractionSocialTypeForESM m_SocialAnimName;
    UPROPERTY()
    float32 m_TargetPointYawToPlayer;
    UPROPERTY()
    float32 m_TargetPointPitchToPlayer;

    FC_InteractionInfoForESM()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_InteractionInfoForESM(const FC_InteractionInfoForESM &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_InteractionInfoForESM opAssign(const FC_InteractionInfoForESM &inout Other)
    {
        FC_InteractionInfoForESM __r;
        this.SetbIsAutoInteract(Other.GetbIsAutoInteract());
        this.SetbIsSecondaryInteractSource(Other.GetbIsSecondaryInteractSource());
        this.SetInteractType(Other.GetInteractType());
        this.SetSubType(Other.GetSubType());
        this.SetInteractTargetLocation(Other.GetInteractTargetLocation());
        this.SetInteractTargetRotation(Other.GetInteractTargetRotation());
        this.SetTargetEntity(Other.GetTargetEntity());
        this.SetTargetPointAndBehaviorIndex(Other.GetTargetPointAndBehaviorIndex());
        this.SetExpireTime(Other.GetExpireTime());
        this.SetSocialAnimName(Other.GetSocialAnimName());
        this.SetTargetPointYawToPlayer(Other.GetTargetPointYawToPlayer());
        this.SetTargetPointPitchToPlayer(Other.GetTargetPointPitchToPlayer());
        return __r;
    }
    float32 GetDistanceXYToTargetPoint(const FECSEntity &inout SelfEntity) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return 0.0f;
        }
        if ((FVector(this.GetInteractTargetLocation()) == FVector::ZeroVector))
        {
            return 0.0f;
        }
        return float32(local_6.GetPosition().Dist2D(this.GetInteractTargetLocation()));
    }
    bool IsInteractTargetActive() const
    {
        return this.GetTargetEntity().IsActive();
    }
    int InteractTargetPointIndex() const
    {
        return this.GetTargetPointAndBehaviorIndex().GetPointIndex();
    }
    bool GetbIsAutoInteract() const property
    {
        return this.m_bIsAutoInteract;
    }
    void SetbIsAutoInteract(const bool __Value) property
    {
        if (!(this.m_bIsAutoInteract) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bIsAutoInteract = __Value;
        return;
    }
    bool GetbIsSecondaryInteractSource() const property
    {
        return this.m_bIsSecondaryInteractSource;
    }
    void SetbIsSecondaryInteractSource(const bool __Value) property
    {
        if (!(this.m_bIsSecondaryInteractSource) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bIsSecondaryInteractSource = __Value;
        return;
    }
    EInteractType GetInteractType() const property
    {
        return this.m_InteractType;
    }
    void SetInteractType(const EInteractType __Value) property
    {
        if (int(this.m_InteractType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_InteractType = __Value;
        return;
    }
    EInteractionSubTypeForESM GetSubType() const property
    {
        return this.m_SubType;
    }
    void SetSubType(const EInteractionSubTypeForESM __Value) property
    {
        if (int(this.m_SubType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_SubType = __Value;
        return;
    }
    const FVector GetInteractTargetLocation() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_InteractTargetLocation() property
    {
        FVector __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetInteractTargetLocation(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_InteractTargetLocation = __Value;
        return;
    }
    const FRotator GetInteractTargetRotation() const property
    {
        const FRotator __r;
        return __r;
    }
    FRotator GetModify_InteractTargetRotation() property
    {
        FRotator __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetInteractTargetRotation(const FRotator &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_InteractTargetRotation = __Value;
        return;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_TargetEntity = __Value;
        return;
    }
    const FInteractionPointAndBehaviorIndex GetTargetPointAndBehaviorIndex() const property
    {
        const FInteractionPointAndBehaviorIndex __r;
        return __r;
    }
    FInteractionPointAndBehaviorIndex GetModify_TargetPointAndBehaviorIndex() property
    {
        FInteractionPointAndBehaviorIndex __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetTargetPointAndBehaviorIndex(const FInteractionPointAndBehaviorIndex &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_TargetPointAndBehaviorIndex = __Value;
        return;
    }
    FFPTime GetExpireTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_ExpireTime() property
    {
        FFPTime __r;
        this.__MarkDirty(8);
        return __r;
    }
    void SetExpireTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_ExpireTime = __Value;
        return;
    }
    EInteractionSocialTypeForESM GetSocialAnimName() const property
    {
        return this.m_SocialAnimName;
    }
    void SetSocialAnimName(const EInteractionSocialTypeForESM __Value) property
    {
        if (int(this.m_SocialAnimName) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_SocialAnimName = __Value;
        return;
    }
    float32 GetTargetPointYawToPlayer() const property
    {
        return this.m_TargetPointYawToPlayer;
    }
    void SetTargetPointYawToPlayer(const float32 __Value) property
    {
        if (this.m_TargetPointYawToPlayer == __Value)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_TargetPointYawToPlayer = __Value;
        return;
    }
    float32 GetTargetPointPitchToPlayer() const property
    {
        return this.m_TargetPointPitchToPlayer;
    }
    void SetTargetPointPitchToPlayer(const float32 __Value) property
    {
        if (this.m_TargetPointPitchToPlayer == __Value)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_TargetPointPitchToPlayer = __Value;
        return;
    }
}

struct FC_BestInteractionTargetInfoModeZ : FECSComponent
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FInteractionPointAndBehaviorIndex InteractTargetPointAndBehaviorIndex;
    UPROPERTY()
    int ShowFailConditionIndex = -1;
    UPROPERTY()
    bool bShowFailFromSource = false;


}

struct FC_InteractionInfoModeZ : FECSComponent
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FInteractionPointAndBehaviorIndex InteractTargetPointAndBehaviorIndex;

    FC_InteractionInfoModeZ()
    {
        return;
    }
    bool IsInteractTargetActive() const
    {
        return this.IsActive();
    }
}

struct FC_SecondaryInteractSourceInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    EInteractType m_InteractType;
    UPROPERTY()
    EInteractionSubTypeForESM m_SubType;
    UPROPERTY()
    FInteractionPointAndBehaviorIndex m_TargetPointAndBehaviorIndex;

    FC_SecondaryInteractSourceInfo()
    {
        this.m_InteractType = EInteractType(0);
        this.m_SubType = EInteractionSubTypeForESM(0);
        this.__InitDirtyFlags();
        return;
    }
    FC_SecondaryInteractSourceInfo(const FC_SecondaryInteractSourceInfo &inout Other)
    {
        this.m_InteractType = EInteractType(0);
        this.m_SubType = EInteractionSubTypeForESM(0);
        this.__InitDirtyFlags();
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_InteractType = Other.m_InteractType;
        this.m_SubType = Other.m_SubType;
        this.m_TargetPointAndBehaviorIndex = Other.m_TargetPointAndBehaviorIndex;
        return;
    }
    FC_SecondaryInteractSourceInfo opAssign(const FC_SecondaryInteractSourceInfo &inout Other)
    {
        FC_SecondaryInteractSourceInfo __r;
        this.SetTargetEntity(Other.GetTargetEntity());
        this.SetInteractType(Other.GetInteractType());
        this.SetSubType(Other.GetSubType());
        this.SetTargetPointAndBehaviorIndex(Other.GetTargetPointAndBehaviorIndex());
        return __r;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TargetEntity = __Value;
        return;
    }
    EInteractType GetInteractType() const property
    {
        return this.m_InteractType;
    }
    void SetInteractType(const EInteractType __Value) property
    {
        if (int(this.m_InteractType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_InteractType = __Value;
        return;
    }
    EInteractionSubTypeForESM GetSubType() const property
    {
        return this.m_SubType;
    }
    void SetSubType(const EInteractionSubTypeForESM __Value) property
    {
        if (int(this.m_SubType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_SubType = __Value;
        return;
    }
    const FInteractionPointAndBehaviorIndex GetTargetPointAndBehaviorIndex() const property
    {
        const FInteractionPointAndBehaviorIndex __r;
        return __r;
    }
    FInteractionPointAndBehaviorIndex GetModify_TargetPointAndBehaviorIndex() property
    {
        FInteractionPointAndBehaviorIndex __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetTargetPointAndBehaviorIndex(const FInteractionPointAndBehaviorIndex &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_TargetPointAndBehaviorIndex = __Value;
        return;
    }
}

struct FC_AutoInteractSourceConfig : FECSComponent
{
    UPROPERTY()
    TSubclassOf<UInteractionBehaviorBase> AutoInteractBehavior;

    FC_AutoInteractSourceConfig()
    {
        return;
    }
    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        if (this.IsValid())
        {
            UInteractionBehaviorBase local_4 = this.GetDefaultObject();
            if (local_4 != nullptr)
            {
                local_4.InteractSourceCondition.InitConditionRuntime(false);
                local_4.InteractTargetCondition.InitConditionRuntime(false);
            }
        }
        return;
    }
}

struct FInteractTargetInfo
{
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    FInteractionPointAndBehaviorIndex m_InteractTargetPointAndBehaviorIndex;

    FInteractTargetInfo()
    {
        return;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetTargetEntity() property
    {
        FECSEntity __r;
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    const FInteractionPointAndBehaviorIndex GetInteractTargetPointAndBehaviorIndex() const property
    {
        const FInteractionPointAndBehaviorIndex __r;
        return __r;
    }
    FInteractionPointAndBehaviorIndex GetInteractTargetPointAndBehaviorIndex() property
    {
        FInteractionPointAndBehaviorIndex __r;
        return __r;
    }
    void SetInteractTargetPointAndBehaviorIndex(const FInteractionPointAndBehaviorIndex &inout __Value) property
    {
        this.m_InteractTargetPointAndBehaviorIndex = __Value;
        return;
    }
}

struct FC_LocalInteractProgress : FECSComponent
{
    UPROPERTY()
    float32 ProgressValue;
    UPROPERTY()
    float32 MaxProgressValue;
    UPROPERTY()
    float32 CurProgressSpeed;
    UPROPERTY()
    int InteractEntityNum;


}

struct FC_LocalInteractWithTeam : FECSComponent
{
    UPROPERTY()
    int InteractEntityNum;


}

struct FC_SecondaryInteractTargetTag : FECSComponent
{
    FC_SecondaryInteractTargetTag()
    {
        return;
    }
}

struct FC_EnableInteractProgressTag : FECSComponent
{
    FC_EnableInteractProgressTag()
    {
        return;
    }
}

struct FC_AutoInteractHoldInput : FECSComponent
{
    UPROPERTY()
    FFPTime TriggerTime;
    UPROPERTY()
    FFPTime ExpireTime = -1;

    FC_AutoInteractHoldInput()
    {
        return;
    }
}

struct FC_InteractWaitForOtherPlayerTag : FECSComponent
{
    FC_InteractWaitForOtherPlayerTag()
    {
        return;
    }
}

struct FC_InteractUIPageInfo : FECSComponent
{
    UPROPERTY()
    FEUIWidgetRef OpenedPage;
    UPROPERTY()
    FECSEntity InteractSourceControllerEntity;
    UPROPERTY()
    FInteractionPointAndBehaviorIndex InteractTargetPointAndBehaviorIndex;

    FC_InteractUIPageInfo()
    {
        return;
    }
}

struct FC_DelayKeepInteractPresentationTag : FECSComponent
{
    FC_DelayKeepInteractPresentationTag()
    {
        return;
    }
}

namespace ECSFunc_FC_InteractKeepingTag
{
UFUNCTION()
bool HasInteractKeepingTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InteractKeepingTag);
}
FC_InteractKeepingTag& AssignInteractKeepingTag(const FECSEntity &inout Entity, const FC_InteractKeepingTag &inout DefaultValue = FC_InteractKeepingTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InteractKeepingTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInteractKeepingTag_BP(const FECSEntity &inout Entity, const FC_InteractKeepingTag &inout DefaultValue = FC_InteractKeepingTag())
{
    ECSFunc_FC_InteractKeepingTag::AssignInteractKeepingTag(Entity, DefaultValue);
    return;
}
FC_InteractKeepingTag& ModifyInteractKeepingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InteractKeepingTag));
    return local_12.GetComp();
}
FC_InteractKeepingTag& ModifyOrAddInteractKeepingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InteractKeepingTag));
    return local_12.GetComp();
}
const FC_InteractKeepingTag& GetInteractKeepingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InteractKeepingTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_InteractKeepingTag GetInteractKeepingTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_InteractKeepingTag& local_4 = ECSFunc_FC_InteractKeepingTag::GetInteractKeepingTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_InteractKeepingTag();
}
const FC_InteractKeepingTag GetDefaultedInteractKeepingTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InteractKeepingTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InteractKeepingTag);
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
FC_InteractKeepingTag GetDefaultedInteractKeepingTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_InteractKeepingTag::GetDefaultedInteractKeepingTag(Entity);
}
UFUNCTION()
bool RemoveInteractKeepingTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InteractKeepingTag);
}
}
FECSMonitorRuntimeView __GetMonitorInteractKeepingTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InteractKeepingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractKeepingTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InteractKeepingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractKeepingTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InteractKeepingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractKeepingTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InteractKeepingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractKeepingTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InteractKeepingTag, bFixedFrame, bMustHandleAll);
}
void __MonitorInteractKeepingTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InteractKeepingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractKeepingTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InteractKeepingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractKeepingTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InteractKeepingTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_InteractSourceConfig
{
UFUNCTION()
bool HasInteractSourceConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InteractSourceConfig);
}
FC_InteractSourceConfig& AssignInteractSourceConfig(const FECSEntity &inout Entity, const FC_InteractSourceConfig &inout DefaultValue = FC_InteractSourceConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InteractSourceConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInteractSourceConfig_BP(const FECSEntity &inout Entity, const FC_InteractSourceConfig &inout DefaultValue = FC_InteractSourceConfig())
{
    ECSFunc_FC_InteractSourceConfig::AssignInteractSourceConfig(Entity, DefaultValue);
    return;
}
FC_InteractSourceConfig& ModifyInteractSourceConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InteractSourceConfig));
    return local_12.GetComp();
}
FC_InteractSourceConfig& ModifyOrAddInteractSourceConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InteractSourceConfig));
    return local_12.GetComp();
}
const FC_InteractSourceConfig& GetInteractSourceConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InteractSourceConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_InteractSourceConfig GetInteractSourceConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_InteractSourceConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_InteractSourceConfig::GetInteractSourceConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_InteractSourceConfig GetDefaultedInteractSourceConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InteractSourceConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InteractSourceConfig);
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
FC_InteractSourceConfig GetDefaultedInteractSourceConfig_BP(const FECSEntity &inout Entity)
{
    FC_InteractSourceConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveInteractSourceConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InteractSourceConfig);
}
}
FECSMonitorRuntimeView __GetMonitorInteractSourceConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InteractSourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractSourceConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InteractSourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractSourceConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InteractSourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractSourceConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InteractSourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractSourceConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InteractSourceConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorInteractSourceConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InteractSourceConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractSourceConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InteractSourceConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractSourceConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InteractSourceConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_InteractionTargetConfig
{
UFUNCTION()
bool HasInteractionTargetConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InteractionTargetConfig);
}
FC_InteractionTargetConfig& AssignInteractionTargetConfig(const FECSEntity &inout Entity, const FC_InteractionTargetConfig &inout DefaultValue = FC_InteractionTargetConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InteractionTargetConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInteractionTargetConfig_BP(const FECSEntity &inout Entity, const FC_InteractionTargetConfig &inout DefaultValue = FC_InteractionTargetConfig())
{
    ECSFunc_FC_InteractionTargetConfig::AssignInteractionTargetConfig(Entity, DefaultValue);
    return;
}
FC_InteractionTargetConfig& ModifyInteractionTargetConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InteractionTargetConfig));
    return local_12.GetComp();
}
FC_InteractionTargetConfig& ModifyOrAddInteractionTargetConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InteractionTargetConfig));
    return local_12.GetComp();
}
const FC_InteractionTargetConfig& GetInteractionTargetConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InteractionTargetConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_InteractionTargetConfig GetInteractionTargetConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_InteractionTargetConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_InteractionTargetConfig::GetInteractionTargetConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_InteractionTargetConfig GetDefaultedInteractionTargetConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InteractionTargetConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InteractionTargetConfig);
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
FC_InteractionTargetConfig GetDefaultedInteractionTargetConfig_BP(const FECSEntity &inout Entity)
{
    FC_InteractionTargetConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveInteractionTargetConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InteractionTargetConfig);
}
}
FECSMonitorRuntimeView __GetMonitorInteractionTargetConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InteractionTargetConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionTargetConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InteractionTargetConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionTargetConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InteractionTargetConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionTargetConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InteractionTargetConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionTargetConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InteractionTargetConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorInteractionTargetConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InteractionTargetConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractionTargetConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InteractionTargetConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractionTargetConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InteractionTargetConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PendingInteractSourceCount
{
UFUNCTION()
bool HasPendingInteractSourceCount(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PendingInteractSourceCount);
}
FC_PendingInteractSourceCount& AssignPendingInteractSourceCount(const FECSEntity &inout Entity, const FC_PendingInteractSourceCount &inout DefaultValue = FC_PendingInteractSourceCount())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PendingInteractSourceCount, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPendingInteractSourceCount_BP(const FECSEntity &inout Entity, const FC_PendingInteractSourceCount &inout DefaultValue = FC_PendingInteractSourceCount())
{
    ECSFunc_FC_PendingInteractSourceCount::AssignPendingInteractSourceCount(Entity, DefaultValue);
    return;
}
FC_PendingInteractSourceCount& ModifyPendingInteractSourceCount(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PendingInteractSourceCount));
    return local_12.GetComp();
}
FC_PendingInteractSourceCount& ModifyOrAddPendingInteractSourceCount(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PendingInteractSourceCount));
    return local_12.GetComp();
}
const FC_PendingInteractSourceCount& GetPendingInteractSourceCount(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PendingInteractSourceCount));
    return local_12.GetComp();
}
UFUNCTION()
FC_PendingInteractSourceCount GetPendingInteractSourceCount_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PendingInteractSourceCount __r;
    bValid = false;
    bValid = ECSFunc_FC_PendingInteractSourceCount::GetPendingInteractSourceCount(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PendingInteractSourceCount GetDefaultedPendingInteractSourceCount(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PendingInteractSourceCount __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PendingInteractSourceCount);
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
FC_PendingInteractSourceCount GetDefaultedPendingInteractSourceCount_BP(const FECSEntity &inout Entity)
{
    FC_PendingInteractSourceCount __r;
    return __r;
}
UFUNCTION()
bool RemovePendingInteractSourceCount(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PendingInteractSourceCount);
}
}
FECSMonitorRuntimeView __GetMonitorPendingInteractSourceCountOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PendingInteractSourceCount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingInteractSourceCountOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PendingInteractSourceCount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingInteractSourceCountOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PendingInteractSourceCount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingInteractSourceCountOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PendingInteractSourceCount, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPendingInteractSourceCountOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PendingInteractSourceCount, bFixedFrame, bMustHandleAll);
}
void __MonitorPendingInteractSourceCountLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PendingInteractSourceCount, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPendingInteractSourceCountActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PendingInteractSourceCount, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPendingInteractSourceCountModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PendingInteractSourceCount, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_RuntimeInteractTargetStatus
{
UFUNCTION()
bool HasRuntimeInteractTargetStatus(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_RuntimeInteractTargetStatus);
}
FC_RuntimeInteractTargetStatus& AssignRuntimeInteractTargetStatus(const FECSEntity &inout Entity, const FC_RuntimeInteractTargetStatus &inout DefaultValue = FC_RuntimeInteractTargetStatus())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_RuntimeInteractTargetStatus, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignRuntimeInteractTargetStatus_BP(const FECSEntity &inout Entity, const FC_RuntimeInteractTargetStatus &inout DefaultValue = FC_RuntimeInteractTargetStatus())
{
    ECSFunc_FC_RuntimeInteractTargetStatus::AssignRuntimeInteractTargetStatus(Entity, DefaultValue);
    return;
}
FC_RuntimeInteractTargetStatus& ModifyRuntimeInteractTargetStatus(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_RuntimeInteractTargetStatus));
    return local_12.GetComp();
}
FC_RuntimeInteractTargetStatus& ModifyOrAddRuntimeInteractTargetStatus(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_RuntimeInteractTargetStatus));
    return local_12.GetComp();
}
const FC_RuntimeInteractTargetStatus& GetRuntimeInteractTargetStatus(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_RuntimeInteractTargetStatus));
    return local_12.GetComp();
}
UFUNCTION()
FC_RuntimeInteractTargetStatus GetRuntimeInteractTargetStatus_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_RuntimeInteractTargetStatus& local_4 = ECSFunc_FC_RuntimeInteractTargetStatus::GetRuntimeInteractTargetStatus(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_RuntimeInteractTargetStatus();
}
const FC_RuntimeInteractTargetStatus GetDefaultedRuntimeInteractTargetStatus(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_RuntimeInteractTargetStatus __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_RuntimeInteractTargetStatus);
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
FC_RuntimeInteractTargetStatus GetDefaultedRuntimeInteractTargetStatus_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_RuntimeInteractTargetStatus::GetDefaultedRuntimeInteractTargetStatus(Entity);
}
UFUNCTION()
bool RemoveRuntimeInteractTargetStatus(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_RuntimeInteractTargetStatus);
}
}
FECSMonitorRuntimeView __GetMonitorRuntimeInteractTargetStatusOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_RuntimeInteractTargetStatus, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeInteractTargetStatusOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_RuntimeInteractTargetStatus, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeInteractTargetStatusOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_RuntimeInteractTargetStatus, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeInteractTargetStatusOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_RuntimeInteractTargetStatus, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorRuntimeInteractTargetStatusOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_RuntimeInteractTargetStatus, bFixedFrame, bMustHandleAll);
}
void __MonitorRuntimeInteractTargetStatusLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_RuntimeInteractTargetStatus, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRuntimeInteractTargetStatusActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_RuntimeInteractTargetStatus, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRuntimeInteractTargetStatusModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_RuntimeInteractTargetStatus, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_IsBeingInteractedTag
{
UFUNCTION()
bool HasIsBeingInteractedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_IsBeingInteractedTag);
}
FC_IsBeingInteractedTag& AssignIsBeingInteractedTag(const FECSEntity &inout Entity, const FC_IsBeingInteractedTag &inout DefaultValue = FC_IsBeingInteractedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_IsBeingInteractedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignIsBeingInteractedTag_BP(const FECSEntity &inout Entity, const FC_IsBeingInteractedTag &inout DefaultValue = FC_IsBeingInteractedTag())
{
    ECSFunc_FC_IsBeingInteractedTag::AssignIsBeingInteractedTag(Entity, DefaultValue);
    return;
}
FC_IsBeingInteractedTag& ModifyIsBeingInteractedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_IsBeingInteractedTag));
    return local_12.GetComp();
}
FC_IsBeingInteractedTag& ModifyOrAddIsBeingInteractedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_IsBeingInteractedTag));
    return local_12.GetComp();
}
const FC_IsBeingInteractedTag& GetIsBeingInteractedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_IsBeingInteractedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_IsBeingInteractedTag GetIsBeingInteractedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_IsBeingInteractedTag& local_4 = ECSFunc_FC_IsBeingInteractedTag::GetIsBeingInteractedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_IsBeingInteractedTag();
}
const FC_IsBeingInteractedTag GetDefaultedIsBeingInteractedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_IsBeingInteractedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_IsBeingInteractedTag);
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
FC_IsBeingInteractedTag GetDefaultedIsBeingInteractedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_IsBeingInteractedTag::GetDefaultedIsBeingInteractedTag(Entity);
}
UFUNCTION()
bool RemoveIsBeingInteractedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_IsBeingInteractedTag);
}
}
FECSMonitorRuntimeView __GetMonitorIsBeingInteractedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_IsBeingInteractedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIsBeingInteractedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_IsBeingInteractedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIsBeingInteractedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_IsBeingInteractedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIsBeingInteractedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_IsBeingInteractedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorIsBeingInteractedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_IsBeingInteractedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorIsBeingInteractedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_IsBeingInteractedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorIsBeingInteractedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_IsBeingInteractedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorIsBeingInteractedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_IsBeingInteractedTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_InteractionCandidates
{
UFUNCTION()
bool HasInteractionCandidates(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InteractionCandidates);
}
FC_InteractionCandidates& AssignInteractionCandidates(const FECSEntity &inout Entity, const FC_InteractionCandidates &inout DefaultValue = FC_InteractionCandidates())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InteractionCandidates, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInteractionCandidates_BP(const FECSEntity &inout Entity, const FC_InteractionCandidates &inout DefaultValue = FC_InteractionCandidates())
{
    ECSFunc_FC_InteractionCandidates::AssignInteractionCandidates(Entity, DefaultValue);
    return;
}
FC_InteractionCandidates& ModifyInteractionCandidates(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InteractionCandidates));
    return local_12.GetComp();
}
FC_InteractionCandidates& ModifyOrAddInteractionCandidates(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InteractionCandidates));
    return local_12.GetComp();
}
const FC_InteractionCandidates& GetInteractionCandidates(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InteractionCandidates));
    return local_12.GetComp();
}
UFUNCTION()
FC_InteractionCandidates GetInteractionCandidates_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_InteractionCandidates __r;
    bValid = false;
    bValid = ECSFunc_FC_InteractionCandidates::GetInteractionCandidates(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_InteractionCandidates GetDefaultedInteractionCandidates(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InteractionCandidates __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InteractionCandidates);
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
FC_InteractionCandidates GetDefaultedInteractionCandidates_BP(const FECSEntity &inout Entity)
{
    FC_InteractionCandidates __r;
    return __r;
}
UFUNCTION()
bool RemoveInteractionCandidates(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InteractionCandidates);
}
}
FECSMonitorRuntimeView __GetMonitorInteractionCandidatesOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InteractionCandidates, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionCandidatesOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InteractionCandidates, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionCandidatesOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InteractionCandidates, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionCandidatesOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InteractionCandidates, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionCandidatesOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InteractionCandidates, bFixedFrame, bMustHandleAll);
}
void __MonitorInteractionCandidatesLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InteractionCandidates, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractionCandidatesActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InteractionCandidates, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractionCandidatesModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InteractionCandidates, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BestInteractionTargetInfo
{
UFUNCTION()
bool HasBestInteractionTargetInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BestInteractionTargetInfo);
}
FC_BestInteractionTargetInfo& AssignBestInteractionTargetInfo(const FECSEntity &inout Entity, const FC_BestInteractionTargetInfo &inout DefaultValue = FC_BestInteractionTargetInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BestInteractionTargetInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBestInteractionTargetInfo_BP(const FECSEntity &inout Entity, const FC_BestInteractionTargetInfo &inout DefaultValue = FC_BestInteractionTargetInfo())
{
    ECSFunc_FC_BestInteractionTargetInfo::AssignBestInteractionTargetInfo(Entity, DefaultValue);
    return;
}
FC_BestInteractionTargetInfo& ModifyBestInteractionTargetInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BestInteractionTargetInfo));
    return local_12.GetComp();
}
FC_BestInteractionTargetInfo& ModifyOrAddBestInteractionTargetInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BestInteractionTargetInfo));
    return local_12.GetComp();
}
const FC_BestInteractionTargetInfo& GetBestInteractionTargetInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BestInteractionTargetInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_BestInteractionTargetInfo GetBestInteractionTargetInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_BestInteractionTargetInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_BestInteractionTargetInfo::GetBestInteractionTargetInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_BestInteractionTargetInfo GetDefaultedBestInteractionTargetInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BestInteractionTargetInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BestInteractionTargetInfo);
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
FC_BestInteractionTargetInfo GetDefaultedBestInteractionTargetInfo_BP(const FECSEntity &inout Entity)
{
    FC_BestInteractionTargetInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveBestInteractionTargetInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BestInteractionTargetInfo);
}
}
FECSMonitorRuntimeView __GetMonitorBestInteractionTargetInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BestInteractionTargetInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBestInteractionTargetInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BestInteractionTargetInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBestInteractionTargetInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BestInteractionTargetInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBestInteractionTargetInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BestInteractionTargetInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBestInteractionTargetInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BestInteractionTargetInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorBestInteractionTargetInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BestInteractionTargetInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBestInteractionTargetInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BestInteractionTargetInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBestInteractionTargetInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BestInteractionTargetInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_InteractTipTargetInfo
{
UFUNCTION()
bool HasInteractTipTargetInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InteractTipTargetInfo);
}
FC_InteractTipTargetInfo& AssignInteractTipTargetInfo(const FECSEntity &inout Entity, const FC_InteractTipTargetInfo &inout DefaultValue = FC_InteractTipTargetInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InteractTipTargetInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInteractTipTargetInfo_BP(const FECSEntity &inout Entity, const FC_InteractTipTargetInfo &inout DefaultValue = FC_InteractTipTargetInfo())
{
    ECSFunc_FC_InteractTipTargetInfo::AssignInteractTipTargetInfo(Entity, DefaultValue);
    return;
}
FC_InteractTipTargetInfo& ModifyInteractTipTargetInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InteractTipTargetInfo));
    return local_12.GetComp();
}
FC_InteractTipTargetInfo& ModifyOrAddInteractTipTargetInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InteractTipTargetInfo));
    return local_12.GetComp();
}
const FC_InteractTipTargetInfo& GetInteractTipTargetInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InteractTipTargetInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_InteractTipTargetInfo GetInteractTipTargetInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_InteractTipTargetInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_InteractTipTargetInfo::GetInteractTipTargetInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_InteractTipTargetInfo GetDefaultedInteractTipTargetInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InteractTipTargetInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InteractTipTargetInfo);
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
FC_InteractTipTargetInfo GetDefaultedInteractTipTargetInfo_BP(const FECSEntity &inout Entity)
{
    FC_InteractTipTargetInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveInteractTipTargetInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InteractTipTargetInfo);
}
}
FECSMonitorRuntimeView __GetMonitorInteractTipTargetInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InteractTipTargetInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractTipTargetInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InteractTipTargetInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractTipTargetInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InteractTipTargetInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractTipTargetInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InteractTipTargetInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractTipTargetInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InteractTipTargetInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorInteractTipTargetInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InteractTipTargetInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractTipTargetInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InteractTipTargetInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractTipTargetInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InteractTipTargetInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_InteractionInfoForESM
{
UFUNCTION()
bool HasInteractionInfoForESM(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InteractionInfoForESM);
}
FC_InteractionInfoForESM& AssignInteractionInfoForESM(const FECSEntity &inout Entity, const FC_InteractionInfoForESM &inout DefaultValue = FC_InteractionInfoForESM())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InteractionInfoForESM, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInteractionInfoForESM_BP(const FECSEntity &inout Entity, const FC_InteractionInfoForESM &inout DefaultValue = FC_InteractionInfoForESM())
{
    ECSFunc_FC_InteractionInfoForESM::AssignInteractionInfoForESM(Entity, DefaultValue);
    return;
}
FC_InteractionInfoForESM& ModifyInteractionInfoForESM(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InteractionInfoForESM));
    return local_12.GetComp();
}
FC_InteractionInfoForESM& ModifyOrAddInteractionInfoForESM(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InteractionInfoForESM));
    return local_12.GetComp();
}
const FC_InteractionInfoForESM& GetInteractionInfoForESM(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InteractionInfoForESM));
    return local_12.GetComp();
}
UFUNCTION()
FC_InteractionInfoForESM GetInteractionInfoForESM_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_InteractionInfoForESM& local_4 = ECSFunc_FC_InteractionInfoForESM::GetInteractionInfoForESM(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_InteractionInfoForESM();
}
const FC_InteractionInfoForESM GetDefaultedInteractionInfoForESM(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InteractionInfoForESM __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InteractionInfoForESM);
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
FC_InteractionInfoForESM GetDefaultedInteractionInfoForESM_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_InteractionInfoForESM::GetDefaultedInteractionInfoForESM(Entity);
}
UFUNCTION()
bool RemoveInteractionInfoForESM(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InteractionInfoForESM);
}
}
FECSMonitorRuntimeView __GetMonitorInteractionInfoForESMOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InteractionInfoForESM, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionInfoForESMOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InteractionInfoForESM, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionInfoForESMOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InteractionInfoForESM, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionInfoForESMOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InteractionInfoForESM, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionInfoForESMOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InteractionInfoForESM, bFixedFrame, bMustHandleAll);
}
void __MonitorInteractionInfoForESMLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InteractionInfoForESM, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractionInfoForESMActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InteractionInfoForESM, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractionInfoForESMModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InteractionInfoForESM, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BestInteractionTargetInfoModeZ
{
UFUNCTION()
bool HasBestInteractionTargetInfoModeZ(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BestInteractionTargetInfoModeZ);
}
FC_BestInteractionTargetInfoModeZ& AssignBestInteractionTargetInfoModeZ(const FECSEntity &inout Entity, const FC_BestInteractionTargetInfoModeZ &inout DefaultValue = FC_BestInteractionTargetInfoModeZ())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BestInteractionTargetInfoModeZ, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBestInteractionTargetInfoModeZ_BP(const FECSEntity &inout Entity, const FC_BestInteractionTargetInfoModeZ &inout DefaultValue = FC_BestInteractionTargetInfoModeZ())
{
    ECSFunc_FC_BestInteractionTargetInfoModeZ::AssignBestInteractionTargetInfoModeZ(Entity, DefaultValue);
    return;
}
FC_BestInteractionTargetInfoModeZ& ModifyBestInteractionTargetInfoModeZ(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BestInteractionTargetInfoModeZ));
    return local_12.GetComp();
}
FC_BestInteractionTargetInfoModeZ& ModifyOrAddBestInteractionTargetInfoModeZ(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BestInteractionTargetInfoModeZ));
    return local_12.GetComp();
}
const FC_BestInteractionTargetInfoModeZ& GetBestInteractionTargetInfoModeZ(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BestInteractionTargetInfoModeZ));
    return local_12.GetComp();
}
UFUNCTION()
FC_BestInteractionTargetInfoModeZ GetBestInteractionTargetInfoModeZ_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_BestInteractionTargetInfoModeZ __r;
    bValid = false;
    bValid = ECSFunc_FC_BestInteractionTargetInfoModeZ::GetBestInteractionTargetInfoModeZ(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_BestInteractionTargetInfoModeZ GetDefaultedBestInteractionTargetInfoModeZ(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BestInteractionTargetInfoModeZ __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BestInteractionTargetInfoModeZ);
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
FC_BestInteractionTargetInfoModeZ GetDefaultedBestInteractionTargetInfoModeZ_BP(const FECSEntity &inout Entity)
{
    FC_BestInteractionTargetInfoModeZ __r;
    return __r;
}
UFUNCTION()
bool RemoveBestInteractionTargetInfoModeZ(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BestInteractionTargetInfoModeZ);
}
}
FECSMonitorRuntimeView __GetMonitorBestInteractionTargetInfoModeZOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BestInteractionTargetInfoModeZ, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBestInteractionTargetInfoModeZOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BestInteractionTargetInfoModeZ, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBestInteractionTargetInfoModeZOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BestInteractionTargetInfoModeZ, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBestInteractionTargetInfoModeZOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BestInteractionTargetInfoModeZ, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBestInteractionTargetInfoModeZOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BestInteractionTargetInfoModeZ, bFixedFrame, bMustHandleAll);
}
void __MonitorBestInteractionTargetInfoModeZLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BestInteractionTargetInfoModeZ, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBestInteractionTargetInfoModeZActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BestInteractionTargetInfoModeZ, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBestInteractionTargetInfoModeZModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BestInteractionTargetInfoModeZ, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_InteractionInfoModeZ
{
UFUNCTION()
bool HasInteractionInfoModeZ(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InteractionInfoModeZ);
}
FC_InteractionInfoModeZ& AssignInteractionInfoModeZ(const FECSEntity &inout Entity, const FC_InteractionInfoModeZ &inout DefaultValue = FC_InteractionInfoModeZ())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InteractionInfoModeZ, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInteractionInfoModeZ_BP(const FECSEntity &inout Entity, const FC_InteractionInfoModeZ &inout DefaultValue = FC_InteractionInfoModeZ())
{
    ECSFunc_FC_InteractionInfoModeZ::AssignInteractionInfoModeZ(Entity, DefaultValue);
    return;
}
FC_InteractionInfoModeZ& ModifyInteractionInfoModeZ(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InteractionInfoModeZ));
    return local_12.GetComp();
}
FC_InteractionInfoModeZ& ModifyOrAddInteractionInfoModeZ(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InteractionInfoModeZ));
    return local_12.GetComp();
}
const FC_InteractionInfoModeZ& GetInteractionInfoModeZ(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InteractionInfoModeZ));
    return local_12.GetComp();
}
UFUNCTION()
FC_InteractionInfoModeZ GetInteractionInfoModeZ_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_InteractionInfoModeZ __r;
    bValid = false;
    bValid = ECSFunc_FC_InteractionInfoModeZ::GetInteractionInfoModeZ(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_InteractionInfoModeZ GetDefaultedInteractionInfoModeZ(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InteractionInfoModeZ __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InteractionInfoModeZ);
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
FC_InteractionInfoModeZ GetDefaultedInteractionInfoModeZ_BP(const FECSEntity &inout Entity)
{
    FC_InteractionInfoModeZ __r;
    return __r;
}
UFUNCTION()
bool RemoveInteractionInfoModeZ(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InteractionInfoModeZ);
}
}
FECSMonitorRuntimeView __GetMonitorInteractionInfoModeZOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InteractionInfoModeZ, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionInfoModeZOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InteractionInfoModeZ, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionInfoModeZOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InteractionInfoModeZ, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionInfoModeZOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InteractionInfoModeZ, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractionInfoModeZOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InteractionInfoModeZ, bFixedFrame, bMustHandleAll);
}
void __MonitorInteractionInfoModeZLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InteractionInfoModeZ, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractionInfoModeZActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InteractionInfoModeZ, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractionInfoModeZModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InteractionInfoModeZ, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SecondaryInteractSourceInfo
{
UFUNCTION()
bool HasSecondaryInteractSourceInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SecondaryInteractSourceInfo);
}
FC_SecondaryInteractSourceInfo& AssignSecondaryInteractSourceInfo(const FECSEntity &inout Entity, const FC_SecondaryInteractSourceInfo &inout DefaultValue = FC_SecondaryInteractSourceInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SecondaryInteractSourceInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSecondaryInteractSourceInfo_BP(const FECSEntity &inout Entity, const FC_SecondaryInteractSourceInfo &inout DefaultValue = FC_SecondaryInteractSourceInfo())
{
    ECSFunc_FC_SecondaryInteractSourceInfo::AssignSecondaryInteractSourceInfo(Entity, DefaultValue);
    return;
}
FC_SecondaryInteractSourceInfo& ModifySecondaryInteractSourceInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SecondaryInteractSourceInfo));
    return local_12.GetComp();
}
FC_SecondaryInteractSourceInfo& ModifyOrAddSecondaryInteractSourceInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SecondaryInteractSourceInfo));
    return local_12.GetComp();
}
const FC_SecondaryInteractSourceInfo& GetSecondaryInteractSourceInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SecondaryInteractSourceInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_SecondaryInteractSourceInfo GetSecondaryInteractSourceInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SecondaryInteractSourceInfo& local_4 = ECSFunc_FC_SecondaryInteractSourceInfo::GetSecondaryInteractSourceInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SecondaryInteractSourceInfo();
}
const FC_SecondaryInteractSourceInfo GetDefaultedSecondaryInteractSourceInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SecondaryInteractSourceInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SecondaryInteractSourceInfo);
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
FC_SecondaryInteractSourceInfo GetDefaultedSecondaryInteractSourceInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SecondaryInteractSourceInfo::GetDefaultedSecondaryInteractSourceInfo(Entity);
}
UFUNCTION()
bool RemoveSecondaryInteractSourceInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SecondaryInteractSourceInfo);
}
}
FECSMonitorRuntimeView __GetMonitorSecondaryInteractSourceInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SecondaryInteractSourceInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSecondaryInteractSourceInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SecondaryInteractSourceInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSecondaryInteractSourceInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SecondaryInteractSourceInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSecondaryInteractSourceInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SecondaryInteractSourceInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSecondaryInteractSourceInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SecondaryInteractSourceInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorSecondaryInteractSourceInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SecondaryInteractSourceInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSecondaryInteractSourceInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SecondaryInteractSourceInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSecondaryInteractSourceInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SecondaryInteractSourceInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AutoInteractSourceConfig
{
UFUNCTION()
bool HasAutoInteractSourceConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AutoInteractSourceConfig);
}
FC_AutoInteractSourceConfig& AssignAutoInteractSourceConfig(const FECSEntity &inout Entity, const FC_AutoInteractSourceConfig &inout DefaultValue = FC_AutoInteractSourceConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AutoInteractSourceConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAutoInteractSourceConfig_BP(const FECSEntity &inout Entity, const FC_AutoInteractSourceConfig &inout DefaultValue = FC_AutoInteractSourceConfig())
{
    ECSFunc_FC_AutoInteractSourceConfig::AssignAutoInteractSourceConfig(Entity, DefaultValue);
    return;
}
FC_AutoInteractSourceConfig& ModifyAutoInteractSourceConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AutoInteractSourceConfig));
    return local_12.GetComp();
}
FC_AutoInteractSourceConfig& ModifyOrAddAutoInteractSourceConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AutoInteractSourceConfig));
    return local_12.GetComp();
}
const FC_AutoInteractSourceConfig& GetAutoInteractSourceConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AutoInteractSourceConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_AutoInteractSourceConfig GetAutoInteractSourceConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AutoInteractSourceConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_AutoInteractSourceConfig::GetAutoInteractSourceConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AutoInteractSourceConfig GetDefaultedAutoInteractSourceConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AutoInteractSourceConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AutoInteractSourceConfig);
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
FC_AutoInteractSourceConfig GetDefaultedAutoInteractSourceConfig_BP(const FECSEntity &inout Entity)
{
    FC_AutoInteractSourceConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveAutoInteractSourceConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AutoInteractSourceConfig);
}
}
FECSMonitorRuntimeView __GetMonitorAutoInteractSourceConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AutoInteractSourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoInteractSourceConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AutoInteractSourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoInteractSourceConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AutoInteractSourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoInteractSourceConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AutoInteractSourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoInteractSourceConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AutoInteractSourceConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorAutoInteractSourceConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AutoInteractSourceConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoInteractSourceConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AutoInteractSourceConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoInteractSourceConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AutoInteractSourceConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LocalInteractProgress
{
UFUNCTION()
bool HasLocalInteractProgress(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LocalInteractProgress);
}
FC_LocalInteractProgress& AssignLocalInteractProgress(const FECSEntity &inout Entity, const FC_LocalInteractProgress &inout DefaultValue = FC_LocalInteractProgress())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LocalInteractProgress, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLocalInteractProgress_BP(const FECSEntity &inout Entity, const FC_LocalInteractProgress &inout DefaultValue = FC_LocalInteractProgress())
{
    ECSFunc_FC_LocalInteractProgress::AssignLocalInteractProgress(Entity, DefaultValue);
    return;
}
FC_LocalInteractProgress& ModifyLocalInteractProgress(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LocalInteractProgress));
    return local_12.GetComp();
}
FC_LocalInteractProgress& ModifyOrAddLocalInteractProgress(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LocalInteractProgress));
    return local_12.GetComp();
}
const FC_LocalInteractProgress& GetLocalInteractProgress(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LocalInteractProgress));
    return local_12.GetComp();
}
UFUNCTION()
FC_LocalInteractProgress GetLocalInteractProgress_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LocalInteractProgress& local_4 = ECSFunc_FC_LocalInteractProgress::GetLocalInteractProgress(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LocalInteractProgress();
}
const FC_LocalInteractProgress GetDefaultedLocalInteractProgress(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LocalInteractProgress __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LocalInteractProgress);
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
FC_LocalInteractProgress GetDefaultedLocalInteractProgress_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LocalInteractProgress::GetDefaultedLocalInteractProgress(Entity);
}
UFUNCTION()
bool RemoveLocalInteractProgress(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LocalInteractProgress);
}
}
FECSMonitorRuntimeView __GetMonitorLocalInteractProgressOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LocalInteractProgress, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalInteractProgressOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LocalInteractProgress, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalInteractProgressOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LocalInteractProgress, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalInteractProgressOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LocalInteractProgress, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalInteractProgressOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LocalInteractProgress, bFixedFrame, bMustHandleAll);
}
void __MonitorLocalInteractProgressLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LocalInteractProgress, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalInteractProgressActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LocalInteractProgress, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalInteractProgressModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LocalInteractProgress, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LocalInteractWithTeam
{
UFUNCTION()
bool HasLocalInteractWithTeam(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LocalInteractWithTeam);
}
FC_LocalInteractWithTeam& AssignLocalInteractWithTeam(const FECSEntity &inout Entity, const FC_LocalInteractWithTeam &inout DefaultValue = FC_LocalInteractWithTeam())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LocalInteractWithTeam, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLocalInteractWithTeam_BP(const FECSEntity &inout Entity, const FC_LocalInteractWithTeam &inout DefaultValue = FC_LocalInteractWithTeam())
{
    ECSFunc_FC_LocalInteractWithTeam::AssignLocalInteractWithTeam(Entity, DefaultValue);
    return;
}
FC_LocalInteractWithTeam& ModifyLocalInteractWithTeam(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LocalInteractWithTeam));
    return local_12.GetComp();
}
FC_LocalInteractWithTeam& ModifyOrAddLocalInteractWithTeam(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LocalInteractWithTeam));
    return local_12.GetComp();
}
const FC_LocalInteractWithTeam& GetLocalInteractWithTeam(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LocalInteractWithTeam));
    return local_12.GetComp();
}
UFUNCTION()
FC_LocalInteractWithTeam GetLocalInteractWithTeam_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LocalInteractWithTeam& local_4 = ECSFunc_FC_LocalInteractWithTeam::GetLocalInteractWithTeam(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LocalInteractWithTeam();
}
const FC_LocalInteractWithTeam GetDefaultedLocalInteractWithTeam(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LocalInteractWithTeam __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LocalInteractWithTeam);
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
FC_LocalInteractWithTeam GetDefaultedLocalInteractWithTeam_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LocalInteractWithTeam::GetDefaultedLocalInteractWithTeam(Entity);
}
UFUNCTION()
bool RemoveLocalInteractWithTeam(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LocalInteractWithTeam);
}
}
FECSMonitorRuntimeView __GetMonitorLocalInteractWithTeamOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LocalInteractWithTeam, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalInteractWithTeamOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LocalInteractWithTeam, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalInteractWithTeamOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LocalInteractWithTeam, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalInteractWithTeamOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LocalInteractWithTeam, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalInteractWithTeamOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LocalInteractWithTeam, bFixedFrame, bMustHandleAll);
}
void __MonitorLocalInteractWithTeamLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LocalInteractWithTeam, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalInteractWithTeamActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LocalInteractWithTeam, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalInteractWithTeamModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LocalInteractWithTeam, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SecondaryInteractTargetTag
{
UFUNCTION()
bool HasSecondaryInteractTargetTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SecondaryInteractTargetTag);
}
FC_SecondaryInteractTargetTag& AssignSecondaryInteractTargetTag(const FECSEntity &inout Entity, const FC_SecondaryInteractTargetTag &inout DefaultValue = FC_SecondaryInteractTargetTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SecondaryInteractTargetTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSecondaryInteractTargetTag_BP(const FECSEntity &inout Entity, const FC_SecondaryInteractTargetTag &inout DefaultValue = FC_SecondaryInteractTargetTag())
{
    ECSFunc_FC_SecondaryInteractTargetTag::AssignSecondaryInteractTargetTag(Entity, DefaultValue);
    return;
}
FC_SecondaryInteractTargetTag& ModifySecondaryInteractTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SecondaryInteractTargetTag));
    return local_12.GetComp();
}
FC_SecondaryInteractTargetTag& ModifyOrAddSecondaryInteractTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SecondaryInteractTargetTag));
    return local_12.GetComp();
}
const FC_SecondaryInteractTargetTag& GetSecondaryInteractTargetTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SecondaryInteractTargetTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_SecondaryInteractTargetTag GetSecondaryInteractTargetTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SecondaryInteractTargetTag& local_4 = ECSFunc_FC_SecondaryInteractTargetTag::GetSecondaryInteractTargetTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SecondaryInteractTargetTag();
}
const FC_SecondaryInteractTargetTag GetDefaultedSecondaryInteractTargetTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SecondaryInteractTargetTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SecondaryInteractTargetTag);
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
FC_SecondaryInteractTargetTag GetDefaultedSecondaryInteractTargetTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SecondaryInteractTargetTag::GetDefaultedSecondaryInteractTargetTag(Entity);
}
UFUNCTION()
bool RemoveSecondaryInteractTargetTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SecondaryInteractTargetTag);
}
}
FECSMonitorRuntimeView __GetMonitorSecondaryInteractTargetTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SecondaryInteractTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSecondaryInteractTargetTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SecondaryInteractTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSecondaryInteractTargetTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SecondaryInteractTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSecondaryInteractTargetTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SecondaryInteractTargetTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSecondaryInteractTargetTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SecondaryInteractTargetTag, bFixedFrame, bMustHandleAll);
}
void __MonitorSecondaryInteractTargetTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SecondaryInteractTargetTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSecondaryInteractTargetTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SecondaryInteractTargetTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSecondaryInteractTargetTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SecondaryInteractTargetTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EnableInteractProgressTag
{
UFUNCTION()
bool HasEnableInteractProgressTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EnableInteractProgressTag);
}
FC_EnableInteractProgressTag& AssignEnableInteractProgressTag(const FECSEntity &inout Entity, const FC_EnableInteractProgressTag &inout DefaultValue = FC_EnableInteractProgressTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EnableInteractProgressTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEnableInteractProgressTag_BP(const FECSEntity &inout Entity, const FC_EnableInteractProgressTag &inout DefaultValue = FC_EnableInteractProgressTag())
{
    ECSFunc_FC_EnableInteractProgressTag::AssignEnableInteractProgressTag(Entity, DefaultValue);
    return;
}
FC_EnableInteractProgressTag& ModifyEnableInteractProgressTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EnableInteractProgressTag));
    return local_12.GetComp();
}
FC_EnableInteractProgressTag& ModifyOrAddEnableInteractProgressTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EnableInteractProgressTag));
    return local_12.GetComp();
}
const FC_EnableInteractProgressTag& GetEnableInteractProgressTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EnableInteractProgressTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_EnableInteractProgressTag GetEnableInteractProgressTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EnableInteractProgressTag& local_4 = ECSFunc_FC_EnableInteractProgressTag::GetEnableInteractProgressTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EnableInteractProgressTag();
}
const FC_EnableInteractProgressTag GetDefaultedEnableInteractProgressTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EnableInteractProgressTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EnableInteractProgressTag);
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
FC_EnableInteractProgressTag GetDefaultedEnableInteractProgressTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EnableInteractProgressTag::GetDefaultedEnableInteractProgressTag(Entity);
}
UFUNCTION()
bool RemoveEnableInteractProgressTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EnableInteractProgressTag);
}
}
FECSMonitorRuntimeView __GetMonitorEnableInteractProgressTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EnableInteractProgressTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnableInteractProgressTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EnableInteractProgressTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnableInteractProgressTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EnableInteractProgressTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnableInteractProgressTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EnableInteractProgressTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEnableInteractProgressTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EnableInteractProgressTag, bFixedFrame, bMustHandleAll);
}
void __MonitorEnableInteractProgressTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EnableInteractProgressTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEnableInteractProgressTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EnableInteractProgressTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEnableInteractProgressTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EnableInteractProgressTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AutoInteractHoldInput
{
UFUNCTION()
bool HasAutoInteractHoldInput(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AutoInteractHoldInput);
}
FC_AutoInteractHoldInput& AssignAutoInteractHoldInput(const FECSEntity &inout Entity, const FC_AutoInteractHoldInput &inout DefaultValue = FC_AutoInteractHoldInput())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AutoInteractHoldInput, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAutoInteractHoldInput_BP(const FECSEntity &inout Entity, const FC_AutoInteractHoldInput &inout DefaultValue = FC_AutoInteractHoldInput())
{
    ECSFunc_FC_AutoInteractHoldInput::AssignAutoInteractHoldInput(Entity, DefaultValue);
    return;
}
FC_AutoInteractHoldInput& ModifyAutoInteractHoldInput(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AutoInteractHoldInput));
    return local_12.GetComp();
}
FC_AutoInteractHoldInput& ModifyOrAddAutoInteractHoldInput(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AutoInteractHoldInput));
    return local_12.GetComp();
}
const FC_AutoInteractHoldInput& GetAutoInteractHoldInput(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AutoInteractHoldInput));
    return local_12.GetComp();
}
UFUNCTION()
FC_AutoInteractHoldInput GetAutoInteractHoldInput_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AutoInteractHoldInput __r;
    bValid = false;
    bValid = ECSFunc_FC_AutoInteractHoldInput::GetAutoInteractHoldInput(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AutoInteractHoldInput GetDefaultedAutoInteractHoldInput(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AutoInteractHoldInput __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AutoInteractHoldInput);
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
FC_AutoInteractHoldInput GetDefaultedAutoInteractHoldInput_BP(const FECSEntity &inout Entity)
{
    FC_AutoInteractHoldInput __r;
    return __r;
}
UFUNCTION()
bool RemoveAutoInteractHoldInput(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AutoInteractHoldInput);
}
}
FECSMonitorRuntimeView __GetMonitorAutoInteractHoldInputOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AutoInteractHoldInput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoInteractHoldInputOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AutoInteractHoldInput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoInteractHoldInputOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AutoInteractHoldInput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoInteractHoldInputOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AutoInteractHoldInput, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoInteractHoldInputOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AutoInteractHoldInput, bFixedFrame, bMustHandleAll);
}
void __MonitorAutoInteractHoldInputLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AutoInteractHoldInput, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoInteractHoldInputActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AutoInteractHoldInput, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoInteractHoldInputModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AutoInteractHoldInput, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_InteractWaitForOtherPlayerTag
{
UFUNCTION()
bool HasInteractWaitForOtherPlayerTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InteractWaitForOtherPlayerTag);
}
FC_InteractWaitForOtherPlayerTag& AssignInteractWaitForOtherPlayerTag(const FECSEntity &inout Entity, const FC_InteractWaitForOtherPlayerTag &inout DefaultValue = FC_InteractWaitForOtherPlayerTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InteractWaitForOtherPlayerTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInteractWaitForOtherPlayerTag_BP(const FECSEntity &inout Entity, const FC_InteractWaitForOtherPlayerTag &inout DefaultValue = FC_InteractWaitForOtherPlayerTag())
{
    ECSFunc_FC_InteractWaitForOtherPlayerTag::AssignInteractWaitForOtherPlayerTag(Entity, DefaultValue);
    return;
}
FC_InteractWaitForOtherPlayerTag& ModifyInteractWaitForOtherPlayerTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InteractWaitForOtherPlayerTag));
    return local_12.GetComp();
}
FC_InteractWaitForOtherPlayerTag& ModifyOrAddInteractWaitForOtherPlayerTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InteractWaitForOtherPlayerTag));
    return local_12.GetComp();
}
const FC_InteractWaitForOtherPlayerTag& GetInteractWaitForOtherPlayerTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InteractWaitForOtherPlayerTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_InteractWaitForOtherPlayerTag GetInteractWaitForOtherPlayerTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_InteractWaitForOtherPlayerTag& local_4 = ECSFunc_FC_InteractWaitForOtherPlayerTag::GetInteractWaitForOtherPlayerTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_InteractWaitForOtherPlayerTag();
}
const FC_InteractWaitForOtherPlayerTag GetDefaultedInteractWaitForOtherPlayerTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InteractWaitForOtherPlayerTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InteractWaitForOtherPlayerTag);
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
FC_InteractWaitForOtherPlayerTag GetDefaultedInteractWaitForOtherPlayerTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_InteractWaitForOtherPlayerTag::GetDefaultedInteractWaitForOtherPlayerTag(Entity);
}
UFUNCTION()
bool RemoveInteractWaitForOtherPlayerTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InteractWaitForOtherPlayerTag);
}
}
FECSMonitorRuntimeView __GetMonitorInteractWaitForOtherPlayerTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InteractWaitForOtherPlayerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractWaitForOtherPlayerTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InteractWaitForOtherPlayerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractWaitForOtherPlayerTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InteractWaitForOtherPlayerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractWaitForOtherPlayerTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InteractWaitForOtherPlayerTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractWaitForOtherPlayerTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InteractWaitForOtherPlayerTag, bFixedFrame, bMustHandleAll);
}
void __MonitorInteractWaitForOtherPlayerTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InteractWaitForOtherPlayerTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractWaitForOtherPlayerTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InteractWaitForOtherPlayerTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractWaitForOtherPlayerTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InteractWaitForOtherPlayerTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_InteractUIPageInfo
{
UFUNCTION()
bool HasInteractUIPageInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_InteractUIPageInfo);
}
FC_InteractUIPageInfo& AssignInteractUIPageInfo(const FECSEntity &inout Entity, const FC_InteractUIPageInfo &inout DefaultValue = FC_InteractUIPageInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_InteractUIPageInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignInteractUIPageInfo_BP(const FECSEntity &inout Entity, const FC_InteractUIPageInfo &inout DefaultValue = FC_InteractUIPageInfo())
{
    ECSFunc_FC_InteractUIPageInfo::AssignInteractUIPageInfo(Entity, DefaultValue);
    return;
}
FC_InteractUIPageInfo& ModifyInteractUIPageInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_InteractUIPageInfo));
    return local_12.GetComp();
}
FC_InteractUIPageInfo& ModifyOrAddInteractUIPageInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_InteractUIPageInfo));
    return local_12.GetComp();
}
const FC_InteractUIPageInfo& GetInteractUIPageInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_InteractUIPageInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_InteractUIPageInfo GetInteractUIPageInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_InteractUIPageInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_InteractUIPageInfo::GetInteractUIPageInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_InteractUIPageInfo GetDefaultedInteractUIPageInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_InteractUIPageInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_InteractUIPageInfo);
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
FC_InteractUIPageInfo GetDefaultedInteractUIPageInfo_BP(const FECSEntity &inout Entity)
{
    FC_InteractUIPageInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveInteractUIPageInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_InteractUIPageInfo);
}
}
FECSMonitorRuntimeView __GetMonitorInteractUIPageInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_InteractUIPageInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractUIPageInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_InteractUIPageInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractUIPageInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_InteractUIPageInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractUIPageInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_InteractUIPageInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorInteractUIPageInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_InteractUIPageInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorInteractUIPageInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_InteractUIPageInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractUIPageInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_InteractUIPageInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInteractUIPageInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_InteractUIPageInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DelayKeepInteractPresentationTag
{
UFUNCTION()
bool HasDelayKeepInteractPresentationTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DelayKeepInteractPresentationTag);
}
FC_DelayKeepInteractPresentationTag& AssignDelayKeepInteractPresentationTag(const FECSEntity &inout Entity, const FC_DelayKeepInteractPresentationTag &inout DefaultValue = FC_DelayKeepInteractPresentationTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DelayKeepInteractPresentationTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDelayKeepInteractPresentationTag_BP(const FECSEntity &inout Entity, const FC_DelayKeepInteractPresentationTag &inout DefaultValue = FC_DelayKeepInteractPresentationTag())
{
    ECSFunc_FC_DelayKeepInteractPresentationTag::AssignDelayKeepInteractPresentationTag(Entity, DefaultValue);
    return;
}
FC_DelayKeepInteractPresentationTag& ModifyDelayKeepInteractPresentationTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DelayKeepInteractPresentationTag));
    return local_12.GetComp();
}
FC_DelayKeepInteractPresentationTag& ModifyOrAddDelayKeepInteractPresentationTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DelayKeepInteractPresentationTag));
    return local_12.GetComp();
}
const FC_DelayKeepInteractPresentationTag& GetDelayKeepInteractPresentationTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DelayKeepInteractPresentationTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_DelayKeepInteractPresentationTag GetDelayKeepInteractPresentationTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DelayKeepInteractPresentationTag& local_4 = ECSFunc_FC_DelayKeepInteractPresentationTag::GetDelayKeepInteractPresentationTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DelayKeepInteractPresentationTag();
}
const FC_DelayKeepInteractPresentationTag GetDefaultedDelayKeepInteractPresentationTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DelayKeepInteractPresentationTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DelayKeepInteractPresentationTag);
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
FC_DelayKeepInteractPresentationTag GetDefaultedDelayKeepInteractPresentationTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DelayKeepInteractPresentationTag::GetDefaultedDelayKeepInteractPresentationTag(Entity);
}
UFUNCTION()
bool RemoveDelayKeepInteractPresentationTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DelayKeepInteractPresentationTag);
}
}
FECSMonitorRuntimeView __GetMonitorDelayKeepInteractPresentationTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DelayKeepInteractPresentationTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDelayKeepInteractPresentationTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DelayKeepInteractPresentationTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDelayKeepInteractPresentationTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DelayKeepInteractPresentationTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDelayKeepInteractPresentationTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DelayKeepInteractPresentationTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDelayKeepInteractPresentationTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DelayKeepInteractPresentationTag, bFixedFrame, bMustHandleAll);
}
void __MonitorDelayKeepInteractPresentationTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DelayKeepInteractPresentationTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDelayKeepInteractPresentationTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DelayKeepInteractPresentationTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDelayKeepInteractPresentationTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DelayKeepInteractPresentationTag, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_InteractionInfoForESM_bIsAutoInteract(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetbIsAutoInteract();
    return;
}
void GetEntityBBVar_InteractionInfoForESM_InteractType(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().GetInteractType()) != 0);
    return;
}
void GetEntityBBVar_InteractionInfoForESM_SubType(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().GetSubType()) != 0);
    return;
}
void GetEntityBBVar_InteractionInfoForESM_InteractTargetLocation(const FECSEntity &inout Entity, FVector &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FVector(local_4.opCall().GetInteractTargetLocation());
    return;
}
void GetEntityBBVar_InteractionInfoForESM_InteractTargetRotation(const FECSEntity &inout Entity, FRotator &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FRotator(local_4.opCall().GetInteractTargetRotation());
    return;
}
void GetEntityBBVar_InteractionInfoForESM_TargetEntity(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetTargetEntity());
    return;
}
void GetEntityBBVar_InteractionInfoForESM_SocialAnimName(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().GetSocialAnimName()) != 0);
    return;
}
void GetEntityBBVar_InteractionInfoForESM_TargetPointYawToPlayer(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetTargetPointYawToPlayer();
    return;
}
void GetEntityBBVar_InteractionInfoForESM_TargetPointPitchToPlayer(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetTargetPointPitchToPlayer();
    return;
}
void GetEntityBBVar_InteractionInfoModeZ_TargetEntity(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().TargetEntity);
    return;
}
void GetEntityBBVar_RuntimeInteractTargetStatus_GetInteractingSourceCount(const FECSEntity &inout Entity, int &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetInteractingSourceCount();
    return;
}
void GetEntityBBVar_InteractionInfoForESM_GetDistanceXYToTargetPoint(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetDistanceXYToTargetPoint(Entity);
    return;
}
void GetEntityBBVar_InteractionInfoForESM_IsInteractTargetActive(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().IsInteractTargetActive();
    return;
}
void GetEntityBBVar_InteractionInfoForESM_InteractTargetPointIndex(const FECSEntity &inout Entity, int &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().InteractTargetPointIndex();
    return;
}
void GetEntityBBVar_InteractionInfoModeZ_IsInteractTargetActive(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().IsInteractTargetActive();
    return;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FPendingInteractSourceEntry &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FPendingInteractSourceEntry &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPendingInteractSourceEntry
{
int __IndexOf_PointIndex()
{
    return 0;
}
int __IndexOf_BehaviorIndex()
{
    return 1;
}
int __IndexOf_PendingCount()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_RuntimeInteractTargetStatus &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_RuntimeInteractTargetStatus &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_RuntimeInteractTargetStatus &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_RuntimeInteractTargetStatus
{
int __IndexOf_bRuntimeDisabled()
{
    return 0;
}
int __IndexOf_RuntimePointsDisabled()
{
    return 1;
}
int __IndexOf_InteractionPointStatus()
{
    return 2;
}
int __IndexOf_InteractionBehaviorStatus()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_InteractionInfoForESM &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_InteractionInfoForESM &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_InteractionInfoForESM &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_InteractionInfoForESM
{
int __IndexOf_bIsAutoInteract()
{
    return 0;
}
int __IndexOf_bIsSecondaryInteractSource()
{
    return 1;
}
int __IndexOf_InteractType()
{
    return 2;
}
int __IndexOf_SubType()
{
    return 3;
}
int __IndexOf_InteractTargetLocation()
{
    return 4;
}
int __IndexOf_InteractTargetRotation()
{
    return 5;
}
int __IndexOf_TargetEntity()
{
    return 6;
}
int __IndexOf_TargetPointAndBehaviorIndex()
{
    return 7;
}
int __IndexOf_ExpireTime()
{
    return 8;
}
int __IndexOf_SocialAnimName()
{
    return 9;
}
int __IndexOf_TargetPointYawToPlayer()
{
    return 10;
}
int __IndexOf_TargetPointPitchToPlayer()
{
    return 11;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SecondaryInteractSourceInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SecondaryInteractSourceInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SecondaryInteractSourceInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SecondaryInteractSourceInfo
{
int __IndexOf_TargetEntity()
{
    return 0;
}
int __IndexOf_InteractType()
{
    return 1;
}
int __IndexOf_SubType()
{
    return 2;
}
int __IndexOf_TargetPointAndBehaviorIndex()
{
    return 3;
}
}

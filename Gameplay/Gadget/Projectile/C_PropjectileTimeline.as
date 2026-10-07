
namespace __INTENRAL_FC_ProjectileTimelineConfig_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileTimelineConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileTimelineConfig>();
    const FC_ProjectileTimelineConfig DefaultValue = FC_ProjectileTimelineConfig();
}
namespace __INTENRAL_FC_ProjectileTimelineData_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileTimelineData> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileTimelineData>();
    const FC_ProjectileTimelineData DefaultValue = FC_ProjectileTimelineData();
}
namespace __INTENRAL_FC_ProjectileUseTimelineTag_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileUseTimelineTag> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileUseTimelineTag>();
    const FC_ProjectileUseTimelineTag DefaultValue = FC_ProjectileUseTimelineTag();
}
namespace __INTENRAL_FC_ProjectileTimelineController_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileTimelineController> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileTimelineController>();
    const FC_ProjectileTimelineController DefaultValue = FC_ProjectileTimelineController();
}
namespace __INTENRAL_FC_ProjectileTimelineChange_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileTimelineChange> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileTimelineChange>();
    const FC_ProjectileTimelineChange DefaultValue = FC_ProjectileTimelineChange();
}
namespace __INTENRAL_FC_ProjectileTimelineComponentReplaceSync_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileTimelineComponentReplaceSync> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileTimelineComponentReplaceSync>();
    const FC_ProjectileTimelineComponentReplaceSync DefaultValue = FC_ProjectileTimelineComponentReplaceSync();
}
namespace __INTENRAL_FC_ProjectileTimelineComponentReplaceNonSync_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileTimelineComponentReplaceNonSync> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileTimelineComponentReplaceNonSync>();
    const FC_ProjectileTimelineComponentReplaceNonSync DefaultValue = FC_ProjectileTimelineComponentReplaceNonSync();
}
namespace __INTENRAL_FC_ProjectileTimelineEventTriggerConfig_NS
{
    const TECSComponentDerivedPtr<FC_ProjectileTimelineEventTriggerConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ProjectileTimelineEventTriggerConfig>();
    const FC_ProjectileTimelineEventTriggerConfig DefaultValue = FC_ProjectileTimelineEventTriggerConfig();

}
struct FC_ProjectileTimelineConfig : FECSComponent
{
    UPROPERTY()
    FProjectileTimelineAssetRef TimelineAssetRef;
    UPROPERTY()
    FName InitState;

    FC_ProjectileTimelineConfig()
    {
        return;
    }
}

struct FC_ProjectileTimelineData : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TSoftObjectPtr<UProjectileTimelineAsset> m_TimelineAsset;
    UPROPERTY()
    FName m_InitState;

    FC_ProjectileTimelineData()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ProjectileTimelineData(const FC_ProjectileTimelineData &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_TimelineAsset = Other.m_TimelineAsset;
        this.m_InitState = Other.m_InitState;
        return;
    }
    FC_ProjectileTimelineData opAssign(const FC_ProjectileTimelineData &inout Other)
    {
        FC_ProjectileTimelineData __r;
        this.SetTimelineAsset(Other.GetTimelineAsset());
        this.SetInitState(Other.GetInitState());
        return __r;
    }
    const TSoftObjectPtr<UProjectileTimelineAsset> GetTimelineAsset() const property
    {
        const TSoftObjectPtr<UProjectileTimelineAsset> __r;
        return __r;
    }
    TSoftObjectPtr<UProjectileTimelineAsset> GetModify_TimelineAsset() property
    {
        TSoftObjectPtr<UProjectileTimelineAsset> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTimelineAsset(const TSoftObjectPtr<UProjectileTimelineAsset> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TimelineAsset = __Value;
        return;
    }
    FName GetInitState() const property
    {
        return this.m_InitState;
    }
    void SetInitState(const FName &inout __Value) property
    {
        if ((this.m_InitState == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_InitState = __Value;
        return;
    }
}

struct FC_ProjectileUseTimelineTag : FECSComponent
{
    FC_ProjectileUseTimelineTag()
    {
        return;
    }
}

struct FProjectileTimelineActionRelativeData
{
    UPROPERTY()
    FECSEntity m_RelativeEntity;

    FProjectileTimelineActionRelativeData()
    {
        return;
    }
    FProjectileTimelineActionRelativeData(const FECSEntity &inout InRelativeEntity)
    {
        this.SetRelativeEntity(InRelativeEntity);
        return;
    }
    const FECSEntity GetRelativeEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetRelativeEntity() property
    {
        FECSEntity __r;
        return __r;
    }
    void SetRelativeEntity(const FECSEntity &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FProjectileTimelineRuntimeInfo
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    bool m_bIsActive;
    UPROPERTY()
    int m_IndexInConfig;
    UPROPERTY()
    FFPTime m_TimeOffset;
    UPROPERTY()
    FFPTime m_CurLocalTime;
    UPROPERTY()
    int m_NextBeginActionIndex;
    UPROPERTY()
    int m_NextEndActionIndexInEndOrderList;
    UPROPERTY()
    FFPTime m_NextActionBeginTime;
    UPROPERTY()
    FFPTime m_NextActionEndTime;
    UPROPERTY()
    FVector m_ContextPosition;
    UPROPERTY()
    FQuat4f m_ContextRotation;
    UPROPERTY()
    FECSEntity m_ContextEntity;
    UPROPERTY()
    TArray<int> m_ActiveActionIndexes;
    UPROPERTY()
    TMap<int, FProjectileTimelineActionRelativeData> m_RelativeDatas;

    FProjectileTimelineRuntimeInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FProjectileTimelineRuntimeInfo(const FProjectileTimelineRuntimeInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FProjectileTimelineRuntimeInfo opAssign(const FProjectileTimelineRuntimeInfo &inout Other)
    {
        FProjectileTimelineRuntimeInfo __r;
        this.SetbIsActive(Other.GetbIsActive());
        this.SetIndexInConfig(Other.GetIndexInConfig());
        this.SetTimeOffset(Other.GetTimeOffset());
        this.SetCurLocalTime(Other.GetCurLocalTime());
        this.SetNextBeginActionIndex(Other.GetNextBeginActionIndex());
        this.SetNextEndActionIndexInEndOrderList(Other.GetNextEndActionIndexInEndOrderList());
        this.SetNextActionBeginTime(Other.GetNextActionBeginTime());
        this.SetNextActionEndTime(Other.GetNextActionEndTime());
        this.SetContextPosition(Other.GetContextPosition());
        this.SetContextRotation(Other.GetContextRotation());
        this.SetContextEntity(Other.GetContextEntity());
        this.SetActiveActionIndexes(Other.GetActiveActionIndexes());
        this.SetRelativeDatas(Other.GetRelativeDatas());
        return __r;
    }
    void Reset()
    {
        this.SetbIsActive(false);
        this.SetIndexInConfig(0);
        this.SetTimeOffset(FFPTime(0));
        this.SetCurLocalTime(FFPTime(0));
        this.SetNextBeginActionIndex(0);
        this.SetNextEndActionIndexInEndOrderList(0);
        this.SetNextActionBeginTime(FFPTime(0));
        this.SetNextActionEndTime(FFPTime(0));
        this.SetContextPosition(FVector::ZeroVector);
        this.SetContextRotation(FQuat4f::Identity);
        this.SetContextEntity(ENTITY_NULL);
        this.GetModify_ActiveActionIndexes().Reset(0);
        this.GetModify_RelativeDatas().Reset();
        return;
    }
    bool GetbIsActive() const property
    {
        return this.m_bIsActive;
    }
    void SetbIsActive(const bool __Value) property
    {
        if (!(this.m_bIsActive) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bIsActive = __Value;
        return;
    }
    int GetIndexInConfig() const property
    {
        return this.m_IndexInConfig;
    }
    void SetIndexInConfig(const int __Value) property
    {
        if (this.m_IndexInConfig == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_IndexInConfig = __Value;
        return;
    }
    FFPTime GetTimeOffset() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_TimeOffset() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetTimeOffset(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_TimeOffset = __Value;
        return;
    }
    const FFPTime GetCurLocalTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_CurLocalTime() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetCurLocalTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_CurLocalTime = __Value;
        return;
    }
    int GetNextBeginActionIndex() const property
    {
        return this.m_NextBeginActionIndex;
    }
    void SetNextBeginActionIndex(const int __Value) property
    {
        if (this.m_NextBeginActionIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_NextBeginActionIndex = __Value;
        return;
    }
    int GetNextEndActionIndexInEndOrderList() const property
    {
        return this.m_NextEndActionIndexInEndOrderList;
    }
    void SetNextEndActionIndexInEndOrderList(const int __Value) property
    {
        if (this.m_NextEndActionIndexInEndOrderList == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_NextEndActionIndexInEndOrderList = __Value;
        return;
    }
    const FFPTime GetNextActionBeginTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_NextActionBeginTime() property
    {
        FFPTime __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetNextActionBeginTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_NextActionBeginTime = __Value;
        return;
    }
    const FFPTime GetNextActionEndTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_NextActionEndTime() property
    {
        FFPTime __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetNextActionEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_NextActionEndTime = __Value;
        return;
    }
    const FVector GetContextPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_ContextPosition() property
    {
        FVector __r;
        this.__MarkDirty(8);
        return __r;
    }
    void SetContextPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_ContextPosition = __Value;
        return;
    }
    const FQuat4f GetContextRotation() const property
    {
        const FQuat4f __r;
        return __r;
    }
    FQuat4f GetModify_ContextRotation() property
    {
        FQuat4f __r;
        this.__MarkDirty(9);
        return __r;
    }
    void SetContextRotation(const FQuat4f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_ContextRotation = __Value;
        return;
    }
    const FECSEntity GetContextEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_ContextEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(10);
        return __r;
    }
    void SetContextEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_ContextEntity = __Value;
        return;
    }
    const TArray<int> GetActiveActionIndexes() const property
    {
        const TArray<int> __r;
        return __r;
    }
    TArray<int> GetModify_ActiveActionIndexes() property
    {
        TArray<int> __r;
        this.__MarkDirty(11);
        return __r;
    }
    void SetActiveActionIndexes(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_ActiveActionIndexes = __Value;
        return;
    }
    const TMap<int, FProjectileTimelineActionRelativeData> GetRelativeDatas() const property
    {
        const TMap<int, FProjectileTimelineActionRelativeData> __r;
        return __r;
    }
    TMap<int, FProjectileTimelineActionRelativeData> GetModify_RelativeDatas() property
    {
        TMap<int, FProjectileTimelineActionRelativeData> __r;
        this.__MarkDirty(12);
        return __r;
    }
    void SetRelativeDatas(const TMap<int, FProjectileTimelineActionRelativeData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_RelativeDatas = __Value;
        return;
    }
}

struct FC_ProjectileTimelineController : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_CurStateConfigTimelineIndex;
    UPROPERTY()
    FFPTime m_WorldTimeOffset;
    UPROPERTY()
    FFPTime m_NextTickTime;
    UPROPERTY()
    FFPTime m_LastTickTime;
    UPROPERTY()
    TArray<FProjectileTimelineRuntimeInfo> m_TimelineInfos;

    FC_ProjectileTimelineController()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProjectileTimelineController(const FC_ProjectileTimelineController &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProjectileTimelineController opAssign(const FC_ProjectileTimelineController &inout Other)
    {
        FC_ProjectileTimelineController __r;
        this.SetCurStateConfigTimelineIndex(Other.GetCurStateConfigTimelineIndex());
        this.SetWorldTimeOffset(Other.GetWorldTimeOffset());
        this.SetNextTickTime(Other.GetNextTickTime());
        this.SetLastTickTime(Other.GetLastTickTime());
        this.SetTimelineInfos(Other.GetTimelineInfos());
        return __r;
    }
    FFPTime GetNextTickWorldTime() const
    {
        return (FFPTime(this.GetWorldTimeOffset()) + this.GetNextTickTime());
    }
    int GetCurStateConfigTimelineIndex() const property
    {
        return this.m_CurStateConfigTimelineIndex;
    }
    void SetCurStateConfigTimelineIndex(const int __Value) property
    {
        if (this.m_CurStateConfigTimelineIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_CurStateConfigTimelineIndex = __Value;
        return;
    }
    const FFPTime GetWorldTimeOffset() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_WorldTimeOffset() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetWorldTimeOffset(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_WorldTimeOffset = __Value;
        return;
    }
    const FFPTime GetNextTickTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_NextTickTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetNextTickTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_NextTickTime = __Value;
        return;
    }
    const FFPTime GetLastTickTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_LastTickTime() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetLastTickTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_LastTickTime = __Value;
        return;
    }
    const TArray<FProjectileTimelineRuntimeInfo> GetTimelineInfos() const property
    {
        const TArray<FProjectileTimelineRuntimeInfo> __r;
        return __r;
    }
    TArray<FProjectileTimelineRuntimeInfo> GetModify_TimelineInfos() property
    {
        TArray<FProjectileTimelineRuntimeInfo> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetTimelineInfos(const TArray<FProjectileTimelineRuntimeInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_TimelineInfos = __Value;
        return;
    }
}

struct FProjectileTimelineEventContext
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_TimelineConfigIndex;
    UPROPERTY()
    FFPTime m_WorldTime;
    UPROPERTY()
    FECSEntity m_ContextEntity;
    UPROPERTY()
    FVector m_ContextPosition;
    UPROPERTY()
    FQuat4f m_ContextRotation;

    FProjectileTimelineEventContext()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FProjectileTimelineEventContext(const FProjectileTimelineEventContext &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FProjectileTimelineEventContext opAssign(const FProjectileTimelineEventContext &inout Other)
    {
        FProjectileTimelineEventContext __r;
        this.SetTimelineConfigIndex(Other.GetTimelineConfigIndex());
        this.SetWorldTime(Other.GetWorldTime());
        this.SetContextEntity(Other.GetContextEntity());
        this.SetContextPosition(Other.GetContextPosition());
        this.SetContextRotation(Other.GetContextRotation());
        return __r;
    }
    int GetTimelineConfigIndex() const property
    {
        return this.m_TimelineConfigIndex;
    }
    void SetTimelineConfigIndex(const int __Value) property
    {
        if (this.m_TimelineConfigIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TimelineConfigIndex = __Value;
        return;
    }
    FFPTime GetWorldTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_WorldTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetWorldTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_WorldTime = __Value;
        return;
    }
    const FECSEntity GetContextEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_ContextEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetContextEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_ContextEntity = __Value;
        return;
    }
    const FVector GetContextPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_ContextPosition() property
    {
        FVector __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetContextPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ContextPosition = __Value;
        return;
    }
    const FQuat4f GetContextRotation() const property
    {
        const FQuat4f __r;
        return __r;
    }
    FQuat4f GetModify_ContextRotation() property
    {
        FQuat4f __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetContextRotation(const FQuat4f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_ContextRotation = __Value;
        return;
    }
}

struct FC_ProjectileTimelineChange : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_NextStateTimelineIndex;
    UPROPERTY()
    FFPTime m_NextStateStartWorldTime;
    UPROPERTY()
    TArray<FProjectileTimelineEventContext> m_PendingActivateTimelineContext;

    FC_ProjectileTimelineChange()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProjectileTimelineChange(const FC_ProjectileTimelineChange &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ProjectileTimelineChange opAssign(const FC_ProjectileTimelineChange &inout Other)
    {
        FC_ProjectileTimelineChange __r;
        this.SetNextStateTimelineIndex(Other.GetNextStateTimelineIndex());
        this.SetNextStateStartWorldTime(Other.GetNextStateStartWorldTime());
        this.SetPendingActivateTimelineContext(Other.GetPendingActivateTimelineContext());
        return __r;
    }
    int GetNextStateTimelineIndex() const property
    {
        return this.m_NextStateTimelineIndex;
    }
    void SetNextStateTimelineIndex(const int __Value) property
    {
        if (this.m_NextStateTimelineIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_NextStateTimelineIndex = __Value;
        return;
    }
    const FFPTime GetNextStateStartWorldTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_NextStateStartWorldTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetNextStateStartWorldTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_NextStateStartWorldTime = __Value;
        return;
    }
    const TArray<FProjectileTimelineEventContext> GetPendingActivateTimelineContext() const property
    {
        const TArray<FProjectileTimelineEventContext> __r;
        return __r;
    }
    TArray<FProjectileTimelineEventContext> GetModify_PendingActivateTimelineContext() property
    {
        TArray<FProjectileTimelineEventContext> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetPendingActivateTimelineContext(const TArray<FProjectileTimelineEventContext> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_PendingActivateTimelineContext = __Value;
        return;
    }
}

struct FProjectileTimelineComponentReplaceData
{
    UPROPERTY()
    int m_TimelineConfigIndex = 0;
    UPROPERTY()
    int m_ActionIndex = 0;


    int GetTimelineConfigIndex() const property
    {
        return this.m_TimelineConfigIndex;
    }
    void SetTimelineConfigIndex(const int __Value) property
    {
        this.m_TimelineConfigIndex = __Value;
        return;
    }
    int GetActionIndex() const property
    {
        return this.m_ActionIndex;
    }
    void SetActionIndex(const int __Value) property
    {
        this.m_ActionIndex = __Value;
        return;
    }
}

struct FC_ProjectileTimelineComponentReplaceSync : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<int, FProjectileTimelineComponentReplaceData> m_Data;

    FC_ProjectileTimelineComponentReplaceSync()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ProjectileTimelineComponentReplaceSync(const FC_ProjectileTimelineComponentReplaceSync &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Data = Other.m_Data;
        return;
    }
    FC_ProjectileTimelineComponentReplaceSync opAssign(const FC_ProjectileTimelineComponentReplaceSync &inout Other)
    {
        FC_ProjectileTimelineComponentReplaceSync __r;
        this.SetData(Other.GetData());
        return __r;
    }
    const TMap<int, FProjectileTimelineComponentReplaceData> GetData() const property
    {
        const TMap<int, FProjectileTimelineComponentReplaceData> __r;
        return __r;
    }
    TMap<int, FProjectileTimelineComponentReplaceData> GetModify_Data() property
    {
        TMap<int, FProjectileTimelineComponentReplaceData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetData(const TMap<int, FProjectileTimelineComponentReplaceData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Data = __Value;
        return;
    }
}

struct FC_ProjectileTimelineComponentReplaceNonSync : FECSComponent
{
    UPROPERTY()
    TMap<int, FProjectileTimelineComponentReplaceData> Data;

    FC_ProjectileTimelineComponentReplaceNonSync()
    {
        return;
    }
}

struct FProjectileEventTriggerConfig
{
    UPROPERTY()
    TArray<FProjectileTimelineEventNameRef> TriggerEvents;
    UPROPERTY()
    FProjectileTimelineStateNameRef TurnToState;

    FProjectileEventTriggerConfig()
    {
        return;
    }
}

struct FProjectileEventTriggerReaction
{
    UPROPERTY()
    bool bListenSpawnEvent;
    UPROPERTY()
    bool bListenHitEvent;
    UPROPERTY()
    uint8 HitableRelation = (3 != 0);
    UPROPERTY()
    bool bListenHitSceneEvent;
    UPROPERTY()
    bool bListenTrackReachEvent;
    UPROPERTY()
    bool bListenMoveBlockedDestroy;
    UPROPERTY()
    FProjectileEventTriggerConfig ReactionTrigger;


}

struct FC_ProjectileTimelineEventTriggerConfig : FECSComponent
{
    UPROPERTY()
    TArray<FProjectileEventTriggerReaction> TriggerReactions;

    FC_ProjectileTimelineEventTriggerConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_ProjectileTimelineConfig
{
UFUNCTION()
bool HasProjectileTimelineConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineConfig);
}
FC_ProjectileTimelineConfig& AssignProjectileTimelineConfig(const FECSEntity &inout Entity, const FC_ProjectileTimelineConfig &inout DefaultValue = FC_ProjectileTimelineConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileTimelineConfig_BP(const FECSEntity &inout Entity, const FC_ProjectileTimelineConfig &inout DefaultValue = FC_ProjectileTimelineConfig())
{
    ECSFunc_FC_ProjectileTimelineConfig::AssignProjectileTimelineConfig(Entity, DefaultValue);
    return;
}
FC_ProjectileTimelineConfig& ModifyProjectileTimelineConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineConfig));
    return local_12.GetComp();
}
FC_ProjectileTimelineConfig& ModifyOrAddProjectileTimelineConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineConfig));
    return local_12.GetComp();
}
const FC_ProjectileTimelineConfig& GetProjectileTimelineConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileTimelineConfig GetProjectileTimelineConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ProjectileTimelineConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_ProjectileTimelineConfig::GetProjectileTimelineConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ProjectileTimelineConfig GetDefaultedProjectileTimelineConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileTimelineConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineConfig);
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
FC_ProjectileTimelineConfig GetDefaultedProjectileTimelineConfig_BP(const FECSEntity &inout Entity)
{
    FC_ProjectileTimelineConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveProjectileTimelineConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineConfig);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileTimelineConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileTimelineConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileTimelineConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileTimelineConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileTimelineConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileTimelineConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileTimelineConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileTimelineConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileTimelineConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileTimelineConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileTimelineConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileTimelineData
{
UFUNCTION()
bool HasProjectileTimelineData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineData);
}
FC_ProjectileTimelineData& AssignProjectileTimelineData(const FECSEntity &inout Entity, const FC_ProjectileTimelineData &inout DefaultValue = FC_ProjectileTimelineData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileTimelineData_BP(const FECSEntity &inout Entity, const FC_ProjectileTimelineData &inout DefaultValue = FC_ProjectileTimelineData())
{
    ECSFunc_FC_ProjectileTimelineData::AssignProjectileTimelineData(Entity, DefaultValue);
    return;
}
FC_ProjectileTimelineData& ModifyProjectileTimelineData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineData));
    return local_12.GetComp();
}
FC_ProjectileTimelineData& ModifyOrAddProjectileTimelineData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineData));
    return local_12.GetComp();
}
const FC_ProjectileTimelineData& GetProjectileTimelineData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineData));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileTimelineData GetProjectileTimelineData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileTimelineData& local_4 = ECSFunc_FC_ProjectileTimelineData::GetProjectileTimelineData(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileTimelineData();
}
const FC_ProjectileTimelineData GetDefaultedProjectileTimelineData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileTimelineData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineData);
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
FC_ProjectileTimelineData GetDefaultedProjectileTimelineData_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileTimelineData::GetDefaultedProjectileTimelineData(Entity);
}
UFUNCTION()
bool RemoveProjectileTimelineData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineData);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileTimelineData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileTimelineData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileTimelineData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileTimelineData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileTimelineData, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileTimelineDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileTimelineData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileTimelineDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileTimelineData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileTimelineDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileTimelineData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileUseTimelineTag
{
UFUNCTION()
bool HasProjectileUseTimelineTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileUseTimelineTag);
}
FC_ProjectileUseTimelineTag& AssignProjectileUseTimelineTag(const FECSEntity &inout Entity, const FC_ProjectileUseTimelineTag &inout DefaultValue = FC_ProjectileUseTimelineTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileUseTimelineTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileUseTimelineTag_BP(const FECSEntity &inout Entity, const FC_ProjectileUseTimelineTag &inout DefaultValue = FC_ProjectileUseTimelineTag())
{
    ECSFunc_FC_ProjectileUseTimelineTag::AssignProjectileUseTimelineTag(Entity, DefaultValue);
    return;
}
FC_ProjectileUseTimelineTag& ModifyProjectileUseTimelineTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileUseTimelineTag));
    return local_12.GetComp();
}
FC_ProjectileUseTimelineTag& ModifyOrAddProjectileUseTimelineTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileUseTimelineTag));
    return local_12.GetComp();
}
const FC_ProjectileUseTimelineTag& GetProjectileUseTimelineTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileUseTimelineTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileUseTimelineTag GetProjectileUseTimelineTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileUseTimelineTag& local_4 = ECSFunc_FC_ProjectileUseTimelineTag::GetProjectileUseTimelineTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileUseTimelineTag();
}
const FC_ProjectileUseTimelineTag GetDefaultedProjectileUseTimelineTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileUseTimelineTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileUseTimelineTag);
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
FC_ProjectileUseTimelineTag GetDefaultedProjectileUseTimelineTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileUseTimelineTag::GetDefaultedProjectileUseTimelineTag(Entity);
}
UFUNCTION()
bool RemoveProjectileUseTimelineTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileUseTimelineTag);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileUseTimelineTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileUseTimelineTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileUseTimelineTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileUseTimelineTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileUseTimelineTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileUseTimelineTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileUseTimelineTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileUseTimelineTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileUseTimelineTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileUseTimelineTag, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileUseTimelineTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileUseTimelineTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileUseTimelineTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileUseTimelineTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileUseTimelineTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileUseTimelineTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileTimelineController
{
UFUNCTION()
bool HasProjectileTimelineController(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineController);
}
FC_ProjectileTimelineController& AssignProjectileTimelineController(const FECSEntity &inout Entity, const FC_ProjectileTimelineController &inout DefaultValue = FC_ProjectileTimelineController())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineController, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileTimelineController_BP(const FECSEntity &inout Entity, const FC_ProjectileTimelineController &inout DefaultValue = FC_ProjectileTimelineController())
{
    ECSFunc_FC_ProjectileTimelineController::AssignProjectileTimelineController(Entity, DefaultValue);
    return;
}
FC_ProjectileTimelineController& ModifyProjectileTimelineController(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineController));
    return local_12.GetComp();
}
FC_ProjectileTimelineController& ModifyOrAddProjectileTimelineController(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineController));
    return local_12.GetComp();
}
const FC_ProjectileTimelineController& GetProjectileTimelineController(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineController));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileTimelineController GetProjectileTimelineController_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileTimelineController& local_4 = ECSFunc_FC_ProjectileTimelineController::GetProjectileTimelineController(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileTimelineController();
}
const FC_ProjectileTimelineController GetDefaultedProjectileTimelineController(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileTimelineController __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineController);
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
FC_ProjectileTimelineController GetDefaultedProjectileTimelineController_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileTimelineController::GetDefaultedProjectileTimelineController(Entity);
}
UFUNCTION()
bool RemoveProjectileTimelineController(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineController);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineControllerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileTimelineController, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineControllerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileTimelineController, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineControllerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileTimelineController, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineControllerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileTimelineController, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineControllerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileTimelineController, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileTimelineControllerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileTimelineController, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileTimelineControllerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileTimelineController, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileTimelineControllerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileTimelineController, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileTimelineChange
{
UFUNCTION()
bool HasProjectileTimelineChange(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineChange);
}
FC_ProjectileTimelineChange& AssignProjectileTimelineChange(const FECSEntity &inout Entity, const FC_ProjectileTimelineChange &inout DefaultValue = FC_ProjectileTimelineChange())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineChange, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileTimelineChange_BP(const FECSEntity &inout Entity, const FC_ProjectileTimelineChange &inout DefaultValue = FC_ProjectileTimelineChange())
{
    ECSFunc_FC_ProjectileTimelineChange::AssignProjectileTimelineChange(Entity, DefaultValue);
    return;
}
FC_ProjectileTimelineChange& ModifyProjectileTimelineChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineChange));
    return local_12.GetComp();
}
FC_ProjectileTimelineChange& ModifyOrAddProjectileTimelineChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineChange));
    return local_12.GetComp();
}
const FC_ProjectileTimelineChange& GetProjectileTimelineChange(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineChange));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileTimelineChange GetProjectileTimelineChange_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileTimelineChange& local_4 = ECSFunc_FC_ProjectileTimelineChange::GetProjectileTimelineChange(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileTimelineChange();
}
const FC_ProjectileTimelineChange GetDefaultedProjectileTimelineChange(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileTimelineChange __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineChange);
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
FC_ProjectileTimelineChange GetDefaultedProjectileTimelineChange_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileTimelineChange::GetDefaultedProjectileTimelineChange(Entity);
}
UFUNCTION()
bool RemoveProjectileTimelineChange(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineChange);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineChangeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileTimelineChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineChangeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileTimelineChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineChangeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileTimelineChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineChangeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileTimelineChange, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineChangeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileTimelineChange, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileTimelineChangeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileTimelineChange, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileTimelineChangeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileTimelineChange, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileTimelineChangeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileTimelineChange, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileTimelineComponentReplaceSync
{
UFUNCTION()
bool HasProjectileTimelineComponentReplaceSync(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineComponentReplaceSync);
}
FC_ProjectileTimelineComponentReplaceSync& AssignProjectileTimelineComponentReplaceSync(const FECSEntity &inout Entity, const FC_ProjectileTimelineComponentReplaceSync &inout DefaultValue = FC_ProjectileTimelineComponentReplaceSync())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineComponentReplaceSync, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileTimelineComponentReplaceSync_BP(const FECSEntity &inout Entity, const FC_ProjectileTimelineComponentReplaceSync &inout DefaultValue = FC_ProjectileTimelineComponentReplaceSync())
{
    ECSFunc_FC_ProjectileTimelineComponentReplaceSync::AssignProjectileTimelineComponentReplaceSync(Entity, DefaultValue);
    return;
}
FC_ProjectileTimelineComponentReplaceSync& ModifyProjectileTimelineComponentReplaceSync(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineComponentReplaceSync));
    return local_12.GetComp();
}
FC_ProjectileTimelineComponentReplaceSync& ModifyOrAddProjectileTimelineComponentReplaceSync(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineComponentReplaceSync));
    return local_12.GetComp();
}
const FC_ProjectileTimelineComponentReplaceSync& GetProjectileTimelineComponentReplaceSync(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineComponentReplaceSync));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileTimelineComponentReplaceSync GetProjectileTimelineComponentReplaceSync_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ProjectileTimelineComponentReplaceSync& local_4 = ECSFunc_FC_ProjectileTimelineComponentReplaceSync::GetProjectileTimelineComponentReplaceSync(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ProjectileTimelineComponentReplaceSync();
}
const FC_ProjectileTimelineComponentReplaceSync GetDefaultedProjectileTimelineComponentReplaceSync(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileTimelineComponentReplaceSync __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineComponentReplaceSync);
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
FC_ProjectileTimelineComponentReplaceSync GetDefaultedProjectileTimelineComponentReplaceSync_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ProjectileTimelineComponentReplaceSync::GetDefaultedProjectileTimelineComponentReplaceSync(Entity);
}
UFUNCTION()
bool RemoveProjectileTimelineComponentReplaceSync(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineComponentReplaceSync);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineComponentReplaceSyncOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileTimelineComponentReplaceSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineComponentReplaceSyncOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileTimelineComponentReplaceSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineComponentReplaceSyncOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileTimelineComponentReplaceSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineComponentReplaceSyncOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileTimelineComponentReplaceSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineComponentReplaceSyncOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileTimelineComponentReplaceSync, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileTimelineComponentReplaceSyncLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileTimelineComponentReplaceSync, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileTimelineComponentReplaceSyncActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileTimelineComponentReplaceSync, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileTimelineComponentReplaceSyncModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileTimelineComponentReplaceSync, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileTimelineComponentReplaceNonSync
{
UFUNCTION()
bool HasProjectileTimelineComponentReplaceNonSync(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineComponentReplaceNonSync);
}
FC_ProjectileTimelineComponentReplaceNonSync& AssignProjectileTimelineComponentReplaceNonSync(const FECSEntity &inout Entity, const FC_ProjectileTimelineComponentReplaceNonSync &inout DefaultValue = FC_ProjectileTimelineComponentReplaceNonSync())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineComponentReplaceNonSync, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileTimelineComponentReplaceNonSync_BP(const FECSEntity &inout Entity, const FC_ProjectileTimelineComponentReplaceNonSync &inout DefaultValue = FC_ProjectileTimelineComponentReplaceNonSync())
{
    ECSFunc_FC_ProjectileTimelineComponentReplaceNonSync::AssignProjectileTimelineComponentReplaceNonSync(Entity, DefaultValue);
    return;
}
FC_ProjectileTimelineComponentReplaceNonSync& ModifyProjectileTimelineComponentReplaceNonSync(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineComponentReplaceNonSync));
    return local_12.GetComp();
}
FC_ProjectileTimelineComponentReplaceNonSync& ModifyOrAddProjectileTimelineComponentReplaceNonSync(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineComponentReplaceNonSync));
    return local_12.GetComp();
}
const FC_ProjectileTimelineComponentReplaceNonSync& GetProjectileTimelineComponentReplaceNonSync(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineComponentReplaceNonSync));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileTimelineComponentReplaceNonSync GetProjectileTimelineComponentReplaceNonSync_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ProjectileTimelineComponentReplaceNonSync __r;
    bValid = false;
    bValid = ECSFunc_FC_ProjectileTimelineComponentReplaceNonSync::GetProjectileTimelineComponentReplaceNonSync(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ProjectileTimelineComponentReplaceNonSync GetDefaultedProjectileTimelineComponentReplaceNonSync(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileTimelineComponentReplaceNonSync __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineComponentReplaceNonSync);
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
FC_ProjectileTimelineComponentReplaceNonSync GetDefaultedProjectileTimelineComponentReplaceNonSync_BP(const FECSEntity &inout Entity)
{
    FC_ProjectileTimelineComponentReplaceNonSync __r;
    return __r;
}
UFUNCTION()
bool RemoveProjectileTimelineComponentReplaceNonSync(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineComponentReplaceNonSync);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineComponentReplaceNonSyncOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileTimelineComponentReplaceNonSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineComponentReplaceNonSyncOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileTimelineComponentReplaceNonSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineComponentReplaceNonSyncOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileTimelineComponentReplaceNonSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineComponentReplaceNonSyncOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileTimelineComponentReplaceNonSync, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineComponentReplaceNonSyncOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileTimelineComponentReplaceNonSync, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileTimelineComponentReplaceNonSyncLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileTimelineComponentReplaceNonSync, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileTimelineComponentReplaceNonSyncActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileTimelineComponentReplaceNonSync, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileTimelineComponentReplaceNonSyncModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileTimelineComponentReplaceNonSync, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ProjectileTimelineEventTriggerConfig
{
UFUNCTION()
bool HasProjectileTimelineEventTriggerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineEventTriggerConfig);
}
FC_ProjectileTimelineEventTriggerConfig& AssignProjectileTimelineEventTriggerConfig(const FECSEntity &inout Entity, const FC_ProjectileTimelineEventTriggerConfig &inout DefaultValue = FC_ProjectileTimelineEventTriggerConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineEventTriggerConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignProjectileTimelineEventTriggerConfig_BP(const FECSEntity &inout Entity, const FC_ProjectileTimelineEventTriggerConfig &inout DefaultValue = FC_ProjectileTimelineEventTriggerConfig())
{
    ECSFunc_FC_ProjectileTimelineEventTriggerConfig::AssignProjectileTimelineEventTriggerConfig(Entity, DefaultValue);
    return;
}
FC_ProjectileTimelineEventTriggerConfig& ModifyProjectileTimelineEventTriggerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineEventTriggerConfig));
    return local_12.GetComp();
}
FC_ProjectileTimelineEventTriggerConfig& ModifyOrAddProjectileTimelineEventTriggerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineEventTriggerConfig));
    return local_12.GetComp();
}
const FC_ProjectileTimelineEventTriggerConfig& GetProjectileTimelineEventTriggerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineEventTriggerConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ProjectileTimelineEventTriggerConfig GetProjectileTimelineEventTriggerConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ProjectileTimelineEventTriggerConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_ProjectileTimelineEventTriggerConfig::GetProjectileTimelineEventTriggerConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ProjectileTimelineEventTriggerConfig GetDefaultedProjectileTimelineEventTriggerConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ProjectileTimelineEventTriggerConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineEventTriggerConfig);
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
FC_ProjectileTimelineEventTriggerConfig GetDefaultedProjectileTimelineEventTriggerConfig_BP(const FECSEntity &inout Entity)
{
    FC_ProjectileTimelineEventTriggerConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveProjectileTimelineEventTriggerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ProjectileTimelineEventTriggerConfig);
}
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineEventTriggerConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ProjectileTimelineEventTriggerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineEventTriggerConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ProjectileTimelineEventTriggerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineEventTriggerConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ProjectileTimelineEventTriggerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineEventTriggerConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ProjectileTimelineEventTriggerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorProjectileTimelineEventTriggerConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ProjectileTimelineEventTriggerConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorProjectileTimelineEventTriggerConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ProjectileTimelineEventTriggerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileTimelineEventTriggerConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ProjectileTimelineEventTriggerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorProjectileTimelineEventTriggerConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ProjectileTimelineEventTriggerConfig, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProjectileTimelineData &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProjectileTimelineData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProjectileTimelineData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProjectileTimelineData
{
int __IndexOf_TimelineAsset()
{
    return 0;
}
int __IndexOf_InitState()
{
    return 1;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FProjectileTimelineRuntimeInfo &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FProjectileTimelineRuntimeInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FProjectileTimelineRuntimeInfo
{
int __IndexOf_bIsActive()
{
    return 0;
}
int __IndexOf_IndexInConfig()
{
    return 1;
}
int __IndexOf_TimeOffset()
{
    return 2;
}
int __IndexOf_CurLocalTime()
{
    return 3;
}
int __IndexOf_NextBeginActionIndex()
{
    return 4;
}
int __IndexOf_NextEndActionIndexInEndOrderList()
{
    return 5;
}
int __IndexOf_NextActionBeginTime()
{
    return 6;
}
int __IndexOf_NextActionEndTime()
{
    return 7;
}
int __IndexOf_ContextPosition()
{
    return 8;
}
int __IndexOf_ContextRotation()
{
    return 9;
}
int __IndexOf_ContextEntity()
{
    return 10;
}
int __IndexOf_ActiveActionIndexes()
{
    return 11;
}
int __IndexOf_RelativeDatas()
{
    return 12;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProjectileTimelineController &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProjectileTimelineController &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProjectileTimelineController &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProjectileTimelineController
{
int __IndexOf_CurStateConfigTimelineIndex()
{
    return 0;
}
int __IndexOf_WorldTimeOffset()
{
    return 1;
}
int __IndexOf_NextTickTime()
{
    return 2;
}
int __IndexOf_LastTickTime()
{
    return 3;
}
int __IndexOf_TimelineInfos()
{
    return 4;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FProjectileTimelineEventContext &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FProjectileTimelineEventContext &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FProjectileTimelineEventContext
{
int __IndexOf_TimelineConfigIndex()
{
    return 0;
}
int __IndexOf_WorldTime()
{
    return 1;
}
int __IndexOf_ContextEntity()
{
    return 2;
}
int __IndexOf_ContextPosition()
{
    return 3;
}
int __IndexOf_ContextRotation()
{
    return 4;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProjectileTimelineChange &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProjectileTimelineChange &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProjectileTimelineChange &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProjectileTimelineChange
{
int __IndexOf_NextStateTimelineIndex()
{
    return 0;
}
int __IndexOf_NextStateStartWorldTime()
{
    return 1;
}
int __IndexOf_PendingActivateTimelineContext()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ProjectileTimelineComponentReplaceSync &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ProjectileTimelineComponentReplaceSync &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ProjectileTimelineComponentReplaceSync &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ProjectileTimelineComponentReplaceSync
{
int __IndexOf_Data()
{
    return 0;
}
}


enum EVaultActionType
{
    None,
    Upstairs,
    VaultOver,
    WallRun,
    WallBounce,
    LeapOff,
}

enum EVaultStartState
{
    OnGround,
    OnGroundSprint,
    OnWall,
    InAir,
}

namespace FC_CharacterVaultInfoCache
{
    const int YAW_BUFFER_SIZE = 30;
    const int MAX_SKIP_FRAMES = 10;
}
namespace __INTENRAL_FC_CharacterVaultInfoCache_NS
{
    const TECSComponentDerivedPtr<FC_CharacterVaultInfoCache> DerivedPtr = TECSComponentDerivedPtr<FC_CharacterVaultInfoCache>();
    const FC_CharacterVaultInfoCache DefaultValue = FC_CharacterVaultInfoCache();
}
namespace __INTENRAL_FC_VaultingQueryCache_NS
{
    const TECSComponentDerivedPtr<FC_VaultingQueryCache> DerivedPtr = TECSComponentDerivedPtr<FC_VaultingQueryCache>();
    const FC_VaultingQueryCache DefaultValue = FC_VaultingQueryCache();
}
namespace __INTENRAL_FC_MountVaultInfo_NS
{
    const TECSComponentDerivedPtr<FC_MountVaultInfo> DerivedPtr = TECSComponentDerivedPtr<FC_MountVaultInfo>();
    const FC_MountVaultInfo DefaultValue = FC_MountVaultInfo();
}
namespace __INTENRAL_FC_CharacterVaulting_NS
{
    const TECSComponentDerivedPtr<FC_CharacterVaulting> DerivedPtr = TECSComponentDerivedPtr<FC_CharacterVaulting>();
    const FC_CharacterVaulting DefaultValue = FC_CharacterVaulting();
}
namespace __INTENRAL_FCE_VaultRequest_NS
{
    const TECSEventDerivedPtr<FCE_VaultRequest> DerivedPtr = TECSEventDerivedPtr<FCE_VaultRequest>();

}
struct FVaultingConfigOverride
{
    UPROPERTY()
    int EnableWallRunCnt = 0;
    UPROPERTY()
    int EnableMoveUpstairsCnt = 0;
    UPROPERTY()
    int EnableVaultOverCnt = 0;
    UPROPERTY()
    int EnableReachUpCnt = 0;


}

struct FVaultPathPoint
{
    UPROPERTY()
    float32 CollisionRadiusRatio = 1.0f;
    UPROPERTY()
    float32 CollisionHeightRatio = 1.0f;
    UPROPERTY()
    FVector3f PositionOffset = FVector3f::ZeroVector;
    UPROPERTY()
    FVector3f Normal = FVector3f::UpVector;


}

struct FVaultPath
{
    UPROPERTY()
    EVaultActionType VaultActionType = EVaultActionType(0);
    UPROPERTY()
    EVaultStartState VaultStartState = EVaultStartState(0);
    UPROPERTY()
    int VaultActionIndex = 0;
    UPROPERTY()
    FVector Start;
    UPROPERTY()
    FQuat Rotation;
    UPROPERTY()
    TArray<FVaultPathPoint> PathPoints;
    UPROPERTY()
    bool bNoProbeCD = false;


    int GetPointsNum() const property
    {
        return this.PathPoints.Num();
    }
    FVector GetPosition(const int Index) const
    {
        if (Index >= 0)
        {
            if (this.GetPointsNum() > Index)
            {
                return (this.Start + FVector(this.PathPoints[Index].PositionOffset));
            }
        }
        else
        {
            if ((this.GetPointsNum() + Index) >= 0)
            {
                return (this.Start + (FVector(this.PathPoints[(this.GetPointsNum() + Index)].PositionOffset)));
            }
        }
        return FVector::ZeroVector;
    }
    FVector3f GetPositionOffset(const int Index) const
    {
        if (this.GetPointsNum() > Index)
        {
            return this.PathPoints[Index].PositionOffset;
        }
        return FVector3f::ZeroVector;
    }
    FVector3f GetNormal(const int Index) const
    {
        if (this.GetPointsNum() > Index)
        {
            return this.PathPoints[Index].Normal;
        }
        return FVector3f::UpVector;
    }
}

struct FWallRunInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector m_StartPos;
    UPROPERTY()
    float32 m_AttemptHeight;
    UPROPERTY()
    bool m_bInAttemptCoolDown;

    FWallRunInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FWallRunInfo(const FWallRunInfo &inout Other)
    {
        this.m_AttemptHeight = 0.0f;
        this.m_bInAttemptCoolDown = false;
        this.m_StartPos = Other.m_StartPos;
        this.m_AttemptHeight = Other.m_AttemptHeight;
        this.m_bInAttemptCoolDown = Other.m_bInAttemptCoolDown;
        return;
    }
    FWallRunInfo opAssign(const FWallRunInfo &inout Other)
    {
        FWallRunInfo __r;
        this.SetStartPos(Other.GetStartPos());
        this.SetAttemptHeight(Other.GetAttemptHeight());
        this.SetbInAttemptCoolDown(Other.GetbInAttemptCoolDown());
        return __r;
    }
    float GetWallRunMaxZ() const property
    {
        return (this.GetStartPos().Z + this.GetAttemptHeight());
    }
    const FVector GetStartPos() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_StartPos() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetStartPos(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_StartPos = __Value;
        return;
    }
    float32 GetAttemptHeight() const property
    {
        return this.m_AttemptHeight;
    }
    void SetAttemptHeight(const float32 __Value) property
    {
        if (this.m_AttemptHeight == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_AttemptHeight = __Value;
        return;
    }
    bool GetbInAttemptCoolDown() const property
    {
        return this.m_bInAttemptCoolDown;
    }
    void SetbInAttemptCoolDown(const bool __Value) property
    {
        if (!(this.m_bInAttemptCoolDown) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bInAttemptCoolDown = __Value;
        return;
    }
}

struct FCE_VaultRequest : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FVaultPath ProbPath;
    UPROPERTY()
    EVaultActionType EnsureVaultActionType = EVaultActionType(0);
    UPROPERTY()
    bool bIsDualAction = false;


    bool IsCancelRequest() const
    {
        return (int(this.ProbPath.VaultActionType) == 0);
    }
}

struct FSimpleFloatBuffer
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<float32> m_Buffer;
    UPROPERTY()
    int m_Num;
    UPROPERTY()
    int m_Head;

    FSimpleFloatBuffer()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSimpleFloatBuffer(const FSimpleFloatBuffer &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSimpleFloatBuffer(const int MaxSize)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSimpleFloatBuffer opAssign(const FSimpleFloatBuffer &inout Other)
    {
        FSimpleFloatBuffer __r;
        this.SetBuffer(Other.GetBuffer());
        this.SetNum(Other.GetNum());
        this.SetHead(Other.GetHead());
        return __r;
    }
    float32 Get(const int Index) const
    {
        return this.GetBuffer()[this.IndexOf(Index)];
    }
    int IndexOf(const int Index) const
    {
        return ((this.GetHead() + Index) % this.GetBuffer().Num());
    }
    void EnsureMaxSize(const int MaxSize)
    {
        int local_2 = this.GetBuffer().Num();
        if (MaxSize <= local_2)
        {
            return;
        }
        this.GetModify_Buffer().SetNum(MaxSize);
        if (local_2 > 0)
        {
            int local_5 = local_2 - this.GetHead();
            for (; local_5 < local_2; )
            {
                int local_6 = int(this.GetBuffer()[((this.GetHead() + local_5) % local_2)]);
                int local_4 = this.GetHead();
                local_4 = local_4 + local_5;
                local_4 = local_4 % MaxSize;
                this.GetModify_Buffer()[local_4] = local_6;
                ++local_5;
            }
        }
        return;
    }
    void Push(const float32 Value)
    {
        if (this.GetNum() == this.GetBuffer().Num())
        {
            this.GetModify_Buffer()[this.GetHead()] = Value;
            this.SetHead(this.IndexOf(1));
            return;
        }
        this.GetModify_Buffer()[this.IndexOf(this.GetNum())] = Value;
        this.SetNum((this.GetNum() + 1));
        return;
    }
    void Clear()
    {
        this.SetNum(0);
        this.SetHead(0);
        return;
    }
    const TArray<float32> GetBuffer() const property
    {
        const TArray<float32> __r;
        return __r;
    }
    TArray<float32> GetModify_Buffer() property
    {
        TArray<float32> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetBuffer(const TArray<float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Buffer = __Value;
        return;
    }
    int GetNum() const property
    {
        return this.m_Num;
    }
    void SetNum(const int __Value) property
    {
        if (this.m_Num == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Num = __Value;
        return;
    }
    int GetHead() const property
    {
        return this.m_Head;
    }
    void SetHead(const int __Value) property
    {
        if (this.m_Head == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Head = __Value;
        return;
    }
}

struct FC_CharacterVaultInfoCache : FECSComponent
{
    UPROPERTY()
    FSimpleFloatBuffer SteerYawBuffer;
    UPROPERTY()
    int LastSteerFrame = -1;
    UPROPERTY()
    FFPTime LastProbeTime = -1;
    UPROPERTY()
    int LastEnableMask = 0;


    void PushSteerYaw(const float32 SteerYaw, const int Frame)
    {
        if (this.LastSteerFrame < 0)
        {
            this.LastSteerFrame = (Frame - 1);
        }
        else
        {
            if ((Frame - this.LastSteerFrame) > 10)
            {
                this.LastSteerFrame = (Frame - 1);
            }
        }
        for (; this.LastSteerFrame < Frame; )
        {
            this.Push(SteerYaw);
            this.LastSteerFrame += 1;
        }
        return;
    }
    void ClearSteerYaw()
    {
        this.LastSteerFrame = -1;
        return;
    }
    bool IsSteerYawBufferEnough(const int Frames) const
    {
        return (Frames <= this.GetNum());
    }
    bool CheckSteerYawDiff(const float32 RefYaw, const float32 MaxDiff, const int Frames) const
    {
        float32 local_7 = 0.0f;
        if (Frames > this.GetNum())
        {
            return false;
        }
        int local_3 = 0;
        for (; local_3 < Frames; ++local_3)
        {
            int local_6 = (this.GetNum() - 1) - local_3;
            if (FMath::Abs(FMath::FindDeltaAngleRadians(local_7, RefYaw)) > MaxDiff)
            {
                return false;
            }
        }
        return true;
    }
}

struct FC_VaultingQueryCache : FECSComponent
{
    UPROPERTY()
    FSceneQueryCache Cache;

    FC_VaultingQueryCache()
    {
        return;
    }
}

struct FC_MountVaultInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_OffsetVer0;

    FC_MountVaultInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_MountVaultInfo(const FC_MountVaultInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_MountVaultInfo opAssign(const FC_MountVaultInfo &inout Other)
    {
        FC_MountVaultInfo __r;
        this.SetOffsetVer0(Other.GetOffsetVer0());
        return __r;
    }
    float32 GetOffsetVer0() const property
    {
        return this.m_OffsetVer0;
    }
    void SetOffsetVer0(const float32 __Value) property
    {
        if (this.m_OffsetVer0 == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_OffsetVer0 = __Value;
        return;
    }
}

struct FC_CharacterVaulting : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FVaultPath m_ProbPath;
    UPROPERTY()
    FVaultPath m_DualProbPath;
    UPROPERTY()
    FFPTime m_LastRequestTime;
    UPROPERTY()
    FFPTime m_ClearInfoTime;
    UPROPERTY()
    bool m_bIsVaultingOver;
    UPROPERTY()
    bool m_bIsMovingUpstairs;
    UPROPERTY()
    bool m_bEnableDualUpstairs;
    UPROPERTY()
    bool m_bIsStartingWallRun;
    UPROPERTY()
    FWallRunInfo m_WallRunInfo;
    UPROPERTY()
    FVaultingConfigOverride m_ConfigOverride;

    FC_CharacterVaulting()
    {
        this.m_LastRequestTime = -1;
        this.m_ClearInfoTime = -1;
        this.m_bIsVaultingOver = false;
        this.m_bIsMovingUpstairs = false;
        this.m_bEnableDualUpstairs = false;
        this.m_bIsStartingWallRun = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_CharacterVaulting(const FC_CharacterVaulting &inout Other)
    {
        this.m_LastRequestTime = -1;
        this.m_ClearInfoTime = -1;
        this.m_bIsVaultingOver = false;
        this.m_bIsMovingUpstairs = false;
        this.m_bEnableDualUpstairs = false;
        this.m_bIsStartingWallRun = false;
        this.__InitDirtyFlags();
        this.m_LastRequestTime = Other.m_LastRequestTime;
        this.m_ClearInfoTime = Other.m_ClearInfoTime;
        this.m_bIsVaultingOver = Other.m_bIsVaultingOver;
        this.m_bIsMovingUpstairs = Other.m_bIsMovingUpstairs;
        this.m_bEnableDualUpstairs = Other.m_bEnableDualUpstairs;
        this.m_bIsStartingWallRun = Other.m_bIsStartingWallRun;
        this.m_WallRunInfo = Other.m_WallRunInfo;
        this.m_ConfigOverride = Other.m_ConfigOverride;
        return;
    }
    FC_CharacterVaulting opAssign(const FC_CharacterVaulting &inout Other)
    {
        FC_CharacterVaulting __r;
        this.SetProbPath(Other.GetProbPath());
        this.SetDualProbPath(Other.GetDualProbPath());
        this.SetLastRequestTime(Other.GetLastRequestTime());
        this.SetClearInfoTime(Other.GetClearInfoTime());
        this.SetbIsVaultingOver(Other.GetbIsVaultingOver());
        this.SetbIsMovingUpstairs(Other.GetbIsMovingUpstairs());
        this.SetbEnableDualUpstairs(Other.GetbEnableDualUpstairs());
        this.SetbIsStartingWallRun(Other.GetbIsStartingWallRun());
        this.SetWallRunInfo(Other.GetWallRunInfo());
        this.SetConfigOverride(Other.GetConfigOverride());
        return __r;
    }
    EVaultActionType VaultActionType() const
    {
        return this.GetProbPath().VaultActionType;
    }
    bool ActionIsMoveUpstairsOrVaultOver() const
    {
        return int(this.GetProbPath().VaultActionType) == 1 || (int(this.GetProbPath().VaultActionType) == 2);
    }
    EVaultActionType VaultDualActionType() const
    {
        return this.GetDualProbPath().VaultActionType;
    }
    EVaultStartState VaultStartState() const
    {
        return this.GetProbPath().VaultStartState;
    }
    EVaultStartState VaultDualStartState() const
    {
        return this.GetDualProbPath().VaultStartState;
    }
    int VaultActionIndex() const
    {
        return this.GetProbPath().VaultActionIndex;
    }
    int VaultDualActionIndex() const
    {
        return this.GetDualProbPath().VaultActionIndex;
    }
    FVector Location0() const
    {
        return this.GetProbPath().GetPosition(0);
    }
    FVector Location1() const
    {
        return this.GetProbPath().GetPosition(1);
    }
    FVector Location2() const
    {
        return this.GetProbPath().GetPosition(2);
    }
    FVector3f Normal0() const
    {
        return this.GetProbPath().GetNormal(0);
    }
    float32 OffsetHor0() const
    {
        return this.GetProbPath().GetPositionOffset(0).Size2D();
    }
    float32 OffsetVer0() const
    {
        return this.GetProbPath().GetPositionOffset(0).Z;
    }
    void OnWallRunning(const FC_CharacterVaultingConfig &inout VaultingConfig)
    {
        float32 local_29 = 0.0f;
        bool local_2 = this.GetEnableStableWallRun(VaultingConfig);
        if ((local_2 || !(this.GetWallRunInfo().GetbInAttemptCoolDown())))
        {
            this.GetWallRunInfo().SetStartPos(this.GetProbPath().Start);
        }
        if (!(this.GetWallRunInfo().GetbInAttemptCoolDown()))
        {
            if (VaultingConfig.IsValidState(EVaultStartState(this.GetProbPath().VaultStartState)))
            {
                TDataObjectPtr<FCharacterVaultProbeConfig> local_28 = VaultingConfig.GetVaultProbeConfig(EVaultStartState(this.GetProbPath().VaultStartState));
                this.GetWallRunInfo().SetAttemptHeight(local_29);
            }
            else
            {
                this.GetWallRunInfo().SetAttemptHeight(0.0f);
            }
        }
        this.GetWallRunInfo().SetbInAttemptCoolDown(true);
        return;
    }
    void OnWallRunLanded()
    {
        this.GetWallRunInfo().SetbInAttemptCoolDown(false);
        return;
    }
    bool GetEnableAttemptWallRun(const FC_CharacterVaultingConfig &inout VaultingConfig) const
    {
        if (!(VaultingConfig.bCanWallRun))
        {
            return false;
        }
        return ::Vaulting::GetEnableAttemptWallRunByDefault();
    }
    bool GetEnableStableWallRun(const FC_CharacterVaultingConfig &inout VaultingConfig) const
    {
        int local_4;
        int local_6;
        if (!(VaultingConfig.bCanWallRun))
        {
            return false;
        }
        int local_3 = this.GetConfigOverride().EnableWallRunCnt;
        int local_2 = local_3;
        if (local_2 == 0)
        {
            if (!(::Vaulting::GetEnableWallRunByDefault()))
            {
                local_4 = 0;
            }
            else
            {
                local_4 = VaultingConfig.bEnableWallRunByDefault;
            }
            local_6 = local_4;
        }
        else
        {
            bool local_5 = (local_2 > 0);
            local_6 = local_5;
        }
        return (local_6 != 0);
    }
    bool GetEnableMoveUpstairs(const FC_CharacterVaultingConfig &inout VaultingConfig) const
    {
        int local_7;
        if (::Vaulting::GetNeedCheckEnableReachUp() && ((this.GetConfigOverride().EnableReachUpCnt <= 0)))
        {
            return false;
        }
        if (!(VaultingConfig.bCanMoveUpstairs))
        {
            return false;
        }
        int local_5 = this.GetConfigOverride().EnableMoveUpstairsCnt;
        if (local_5 == 0)
        {
            local_7 = (::Vaulting::GetEnableMoveUpstairsByDefault() && VaultingConfig.bEnableMoveUpstairsByDefaut);
        }
        else
        {
            bool local_6 = (local_5 > 0);
            local_7 = local_6;
        }
        return (local_7 != 0);
    }
    bool GetEnableVaultOver(const FC_CharacterVaultingConfig &inout VaultingConfig) const
    {
        int local_7;
        if (::Vaulting::GetNeedCheckEnableReachUp() && ((this.GetConfigOverride().EnableReachUpCnt <= 0)))
        {
            return false;
        }
        if (!(VaultingConfig.bCanVaultOver))
        {
            return false;
        }
        int local_5 = this.GetConfigOverride().EnableVaultOverCnt;
        if (local_5 == 0)
        {
            local_7 = (::Vaulting::GetEnableVaultOverByDefault() && VaultingConfig.bEnableVaultOverByDefault);
        }
        else
        {
            bool local_6 = (local_5 > 0);
            local_7 = local_6;
        }
        return (local_7 != 0);
    }
    void ClearVaultAction()
    {
        FVaultPath local_24;
        this.SetProbPath(local_24);
        this.SetClearInfoTime(FFPTime(-1));
        return;
    }
    void OverrideEnableWallRun(const bool bEnabled)
    {
        int local_1 = bEnabled ? 1 : -1;
        this.GetModify_ConfigOverride().EnableWallRunCnt = (this.GetModify_ConfigOverride().EnableWallRunCnt + local_1);
        return;
    }
    void OverrideEnableMoveUpstairs(const bool bEnabled)
    {
        int local_1 = bEnabled ? 1 : -1;
        this.GetModify_ConfigOverride().EnableMoveUpstairsCnt = (this.GetModify_ConfigOverride().EnableMoveUpstairsCnt + local_1);
        return;
    }
    void OverrideEnableVaultOver(const bool bEnabled)
    {
        int local_1 = bEnabled ? 1 : -1;
        this.GetModify_ConfigOverride().EnableVaultOverCnt = (this.GetModify_ConfigOverride().EnableVaultOverCnt + local_1);
        return;
    }
    void SetEnableReachUp(const bool bEnabled)
    {
        int local_1 = bEnabled ? 1 : -1;
        this.GetModify_ConfigOverride().EnableReachUpCnt = (this.GetModify_ConfigOverride().EnableReachUpCnt + local_1);
        return;
    }
    const FVaultPath GetProbPath() const property
    {
        const FVaultPath __r;
        return __r;
    }
    FVaultPath GetModify_ProbPath() property
    {
        FVaultPath __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetProbPath(const FVaultPath &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        return;
    }
    const FVaultPath GetDualProbPath() const property
    {
        const FVaultPath __r;
        return __r;
    }
    FVaultPath GetModify_DualProbPath() property
    {
        FVaultPath __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetDualProbPath(const FVaultPath &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        return;
    }
    const FFPTime GetLastRequestTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_LastRequestTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetLastRequestTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LastRequestTime = __Value;
        return;
    }
    const FFPTime GetClearInfoTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_ClearInfoTime() property
    {
        FFPTime __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetClearInfoTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ClearInfoTime = __Value;
        return;
    }
    bool GetbIsVaultingOver() const property
    {
        return this.m_bIsVaultingOver;
    }
    void SetbIsVaultingOver(const bool __Value) property
    {
        if (!(this.m_bIsVaultingOver) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bIsVaultingOver = __Value;
        return;
    }
    bool GetbIsMovingUpstairs() const property
    {
        return this.m_bIsMovingUpstairs;
    }
    void SetbIsMovingUpstairs(const bool __Value) property
    {
        if (!(this.m_bIsMovingUpstairs) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bIsMovingUpstairs = __Value;
        return;
    }
    bool GetbEnableDualUpstairs() const property
    {
        return this.m_bEnableDualUpstairs;
    }
    void SetbEnableDualUpstairs(const bool __Value) property
    {
        if (!(this.m_bEnableDualUpstairs) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_bEnableDualUpstairs = __Value;
        return;
    }
    bool GetbIsStartingWallRun() const property
    {
        return this.m_bIsStartingWallRun;
    }
    void SetbIsStartingWallRun(const bool __Value) property
    {
        if (!(this.m_bIsStartingWallRun) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_bIsStartingWallRun = __Value;
        return;
    }
    const FWallRunInfo GetWallRunInfo() const property
    {
        const FWallRunInfo __r;
        return __r;
    }
    FWallRunInfo GetWallRunInfo() property
    {
        FWallRunInfo __r;
        return __r;
    }
    void SetWallRunInfo(const FWallRunInfo &inout __Value) property
    {
        this.m_WallRunInfo = __Value;
        return;
    }
    const FVaultingConfigOverride GetConfigOverride() const property
    {
        const FVaultingConfigOverride __r;
        return __r;
    }
    FVaultingConfigOverride GetModify_ConfigOverride() property
    {
        FVaultingConfigOverride __r;
        this.__MarkDirty(11);
        return __r;
    }
    void SetConfigOverride(const FVaultingConfigOverride &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_ConfigOverride = __Value;
        return;
    }
}

namespace ECSFunc_FC_CharacterVaultInfoCache
{
UFUNCTION()
bool HasCharacterVaultInfoCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaultInfoCache);
}
FC_CharacterVaultInfoCache& AssignCharacterVaultInfoCache(const FECSEntity &inout Entity, const FC_CharacterVaultInfoCache &inout DefaultValue = FC_CharacterVaultInfoCache())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaultInfoCache, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCharacterVaultInfoCache_BP(const FECSEntity &inout Entity, const FC_CharacterVaultInfoCache &inout DefaultValue = FC_CharacterVaultInfoCache())
{
    ECSFunc_FC_CharacterVaultInfoCache::AssignCharacterVaultInfoCache(Entity, DefaultValue);
    return;
}
FC_CharacterVaultInfoCache& ModifyCharacterVaultInfoCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaultInfoCache));
    return local_12.GetComp();
}
FC_CharacterVaultInfoCache& ModifyOrAddCharacterVaultInfoCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaultInfoCache));
    return local_12.GetComp();
}
const FC_CharacterVaultInfoCache& GetCharacterVaultInfoCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaultInfoCache));
    return local_12.GetComp();
}
UFUNCTION()
FC_CharacterVaultInfoCache GetCharacterVaultInfoCache_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CharacterVaultInfoCache __r;
    bValid = false;
    bValid = ECSFunc_FC_CharacterVaultInfoCache::GetCharacterVaultInfoCache(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CharacterVaultInfoCache GetDefaultedCharacterVaultInfoCache(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CharacterVaultInfoCache __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaultInfoCache);
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
FC_CharacterVaultInfoCache GetDefaultedCharacterVaultInfoCache_BP(const FECSEntity &inout Entity)
{
    FC_CharacterVaultInfoCache __r;
    return __r;
}
UFUNCTION()
bool RemoveCharacterVaultInfoCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaultInfoCache);
}
}
FECSMonitorRuntimeView __GetMonitorCharacterVaultInfoCacheOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CharacterVaultInfoCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterVaultInfoCacheOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CharacterVaultInfoCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterVaultInfoCacheOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CharacterVaultInfoCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterVaultInfoCacheOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CharacterVaultInfoCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterVaultInfoCacheOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CharacterVaultInfoCache, bFixedFrame, bMustHandleAll);
}
void __MonitorCharacterVaultInfoCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CharacterVaultInfoCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterVaultInfoCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CharacterVaultInfoCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterVaultInfoCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CharacterVaultInfoCache, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_VaultingQueryCache
{
UFUNCTION()
bool HasVaultingQueryCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_VaultingQueryCache);
}
FC_VaultingQueryCache& AssignVaultingQueryCache(const FECSEntity &inout Entity, const FC_VaultingQueryCache &inout DefaultValue = FC_VaultingQueryCache())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_VaultingQueryCache, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignVaultingQueryCache_BP(const FECSEntity &inout Entity, const FC_VaultingQueryCache &inout DefaultValue = FC_VaultingQueryCache())
{
    ECSFunc_FC_VaultingQueryCache::AssignVaultingQueryCache(Entity, DefaultValue);
    return;
}
FC_VaultingQueryCache& ModifyVaultingQueryCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_VaultingQueryCache));
    return local_12.GetComp();
}
FC_VaultingQueryCache& ModifyOrAddVaultingQueryCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_VaultingQueryCache));
    return local_12.GetComp();
}
const FC_VaultingQueryCache& GetVaultingQueryCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_VaultingQueryCache));
    return local_12.GetComp();
}
UFUNCTION()
FC_VaultingQueryCache GetVaultingQueryCache_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_VaultingQueryCache __r;
    bValid = false;
    bValid = ECSFunc_FC_VaultingQueryCache::GetVaultingQueryCache(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_VaultingQueryCache GetDefaultedVaultingQueryCache(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_VaultingQueryCache __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_VaultingQueryCache);
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
FC_VaultingQueryCache GetDefaultedVaultingQueryCache_BP(const FECSEntity &inout Entity)
{
    FC_VaultingQueryCache __r;
    return __r;
}
UFUNCTION()
bool RemoveVaultingQueryCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_VaultingQueryCache);
}
}
FECSMonitorRuntimeView __GetMonitorVaultingQueryCacheOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_VaultingQueryCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVaultingQueryCacheOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_VaultingQueryCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVaultingQueryCacheOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_VaultingQueryCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVaultingQueryCacheOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_VaultingQueryCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorVaultingQueryCacheOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_VaultingQueryCache, bFixedFrame, bMustHandleAll);
}
void __MonitorVaultingQueryCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_VaultingQueryCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorVaultingQueryCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_VaultingQueryCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorVaultingQueryCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_VaultingQueryCache, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MountVaultInfo
{
UFUNCTION()
bool HasMountVaultInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MountVaultInfo);
}
FC_MountVaultInfo& AssignMountVaultInfo(const FECSEntity &inout Entity, const FC_MountVaultInfo &inout DefaultValue = FC_MountVaultInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MountVaultInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMountVaultInfo_BP(const FECSEntity &inout Entity, const FC_MountVaultInfo &inout DefaultValue = FC_MountVaultInfo())
{
    ECSFunc_FC_MountVaultInfo::AssignMountVaultInfo(Entity, DefaultValue);
    return;
}
FC_MountVaultInfo& ModifyMountVaultInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MountVaultInfo));
    return local_12.GetComp();
}
FC_MountVaultInfo& ModifyOrAddMountVaultInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MountVaultInfo));
    return local_12.GetComp();
}
const FC_MountVaultInfo& GetMountVaultInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MountVaultInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_MountVaultInfo GetMountVaultInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MountVaultInfo& local_4 = ECSFunc_FC_MountVaultInfo::GetMountVaultInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MountVaultInfo();
}
const FC_MountVaultInfo GetDefaultedMountVaultInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MountVaultInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MountVaultInfo);
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
FC_MountVaultInfo GetDefaultedMountVaultInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MountVaultInfo::GetDefaultedMountVaultInfo(Entity);
}
UFUNCTION()
bool RemoveMountVaultInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MountVaultInfo);
}
}
FECSMonitorRuntimeView __GetMonitorMountVaultInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MountVaultInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountVaultInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MountVaultInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountVaultInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MountVaultInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountVaultInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MountVaultInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMountVaultInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MountVaultInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorMountVaultInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MountVaultInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountVaultInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MountVaultInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMountVaultInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MountVaultInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CharacterVaulting
{
UFUNCTION()
bool HasCharacterVaulting(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaulting);
}
FC_CharacterVaulting& AssignCharacterVaulting(const FECSEntity &inout Entity, const FC_CharacterVaulting &inout DefaultValue = FC_CharacterVaulting())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaulting, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCharacterVaulting_BP(const FECSEntity &inout Entity, const FC_CharacterVaulting &inout DefaultValue = FC_CharacterVaulting())
{
    ECSFunc_FC_CharacterVaulting::AssignCharacterVaulting(Entity, DefaultValue);
    return;
}
FC_CharacterVaulting& ModifyCharacterVaulting(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaulting));
    return local_12.GetComp();
}
FC_CharacterVaulting& ModifyOrAddCharacterVaulting(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaulting));
    return local_12.GetComp();
}
const FC_CharacterVaulting& GetCharacterVaulting(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaulting));
    return local_12.GetComp();
}
UFUNCTION()
FC_CharacterVaulting GetCharacterVaulting_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CharacterVaulting& local_4 = ECSFunc_FC_CharacterVaulting::GetCharacterVaulting(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CharacterVaulting();
}
const FC_CharacterVaulting GetDefaultedCharacterVaulting(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CharacterVaulting __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaulting);
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
FC_CharacterVaulting GetDefaultedCharacterVaulting_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CharacterVaulting::GetDefaultedCharacterVaulting(Entity);
}
UFUNCTION()
bool RemoveCharacterVaulting(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaulting);
}
}
FECSMonitorRuntimeView __GetMonitorCharacterVaultingOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CharacterVaulting, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterVaultingOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CharacterVaulting, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterVaultingOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CharacterVaulting, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterVaultingOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CharacterVaulting, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterVaultingOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CharacterVaulting, bFixedFrame, bMustHandleAll);
}
void __MonitorCharacterVaultingLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CharacterVaulting, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterVaultingActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CharacterVaulting, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterVaultingModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CharacterVaulting, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_MountVaultInfo_OffsetVer0(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetOffsetVer0();
    return;
}
void GetEntityBBVar_CharacterVaulting_VaultActionType(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().VaultActionType()) != 0);
    return;
}
void GetEntityBBVar_CharacterVaulting_ActionIsMoveUpstairsOrVaultOver(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().ActionIsMoveUpstairsOrVaultOver();
    return;
}
void GetEntityBBVar_CharacterVaulting_VaultDualActionType(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().VaultDualActionType()) != 0);
    return;
}
void GetEntityBBVar_CharacterVaulting_VaultStartState(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().VaultStartState()) != 0);
    return;
}
void GetEntityBBVar_CharacterVaulting_VaultDualStartState(const FECSEntity &inout Entity, uint8 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = (int(local_4.opCall().VaultDualStartState()) != 0);
    return;
}
void GetEntityBBVar_CharacterVaulting_VaultActionIndex(const FECSEntity &inout Entity, int &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().VaultActionIndex();
    return;
}
void GetEntityBBVar_CharacterVaulting_VaultDualActionIndex(const FECSEntity &inout Entity, int &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().VaultDualActionIndex();
    return;
}
void GetEntityBBVar_CharacterVaulting_Location0(const FECSEntity &inout Entity, FVector &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FVector(local_4.opCall().Location0());
    return;
}
void GetEntityBBVar_CharacterVaulting_Location1(const FECSEntity &inout Entity, FVector &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FVector(local_4.opCall().Location1());
    return;
}
void GetEntityBBVar_CharacterVaulting_Location2(const FECSEntity &inout Entity, FVector &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FVector(local_4.opCall().Location2());
    return;
}
void GetEntityBBVar_CharacterVaulting_Normal0(const FECSEntity &inout Entity, FVector3f &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FVector3f(local_4.opCall().Normal0());
    return;
}
void GetEntityBBVar_CharacterVaulting_OffsetHor0(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().OffsetHor0();
    return;
}
void GetEntityBBVar_CharacterVaulting_OffsetVer0(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().OffsetVer0();
    return;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FWallRunInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FWallRunInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FWallRunInfo
{
int __IndexOf_StartPos()
{
    return 0;
}
int __IndexOf_AttemptHeight()
{
    return 1;
}
int __IndexOf_bInAttemptCoolDown()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FSimpleFloatBuffer &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FSimpleFloatBuffer &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FSimpleFloatBuffer
{
int __IndexOf_Buffer()
{
    return 0;
}
int __IndexOf_Num()
{
    return 1;
}
int __IndexOf_Head()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MountVaultInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MountVaultInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MountVaultInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MountVaultInfo
{
int __IndexOf_OffsetVer0()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_CharacterVaulting &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_CharacterVaulting &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CharacterVaulting &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CharacterVaulting
{
int __IndexOf_ProbPath()
{
    return 0;
}
int __IndexOf_DualProbPath()
{
    return 1;
}
int __IndexOf_LastRequestTime()
{
    return 2;
}
int __IndexOf_ClearInfoTime()
{
    return 3;
}
int __IndexOf_bIsVaultingOver()
{
    return 4;
}
int __IndexOf_bIsMovingUpstairs()
{
    return 5;
}
int __IndexOf_bEnableDualUpstairs()
{
    return 6;
}
int __IndexOf_bIsStartingWallRun()
{
    return 7;
}
int __IndexOf_WallRunInfo()
{
    return 8;
}
int __IndexOf_ConfigOverride()
{
    return 11;
}
}


enum EHitStateESMTransitType
{
    LieDown,
    AirBorneNoHit,
    AirBorneHit,
    AirStateHit,
    Ground,
}


struct FHitLevelESMTransitInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_ESMTransitName = NAME_None;
    UPROPERTY()
    float32 m_StrikeRatio = 1.0f;
    UPROPERTY()
    bool m_bOverrideStrikeX = false;
    UPROPERTY()
    float32 m_OverrideStrikeX = 1.0f;
    UPROPERTY()
    bool m_bOverrideStrikeZ = false;
    UPROPERTY()
    float32 m_OverrideStrikeZ = 1.0f;

    FHitLevelESMTransitInfo(const FHitLevelESMTransitInfo &inout Other)
    {
        this.m_ESMTransitName = Other.m_ESMTransitName;
        this.m_StrikeRatio = Other.m_StrikeRatio;
        this.m_bOverrideStrikeX = Other.m_bOverrideStrikeX;
        this.m_OverrideStrikeX = Other.m_OverrideStrikeX;
        this.m_bOverrideStrikeZ = Other.m_bOverrideStrikeZ;
        this.m_OverrideStrikeZ = Other.m_OverrideStrikeZ;
        return;
    }
    FHitLevelESMTransitInfo(const FName &inout Name)
    {
        this.SetESMTransitName(Name);
        return;
    }
    FHitLevelESMTransitInfo(const FName &inout Name, const float32 Ratio)
    {
        this.SetESMTransitName(Name);
        this.SetStrikeRatio(Ratio);
        return;
    }
    FHitLevelESMTransitInfo opAssign(const FHitLevelESMTransitInfo &inout Other)
    {
        FHitLevelESMTransitInfo __r;
        this.SetESMTransitName(Other.GetESMTransitName());
        this.SetStrikeRatio(Other.GetStrikeRatio());
        this.SetbOverrideStrikeX(Other.GetbOverrideStrikeX());
        this.SetOverrideStrikeX(Other.GetOverrideStrikeX());
        this.SetbOverrideStrikeZ(Other.GetbOverrideStrikeZ());
        this.SetOverrideStrikeZ(Other.GetOverrideStrikeZ());
        return __r;
    }
    FVector DisposeStrikePushBack(const FVector &inout StrikeImpactDir, const FVector &inout CurrentStrikePushBack, const float32 CurrentFlowHeight) const
    {
        FVector local_6 = CurrentStrikePushBack;
        local_6.Z = CurrentFlowHeight;
        if (this.GetbOverrideStrikeX())
        {
            FVector local_24 = (StrikeImpactDir * this.GetOverrideStrikeX());
            local_6.X = local_24.X;
            local_6.Y = local_24.Y;
        }
        if (this.GetbOverrideStrikeZ())
        {
            local_6.Z = (FVector(FVector::UpVector) * this.GetOverrideStrikeZ()).Z;
        }
        local_6 *= this.GetStrikeRatio();
        return local_6;
    }
    void Empty()
    {
        this.SetESMTransitName(NAME_None);
        this.SetStrikeRatio(1.0f);
        this.SetbOverrideStrikeX(false);
        this.SetbOverrideStrikeZ(false);
        return;
    }
    FName GetESMTransitName() const property
    {
        return this.m_ESMTransitName;
    }
    void SetESMTransitName(const FName &inout __Value) property
    {
        if ((this.m_ESMTransitName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ESMTransitName = __Value;
        return;
    }
    float32 GetStrikeRatio() const property
    {
        return this.m_StrikeRatio;
    }
    void SetStrikeRatio(const float32 __Value) property
    {
        if (this.m_StrikeRatio == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_StrikeRatio = __Value;
        return;
    }
    bool GetbOverrideStrikeX() const property
    {
        return this.m_bOverrideStrikeX;
    }
    void SetbOverrideStrikeX(const bool __Value) property
    {
        if (!(this.m_bOverrideStrikeX) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bOverrideStrikeX = __Value;
        return;
    }
    float32 GetOverrideStrikeX() const property
    {
        return this.m_OverrideStrikeX;
    }
    void SetOverrideStrikeX(const float32 __Value) property
    {
        if (this.m_OverrideStrikeX == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_OverrideStrikeX = __Value;
        return;
    }
    bool GetbOverrideStrikeZ() const property
    {
        return this.m_bOverrideStrikeZ;
    }
    void SetbOverrideStrikeZ(const bool __Value) property
    {
        if (!(this.m_bOverrideStrikeZ) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bOverrideStrikeZ = __Value;
        return;
    }
    float32 GetOverrideStrikeZ() const property
    {
        return this.m_OverrideStrikeZ;
    }
    void SetOverrideStrikeZ(const float32 __Value) property
    {
        if (this.m_OverrideStrikeZ == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_OverrideStrikeZ = __Value;
        return;
    }
}

struct FHitLevelESMTransits
{
    UPROPERTY()
    TMap<EAttackDataHitState, FHitLevelESMTransitInfo> HitLevelToESMTransitInfos;

    FHitLevelESMTransits()
    {
        return;
    }
}

struct FPrefabHitStateESMTransits
{
    UPROPERTY()
    TMap<EHitReactionPrefabBodyType, FHitLevelESMTransits> PrefabToESMTransits;

    FPrefabHitStateESMTransits()
    {
        return;
    }
}

struct FDamageTypeInfoConfig
{
    UPROPERTY()
    FText DamageName;
    UPROPERTY()
    FSoftBrush DamageIcon;
    UPROPERTY()
    FText DamageDescription;
    UPROPERTY()
    FAttributePresentation DamagePresentation;

    FDamageTypeInfoConfig()
    {
        return;
    }
}

struct FDamageTextDurationConfig
{
    UPROPERTY()
    float32 NormalDuration = 1.08f;
    UPROPERTY()
    float32 CriticalDuration = 1.08f;
    UPROPERTY()
    float32 WeaknessDuration = 1.08f;
    UPROPERTY()
    float32 WeaknessCriticalDuration = 1.08f;


}

class UDamageSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TMap<EDamageType, FDamageTextDurationConfig> DamageTextDurationConfigs;
    UPROPERTY()
    TMap<EDamageType, FDamageTypeInfoConfig> DamageTypeInfos;
    UPROPERTY()
    TMap<EHitStateESMTransitType, FPrefabHitStateESMTransits> ESMTransits;
    UPROPERTY()
    TMap<EAttackDataHitState, FGameplayTag> BanESMTransitHitState;
    UPROPERTY()
    FGameplayTagContainer HitStunTags;
    UPROPERTY()
    FGameplayTagContainer HitTags;
    UPROPERTY()
    TMap<EAttackDataHitState, float32> HitStunDurationConfigMap;
    UPROPERTY()
    float32 HitStunDetachMax = 100.0f;
    UPROPERTY()
    float32 HitStunDetachMaxMaintainTime = 0.5f;
    UPROPERTY()
    TMap<EAttackDataHitState, float32> HitStunDetachConfigMap;
    UPROPERTY()
    TMap<EAttackType, bool> CanDefenseByAttackTypeMap;
    UPROPERTY()
    TMap<EAttackDataHitState, bool> CausePassiveMovementImpulseX;
    UPROPERTY()
    TMap<EAttackDataHitState, bool> CausePassiveMovementImpulseZ;
    UPROPERTY()
    float32 EcologyPostureProtectDuration;
    UPROPERTY()
    float32 EcologyPostureProtectTakeRatio;
    UPROPERTY()
    TMap<FName, int> HitStatePriorityMap;


    FHitLevelESMTransitInfo GetESMTransitHitState(const EHitStateESMTransitType HitStateESMTransitType, const EHitReactionPrefabBodyType PrefabBodyType, const EAttackDataHitState HitLevel)
    {
        if (this.ESMTransits.Contains(HitStateESMTransitType))
        {
            if (this.ESMTransits[HitStateESMTransitType].PrefabToESMTransits.Contains(PrefabBodyType))
            {
                TMap<EAttackDataHitState, FHitLevelESMTransitInfo> local_4;
                if (local_4.Contains(HitLevel))
                {
                    return local_4[HitLevel];
                }
            }
        }
        return FHitLevelESMTransitInfo();
    }
    float32 GetHitStunDuration(const EAttackDataHitState AttackDataHitState)
    {
        if (this.HitStunDurationConfigMap.Contains(AttackDataHitState))
        {
            return this.HitStunDurationConfigMap[AttackDataHitState];
        }
        return 0.0f;
    }
    float32 GetHitStunDetach(const EAttackDataHitState AttackDataHitState)
    {
        if (this.HitStunDetachConfigMap.Contains(AttackDataHitState))
        {
            return this.HitStunDetachConfigMap[AttackDataHitState];
        }
        return 0.0f;
    }
    bool CanCausePassiveMovementImpulseX(const EAttackDataHitState HitLevel)
    {
        if (this.CausePassiveMovementImpulseX.Contains(HitLevel))
        {
            return true;
        }
        return false;
    }
    bool CanCausePassiveMovementImpulseZ(const EAttackDataHitState HitLevel)
    {
        if (this.CausePassiveMovementImpulseZ.Contains(HitLevel))
        {
            return true;
        }
        return false;
    }
}

namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FHitLevelESMTransitInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FHitLevelESMTransitInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FHitLevelESMTransitInfo
{
int __IndexOf_ESMTransitName()
{
    return 0;
}
int __IndexOf_StrikeRatio()
{
    return 1;
}
int __IndexOf_bOverrideStrikeX()
{
    return 2;
}
int __IndexOf_OverrideStrikeX()
{
    return 3;
}
int __IndexOf_bOverrideStrikeZ()
{
    return 4;
}
int __IndexOf_OverrideStrikeZ()
{
    return 5;
}
}

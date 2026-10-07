
enum ECombatArealEffectRange
{
    Distance,
    DistanceXY,
    Box,
}

enum ECombatArealEffectType
{
    None,
    Buff,
    AbilityEffectTrigger,
}


struct FCombatArealEffectAddBuffData
{
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    int AddBuffStackNum = 1;
    UPROPERTY()
    float32 OverrideDuration = -1.0f;


}

struct FCombatArealEffectData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    ECombatArealEffectRange m_Range;
    UPROPERTY()
    float32 m_Distance;
    UPROPERTY()
    FVector m_BoxExtent;
    UPROPERTY()
    uint8 m_TargetRelation;
    UPROPERTY()
    float32 m_RangeCheckInterval;

    FCombatArealEffectData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCombatArealEffectData(const FCombatArealEffectData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCombatArealEffectData opAssign(const FCombatArealEffectData &inout Other)
    {
        FCombatArealEffectData __r;
        this.SetRange(Other.GetRange());
        this.SetDistance(Other.GetDistance());
        this.SetBoxExtent(Other.GetBoxExtent());
        this.SetTargetRelation(uint8(Other.GetTargetRelation()));
        this.SetRangeCheckInterval(Other.GetRangeCheckInterval());
        return __r;
    }
    ECombatArealEffectRange GetRange() const property
    {
        return this.m_Range;
    }
    void SetRange(const ECombatArealEffectRange __Value) property
    {
        if (int(this.m_Range) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Range = __Value;
        return;
    }
    float32 GetDistance() const property
    {
        return this.m_Distance;
    }
    void SetDistance(const float32 __Value) property
    {
        if (this.m_Distance == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Distance = __Value;
        return;
    }
    const FVector GetBoxExtent() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_BoxExtent() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetBoxExtent(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_BoxExtent = __Value;
        return;
    }
    uint8 GetTargetRelation() const property
    {
        return this.m_TargetRelation;
    }
    void SetTargetRelation(const uint8 __Value) property
    {
        if (this.m_TargetRelation == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_TargetRelation = (__Value != 0);
        return;
    }
    float32 GetRangeCheckInterval() const property
    {
        return this.m_RangeCheckInterval;
    }
    void SetRangeCheckInterval(const float32 __Value) property
    {
        if (this.m_RangeCheckInterval == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_RangeCheckInterval = __Value;
        return;
    }
}

struct FCombatArealEffectConfigData_AbilityEffectTrigger
{
    UPROPERTY()
    FCombatArealEffectData AreaData;
    UPROPERTY()
    TSubclassOf<UEASAbility> AbilityClass;
    UPROPERTY()
    FName EventName;
    UPROPERTY()
    bool bTriggerOnEntityInRange = true;
    UPROPERTY()
    bool bTriggerOnEntityOutOfRange = true;
    UPROPERTY()
    bool bTriggerRepeatedlyEntityInnerRange = false;
    UPROPERTY()
    FFPTime TriggerAgainInnerRangeInterval = -1;


}

struct FCombatArealEffectConfigData_Buff
{
    UPROPERTY()
    FCombatArealEffectData AreaData;
    UPROPERTY()
    TArray<FCombatArealEffectAddBuffData> AddBuffDatas;
    UPROPERTY()
    bool bRemoveBuffOnLeaveArea = false;
    UPROPERTY()
    bool bAddRepeatedlyEntityInnerRange = false;
    UPROPERTY()
    FFPTime AddAgainInnerRangeInterval = -1;


}

struct FCombatArealEffectConfigDataObject_AbilityEffectTrigger : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FCombatArealEffectConfigData_AbilityEffectTrigger Data;

    FCombatArealEffectConfigDataObject_AbilityEffectTrigger()
    {
        return;
    }
}

struct FCombatArealEffectConfigData_HitTest : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FCombatArealEffectData AreaData;
    UPROPERTY()
    FDataObjectPtr AttackData;
    UPROPERTY()
    FName StrikeKey = NAME_None;
    UPROPERTY()
    FFPTime HitInterval = -1;
    UPROPERTY()
    FDataObjectPtr HitDecalConfig;

    FCombatArealEffectConfigData_HitTest()
    {
        return;
    }
}

struct FCombatArealEffectConfigDataObject_Buff : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FCombatArealEffectConfigData_Buff Data;

    FCombatArealEffectConfigDataObject_Buff()
    {
        return;
    }
}

namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FCombatArealEffectData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FCombatArealEffectData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCombatArealEffectData
{
int __IndexOf_Range()
{
    return 0;
}
int __IndexOf_Distance()
{
    return 1;
}
int __IndexOf_BoxExtent()
{
    return 2;
}
int __IndexOf_TargetRelation()
{
    return 3;
}
int __IndexOf_RangeCheckInterval()
{
    return 4;
}
}

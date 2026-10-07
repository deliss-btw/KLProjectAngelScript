
enum ETuneFloatOptions
{
    LockValue,
    SnapOnEnter,
    SnapOnExit,
    SnapOnResume,
}

namespace TuneESMBBFloatNames
{
    const FName RelativeDesiredRotationYaw = n"CharacterMovementControl.fRelativeDesiredRotationYaw";
    const FName RelativeDesiredViewRotationYaw = n"CharacterMovementControl.fRelativeDesiredViewRotationYaw";
    const FName RelativeToLockTargetYaw = n"LockTarget.fGetRelativeYawToTargetEntity";
    const FName TunedRelativeDesiredRotationYaw = n"TuneESMBBFloat.fTunedRelativeDesiredRotationYaw";
    const FName TunedRelativeDesiredViewRotationYaw = n"TuneESMBBFloat.fTunedRelativeDesiredViewRotationYaw";
    const FName TunedRelativeToLockTargetYaw = n"TuneESMBBFloat.fTunedRelativeToLockTargetYaw";
}
namespace __INTENRAL_FC_TuneESMBBFloat_NS
{
    const TECSComponentDerivedPtr<FC_TuneESMBBFloat> DerivedPtr = TECSComponentDerivedPtr<FC_TuneESMBBFloat>();
    const FC_TuneESMBBFloat DefaultValue = FC_TuneESMBBFloat();
}
namespace __INTENRAL_FC_TuneESMBBFloatValue_NS
{
    const TECSComponentDerivedPtr<FC_TuneESMBBFloatValue> DerivedPtr = TECSComponentDerivedPtr<FC_TuneESMBBFloatValue>();
    const FC_TuneESMBBFloatValue DefaultValue = FC_TuneESMBBFloatValue();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_TuneESMBBFloatValueRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FTuneFloatConfig
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    bool m_bUseBlendInDuration;
    UPROPERTY()
    float32 m_BlendInDuration;
    UPROPERTY()
    bool m_bUseBlendOutDuration;
    UPROPERTY()
    float32 m_BlendOutDuration;
    UPROPERTY()
    float32 m_SmoothTime;
    UPROPERTY()
    bool m_bClampMin;
    UPROPERTY()
    float32 m_MinValue;
    UPROPERTY()
    bool m_bClampMax;
    UPROPERTY()
    float32 m_MaxValue;
    UPROPERTY()
    uint8 m_Options;
    UPROPERTY()
    bool m_bUseSnapDeltaThreshold;
    UPROPERTY()
    float32 m_SnapDeltaThreshold;

    FTuneFloatConfig()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTuneFloatConfig(const FTuneFloatConfig &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTuneFloatConfig opAssign(const FTuneFloatConfig &inout Other)
    {
        FTuneFloatConfig __r;
        this.SetbUseBlendInDuration(Other.GetbUseBlendInDuration());
        this.SetBlendInDuration(Other.GetBlendInDuration());
        this.SetbUseBlendOutDuration(Other.GetbUseBlendOutDuration());
        this.SetBlendOutDuration(Other.GetBlendOutDuration());
        this.SetSmoothTime(Other.GetSmoothTime());
        this.SetbClampMin(Other.GetbClampMin());
        this.SetMinValue(Other.GetMinValue());
        this.SetbClampMax(Other.GetbClampMax());
        this.SetMaxValue(Other.GetMaxValue());
        this.SetOptions(uint8(Other.GetOptions()));
        this.SetbUseSnapDeltaThreshold(Other.GetbUseSnapDeltaThreshold());
        this.SetSnapDeltaThreshold(Other.GetSnapDeltaThreshold());
        return __r;
    }
    float32 GetClampedValue(const float32 Value) const
    {
        float32 local_1 = Value;
        if (this.GetbClampMin())
        {
            local_1 = FMath::Max(local_1, this.GetMinValue());
        }
        if (this.GetbClampMax())
        {
            local_1 = FMath::Min(local_1, this.GetMaxValue());
        }
        return local_1;
    }
    bool HasOption(const ETuneFloatOptions Option) const
    {
        int local_6 = this.GetOptions() & (1 << int(Option));
        return (local_6 != 0);
    }
    bool GetbUseBlendInDuration() const property
    {
        return this.m_bUseBlendInDuration;
    }
    void SetbUseBlendInDuration(const bool __Value) property
    {
        if (!(this.m_bUseBlendInDuration) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bUseBlendInDuration = __Value;
        return;
    }
    float32 GetBlendInDuration() const property
    {
        return this.m_BlendInDuration;
    }
    void SetBlendInDuration(const float32 __Value) property
    {
        if (this.m_BlendInDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_BlendInDuration = __Value;
        return;
    }
    bool GetbUseBlendOutDuration() const property
    {
        return this.m_bUseBlendOutDuration;
    }
    void SetbUseBlendOutDuration(const bool __Value) property
    {
        if (!(this.m_bUseBlendOutDuration) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bUseBlendOutDuration = __Value;
        return;
    }
    float32 GetBlendOutDuration() const property
    {
        return this.m_BlendOutDuration;
    }
    void SetBlendOutDuration(const float32 __Value) property
    {
        if (this.m_BlendOutDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_BlendOutDuration = __Value;
        return;
    }
    float32 GetSmoothTime() const property
    {
        return this.m_SmoothTime;
    }
    void SetSmoothTime(const float32 __Value) property
    {
        if (this.m_SmoothTime == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_SmoothTime = __Value;
        return;
    }
    bool GetbClampMin() const property
    {
        return this.m_bClampMin;
    }
    void SetbClampMin(const bool __Value) property
    {
        if (!(this.m_bClampMin) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_bClampMin = __Value;
        return;
    }
    float32 GetMinValue() const property
    {
        return this.m_MinValue;
    }
    void SetMinValue(const float32 __Value) property
    {
        if (this.m_MinValue == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_MinValue = __Value;
        return;
    }
    bool GetbClampMax() const property
    {
        return this.m_bClampMax;
    }
    void SetbClampMax(const bool __Value) property
    {
        if (!(this.m_bClampMax) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_bClampMax = __Value;
        return;
    }
    float32 GetMaxValue() const property
    {
        return this.m_MaxValue;
    }
    void SetMaxValue(const float32 __Value) property
    {
        if (this.m_MaxValue == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_MaxValue = __Value;
        return;
    }
    uint8 GetOptions() const property
    {
        return this.m_Options;
    }
    void SetOptions(const uint8 __Value) property
    {
        if (this.m_Options == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_Options = (__Value != 0);
        return;
    }
    bool GetbUseSnapDeltaThreshold() const property
    {
        return this.m_bUseSnapDeltaThreshold;
    }
    void SetbUseSnapDeltaThreshold(const bool __Value) property
    {
        if (!(this.m_bUseSnapDeltaThreshold) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_bUseSnapDeltaThreshold = __Value;
        return;
    }
    float32 GetSnapDeltaThreshold() const property
    {
        return this.m_SnapDeltaThreshold;
    }
    void SetSnapDeltaThreshold(const float32 __Value) property
    {
        if (this.m_SnapDeltaThreshold == __Value)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_SnapDeltaThreshold = __Value;
        return;
    }
}

struct FTuneFloatData
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FTuneFloatConfig m_Config;
    UPROPERTY()
    float32 m_TunedValue;
    UPROPERTY()
    float32 m_SmoothVelocity;
    UPROPERTY()
    TArray<FTuneFloatConfig> m_ConfigStack;
    UPROPERTY()
    float32 m_BlendAlpha;
    UPROPERTY()
    float32 m_SpanElapsed;
    UPROPERTY()
    float32 m_SpanDuration;

    FTuneFloatData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTuneFloatData(const FTuneFloatData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTuneFloatData opAssign(const FTuneFloatData &inout Other)
    {
        FTuneFloatData __r;
        this.SetConfig(Other.GetConfig());
        this.SetTunedValue(Other.GetTunedValue());
        this.SetSmoothVelocity(Other.GetSmoothVelocity());
        this.SetConfigStack(Other.GetConfigStack());
        this.SetBlendAlpha(Other.GetBlendAlpha());
        this.SetSpanElapsed(Other.GetSpanElapsed());
        this.SetSpanDuration(Other.GetSpanDuration());
        return __r;
    }
    void PushConfig(const FTuneFloatConfig &inout InConfig, const float32 InSpanDuration = 0.0f)
    {
        this.GetConfigStack().Add(InConfig);
        this.SetConfig(InConfig);
        this.SetSpanElapsed(0.0f);
        this.SetSpanDuration(InSpanDuration);
        if (InConfig.GetbUseBlendInDuration() && (InConfig.GetBlendInDuration() > 0.0f))
        {
            this.SetBlendAlpha(0.0f);
            return;
        }
        this.SetBlendAlpha(1.0f);
        return;
    }
    bool PopConfig()
    {
        if (this.GetConfigStack().IsEmpty())
        {
            return false;
        }
        this.GetConfigStack().RemoveAt((this.GetConfigStack().Num() - 1));
        if (this.GetConfigStack().IsEmpty())
        {
            return false;
        }
        this.SetConfig(this.GetConfigStack().Last(0));
        this.SetBlendAlpha(1.0f);
        return true;
    }
    const FTuneFloatConfig& GetCurrentConfig() const
    {
        return this.GetConfig();
    }
    FTuneFloatConfig GetConfig() const property
    {
        FTuneFloatConfig __r;
        return __r;
    }
    FTuneFloatConfig GetConfig() property
    {
        FTuneFloatConfig __r;
        return __r;
    }
    void SetConfig(const FTuneFloatConfig &inout __Value) property
    {
        this.m_Config = __Value;
        return;
    }
    float32 GetTunedValue() const property
    {
        return this.m_TunedValue;
    }
    void SetTunedValue(const float32 __Value) property
    {
        if (this.m_TunedValue == __Value)
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_TunedValue = __Value;
        return;
    }
    float32 GetSmoothVelocity() const property
    {
        return this.m_SmoothVelocity;
    }
    void SetSmoothVelocity(const float32 __Value) property
    {
        if (this.m_SmoothVelocity == __Value)
        {
            return;
        }
        this.__MarkDirty(13);
        this.m_SmoothVelocity = __Value;
        return;
    }
    const TArray<FTuneFloatConfig> GetConfigStack() const property
    {
        const TArray<FTuneFloatConfig> __r;
        return __r;
    }
    TArray<FTuneFloatConfig> GetConfigStack() property
    {
        TArray<FTuneFloatConfig> __r;
        return __r;
    }
    void SetConfigStack(const TArray<FTuneFloatConfig> &inout __Value) property
    {
        this.m_ConfigStack = __Value;
        return;
    }
    float32 GetBlendAlpha() const property
    {
        return this.m_BlendAlpha;
    }
    void SetBlendAlpha(const float32 __Value) property
    {
        this.m_BlendAlpha = __Value;
        return;
    }
    float32 GetSpanElapsed() const property
    {
        return this.m_SpanElapsed;
    }
    void SetSpanElapsed(const float32 __Value) property
    {
        this.m_SpanElapsed = __Value;
        return;
    }
    float32 GetSpanDuration() const property
    {
        return this.m_SpanDuration;
    }
    void SetSpanDuration(const float32 __Value) property
    {
        this.m_SpanDuration = __Value;
        return;
    }
}

struct FC_TuneESMBBFloat : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FName, FTuneFloatData> m_DataMap;

    FC_TuneESMBBFloat()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_TuneESMBBFloat(const FC_TuneESMBBFloat &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DataMap = Other.m_DataMap;
        return;
    }
    FC_TuneESMBBFloat opAssign(const FC_TuneESMBBFloat &inout Other)
    {
        FC_TuneESMBBFloat __r;
        this.SetDataMap(Other.GetDataMap());
        return __r;
    }
    float32 GetTunedValue(const FName &inout ParamName) const
    {
        if (this.GetDataMap().Contains(ParamName))
        {
            return this.GetDataMap()[ParamName].GetTunedValue();
        }
        return 0.0f;
    }
    float32 GetTuneVelocity(const FName &inout ParamName) const
    {
        if (this.GetDataMap().Contains(ParamName))
        {
            return this.GetDataMap()[ParamName].GetSmoothVelocity();
        }
        return 0.0f;
    }
    FTuneFloatData& Push(const FName &inout ParamName, const FTuneFloatConfig &inout Config, const float32 SpanDuration = 0.0f)
    {
        FTuneFloatData& local_2 = this.GetModify_DataMap().FindOrAdd(ParamName);
        local_2.PushConfig(Config, SpanDuration);
        return local_2;
    }
    bool Pop(const FName &inout ParamName)
    {
        if (!(this.GetDataMap().Contains(ParamName)))
        {
            return false;
        }
        if (this.GetModify_DataMap()[ParamName].PopConfig())
        {
            return true;
        }
        return false;
    }
    bool HasOption(const FName &inout ParamName, const ETuneFloatOptions Option) const
    {
        if (!(this.GetDataMap().Contains(ParamName)))
        {
            return false;
        }
        return this.GetDataMap()[ParamName].GetConfig().HasOption();
    }
    float32 TunedRelativeDesiredRotationYaw() const
    {
        return this.GetTunedValue(TuneESMBBFloatNames::RelativeDesiredRotationYaw);
    }
    float32 TunedRelativeDesiredViewRotationYaw() const
    {
        return this.GetTunedValue(TuneESMBBFloatNames::RelativeDesiredViewRotationYaw);
    }
    float32 TunedRelativeToLockTargetYaw() const
    {
        return this.GetTunedValue(TuneESMBBFloatNames::RelativeToLockTargetYaw);
    }
    float32 TuneVelRelativeDesiredRotationYaw() const
    {
        return this.GetTuneVelocity(TuneESMBBFloatNames::RelativeDesiredRotationYaw);
    }
    float32 TuneVelRelativeDesiredViewRotationYaw() const
    {
        return this.GetTuneVelocity(TuneESMBBFloatNames::RelativeDesiredViewRotationYaw);
    }
    float32 TuneVelRelativeToLockTargetYaw() const
    {
        return this.GetTuneVelocity(TuneESMBBFloatNames::RelativeToLockTargetYaw);
    }
    const TMap<FName, FTuneFloatData> GetDataMap() const property
    {
        const TMap<FName, FTuneFloatData> __r;
        return __r;
    }
    TMap<FName, FTuneFloatData> GetModify_DataMap() property
    {
        TMap<FName, FTuneFloatData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDataMap(const TMap<FName, FTuneFloatData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DataMap = __Value;
        return;
    }
}

struct FC_TuneESMBBFloatValue : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_TunedRelativeDesiredRotationYaw;
    UPROPERTY()
    float32 m_TunedRelativeDesiredRotationYaw360;
    UPROPERTY()
    float32 m_TunedRelativeDesiredViewRotationYaw;
    UPROPERTY()
    float32 m_TunedRelativeToLockTargetYaw;

    FC_TuneESMBBFloatValue()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_TuneESMBBFloatValue(const FC_TuneESMBBFloatValue &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_TuneESMBBFloatValue opAssign(const FC_TuneESMBBFloatValue &inout Other)
    {
        FC_TuneESMBBFloatValue __r;
        this.SetTunedRelativeDesiredRotationYaw(Other.GetTunedRelativeDesiredRotationYaw());
        this.SetTunedRelativeDesiredRotationYaw360(Other.GetTunedRelativeDesiredRotationYaw360());
        this.SetTunedRelativeDesiredViewRotationYaw(Other.GetTunedRelativeDesiredViewRotationYaw());
        this.SetTunedRelativeToLockTargetYaw(Other.GetTunedRelativeToLockTargetYaw());
        return __r;
    }
    void SetTunedValueBySourceName(const FName &inout SourceName, const float32 TunedValue)
    {
        float32 local_3;
        if ((SourceName == TuneESMBBFloatNames::RelativeDesiredRotationYaw))
        {
            this.SetTunedRelativeDesiredRotationYaw(TunedValue);
            if (TunedValue > 0.0f)
            {
                local_3 = TunedValue;
            }
            else
            {
                local_3 = TunedValue + 360.0f;
            }
            this.SetTunedRelativeDesiredRotationYaw360(local_3);
            return;
        }
        if ((SourceName == TuneESMBBFloatNames::RelativeDesiredViewRotationYaw))
        {
            this.SetTunedRelativeDesiredViewRotationYaw(TunedValue);
            return;
        }
        if ((SourceName == TuneESMBBFloatNames::RelativeToLockTargetYaw))
        {
            this.SetTunedRelativeToLockTargetYaw(TunedValue);
        }
        return;
    }
    float32 GetTunedRelativeDesiredRotationYaw() const property
    {
        return this.m_TunedRelativeDesiredRotationYaw;
    }
    void SetTunedRelativeDesiredRotationYaw(const float32 __Value) property
    {
        if (this.m_TunedRelativeDesiredRotationYaw == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TunedRelativeDesiredRotationYaw = __Value;
        return;
    }
    float32 GetTunedRelativeDesiredRotationYaw360() const property
    {
        return this.m_TunedRelativeDesiredRotationYaw360;
    }
    void SetTunedRelativeDesiredRotationYaw360(const float32 __Value) property
    {
        if (this.m_TunedRelativeDesiredRotationYaw360 == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TunedRelativeDesiredRotationYaw360 = __Value;
        return;
    }
    float32 GetTunedRelativeDesiredViewRotationYaw() const property
    {
        return this.m_TunedRelativeDesiredViewRotationYaw;
    }
    void SetTunedRelativeDesiredViewRotationYaw(const float32 __Value) property
    {
        if (this.m_TunedRelativeDesiredViewRotationYaw == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_TunedRelativeDesiredViewRotationYaw = __Value;
        return;
    }
    float32 GetTunedRelativeToLockTargetYaw() const property
    {
        return this.m_TunedRelativeToLockTargetYaw;
    }
    void SetTunedRelativeToLockTargetYaw(const float32 __Value) property
    {
        if (this.m_TunedRelativeToLockTargetYaw == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_TunedRelativeToLockTargetYaw = __Value;
        return;
    }
}

namespace TuneESMBBFloatNames
{
bool IsDegreeSourceParam(const FName &inout ParamName)
{
    return ((ParamName == TuneESMBBFloatNames::RelativeDesiredRotationYaw) || (ParamName == TuneESMBBFloatNames::RelativeDesiredViewRotationYaw) || (ParamName == TuneESMBBFloatNames::RelativeToLockTargetYaw));
}
FName GetSourceVariableName(const FName &inout ParamName)
{
    if ((ParamName == TuneESMBBFloatNames::TunedRelativeDesiredRotationYaw))
    {
        return TuneESMBBFloatNames::RelativeDesiredRotationYaw;
    }
    if ((ParamName == TuneESMBBFloatNames::TunedRelativeDesiredViewRotationYaw))
    {
        return TuneESMBBFloatNames::RelativeDesiredViewRotationYaw;
    }
    if ((ParamName == TuneESMBBFloatNames::TunedRelativeToLockTargetYaw))
    {
        return TuneESMBBFloatNames::RelativeToLockTargetYaw;
    }
    return NAME_None;
}
}
namespace FC_TuneESMBBFloatValue
{
FC_TuneESMBBFloatValue Interpolate(const FC_TuneESMBBFloatValue &inout A, const FC_TuneESMBBFloatValue &inout B, const float32 T, const float32 DeltaTime)
{
    FC_TuneESMBBFloatValue local_6;
    local_6.SetTunedRelativeDesiredRotationYaw(FMath::Lerp(A.GetTunedRelativeDesiredRotationYaw(), B.GetTunedRelativeDesiredRotationYaw(), T));
    local_6.SetTunedRelativeDesiredRotationYaw360(FMath::Lerp(A.GetTunedRelativeDesiredRotationYaw360(), B.GetTunedRelativeDesiredRotationYaw360(), T));
    local_6.SetTunedRelativeDesiredViewRotationYaw(FMath::Lerp(A.GetTunedRelativeDesiredViewRotationYaw(), B.GetTunedRelativeDesiredViewRotationYaw(), T));
    local_6.SetTunedRelativeToLockTargetYaw(FMath::Lerp(A.GetTunedRelativeToLockTargetYaw(), B.GetTunedRelativeToLockTargetYaw(), T));
    return local_6;
}
}
namespace ECSFunc_FC_TuneESMBBFloat
{
UFUNCTION()
bool HasTuneESMBBFloat(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloat);
}
FC_TuneESMBBFloat& AssignTuneESMBBFloat(const FECSEntity &inout Entity, const FC_TuneESMBBFloat &inout DefaultValue = FC_TuneESMBBFloat())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloat, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTuneESMBBFloat_BP(const FECSEntity &inout Entity, const FC_TuneESMBBFloat &inout DefaultValue = FC_TuneESMBBFloat())
{
    ECSFunc_FC_TuneESMBBFloat::AssignTuneESMBBFloat(Entity, DefaultValue);
    return;
}
FC_TuneESMBBFloat& ModifyTuneESMBBFloat(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloat));
    return local_12.GetComp();
}
FC_TuneESMBBFloat& ModifyOrAddTuneESMBBFloat(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloat));
    return local_12.GetComp();
}
const FC_TuneESMBBFloat& GetTuneESMBBFloat(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloat));
    return local_12.GetComp();
}
UFUNCTION()
FC_TuneESMBBFloat GetTuneESMBBFloat_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TuneESMBBFloat& local_4 = ECSFunc_FC_TuneESMBBFloat::GetTuneESMBBFloat(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TuneESMBBFloat();
}
const FC_TuneESMBBFloat GetDefaultedTuneESMBBFloat(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TuneESMBBFloat __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloat);
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
FC_TuneESMBBFloat GetDefaultedTuneESMBBFloat_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TuneESMBBFloat::GetDefaultedTuneESMBBFloat(Entity);
}
UFUNCTION()
bool RemoveTuneESMBBFloat(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloat);
}
}
FECSMonitorRuntimeView __GetMonitorTuneESMBBFloatOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TuneESMBBFloat, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTuneESMBBFloatOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TuneESMBBFloat, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTuneESMBBFloatOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TuneESMBBFloat, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTuneESMBBFloatOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TuneESMBBFloat, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTuneESMBBFloatOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TuneESMBBFloat, bFixedFrame, bMustHandleAll);
}
void __MonitorTuneESMBBFloatLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TuneESMBBFloat, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTuneESMBBFloatActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TuneESMBBFloat, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTuneESMBBFloatModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TuneESMBBFloat, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TuneESMBBFloatValue
{
UFUNCTION()
bool HasTuneESMBBFloatValue(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloatValue);
}
FC_TuneESMBBFloatValue& AssignTuneESMBBFloatValue(const FECSEntity &inout Entity, const FC_TuneESMBBFloatValue &inout DefaultValue = FC_TuneESMBBFloatValue())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloatValue, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTuneESMBBFloatValue_BP(const FECSEntity &inout Entity, const FC_TuneESMBBFloatValue &inout DefaultValue = FC_TuneESMBBFloatValue())
{
    ECSFunc_FC_TuneESMBBFloatValue::AssignTuneESMBBFloatValue(Entity, DefaultValue);
    return;
}
FC_TuneESMBBFloatValue& ModifyTuneESMBBFloatValue(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloatValue));
    return local_12.GetComp();
}
FC_TuneESMBBFloatValue& ModifyOrAddTuneESMBBFloatValue(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloatValue));
    return local_12.GetComp();
}
const FC_TuneESMBBFloatValue& GetTuneESMBBFloatValue(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloatValue));
    return local_12.GetComp();
}
UFUNCTION()
FC_TuneESMBBFloatValue GetTuneESMBBFloatValue_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TuneESMBBFloatValue& local_4 = ECSFunc_FC_TuneESMBBFloatValue::GetTuneESMBBFloatValue(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TuneESMBBFloatValue();
}
const FC_TuneESMBBFloatValue GetDefaultedTuneESMBBFloatValue(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TuneESMBBFloatValue __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloatValue);
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
FC_TuneESMBBFloatValue GetDefaultedTuneESMBBFloatValue_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TuneESMBBFloatValue::GetDefaultedTuneESMBBFloatValue(Entity);
}
UFUNCTION()
bool RemoveTuneESMBBFloatValue(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TuneESMBBFloatValue);
}
}
FECSMonitorRuntimeView __GetMonitorTuneESMBBFloatValueOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TuneESMBBFloatValue, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTuneESMBBFloatValueOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TuneESMBBFloatValue, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTuneESMBBFloatValueOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TuneESMBBFloatValue, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTuneESMBBFloatValueOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TuneESMBBFloatValue, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTuneESMBBFloatValueOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TuneESMBBFloatValue, bFixedFrame, bMustHandleAll);
}
void __MonitorTuneESMBBFloatValueLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TuneESMBBFloatValue, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTuneESMBBFloatValueActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TuneESMBBFloatValue, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTuneESMBBFloatValueModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TuneESMBBFloatValue, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_TuneESMBBFloat_TunedRelativeDesiredRotationYaw(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().TunedRelativeDesiredRotationYaw();
    return;
}
void GetEntityBBVar_TuneESMBBFloat_TunedRelativeDesiredViewRotationYaw(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().TunedRelativeDesiredViewRotationYaw();
    return;
}
void GetEntityBBVar_TuneESMBBFloat_TunedRelativeToLockTargetYaw(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().TunedRelativeToLockTargetYaw();
    return;
}
void GetEntityBBVar_TuneESMBBFloat_TuneVelRelativeDesiredRotationYaw(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().TuneVelRelativeDesiredRotationYaw();
    return;
}
void GetEntityBBVar_TuneESMBBFloat_TuneVelRelativeDesiredViewRotationYaw(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().TuneVelRelativeDesiredViewRotationYaw();
    return;
}
void GetEntityBBVar_TuneESMBBFloat_TuneVelRelativeToLockTargetYaw(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().TuneVelRelativeToLockTargetYaw();
    return;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FTuneFloatConfig &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FTuneFloatConfig &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FTuneFloatConfig
{
int __IndexOf_bUseBlendInDuration()
{
    return 0;
}
int __IndexOf_BlendInDuration()
{
    return 1;
}
int __IndexOf_bUseBlendOutDuration()
{
    return 2;
}
int __IndexOf_BlendOutDuration()
{
    return 3;
}
int __IndexOf_SmoothTime()
{
    return 4;
}
int __IndexOf_bClampMin()
{
    return 5;
}
int __IndexOf_MinValue()
{
    return 6;
}
int __IndexOf_bClampMax()
{
    return 7;
}
int __IndexOf_MaxValue()
{
    return 8;
}
int __IndexOf_Options()
{
    return 9;
}
int __IndexOf_bUseSnapDeltaThreshold()
{
    return 10;
}
int __IndexOf_SnapDeltaThreshold()
{
    return 11;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FTuneFloatData &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FTuneFloatData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FTuneFloatData
{
int __IndexOf_Config()
{
    return 0;
}
int __IndexOf_TunedValue()
{
    return 12;
}
int __IndexOf_SmoothVelocity()
{
    return 13;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_TuneESMBBFloat &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_TuneESMBBFloat &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_TuneESMBBFloat &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_TuneESMBBFloat
{
int __IndexOf_DataMap()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_TuneESMBBFloatValue &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_TuneESMBBFloatValue &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_TuneESMBBFloatValue &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_TuneESMBBFloatValue
{
int __IndexOf_TunedRelativeDesiredRotationYaw()
{
    return 0;
}
int __IndexOf_TunedRelativeDesiredRotationYaw360()
{
    return 1;
}
int __IndexOf_TunedRelativeDesiredViewRotationYaw()
{
    return 2;
}
int __IndexOf_TunedRelativeToLockTargetYaw()
{
    return 3;
}
}

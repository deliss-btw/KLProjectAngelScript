
enum EScalerResourceChangeOrder
{
    SpecifiedResourceNamesAtTheSameTime,
    SpecifiedResourceNamesInSpecifiedOrder,
}

enum EScalerResourceChangeType
{
    Decrement,
    DecrementIfEnough,
    Increment,
}

namespace __INTENRAL_FC_ScalerResourceTimer_RecoverStartDelay0_NS
{
    const TECSComponentDerivedPtr<FC_ScalerResourceTimer_RecoverStartDelay0> DerivedPtr = TECSComponentDerivedPtr<FC_ScalerResourceTimer_RecoverStartDelay0>();
    const FC_ScalerResourceTimer_RecoverStartDelay0 DefaultValue = FC_ScalerResourceTimer_RecoverStartDelay0();
}
namespace __INTENRAL_FC_ScalerResourceTimer_RecoverStartDelay1_NS
{
    const TECSComponentDerivedPtr<FC_ScalerResourceTimer_RecoverStartDelay1> DerivedPtr = TECSComponentDerivedPtr<FC_ScalerResourceTimer_RecoverStartDelay1>();
    const FC_ScalerResourceTimer_RecoverStartDelay1 DefaultValue = FC_ScalerResourceTimer_RecoverStartDelay1();
}
namespace __INTENRAL_FC_ScalerResourceTimer_RecoverStartDelay2_NS
{
    const TECSComponentDerivedPtr<FC_ScalerResourceTimer_RecoverStartDelay2> DerivedPtr = TECSComponentDerivedPtr<FC_ScalerResourceTimer_RecoverStartDelay2>();
    const FC_ScalerResourceTimer_RecoverStartDelay2 DefaultValue = FC_ScalerResourceTimer_RecoverStartDelay2();
}
namespace __INTENRAL_FC_ScalerResourceRuntime_NS
{
    const TECSComponentDerivedPtr<FC_ScalerResourceRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_ScalerResourceRuntime>();
    const FC_ScalerResourceRuntime DefaultValue = FC_ScalerResourceRuntime();
}
namespace __INTENRAL_FC_ScalerResourceInfoTransferredToOwner_NS
{
    const TECSComponentDerivedPtr<FC_ScalerResourceInfoTransferredToOwner> DerivedPtr = TECSComponentDerivedPtr<FC_ScalerResourceInfoTransferredToOwner>();
    const FC_ScalerResourceInfoTransferredToOwner DefaultValue = FC_ScalerResourceInfoTransferredToOwner();
}
namespace __INTENRAL_FC_ScalerResourceConfig_NS
{
    const TECSComponentDerivedPtr<FC_ScalerResourceConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ScalerResourceConfig>();
    const FC_ScalerResourceConfig DefaultValue = FC_ScalerResourceConfig();
}
namespace __INTENRAL_FC_ScalerResourceRecoverDelayTag_NS
{
    const TECSComponentDerivedPtr<FC_ScalerResourceRecoverDelayTag> DerivedPtr = TECSComponentDerivedPtr<FC_ScalerResourceRecoverDelayTag>();
    const FC_ScalerResourceRecoverDelayTag DefaultValue = FC_ScalerResourceRecoverDelayTag();
}
namespace __INTENRAL_FC_ScalerResource0RecoveringTag_NS
{
    const TECSComponentDerivedPtr<FC_ScalerResource0RecoveringTag> DerivedPtr = TECSComponentDerivedPtr<FC_ScalerResource0RecoveringTag>();
    const FC_ScalerResource0RecoveringTag DefaultValue = FC_ScalerResource0RecoveringTag();
}
namespace __INTENRAL_FC_ScalerResource1RecoveringTag_NS
{
    const TECSComponentDerivedPtr<FC_ScalerResource1RecoveringTag> DerivedPtr = TECSComponentDerivedPtr<FC_ScalerResource1RecoveringTag>();
    const FC_ScalerResource1RecoveringTag DefaultValue = FC_ScalerResource1RecoveringTag();
}
namespace __INTENRAL_FC_ScalerResource2RecoveringTag_NS
{
    const TECSComponentDerivedPtr<FC_ScalerResource2RecoveringTag> DerivedPtr = TECSComponentDerivedPtr<FC_ScalerResource2RecoveringTag>();
    const FC_ScalerResource2RecoveringTag DefaultValue = FC_ScalerResource2RecoveringTag();
}
namespace __INTENRAL_FC_ScalerResource0CanRecoverTag_NS
{
    const TECSComponentDerivedPtr<FC_ScalerResource0CanRecoverTag> DerivedPtr = TECSComponentDerivedPtr<FC_ScalerResource0CanRecoverTag>();
    const FC_ScalerResource0CanRecoverTag DefaultValue = FC_ScalerResource0CanRecoverTag();
}
namespace __INTENRAL_FC_ScalerResource1CanRecoverTag_NS
{
    const TECSComponentDerivedPtr<FC_ScalerResource1CanRecoverTag> DerivedPtr = TECSComponentDerivedPtr<FC_ScalerResource1CanRecoverTag>();
    const FC_ScalerResource1CanRecoverTag DefaultValue = FC_ScalerResource1CanRecoverTag();
}
namespace __INTENRAL_FC_ScalerResource2CanRecoverTag_NS
{
    const TECSComponentDerivedPtr<FC_ScalerResource2CanRecoverTag> DerivedPtr = TECSComponentDerivedPtr<FC_ScalerResource2CanRecoverTag>();
    const FC_ScalerResource2CanRecoverTag DefaultValue = FC_ScalerResource2CanRecoverTag();
}
namespace __INTENRAL_FC_ScalerResourceTransferToOwner_NS
{
    const TECSComponentDerivedPtr<FC_ScalerResourceTransferToOwner> DerivedPtr = TECSComponentDerivedPtr<FC_ScalerResourceTransferToOwner>();
    const FC_ScalerResourceTransferToOwner DefaultValue = FC_ScalerResourceTransferToOwner();

}
struct FC_ScalerResourceTimer_RecoverStartDelay0 : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_TargetWorldTime;

    FC_ScalerResourceTimer_RecoverStartDelay0()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ScalerResourceTimer_RecoverStartDelay0(const FC_ScalerResourceTimer_RecoverStartDelay0 &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_TargetWorldTime = Other.m_TargetWorldTime;
        return;
    }
    FC_ScalerResourceTimer_RecoverStartDelay0 opAssign(const FC_ScalerResourceTimer_RecoverStartDelay0 &inout Other)
    {
        FC_ScalerResourceTimer_RecoverStartDelay0 __r;
        this.SetTargetWorldTime(Other.GetTargetWorldTime());
        return __r;
    }
    const FFPTime GetTargetWorldTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_TargetWorldTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTargetWorldTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TargetWorldTime = __Value;
        return;
    }
}

struct FC_ScalerResourceTimer_RecoverStartDelay1 : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_TargetWorldTime;

    FC_ScalerResourceTimer_RecoverStartDelay1()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ScalerResourceTimer_RecoverStartDelay1(const FC_ScalerResourceTimer_RecoverStartDelay1 &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_TargetWorldTime = Other.m_TargetWorldTime;
        return;
    }
    FC_ScalerResourceTimer_RecoverStartDelay1 opAssign(const FC_ScalerResourceTimer_RecoverStartDelay1 &inout Other)
    {
        FC_ScalerResourceTimer_RecoverStartDelay1 __r;
        this.SetTargetWorldTime(Other.GetTargetWorldTime());
        return __r;
    }
    const FFPTime GetTargetWorldTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_TargetWorldTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTargetWorldTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TargetWorldTime = __Value;
        return;
    }
}

struct FC_ScalerResourceTimer_RecoverStartDelay2 : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_TargetWorldTime;

    FC_ScalerResourceTimer_RecoverStartDelay2()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ScalerResourceTimer_RecoverStartDelay2(const FC_ScalerResourceTimer_RecoverStartDelay2 &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_TargetWorldTime = Other.m_TargetWorldTime;
        return;
    }
    FC_ScalerResourceTimer_RecoverStartDelay2 opAssign(const FC_ScalerResourceTimer_RecoverStartDelay2 &inout Other)
    {
        FC_ScalerResourceTimer_RecoverStartDelay2 __r;
        this.SetTargetWorldTime(Other.GetTargetWorldTime());
        return __r;
    }
    const FFPTime GetTargetWorldTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_TargetWorldTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTargetWorldTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TargetWorldTime = __Value;
        return;
    }
}

struct FScalerResourceConfigData
{
    UPROPERTY()
    FName Name;
    UPROPERTY()
    float32 InitValue = 100.0f;
    UPROPERTY()
    float32 ValueMin = 0.0f;
    UPROPERTY()
    float32 ValueMax = 100.0f;
    UPROPERTY()
    bool bValueConsumeExtremeActivateESMTrigger = false;
    UPROPERTY()
    FNameHandle_ESMBBTrigger ValueConsumeExtremeESMTrigger;
    UPROPERTY()
    bool bValueRecoverExtremeActivateESMTrigger = false;
    UPROPERTY()
    FNameHandle_ESMBBTrigger ValueRecoverExtremeESMTrigger;
    UPROPERTY()
    bool bCanRecover = false;
    UPROPERTY()
    float32 RecoverStartDelaySeconds = 0.0f;
    UPROPERTY()
    float32 RecoverValueAbsPerSecond = 10.0f;
    UPROPERTY()
    float32 ValueConsumeExtremeIrresponsiveDuration = 0.0f;
    UPROPERTY()
    bool bRecoverInstantlyBackToExtremeWhenReachConsumeExtreme = false;
    UPROPERTY()
    float32 DeltaValueAbs = 10.0f;
    UPROPERTY()
    EScalerResourceChangeType ChangeType = EScalerResourceChangeType(0);


}

struct FScalerResourceConsumeItem
{
    UPROPERTY()
    FName Name;
    UPROPERTY()
    bool bOverrideDeltaValueAbs = false;
    UPROPERTY()
    float32 OverrideDeltaValueAbs = 0.0f;


}

struct FScalerResourceConsumeConfig
{
    UPROPERTY()
    EScalerResourceChangeOrder ChangeOrder = EScalerResourceChangeOrder(0);
    UPROPERTY()
    int MaxSize = 3;
    UPROPERTY()
    TArray<FScalerResourceConsumeItem> SpecificScalerResourceConsumeConfigs;
    UPROPERTY()
    bool bRevertIfAnyOneFails = true;


}

struct FC_ScalerResourceRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<float32> m_Values;
    UPROPERTY()
    uint8 m_CurrentFixedTickChangedBitMask;

    FC_ScalerResourceRuntime()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ScalerResourceRuntime(const FC_ScalerResourceRuntime &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ScalerResourceRuntime opAssign(const FC_ScalerResourceRuntime &inout Other)
    {
        FC_ScalerResourceRuntime __r;
        this.SetValues(Other.GetValues());
        this.SetCurrentFixedTickChangedBitMask(uint8(Other.GetCurrentFixedTickChangedBitMask()));
        return __r;
    }
    float32 GetScalerResourceValue0() const
    {
        if (this.GetValues().Num() > 0)
        {
            return this.GetValues()[0];
        }
        return 0.0f;
    }
    float32 GetScalerResourceValue1() const
    {
        if (this.GetValues().Num() > 1)
        {
            return this.GetValues()[1];
        }
        return 0.0f;
    }
    float32 GetScalerResourceValue2() const
    {
        if (this.GetValues().Num() > 2)
        {
            return this.GetValues()[2];
        }
        return 0.0f;
    }
    TArray<float32> GetValues() const property
    {
        TArray<float32> __r;
        return __r;
    }
    TArray<float32> GetModify_Values() property
    {
        TArray<float32> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetValues(const TArray<float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Values = __Value;
        return;
    }
    uint8 GetCurrentFixedTickChangedBitMask() const property
    {
        return this.m_CurrentFixedTickChangedBitMask;
    }
    void SetCurrentFixedTickChangedBitMask(const uint8 __Value) property
    {
        if (this.m_CurrentFixedTickChangedBitMask == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CurrentFixedTickChangedBitMask = (__Value != 0);
        return;
    }
}

struct FC_ScalerResourceInfoTransferredToOwner : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<float32> m_Values;
    UPROPERTY()
    TArray<float32> m_ConsumeExtremes;
    UPROPERTY()
    TArray<float32> m_RecoverExtremes;
    UPROPERTY()
    bool m_bInited;

    FC_ScalerResourceInfoTransferredToOwner()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ScalerResourceInfoTransferredToOwner(const FC_ScalerResourceInfoTransferredToOwner &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ScalerResourceInfoTransferredToOwner opAssign(const FC_ScalerResourceInfoTransferredToOwner &inout Other)
    {
        FC_ScalerResourceInfoTransferredToOwner __r;
        this.SetValues(Other.GetValues());
        this.SetConsumeExtremes(Other.GetConsumeExtremes());
        this.SetRecoverExtremes(Other.GetRecoverExtremes());
        this.SetbInited(Other.GetbInited());
        return __r;
    }
    float32 GetScalerResourceValue0() const
    {
        if (this.GetValues().Num() > 0)
        {
            return this.GetValues()[0];
        }
        return 0.0f;
    }
    float32 GetScalerResourceValue1() const
    {
        if (this.GetValues().Num() > 1)
        {
            return this.GetValues()[1];
        }
        return 0.0f;
    }
    float32 GetScalerResourceValue2() const
    {
        if (this.GetValues().Num() > 2)
        {
            return this.GetValues()[2];
        }
        return 0.0f;
    }
    float32 GetScalerResourceConsumeExtreme0() const
    {
        if (this.GetConsumeExtremes().Num() > 0)
        {
            return this.GetConsumeExtremes()[0];
        }
        return 0.0f;
    }
    float32 GetScalerResourceConsumeExtreme1() const
    {
        if (this.GetConsumeExtremes().Num() > 1)
        {
            return this.GetConsumeExtremes()[1];
        }
        return 0.0f;
    }
    float32 GetScalerResourceConsumeExtreme2() const
    {
        if (this.GetConsumeExtremes().Num() > 2)
        {
            return this.GetConsumeExtremes()[2];
        }
        return 0.0f;
    }
    float32 GetScalerResourceRecoverExtreme0() const
    {
        if (this.GetRecoverExtremes().Num() > 0)
        {
            return this.GetRecoverExtremes()[0];
        }
        return 0.0f;
    }
    float32 GetScalerResourceRecoverExtreme1() const
    {
        if (this.GetRecoverExtremes().Num() > 1)
        {
            return this.GetRecoverExtremes()[1];
        }
        return 0.0f;
    }
    float32 GetScalerResourceRecoverExtreme2() const
    {
        if (this.GetRecoverExtremes().Num() > 2)
        {
            return this.GetRecoverExtremes()[2];
        }
        return 0.0f;
    }
    TArray<float32> GetValues() const property
    {
        TArray<float32> __r;
        return __r;
    }
    TArray<float32> GetModify_Values() property
    {
        TArray<float32> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetValues(const TArray<float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Values = __Value;
        return;
    }
    const TArray<float32> GetConsumeExtremes() const property
    {
        const TArray<float32> __r;
        return __r;
    }
    TArray<float32> GetModify_ConsumeExtremes() property
    {
        TArray<float32> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetConsumeExtremes(const TArray<float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ConsumeExtremes = __Value;
        return;
    }
    const TArray<float32> GetRecoverExtremes() const property
    {
        const TArray<float32> __r;
        return __r;
    }
    TArray<float32> GetModify_RecoverExtremes() property
    {
        TArray<float32> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetRecoverExtremes(const TArray<float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_RecoverExtremes = __Value;
        return;
    }
    bool GetbInited() const property
    {
        return this.m_bInited;
    }
    void SetbInited(const bool __Value) property
    {
        if (!(this.m_bInited) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bInited = __Value;
        return;
    }
}

struct FC_ScalerResourceConfig : FECSComponent
{
    UPROPERTY()
    int MaxSize = 3;
    UPROPERTY()
    TArray<FScalerResourceConfigData> ScalerResourceConfigData;


    float32 GetScalerResourceConsumeExtreme0() const
    {
        float32 local_7 = 0.0f;
        if (this.ScalerResourceConfigData.Num() > 0)
        {
            if (int(this.ScalerResourceConfigData[0].ChangeType) == 0 || (int(this.ScalerResourceConfigData[0].ChangeType) == 1))
            {
            }
            else
            {
            }
            return local_7;
        }
        return 0.0f;
    }
    float32 GetScalerResourceConsumeExtreme1() const
    {
        float32 local_7 = 0.0f;
        if (this.ScalerResourceConfigData.Num() > 1)
        {
            if (int(this.ScalerResourceConfigData[1].ChangeType) == 0 || (int(this.ScalerResourceConfigData[1].ChangeType) == 1))
            {
            }
            else
            {
            }
            return local_7;
        }
        return 0.0f;
    }
    float32 GetScalerResourceConsumeExtreme2() const
    {
        float32 local_7 = 0.0f;
        if (this.ScalerResourceConfigData.Num() > 2)
        {
            if (int(this.ScalerResourceConfigData[2].ChangeType) == 0 || (int(this.ScalerResourceConfigData[2].ChangeType) == 1))
            {
            }
            else
            {
            }
            return local_7;
        }
        return 0.0f;
    }
    float32 GetScalerResourceRecoverExtreme0() const
    {
        float32 local_7 = 0.0f;
        if (this.ScalerResourceConfigData.Num() > 0)
        {
            if (int(this.ScalerResourceConfigData[0].ChangeType) == 0 || (int(this.ScalerResourceConfigData[0].ChangeType) == 1))
            {
            }
            else
            {
            }
            return local_7;
        }
        return 0.0f;
    }
    float32 GetScalerResourceRecoverExtreme1() const
    {
        float32 local_7 = 0.0f;
        if (this.ScalerResourceConfigData.Num() > 1)
        {
            if (int(this.ScalerResourceConfigData[1].ChangeType) == 0 || (int(this.ScalerResourceConfigData[1].ChangeType) == 1))
            {
            }
            else
            {
            }
            return local_7;
        }
        return 0.0f;
    }
    float32 GetScalerResourceRecoverExtreme2() const
    {
        float32 local_7 = 0.0f;
        if (this.ScalerResourceConfigData.Num() > 2)
        {
            if (int(this.ScalerResourceConfigData[2].ChangeType) == 0 || (int(this.ScalerResourceConfigData[2].ChangeType) == 1))
            {
            }
            else
            {
            }
            return local_7;
        }
        return 0.0f;
    }
}

struct FT_ScalerResource : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ScalerResourceConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ScalerResourceConfig, NAME_None);
    UPROPERTY()
    FC_ScalerResourceConfig Config_FC_ScalerResourceConfig;

    FT_ScalerResource()
    {
        return;
    }
}

struct FC_ScalerResourceRecoverDelayTag : FECSComponent
{
    FC_ScalerResourceRecoverDelayTag()
    {
        return;
    }
}

struct FC_ScalerResource0RecoveringTag : FECSComponent
{
    FC_ScalerResource0RecoveringTag()
    {
        return;
    }
}

struct FC_ScalerResource1RecoveringTag : FECSComponent
{
    FC_ScalerResource1RecoveringTag()
    {
        return;
    }
}

struct FC_ScalerResource2RecoveringTag : FECSComponent
{
    FC_ScalerResource2RecoveringTag()
    {
        return;
    }
}

struct FC_ScalerResource0CanRecoverTag : FECSComponent
{
    FC_ScalerResource0CanRecoverTag()
    {
        return;
    }
}

struct FC_ScalerResource1CanRecoverTag : FECSComponent
{
    FC_ScalerResource1CanRecoverTag()
    {
        return;
    }
}

struct FC_ScalerResource2CanRecoverTag : FECSComponent
{
    FC_ScalerResource2CanRecoverTag()
    {
        return;
    }
}

struct FC_ScalerResourceTransferToOwner : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntityId m_OwnerCacheId;

    FC_ScalerResourceTransferToOwner()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ScalerResourceTransferToOwner(const FC_ScalerResourceTransferToOwner &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_OwnerCacheId = Other.m_OwnerCacheId;
        return;
    }
    FC_ScalerResourceTransferToOwner opAssign(const FC_ScalerResourceTransferToOwner &inout Other)
    {
        FC_ScalerResourceTransferToOwner __r;
        this.SetOwnerCacheId(Other.GetOwnerCacheId());
        return __r;
    }
    const FECSEntityId GetOwnerCacheId() const property
    {
        const FECSEntityId __r;
        return __r;
    }
    FECSEntityId GetModify_OwnerCacheId() property
    {
        FECSEntityId __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetOwnerCacheId(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_OwnerCacheId = __Value;
        return;
    }
}

namespace ECSFunc_FC_ScalerResourceTimer_RecoverStartDelay0
{
UFUNCTION()
bool HasScalerResourceTimer_RecoverStartDelay0(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay0);
}
FC_ScalerResourceTimer_RecoverStartDelay0& AssignScalerResourceTimer_RecoverStartDelay0(const FECSEntity &inout Entity, const FC_ScalerResourceTimer_RecoverStartDelay0 &inout DefaultValue = FC_ScalerResourceTimer_RecoverStartDelay0())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay0, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignScalerResourceTimer_RecoverStartDelay0_BP(const FECSEntity &inout Entity, const FC_ScalerResourceTimer_RecoverStartDelay0 &inout DefaultValue = FC_ScalerResourceTimer_RecoverStartDelay0())
{
    ECSFunc_FC_ScalerResourceTimer_RecoverStartDelay0::AssignScalerResourceTimer_RecoverStartDelay0(Entity, DefaultValue);
    return;
}
FC_ScalerResourceTimer_RecoverStartDelay0& ModifyScalerResourceTimer_RecoverStartDelay0(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay0));
    return local_12.GetComp();
}
FC_ScalerResourceTimer_RecoverStartDelay0& ModifyOrAddScalerResourceTimer_RecoverStartDelay0(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay0));
    return local_12.GetComp();
}
const FC_ScalerResourceTimer_RecoverStartDelay0& GetScalerResourceTimer_RecoverStartDelay0(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay0));
    return local_12.GetComp();
}
UFUNCTION()
FC_ScalerResourceTimer_RecoverStartDelay0 GetScalerResourceTimer_RecoverStartDelay0_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ScalerResourceTimer_RecoverStartDelay0& local_4 = ECSFunc_FC_ScalerResourceTimer_RecoverStartDelay0::GetScalerResourceTimer_RecoverStartDelay0(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ScalerResourceTimer_RecoverStartDelay0();
}
const FC_ScalerResourceTimer_RecoverStartDelay0 GetDefaultedScalerResourceTimer_RecoverStartDelay0(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ScalerResourceTimer_RecoverStartDelay0 __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay0);
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
FC_ScalerResourceTimer_RecoverStartDelay0 GetDefaultedScalerResourceTimer_RecoverStartDelay0_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ScalerResourceTimer_RecoverStartDelay0::GetDefaultedScalerResourceTimer_RecoverStartDelay0(Entity);
}
UFUNCTION()
bool RemoveScalerResourceTimer_RecoverStartDelay0(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay0);
}
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTimer_RecoverStartDelay0OnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ScalerResourceTimer_RecoverStartDelay0, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTimer_RecoverStartDelay0OnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ScalerResourceTimer_RecoverStartDelay0, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTimer_RecoverStartDelay0OnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ScalerResourceTimer_RecoverStartDelay0, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTimer_RecoverStartDelay0OnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ScalerResourceTimer_RecoverStartDelay0, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTimer_RecoverStartDelay0OnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ScalerResourceTimer_RecoverStartDelay0, bFixedFrame, bMustHandleAll);
}
void __MonitorScalerResourceTimer_RecoverStartDelay0Lifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ScalerResourceTimer_RecoverStartDelay0, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceTimer_RecoverStartDelay0Activity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ScalerResourceTimer_RecoverStartDelay0, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceTimer_RecoverStartDelay0Modification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ScalerResourceTimer_RecoverStartDelay0, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ScalerResourceTimer_RecoverStartDelay1
{
UFUNCTION()
bool HasScalerResourceTimer_RecoverStartDelay1(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay1);
}
FC_ScalerResourceTimer_RecoverStartDelay1& AssignScalerResourceTimer_RecoverStartDelay1(const FECSEntity &inout Entity, const FC_ScalerResourceTimer_RecoverStartDelay1 &inout DefaultValue = FC_ScalerResourceTimer_RecoverStartDelay1())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay1, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignScalerResourceTimer_RecoverStartDelay1_BP(const FECSEntity &inout Entity, const FC_ScalerResourceTimer_RecoverStartDelay1 &inout DefaultValue = FC_ScalerResourceTimer_RecoverStartDelay1())
{
    ECSFunc_FC_ScalerResourceTimer_RecoverStartDelay1::AssignScalerResourceTimer_RecoverStartDelay1(Entity, DefaultValue);
    return;
}
FC_ScalerResourceTimer_RecoverStartDelay1& ModifyScalerResourceTimer_RecoverStartDelay1(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay1));
    return local_12.GetComp();
}
FC_ScalerResourceTimer_RecoverStartDelay1& ModifyOrAddScalerResourceTimer_RecoverStartDelay1(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay1));
    return local_12.GetComp();
}
const FC_ScalerResourceTimer_RecoverStartDelay1& GetScalerResourceTimer_RecoverStartDelay1(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay1));
    return local_12.GetComp();
}
UFUNCTION()
FC_ScalerResourceTimer_RecoverStartDelay1 GetScalerResourceTimer_RecoverStartDelay1_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ScalerResourceTimer_RecoverStartDelay1& local_4 = ECSFunc_FC_ScalerResourceTimer_RecoverStartDelay1::GetScalerResourceTimer_RecoverStartDelay1(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ScalerResourceTimer_RecoverStartDelay1();
}
const FC_ScalerResourceTimer_RecoverStartDelay1 GetDefaultedScalerResourceTimer_RecoverStartDelay1(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ScalerResourceTimer_RecoverStartDelay1 __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay1);
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
FC_ScalerResourceTimer_RecoverStartDelay1 GetDefaultedScalerResourceTimer_RecoverStartDelay1_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ScalerResourceTimer_RecoverStartDelay1::GetDefaultedScalerResourceTimer_RecoverStartDelay1(Entity);
}
UFUNCTION()
bool RemoveScalerResourceTimer_RecoverStartDelay1(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay1);
}
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTimer_RecoverStartDelay1OnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ScalerResourceTimer_RecoverStartDelay1, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTimer_RecoverStartDelay1OnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ScalerResourceTimer_RecoverStartDelay1, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTimer_RecoverStartDelay1OnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ScalerResourceTimer_RecoverStartDelay1, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTimer_RecoverStartDelay1OnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ScalerResourceTimer_RecoverStartDelay1, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTimer_RecoverStartDelay1OnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ScalerResourceTimer_RecoverStartDelay1, bFixedFrame, bMustHandleAll);
}
void __MonitorScalerResourceTimer_RecoverStartDelay1Lifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ScalerResourceTimer_RecoverStartDelay1, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceTimer_RecoverStartDelay1Activity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ScalerResourceTimer_RecoverStartDelay1, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceTimer_RecoverStartDelay1Modification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ScalerResourceTimer_RecoverStartDelay1, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ScalerResourceTimer_RecoverStartDelay2
{
UFUNCTION()
bool HasScalerResourceTimer_RecoverStartDelay2(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay2);
}
FC_ScalerResourceTimer_RecoverStartDelay2& AssignScalerResourceTimer_RecoverStartDelay2(const FECSEntity &inout Entity, const FC_ScalerResourceTimer_RecoverStartDelay2 &inout DefaultValue = FC_ScalerResourceTimer_RecoverStartDelay2())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay2, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignScalerResourceTimer_RecoverStartDelay2_BP(const FECSEntity &inout Entity, const FC_ScalerResourceTimer_RecoverStartDelay2 &inout DefaultValue = FC_ScalerResourceTimer_RecoverStartDelay2())
{
    ECSFunc_FC_ScalerResourceTimer_RecoverStartDelay2::AssignScalerResourceTimer_RecoverStartDelay2(Entity, DefaultValue);
    return;
}
FC_ScalerResourceTimer_RecoverStartDelay2& ModifyScalerResourceTimer_RecoverStartDelay2(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay2));
    return local_12.GetComp();
}
FC_ScalerResourceTimer_RecoverStartDelay2& ModifyOrAddScalerResourceTimer_RecoverStartDelay2(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay2));
    return local_12.GetComp();
}
const FC_ScalerResourceTimer_RecoverStartDelay2& GetScalerResourceTimer_RecoverStartDelay2(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay2));
    return local_12.GetComp();
}
UFUNCTION()
FC_ScalerResourceTimer_RecoverStartDelay2 GetScalerResourceTimer_RecoverStartDelay2_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ScalerResourceTimer_RecoverStartDelay2& local_4 = ECSFunc_FC_ScalerResourceTimer_RecoverStartDelay2::GetScalerResourceTimer_RecoverStartDelay2(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ScalerResourceTimer_RecoverStartDelay2();
}
const FC_ScalerResourceTimer_RecoverStartDelay2 GetDefaultedScalerResourceTimer_RecoverStartDelay2(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ScalerResourceTimer_RecoverStartDelay2 __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay2);
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
FC_ScalerResourceTimer_RecoverStartDelay2 GetDefaultedScalerResourceTimer_RecoverStartDelay2_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ScalerResourceTimer_RecoverStartDelay2::GetDefaultedScalerResourceTimer_RecoverStartDelay2(Entity);
}
UFUNCTION()
bool RemoveScalerResourceTimer_RecoverStartDelay2(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTimer_RecoverStartDelay2);
}
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTimer_RecoverStartDelay2OnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ScalerResourceTimer_RecoverStartDelay2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTimer_RecoverStartDelay2OnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ScalerResourceTimer_RecoverStartDelay2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTimer_RecoverStartDelay2OnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ScalerResourceTimer_RecoverStartDelay2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTimer_RecoverStartDelay2OnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ScalerResourceTimer_RecoverStartDelay2, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTimer_RecoverStartDelay2OnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ScalerResourceTimer_RecoverStartDelay2, bFixedFrame, bMustHandleAll);
}
void __MonitorScalerResourceTimer_RecoverStartDelay2Lifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ScalerResourceTimer_RecoverStartDelay2, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceTimer_RecoverStartDelay2Activity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ScalerResourceTimer_RecoverStartDelay2, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceTimer_RecoverStartDelay2Modification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ScalerResourceTimer_RecoverStartDelay2, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ScalerResourceRuntime
{
UFUNCTION()
bool HasScalerResourceRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceRuntime);
}
FC_ScalerResourceRuntime& AssignScalerResourceRuntime(const FECSEntity &inout Entity, const FC_ScalerResourceRuntime &inout DefaultValue = FC_ScalerResourceRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignScalerResourceRuntime_BP(const FECSEntity &inout Entity, const FC_ScalerResourceRuntime &inout DefaultValue = FC_ScalerResourceRuntime())
{
    ECSFunc_FC_ScalerResourceRuntime::AssignScalerResourceRuntime(Entity, DefaultValue);
    return;
}
FC_ScalerResourceRuntime& ModifyScalerResourceRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceRuntime));
    return local_12.GetComp();
}
FC_ScalerResourceRuntime& ModifyOrAddScalerResourceRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceRuntime));
    return local_12.GetComp();
}
const FC_ScalerResourceRuntime& GetScalerResourceRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_ScalerResourceRuntime GetScalerResourceRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ScalerResourceRuntime& local_4 = ECSFunc_FC_ScalerResourceRuntime::GetScalerResourceRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ScalerResourceRuntime();
}
const FC_ScalerResourceRuntime GetDefaultedScalerResourceRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ScalerResourceRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceRuntime);
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
FC_ScalerResourceRuntime GetDefaultedScalerResourceRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ScalerResourceRuntime::GetDefaultedScalerResourceRuntime(Entity);
}
UFUNCTION()
bool RemoveScalerResourceRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorScalerResourceRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ScalerResourceRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ScalerResourceRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ScalerResourceRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ScalerResourceRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ScalerResourceRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorScalerResourceRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ScalerResourceRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ScalerResourceRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ScalerResourceRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ScalerResourceInfoTransferredToOwner
{
UFUNCTION()
bool HasScalerResourceInfoTransferredToOwner(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceInfoTransferredToOwner);
}
FC_ScalerResourceInfoTransferredToOwner& AssignScalerResourceInfoTransferredToOwner(const FECSEntity &inout Entity, const FC_ScalerResourceInfoTransferredToOwner &inout DefaultValue = FC_ScalerResourceInfoTransferredToOwner())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceInfoTransferredToOwner, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignScalerResourceInfoTransferredToOwner_BP(const FECSEntity &inout Entity, const FC_ScalerResourceInfoTransferredToOwner &inout DefaultValue = FC_ScalerResourceInfoTransferredToOwner())
{
    ECSFunc_FC_ScalerResourceInfoTransferredToOwner::AssignScalerResourceInfoTransferredToOwner(Entity, DefaultValue);
    return;
}
FC_ScalerResourceInfoTransferredToOwner& ModifyScalerResourceInfoTransferredToOwner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceInfoTransferredToOwner));
    return local_12.GetComp();
}
FC_ScalerResourceInfoTransferredToOwner& ModifyOrAddScalerResourceInfoTransferredToOwner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceInfoTransferredToOwner));
    return local_12.GetComp();
}
const FC_ScalerResourceInfoTransferredToOwner& GetScalerResourceInfoTransferredToOwner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceInfoTransferredToOwner));
    return local_12.GetComp();
}
UFUNCTION()
FC_ScalerResourceInfoTransferredToOwner GetScalerResourceInfoTransferredToOwner_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ScalerResourceInfoTransferredToOwner& local_4 = ECSFunc_FC_ScalerResourceInfoTransferredToOwner::GetScalerResourceInfoTransferredToOwner(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ScalerResourceInfoTransferredToOwner();
}
const FC_ScalerResourceInfoTransferredToOwner GetDefaultedScalerResourceInfoTransferredToOwner(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ScalerResourceInfoTransferredToOwner __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceInfoTransferredToOwner);
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
FC_ScalerResourceInfoTransferredToOwner GetDefaultedScalerResourceInfoTransferredToOwner_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ScalerResourceInfoTransferredToOwner::GetDefaultedScalerResourceInfoTransferredToOwner(Entity);
}
UFUNCTION()
bool RemoveScalerResourceInfoTransferredToOwner(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceInfoTransferredToOwner);
}
}
FECSMonitorRuntimeView __GetMonitorScalerResourceInfoTransferredToOwnerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ScalerResourceInfoTransferredToOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceInfoTransferredToOwnerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ScalerResourceInfoTransferredToOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceInfoTransferredToOwnerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ScalerResourceInfoTransferredToOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceInfoTransferredToOwnerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ScalerResourceInfoTransferredToOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceInfoTransferredToOwnerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ScalerResourceInfoTransferredToOwner, bFixedFrame, bMustHandleAll);
}
void __MonitorScalerResourceInfoTransferredToOwnerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ScalerResourceInfoTransferredToOwner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceInfoTransferredToOwnerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ScalerResourceInfoTransferredToOwner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceInfoTransferredToOwnerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ScalerResourceInfoTransferredToOwner, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ScalerResourceConfig
{
UFUNCTION()
bool HasScalerResourceConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceConfig);
}
FC_ScalerResourceConfig& AssignScalerResourceConfig(const FECSEntity &inout Entity, const FC_ScalerResourceConfig &inout DefaultValue = FC_ScalerResourceConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignScalerResourceConfig_BP(const FECSEntity &inout Entity, const FC_ScalerResourceConfig &inout DefaultValue = FC_ScalerResourceConfig())
{
    ECSFunc_FC_ScalerResourceConfig::AssignScalerResourceConfig(Entity, DefaultValue);
    return;
}
FC_ScalerResourceConfig& ModifyScalerResourceConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceConfig));
    return local_12.GetComp();
}
FC_ScalerResourceConfig& ModifyOrAddScalerResourceConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceConfig));
    return local_12.GetComp();
}
const FC_ScalerResourceConfig& GetScalerResourceConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ScalerResourceConfig GetScalerResourceConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ScalerResourceConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_ScalerResourceConfig::GetScalerResourceConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ScalerResourceConfig GetDefaultedScalerResourceConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ScalerResourceConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceConfig);
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
FC_ScalerResourceConfig GetDefaultedScalerResourceConfig_BP(const FECSEntity &inout Entity)
{
    FC_ScalerResourceConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveScalerResourceConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceConfig);
}
}
FECSMonitorRuntimeView __GetMonitorScalerResourceConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ScalerResourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ScalerResourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ScalerResourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ScalerResourceConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ScalerResourceConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorScalerResourceConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ScalerResourceConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ScalerResourceConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ScalerResourceConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ScalerResourceRecoverDelayTag
{
UFUNCTION()
bool HasScalerResourceRecoverDelayTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceRecoverDelayTag);
}
FC_ScalerResourceRecoverDelayTag& AssignScalerResourceRecoverDelayTag(const FECSEntity &inout Entity, const FC_ScalerResourceRecoverDelayTag &inout DefaultValue = FC_ScalerResourceRecoverDelayTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceRecoverDelayTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignScalerResourceRecoverDelayTag_BP(const FECSEntity &inout Entity, const FC_ScalerResourceRecoverDelayTag &inout DefaultValue = FC_ScalerResourceRecoverDelayTag())
{
    ECSFunc_FC_ScalerResourceRecoverDelayTag::AssignScalerResourceRecoverDelayTag(Entity, DefaultValue);
    return;
}
FC_ScalerResourceRecoverDelayTag& ModifyScalerResourceRecoverDelayTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceRecoverDelayTag));
    return local_12.GetComp();
}
FC_ScalerResourceRecoverDelayTag& ModifyOrAddScalerResourceRecoverDelayTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceRecoverDelayTag));
    return local_12.GetComp();
}
const FC_ScalerResourceRecoverDelayTag& GetScalerResourceRecoverDelayTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceRecoverDelayTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ScalerResourceRecoverDelayTag GetScalerResourceRecoverDelayTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ScalerResourceRecoverDelayTag& local_4 = ECSFunc_FC_ScalerResourceRecoverDelayTag::GetScalerResourceRecoverDelayTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ScalerResourceRecoverDelayTag();
}
const FC_ScalerResourceRecoverDelayTag GetDefaultedScalerResourceRecoverDelayTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ScalerResourceRecoverDelayTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceRecoverDelayTag);
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
FC_ScalerResourceRecoverDelayTag GetDefaultedScalerResourceRecoverDelayTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ScalerResourceRecoverDelayTag::GetDefaultedScalerResourceRecoverDelayTag(Entity);
}
UFUNCTION()
bool RemoveScalerResourceRecoverDelayTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceRecoverDelayTag);
}
}
FECSMonitorRuntimeView __GetMonitorScalerResourceRecoverDelayTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ScalerResourceRecoverDelayTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceRecoverDelayTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ScalerResourceRecoverDelayTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceRecoverDelayTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ScalerResourceRecoverDelayTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceRecoverDelayTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ScalerResourceRecoverDelayTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceRecoverDelayTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ScalerResourceRecoverDelayTag, bFixedFrame, bMustHandleAll);
}
void __MonitorScalerResourceRecoverDelayTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ScalerResourceRecoverDelayTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceRecoverDelayTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ScalerResourceRecoverDelayTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceRecoverDelayTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ScalerResourceRecoverDelayTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ScalerResource0RecoveringTag
{
UFUNCTION()
bool HasScalerResource0RecoveringTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource0RecoveringTag);
}
FC_ScalerResource0RecoveringTag& AssignScalerResource0RecoveringTag(const FECSEntity &inout Entity, const FC_ScalerResource0RecoveringTag &inout DefaultValue = FC_ScalerResource0RecoveringTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource0RecoveringTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignScalerResource0RecoveringTag_BP(const FECSEntity &inout Entity, const FC_ScalerResource0RecoveringTag &inout DefaultValue = FC_ScalerResource0RecoveringTag())
{
    ECSFunc_FC_ScalerResource0RecoveringTag::AssignScalerResource0RecoveringTag(Entity, DefaultValue);
    return;
}
FC_ScalerResource0RecoveringTag& ModifyScalerResource0RecoveringTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource0RecoveringTag));
    return local_12.GetComp();
}
FC_ScalerResource0RecoveringTag& ModifyOrAddScalerResource0RecoveringTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource0RecoveringTag));
    return local_12.GetComp();
}
const FC_ScalerResource0RecoveringTag& GetScalerResource0RecoveringTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource0RecoveringTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ScalerResource0RecoveringTag GetScalerResource0RecoveringTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ScalerResource0RecoveringTag& local_4 = ECSFunc_FC_ScalerResource0RecoveringTag::GetScalerResource0RecoveringTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ScalerResource0RecoveringTag();
}
const FC_ScalerResource0RecoveringTag GetDefaultedScalerResource0RecoveringTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ScalerResource0RecoveringTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource0RecoveringTag);
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
FC_ScalerResource0RecoveringTag GetDefaultedScalerResource0RecoveringTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ScalerResource0RecoveringTag::GetDefaultedScalerResource0RecoveringTag(Entity);
}
UFUNCTION()
bool RemoveScalerResource0RecoveringTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource0RecoveringTag);
}
}
FECSMonitorRuntimeView __GetMonitorScalerResource0RecoveringTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ScalerResource0RecoveringTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource0RecoveringTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ScalerResource0RecoveringTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource0RecoveringTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ScalerResource0RecoveringTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource0RecoveringTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ScalerResource0RecoveringTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource0RecoveringTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ScalerResource0RecoveringTag, bFixedFrame, bMustHandleAll);
}
void __MonitorScalerResource0RecoveringTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ScalerResource0RecoveringTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResource0RecoveringTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ScalerResource0RecoveringTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResource0RecoveringTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ScalerResource0RecoveringTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ScalerResource1RecoveringTag
{
UFUNCTION()
bool HasScalerResource1RecoveringTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource1RecoveringTag);
}
FC_ScalerResource1RecoveringTag& AssignScalerResource1RecoveringTag(const FECSEntity &inout Entity, const FC_ScalerResource1RecoveringTag &inout DefaultValue = FC_ScalerResource1RecoveringTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource1RecoveringTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignScalerResource1RecoveringTag_BP(const FECSEntity &inout Entity, const FC_ScalerResource1RecoveringTag &inout DefaultValue = FC_ScalerResource1RecoveringTag())
{
    ECSFunc_FC_ScalerResource1RecoveringTag::AssignScalerResource1RecoveringTag(Entity, DefaultValue);
    return;
}
FC_ScalerResource1RecoveringTag& ModifyScalerResource1RecoveringTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource1RecoveringTag));
    return local_12.GetComp();
}
FC_ScalerResource1RecoveringTag& ModifyOrAddScalerResource1RecoveringTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource1RecoveringTag));
    return local_12.GetComp();
}
const FC_ScalerResource1RecoveringTag& GetScalerResource1RecoveringTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource1RecoveringTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ScalerResource1RecoveringTag GetScalerResource1RecoveringTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ScalerResource1RecoveringTag& local_4 = ECSFunc_FC_ScalerResource1RecoveringTag::GetScalerResource1RecoveringTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ScalerResource1RecoveringTag();
}
const FC_ScalerResource1RecoveringTag GetDefaultedScalerResource1RecoveringTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ScalerResource1RecoveringTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource1RecoveringTag);
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
FC_ScalerResource1RecoveringTag GetDefaultedScalerResource1RecoveringTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ScalerResource1RecoveringTag::GetDefaultedScalerResource1RecoveringTag(Entity);
}
UFUNCTION()
bool RemoveScalerResource1RecoveringTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource1RecoveringTag);
}
}
FECSMonitorRuntimeView __GetMonitorScalerResource1RecoveringTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ScalerResource1RecoveringTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource1RecoveringTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ScalerResource1RecoveringTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource1RecoveringTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ScalerResource1RecoveringTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource1RecoveringTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ScalerResource1RecoveringTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource1RecoveringTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ScalerResource1RecoveringTag, bFixedFrame, bMustHandleAll);
}
void __MonitorScalerResource1RecoveringTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ScalerResource1RecoveringTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResource1RecoveringTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ScalerResource1RecoveringTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResource1RecoveringTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ScalerResource1RecoveringTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ScalerResource2RecoveringTag
{
UFUNCTION()
bool HasScalerResource2RecoveringTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource2RecoveringTag);
}
FC_ScalerResource2RecoveringTag& AssignScalerResource2RecoveringTag(const FECSEntity &inout Entity, const FC_ScalerResource2RecoveringTag &inout DefaultValue = FC_ScalerResource2RecoveringTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource2RecoveringTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignScalerResource2RecoveringTag_BP(const FECSEntity &inout Entity, const FC_ScalerResource2RecoveringTag &inout DefaultValue = FC_ScalerResource2RecoveringTag())
{
    ECSFunc_FC_ScalerResource2RecoveringTag::AssignScalerResource2RecoveringTag(Entity, DefaultValue);
    return;
}
FC_ScalerResource2RecoveringTag& ModifyScalerResource2RecoveringTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource2RecoveringTag));
    return local_12.GetComp();
}
FC_ScalerResource2RecoveringTag& ModifyOrAddScalerResource2RecoveringTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource2RecoveringTag));
    return local_12.GetComp();
}
const FC_ScalerResource2RecoveringTag& GetScalerResource2RecoveringTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource2RecoveringTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ScalerResource2RecoveringTag GetScalerResource2RecoveringTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ScalerResource2RecoveringTag& local_4 = ECSFunc_FC_ScalerResource2RecoveringTag::GetScalerResource2RecoveringTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ScalerResource2RecoveringTag();
}
const FC_ScalerResource2RecoveringTag GetDefaultedScalerResource2RecoveringTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ScalerResource2RecoveringTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource2RecoveringTag);
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
FC_ScalerResource2RecoveringTag GetDefaultedScalerResource2RecoveringTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ScalerResource2RecoveringTag::GetDefaultedScalerResource2RecoveringTag(Entity);
}
UFUNCTION()
bool RemoveScalerResource2RecoveringTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource2RecoveringTag);
}
}
FECSMonitorRuntimeView __GetMonitorScalerResource2RecoveringTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ScalerResource2RecoveringTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource2RecoveringTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ScalerResource2RecoveringTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource2RecoveringTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ScalerResource2RecoveringTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource2RecoveringTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ScalerResource2RecoveringTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource2RecoveringTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ScalerResource2RecoveringTag, bFixedFrame, bMustHandleAll);
}
void __MonitorScalerResource2RecoveringTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ScalerResource2RecoveringTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResource2RecoveringTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ScalerResource2RecoveringTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResource2RecoveringTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ScalerResource2RecoveringTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ScalerResource0CanRecoverTag
{
UFUNCTION()
bool HasScalerResource0CanRecoverTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource0CanRecoverTag);
}
FC_ScalerResource0CanRecoverTag& AssignScalerResource0CanRecoverTag(const FECSEntity &inout Entity, const FC_ScalerResource0CanRecoverTag &inout DefaultValue = FC_ScalerResource0CanRecoverTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource0CanRecoverTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignScalerResource0CanRecoverTag_BP(const FECSEntity &inout Entity, const FC_ScalerResource0CanRecoverTag &inout DefaultValue = FC_ScalerResource0CanRecoverTag())
{
    ECSFunc_FC_ScalerResource0CanRecoverTag::AssignScalerResource0CanRecoverTag(Entity, DefaultValue);
    return;
}
FC_ScalerResource0CanRecoverTag& ModifyScalerResource0CanRecoverTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource0CanRecoverTag));
    return local_12.GetComp();
}
FC_ScalerResource0CanRecoverTag& ModifyOrAddScalerResource0CanRecoverTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource0CanRecoverTag));
    return local_12.GetComp();
}
const FC_ScalerResource0CanRecoverTag& GetScalerResource0CanRecoverTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource0CanRecoverTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ScalerResource0CanRecoverTag GetScalerResource0CanRecoverTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ScalerResource0CanRecoverTag& local_4 = ECSFunc_FC_ScalerResource0CanRecoverTag::GetScalerResource0CanRecoverTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ScalerResource0CanRecoverTag();
}
const FC_ScalerResource0CanRecoverTag GetDefaultedScalerResource0CanRecoverTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ScalerResource0CanRecoverTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource0CanRecoverTag);
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
FC_ScalerResource0CanRecoverTag GetDefaultedScalerResource0CanRecoverTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ScalerResource0CanRecoverTag::GetDefaultedScalerResource0CanRecoverTag(Entity);
}
UFUNCTION()
bool RemoveScalerResource0CanRecoverTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource0CanRecoverTag);
}
}
FECSMonitorRuntimeView __GetMonitorScalerResource0CanRecoverTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ScalerResource0CanRecoverTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource0CanRecoverTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ScalerResource0CanRecoverTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource0CanRecoverTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ScalerResource0CanRecoverTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource0CanRecoverTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ScalerResource0CanRecoverTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource0CanRecoverTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ScalerResource0CanRecoverTag, bFixedFrame, bMustHandleAll);
}
void __MonitorScalerResource0CanRecoverTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ScalerResource0CanRecoverTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResource0CanRecoverTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ScalerResource0CanRecoverTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResource0CanRecoverTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ScalerResource0CanRecoverTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ScalerResource1CanRecoverTag
{
UFUNCTION()
bool HasScalerResource1CanRecoverTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource1CanRecoverTag);
}
FC_ScalerResource1CanRecoverTag& AssignScalerResource1CanRecoverTag(const FECSEntity &inout Entity, const FC_ScalerResource1CanRecoverTag &inout DefaultValue = FC_ScalerResource1CanRecoverTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource1CanRecoverTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignScalerResource1CanRecoverTag_BP(const FECSEntity &inout Entity, const FC_ScalerResource1CanRecoverTag &inout DefaultValue = FC_ScalerResource1CanRecoverTag())
{
    ECSFunc_FC_ScalerResource1CanRecoverTag::AssignScalerResource1CanRecoverTag(Entity, DefaultValue);
    return;
}
FC_ScalerResource1CanRecoverTag& ModifyScalerResource1CanRecoverTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource1CanRecoverTag));
    return local_12.GetComp();
}
FC_ScalerResource1CanRecoverTag& ModifyOrAddScalerResource1CanRecoverTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource1CanRecoverTag));
    return local_12.GetComp();
}
const FC_ScalerResource1CanRecoverTag& GetScalerResource1CanRecoverTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource1CanRecoverTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ScalerResource1CanRecoverTag GetScalerResource1CanRecoverTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ScalerResource1CanRecoverTag& local_4 = ECSFunc_FC_ScalerResource1CanRecoverTag::GetScalerResource1CanRecoverTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ScalerResource1CanRecoverTag();
}
const FC_ScalerResource1CanRecoverTag GetDefaultedScalerResource1CanRecoverTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ScalerResource1CanRecoverTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource1CanRecoverTag);
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
FC_ScalerResource1CanRecoverTag GetDefaultedScalerResource1CanRecoverTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ScalerResource1CanRecoverTag::GetDefaultedScalerResource1CanRecoverTag(Entity);
}
UFUNCTION()
bool RemoveScalerResource1CanRecoverTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource1CanRecoverTag);
}
}
FECSMonitorRuntimeView __GetMonitorScalerResource1CanRecoverTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ScalerResource1CanRecoverTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource1CanRecoverTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ScalerResource1CanRecoverTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource1CanRecoverTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ScalerResource1CanRecoverTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource1CanRecoverTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ScalerResource1CanRecoverTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource1CanRecoverTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ScalerResource1CanRecoverTag, bFixedFrame, bMustHandleAll);
}
void __MonitorScalerResource1CanRecoverTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ScalerResource1CanRecoverTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResource1CanRecoverTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ScalerResource1CanRecoverTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResource1CanRecoverTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ScalerResource1CanRecoverTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ScalerResource2CanRecoverTag
{
UFUNCTION()
bool HasScalerResource2CanRecoverTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource2CanRecoverTag);
}
FC_ScalerResource2CanRecoverTag& AssignScalerResource2CanRecoverTag(const FECSEntity &inout Entity, const FC_ScalerResource2CanRecoverTag &inout DefaultValue = FC_ScalerResource2CanRecoverTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource2CanRecoverTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignScalerResource2CanRecoverTag_BP(const FECSEntity &inout Entity, const FC_ScalerResource2CanRecoverTag &inout DefaultValue = FC_ScalerResource2CanRecoverTag())
{
    ECSFunc_FC_ScalerResource2CanRecoverTag::AssignScalerResource2CanRecoverTag(Entity, DefaultValue);
    return;
}
FC_ScalerResource2CanRecoverTag& ModifyScalerResource2CanRecoverTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource2CanRecoverTag));
    return local_12.GetComp();
}
FC_ScalerResource2CanRecoverTag& ModifyOrAddScalerResource2CanRecoverTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource2CanRecoverTag));
    return local_12.GetComp();
}
const FC_ScalerResource2CanRecoverTag& GetScalerResource2CanRecoverTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource2CanRecoverTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_ScalerResource2CanRecoverTag GetScalerResource2CanRecoverTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ScalerResource2CanRecoverTag& local_4 = ECSFunc_FC_ScalerResource2CanRecoverTag::GetScalerResource2CanRecoverTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ScalerResource2CanRecoverTag();
}
const FC_ScalerResource2CanRecoverTag GetDefaultedScalerResource2CanRecoverTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ScalerResource2CanRecoverTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource2CanRecoverTag);
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
FC_ScalerResource2CanRecoverTag GetDefaultedScalerResource2CanRecoverTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ScalerResource2CanRecoverTag::GetDefaultedScalerResource2CanRecoverTag(Entity);
}
UFUNCTION()
bool RemoveScalerResource2CanRecoverTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ScalerResource2CanRecoverTag);
}
}
FECSMonitorRuntimeView __GetMonitorScalerResource2CanRecoverTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ScalerResource2CanRecoverTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource2CanRecoverTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ScalerResource2CanRecoverTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource2CanRecoverTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ScalerResource2CanRecoverTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource2CanRecoverTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ScalerResource2CanRecoverTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResource2CanRecoverTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ScalerResource2CanRecoverTag, bFixedFrame, bMustHandleAll);
}
void __MonitorScalerResource2CanRecoverTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ScalerResource2CanRecoverTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResource2CanRecoverTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ScalerResource2CanRecoverTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResource2CanRecoverTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ScalerResource2CanRecoverTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ScalerResourceTransferToOwner
{
UFUNCTION()
bool HasScalerResourceTransferToOwner(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTransferToOwner);
}
FC_ScalerResourceTransferToOwner& AssignScalerResourceTransferToOwner(const FECSEntity &inout Entity, const FC_ScalerResourceTransferToOwner &inout DefaultValue = FC_ScalerResourceTransferToOwner())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTransferToOwner, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignScalerResourceTransferToOwner_BP(const FECSEntity &inout Entity, const FC_ScalerResourceTransferToOwner &inout DefaultValue = FC_ScalerResourceTransferToOwner())
{
    ECSFunc_FC_ScalerResourceTransferToOwner::AssignScalerResourceTransferToOwner(Entity, DefaultValue);
    return;
}
FC_ScalerResourceTransferToOwner& ModifyScalerResourceTransferToOwner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTransferToOwner));
    return local_12.GetComp();
}
FC_ScalerResourceTransferToOwner& ModifyOrAddScalerResourceTransferToOwner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTransferToOwner));
    return local_12.GetComp();
}
const FC_ScalerResourceTransferToOwner& GetScalerResourceTransferToOwner(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTransferToOwner));
    return local_12.GetComp();
}
UFUNCTION()
FC_ScalerResourceTransferToOwner GetScalerResourceTransferToOwner_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ScalerResourceTransferToOwner& local_4 = ECSFunc_FC_ScalerResourceTransferToOwner::GetScalerResourceTransferToOwner(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ScalerResourceTransferToOwner();
}
const FC_ScalerResourceTransferToOwner GetDefaultedScalerResourceTransferToOwner(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ScalerResourceTransferToOwner __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTransferToOwner);
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
FC_ScalerResourceTransferToOwner GetDefaultedScalerResourceTransferToOwner_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ScalerResourceTransferToOwner::GetDefaultedScalerResourceTransferToOwner(Entity);
}
UFUNCTION()
bool RemoveScalerResourceTransferToOwner(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ScalerResourceTransferToOwner);
}
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTransferToOwnerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ScalerResourceTransferToOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTransferToOwnerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ScalerResourceTransferToOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTransferToOwnerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ScalerResourceTransferToOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTransferToOwnerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ScalerResourceTransferToOwner, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorScalerResourceTransferToOwnerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ScalerResourceTransferToOwner, bFixedFrame, bMustHandleAll);
}
void __MonitorScalerResourceTransferToOwnerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ScalerResourceTransferToOwner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceTransferToOwnerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ScalerResourceTransferToOwner, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorScalerResourceTransferToOwnerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ScalerResourceTransferToOwner, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_ScalerResourceInfoTransferredToOwner_bInited(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetbInited();
    return;
}
void GetEntityBBVar_ScalerResourceRuntime_GetScalerResourceValue0(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceValue0();
    return;
}
void GetEntityBBVar_ScalerResourceRuntime_GetScalerResourceValue1(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceValue1();
    return;
}
void GetEntityBBVar_ScalerResourceRuntime_GetScalerResourceValue2(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceValue2();
    return;
}
void GetEntityBBVar_ScalerResourceInfoTransferredToOwner_GetScalerResourceValue0(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceValue0();
    return;
}
void GetEntityBBVar_ScalerResourceInfoTransferredToOwner_GetScalerResourceValue1(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceValue1();
    return;
}
void GetEntityBBVar_ScalerResourceInfoTransferredToOwner_GetScalerResourceValue2(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceValue2();
    return;
}
void GetEntityBBVar_ScalerResourceInfoTransferredToOwner_GetScalerResourceConsumeExtreme0(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceConsumeExtreme0();
    return;
}
void GetEntityBBVar_ScalerResourceInfoTransferredToOwner_GetScalerResourceConsumeExtreme1(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceConsumeExtreme1();
    return;
}
void GetEntityBBVar_ScalerResourceInfoTransferredToOwner_GetScalerResourceConsumeExtreme2(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceConsumeExtreme2();
    return;
}
void GetEntityBBVar_ScalerResourceInfoTransferredToOwner_GetScalerResourceRecoverExtreme0(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceRecoverExtreme0();
    return;
}
void GetEntityBBVar_ScalerResourceInfoTransferredToOwner_GetScalerResourceRecoverExtreme1(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceRecoverExtreme1();
    return;
}
void GetEntityBBVar_ScalerResourceInfoTransferredToOwner_GetScalerResourceRecoverExtreme2(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceRecoverExtreme2();
    return;
}
void GetEntityBBVar_ScalerResourceConfig_GetScalerResourceConsumeExtreme0(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceConsumeExtreme0();
    return;
}
void GetEntityBBVar_ScalerResourceConfig_GetScalerResourceConsumeExtreme1(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceConsumeExtreme1();
    return;
}
void GetEntityBBVar_ScalerResourceConfig_GetScalerResourceConsumeExtreme2(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceConsumeExtreme2();
    return;
}
void GetEntityBBVar_ScalerResourceConfig_GetScalerResourceRecoverExtreme0(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceRecoverExtreme0();
    return;
}
void GetEntityBBVar_ScalerResourceConfig_GetScalerResourceRecoverExtreme1(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceRecoverExtreme1();
    return;
}
void GetEntityBBVar_ScalerResourceConfig_GetScalerResourceRecoverExtreme2(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().GetScalerResourceRecoverExtreme2();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ScalerResourceTimer_RecoverStartDelay0 &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ScalerResourceTimer_RecoverStartDelay0 &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ScalerResourceTimer_RecoverStartDelay0 &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ScalerResourceTimer_RecoverStartDelay0
{
int __IndexOf_TargetWorldTime()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ScalerResourceTimer_RecoverStartDelay1 &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ScalerResourceTimer_RecoverStartDelay1 &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ScalerResourceTimer_RecoverStartDelay1 &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ScalerResourceTimer_RecoverStartDelay1
{
int __IndexOf_TargetWorldTime()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ScalerResourceTimer_RecoverStartDelay2 &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ScalerResourceTimer_RecoverStartDelay2 &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ScalerResourceTimer_RecoverStartDelay2 &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ScalerResourceTimer_RecoverStartDelay2
{
int __IndexOf_TargetWorldTime()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ScalerResourceRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ScalerResourceRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ScalerResourceRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ScalerResourceRuntime
{
int __IndexOf_Values()
{
    return 0;
}
int __IndexOf_CurrentFixedTickChangedBitMask()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ScalerResourceInfoTransferredToOwner &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ScalerResourceInfoTransferredToOwner &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ScalerResourceInfoTransferredToOwner &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ScalerResourceInfoTransferredToOwner
{
int __IndexOf_Values()
{
    return 0;
}
int __IndexOf_ConsumeExtremes()
{
    return 1;
}
int __IndexOf_RecoverExtremes()
{
    return 2;
}
int __IndexOf_bInited()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ScalerResourceTransferToOwner &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ScalerResourceTransferToOwner &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ScalerResourceTransferToOwner &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ScalerResourceTransferToOwner
{
int __IndexOf_OwnerCacheId()
{
    return 0;
}
}

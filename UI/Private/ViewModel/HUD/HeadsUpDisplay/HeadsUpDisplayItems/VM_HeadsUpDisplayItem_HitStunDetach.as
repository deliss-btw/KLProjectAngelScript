
namespace FVM_HeadsUpDisplayItem_HitStunDetach
{
    const int ModelId = 0;

}
struct FVM_HeadsUpDisplayItem_HitStunDetach : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    ESlateVisibility m_Visibility;
    UPROPERTY()
    float32 m_TargetHitStunDetachRatio;
    UPROPERTY()
    float32 m_HitStunDetachRatio;
    UPROPERTY()
    float32 m_DelayRemoveTime;
    UPROPERTY()
    float32 m_ToRemoveTime;
    UPROPERTY()
    float32 m_InterpSpeed;
    UPROPERTY()
    FECSEntity m_ValidEntity;
    UPROPERTY()
    FMW_InterpFloat m_HitStunDetachInterpSource;
    UPROPERTY()
    bool m_bConditionsMet;
    UPROPERTY()
    float32 CachedTargetRatio;

    FVM_HeadsUpDisplayItem_HitStunDetach()
    {
        this.m_Visibility = ESlateVisibility(1);
        this.m_TargetHitStunDetachRatio = 0.0f;
        this.m_HitStunDetachRatio = 0.0f;
        this.m_DelayRemoveTime = 2.0f;
        this.m_ToRemoveTime = -1.0f;
        this.m_InterpSpeed = 4.0f;
        this.m_bConditionsMet = false;
        this.CachedTargetRatio = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_HeadsUpDisplayItem_HitStunDetach' by default constructor.");
        return;
    }
    FVM_HeadsUpDisplayItem_HitStunDetach(const FVM_HeadsUpDisplayItem_HitStunDetach &inout Other)
    {
        this.m_Visibility = ESlateVisibility(1);
        this.m_TargetHitStunDetachRatio = 0.0f;
        this.m_HitStunDetachRatio = 0.0f;
        this.m_DelayRemoveTime = 2.0f;
        this.m_ToRemoveTime = -1.0f;
        this.m_InterpSpeed = 4.0f;
        this.m_bConditionsMet = false;
        this.CachedTargetRatio = 0.0f;
        this.m_Spot = Other.m_Spot;
        this.m_Visibility = Other.m_Visibility;
        this.m_TargetHitStunDetachRatio = Other.m_TargetHitStunDetachRatio;
        this.m_HitStunDetachRatio = Other.m_HitStunDetachRatio;
        this.m_DelayRemoveTime = Other.m_DelayRemoveTime;
        this.m_ToRemoveTime = Other.m_ToRemoveTime;
        this.m_InterpSpeed = Other.m_InterpSpeed;
        this.m_ValidEntity = Other.m_ValidEntity;
        this.m_HitStunDetachInterpSource = Other.m_HitStunDetachInterpSource;
        this.m_bConditionsMet = Other.m_bConditionsMet;
        return;
    }
    FVM_HeadsUpDisplayItem_HitStunDetach(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        this.m_Visibility = ESlateVisibility(1);
        this.m_TargetHitStunDetachRatio = 0.0f;
        this.m_HitStunDetachRatio = 0.0f;
        this.m_DelayRemoveTime = 2.0f;
        this.m_ToRemoveTime = -1.0f;
        this.m_InterpSpeed = 4.0f;
        this.m_bConditionsMet = false;
        this.CachedTargetRatio = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_HeadsUpDisplayItem_HitStunDetach opAssign(const FVM_HeadsUpDisplayItem_HitStunDetach &inout Other)
    {
        FVM_HeadsUpDisplayItem_HitStunDetach __r;
        this.m_Spot = Other.m_Spot;
        this.m_Visibility = Other.m_Visibility;
        this.m_TargetHitStunDetachRatio = Other.m_TargetHitStunDetachRatio;
        this.m_HitStunDetachRatio = Other.m_HitStunDetachRatio;
        this.m_DelayRemoveTime = Other.m_DelayRemoveTime;
        this.m_ToRemoveTime = Other.m_ToRemoveTime;
        this.m_InterpSpeed = Other.m_InterpSpeed;
        this.m_ValidEntity = Other.m_ValidEntity;
        this.m_HitStunDetachInterpSource = Other.m_HitStunDetachInterpSource;
        this.m_bConditionsMet = Other.m_bConditionsMet;
        return __r;
    }
    void Tick()
    {
        FECSEntity local_4 = FECSEntity(ENTITY_NULL);
        TEUIModelRef<FM_Spot> local_6 = this.GetSpot();
        if ((!((::GetOwnerEntityId() == ENTITY_ID_NULL))))
        {
            FECSEntity local_12 = FECSEntity(::GetOwnerEntityId(this.GetSpot().opArrow()));
            local_4 = ::FASCommonUtils::GetControlledPawnEntity(local_12);
        }
        if (local_4.IsValid())
        {
            if ((!((FECSEntity(this.GetValidEntity()) == local_4))))
            {
                this.SetValidEntity(local_4);
            }
        }
        else
        {
            if (this.GetValidEntity().IsValid())
            {
                this.SetValidEntity(ENTITY_NULL);
                this.GetModify_HitStunDetachInterpSource().SnapTo(0.0f);
            }
        }
        if (!(this.GetbConditionsMet()) || (this.GetContext().Time.ToSeconds() > this.GetToRemoveTime()))
        {
            this.SetVisibility(ESlateVisibility(1));
        }
        else
        {
            this.SetVisibility(ESlateVisibility(4));
        }
        return;
    }
    void RefreshHitStunDetachTarget()
    {
        int local_12 = 0;
        bool local_16;
        int local_34 = 0;
        if (!(this.GetValidEntity().IsValid()))
        {
            this.ResetTarget();
            return;
        }
        if (!(this.GetContext().GetLocalPlayerPawn().IsValid()))
        {
            this.ResetTarget();
            return;
        }
        if (!(local_12) || (int(local_12.GetGameModeType()) != 2 && (int(local_12.GetGameModeType()) != 1)))
        {
            this.ResetTarget();
            return;
        }
        if (int(::GetPrefabType(this.GetValidEntity())) == 2)
        {
            this.ResetTarget();
            return;
        }
        Has local_22;
        bool local_1 = local_22.opCall();
        if (local_1)
        {
            local_16 = true;
        }
        else
        {
            Has local_26;
            local_16 = local_26.opCall();
        }
        if (local_16)
        {
            this.ResetTarget();
            return;
        }
        if (int(::FASCommonUtils::GetEntityFactionRelation(this.GetValidEntity(), this.GetContext().GetLocalPlayerPawn())) != 2)
        {
            this.ResetTarget();
            return;
        }
        if (!(local_34))
        {
            this.ResetTarget();
            return;
        }
        float32 local_35 = ::DamageSettings::Get().HitStunDetachMax;
        if (local_35 <= 0.0f)
        {
            this.ResetTarget();
            return;
        }
        float32 local_43 = FMath::Clamp((local_34.GetAccumulatedDetachValue() / local_35), 0.0f, 1.0f);
        if (local_43 > this.CachedTargetRatio)
        {
            this.GetModify_HitStunDetachInterpSource().SnapTo(local_43);
            this.SetToRemoveTime(float32(this.GetContext().Time.ToSeconds()) + this.GetDelayRemoveTime());
        }
        else
        {
            if (local_43 < this.CachedTargetRatio)
            {
                this.GetModify_HitStunDetachInterpSource().SetInterpConstantTo(local_43, this.GetInterpSpeed(), 0.0001f);
            }
        }
        this.CachedTargetRatio = local_43;
        this.SetTargetHitStunDetachRatio(local_43);
        this.SetbConditionsMet(true);
        return;
    }
    void ResetTarget()
    {
        if (this.GetbConditionsMet() || ((this.CachedTargetRatio != 0.0f)))
        {
            this.CachedTargetRatio = 0.0f;
            this.SetTargetHitStunDetachRatio(0.0f);
            this.GetModify_HitStunDetachInterpSource().SnapTo(0.0f);
        }
        this.SetbConditionsMet(false);
        return;
    }
    void RefreshHitStunDetachDisplay()
    {
        float32 local_1 = 0.0f;
        this.SetHitStunDetachRatio(local_1);
        return;
    }
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Spot;
    }
    void SetSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_Spot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Spot = __Value;
        return;
    }
    ESlateVisibility GetVisibility() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Visibility;
    }
    void SetVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_Visibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Visibility = __Value;
        return;
    }
    const float32 GetTargetHitStunDetachRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_TargetHitStunDetachRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetTargetHitStunDetachRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TargetHitStunDetachRatio = __Value;
        return;
    }
    const float32 GetHitStunDetachRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_HitStunDetachRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetHitStunDetachRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_HitStunDetachRatio = __Value;
        return;
    }
    const float32 GetDelayRemoveTime() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_DelayRemoveTime() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetDelayRemoveTime(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DelayRemoveTime = __Value;
        return;
    }
    const float32 GetToRemoveTime() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_ToRemoveTime() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetToRemoveTime(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ToRemoveTime = __Value;
        return;
    }
    float32 GetInterpSpeed() const property
    {
        float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_InterpSpeed() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetInterpSpeed(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_InterpSpeed = __Value;
        return;
    }
    const FECSEntity GetValidEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FECSEntity GetModify_ValidEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetValidEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ValidEntity = __Value;
        return;
    }
    const FMW_InterpFloat GetHitStunDetachInterpSource() const property
    {
        const FMW_InterpFloat __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FMW_InterpFloat GetModify_HitStunDetachInterpSource() property
    {
        FMW_InterpFloat __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetHitStunDetachInterpSource(const FMW_InterpFloat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_HitStunDetachInterpSource = __Value;
        return;
    }
    bool GetbConditionsMet() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bConditionsMet;
    }
    void SetbConditionsMet(const bool __Value) property
    {
        if (!(this.m_bConditionsMet) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bConditionsMet = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_HeadsUpDisplayItem_HitStunDetach
{
    UPROPERTY()
    TEUIModelRef<FVM_HeadsUpDisplayItem_HitStunDetach> Self;

    __GeneratedProperties_FVM_HeadsUpDisplayItem_HitStunDetach()
    {
        return;
    }
}

namespace FVM_HeadsUpDisplayItem_HitStunDetach
{
FVM_HeadsUpDisplayItem_HitStunDetach& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_HeadsUpDisplayItem_HitStunDetach::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_HeadsUpDisplayItem_HitStunDetach CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_HeadsUpDisplayItem_HitStunDetach __r;
    TEUIModelRef<FVM_HeadsUpDisplayItem_HitStunDetach> local_6 = TEUIModelRef<FVM_HeadsUpDisplayItem_HitStunDetach>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_HeadsUpDisplayItem_HitStunDetach::ModelId, 0, Spot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Visibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TargetHitStunDetachRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HitStunDetachRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_HeadsUpDisplayItem_HitStunDetach>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_HeadsUpDisplayItem_HitStunDetach;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("HitStunDetachInterpSource");
    int local_2_2 = FVM_HeadsUpDisplayItem_HitStunDetach::__IndexOf_HitStunDetachInterpSource();
    Result.WatcherProperties.Add(local_19);
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "RefreshHitStunDetachTarget";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshHitStunDetachDisplay";
    Result.EffectFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_HeadsUpDisplayItem_HitStunDetach;
}
void __Tick(FVM_HeadsUpDisplayItem_HitStunDetach &inout Model)
{
    Model.Tick();
    return;
}
ESlateVisibility __UIGetter_Visibility(const FVM_HeadsUpDisplayItem_HitStunDetach &inout Model)
{
    return Model.GetVisibility();
}
float32 __UIGetter_TargetHitStunDetachRatio(const FVM_HeadsUpDisplayItem_HitStunDetach &inout Model)
{
    return Model.GetTargetHitStunDetachRatio();
}
float32 __UIGetter_HitStunDetachRatio(const FVM_HeadsUpDisplayItem_HitStunDetach &inout Model)
{
    return Model.GetHitStunDetachRatio();
}
TEUIModelRef<FVM_HeadsUpDisplayItem_HitStunDetach> __UIGetter_Self(const FVM_HeadsUpDisplayItem_HitStunDetach &inout Model)
{
    return TEUIModelRef<FVM_HeadsUpDisplayItem_HitStunDetach>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_Visibility()
{
    return 1;
}
int __IndexOf_TargetHitStunDetachRatio()
{
    return 2;
}
int __IndexOf_HitStunDetachRatio()
{
    return 3;
}
int __IndexOf_DelayRemoveTime()
{
    return 4;
}
int __IndexOf_ToRemoveTime()
{
    return 5;
}
int __IndexOf_InterpSpeed()
{
    return 6;
}
int __IndexOf_ValidEntity()
{
    return 7;
}
int __IndexOf_HitStunDetachInterpSource()
{
    return 8;
}
int __IndexOf_bConditionsMet()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_HeadsUpDisplayItem_HitStunDetach
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

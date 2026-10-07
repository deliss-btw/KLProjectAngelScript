
namespace FVM_StaminaBar
{
    const int ModelId = 0;

}
struct FVM_StaminaBar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_CurrentStaminaRatio;
    UPROPERTY()
    float32 m_TargetStaminaRatio;
    UPROPERTY()
    float32 m_StaminaInterpSpeed;
    UPROPERTY()
    bool m_bIsStaminaLow;
    UPROPERTY()
    FECSEntity m_TargetEntity;

    FVM_StaminaBar()
    {
        this.m_CurrentStaminaRatio = 1.0f;
        this.m_TargetStaminaRatio = 1.0f;
        this.m_StaminaInterpSpeed = 1.5f;
        this.m_bIsStaminaLow = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_StaminaBar(const FVM_StaminaBar &inout Other)
    {
        this.m_CurrentStaminaRatio = 1.0f;
        this.m_TargetStaminaRatio = 1.0f;
        this.m_StaminaInterpSpeed = 1.5f;
        this.m_bIsStaminaLow = false;
        this.m_CurrentStaminaRatio = Other.m_CurrentStaminaRatio;
        this.m_TargetStaminaRatio = Other.m_TargetStaminaRatio;
        this.m_StaminaInterpSpeed = Other.m_StaminaInterpSpeed;
        this.m_bIsStaminaLow = Other.m_bIsStaminaLow;
        this.m_TargetEntity = Other.m_TargetEntity;
        return;
    }
    FVM_StaminaBar& opAssign(const FVM_StaminaBar &inout Other)
    {
        this.m_CurrentStaminaRatio = Other.m_CurrentStaminaRatio;
        this.m_TargetStaminaRatio = Other.m_TargetStaminaRatio;
        this.m_StaminaInterpSpeed = Other.m_StaminaInterpSpeed;
        this.m_bIsStaminaLow = Other.m_bIsStaminaLow;
        return Other.m_TargetEntity;
    }
    void Tick()
    {
        float32 local_5 = float32(this.GetContext().DeltaTime.ToSeconds());
        if ((FECSEntity(this.GetTargetEntity()) == ENTITY_NULL))
        {
            return;
        }
        Has local_16;
        bool local_11 = local_16.opCall();
        if (local_11)
        {
            float32 local_30 = FGameAttributeUtils::GetAttributeValue(this.GetTargetEntity(), Attribute::StaminaMax, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            float32 local_1 = FGameAttributeUtils::GetAttributeBaseValue(this.GetTargetEntity(), Attribute::StaminaMax, this.GetContext().Time);
            float32 local_17 = FGameAttributeUtils::GetAttributeValue(this.GetTargetEntity(), Attribute::Stamina, this.GetContext().Time, false, 0.0f, false, FGameAttributeModificationValue());
            this.SetTargetStaminaRatio(local_17 / local_30);
            this.SetCurrentStaminaRatio(FMath::FInterpConstantTo(this.GetCurrentStaminaRatio(), this.GetTargetStaminaRatio(), local_5, this.GetStaminaInterpSpeed()));
            if (local_17 <= 10.0f)
            {
                this.SetbIsStaminaLow(true);
                return;
            }
            this.SetbIsStaminaLow(false);
        }
        return;
    }
    const float32 GetCurrentStaminaRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_CurrentStaminaRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCurrentStaminaRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentStaminaRatio = __Value;
        return;
    }
    const float32 GetTargetStaminaRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_TargetStaminaRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTargetStaminaRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TargetStaminaRatio = __Value;
        return;
    }
    const float32 GetStaminaInterpSpeed() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_StaminaInterpSpeed() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetStaminaInterpSpeed(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_StaminaInterpSpeed = __Value;
        return;
    }
    bool GetbIsStaminaLow() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bIsStaminaLow;
    }
    void SetbIsStaminaLow(const bool __Value) property
    {
        if (!(this.m_bIsStaminaLow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bIsStaminaLow = __Value;
        return;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TargetEntity = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_StaminaBar
{
    UPROPERTY()
    TEUIModelRef<FVM_StaminaBar> Self;

    __GeneratedProperties_FVM_StaminaBar()
    {
        return;
    }
}

namespace FVM_StaminaBar
{
FVM_StaminaBar& Create(const UObject ContextObject)
{
    return FVM_StaminaBar::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_StaminaBar CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_StaminaBar __r;
    TEUIModelRef<FVM_StaminaBar> local_6 = TEUIModelRef<FVM_StaminaBar>(EUIInternal::MakeModelWithManager(Manager, FVM_StaminaBar::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CurrentStaminaRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_StaminaBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_StaminaBar;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_StaminaBar;
}
void __Tick(FVM_StaminaBar &inout Model)
{
    Model.Tick();
    return;
}
float32 __UIGetter_CurrentStaminaRatio(const FVM_StaminaBar &inout Model)
{
    return Model.GetCurrentStaminaRatio();
}
TEUIModelRef<FVM_StaminaBar> __UIGetter_Self(const FVM_StaminaBar &inout Model)
{
    return TEUIModelRef<FVM_StaminaBar>(Model);
}
int __IndexOf_CurrentStaminaRatio()
{
    return 0;
}
int __IndexOf_TargetStaminaRatio()
{
    return 1;
}
int __IndexOf_StaminaInterpSpeed()
{
    return 2;
}
int __IndexOf_bIsStaminaLow()
{
    return 3;
}
int __IndexOf_TargetEntity()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_StaminaBar
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

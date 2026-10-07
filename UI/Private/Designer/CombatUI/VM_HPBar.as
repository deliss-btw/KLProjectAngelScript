
namespace FVM_HPBar
{
    const int ModelId = 0;

}
struct FVM_HPBar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_CurrentHPRatio;
    UPROPERTY()
    float32 m_TargetHPRatio;
    UPROPERTY()
    float32 m_HPInterpSpeed;
    UPROPERTY()
    int m_CurrentHPBarSegmentIndex;
    UPROPERTY()
    ESlateVisibility m_HPInfoVisibility;
    UPROPERTY()
    FText m_HPInfo;
    UPROPERTY()
    bool m_bEnabltHPLowHint;
    UPROPERTY()
    bool m_bIsHPLow;
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    FECSEntity m_HpTargetEntity;
    UPROPERTY()
    FMW_InterpFloat m_CurrentHPRatioSource;
    UPROPERTY()
    FMW_AttributeRatio m_HPRatioSource;

    FVM_HPBar()
    {
        this.m_CurrentHPRatio = 1.0f;
        this.m_TargetHPRatio = 1.0f;
        this.m_HPInterpSpeed = 1.5f;
        this.m_CurrentHPBarSegmentIndex = 0;
        this.m_HPInfoVisibility = ESlateVisibility(2);
        this.m_bEnabltHPLowHint = false;
        this.m_bIsHPLow = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_HPBar(const FVM_HPBar &inout Other)
    {
        this.m_CurrentHPRatio = 1.0f;
        this.m_TargetHPRatio = 1.0f;
        this.m_HPInterpSpeed = 1.5f;
        this.m_CurrentHPBarSegmentIndex = 0;
        this.m_HPInfoVisibility = ESlateVisibility(2);
        this.m_bEnabltHPLowHint = false;
        this.m_bIsHPLow = false;
        this.m_CurrentHPRatio = Other.m_CurrentHPRatio;
        this.m_TargetHPRatio = Other.m_TargetHPRatio;
        this.m_HPInterpSpeed = Other.m_HPInterpSpeed;
        this.m_CurrentHPBarSegmentIndex = int(Other.m_CurrentHPBarSegmentIndex);
        this.m_HPInfoVisibility = Other.m_HPInfoVisibility;
        this.m_HPInfo = Other.m_HPInfo;
        this.m_bEnabltHPLowHint = Other.m_bEnabltHPLowHint;
        this.m_bIsHPLow = Other.m_bIsHPLow;
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_HpTargetEntity = Other.m_HpTargetEntity;
        this.m_CurrentHPRatioSource = Other.m_CurrentHPRatioSource;
        this.m_HPRatioSource = Other.m_HPRatioSource;
        return;
    }
    FVM_HPBar& opAssign(const FVM_HPBar &inout Other)
    {
        this.m_CurrentHPRatio = Other.m_CurrentHPRatio;
        this.m_TargetHPRatio = Other.m_TargetHPRatio;
        this.m_HPInterpSpeed = Other.m_HPInterpSpeed;
        this.m_CurrentHPBarSegmentIndex = int(Other.m_CurrentHPBarSegmentIndex);
        this.m_HPInfoVisibility = Other.m_HPInfoVisibility;
        this.m_HPInfo = Other.m_HPInfo;
        this.m_bEnabltHPLowHint = Other.m_bEnabltHPLowHint;
        this.m_bIsHPLow = Other.m_bIsHPLow;
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_HpTargetEntity = Other.m_HpTargetEntity;
        this.m_CurrentHPRatioSource = Other.m_CurrentHPRatioSource;
        return Other.m_HPRatioSource;
    }
    void PostConstruct()
    {
        this.GetModify_CurrentHPRatioSource().SnapTo(this.GetCurrentHPRatio());
        return;
    }
    void SyncHPRatioSource()
    {
        if ((FECSEntity(this.GetTargetEntity()) == ENTITY_NULL))
        {
            this.SetHpTargetEntity(ENTITY_NULL);
            this.GetModify_HPRatioSource().SetAttribute(ENTITY_NULL, Attribute::HP, Attribute::HPMax);
            return;
        }
        FECSEntity local_10 = FECSEntity(this.GetTargetEntity());
        Get local_14;
        const FC_DamageReceiverTransfer& local_16 = local_14.opCall();
        if (local_16)
        {
            if (local_16.GetDamageValueToEntity().IsValid())
            {
                if (local_16.GetbTransferDamageToHp())
                {
                    local_10 = local_16.GetDamageValueToEntity();
                }
            }
        }
        this.SetHpTargetEntity(local_10);
        this.GetModify_HPRatioSource().SetAttribute(this.GetHpTargetEntity(), Attribute::HP, Attribute::HPMax);
        return;
    }
    void RefreshHPDisplayState()
    {
        int local_8 = 0;
        if ((FECSEntity(this.GetTargetEntity()) == ENTITY_NULL) || (FECSEntity(this.GetHpTargetEntity()) == ENTITY_NULL))
        {
            return;
        }
        int local_7 = this.GetHPRatioSource().GetMaxValue();
        if (local_7 <= 0.0f)
        {
            return;
        }
        float32 local_9 = this.GetHPRatioSource().GetRatioValue();
        int local_14 = FMath::Max(this.ResolveHPBarSegment(), 1);
        int local_15 = 1;
        int local_16 = 1;
        for (; local_16 <= local_14; ++local_16)
        {
            if (local_9 > (((local_16 - 1) * 1.0f) / local_14) && ((local_9 <= ((local_16 * 1.0f) / local_14))))
            {
                local_15 = local_16;
                break;
            }
        }
        float32 local_19 = (local_15 - 1);
        float32 local_19_2 = (local_19 * 1.0f) / local_14;
        this.SetTargetHPRatio((local_9 - local_19_2) * local_14);
        if (this.GetCurrentHPBarSegmentIndex() != local_15)
        {
            this.SetCurrentHPBarSegmentIndex(local_15);
            this.GetModify_CurrentHPRatioSource().SnapTo(1.0f);
        }
        this.GetModify_CurrentHPRatioSource().SetInterpConstantTo(this.GetTargetHPRatio(), this.GetHPInterpSpeed(), 0.0001f);
        int local_12 = uint(local_8);
        FString local_28 = ((FString("") + local_12) + " / ");
        int local_13 = uint(local_7);
        this.SetHPInfo(FText::FromString((local_28 + local_13)));
        return;
    }
    void RefreshCurrentHPRatio()
    {
        this.SetCurrentHPRatio(0.0f);
        if (this.GetbEnabltHPLowHint())
        {
            this.SetbIsHPLow((this.GetCurrentHPRatio() < 0.4f));
        }
        return;
    }
    int ResolveHPBarSegment() const
    {
        int local_3 = 0;
        int local_2 = int(::GetPrefabType(this.GetHpTargetEntity()));
        if (local_2 != 2)
        {
            return 1;
        }
        Get local_8;
        const FC_MonsterInfo& local_10 = local_8.opCall();
        if (local_10)
        {
            if (local_10.GetPresentationConfig())
            {
                return local_2;
            }
        }
        TDataObjectPtr<FMonsterPrefabConfig> local_34 = ::GetMonsterConfig(this.GetHpTargetEntity());
        return local_3;
    }
    void OnTargetEntityChanged()
    {
        if (::GetPrefabConfigPtr(this.GetTargetEntity()))
        {
        }
        return;
    }
    const float32 GetCurrentHPRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_CurrentHPRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCurrentHPRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentHPRatio = __Value;
        return;
    }
    const float32 GetTargetHPRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_TargetHPRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTargetHPRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TargetHPRatio = __Value;
        return;
    }
    const float32 GetHPInterpSpeed() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_HPInterpSpeed() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetHPInterpSpeed(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_HPInterpSpeed = __Value;
        return;
    }
    int GetCurrentHPBarSegmentIndex() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CurrentHPBarSegmentIndex;
    }
    void SetCurrentHPBarSegmentIndex(const int __Value) property
    {
        if (this.m_CurrentHPBarSegmentIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrentHPBarSegmentIndex = __Value;
        return;
    }
    ESlateVisibility GetHPInfoVisibility() const property
    {
        this.TrackPropertyRead(4);
        return this.m_HPInfoVisibility;
    }
    void SetHPInfoVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_HPInfoVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_HPInfoVisibility = __Value;
        return;
    }
    const FText GetHPInfo() const property
    {
        const FText __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FText GetModify_HPInfo() property
    {
        FText __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetHPInfo(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_HPInfo = __Value;
        return;
    }
    bool GetbEnabltHPLowHint() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bEnabltHPLowHint;
    }
    void SetbEnabltHPLowHint(const bool __Value) property
    {
        if (!(this.m_bEnabltHPLowHint) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bEnabltHPLowHint = __Value;
        return;
    }
    bool GetbIsHPLow() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bIsHPLow;
    }
    void SetbIsHPLow(const bool __Value) property
    {
        if (!(this.m_bIsHPLow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bIsHPLow = __Value;
        return;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_TargetEntity = __Value;
        return;
    }
    const FECSEntity GetHpTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FECSEntity GetModify_HpTargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetHpTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_HpTargetEntity = __Value;
        return;
    }
    const FMW_InterpFloat GetCurrentHPRatioSource() const property
    {
        const FMW_InterpFloat __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FMW_InterpFloat GetModify_CurrentHPRatioSource() property
    {
        FMW_InterpFloat __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetCurrentHPRatioSource(const FMW_InterpFloat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_CurrentHPRatioSource = __Value;
        return;
    }
    const FMW_AttributeRatio GetHPRatioSource() const property
    {
        const FMW_AttributeRatio __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FMW_AttributeRatio GetModify_HPRatioSource() property
    {
        FMW_AttributeRatio __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetHPRatioSource(const FMW_AttributeRatio &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_HPRatioSource = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_HPBar
{
    UPROPERTY()
    TEUIModelRef<FVM_HPBar> Self;

    __GeneratedProperties_FVM_HPBar()
    {
        return;
    }
}

namespace FVM_HPBar
{
FVM_HPBar& Create(const UObject ContextObject)
{
    return FVM_HPBar::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_HPBar CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_HPBar __r;
    TEUIModelRef<FVM_HPBar> local_6 = TEUIModelRef<FVM_HPBar>(EUIInternal::MakeModelWithManager(Manager, FVM_HPBar::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CurrentHPRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HPInfoVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HPInfo";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_HPBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_HPBar;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("CurrentHPRatioSource");
    int local_2_2 = FVM_HPBar::__IndexOf_CurrentHPRatioSource();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("HPRatioSource");
    int local_2_3 = FVM_HPBar::__IndexOf_HPRatioSource();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "SyncHPRatioSource";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshHPDisplayState";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshCurrentHPRatio";
    Result.EffectFunctions.Add(local_26);
    FEUIModelDirtyDefine local_34;
    local_34.FunctionName = "__OnTargetEntityChanged";
    local_34.DirtyFlags.Set(FVM_HPBar::__IndexOf_TargetEntity());
    Result.DirtyFunctions.Add(local_34);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_HPBar;
}
void __OnTargetEntityChanged(FVM_HPBar &inout Model)
{
    Model.OnTargetEntityChanged();
    return;
}
float32 __UIGetter_CurrentHPRatio(const FVM_HPBar &inout Model)
{
    return Model.GetCurrentHPRatio();
}
ESlateVisibility __UIGetter_HPInfoVisibility(const FVM_HPBar &inout Model)
{
    return Model.GetHPInfoVisibility();
}
FText __UIGetter_HPInfo(const FVM_HPBar &inout Model)
{
    return Model.GetHPInfo();
}
TEUIModelRef<FVM_HPBar> __UIGetter_Self(const FVM_HPBar &inout Model)
{
    return TEUIModelRef<FVM_HPBar>(Model);
}
int __IndexOf_CurrentHPRatio()
{
    return 0;
}
int __IndexOf_TargetHPRatio()
{
    return 1;
}
int __IndexOf_HPInterpSpeed()
{
    return 2;
}
int __IndexOf_CurrentHPBarSegmentIndex()
{
    return 3;
}
int __IndexOf_HPInfoVisibility()
{
    return 4;
}
int __IndexOf_HPInfo()
{
    return 5;
}
int __IndexOf_bEnabltHPLowHint()
{
    return 6;
}
int __IndexOf_bIsHPLow()
{
    return 7;
}
int __IndexOf_TargetEntity()
{
    return 8;
}
int __IndexOf_HpTargetEntity()
{
    return 9;
}
int __IndexOf_CurrentHPRatioSource()
{
    return 10;
}
int __IndexOf_HPRatioSource()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_HPBar
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

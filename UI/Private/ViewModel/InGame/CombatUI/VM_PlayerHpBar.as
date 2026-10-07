
namespace FVM_PlayerHpBar
{
    const int ModelId = 0;

}
struct FVM_PlayerHpBar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_Entity;
    UPROPERTY()
    int m_CurrentHpNumber;
    UPROPERTY()
    int m_MaxHpNumber;
    UPROPERTY()
    FText m_HpNumberText;
    UPROPERTY()
    float32 m_DisplayHpBarRatio;
    UPROPERTY()
    float32 m_DisplayPreviewHpBarRatio;
    UPROPERTY()
    float32 m_PreviewHpBarChaseSeconds;
    UPROPERTY()
    float32 m_PreviewHpBarChaseSpeed;
    UPROPERTY()
    ESlateVisibility m_ShieldVisibility;
    UPROPERTY()
    float32 m_DisplayShieldBarRatio;
    UPROPERTY()
    float32 m_DisplayShieldRemainTimeRatio;
    UPROPERTY()
    int m_HpRatioReduceCounter;
    UPROPERTY()
    FGameAttributeRef m_HpMaxAttributeRef;
    UPROPERTY()
    FGameAttributeRef m_HpAttributeRef;
    UPROPERTY()
    FMW_AttributeRatio m_HpRatioSource;
    UPROPERTY()
    FMW_InterpFloat m_PreviewHpBarRatioSource;
    UPROPERTY()
    FMW_AttributeValue m_ShieldValueSource;
    UPROPERTY()
    FMW_InterpFloat m_ShieldRemainTimeSource;
    UPROPERTY()
    bool m_bHasHpRatioInitialized;
    UPROPERTY()
    float32 CachedPreviewHpBarRatioForLogic;

    FVM_PlayerHpBar()
    {
        this.m_CurrentHpNumber = 0;
        this.m_MaxHpNumber = 0;
        this.m_DisplayHpBarRatio = 0.0f;
        this.m_DisplayPreviewHpBarRatio = 0.0f;
        this.m_PreviewHpBarChaseSpeed = 0.0f;
        this.m_DisplayShieldBarRatio = 0.0f;
        this.m_DisplayShieldRemainTimeRatio = 0.0f;
        this.m_PreviewHpBarChaseSeconds = 0.7f;
        this.m_ShieldVisibility = ESlateVisibility(1);
        this.m_HpRatioReduceCounter = 0;
        this.m_HpMaxAttributeRef = Attribute::HPMax;
        this.m_HpAttributeRef = Attribute::HP;
        this.m_bHasHpRatioInitialized = false;
        this.CachedPreviewHpBarRatioForLogic = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PlayerHpBar' by default constructor.");
        return;
    }
    FVM_PlayerHpBar(const FVM_PlayerHpBar &inout Other)
    {
        this.m_CurrentHpNumber = 0;
        this.m_MaxHpNumber = 0;
        this.m_DisplayHpBarRatio = 0.0f;
        this.m_DisplayPreviewHpBarRatio = 0.0f;
        this.m_PreviewHpBarChaseSpeed = 0.0f;
        this.m_DisplayShieldBarRatio = 0.0f;
        this.m_DisplayShieldRemainTimeRatio = 0.0f;
        this.m_PreviewHpBarChaseSeconds = 0.7f;
        this.m_ShieldVisibility = ESlateVisibility(1);
        this.m_HpRatioReduceCounter = 0;
        this.m_HpMaxAttributeRef = Attribute::HPMax;
        this.m_HpAttributeRef = Attribute::HP;
        this.m_bHasHpRatioInitialized = false;
        this.CachedPreviewHpBarRatioForLogic = 0.0f;
        this.m_Entity = Other.m_Entity;
        this.m_CurrentHpNumber = int(Other.m_CurrentHpNumber);
        this.m_MaxHpNumber = int(Other.m_MaxHpNumber);
        this.m_HpNumberText = Other.m_HpNumberText;
        this.m_DisplayHpBarRatio = Other.m_DisplayHpBarRatio;
        this.m_DisplayPreviewHpBarRatio = Other.m_DisplayPreviewHpBarRatio;
        this.m_PreviewHpBarChaseSeconds = Other.m_PreviewHpBarChaseSeconds;
        this.m_PreviewHpBarChaseSpeed = Other.m_PreviewHpBarChaseSpeed;
        this.m_ShieldVisibility = Other.m_ShieldVisibility;
        this.m_DisplayShieldBarRatio = Other.m_DisplayShieldBarRatio;
        this.m_DisplayShieldRemainTimeRatio = Other.m_DisplayShieldRemainTimeRatio;
        this.m_HpRatioReduceCounter = int(Other.m_HpRatioReduceCounter);
        this.m_HpMaxAttributeRef = Other.m_HpMaxAttributeRef;
        this.m_HpAttributeRef = Other.m_HpAttributeRef;
        this.m_HpRatioSource = Other.m_HpRatioSource;
        this.m_PreviewHpBarRatioSource = Other.m_PreviewHpBarRatioSource;
        this.m_ShieldValueSource = Other.m_ShieldValueSource;
        this.m_ShieldRemainTimeSource = Other.m_ShieldRemainTimeSource;
        this.m_bHasHpRatioInitialized = Other.m_bHasHpRatioInitialized;
        return;
    }
    FVM_PlayerHpBar(const FECSEntity &inout InEntity)
    {
        this.m_CurrentHpNumber = 0;
        this.m_MaxHpNumber = 0;
        this.m_DisplayHpBarRatio = 0.0f;
        this.m_DisplayPreviewHpBarRatio = 0.0f;
        this.m_PreviewHpBarChaseSpeed = 0.0f;
        this.m_DisplayShieldBarRatio = 0.0f;
        this.m_DisplayShieldRemainTimeRatio = 0.0f;
        this.m_PreviewHpBarChaseSeconds = 0.7f;
        this.m_ShieldVisibility = ESlateVisibility(1);
        this.m_HpRatioReduceCounter = 0;
        this.m_HpMaxAttributeRef = Attribute::HPMax;
        this.m_HpAttributeRef = Attribute::HP;
        this.m_bHasHpRatioInitialized = false;
        this.CachedPreviewHpBarRatioForLogic = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEntity(InEntity);
        return;
    }
    FVM_PlayerHpBar opAssign(const FVM_PlayerHpBar &inout Other)
    {
        FVM_PlayerHpBar __r;
        this.m_Entity = Other.m_Entity;
        this.m_CurrentHpNumber = int(Other.m_CurrentHpNumber);
        this.m_MaxHpNumber = int(Other.m_MaxHpNumber);
        this.m_HpNumberText = Other.m_HpNumberText;
        this.m_DisplayHpBarRatio = Other.m_DisplayHpBarRatio;
        this.m_DisplayPreviewHpBarRatio = Other.m_DisplayPreviewHpBarRatio;
        this.m_PreviewHpBarChaseSeconds = Other.m_PreviewHpBarChaseSeconds;
        this.m_PreviewHpBarChaseSpeed = Other.m_PreviewHpBarChaseSpeed;
        this.m_ShieldVisibility = Other.m_ShieldVisibility;
        this.m_DisplayShieldBarRatio = Other.m_DisplayShieldBarRatio;
        this.m_DisplayShieldRemainTimeRatio = Other.m_DisplayShieldRemainTimeRatio;
        this.m_HpRatioReduceCounter = int(Other.m_HpRatioReduceCounter);
        this.m_HpMaxAttributeRef = Other.m_HpMaxAttributeRef;
        this.m_HpAttributeRef = Other.m_HpAttributeRef;
        this.m_HpRatioSource = Other.m_HpRatioSource;
        this.m_PreviewHpBarRatioSource = Other.m_PreviewHpBarRatioSource;
        this.m_ShieldValueSource = Other.m_ShieldValueSource;
        this.m_ShieldRemainTimeSource = Other.m_ShieldRemainTimeSource;
        this.m_bHasHpRatioInitialized = Other.m_bHasHpRatioInitialized;
        return __r;
    }
    void LoadConfigDefault(const FVM_PlayerHpBarConfigDefault &inout InConfig)
    {
        this.SetPreviewHpBarChaseSeconds(InConfig.PreviewHpBarChaseSeconds);
        return;
    }
    void PostConstruct()
    {
        this.GetModify_PreviewHpBarRatioSource().SnapTo(this.GetDisplayPreviewHpBarRatio());
        this.GetModify_ShieldRemainTimeSource().SnapTo(1.0f);
        return;
    }
    void SyncHpSources()
    {
        if (!(this.GetEntity().IsValid()))
        {
            this.GetModify_HpRatioSource().Reset();
            this.GetModify_ShieldValueSource().Reset();
            return;
        }
        GetDefaulted local_6;
        bool local_1 = local_6.opCall().bUseEnvBreakHPAttribute;
        if (local_1)
        {
            this.SetHpMaxAttributeRef(Attribute::EnvBreakHPMax);
            this.SetHpAttributeRef(Attribute::EnvBreakHP);
        }
        else
        {
            this.SetHpMaxAttributeRef(Attribute::HPMax);
            this.SetHpAttributeRef(Attribute::HP);
        }
        this.GetModify_HpRatioSource().SetAttribute(this.GetEntity(), this.GetHpAttributeRef(), this.GetHpMaxAttributeRef());
        this.GetModify_ShieldValueSource().SetAttribute(this.GetEntity(), Attribute::Shield);
        return;
    }
    void RefreshHpDisplay()
    {
        float32 local_1 = 0.0f;
        float32 local_2 = this.GetHpRatioSource().GetMaxValue();
        if (local_2 <= 0.0f)
        {
            return;
        }
        this.SetNewHpValues(local_1, local_2, FMath::Clamp(this.GetHpRatioSource().GetRatioValue(), 0.0f, 1.0f), !(this.GetbHasHpRatioInitialized()));
        return;
    }
    void RefreshPreviewHpBarRatio()
    {
        this.SetDisplayPreviewHpBarRatio(0.0f);
        this.CachedPreviewHpBarRatioForLogic = this.GetDisplayPreviewHpBarRatio();
        return;
    }
    void RefreshShieldDisplay()
    {
        int local_6 = 0;
        float32 local_12 = 0.0f;
        int local_48 = 0;
        if (!(local_6) || (local_6.GetNamedInherentShields().Num() == 0))
        {
            this.SetShieldVisibility(ESlateVisibility(1));
            local_12 = 0.0f;
            this.SetDisplayShieldBarRatio(local_12);
            this.GetModify_ShieldRemainTimeSource().SnapTo(1.0f);
            return;
        }
        this.SetShieldVisibility(ESlateVisibility(4));
        float32 local_13 = this.GetHpRatioSource().GetMaxValue();
        if (local_13 > 0.0f)
        {
            this.SetDisplayShieldBarRatio(FMath::Clamp(local_12 / local_13, 0.0f, 1.0f));
        }
        float32 local_18 = 1.0f;
        float32 local_19 = 0.0f;
        for (auto& local_38 : local_6.GetNamedInherentShields())
        {
            local_38;
            if (local_48)
            {
                if (FFPTime(local_48.GetDestroyTime()).opCmp(0.0) > 0)
                {
                    FFPTime local_56 = (FFPTime(local_48.GetDestroyTime()) - local_48.GetAssignTime());
                    if (local_56.opCmp(0.0) > 0)
                    {
                        FFPTime local_54 = (FFPTime(local_48.GetDestroyTime()) - this.GetContext().Time);
                        float32 local_17 = FMath::Clamp(float32((local_54 / local_56)), 0.0f, 1.0f);
                        float32 local_57 = (FFPTime(local_48.GetDestroyTime()) - this.GetContext().Time);
                        if (local_17 < local_18)
                        {
                            local_18 = local_17;
                            if (local_57 > 0.0f)
                            {
                                local_19 = local_17 / local_57;
                            }
                        }
                    }
                }
            }
        }
        if (local_19 > 0.0f)
        {
            this.GetModify_ShieldRemainTimeSource().SetValue(local_18);
            this.GetModify_ShieldRemainTimeSource().SetInterpConstantTo(0.0f, local_19, 0.0001f);
            return;
        }
        this.GetModify_ShieldRemainTimeSource().SnapTo(local_18);
        return;
    }
    void RefreshShieldRemainTimeRatio()
    {
        float32 local_1 = 0.0f;
        this.SetDisplayShieldRemainTimeRatio(local_1);
        return;
    }
    void HandleEntityChanged()
    {
        this.SetbHasHpRatioInitialized(false);
        return;
    }
    void SetNewHpValues(const float32 HP, const float32 HPMax, const float32 HPRatio, const bool bFromEntityChange)
    {
        int local_3;
        int local_5;
        float32 local_21;
        float32 local_1 = this.GetDisplayHpBarRatio();
        local_3 = this.GetMaxHpNumber();
        local_5 = this.GetCurrentHpNumber();
        float32 local_6 = this.CachedPreviewHpBarRatioForLogic;
        this.SetMaxHpNumber(FMath::CeilToInt(HPMax));
        this.SetCurrentHpNumber(FMath::CeilToInt(HP));
        this.SetDisplayHpBarRatio(HPRatio);
        if (bFromEntityChange)
        {
            this.SetPreviewHpBarChaseSpeed(0.0f);
            this.SetDisplayPreviewHpBarRatio(this.GetDisplayHpBarRatio());
            this.GetModify_PreviewHpBarRatioSource().SnapTo(this.GetDisplayHpBarRatio());
            this.SetHpNumberText(FText::FromString(FString().Append(this.GetCurrentHpNumber()).Append("/").Append(this.GetMaxHpNumber())));
            this.SetbHasHpRatioInitialized(true);
            return;
        }
        if (local_3 != this.GetMaxHpNumber() || (local_5 != this.GetCurrentHpNumber()))
        {
            this.SetHpNumberText(FText::FromString(FString().Append(this.GetCurrentHpNumber()).Append("/").Append(this.GetMaxHpNumber())));
        }
        if (FMath::Abs((this.GetDisplayHpBarRatio() - local_1)) > 0.001f)
        {
            if (this.GetDisplayHpBarRatio() > local_6)
            {
                this.SetPreviewHpBarChaseSpeed(0.0f);
                this.SetDisplayPreviewHpBarRatio(this.GetDisplayHpBarRatio());
                this.GetModify_PreviewHpBarRatioSource().SnapTo(this.GetDisplayHpBarRatio());
            }
            else
            {
                if (this.GetDisplayHpBarRatio() < local_1)
                {
                    if (this.GetPreviewHpBarChaseSeconds() > 0.0f)
                    {
                        float32 local_2_2 = this.GetDisplayHpBarRatio();
                        float32 local_20 = local_6 - local_2_2;
                        local_21 = local_20 / this.GetPreviewHpBarChaseSeconds();
                    }
                    else
                    {
                        local_21 = 0.0f;
                    }
                    this.SetPreviewHpBarChaseSpeed(local_21);
                    if (this.GetPreviewHpBarChaseSpeed() > 0.0f)
                    {
                        this.GetModify_PreviewHpBarRatioSource().SetInterpConstantTo(this.GetDisplayHpBarRatio(), this.GetPreviewHpBarChaseSpeed(), 0.0001f);
                    }
                    else
                    {
                        this.SetDisplayPreviewHpBarRatio(this.GetDisplayHpBarRatio());
                        this.GetModify_PreviewHpBarRatioSource().SnapTo(this.GetDisplayHpBarRatio());
                    }
                    this.SetHpRatioReduceCounter((this.GetHpRatioReduceCounter() + 1));
                }
                else
                {
                    if (this.GetPreviewHpBarChaseSpeed() > 0.0f && (local_6 > this.GetDisplayHpBarRatio()))
                    {
                        this.GetModify_PreviewHpBarRatioSource().SetInterpConstantTo(this.GetDisplayHpBarRatio(), this.GetPreviewHpBarChaseSpeed(), 0.0001f);
                    }
                }
            }
        }
        else
        {
            if (this.GetPreviewHpBarChaseSpeed() <= 0.0f || (local_6 < this.GetDisplayHpBarRatio()))
            {
                this.SetPreviewHpBarChaseSpeed(0.0f);
                this.SetDisplayPreviewHpBarRatio(this.GetDisplayHpBarRatio());
                this.GetModify_PreviewHpBarRatioSource().SnapTo(this.GetDisplayHpBarRatio());
            }
            else
            {
                if (local_6 > this.GetDisplayHpBarRatio())
                {
                    this.GetModify_PreviewHpBarRatioSource().SetInterpConstantTo(this.GetDisplayHpBarRatio(), this.GetPreviewHpBarChaseSpeed(), 0.0001f);
                }
            }
        }
        this.SetbHasHpRatioInitialized(true);
        return;
    }
    FECSEntity GetEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_Entity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Entity = __Value;
        return;
    }
    int GetCurrentHpNumber() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurrentHpNumber;
    }
    void SetCurrentHpNumber(const int __Value) property
    {
        if (this.m_CurrentHpNumber == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentHpNumber = __Value;
        return;
    }
    int GetMaxHpNumber() const property
    {
        this.TrackPropertyRead(2);
        return this.m_MaxHpNumber;
    }
    void SetMaxHpNumber(const int __Value) property
    {
        if (this.m_MaxHpNumber == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MaxHpNumber = __Value;
        return;
    }
    const FText GetHpNumberText() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_HpNumberText() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetHpNumberText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_HpNumberText = __Value;
        return;
    }
    const float32 GetDisplayHpBarRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_DisplayHpBarRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetDisplayHpBarRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DisplayHpBarRatio = __Value;
        return;
    }
    const float32 GetDisplayPreviewHpBarRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_DisplayPreviewHpBarRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetDisplayPreviewHpBarRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_DisplayPreviewHpBarRatio = __Value;
        return;
    }
    const float32 GetPreviewHpBarChaseSeconds() const property
    {
        const float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_PreviewHpBarChaseSeconds() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetPreviewHpBarChaseSeconds(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_PreviewHpBarChaseSeconds = __Value;
        return;
    }
    const float32 GetPreviewHpBarChaseSpeed() const property
    {
        const float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_PreviewHpBarChaseSpeed() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetPreviewHpBarChaseSpeed(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_PreviewHpBarChaseSpeed = __Value;
        return;
    }
    ESlateVisibility GetShieldVisibility() const property
    {
        this.TrackPropertyRead(8);
        return this.m_ShieldVisibility;
    }
    void SetShieldVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_ShieldVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_ShieldVisibility = __Value;
        return;
    }
    const float32 GetDisplayShieldBarRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    float32 GetModify_DisplayShieldBarRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetDisplayShieldBarRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_DisplayShieldBarRatio = __Value;
        return;
    }
    const float32 GetDisplayShieldRemainTimeRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    float32 GetModify_DisplayShieldRemainTimeRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetDisplayShieldRemainTimeRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_DisplayShieldRemainTimeRatio = __Value;
        return;
    }
    int GetHpRatioReduceCounter() const property
    {
        this.TrackPropertyRead(11);
        return this.m_HpRatioReduceCounter;
    }
    void SetHpRatioReduceCounter(const int __Value) property
    {
        if (this.m_HpRatioReduceCounter == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_HpRatioReduceCounter = __Value;
        return;
    }
    const FGameAttributeRef GetHpMaxAttributeRef() const property
    {
        const FGameAttributeRef __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FGameAttributeRef GetModify_HpMaxAttributeRef() property
    {
        FGameAttributeRef __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetHpMaxAttributeRef(const FGameAttributeRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_HpMaxAttributeRef = __Value;
        return;
    }
    const FGameAttributeRef GetHpAttributeRef() const property
    {
        const FGameAttributeRef __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FGameAttributeRef GetModify_HpAttributeRef() property
    {
        FGameAttributeRef __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetHpAttributeRef(const FGameAttributeRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_HpAttributeRef = __Value;
        return;
    }
    const FMW_AttributeRatio GetHpRatioSource() const property
    {
        const FMW_AttributeRatio __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    FMW_AttributeRatio GetModify_HpRatioSource() property
    {
        FMW_AttributeRatio __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetHpRatioSource(const FMW_AttributeRatio &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_HpRatioSource = __Value;
        return;
    }
    const FMW_InterpFloat GetPreviewHpBarRatioSource() const property
    {
        const FMW_InterpFloat __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    FMW_InterpFloat GetModify_PreviewHpBarRatioSource() property
    {
        FMW_InterpFloat __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetPreviewHpBarRatioSource(const FMW_InterpFloat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_PreviewHpBarRatioSource = __Value;
        return;
    }
    const FMW_AttributeValue GetShieldValueSource() const property
    {
        const FMW_AttributeValue __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    FMW_AttributeValue GetModify_ShieldValueSource() property
    {
        FMW_AttributeValue __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetShieldValueSource(const FMW_AttributeValue &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_ShieldValueSource = __Value;
        return;
    }
    const FMW_InterpFloat GetShieldRemainTimeSource() const property
    {
        const FMW_InterpFloat __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    FMW_InterpFloat GetModify_ShieldRemainTimeSource() property
    {
        FMW_InterpFloat __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetShieldRemainTimeSource(const FMW_InterpFloat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_ShieldRemainTimeSource = __Value;
        return;
    }
    bool GetbHasHpRatioInitialized() const property
    {
        this.TrackPropertyRead(18);
        return this.m_bHasHpRatioInitialized;
    }
    void SetbHasHpRatioInitialized(const bool __Value) property
    {
        if (!(this.m_bHasHpRatioInitialized) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_bHasHpRatioInitialized = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PlayerHpBar
{
    UPROPERTY()
    TEUIModelRef<FVM_PlayerHpBar> Self;

    __GeneratedProperties_FVM_PlayerHpBar()
    {
        return;
    }
}

namespace FVM_PlayerHpBar
{
FVM_PlayerHpBar& Create(const UObject ContextObject, const FECSEntity &inout Entity)
{
    return FVM_PlayerHpBar::CreateByManager(EUIInternal::GetContextManager(ContextObject), Entity);
}
FVM_PlayerHpBar CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout Entity)
{
    FVM_PlayerHpBar __r;
    TEUIModelRef<FVM_PlayerHpBar> local_6 = TEUIModelRef<FVM_PlayerHpBar>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PlayerHpBar::ModelId, 0, Entity));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(true);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CurrentHpNumber";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MaxHpNumber";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HpNumberText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayHpBarRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayPreviewHpBarRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShieldVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayShieldBarRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayShieldRemainTimeRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerHpBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PlayerHpBar;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("HpRatioSource");
    int local_2_2 = FVM_PlayerHpBar::__IndexOf_HpRatioSource();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("PreviewHpBarRatioSource");
    int local_2_3 = FVM_PlayerHpBar::__IndexOf_PreviewHpBarRatioSource();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("ShieldValueSource");
    int local_2_4 = FVM_PlayerHpBar::__IndexOf_ShieldValueSource();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("ShieldRemainTimeSource");
    int local_2_5 = FVM_PlayerHpBar::__IndexOf_ShieldRemainTimeSource();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "SyncHpSources";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshHpDisplay";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshPreviewHpBarRatio";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshShieldDisplay";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshShieldRemainTimeRatio";
    Result.EffectFunctions.Add(local_26);
    FEUIModelDirtyDefine local_34;
    local_34.FunctionName = "__HandleEntityChanged";
    local_34.DirtyFlags.Set(FVM_PlayerHpBar::__IndexOf_Entity());
    Result.DirtyFunctions.Add(local_34);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PlayerHpBar;
}
void __HandleEntityChanged(FVM_PlayerHpBar &inout Model)
{
    Model.HandleEntityChanged();
    return;
}
int __UIGetter_CurrentHpNumber(const FVM_PlayerHpBar &inout Model)
{
    return Model.GetCurrentHpNumber();
}
int __UIGetter_MaxHpNumber(const FVM_PlayerHpBar &inout Model)
{
    return Model.GetMaxHpNumber();
}
FText __UIGetter_HpNumberText(const FVM_PlayerHpBar &inout Model)
{
    return Model.GetHpNumberText();
}
float32 __UIGetter_DisplayHpBarRatio(const FVM_PlayerHpBar &inout Model)
{
    return Model.GetDisplayHpBarRatio();
}
float32 __UIGetter_DisplayPreviewHpBarRatio(const FVM_PlayerHpBar &inout Model)
{
    return Model.GetDisplayPreviewHpBarRatio();
}
ESlateVisibility __UIGetter_ShieldVisibility(const FVM_PlayerHpBar &inout Model)
{
    return Model.GetShieldVisibility();
}
float32 __UIGetter_DisplayShieldBarRatio(const FVM_PlayerHpBar &inout Model)
{
    return Model.GetDisplayShieldBarRatio();
}
float32 __UIGetter_DisplayShieldRemainTimeRatio(const FVM_PlayerHpBar &inout Model)
{
    return Model.GetDisplayShieldRemainTimeRatio();
}
TEUIModelRef<FVM_PlayerHpBar> __UIGetter_Self(const FVM_PlayerHpBar &inout Model)
{
    return TEUIModelRef<FVM_PlayerHpBar>(Model);
}
int __IndexOf_Entity()
{
    return 0;
}
int __IndexOf_CurrentHpNumber()
{
    return 1;
}
int __IndexOf_MaxHpNumber()
{
    return 2;
}
int __IndexOf_HpNumberText()
{
    return 3;
}
int __IndexOf_DisplayHpBarRatio()
{
    return 4;
}
int __IndexOf_DisplayPreviewHpBarRatio()
{
    return 5;
}
int __IndexOf_PreviewHpBarChaseSeconds()
{
    return 6;
}
int __IndexOf_PreviewHpBarChaseSpeed()
{
    return 7;
}
int __IndexOf_ShieldVisibility()
{
    return 8;
}
int __IndexOf_DisplayShieldBarRatio()
{
    return 9;
}
int __IndexOf_DisplayShieldRemainTimeRatio()
{
    return 10;
}
int __IndexOf_HpRatioReduceCounter()
{
    return 11;
}
int __IndexOf_HpMaxAttributeRef()
{
    return 12;
}
int __IndexOf_HpAttributeRef()
{
    return 13;
}
int __IndexOf_HpRatioSource()
{
    return 14;
}
int __IndexOf_PreviewHpBarRatioSource()
{
    return 15;
}
int __IndexOf_ShieldValueSource()
{
    return 16;
}
int __IndexOf_ShieldRemainTimeSource()
{
    return 17;
}
int __IndexOf_bHasHpRatioInitialized()
{
    return 18;
}
}
namespace __GeneratedProperties_FVM_PlayerHpBar
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

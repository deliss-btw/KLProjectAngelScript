
namespace MiniHpBarV2Style
{
    const int EnemyIndex = 0;
    const int NeutralIndex = 1;
    const int AllyIndex = 2;
    const int NearDeath = 3;
}
namespace FVM_MiniHPBarV2
{
    const int ModelId = 0;

}
struct FVM_MiniHPBarV2 : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_Entity;
    UPROPERTY()
    float32 m_DisplayHpBarRatio;
    UPROPERTY()
    float32 m_DisplayPreviewHpBarRatio;
    UPROPERTY()
    float32 m_PreviewHpBarChaseSeconds;
    UPROPERTY()
    float32 m_PreviewHpBarChaseSpeed;
    UPROPERTY()
    FMW_AttributeRatio m_HpRatioSource;
    UPROPERTY()
    FMW_InterpFloat m_PreviewHpBarRatioSource;
    UPROPERTY()
    FGameAttributeRef m_HpMaxAttributeRef;
    UPROPERTY()
    FGameAttributeRef m_HpAttributeRef;
    UPROPERTY()
    bool m_bBarActive;
    UPROPERTY()
    int m_StyleIndex;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerHpBar> m_PlayerHpBar;
    UPROPERTY()
    bool m_bShowProjectileHp;
    UPROPERTY()
    bool m_bHasHpRatioInitialized;
    UPROPERTY()
    float32 CachedPreviewHpBarRatioForLogic;

    FVM_MiniHPBarV2()
    {
        this.m_DisplayHpBarRatio = 0.0f;
        this.m_DisplayPreviewHpBarRatio = 0.0f;
        this.m_PreviewHpBarChaseSpeed = 0.0f;
        this.m_PreviewHpBarChaseSeconds = 0.7f;
        this.m_HpMaxAttributeRef = Attribute::HPMax;
        this.m_HpAttributeRef = Attribute::HP;
        this.m_bBarActive = true;
        this.m_StyleIndex = 0;
        this.m_bShowProjectileHp = false;
        this.m_bHasHpRatioInitialized = false;
        this.CachedPreviewHpBarRatioForLogic = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MiniHPBarV2' by default constructor.");
        return;
    }
    FVM_MiniHPBarV2(const FVM_MiniHPBarV2 &inout Other)
    {
        this.m_DisplayHpBarRatio = 0.0f;
        this.m_DisplayPreviewHpBarRatio = 0.0f;
        this.m_PreviewHpBarChaseSpeed = 0.0f;
        this.m_PreviewHpBarChaseSeconds = 0.7f;
        this.m_HpMaxAttributeRef = Attribute::HPMax;
        this.m_HpAttributeRef = Attribute::HP;
        this.m_bBarActive = true;
        this.m_StyleIndex = 0;
        this.m_bShowProjectileHp = false;
        this.m_bHasHpRatioInitialized = false;
        this.CachedPreviewHpBarRatioForLogic = 0.0f;
        this.m_Entity = Other.m_Entity;
        this.m_DisplayHpBarRatio = Other.m_DisplayHpBarRatio;
        this.m_DisplayPreviewHpBarRatio = Other.m_DisplayPreviewHpBarRatio;
        this.m_PreviewHpBarChaseSeconds = Other.m_PreviewHpBarChaseSeconds;
        this.m_PreviewHpBarChaseSpeed = Other.m_PreviewHpBarChaseSpeed;
        this.m_HpRatioSource = Other.m_HpRatioSource;
        this.m_PreviewHpBarRatioSource = Other.m_PreviewHpBarRatioSource;
        this.m_HpMaxAttributeRef = Other.m_HpMaxAttributeRef;
        this.m_HpAttributeRef = Other.m_HpAttributeRef;
        this.m_bBarActive = Other.m_bBarActive;
        this.m_StyleIndex = int(Other.m_StyleIndex);
        this.m_PlayerHpBar = Other.m_PlayerHpBar;
        this.m_bShowProjectileHp = Other.m_bShowProjectileHp;
        this.m_bHasHpRatioInitialized = Other.m_bHasHpRatioInitialized;
        return;
    }
    FVM_MiniHPBarV2(const FECSEntity &inout InEntity, const float32 InPreviewHpBarChaseSeconds)
    {
        this.m_DisplayHpBarRatio = 0.0f;
        this.m_DisplayPreviewHpBarRatio = 0.0f;
        this.m_PreviewHpBarChaseSpeed = 0.0f;
        this.m_PreviewHpBarChaseSeconds = 0.7f;
        this.m_HpMaxAttributeRef = Attribute::HPMax;
        this.m_HpAttributeRef = Attribute::HP;
        this.m_bBarActive = true;
        this.m_StyleIndex = 0;
        this.m_bShowProjectileHp = false;
        this.m_bHasHpRatioInitialized = false;
        this.CachedPreviewHpBarRatioForLogic = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEntity(InEntity);
        this.SetPreviewHpBarChaseSeconds(InPreviewHpBarChaseSeconds);
        return;
    }
    FVM_MiniHPBarV2 opAssign(const FVM_MiniHPBarV2 &inout Other)
    {
        FVM_MiniHPBarV2 __r;
        this.m_Entity = Other.m_Entity;
        this.m_DisplayHpBarRatio = Other.m_DisplayHpBarRatio;
        this.m_DisplayPreviewHpBarRatio = Other.m_DisplayPreviewHpBarRatio;
        this.m_PreviewHpBarChaseSeconds = Other.m_PreviewHpBarChaseSeconds;
        this.m_PreviewHpBarChaseSpeed = Other.m_PreviewHpBarChaseSpeed;
        this.m_HpRatioSource = Other.m_HpRatioSource;
        this.m_PreviewHpBarRatioSource = Other.m_PreviewHpBarRatioSource;
        this.m_HpMaxAttributeRef = Other.m_HpMaxAttributeRef;
        this.m_HpAttributeRef = Other.m_HpAttributeRef;
        this.m_bBarActive = Other.m_bBarActive;
        this.m_StyleIndex = int(Other.m_StyleIndex);
        this.m_PlayerHpBar = Other.m_PlayerHpBar;
        this.m_bShowProjectileHp = Other.m_bShowProjectileHp;
        this.m_bHasHpRatioInitialized = Other.m_bHasHpRatioInitialized;
        return __r;
    }
    void PostConstruct()
    {
        this.CachedPreviewHpBarRatioForLogic = this.GetDisplayPreviewHpBarRatio();
        this.GetModify_PreviewHpBarRatioSource().SnapTo(this.GetDisplayPreviewHpBarRatio());
        return;
    }
    void SyncMiniHpBarSources()
    {
        Has local_4;
        bool local_5 = local_4.opCall();
        this.SetbShowProjectileHp(local_5);
        if (this.GetbShowProjectileHp())
        {
            this.GetModify_HpRatioSource().Reset();
            return;
        }
        GetDefaulted local_10;
        bool local_5_2 = local_10.opCall().bUseEnvBreakHPAttribute;
        if (local_5_2)
        {
            this.SetHpMaxAttributeRef(Attribute::EnvBreakHPMax);
            this.SetHpAttributeRef(Attribute::EnvBreakHP);
        }
        else
        {
            this.SetHpMaxAttributeRef(Attribute::HPMax);
            this.SetHpAttributeRef(Attribute::HP);
        }
        Has local_14;
        bool local_5_3 = local_14.opCall();
        if (local_5_3)
        {
            this.GetModify_HpRatioSource().Reset();
            return;
        }
        this.GetModify_HpRatioSource().SetAttribute(this.GetEntity(), this.GetHpAttributeRef(), this.GetHpMaxAttributeRef());
        return;
    }
    void RefreshHpBarStyle()
    {
        if (this.GetbShowProjectileHp())
        {
            this.SetStyleIndex(0);
            return;
        }
        this.SetStyleIndex(::MiniHpBarV2Style::GetStyleIndex(this.GetEntity(), this.GetContext().GetLocalPlayerPawn()));
        if (this.GetStyleIndex() == 2 && !(this.GetPlayerHpBar()))
        {
            this.SetPlayerHpBar(TEUIModelRef<FVM_PlayerHpBar>(::FVM_PlayerHpBar::Create(this.GetManager(), this.GetEntity())));
        }
        return;
    }
    void RefreshProjectileHpBar()
    {
        if (!(this.GetbShowProjectileHp()))
        {
            return;
        }
        this.ProjectileHpRatio(!(this.GetbHasHpRatioInitialized()));
        return;
    }
    void RefreshNearDeathHpBar()
    {
        Has local_4;
        if (this.GetbShowProjectileHp() || !(local_4.opCall()))
        {
            return;
        }
        this.UpdateNearDeathHpBar(!(this.GetbHasHpRatioInitialized()));
        return;
    }
    void RefreshAttributeHpBar()
    {
        bool local_6;
        if (this.GetbShowProjectileHp())
        {
            local_6 = true;
        }
        else
        {
            Has local_4;
            local_6 = local_4.opCall();
        }
        if (local_6)
        {
            return;
        }
        this.SetNewHpRatio(FMath::Clamp(this.GetHpRatioSource().GetRatioValue(), 0.0f, 1.0f), !(this.GetbHasHpRatioInitialized()));
        return;
    }
    void RefreshPreviewHpBarRatio()
    {
        this.SetDisplayPreviewHpBarRatio(0.0f);
        this.CachedPreviewHpBarRatioForLogic = this.GetDisplayPreviewHpBarRatio();
        return;
    }
    ESlateVisibility GetHpBarVisibility() const
    {
        int local_5;
        bool local_21;
        bool local_25;
        int local_34 = 0;
        int local_36 = 0;
        if (HeadsUpDisplay_Dev::CVar_EnableHeadsUpDisplay.GetBool())
        {
            if ((int(::FLevelUtils::GetCurrentLevelType())) == 1)
            {
                return ESlateVisibility(1);
            }
            else
            {
                if (this.GetbShowProjectileHp())
                {
                    return ESlateVisibility(4);
                }
                else
                {
                    Has local_10;
                    bool local_1 = local_10.opCall();
                    if (local_1)
                    {
                        if ((this.GetContext().GetLocalPlayerPawn() == this.GetEntity()))
                        {
                            local_5 = 1;
                        }
                        else
                        {
                            local_5 = 4;
                        }
                        return ESlateVisibility(local_5);
                    }
                    else
                    {
                        Has local_20;
                        local_1 = local_20.opCall();
                        if (local_1)
                        {
                            return ESlateVisibility(1);
                        }
                        else
                        {
                            if (!((this.GetStyleIndex()) == 0 && ::FASCommonUtils::IsAvatarPrefab(this.GetEntity())))
                            {
                                local_21 = false;
                            }
                            else
                            {
                                local_25 = ::FVMS_MiniHpBarV2Panel::Get(this.GetManager());
                                local_21 = local_25;
                            }
                            if (local_21)
                            {
                                float32 local_26;
                                local_26 = ::FVMS_MiniHpBarV2Panel::Get(this.GetManager()).GetEnemyAvatarAlwaysShowHpBarDistance();
                                FECSEntity local_14 = this.GetContext().GetLocalPlayerPawn();
                                if (!(local_34))
                                {
                                    local_25 = false;
                                }
                                else
                                {
                                    local_25 = local_36;
                                }
                                if (local_25)
                                {
                                    FVector local_54 = (FVector(local_34.GetPosition()) - local_36.GetPosition());
                                    float32 local_27 = local_26 * local_26;
                                    if (local_54.SizeSquared() < (local_27))
                                    {
                                        return ESlateVisibility(4);
                                    }
                                }
                            }
                            if (::FVMS_MiniHpBarV2Panel::Get(this.GetManager()) && ::FVMS_MiniHpBarV2Panel::Get(this.GetManager()).GetEntitySet().Contains(this.GetEntity()))
                            {
                                return ESlateVisibility(4);
                            }
                            else
                            {
                                return ESlateVisibility(1);
                            }
                        }
                    }
                }
            }
        }
        else
        {
            return ESlateVisibility(4);
        }
    }
    void OnAddSideHint(const FMsg_ChangeMiniHpBarActive &inout Msg)
    {
        if ((Msg.Entity == this.GetEntity()))
        {
            this.SetbBarActive(Msg.bBarActive);
        }
        return;
    }
    void UpdateNearDeathHpBar(const bool bFromEntityChange)
    {
        int local_6 = 0;
        float32 local_7;
        float32 local_9;
        local_7 = local_6.GetMaxNearDeathHP();
        local_9 = local_6.GetNearDeathHP();
        float32 local_10 = 0.0f;
        if (local_7 > 0.0f)
        {
            local_10 = local_9 / local_7;
        }
        this.SetNewHpRatio(local_10, bFromEntityChange);
        return;
    }
    void ProjectileHpRatio(const bool bFirstShow)
    {
        Get local_4;
        const FC_ProjectileHealth& local_6 = local_4.opCall();
        if (local_6)
        {
            Get local_12;
            const FC_ProjectileHealthConfig& local_14 = local_12.opCall();
            if (local_14)
            {
                float32 local_15;
                local_15 = 0.0f;
                if (int(local_14.CanBeHitCount) > 0)
                {
                    local_15 = local_6.GetRemainCanBeHitCount() / int(local_14.CanBeHitCount);
                }
                else
                {
                    if (local_14.DamageCanTake > 0.0f)
                    {
                        local_15 = local_6.GetRemainDamageCanTake() / local_14.DamageCanTake;
                    }
                }
                local_15 = FMath::Clamp(local_15, 0.0f, 1.0f);
                this.SetNewHpRatio(local_15, bFirstShow);
            }
        }
        return;
    }
    void SetNewHpRatio(const float32 HPRatio, const bool bFromEntityChange)
    {
        float32 local_8;
        float32 local_4 = FMath::Clamp(HPRatio, 0.0f, 1.0f);
        float32 local_5 = this.GetDisplayHpBarRatio();
        float32 local_6 = this.CachedPreviewHpBarRatioForLogic;
        this.SetDisplayHpBarRatio(local_4);
        if (bFromEntityChange)
        {
            this.SetPreviewHpBarChaseSpeed(0.0f);
            this.SetDisplayPreviewHpBarRatio(this.GetDisplayHpBarRatio());
            this.GetModify_PreviewHpBarRatioSource().SnapTo(this.GetDisplayHpBarRatio());
            this.SetbHasHpRatioInitialized(true);
            return;
        }
        if (FMath::Abs((this.GetDisplayHpBarRatio() - local_5)) > 0.001f)
        {
            if (this.GetDisplayHpBarRatio() > local_6)
            {
                this.SetPreviewHpBarChaseSpeed(0.0f);
                this.SetDisplayPreviewHpBarRatio(this.GetDisplayHpBarRatio());
                this.GetModify_PreviewHpBarRatioSource().SnapTo(this.GetDisplayHpBarRatio());
            }
            else
            {
                if (this.GetDisplayHpBarRatio() < local_5)
                {
                    if (this.GetPreviewHpBarChaseSeconds() > 0.0f)
                    {
                        float32 local_3 = this.GetDisplayHpBarRatio();
                        float32 local_1 = local_6 - local_3;
                        local_8 = local_1 / this.GetPreviewHpBarChaseSeconds();
                    }
                    else
                    {
                        local_8 = 0.0f;
                    }
                    this.SetPreviewHpBarChaseSpeed(local_8);
                    if (this.GetPreviewHpBarChaseSpeed() > 0.0f)
                    {
                        this.GetModify_PreviewHpBarRatioSource().SetInterpConstantTo(this.GetDisplayHpBarRatio(), this.GetPreviewHpBarChaseSpeed(), 0.0001f);
                    }
                    else
                    {
                        this.SetDisplayPreviewHpBarRatio(this.GetDisplayHpBarRatio());
                        this.GetModify_PreviewHpBarRatioSource().SnapTo(this.GetDisplayHpBarRatio());
                    }
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
    const float32 GetDisplayHpBarRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_DisplayHpBarRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDisplayHpBarRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DisplayHpBarRatio = __Value;
        return;
    }
    const float32 GetDisplayPreviewHpBarRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_DisplayPreviewHpBarRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDisplayPreviewHpBarRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DisplayPreviewHpBarRatio = __Value;
        return;
    }
    const float32 GetPreviewHpBarChaseSeconds() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_PreviewHpBarChaseSeconds() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetPreviewHpBarChaseSeconds(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PreviewHpBarChaseSeconds = __Value;
        return;
    }
    const float32 GetPreviewHpBarChaseSpeed() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_PreviewHpBarChaseSpeed() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetPreviewHpBarChaseSpeed(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PreviewHpBarChaseSpeed = __Value;
        return;
    }
    const FMW_AttributeRatio GetHpRatioSource() const property
    {
        const FMW_AttributeRatio __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FMW_AttributeRatio GetModify_HpRatioSource() property
    {
        FMW_AttributeRatio __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetHpRatioSource(const FMW_AttributeRatio &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_HpRatioSource = __Value;
        return;
    }
    const FMW_InterpFloat GetPreviewHpBarRatioSource() const property
    {
        const FMW_InterpFloat __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FMW_InterpFloat GetModify_PreviewHpBarRatioSource() property
    {
        FMW_InterpFloat __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetPreviewHpBarRatioSource(const FMW_InterpFloat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_PreviewHpBarRatioSource = __Value;
        return;
    }
    const FGameAttributeRef GetHpMaxAttributeRef() const property
    {
        const FGameAttributeRef __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FGameAttributeRef GetModify_HpMaxAttributeRef() property
    {
        FGameAttributeRef __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetHpMaxAttributeRef(const FGameAttributeRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_HpMaxAttributeRef = __Value;
        return;
    }
    const FGameAttributeRef GetHpAttributeRef() const property
    {
        const FGameAttributeRef __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FGameAttributeRef GetModify_HpAttributeRef() property
    {
        FGameAttributeRef __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetHpAttributeRef(const FGameAttributeRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_HpAttributeRef = __Value;
        return;
    }
    bool GetbBarActive() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bBarActive;
    }
    void SetbBarActive(const bool __Value) property
    {
        if (!(this.m_bBarActive) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bBarActive = __Value;
        return;
    }
    int GetStyleIndex() const property
    {
        this.TrackPropertyRead(10);
        return this.m_StyleIndex;
    }
    void SetStyleIndex(const int __Value) property
    {
        if (this.m_StyleIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_StyleIndex = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerHpBar> GetPlayerHpBar() const property
    {
        this.TrackPropertyRead(11);
        return this.m_PlayerHpBar;
    }
    void SetPlayerHpBar(const TEUIModelRef<FVM_PlayerHpBar> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerHpBar> local_2;
        local_2 = this.m_PlayerHpBar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_PlayerHpBar = __Value;
        return;
    }
    bool GetbShowProjectileHp() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bShowProjectileHp;
    }
    void SetbShowProjectileHp(const bool __Value) property
    {
        if (!(this.m_bShowProjectileHp) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bShowProjectileHp = __Value;
        return;
    }
    bool GetbHasHpRatioInitialized() const property
    {
        this.TrackPropertyRead(13);
        return this.m_bHasHpRatioInitialized;
    }
    void SetbHasHpRatioInitialized(const bool __Value) property
    {
        if (!(this.m_bHasHpRatioInitialized) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_bHasHpRatioInitialized = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MiniHPBarV2
{
    UPROPERTY()
    ESlateVisibility HpBarVisibility;
    UPROPERTY()
    TEUIModelRef<FVM_MiniHPBarV2> Self;


}

namespace MiniHpBarV2Style
{
int GetStyleIndex(const FECSEntity &inout Entity, const FECSEntity &inout PlayerPawn)
{
    if (!(Entity.IsValid()) || !(PlayerPawn.IsValid()))
    {
        return 0;
    }
    Has local_8;
    bool local_2 = local_8.opCall();
    if (local_2)
    {
        return 3;
    }
    switch (int((FASCommonUtils::GetEntityFactionRelation(Entity, PlayerPawn))))
    {
    case 2:
    {
        return 0;
    }
    case 4:
    {
        return 2;
    }
    case 1:
    {
        return 1;
    }
    case 3:
    default:
    {
    }
    }
    return 0;
}
}
namespace FVM_MiniHPBarV2
{
FVM_MiniHPBarV2& Create(const UObject ContextObject, const FECSEntity &inout Entity, const float32 PreviewHpBarChaseSeconds)
{
    return FVM_MiniHPBarV2::CreateByManager(EUIInternal::GetContextManager(ContextObject), Entity, PreviewHpBarChaseSeconds);
}
FVM_MiniHPBarV2 CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout Entity, const float32 PreviewHpBarChaseSeconds)
{
    FVM_MiniHPBarV2 __r;
    TEUIModelRef<FVM_MiniHPBarV2> local_6 = TEUIModelRef<FVM_MiniHPBarV2>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MiniHPBarV2::ModelId, 0, Entity, PreviewHpBarChaseSeconds));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
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
    local_14.PropertyName = "StyleIndex";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerHpBar";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerHpBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HpBarVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MiniHPBarV2>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MiniHPBarV2;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("HpRatioSource");
    int local_2_2 = FVM_MiniHPBarV2::__IndexOf_HpRatioSource();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("PreviewHpBarRatioSource");
    int local_2_3 = FVM_MiniHPBarV2::__IndexOf_PreviewHpBarRatioSource();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "SyncMiniHpBarSources";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshHpBarStyle";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshProjectileHpBar";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshNearDeathHpBar";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshAttributeHpBar";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshPreviewHpBarRatio";
    Result.EffectFunctions.Add(local_26);
    FEUIModelMsgHandleDefine local_36;
    local_36.FunctionName = "__OnAddSideHint";
    local_36.MessageTypeName = "Msg_ChangeMiniHpBarActive";
    local_36.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_36);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MiniHPBarV2;
}
void __OnAddSideHint(FVM_MiniHPBarV2 &inout Model, const FMsg_ChangeMiniHpBarActive &inout Message)
{
    Model.OnAddSideHint(Message);
    return;
}
float32 __UIGetter_DisplayHpBarRatio(const FVM_MiniHPBarV2 &inout Model)
{
    return Model.GetDisplayHpBarRatio();
}
float32 __UIGetter_DisplayPreviewHpBarRatio(const FVM_MiniHPBarV2 &inout Model)
{
    return Model.GetDisplayPreviewHpBarRatio();
}
int __UIGetter_StyleIndex(const FVM_MiniHPBarV2 &inout Model)
{
    return Model.GetStyleIndex();
}
TEUIModelRef<FVM_PlayerHpBar> __UIGetter_PlayerHpBar(const FVM_MiniHPBarV2 &inout Model)
{
    return Model.GetPlayerHpBar();
}
ESlateVisibility __UIGetter_HpBarVisibility(const FVM_MiniHPBarV2 &inout Model)
{
    return Model.GetHpBarVisibility();
}
TEUIModelRef<FVM_MiniHPBarV2> __UIGetter_Self(const FVM_MiniHPBarV2 &inout Model)
{
    return TEUIModelRef<FVM_MiniHPBarV2>(Model);
}
int __IndexOf_Entity()
{
    return 0;
}
int __IndexOf_DisplayHpBarRatio()
{
    return 1;
}
int __IndexOf_DisplayPreviewHpBarRatio()
{
    return 2;
}
int __IndexOf_PreviewHpBarChaseSeconds()
{
    return 3;
}
int __IndexOf_PreviewHpBarChaseSpeed()
{
    return 4;
}
int __IndexOf_HpRatioSource()
{
    return 5;
}
int __IndexOf_PreviewHpBarRatioSource()
{
    return 6;
}
int __IndexOf_HpMaxAttributeRef()
{
    return 7;
}
int __IndexOf_HpAttributeRef()
{
    return 8;
}
int __IndexOf_bBarActive()
{
    return 9;
}
int __IndexOf_StyleIndex()
{
    return 10;
}
int __IndexOf_PlayerHpBar()
{
    return 11;
}
int __IndexOf_bShowProjectileHp()
{
    return 12;
}
int __IndexOf_bHasHpRatioInitialized()
{
    return 13;
}
}
namespace __GeneratedProperties_FVM_MiniHPBarV2
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

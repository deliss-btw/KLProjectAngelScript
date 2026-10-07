
namespace FVMS_PlayerStatusV2
{
    const int ModelId = 0;

}
struct FVMS_PlayerStatusV2 : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerAvatarIcon> m_PlayerAvatarIconFirst;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerAvatarIcon> m_PlayerAvatarIconSecond;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerHpBar> m_PlayerHpBar;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerHitStunDetachBar> m_PlayerHitStunDetachBar;
    UPROPERTY()
    TEUIModelRef<FVM_BuffInfo> m_BuffInfoForPlayer1;
    UPROPERTY()
    TEUIModelRef<FVM_BuffInfo> m_BuffInfoForPlayer2;
    UPROPERTY()
    float32 m_PlayerStaminaRatio;
    UPROPERTY()
    FECSEntity m_PlayerPawnEntity;
    UPROPERTY()
    TArray<FECSEntity> m_AllPlayerPawnEntities;
    UPROPERTY()
    int m_PlayerPawnIndex;
    UPROPERTY()
    bool m_bHasNextAvatarIcon;
    UPROPERTY()
    FEUIInputAction m_SwitchAvatarInputAction;
    UPROPERTY()
    int m_PlayerStaminaRecoverState;
    UPROPERTY()
    float32 m_MaxPlayerHpBarScale;
    UPROPERTY()
    float32 m_MaxPlayerStaminaBarScale;
    UPROPERTY()
    float32 m_PlayerHpBarScale;
    UPROPERTY()
    float32 m_PlayerStaminaBarScale;
    UPROPERTY()
    int m_PlayerStaminaFullCounter;
    UPROPERTY()
    bool m_bGamepadLeftShoulderPress;
    UPROPERTY()
    FMW_AttributeValue m_HpMaxSource;
    UPROPERTY()
    FMW_AttributeRatio m_StaminaRatioSource;
    UPROPERTY()
    FMW_GameplayTagHas m_StaminaRecoverFasterTag;
    UPROPERTY()
    FMW_GameplayTagHas m_StaminaRecoverLowerTag;
    UPROPERTY()
    float32 CachedStaminaRatio;

    FVMS_PlayerStatusV2()
    {
        this.m_PlayerStaminaRatio = 1.0f;
        this.m_PlayerPawnIndex = 0;
        this.m_bHasNextAvatarIcon = false;
        this.m_PlayerStaminaRecoverState = 0;
        this.m_MaxPlayerHpBarScale = 2.0f;
        this.m_MaxPlayerStaminaBarScale = 2.0f;
        this.m_PlayerHpBarScale = 1.0f;
        this.m_PlayerStaminaBarScale = 1.0f;
        this.m_PlayerStaminaFullCounter = 0;
        this.m_bGamepadLeftShoulderPress = false;
        this.CachedStaminaRatio = 1.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_PlayerStatusV2(const FVMS_PlayerStatusV2 &inout Other)
    {
        this.m_PlayerStaminaRatio = 1.0f;
        this.m_PlayerPawnIndex = 0;
        this.m_bHasNextAvatarIcon = false;
        this.m_PlayerStaminaRecoverState = 0;
        this.m_MaxPlayerHpBarScale = 2.0f;
        this.m_MaxPlayerStaminaBarScale = 2.0f;
        this.m_PlayerHpBarScale = 1.0f;
        this.m_PlayerStaminaBarScale = 1.0f;
        this.m_PlayerStaminaFullCounter = 0;
        this.m_bGamepadLeftShoulderPress = false;
        this.CachedStaminaRatio = 1.0f;
        this.m_PlayerAvatarIconFirst = Other.m_PlayerAvatarIconFirst;
        this.m_PlayerAvatarIconSecond = Other.m_PlayerAvatarIconSecond;
        this.m_PlayerHpBar = Other.m_PlayerHpBar;
        this.m_PlayerHitStunDetachBar = Other.m_PlayerHitStunDetachBar;
        this.m_BuffInfoForPlayer1 = Other.m_BuffInfoForPlayer1;
        this.m_BuffInfoForPlayer2 = Other.m_BuffInfoForPlayer2;
        this.m_PlayerStaminaRatio = Other.m_PlayerStaminaRatio;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        this.m_AllPlayerPawnEntities = Other.m_AllPlayerPawnEntities;
        this.m_PlayerPawnIndex = int(Other.m_PlayerPawnIndex);
        this.m_bHasNextAvatarIcon = Other.m_bHasNextAvatarIcon;
        this.m_SwitchAvatarInputAction = Other.m_SwitchAvatarInputAction;
        this.m_PlayerStaminaRecoverState = int(Other.m_PlayerStaminaRecoverState);
        this.m_MaxPlayerHpBarScale = Other.m_MaxPlayerHpBarScale;
        this.m_MaxPlayerStaminaBarScale = Other.m_MaxPlayerStaminaBarScale;
        this.m_PlayerHpBarScale = Other.m_PlayerHpBarScale;
        this.m_PlayerStaminaBarScale = Other.m_PlayerStaminaBarScale;
        this.m_PlayerStaminaFullCounter = int(Other.m_PlayerStaminaFullCounter);
        this.m_bGamepadLeftShoulderPress = Other.m_bGamepadLeftShoulderPress;
        this.m_HpMaxSource = Other.m_HpMaxSource;
        this.m_StaminaRatioSource = Other.m_StaminaRatioSource;
        this.m_StaminaRecoverFasterTag = Other.m_StaminaRecoverFasterTag;
        this.m_StaminaRecoverLowerTag = Other.m_StaminaRecoverLowerTag;
        return;
    }
    FVMS_PlayerStatusV2& opAssign(const FVMS_PlayerStatusV2 &inout Other)
    {
        this.m_PlayerAvatarIconFirst = Other.m_PlayerAvatarIconFirst;
        this.m_PlayerAvatarIconSecond = Other.m_PlayerAvatarIconSecond;
        this.m_PlayerHpBar = Other.m_PlayerHpBar;
        this.m_PlayerHitStunDetachBar = Other.m_PlayerHitStunDetachBar;
        this.m_BuffInfoForPlayer1 = Other.m_BuffInfoForPlayer1;
        this.m_BuffInfoForPlayer2 = Other.m_BuffInfoForPlayer2;
        this.m_PlayerStaminaRatio = Other.m_PlayerStaminaRatio;
        this.m_PlayerPawnEntity = Other.m_PlayerPawnEntity;
        this.m_AllPlayerPawnEntities = Other.m_AllPlayerPawnEntities;
        this.m_PlayerPawnIndex = int(Other.m_PlayerPawnIndex);
        this.m_bHasNextAvatarIcon = Other.m_bHasNextAvatarIcon;
        this.m_SwitchAvatarInputAction = Other.m_SwitchAvatarInputAction;
        this.m_PlayerStaminaRecoverState = int(Other.m_PlayerStaminaRecoverState);
        this.m_MaxPlayerHpBarScale = Other.m_MaxPlayerHpBarScale;
        this.m_MaxPlayerStaminaBarScale = Other.m_MaxPlayerStaminaBarScale;
        this.m_PlayerHpBarScale = Other.m_PlayerHpBarScale;
        this.m_PlayerStaminaBarScale = Other.m_PlayerStaminaBarScale;
        this.m_PlayerStaminaFullCounter = int(Other.m_PlayerStaminaFullCounter);
        this.m_bGamepadLeftShoulderPress = Other.m_bGamepadLeftShoulderPress;
        this.m_HpMaxSource = Other.m_HpMaxSource;
        this.m_StaminaRatioSource = Other.m_StaminaRatioSource;
        this.m_StaminaRecoverFasterTag = Other.m_StaminaRecoverFasterTag;
        return Other.m_StaminaRecoverLowerTag;
    }
    void LoadConfigDefault(const FVMS_PlayerStatusV2ConfigDefault &inout InConfig)
    {
        this.SetMaxPlayerStaminaBarScale(InConfig.MaxPlayerStaminaBarScale);
        this.SetMaxPlayerHpBarScale(InConfig.MaxPlayerHpBarScale);
        return;
    }
    void PostConstruct()
    {
        this.SetPlayerPawnEntity(this.GetContext().GetLocalPlayerPawn());
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        Get local_8;
        const FC_PlayerController& local_10 = local_8.opCall();
        if (local_10)
        {
            this.SetAllPlayerPawnEntities(local_10.GetAllPlayerPawnEntities());
        }
        this.RefeshPlayerPawnIndex();
        FECSEntity local_4_2 = this.GetPawnEntityByIndex(0);
        FECSEntity local_16 = this.GetPawnEntityByIndex(1);
        this.SetPlayerAvatarIconFirst(TEUIModelRef<FVM_PlayerAvatarIcon>(::FVM_PlayerAvatarIcon::Create(this.GetContext().Manager, local_4_2)));
        this.SetPlayerAvatarIconSecond(TEUIModelRef<FVM_PlayerAvatarIcon>(::FVM_PlayerAvatarIcon::Create(this.GetContext().Manager, local_16)));
        this.SetbHasNextAvatarIcon(local_16.IsValid());
        this.SetPlayerHpBar(TEUIModelRef<FVM_PlayerHpBar>(::FVM_PlayerHpBar::Create(this.GetContext().Manager, this.GetPlayerPawnEntity())));
        this.SetPlayerHitStunDetachBar(TEUIModelRef<FVM_PlayerHitStunDetachBar>(::FVM_PlayerHitStunDetachBar::Create(this.GetContext().Manager, this.GetPlayerPawnEntity())));
        return;
    }
    void SyncPlayerAttributeSources()
    {
        if (!(this.GetPlayerPawnEntity().IsValid()))
        {
            this.GetModify_HpMaxSource().Reset();
            this.GetModify_StaminaRatioSource().Reset();
            this.GetModify_StaminaRecoverFasterTag().Reset();
            this.GetModify_StaminaRecoverLowerTag().Reset();
            return;
        }
        this.GetModify_HpMaxSource().SetAttribute(this.GetPlayerPawnEntity(), Attribute::HPMax);
        this.GetModify_StaminaRatioSource().SetAttribute(this.GetPlayerPawnEntity(), Attribute::Stamina, Attribute::StaminaMax);
        this.GetModify_StaminaRecoverFasterTag().SetTag(this.GetPlayerPawnEntity(), GameplayTags::CombatState_UIState_StaminaRecoverFaster);
        this.GetModify_StaminaRecoverLowerTag().SetTag(this.GetPlayerPawnEntity(), GameplayTags::CombatState_UIState_StaminaRecoverLower);
        return;
    }
    void RefreshHpBarScale()
    {
        float32 local_2 = 0.0f;
        int local_10 = 0;
        float32 local_13;
        if (local_2 <= 0.0f)
        {
            return;
        }
        if (!(local_10))
        {
            return;
        }
        float32 local_1 = local_10.GetAttributeBaseValue(Attribute::HPMax, this.GetContext().Time);
        if (local_1 > 0.0f)
        {
            local_13 = local_2 / local_1;
        }
        else
        {
            local_13 = 1.0f;
        }
        this.SetPlayerHpBarScale(FMath::Clamp(local_13, 0.0f, this.GetMaxPlayerHpBarScale()));
        return;
    }
    void RefreshStaminaDisplay()
    {
        int local_16 = 0;
        float32 local_17;
        float32 local_2 = this.GetStaminaRatioSource().GetMaxValue();
        if (local_2 <= 0.0f)
        {
            return;
        }
        float32 local_7 = FMath::Clamp(this.GetStaminaRatioSource().GetRatioValue(), 0.0f, 1.0f);
        if ((this.CachedStaminaRatio < 1.0f && (local_7 >= 1.0f)))
        {
            this.SetPlayerStaminaFullCounter((this.GetPlayerStaminaFullCounter() + 1));
        }
        this.CachedStaminaRatio = local_7;
        this.SetPlayerStaminaRatio(local_7);
        if (local_16)
        {
            float32 local_5 = local_16.GetAttributeBaseValue(Attribute::StaminaMax, this.GetContext().Time);
            if (local_5 > 0.0f)
            {
                local_17 = local_2 / local_5;
            }
            else
            {
                local_17 = 1.0f;
            }
            this.SetPlayerStaminaBarScale(FMath::Clamp(local_17, 0.0f, this.GetMaxPlayerStaminaBarScale()));
        }
        return;
    }
    void RefreshStaminaRecoverState()
    {
        // body not fully recovered вЂ” stub [unresolved-operand]
    }
    void MonitorPlayerControllerChanged(const FC_PlayerController &inout PlayerController)
    {
        if (!(PlayerController))
        {
            this.SetBuffInfoForPlayer1(TEUIModelRef<FVM_BuffInfo>(nullptr));
            this.SetBuffInfoForPlayer2(TEUIModelRef<FVM_BuffInfo>(nullptr));
            this.SetPlayerPawnEntity(ENTITY_NULL);
            return;
        }
        bool local_5 = false;
        if (this.GetAllPlayerPawnEntities().Num() != PlayerController.GetAllPlayerPawnEntities().Num())
        {
            local_5 = true;
        }
        else
        {
            int local_8 = 0;
            for (; local_8 < this.GetAllPlayerPawnEntities().Num(); ++local_8)
            {
                if (!((FECSEntity(this.GetAllPlayerPawnEntities()[local_8]) == PlayerController.GetAllPlayerPawnEntities()[local_8])))
                {
                    local_5 = true;
                    break;
                }
            }
        }
        if (local_5)
        {
            this.SetAllPlayerPawnEntities(PlayerController.GetAllPlayerPawnEntities());
            FECSEntity local_12 = this.GetPawnEntityByIndex(0);
            FECSEntity local_16 = this.GetPawnEntityByIndex(1);
            TEUIModelRef<FVM_PlayerAvatarIcon> local_22 = this.GetPlayerAvatarIconFirst();
            local_12.SetTargetEntity();
            TEUIModelRef<FVM_PlayerAvatarIcon> local_22_2 = this.GetPlayerAvatarIconSecond();
            local_16.SetTargetEntity();
            this.SetBuffInfoForPlayer1(TEUIModelRef<FVM_BuffInfo>(::FVM_BuffInfo::Create(this.GetContext().Manager, local_12)));
            this.SetBuffInfoForPlayer2(TEUIModelRef<FVM_BuffInfo>(::FVM_BuffInfo::Create(this.GetContext().Manager, local_16)));
        }
        TEUIModelRef<FVM_PlayerAvatarIcon> local_22_3 = this.GetPlayerAvatarIconSecond();
        this.SetbHasNextAvatarIcon(GetTargetEntity().IsValid());
        bool local_23 = false;
        if (!((FECSEntity(this.GetPlayerPawnEntity()) == PlayerController.GetPlayerPawnEntity())))
        {
            local_23 = this.GetAllPlayerPawnEntities().Contains(PlayerController.GetPlayerPawnEntity());
            if (local_23)
            {
                this.SetPlayerPawnEntity(PlayerController.GetPlayerPawnEntity());
                if (this.GetPlayerHpBar().IsValid())
                {
                    TEUIModelRef<FVM_PlayerHpBar> local_26 = this.GetPlayerHpBar();
                    this.GetPlayerPawnEntity().SetEntity();
                }
                if (this.GetPlayerHitStunDetachBar().IsValid())
                {
                    TEUIModelRef<FVM_PlayerHitStunDetachBar> local_28 = this.GetPlayerHitStunDetachBar();
                    this.GetPlayerPawnEntity().SetEntity();
                }
            }
        }
        if (local_5 || local_23)
        {
            this.RefeshPlayerPawnIndex();
            this.SetSwitchAvatarInputAction(FEUIInputAction(FCharacterInputUtils::GetInputActionByMainInputName(this.GetPlayerPawnEntity(), n"SwitchAvatar")));
        }
        return;
    }
    FECSEntity GetPawnEntityByIndex(const int Index)
    {
        if (this.GetAllPlayerPawnEntities().Num() <= Index)
        {
            return ENTITY_NULL;
        }
        return this.GetAllPlayerPawnEntities()[Index];
    }
    void RefeshPlayerPawnIndex()
    {
        this.SetPlayerPawnIndex(this.GetAllPlayerPawnEntities().IndexOfByKey(this.GetPlayerPawnEntity()));
        return;
    }
    FText GetPlayerHpNumberText() const
    {
        if (this.GetPlayerHpBar().IsValid())
        {
            TEUIModelRef<FVM_PlayerHpBar> local_2 = this.GetPlayerHpBar();
            return GetHpNumberText();
        }
        return FText();
    }
    ESlateVisibility DebugPlayerStatusVisibility() const
    {
        return ESlateVisibility(4);
    }
    bool HasNextPlayerAvatarIcon() const
    {
        return this.GetbHasNextAvatarIcon();
    }
    ESlateVisibility GetBuffInfoEntity1StatusVisibility() const
    {
        if (this.GetBuffInfoForPlayer1().IsValid())
        {
            TEUIModelRef<FVM_BuffInfo> local_2 = this.GetBuffInfoForPlayer1();
            FECSEntity local_12 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(GetTargetEntity());
            TEUIModelRef<FVM_BuffInfo> local_2_2 = this.GetBuffInfoForPlayer1();
            if ((local_12 == GetTargetEntity()))
            {
                return ESlateVisibility(4);
            }
        }
        return ESlateVisibility(1);
    }
    ESlateVisibility GetBuffInfoEntity2StatusVisibility() const
    {
        if (this.GetBuffInfoForPlayer2().IsValid())
        {
            TEUIModelRef<FVM_BuffInfo> local_2 = this.GetBuffInfoForPlayer2();
            FECSEntity local_12 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(GetTargetEntity());
            TEUIModelRef<FVM_BuffInfo> local_2_2 = this.GetBuffInfoForPlayer2();
            if ((local_12 == GetTargetEntity()))
            {
                return ESlateVisibility(4);
            }
        }
        return ESlateVisibility(1);
    }
    TEUIModelRef<FVM_PlayerAvatarIcon> GetPlayerAvatarIconFirst() const property
    {
        this.TrackPropertyRead(0);
        return this.m_PlayerAvatarIconFirst;
    }
    void SetPlayerAvatarIconFirst(const TEUIModelRef<FVM_PlayerAvatarIcon> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerAvatarIcon> local_2;
        local_2 = this.m_PlayerAvatarIconFirst;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerAvatarIconFirst = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerAvatarIcon> GetPlayerAvatarIconSecond() const property
    {
        this.TrackPropertyRead(1);
        return this.m_PlayerAvatarIconSecond;
    }
    void SetPlayerAvatarIconSecond(const TEUIModelRef<FVM_PlayerAvatarIcon> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerAvatarIcon> local_2;
        local_2 = this.m_PlayerAvatarIconSecond;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PlayerAvatarIconSecond = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerHpBar> GetPlayerHpBar() const property
    {
        this.TrackPropertyRead(2);
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
        this.MarkPropertyDirty(2);
        this.m_PlayerHpBar = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerHitStunDetachBar> GetPlayerHitStunDetachBar() const property
    {
        this.TrackPropertyRead(3);
        return this.m_PlayerHitStunDetachBar;
    }
    void SetPlayerHitStunDetachBar(const TEUIModelRef<FVM_PlayerHitStunDetachBar> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerHitStunDetachBar> local_2;
        local_2 = this.m_PlayerHitStunDetachBar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PlayerHitStunDetachBar = __Value;
        return;
    }
    TEUIModelRef<FVM_BuffInfo> GetBuffInfoForPlayer1() const property
    {
        this.TrackPropertyRead(4);
        return this.m_BuffInfoForPlayer1;
    }
    void SetBuffInfoForPlayer1(const TEUIModelRef<FVM_BuffInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_BuffInfo> local_2;
        local_2 = this.m_BuffInfoForPlayer1;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_BuffInfoForPlayer1 = __Value;
        return;
    }
    TEUIModelRef<FVM_BuffInfo> GetBuffInfoForPlayer2() const property
    {
        this.TrackPropertyRead(5);
        return this.m_BuffInfoForPlayer2;
    }
    void SetBuffInfoForPlayer2(const TEUIModelRef<FVM_BuffInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_BuffInfo> local_2;
        local_2 = this.m_BuffInfoForPlayer2;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_BuffInfoForPlayer2 = __Value;
        return;
    }
    const float32 GetPlayerStaminaRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_PlayerStaminaRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetPlayerStaminaRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_PlayerStaminaRatio = __Value;
        return;
    }
    FECSEntity GetPlayerPawnEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FECSEntity GetModify_PlayerPawnEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetPlayerPawnEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_PlayerPawnEntity = __Value;
        return;
    }
    const TArray<FECSEntity> GetAllPlayerPawnEntities() const property
    {
        const TArray<FECSEntity> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TArray<FECSEntity> GetModify_AllPlayerPawnEntities() property
    {
        TArray<FECSEntity> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetAllPlayerPawnEntities(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_AllPlayerPawnEntities = __Value;
        return;
    }
    int GetPlayerPawnIndex() const property
    {
        this.TrackPropertyRead(9);
        return this.m_PlayerPawnIndex;
    }
    void SetPlayerPawnIndex(const int __Value) property
    {
        if (this.m_PlayerPawnIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_PlayerPawnIndex = __Value;
        return;
    }
    bool GetbHasNextAvatarIcon() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bHasNextAvatarIcon;
    }
    void SetbHasNextAvatarIcon(const bool __Value) property
    {
        if (!(this.m_bHasNextAvatarIcon) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bHasNextAvatarIcon = __Value;
        return;
    }
    const FEUIInputAction GetSwitchAvatarInputAction() const property
    {
        const FEUIInputAction __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FEUIInputAction GetModify_SwitchAvatarInputAction() property
    {
        FEUIInputAction __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetSwitchAvatarInputAction(const FEUIInputAction &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_SwitchAvatarInputAction = __Value;
        return;
    }
    int GetPlayerStaminaRecoverState() const property
    {
        this.TrackPropertyRead(12);
        return this.m_PlayerStaminaRecoverState;
    }
    void SetPlayerStaminaRecoverState(const int __Value) property
    {
        if (this.m_PlayerStaminaRecoverState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_PlayerStaminaRecoverState = __Value;
        return;
    }
    const float32 GetMaxPlayerHpBarScale() const property
    {
        const float32 __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    float32 GetModify_MaxPlayerHpBarScale() property
    {
        float32 __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetMaxPlayerHpBarScale(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_MaxPlayerHpBarScale = __Value;
        return;
    }
    const float32 GetMaxPlayerStaminaBarScale() const property
    {
        const float32 __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    float32 GetModify_MaxPlayerStaminaBarScale() property
    {
        float32 __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetMaxPlayerStaminaBarScale(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_MaxPlayerStaminaBarScale = __Value;
        return;
    }
    const float32 GetPlayerHpBarScale() const property
    {
        const float32 __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    float32 GetModify_PlayerHpBarScale() property
    {
        float32 __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetPlayerHpBarScale(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_PlayerHpBarScale = __Value;
        return;
    }
    const float32 GetPlayerStaminaBarScale() const property
    {
        const float32 __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    float32 GetModify_PlayerStaminaBarScale() property
    {
        float32 __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetPlayerStaminaBarScale(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_PlayerStaminaBarScale = __Value;
        return;
    }
    int GetPlayerStaminaFullCounter() const property
    {
        this.TrackPropertyRead(17);
        return this.m_PlayerStaminaFullCounter;
    }
    void SetPlayerStaminaFullCounter(const int __Value) property
    {
        if (this.m_PlayerStaminaFullCounter == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_PlayerStaminaFullCounter = __Value;
        return;
    }
    bool GetbGamepadLeftShoulderPress() const property
    {
        this.TrackPropertyRead(18);
        return this.m_bGamepadLeftShoulderPress;
    }
    void SetbGamepadLeftShoulderPress(const bool __Value) property
    {
        if (!(this.m_bGamepadLeftShoulderPress) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_bGamepadLeftShoulderPress = __Value;
        return;
    }
    const FMW_AttributeValue GetHpMaxSource() const property
    {
        const FMW_AttributeValue __r;
        this.TrackPropertyRead(19);
        return __r;
    }
    FMW_AttributeValue GetModify_HpMaxSource() property
    {
        FMW_AttributeValue __r;
        this.MarkPropertyDirty(19);
        return __r;
    }
    void SetHpMaxSource(const FMW_AttributeValue &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_HpMaxSource = __Value;
        return;
    }
    const FMW_AttributeRatio GetStaminaRatioSource() const property
    {
        const FMW_AttributeRatio __r;
        this.TrackPropertyRead(20);
        return __r;
    }
    FMW_AttributeRatio GetModify_StaminaRatioSource() property
    {
        FMW_AttributeRatio __r;
        this.MarkPropertyDirty(20);
        return __r;
    }
    void SetStaminaRatioSource(const FMW_AttributeRatio &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_StaminaRatioSource = __Value;
        return;
    }
    const FMW_GameplayTagHas GetStaminaRecoverFasterTag() const property
    {
        const FMW_GameplayTagHas __r;
        this.TrackPropertyRead(21);
        return __r;
    }
    FMW_GameplayTagHas GetModify_StaminaRecoverFasterTag() property
    {
        FMW_GameplayTagHas __r;
        this.MarkPropertyDirty(21);
        return __r;
    }
    void SetStaminaRecoverFasterTag(const FMW_GameplayTagHas &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_StaminaRecoverFasterTag = __Value;
        return;
    }
    const FMW_GameplayTagHas GetStaminaRecoverLowerTag() const property
    {
        const FMW_GameplayTagHas __r;
        this.TrackPropertyRead(22);
        return __r;
    }
    FMW_GameplayTagHas GetModify_StaminaRecoverLowerTag() property
    {
        FMW_GameplayTagHas __r;
        this.MarkPropertyDirty(22);
        return __r;
    }
    void SetStaminaRecoverLowerTag(const FMW_GameplayTagHas &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_StaminaRecoverLowerTag = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_PlayerStatusV2
{
    UPROPERTY()
    FText PlayerHpNumberText;
    UPROPERTY()
    ESlateVisibility DebugPlayerStatusVisibility;
    UPROPERTY()
    bool HasNextPlayerAvatarIcon;
    UPROPERTY()
    ESlateVisibility BuffInfoEntity1StatusVisibility;
    UPROPERTY()
    ESlateVisibility BuffInfoEntity2StatusVisibility;
    UPROPERTY()
    TEUIModelRef<FVMS_PlayerStatusV2> Self;


}

namespace FVMS_PlayerStatusV2
{
FVMS_PlayerStatusV2& Get(const UObject ContextObject)
{
    return FVMS_PlayerStatusV2::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_PlayerStatusV2 GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_PlayerStatusV2 __r;
    TEUIModelRef<FVMS_PlayerStatusV2> local_6 = TEUIModelRef<FVMS_PlayerStatusV2>(EUIInternal::MakeModelWithManager(Manager, FVMS_PlayerStatusV2::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(true);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "PlayerAvatarIconFirst";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerAvatarIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerAvatarIconSecond";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerAvatarIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerHpBar";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerHpBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerHitStunDetachBar";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerHitStunDetachBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BuffInfoForPlayer1";
    local_14.TypeName = "TEUIModelRef<FVM_BuffInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BuffInfoForPlayer2";
    local_14.TypeName = "TEUIModelRef<FVM_BuffInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerStaminaRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasNextAvatarIcon";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SwitchAvatarInputAction";
    local_14.TypeName = "FEUIInputAction";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerStaminaRecoverState";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerHpNumberText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DebugPlayerStatusVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasNextPlayerAvatarIcon";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BuffInfoEntity1StatusVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BuffInfoEntity2StatusVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_PlayerStatusV2>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_PlayerStatusV2;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("HpMaxSource");
    int local_2_2 = FVMS_PlayerStatusV2::__IndexOf_HpMaxSource();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("StaminaRatioSource");
    int local_2_3 = FVMS_PlayerStatusV2::__IndexOf_StaminaRatioSource();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("StaminaRecoverFasterTag");
    int local_2_4 = FVMS_PlayerStatusV2::__IndexOf_StaminaRecoverFasterTag();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("StaminaRecoverLowerTag");
    int local_2_5 = FVMS_PlayerStatusV2::__IndexOf_StaminaRecoverLowerTag();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "SyncPlayerAttributeSources";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshHpBarScale";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshStaminaDisplay";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshStaminaRecoverState";
    Result.EffectFunctions.Add(local_26);
    FEUIModelMonitorDefine local_36;
    local_36.FunctionName = "__MonitorPlayerControllerChanged";
    local_36.ComponentType = FC_PlayerController;
    Result.MonitorFunctions.Add(local_36);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_PlayerStatusV2;
}
void __MonitorPlayerControllerChanged(FVMS_PlayerStatusV2 &inout Model, const FECSEntity &inout Entity, const FC_PlayerController &inout Component)
{
    Model.MonitorPlayerControllerChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TEUIModelRef<FVM_PlayerAvatarIcon> __UIGetter_PlayerAvatarIconFirst(const FVMS_PlayerStatusV2 &inout Model)
{
    return Model.GetPlayerAvatarIconFirst();
}
TEUIModelRef<FVM_PlayerAvatarIcon> __UIGetter_PlayerAvatarIconSecond(const FVMS_PlayerStatusV2 &inout Model)
{
    return Model.GetPlayerAvatarIconSecond();
}
TEUIModelRef<FVM_PlayerHpBar> __UIGetter_PlayerHpBar(const FVMS_PlayerStatusV2 &inout Model)
{
    return Model.GetPlayerHpBar();
}
TEUIModelRef<FVM_PlayerHitStunDetachBar> __UIGetter_PlayerHitStunDetachBar(const FVMS_PlayerStatusV2 &inout Model)
{
    return Model.GetPlayerHitStunDetachBar();
}
TEUIModelRef<FVM_BuffInfo> __UIGetter_BuffInfoForPlayer1(const FVMS_PlayerStatusV2 &inout Model)
{
    return Model.GetBuffInfoForPlayer1();
}
TEUIModelRef<FVM_BuffInfo> __UIGetter_BuffInfoForPlayer2(const FVMS_PlayerStatusV2 &inout Model)
{
    return Model.GetBuffInfoForPlayer2();
}
float32 __UIGetter_PlayerStaminaRatio(const FVMS_PlayerStatusV2 &inout Model)
{
    return Model.GetPlayerStaminaRatio();
}
bool __UIGetter_bHasNextAvatarIcon(const FVMS_PlayerStatusV2 &inout Model)
{
    return Model.GetbHasNextAvatarIcon();
}
FEUIInputAction __UIGetter_SwitchAvatarInputAction(const FVMS_PlayerStatusV2 &inout Model)
{
    return Model.GetSwitchAvatarInputAction();
}
int __UIGetter_PlayerStaminaRecoverState(const FVMS_PlayerStatusV2 &inout Model)
{
    return Model.GetPlayerStaminaRecoverState();
}
FText __UIGetter_PlayerHpNumberText(const FVMS_PlayerStatusV2 &inout Model)
{
    return Model.GetPlayerHpNumberText();
}
ESlateVisibility __UIGetter_DebugPlayerStatusVisibility(const FVMS_PlayerStatusV2 &inout Model)
{
    return Model.DebugPlayerStatusVisibility();
}
bool __UIGetter_HasNextPlayerAvatarIcon(const FVMS_PlayerStatusV2 &inout Model)
{
    return Model.HasNextPlayerAvatarIcon();
}
ESlateVisibility __UIGetter_BuffInfoEntity1StatusVisibility(const FVMS_PlayerStatusV2 &inout Model)
{
    return Model.GetBuffInfoEntity1StatusVisibility();
}
ESlateVisibility __UIGetter_BuffInfoEntity2StatusVisibility(const FVMS_PlayerStatusV2 &inout Model)
{
    return Model.GetBuffInfoEntity2StatusVisibility();
}
TEUIModelRef<FVMS_PlayerStatusV2> __UIGetter_Self(const FVMS_PlayerStatusV2 &inout Model)
{
    return TEUIModelRef<FVMS_PlayerStatusV2>(Model);
}
int __IndexOf_PlayerAvatarIconFirst()
{
    return 0;
}
int __IndexOf_PlayerAvatarIconSecond()
{
    return 1;
}
int __IndexOf_PlayerHpBar()
{
    return 2;
}
int __IndexOf_PlayerHitStunDetachBar()
{
    return 3;
}
int __IndexOf_BuffInfoForPlayer1()
{
    return 4;
}
int __IndexOf_BuffInfoForPlayer2()
{
    return 5;
}
int __IndexOf_PlayerStaminaRatio()
{
    return 6;
}
int __IndexOf_PlayerPawnEntity()
{
    return 7;
}
int __IndexOf_AllPlayerPawnEntities()
{
    return 8;
}
int __IndexOf_PlayerPawnIndex()
{
    return 9;
}
int __IndexOf_bHasNextAvatarIcon()
{
    return 10;
}
int __IndexOf_SwitchAvatarInputAction()
{
    return 11;
}
int __IndexOf_PlayerStaminaRecoverState()
{
    return 12;
}
int __IndexOf_MaxPlayerHpBarScale()
{
    return 13;
}
int __IndexOf_MaxPlayerStaminaBarScale()
{
    return 14;
}
int __IndexOf_PlayerHpBarScale()
{
    return 15;
}
int __IndexOf_PlayerStaminaBarScale()
{
    return 16;
}
int __IndexOf_PlayerStaminaFullCounter()
{
    return 17;
}
int __IndexOf_bGamepadLeftShoulderPress()
{
    return 18;
}
int __IndexOf_HpMaxSource()
{
    return 19;
}
int __IndexOf_StaminaRatioSource()
{
    return 20;
}
int __IndexOf_StaminaRecoverFasterTag()
{
    return 21;
}
int __IndexOf_StaminaRecoverLowerTag()
{
    return 22;
}
}
namespace __GeneratedProperties_FVMS_PlayerStatusV2
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

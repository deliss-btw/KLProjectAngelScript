
enum EBossHpBarDisplayReason
{
    None,
    TeamHit,
    PlayerSoftLock,
    PlayerHit,
    PlayerLock,
}

namespace FVMS_BossHpBar
{
    const int ModelId = 0;

}
struct FVMS_BossHpBar : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    float32 m_HitShowHpBarDistance;
    UPROPERTY()
    float32 m_HideHpBarDistance;
    UPROPERTY()
    float32 m_DelayHideHpBarSeconds;
    UPROPERTY()
    float32 m_PreviewHpBarChaseSeconds;
    UPROPERTY()
    TEUIModelRef<FVM_BuffInfo> m_VM_BuffInfo;
    UPROPERTY()
    FText m_BossDisplayPrefix;
    UPROPERTY()
    FText m_BossDisplayName;
    UPROPERTY()
    FECSEntity m_DisplayBossEntity;
    UPROPERTY()
    FECSEntity m_HpTargetEntity;
    UPROPERTY()
    FECSEntity m_PostureTargetEntity;
    UPROPERTY()
    EBossHpBarDisplayReason m_DisplayReason;
    UPROPERTY()
    float32 m_DisplayHpBarRatio;
    UPROPERTY()
    float32 m_DisplayPreviewHpBarRatio;
    UPROPERTY()
    float32 m_PreviewHpBarChaseSpeed;
    UPROPERTY()
    int m_HpBarSegment;
    UPROPERTY()
    int m_MaxHpBarSegment;
    UPROPERTY()
    int m_DivineStatus;
    UPROPERTY()
    FSoftBrush m_DivineLiteraryNormal;
    UPROPERTY()
    FSoftBrush m_DivineLiteraryStrengthening;
    UPROPERTY()
    FSoftBrush m_DivineLiteraryWeaken;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_BossHpSegmentIcon>> m_HpSegmentIconVMList;
    UPROPERTY()
    float32 m_PostureBarRatio;
    UPROPERTY()
    TArray<float32> m_PosturePhaseList;
    UPROPERTY()
    TArray<FEUIDynamicWidgetData> m_BuffDataList;
    UPROPERTY()
    FECSEntity m_LockBossEntity;
    UPROPERTY()
    FECSEntity m_OldSoftLockBossEntity;
    UPROPERTY()
    ESlateVisibility m_CachedVisibility;
    UPROPERTY()
    float m_HideHpBarTime;
    UPROPERTY()
    int m_ExecutedState;
    UPROPERTY()
    float32 m_ExecutedWaitTimeRatio;
    UPROPERTY()
    ESlateVisibility m_ExecutedWaitTextVisiblity;
    UPROPERTY()
    TArray<FEUIModelContainer> m_ExecuteEntityDataList;
    UPROPERTY()
    int m_ExecuteCanJoinState;
    UPROPERTY()
    ESlateVisibility m_BossLowHpTipsVisibility;
    UPROPERTY()
    FMW_AttributeRatio m_HpRatioSource;
    UPROPERTY()
    FMW_InterpFloat m_PreviewHpBarRatioSource;
    UPROPERTY()
    FMW_AttributeRatio m_PostureRatioSource;
    UPROPERTY()
    FMW_GameplayTagHas m_DivineBurstTag;
    UPROPERTY()
    FMW_GameplayTagHas m_DivineChaosTag;
    UPROPERTY()
    FMW_InterpFloat m_ExecutedWaitTimeSource;
    UPROPERTY()
    bool m_bHasHpRatioInitialized;
    UPROPERTY()
    float32 CachedPreviewHpBarRatioForLogic;
    UPROPERTY()
    FEUITimerHandle m_HideHpBarCheckTimer;

    FVMS_BossHpBar()
    {
        this.m_DisplayReason = EBossHpBarDisplayReason(0);
        this.m_DisplayHpBarRatio = 0.0f;
        this.m_DisplayPreviewHpBarRatio = 0.0f;
        this.m_PreviewHpBarChaseSpeed = 0.0f;
        this.m_HpBarSegment = 0;
        this.m_MaxHpBarSegment = 0;
        this.m_PostureBarRatio = 0.0f;
        this.m_HitShowHpBarDistance = 1500.0f;
        this.m_HideHpBarDistance = 1500.0f;
        this.m_DelayHideHpBarSeconds = 2.0f;
        this.m_PreviewHpBarChaseSeconds = 0.7f;
        this.m_DivineStatus = 0;
        this.m_CachedVisibility = ESlateVisibility(1);
        this.m_HideHpBarTime = -1.0;
        this.m_ExecutedState = 0;
        this.m_ExecutedWaitTimeRatio = 1.0f;
        this.m_ExecutedWaitTextVisiblity = ESlateVisibility(4);
        this.m_ExecuteCanJoinState = 0;
        this.m_BossLowHpTipsVisibility = ESlateVisibility(1);
        this.m_bHasHpRatioInitialized = false;
        this.CachedPreviewHpBarRatioForLogic = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_BossHpBar(const FVMS_BossHpBar &inout Other)
    {
        this.m_DisplayReason = EBossHpBarDisplayReason(0);
        this.m_DisplayHpBarRatio = 0.0f;
        this.m_DisplayPreviewHpBarRatio = 0.0f;
        this.m_PreviewHpBarChaseSpeed = 0.0f;
        this.m_HpBarSegment = 0;
        this.m_MaxHpBarSegment = 0;
        this.m_PostureBarRatio = 0.0f;
        this.m_HitShowHpBarDistance = 1500.0f;
        this.m_HideHpBarDistance = 1500.0f;
        this.m_DelayHideHpBarSeconds = 2.0f;
        this.m_PreviewHpBarChaseSeconds = 0.7f;
        this.m_DivineStatus = 0;
        this.m_CachedVisibility = ESlateVisibility(1);
        this.m_HideHpBarTime = -1.0;
        this.m_ExecutedState = 0;
        this.m_ExecutedWaitTimeRatio = 1.0f;
        this.m_ExecutedWaitTextVisiblity = ESlateVisibility(4);
        this.m_ExecuteCanJoinState = 0;
        this.m_BossLowHpTipsVisibility = ESlateVisibility(1);
        this.m_bHasHpRatioInitialized = false;
        this.CachedPreviewHpBarRatioForLogic = 0.0f;
        this.m_HitShowHpBarDistance = Other.m_HitShowHpBarDistance;
        this.m_HideHpBarDistance = Other.m_HideHpBarDistance;
        this.m_DelayHideHpBarSeconds = Other.m_DelayHideHpBarSeconds;
        this.m_PreviewHpBarChaseSeconds = Other.m_PreviewHpBarChaseSeconds;
        this.m_VM_BuffInfo = Other.m_VM_BuffInfo;
        this.m_BossDisplayPrefix = Other.m_BossDisplayPrefix;
        this.m_BossDisplayName = Other.m_BossDisplayName;
        this.m_DisplayBossEntity = Other.m_DisplayBossEntity;
        this.m_HpTargetEntity = Other.m_HpTargetEntity;
        this.m_PostureTargetEntity = Other.m_PostureTargetEntity;
        this.m_DisplayReason = Other.m_DisplayReason;
        this.m_DisplayHpBarRatio = Other.m_DisplayHpBarRatio;
        this.m_DisplayPreviewHpBarRatio = Other.m_DisplayPreviewHpBarRatio;
        this.m_PreviewHpBarChaseSpeed = Other.m_PreviewHpBarChaseSpeed;
        this.m_HpBarSegment = int(Other.m_HpBarSegment);
        this.m_MaxHpBarSegment = int(Other.m_MaxHpBarSegment);
        this.m_DivineStatus = int(Other.m_DivineStatus);
        this.m_DivineLiteraryNormal = Other.m_DivineLiteraryNormal;
        this.m_DivineLiteraryStrengthening = Other.m_DivineLiteraryStrengthening;
        this.m_DivineLiteraryWeaken = Other.m_DivineLiteraryWeaken;
        this.m_HpSegmentIconVMList = Other.m_HpSegmentIconVMList;
        this.m_PostureBarRatio = Other.m_PostureBarRatio;
        this.m_PosturePhaseList = Other.m_PosturePhaseList;
        this.m_BuffDataList = Other.m_BuffDataList;
        this.m_LockBossEntity = Other.m_LockBossEntity;
        this.m_OldSoftLockBossEntity = Other.m_OldSoftLockBossEntity;
        this.m_CachedVisibility = Other.m_CachedVisibility;
        this.m_HideHpBarTime = Other.m_HideHpBarTime;
        this.m_ExecutedState = int(Other.m_ExecutedState);
        this.m_ExecutedWaitTimeRatio = Other.m_ExecutedWaitTimeRatio;
        this.m_ExecutedWaitTextVisiblity = Other.m_ExecutedWaitTextVisiblity;
        this.m_ExecuteEntityDataList = Other.m_ExecuteEntityDataList;
        this.m_ExecuteCanJoinState = int(Other.m_ExecuteCanJoinState);
        this.m_BossLowHpTipsVisibility = Other.m_BossLowHpTipsVisibility;
        this.m_HpRatioSource = Other.m_HpRatioSource;
        this.m_PreviewHpBarRatioSource = Other.m_PreviewHpBarRatioSource;
        this.m_PostureRatioSource = Other.m_PostureRatioSource;
        this.m_DivineBurstTag = Other.m_DivineBurstTag;
        this.m_DivineChaosTag = Other.m_DivineChaosTag;
        this.m_ExecutedWaitTimeSource = Other.m_ExecutedWaitTimeSource;
        this.m_bHasHpRatioInitialized = Other.m_bHasHpRatioInitialized;
        this.m_HideHpBarCheckTimer = Other.m_HideHpBarCheckTimer;
        return;
    }
    FVMS_BossHpBar& opAssign(const FVMS_BossHpBar &inout Other)
    {
        this.m_HitShowHpBarDistance = Other.m_HitShowHpBarDistance;
        this.m_HideHpBarDistance = Other.m_HideHpBarDistance;
        this.m_DelayHideHpBarSeconds = Other.m_DelayHideHpBarSeconds;
        this.m_PreviewHpBarChaseSeconds = Other.m_PreviewHpBarChaseSeconds;
        this.m_VM_BuffInfo = Other.m_VM_BuffInfo;
        this.m_BossDisplayPrefix = Other.m_BossDisplayPrefix;
        this.m_BossDisplayName = Other.m_BossDisplayName;
        this.m_DisplayBossEntity = Other.m_DisplayBossEntity;
        this.m_HpTargetEntity = Other.m_HpTargetEntity;
        this.m_PostureTargetEntity = Other.m_PostureTargetEntity;
        this.m_DisplayReason = Other.m_DisplayReason;
        this.m_DisplayHpBarRatio = Other.m_DisplayHpBarRatio;
        this.m_DisplayPreviewHpBarRatio = Other.m_DisplayPreviewHpBarRatio;
        this.m_PreviewHpBarChaseSpeed = Other.m_PreviewHpBarChaseSpeed;
        this.m_HpBarSegment = int(Other.m_HpBarSegment);
        this.m_MaxHpBarSegment = int(Other.m_MaxHpBarSegment);
        this.m_DivineStatus = int(Other.m_DivineStatus);
        this.m_DivineLiteraryNormal = Other.m_DivineLiteraryNormal;
        this.m_DivineLiteraryStrengthening = Other.m_DivineLiteraryStrengthening;
        this.m_DivineLiteraryWeaken = Other.m_DivineLiteraryWeaken;
        this.m_HpSegmentIconVMList = Other.m_HpSegmentIconVMList;
        this.m_PostureBarRatio = Other.m_PostureBarRatio;
        this.m_PosturePhaseList = Other.m_PosturePhaseList;
        this.m_BuffDataList = Other.m_BuffDataList;
        this.m_LockBossEntity = Other.m_LockBossEntity;
        this.m_OldSoftLockBossEntity = Other.m_OldSoftLockBossEntity;
        this.m_CachedVisibility = Other.m_CachedVisibility;
        this.m_HideHpBarTime = Other.m_HideHpBarTime;
        this.m_ExecutedState = int(Other.m_ExecutedState);
        this.m_ExecutedWaitTimeRatio = Other.m_ExecutedWaitTimeRatio;
        this.m_ExecutedWaitTextVisiblity = Other.m_ExecutedWaitTextVisiblity;
        this.m_ExecuteEntityDataList = Other.m_ExecuteEntityDataList;
        this.m_ExecuteCanJoinState = int(Other.m_ExecuteCanJoinState);
        this.m_BossLowHpTipsVisibility = Other.m_BossLowHpTipsVisibility;
        this.m_HpRatioSource = Other.m_HpRatioSource;
        this.m_PreviewHpBarRatioSource = Other.m_PreviewHpBarRatioSource;
        this.m_PostureRatioSource = Other.m_PostureRatioSource;
        this.m_DivineBurstTag = Other.m_DivineBurstTag;
        this.m_DivineChaosTag = Other.m_DivineChaosTag;
        this.m_ExecutedWaitTimeSource = Other.m_ExecutedWaitTimeSource;
        this.m_bHasHpRatioInitialized = Other.m_bHasHpRatioInitialized;
        return Other.m_HideHpBarCheckTimer;
    }
    void LoadConfigDefault(const FVMS_BossHpBarConfigDefault &inout InConfig)
    {
        this.SetHideHpBarDistance(InConfig.HideHpBarDistance);
        this.SetDelayHideHpBarSeconds(InConfig.DelayHideHpBarSeconds);
        this.SetPreviewHpBarChaseSeconds(InConfig.PreviewHpBarChaseSeconds);
        this.SetHitShowHpBarDistance(InConfig.HitShowHpBarDistance);
        return;
    }
    void PostConstruct()
    {
        this.SetVM_BuffInfo(TEUIModelRef<FVM_BuffInfo>(::FVM_BuffInfo::Create(this.GetContext().Manager, ENTITY_NULL)));
        this.GetModify_PreviewHpBarRatioSource().SnapTo(this.GetDisplayPreviewHpBarRatio());
        this.GetModify_ExecutedWaitTimeSource().SnapTo(1.0f);
        this.ScheduleTick(this.GetModify_HideHpBarCheckTimer(), n"TickHideHpBar", 0.05f, -1.0f);
        FECSWorldPtr local_10 = ECS::GetECSWorld();
        Get local_14;
        const FCS_LocalPlayer& local_8 = local_14.opCall();
        if (local_8)
        {
            FECSEntity local_20 = local_8.GetPlayerPawnEntity();
            Get local_24;
            const FC_LockTarget& local_26 = local_24.opCall();
            if (local_26)
            {
                FECSEntity local_30;
                if (::FASCommonUtils::IsBossPrefab(local_26.GetTargetEntity()))
                {
                    local_30 = local_26.GetTargetEntity();
                }
                else
                {
                    local_30 = ENTITY_NULL;
                }
                this.SetLockBossEntity(local_30);
            }
        }
        this.SetDisplayBossEntity(this.GetLockBossEntity(), EBossHpBarDisplayReason(4));
        return;
    }
    void BeginDestroy()
    {
        this.ClearTimer(this.GetModify_HideHpBarCheckTimer());
        return;
    }
    void OnWorldChanged(const FMsg_ECSWorldRequireCleanUp &inout Msg)
    {
        this.SetDisplayBossEntity(ENTITY_NULL);
        this.OnDisplayBossEntityChanged();
        this.SetLockBossEntity(ENTITY_NULL);
        this.SetOldSoftLockBossEntity(ENTITY_NULL);
        return;
    }
    void TickHideHpBar()
    {
        if (!((FECSEntity(this.GetDisplayBossEntity()) == ENTITY_NULL)) && !(this.GetDisplayBossEntity().IsValid()))
        {
            this.SetDisplayBossEntity(ENTITY_NULL);
            this.OnDisplayBossEntityChanged();
            return;
        }
        if (!(this.GetDisplayBossEntity().IsValid()))
        {
            this.RefreshVisibility();
            return;
        }
        bool local_7 = false;
        Has local_12;
        bool local_6 = local_12.opCall();
        if (local_6)
        {
            local_7 = true;
        }
        else
        {
            if ((FECSEntity(this.GetDisplayBossEntity()) == this.GetLockBossEntity()))
            {
                local_7 = false;
            }
            else
            {
                if (::FASCommonUtils::GetLocalPlayerPawnEntity())
                {
                    Get local_26;
                    Get local_30;
                    float local_44 = (FVector(local_26.opCall().GetPosition()) - local_30.opCall().GetPosition()).SizeSquared();
                    float local_48 = (this.GetHideHpBarDistance() * this.GetHideHpBarDistance());
                    local_7 = local_44 > local_48 && true;
                }
            }
        }
        if (local_7)
        {
            float local_50;
            local_50 = ECS::GetUEWorld().GetTimeSeconds();
            if (this.GetHideHpBarTime() < 0.0)
            {
                this.SetHideHpBarTime(local_50 + this.GetDelayHideHpBarSeconds());
            }
            else
            {
                if (local_50 >= this.GetHideHpBarTime())
                {
                    this.SetDisplayBossEntity(ENTITY_NULL);
                    this.OnDisplayBossEntityChanged();
                }
            }
            return;
        }
        this.SetHideHpBarTime(-1.0);
        return;
    }
    void SyncDamageTransferTargets()
    {
        if (!(this.GetDisplayBossEntity().IsValid()))
        {
            return;
        }
        FECSEntity local_6 = FECSEntity(this.GetDisplayBossEntity());
        FECSEntity local_10 = FECSEntity(this.GetDisplayBossEntity());
        Get local_14;
        const FC_DamageReceiverTransfer& local_16 = local_14.opCall();
        if (local_16)
        {
            if (local_16.GetDamageValueToEntity().IsValid())
            {
                if (local_16.GetbTransferDamageToHp())
                {
                    local_6 = local_16.GetDamageValueToEntity();
                }
                if (local_16.GetbTransferDamageToPosture())
                {
                    local_10 = local_16.GetDamageValueToEntity();
                }
            }
        }
        this.SetHpTargetEntity(local_6);
        this.SetPostureTargetEntity(local_10);
        return;
    }
    void SyncBossAttributeSources()
    {
        if (this.GetHpTargetEntity().IsValid())
        {
            this.GetModify_HpRatioSource().SetAttribute(this.GetHpTargetEntity(), Attribute::HP, Attribute::HPMax);
            this.GetModify_DivineBurstTag().SetTag(this.GetHpTargetEntity(), GameplayTags::CombatState_DivineBurst);
            this.GetModify_DivineChaosTag().SetTag(this.GetHpTargetEntity(), GameplayTags::CombatState_DivineChaos);
        }
        else
        {
            this.GetModify_HpRatioSource().Reset();
            this.GetModify_DivineBurstTag().Reset();
            this.GetModify_DivineChaosTag().Reset();
        }
        if (this.GetPostureTargetEntity().IsValid())
        {
            this.GetModify_PostureRatioSource().SetAttribute(this.GetPostureTargetEntity(), Attribute::Posture, Attribute::PostureMax);
            return;
        }
        this.GetModify_PostureRatioSource().Reset();
        return;
    }
    void RefreshHpDisplay()
    {
        if (this.GetHpRatioSource().GetMaxValue() <= 0.0f)
        {
            return;
        }
        this.SetNewBossHpValues(FMath::Clamp(this.GetHpRatioSource().GetRatioValue(), 0.0f, 1.0f), !(this.GetbHasHpRatioInitialized()));
        return;
    }
    void RefreshPreviewHpBarRatio()
    {
        this.SetDisplayPreviewHpBarRatio(0.0f);
        this.CachedPreviewHpBarRatioForLogic = this.GetDisplayPreviewHpBarRatio();
        return;
    }
    void RefreshPostureDisplay()
    {
        if (this.GetPostureRatioSource().GetMaxValue() <= 0.0f)
        {
            this.SetPostureBarRatio(0.0f);
            return;
        }
        float32 local_4 = 1.0f - this.GetPostureRatioSource().GetRatioValue();
        this.SetPostureBarRatio(FMath::Clamp(local_4, 0.0f, 1.0f));
        return;
    }
    void RefreshDivineStatus()
    {
        // body not fully recovered вЂ” stub [unresolved-operand]
    }
    void RefreshExecutedState()
    {
        int local_10 = 0;
        int local_21;
        if (!(this.GetPostureTargetEntity().IsValid()))
        {
            this.SetExecutedState(0);
            this.GetModify_ExecutedWaitTimeSource().SnapTo(1.0f);
            return;
        }
        if (!(local_10) || (int(local_10.GetExecutionState()) == 0) || (int(local_10.GetExecutionState()) == 3))
        {
            this.SetExecutedState(0);
            this.GetModify_ExecutedWaitTimeSource().SnapTo(1.0f);
            return;
        }
        bool local_14 = false;
        Get local_18;
        const FC_ExecutedConfig& local_20 = local_18.opCall();
        if (local_20)
        {
            if (local_20.ExecutionConfigData)
            {
                local_14 = true;
            }
        }
        if (local_14)
        {
            int local_22;
            local_22 = 3;
            local_21 = local_22;
        }
        else
        {
            int local_22;
            local_22 = 1;
            local_21 = local_22;
        }
        this.SetExecutedWaitTextVisiblity(ESlateVisibility(local_21));
        this.SetExecutedState(1);
        Get local_26;
        const FC_HitReactionConfig& local_28 = local_26.opCall();
        if (local_28)
        {
            Get local_32;
            const FC_HitReaction& local_34 = local_32.opCall();
            if (local_34)
            {
                float32 local_41;
                float32 local_3 = float32((this.GetContext().Time.ToSeconds() - local_34.GetBreakStartTime().ToSeconds()));
                local_41 = local_28.BreakTime;
                if (local_41 > 0.0f)
                {
                    float32 local_35 = FMath::Clamp(1.0f - (local_3 / local_41), 0.0f, 1.0f);
                    this.GetModify_ExecutedWaitTimeSource().SnapTo(local_35);
                    if (local_35 > 0.0f)
                    {
                        float32 local_42 = 1.0f / local_41;
                        this.GetModify_ExecutedWaitTimeSource().SetInterpConstantTo(0.0f, local_42, 0.0001f);
                    }
                }
                else
                {
                    this.GetModify_ExecutedWaitTimeSource().SnapTo(0.0f);
                }
            }
        }
        bool local_1 = local_10.CheckNoExecuteOrMyTeamExecuting(this.GetContext().GetLocalPlayerPawn());
        if (local_1)
        {
            bool local_53;
            local_53 = false;
            auto local_60 = local_10.GetExecuteEntityArray().Iterator();
            for (; local_60.CanProceed;)
            {
                const FECSEntity& local_68 = local_60.Proceed();
                if (local_68.IsValid() && local_68.MatchGameplayTag(GameplayTags::ESM_CombatFlag_ExecutionReady))
                {
                    local_53 = true;
                    break;
                }
            }
            int local_2 = local_53 ? 0 : 2;
            this.SetExecuteCanJoinState(local_2);
        }
        else
        {
            this.SetExecuteCanJoinState(1);
        }
        this.GetModify_ExecuteEntityDataList().Reset(0);
        if (local_10.GetExecuteEntityArray().Num() > 0 && local_1)
        {
            int local_69 = 0;
            for (; local_69 < local_10.GetCurrentMaxPlayerNum(); )
            {
                FExecuteAvatarIconModelData local_74;
                local_74.Entity = ENTITY_NULL;
                if (local_69 < local_10.GetExecuteEntityArray().Num())
                {
                    const FECSEntity& local_68_2 = local_10.GetExecuteEntityArray()[local_69];
                    if (local_68_2.IsValid() && local_68_2.MatchGameplayTag(GameplayTags::ESM_CombatFlag_ExecutionReady))
                    {
                        local_74.Entity = local_10.GetExecuteEntityArray()[local_69];
                    }
                }
                FEUIModelContainer::MakeCached local_88;
                this.GetModify_ExecuteEntityDataList().Add(local_88.opImplConv());
                ++local_69;
            }
        }
        return;
    }
    void RefreshExecutedWaitTimeRatio()
    {
        float32 local_1 = 0.0f;
        this.SetExecutedWaitTimeRatio(local_1);
        return;
    }
    void OnPlayerLockTargetChange(const FC_LockTarget &inout LockTarget)
    {
        FECSEntity local_14;
        if (LockTarget)
        {
            FECSEntity local_6 = LockTarget.GetTargetEntity();
            if ((int(LockTarget.GetType())) != 2)
            {
                FECSEntity local_18;
                if (::FASCommonUtils::IsBossPrefab(LockTarget.GetTargetEntity()))
                {
                    local_18 = LockTarget.GetTargetEntity();
                }
                else
                {
                    local_18 = ENTITY_NULL;
                }
                if (!((local_18 == this.GetOldSoftLockBossEntity())))
                {
                    this.SetOldSoftLockBossEntity(local_18);
                    this.SetDisplayBossEntity(local_18, EBossHpBarDisplayReason(EBossHpBarDisplayReason(2)));
                }
                local_6 = ENTITY_NULL;
            }
            else
            {
                this.SetOldSoftLockBossEntity(ENTITY_NULL);
            }
            if ((FECSEntity(this.GetLockBossEntity()) == local_6))
            {
                return;
            }
            if (::FASCommonUtils::IsBossPrefab(local_6))
            {
                local_14 = local_6;
            }
            else
            {
                local_14 = ENTITY_NULL;
            }
            this.SetLockBossEntity(local_14);
        }
        else
        {
            this.SetOldSoftLockBossEntity(ENTITY_NULL);
            if ((FECSEntity(this.GetLockBossEntity()) == ENTITY_NULL))
            {
                return;
            }
            this.SetLockBossEntity(ENTITY_NULL);
        }
        this.SetDisplayBossEntity(this.GetLockBossEntity(), EBossHpBarDisplayReason(EBossHpBarDisplayReason(4)));
        if ((FECSEntity(this.GetLockBossEntity()) == ENTITY_NULL) && (int(this.GetDisplayReason()) == 4))
        {
            this.SetDisplayReason(EBossHpBarDisplayReason(EBossHpBarDisplayReason(3)));
        }
        return;
    }
    ESlateVisibility BossHpBarVisibility() const
    {
        return this.GetCachedVisibility();
    }
    void OnBuffInfoChange()
    {
        TEUIModelRef<FVM_BuffInfo> local_2 = this.GetVM_BuffInfo();
        TArray<FEUIDynamicWidgetData> local_6 = GetBuffModels();
        this.GetModify_BuffDataList().Reset(0);
        for (auto& local_24 : local_6)
        {
            this.GetModify_BuffDataList().Add(local_24);
        }
        return;
    }
    void HandleHpBarSegmentChanged()
    {
        if (this.GetMaxHpBarSegment() > 0)
        {
            int local_4 = 0;
            for (; local_4 < this.GetHpSegmentIconVMList().Num(); )
            {
                (local_4 >= (this.GetMaxHpBarSegment() - this.GetHpBarSegment())).SetbIconActive();
                ++local_4;
            }
        }
        return;
    }
    void HandleHpTargetEntityChanged()
    {
        int local_2 = 0;
        if (!(this.GetHpTargetEntity().IsValid()))
        {
            return;
        }
        this.SetHpBarSegment(1);
        bool local_3 = false;
        Get local_8;
        const FC_MonsterInfo& local_10 = local_8.opCall();
        if (local_10)
        {
            if (local_10.GetPresentationConfig())
            {
                this.SetHpBarSegment(local_2);
                local_3 = true;
            }
        }
        if (!(local_3))
        {
            if (::GetMonsterConfig(this.GetHpTargetEntity()))
            {
                this.SetHpBarSegment(local_2);
            }
        }
        this.SetMaxHpBarSegment(this.GetHpBarSegment());
        this.SetbHasHpRatioInitialized(false);
        return;
    }
    void HandlePostureTargetEntityChanged()
    {
        if (!(this.GetPostureTargetEntity().IsValid()))
        {
            return;
        }
        this.GetModify_PosturePhaseList().Reset(0);
        Get local_6;
        const FC_HitReactionConfig& local_8 = local_6.opCall();
        if (local_8)
        {
            this.SetPosturePhaseList(local_8.PosturePhaseList);
        }
        return;
    }
    void OnOverrideDivineChanged(const FC_OverrideDivineLiteraryType &inout OverrideDivine)
    {
        this.RefreshDisplayDivine();
        return;
    }
    void SetNewBossHpValues(const float32 HPRatio, const bool bFromEntityChange)
    {
        int local_1;
        int local_17;
        local_1 = this.GetHpBarSegment();
        float32 local_3 = this.GetDisplayHpBarRatio();
        float32 local_5 = this.CachedPreviewHpBarRatioForLogic;
        this.SetHpBarSegment(FMath::Max(0, FMath::CeilToInt((HPRatio * this.GetMaxHpBarSegment()))));
        if (this.GetMaxHpBarSegment() > 1)
        {
            float32 local_10;
            float32 local_4_2 = HPRatio * this.GetMaxHpBarSegment();
            local_10 = FMath::Max((this.GetHpBarSegment() - 1), 0);
            local_4_2 = local_4_2 - local_10;
            this.SetDisplayHpBarRatio(local_4_2);
            this.SetDisplayHpBarRatio(FMath::Clamp(this.GetDisplayHpBarRatio(), 0.0f, 1.0f));
        }
        else
        {
            this.SetDisplayHpBarRatio(HPRatio);
        }
        bool local_8 = ::UCombatGlobalSettings::Get().CheckBossIsLowHp(HPRatio);
        if (local_8)
        {
            int local_18;
            local_18 = 4;
            local_17 = local_18;
        }
        else
        {
            int local_18;
            local_18 = 1;
            local_17 = local_18;
        }
        this.SetBossLowHpTipsVisibility(ESlateVisibility(local_17));
        if (bFromEntityChange)
        {
            this.SetPreviewHpBarChaseSpeed(0.0f);
            this.SetDisplayPreviewHpBarRatio(this.GetDisplayHpBarRatio());
            this.GetModify_PreviewHpBarRatioSource().SnapTo(this.GetDisplayHpBarRatio());
            this.RefreshHpSegmentIcon();
            this.SetbHasHpRatioInitialized(true);
            return;
        }
        if (local_1 > this.GetHpBarSegment())
        {
            local_5 = 1.0f;
            this.GetModify_PreviewHpBarRatioSource().SnapTo(1.0f);
        }
        else
        {
            if (local_1 < this.GetHpBarSegment())
            {
                local_5 = this.GetDisplayHpBarRatio();
                this.GetModify_PreviewHpBarRatioSource().SnapTo(this.GetDisplayHpBarRatio());
            }
        }
        if (FMath::Abs((this.GetDisplayHpBarRatio() - local_3)) > 0.001f)
        {
            float32 local_10;
            if (this.GetDisplayHpBarRatio() > local_5)
            {
                this.SetPreviewHpBarChaseSpeed(0.0f);
                this.SetDisplayPreviewHpBarRatio(this.GetDisplayHpBarRatio());
                this.GetModify_PreviewHpBarRatioSource().SnapTo(this.GetDisplayHpBarRatio());
            }
            else
            {
                if (this.GetDisplayHpBarRatio() < local_3 || (local_1 > this.GetHpBarSegment()))
                {
                    if (this.GetPreviewHpBarChaseSeconds() > 0.0f)
                    {
                        float32 local_11 = local_5 - this.GetDisplayHpBarRatio();
                        local_10 = local_11 / this.GetPreviewHpBarChaseSeconds();
                    }
                    else
                    {
                        local_10 = 0.0f;
                    }
                    this.SetPreviewHpBarChaseSpeed(local_10);
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
                    if (this.GetPreviewHpBarChaseSpeed() > 0.0f && (local_5 > this.GetDisplayHpBarRatio()))
                    {
                        this.GetModify_PreviewHpBarRatioSource().SetInterpConstantTo(this.GetDisplayHpBarRatio(), this.GetPreviewHpBarChaseSpeed(), 0.0001f);
                    }
                }
            }
        }
        else
        {
            if (this.GetPreviewHpBarChaseSpeed() <= 0.0f || (local_5 < this.GetDisplayHpBarRatio()))
            {
                this.SetPreviewHpBarChaseSpeed(0.0f);
                this.SetDisplayPreviewHpBarRatio(this.GetDisplayHpBarRatio());
                this.GetModify_PreviewHpBarRatioSource().SnapTo(this.GetDisplayHpBarRatio());
            }
            else
            {
                if (local_5 > this.GetDisplayHpBarRatio())
                {
                    this.GetModify_PreviewHpBarRatioSource().SetInterpConstantTo(this.GetDisplayHpBarRatio(), this.GetPreviewHpBarChaseSpeed(), 0.0001f);
                }
            }
        }
        this.SetbHasHpRatioInitialized(true);
        return;
    }
    void RefreshHpSegmentIcon()
    {
        this.GetModify_HpSegmentIconVMList().Reset(0);
        if (this.GetMaxHpBarSegment() > 0)
        {
            int local_4 = 0;
            for (; local_4 < this.GetMaxHpBarSegment(); )
            {
                TEUIModelRef<FVM_BossHpSegmentIcon> local_8 = TEUIModelRef<FVM_BossHpSegmentIcon>(::FVM_BossHpSegmentIcon::Create(this.GetContext().Manager, (local_4 >= (this.GetMaxHpBarSegment() - this.GetHpBarSegment()))));
                this.GetModify_HpSegmentIconVMList().Add(local_8);
                ++local_4;
            }
        }
        return;
    }
    void OnHandleHitEvent(const FCE_HitEvent &inout HitEvent)
    {
        if ((int(this.GetDisplayReason())) == 4)
        {
            return;
        }
        if (!(::FASCommonUtils::IsBossPrefab(HitEvent.Receiver)))
        {
            return;
        }
        if (!(::FASCommonUtils::GetLocalPlayerPawnEntity()))
        {
            return;
        }
        Get local_22;
        Get local_26;
        if (((FVector(local_22.opCall().GetPosition()) - local_26.opCall().GetPosition()).SizeSquared()) > ((this.GetHitShowHpBarDistance() * this.GetHitShowHpBarDistance())))
        {
            return;
        }
        FECSEntity local_8 = ::FASCommonUtils::GetLocalPlayerProxy();
        int local_49 = EBossHpBarDisplayReason(0);
        FECSEntity local_48 = ::FASCommonUtils::GetUniquePlayerEntity(HitEvent.Attacker);
        if ((local_48 == local_8))
        {
            local_49 = EBossHpBarDisplayReason(3);
        }
        else
        {
            if (::FTeamUtils::IsInSameTeam(local_8, local_48))
            {
                local_49 = EBossHpBarDisplayReason(1);
            }
        }
        this.SetDisplayBossEntity(HitEvent.Receiver, EBossHpBarDisplayReason(local_49));
        return;
    }
    void SetDisplayBossEntity(const FECSEntity &inout Entity, const EBossHpBarDisplayReason NewDisplayReason)
    {
        if (int(NewDisplayReason) == 0 || (int(NewDisplayReason) < int(this.GetDisplayReason())) || !(Entity.IsValid()))
        {
            return;
        }
        this.SetDisplayReason(EBossHpBarDisplayReason(NewDisplayReason));
        if (!((Entity == this.GetDisplayBossEntity())))
        {
            this.SetDisplayBossEntity(Entity);
            this.OnDisplayBossEntityChanged();
        }
        return;
    }
    void OnDisplayBossEntityChanged()
    {
        if (this.GetDisplayBossEntity().IsValid())
        {
            this.SetHpTargetEntity(this.GetDisplayBossEntity());
            this.SetPostureTargetEntity(this.GetDisplayBossEntity());
            Get local_6;
            const FC_DamageReceiverTransfer& local_8 = local_6.opCall();
            if (local_8)
            {
                if (local_8.GetDamageValueToEntity().IsValid())
                {
                    if (local_8.GetbTransferDamageToHp())
                    {
                        this.SetHpTargetEntity(local_8.GetDamageValueToEntity());
                    }
                    if (local_8.GetbTransferDamageToPosture())
                    {
                        this.SetPostureTargetEntity(local_8.GetDamageValueToEntity());
                    }
                }
            }
        }
        else
        {
            this.SetDisplayBossEntity(ENTITY_NULL);
            this.SetHpTargetEntity(ENTITY_NULL);
            this.SetPostureTargetEntity(ENTITY_NULL);
        }
        if (this.GetVM_BuffInfo().IsValid())
        {
            TEUIModelRef<FVM_BuffInfo> local_10 = this.GetVM_BuffInfo();
            this.GetDisplayBossEntity().SetTargetEntity();
        }
        this.RefreshBossDisplayNameAndDivine();
        this.RefreshVisibility();
        return;
    }
    void RefreshBossDisplayNameAndDivine()
    {
        if (this.GetDisplayBossEntity().IsValid())
        {
            bool local_2;
            local_2 = false;
            Get local_6;
            const FC_MonsterInfo& local_8 = local_6.opCall();
            if (local_8)
            {
                if (local_8.GetPresentationConfig())
                {
                    local_2 = true;
                }
            }
            if (!(local_2))
            {
                TDataObjectPtr<FBasePrefabConfig> local_32 = ::GetPrefabConfigPtr(this.GetDisplayBossEntity());
                if (local_32)
                {
                    this.SetBossDisplayName(local_32.opArrow().DisplayName);
                }
                else
                {
                    this.SetBossDisplayName(FText());
                }
                if (::GetMonsterConfig(this.GetDisplayBossEntity()))
                {
                }
                else
                {
                    this.SetBossDisplayPrefix(FText());
                }
            }
        }
        else
        {
            this.SetBossDisplayName(FText());
            this.SetBossDisplayPrefix(FText());
        }
        this.RefreshDisplayDivine();
        return;
    }
    void RefreshDisplayDivine()
    {
        TDataObjectPtr<FDivineLiteraryTypeConfig> local_24 = TDataObjectPtr<FDivineLiteraryTypeConfig>(nullptr);
        if (this.GetDisplayBossEntity().IsValid())
        {
            Get local_78;
            const FC_OverrideDivineLiteraryType& local_80 = local_78.opCall();
            if (local_80)
            {
                local_24 = local_80.GetDivineLiteraryType();
            }
            else
            {
                Get local_84;
                const FC_MonsterInfo& local_86 = local_84.opCall();
                if (local_86)
                {
                    if (local_86.GetPresentationConfig())
                    {
                        local_24 = GetDivineLiteraryType();
                    }
                }
            }
        }
        if (local_24)
        {
            return;
        }
        this.SetDivineLiteraryNormal(FSoftBrush());
        this.SetDivineLiteraryStrengthening(FSoftBrush());
        this.SetDivineLiteraryWeaken(FSoftBrush());
        return;
    }
    void RefreshVisibility()
    {
        if (this.GetDisplayBossEntity().IsValid())
        {
            this.SetCachedVisibility(ESlateVisibility(4));
            return;
        }
        this.SetDisplayReason(EBossHpBarDisplayReason(0));
        this.SetCachedVisibility(ESlateVisibility(1));
        this.SetHideHpBarTime(-1.0);
        return;
    }
    const float32 GetHitShowHpBarDistance() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_HitShowHpBarDistance() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetHitShowHpBarDistance(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_HitShowHpBarDistance = __Value;
        return;
    }
    const float32 GetHideHpBarDistance() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_HideHpBarDistance() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetHideHpBarDistance(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_HideHpBarDistance = __Value;
        return;
    }
    const float32 GetDelayHideHpBarSeconds() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_DelayHideHpBarSeconds() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDelayHideHpBarSeconds(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DelayHideHpBarSeconds = __Value;
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
    TEUIModelRef<FVM_BuffInfo> GetVM_BuffInfo() const property
    {
        this.TrackPropertyRead(4);
        return this.m_VM_BuffInfo;
    }
    void SetVM_BuffInfo(const TEUIModelRef<FVM_BuffInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_BuffInfo> local_2;
        local_2 = this.m_VM_BuffInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_VM_BuffInfo = __Value;
        return;
    }
    const FText GetBossDisplayPrefix() const property
    {
        const FText __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FText GetModify_BossDisplayPrefix() property
    {
        FText __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetBossDisplayPrefix(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_BossDisplayPrefix = __Value;
        return;
    }
    const FText GetBossDisplayName() const property
    {
        const FText __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FText GetModify_BossDisplayName() property
    {
        FText __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetBossDisplayName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_BossDisplayName = __Value;
        return;
    }
    const FECSEntity GetDisplayBossEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FECSEntity GetModify_DisplayBossEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetDisplayBossEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_DisplayBossEntity = __Value;
        return;
    }
    const FECSEntity GetHpTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FECSEntity GetModify_HpTargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetHpTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_HpTargetEntity = __Value;
        return;
    }
    const FECSEntity GetPostureTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FECSEntity GetModify_PostureTargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetPostureTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_PostureTargetEntity = __Value;
        return;
    }
    EBossHpBarDisplayReason GetDisplayReason() const property
    {
        this.TrackPropertyRead(10);
        return this.m_DisplayReason;
    }
    void SetDisplayReason(const EBossHpBarDisplayReason __Value) property
    {
        if (int(this.m_DisplayReason) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_DisplayReason = __Value;
        return;
    }
    const float32 GetDisplayHpBarRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    float32 GetModify_DisplayHpBarRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetDisplayHpBarRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_DisplayHpBarRatio = __Value;
        return;
    }
    const float32 GetDisplayPreviewHpBarRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    float32 GetModify_DisplayPreviewHpBarRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetDisplayPreviewHpBarRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_DisplayPreviewHpBarRatio = __Value;
        return;
    }
    const float32 GetPreviewHpBarChaseSpeed() const property
    {
        const float32 __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    float32 GetModify_PreviewHpBarChaseSpeed() property
    {
        float32 __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetPreviewHpBarChaseSpeed(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_PreviewHpBarChaseSpeed = __Value;
        return;
    }
    int GetHpBarSegment() const property
    {
        this.TrackPropertyRead(14);
        return this.m_HpBarSegment;
    }
    void SetHpBarSegment(const int __Value) property
    {
        if (this.m_HpBarSegment == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_HpBarSegment = __Value;
        return;
    }
    int GetMaxHpBarSegment() const property
    {
        this.TrackPropertyRead(15);
        return this.m_MaxHpBarSegment;
    }
    void SetMaxHpBarSegment(const int __Value) property
    {
        if (this.m_MaxHpBarSegment == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_MaxHpBarSegment = __Value;
        return;
    }
    int GetDivineStatus() const property
    {
        this.TrackPropertyRead(16);
        return this.m_DivineStatus;
    }
    void SetDivineStatus(const int __Value) property
    {
        if (this.m_DivineStatus == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_DivineStatus = __Value;
        return;
    }
    const FSoftBrush GetDivineLiteraryNormal() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    FSoftBrush GetModify_DivineLiteraryNormal() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetDivineLiteraryNormal(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_DivineLiteraryNormal = __Value;
        return;
    }
    const FSoftBrush GetDivineLiteraryStrengthening() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(18);
        return __r;
    }
    FSoftBrush GetModify_DivineLiteraryStrengthening() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(18);
        return __r;
    }
    void SetDivineLiteraryStrengthening(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_DivineLiteraryStrengthening = __Value;
        return;
    }
    const FSoftBrush GetDivineLiteraryWeaken() const property
    {
        const FSoftBrush __r;
        this.TrackPropertyRead(19);
        return __r;
    }
    FSoftBrush GetModify_DivineLiteraryWeaken() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(19);
        return __r;
    }
    void SetDivineLiteraryWeaken(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_DivineLiteraryWeaken = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_BossHpSegmentIcon>> GetHpSegmentIconVMList() const property
    {
        const TArray<TEUIModelRef<FVM_BossHpSegmentIcon>> __r;
        this.TrackPropertyRead(20);
        return __r;
    }
    TArray<TEUIModelRef<FVM_BossHpSegmentIcon>> GetModify_HpSegmentIconVMList() property
    {
        TArray<TEUIModelRef<FVM_BossHpSegmentIcon>> __r;
        this.MarkPropertyDirty(20);
        return __r;
    }
    void SetHpSegmentIconVMList(const TArray<TEUIModelRef<FVM_BossHpSegmentIcon>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_HpSegmentIconVMList = __Value;
        return;
    }
    const float32 GetPostureBarRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(21);
        return __r;
    }
    float32 GetModify_PostureBarRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(21);
        return __r;
    }
    void SetPostureBarRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_PostureBarRatio = __Value;
        return;
    }
    const TArray<float32> GetPosturePhaseList() const property
    {
        const TArray<float32> __r;
        this.TrackPropertyRead(22);
        return __r;
    }
    TArray<float32> GetModify_PosturePhaseList() property
    {
        TArray<float32> __r;
        this.MarkPropertyDirty(22);
        return __r;
    }
    void SetPosturePhaseList(const TArray<float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_PosturePhaseList = __Value;
        return;
    }
    const TArray<FEUIDynamicWidgetData> GetBuffDataList() const property
    {
        const TArray<FEUIDynamicWidgetData> __r;
        this.TrackPropertyRead(23);
        return __r;
    }
    TArray<FEUIDynamicWidgetData> GetModify_BuffDataList() property
    {
        TArray<FEUIDynamicWidgetData> __r;
        this.MarkPropertyDirty(23);
        return __r;
    }
    void SetBuffDataList(const TArray<FEUIDynamicWidgetData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(23);
        this.m_BuffDataList = __Value;
        return;
    }
    const FECSEntity GetLockBossEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(24);
        return __r;
    }
    FECSEntity GetModify_LockBossEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(24);
        return __r;
    }
    void SetLockBossEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(24);
        this.m_LockBossEntity = __Value;
        return;
    }
    const FECSEntity GetOldSoftLockBossEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(25);
        return __r;
    }
    FECSEntity GetModify_OldSoftLockBossEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(25);
        return __r;
    }
    void SetOldSoftLockBossEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(25);
        this.m_OldSoftLockBossEntity = __Value;
        return;
    }
    ESlateVisibility GetCachedVisibility() const property
    {
        this.TrackPropertyRead(26);
        return this.m_CachedVisibility;
    }
    void SetCachedVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_CachedVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(26);
        this.m_CachedVisibility = __Value;
        return;
    }
    const float GetHideHpBarTime() const property
    {
        const float __r;
        this.TrackPropertyRead(27);
        return __r;
    }
    float GetModify_HideHpBarTime() property
    {
        float __r;
        this.MarkPropertyDirty(27);
        return __r;
    }
    void SetHideHpBarTime(const float &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(27);
        this.m_HideHpBarTime = __Value;
        return;
    }
    int GetExecutedState() const property
    {
        this.TrackPropertyRead(28);
        return this.m_ExecutedState;
    }
    void SetExecutedState(const int __Value) property
    {
        if (this.m_ExecutedState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(28);
        this.m_ExecutedState = __Value;
        return;
    }
    const float32 GetExecutedWaitTimeRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(29);
        return __r;
    }
    float32 GetModify_ExecutedWaitTimeRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(29);
        return __r;
    }
    void SetExecutedWaitTimeRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(29);
        this.m_ExecutedWaitTimeRatio = __Value;
        return;
    }
    ESlateVisibility GetExecutedWaitTextVisiblity() const property
    {
        this.TrackPropertyRead(30);
        return this.m_ExecutedWaitTextVisiblity;
    }
    void SetExecutedWaitTextVisiblity(const ESlateVisibility __Value) property
    {
        if (int(this.m_ExecutedWaitTextVisiblity) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(30);
        this.m_ExecutedWaitTextVisiblity = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetExecuteEntityDataList() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(31);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_ExecuteEntityDataList() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(31);
        return __r;
    }
    void SetExecuteEntityDataList(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(31);
        this.m_ExecuteEntityDataList = __Value;
        return;
    }
    int GetExecuteCanJoinState() const property
    {
        this.TrackPropertyRead(32);
        return this.m_ExecuteCanJoinState;
    }
    void SetExecuteCanJoinState(const int __Value) property
    {
        if (this.m_ExecuteCanJoinState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(32);
        this.m_ExecuteCanJoinState = __Value;
        return;
    }
    ESlateVisibility GetBossLowHpTipsVisibility() const property
    {
        this.TrackPropertyRead(33);
        return this.m_BossLowHpTipsVisibility;
    }
    void SetBossLowHpTipsVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_BossLowHpTipsVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(33);
        this.m_BossLowHpTipsVisibility = __Value;
        return;
    }
    const FMW_AttributeRatio GetHpRatioSource() const property
    {
        const FMW_AttributeRatio __r;
        this.TrackPropertyRead(34);
        return __r;
    }
    FMW_AttributeRatio GetModify_HpRatioSource() property
    {
        FMW_AttributeRatio __r;
        this.MarkPropertyDirty(34);
        return __r;
    }
    void SetHpRatioSource(const FMW_AttributeRatio &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(34);
        this.m_HpRatioSource = __Value;
        return;
    }
    const FMW_InterpFloat GetPreviewHpBarRatioSource() const property
    {
        const FMW_InterpFloat __r;
        this.TrackPropertyRead(35);
        return __r;
    }
    FMW_InterpFloat GetModify_PreviewHpBarRatioSource() property
    {
        FMW_InterpFloat __r;
        this.MarkPropertyDirty(35);
        return __r;
    }
    void SetPreviewHpBarRatioSource(const FMW_InterpFloat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(35);
        this.m_PreviewHpBarRatioSource = __Value;
        return;
    }
    const FMW_AttributeRatio GetPostureRatioSource() const property
    {
        const FMW_AttributeRatio __r;
        this.TrackPropertyRead(36);
        return __r;
    }
    FMW_AttributeRatio GetModify_PostureRatioSource() property
    {
        FMW_AttributeRatio __r;
        this.MarkPropertyDirty(36);
        return __r;
    }
    void SetPostureRatioSource(const FMW_AttributeRatio &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(36);
        this.m_PostureRatioSource = __Value;
        return;
    }
    const FMW_GameplayTagHas GetDivineBurstTag() const property
    {
        const FMW_GameplayTagHas __r;
        this.TrackPropertyRead(37);
        return __r;
    }
    FMW_GameplayTagHas GetModify_DivineBurstTag() property
    {
        FMW_GameplayTagHas __r;
        this.MarkPropertyDirty(37);
        return __r;
    }
    void SetDivineBurstTag(const FMW_GameplayTagHas &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(37);
        this.m_DivineBurstTag = __Value;
        return;
    }
    const FMW_GameplayTagHas GetDivineChaosTag() const property
    {
        const FMW_GameplayTagHas __r;
        this.TrackPropertyRead(38);
        return __r;
    }
    FMW_GameplayTagHas GetModify_DivineChaosTag() property
    {
        FMW_GameplayTagHas __r;
        this.MarkPropertyDirty(38);
        return __r;
    }
    void SetDivineChaosTag(const FMW_GameplayTagHas &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(38);
        this.m_DivineChaosTag = __Value;
        return;
    }
    const FMW_InterpFloat GetExecutedWaitTimeSource() const property
    {
        const FMW_InterpFloat __r;
        this.TrackPropertyRead(39);
        return __r;
    }
    FMW_InterpFloat GetModify_ExecutedWaitTimeSource() property
    {
        FMW_InterpFloat __r;
        this.MarkPropertyDirty(39);
        return __r;
    }
    void SetExecutedWaitTimeSource(const FMW_InterpFloat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(39);
        this.m_ExecutedWaitTimeSource = __Value;
        return;
    }
    bool GetbHasHpRatioInitialized() const property
    {
        this.TrackPropertyRead(40);
        return this.m_bHasHpRatioInitialized;
    }
    void SetbHasHpRatioInitialized(const bool __Value) property
    {
        if (!(this.m_bHasHpRatioInitialized) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(40);
        this.m_bHasHpRatioInitialized = __Value;
        return;
    }
    const FEUITimerHandle GetHideHpBarCheckTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(41);
        return __r;
    }
    FEUITimerHandle GetModify_HideHpBarCheckTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(41);
        return __r;
    }
    void SetHideHpBarCheckTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(41);
        this.m_HideHpBarCheckTimer = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_BossHpBar
{
    UPROPERTY()
    ESlateVisibility BossHpBarVisibility;
    UPROPERTY()
    TEUIModelRef<FVMS_BossHpBar> Self;


}

namespace FVMS_BossHpBar
{
FVMS_BossHpBar& Get(const UObject ContextObject)
{
    return FVMS_BossHpBar::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_BossHpBar GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_BossHpBar __r;
    TEUIModelRef<FVMS_BossHpBar> local_6 = TEUIModelRef<FVMS_BossHpBar>(EUIInternal::MakeModelWithManager(Manager, FVMS_BossHpBar::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVMS_BossHpBar;
}
void __OnWorldChanged(FVMS_BossHpBar &inout Model, const FMsg_ECSWorldRequireCleanUp &inout Message)
{
    Model.OnWorldChanged(Message);
    return;
}
void __OnPlayerLockTargetChange(FVMS_BossHpBar &inout Model, const FECSEntity &inout Entity, const FC_LockTarget &inout Component)
{
    Model.OnPlayerLockTargetChange(Component);
    return;
}
void __OnBuffInfoChange(FVMS_BossHpBar &inout Model)
{
    Model.OnBuffInfoChange();
    return;
}
void __HandleHpBarSegmentChanged(FVMS_BossHpBar &inout Model)
{
    Model.HandleHpBarSegmentChanged();
    return;
}
void __HandleHpTargetEntityChanged(FVMS_BossHpBar &inout Model)
{
    Model.HandleHpTargetEntityChanged();
    return;
}
void __HandlePostureTargetEntityChanged(FVMS_BossHpBar &inout Model)
{
    Model.HandlePostureTargetEntityChanged();
    return;
}
void __OnOverrideDivineChanged(FVMS_BossHpBar &inout Model, const FECSEntity &inout Entity, const FC_OverrideDivineLiteraryType &inout Component)
{
    Model.OnOverrideDivineChanged(Component);
    return;
}
void __OnHandleHitEvent(FVMS_BossHpBar &inout Model, const FCE_HitEvent &inout Event)
{
    Model.OnHandleHitEvent(Event);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TEUIModelRef<FVM_BuffInfo> __UIGetter_VM_BuffInfo(const FVMS_BossHpBar &inout Model)
{
    return Model.GetVM_BuffInfo();
}
FText __UIGetter_BossDisplayPrefix(const FVMS_BossHpBar &inout Model)
{
    return Model.GetBossDisplayPrefix();
}
FText __UIGetter_BossDisplayName(const FVMS_BossHpBar &inout Model)
{
    return Model.GetBossDisplayName();
}
float32 __UIGetter_DisplayHpBarRatio(const FVMS_BossHpBar &inout Model)
{
    return Model.GetDisplayHpBarRatio();
}
float32 __UIGetter_DisplayPreviewHpBarRatio(const FVMS_BossHpBar &inout Model)
{
    return Model.GetDisplayPreviewHpBarRatio();
}
int __UIGetter_DivineStatus(const FVMS_BossHpBar &inout Model)
{
    return Model.GetDivineStatus();
}
FSoftBrush __UIGetter_DivineLiteraryNormal(const FVMS_BossHpBar &inout Model)
{
    return Model.GetDivineLiteraryNormal();
}
FSoftBrush __UIGetter_DivineLiteraryStrengthening(const FVMS_BossHpBar &inout Model)
{
    return Model.GetDivineLiteraryStrengthening();
}
FSoftBrush __UIGetter_DivineLiteraryWeaken(const FVMS_BossHpBar &inout Model)
{
    return Model.GetDivineLiteraryWeaken();
}
TArray<TEUIModelRef<FVM_BossHpSegmentIcon>> __UIGetter_HpSegmentIconVMList(const FVMS_BossHpBar &inout Model)
{
    return Model.GetHpSegmentIconVMList();
}
float32 __UIGetter_PostureBarRatio(const FVMS_BossHpBar &inout Model)
{
    return Model.GetPostureBarRatio();
}
TArray<FEUIDynamicWidgetData> __UIGetter_BuffDataList(const FVMS_BossHpBar &inout Model)
{
    return Model.GetBuffDataList();
}
int __UIGetter_ExecutedState(const FVMS_BossHpBar &inout Model)
{
    return Model.GetExecutedState();
}
float32 __UIGetter_ExecutedWaitTimeRatio(const FVMS_BossHpBar &inout Model)
{
    return Model.GetExecutedWaitTimeRatio();
}
ESlateVisibility __UIGetter_ExecutedWaitTextVisiblity(const FVMS_BossHpBar &inout Model)
{
    return Model.GetExecutedWaitTextVisiblity();
}
TArray<FEUIModelContainer> __UIGetter_ExecuteEntityDataList(const FVMS_BossHpBar &inout Model)
{
    return Model.GetExecuteEntityDataList();
}
int __UIGetter_ExecuteCanJoinState(const FVMS_BossHpBar &inout Model)
{
    return Model.GetExecuteCanJoinState();
}
ESlateVisibility __UIGetter_BossLowHpTipsVisibility(const FVMS_BossHpBar &inout Model)
{
    return Model.GetBossLowHpTipsVisibility();
}
ESlateVisibility __UIGetter_BossHpBarVisibility(const FVMS_BossHpBar &inout Model)
{
    return Model.BossHpBarVisibility();
}
TEUIModelRef<FVMS_BossHpBar> __UIGetter_Self(const FVMS_BossHpBar &inout Model)
{
    return TEUIModelRef<FVMS_BossHpBar>(Model);
}
int __IndexOf_HitShowHpBarDistance()
{
    return 0;
}
int __IndexOf_HideHpBarDistance()
{
    return 1;
}
int __IndexOf_DelayHideHpBarSeconds()
{
    return 2;
}
int __IndexOf_PreviewHpBarChaseSeconds()
{
    return 3;
}
int __IndexOf_VM_BuffInfo()
{
    return 4;
}
int __IndexOf_BossDisplayPrefix()
{
    return 5;
}
int __IndexOf_BossDisplayName()
{
    return 6;
}
int __IndexOf_DisplayBossEntity()
{
    return 7;
}
int __IndexOf_HpTargetEntity()
{
    return 8;
}
int __IndexOf_PostureTargetEntity()
{
    return 9;
}
int __IndexOf_DisplayReason()
{
    return 10;
}
int __IndexOf_DisplayHpBarRatio()
{
    return 11;
}
int __IndexOf_DisplayPreviewHpBarRatio()
{
    return 12;
}
int __IndexOf_PreviewHpBarChaseSpeed()
{
    return 13;
}
int __IndexOf_HpBarSegment()
{
    return 14;
}
int __IndexOf_MaxHpBarSegment()
{
    return 15;
}
int __IndexOf_DivineStatus()
{
    return 16;
}
int __IndexOf_DivineLiteraryNormal()
{
    return 17;
}
int __IndexOf_DivineLiteraryStrengthening()
{
    return 18;
}
int __IndexOf_DivineLiteraryWeaken()
{
    return 19;
}
int __IndexOf_HpSegmentIconVMList()
{
    return 20;
}
int __IndexOf_PostureBarRatio()
{
    return 21;
}
int __IndexOf_PosturePhaseList()
{
    return 22;
}
int __IndexOf_BuffDataList()
{
    return 23;
}
int __IndexOf_LockBossEntity()
{
    return 24;
}
int __IndexOf_OldSoftLockBossEntity()
{
    return 25;
}
int __IndexOf_CachedVisibility()
{
    return 26;
}
int __IndexOf_HideHpBarTime()
{
    return 27;
}
int __IndexOf_ExecutedState()
{
    return 28;
}
int __IndexOf_ExecutedWaitTimeRatio()
{
    return 29;
}
int __IndexOf_ExecutedWaitTextVisiblity()
{
    return 30;
}
int __IndexOf_ExecuteEntityDataList()
{
    return 31;
}
int __IndexOf_ExecuteCanJoinState()
{
    return 32;
}
int __IndexOf_BossLowHpTipsVisibility()
{
    return 33;
}
int __IndexOf_HpRatioSource()
{
    return 34;
}
int __IndexOf_PreviewHpBarRatioSource()
{
    return 35;
}
int __IndexOf_PostureRatioSource()
{
    return 36;
}
int __IndexOf_DivineBurstTag()
{
    return 37;
}
int __IndexOf_DivineChaosTag()
{
    return 38;
}
int __IndexOf_ExecutedWaitTimeSource()
{
    return 39;
}
int __IndexOf_bHasHpRatioInitialized()
{
    return 40;
}
int __IndexOf_HideHpBarCheckTimer()
{
    return 41;
}
}
namespace __GeneratedProperties_FVMS_BossHpBar
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

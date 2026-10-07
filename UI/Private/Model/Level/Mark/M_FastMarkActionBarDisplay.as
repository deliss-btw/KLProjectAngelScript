
namespace FM_FastMarkActionBarDisplay
{
    const int ModelId = 0;

}
struct FM_FastMarkActionBarDisplay : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    FECSEntity m_CurrentAimingEntity;
    UPROPERTY()
    bool m_bShouldShow;
    UPROPERTY()
    bool m_bChordSatisfied;
    UPROPERTY()
    bool m_bAimingMarkable;
    UPROPERTY()
    TEUIModelRef<FVM_InputAction> m_FastMarkAction;
    UPROPERTY()
    float32 m_ChordPollInterval;
    UPROPERTY()
    float32 m_AimingTraceInterval;
    UPROPERTY()
    FEUITimerHandle m_ChordPollTimer;
    UPROPERTY()
    FEUITimerHandle m_AimingTraceTimer;
    UPROPERTY()
    bool m_bAimingTraceTicking;

    FM_FastMarkActionBarDisplay()
    {
        this.m_bShouldShow = false;
        this.m_bChordSatisfied = false;
        this.m_bAimingMarkable = false;
        this.m_ChordPollInterval = 0.1f;
        this.m_AimingTraceInterval = 0.25f;
        this.m_bAimingTraceTicking = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_FastMarkActionBarDisplay(const FM_FastMarkActionBarDisplay &inout Other)
    {
        this.m_bShouldShow = false;
        this.m_bChordSatisfied = false;
        this.m_bAimingMarkable = false;
        this.m_ChordPollInterval = 0.1f;
        this.m_AimingTraceInterval = 0.25f;
        this.m_bAimingTraceTicking = false;
        this.m_CurrentAimingEntity = Other.m_CurrentAimingEntity;
        this.m_bShouldShow = Other.m_bShouldShow;
        this.m_bChordSatisfied = Other.m_bChordSatisfied;
        this.m_bAimingMarkable = Other.m_bAimingMarkable;
        this.m_FastMarkAction = Other.m_FastMarkAction;
        this.m_ChordPollInterval = Other.m_ChordPollInterval;
        this.m_AimingTraceInterval = Other.m_AimingTraceInterval;
        this.m_ChordPollTimer = Other.m_ChordPollTimer;
        this.m_AimingTraceTimer = Other.m_AimingTraceTimer;
        this.m_bAimingTraceTicking = Other.m_bAimingTraceTicking;
        return;
    }
    FM_FastMarkActionBarDisplay opAssign(const FM_FastMarkActionBarDisplay &inout Other)
    {
        FM_FastMarkActionBarDisplay __r;
        this.m_CurrentAimingEntity = Other.m_CurrentAimingEntity;
        this.m_bShouldShow = Other.m_bShouldShow;
        this.m_bChordSatisfied = Other.m_bChordSatisfied;
        this.m_bAimingMarkable = Other.m_bAimingMarkable;
        this.m_FastMarkAction = Other.m_FastMarkAction;
        this.m_ChordPollInterval = Other.m_ChordPollInterval;
        this.m_AimingTraceInterval = Other.m_AimingTraceInterval;
        this.m_ChordPollTimer = Other.m_ChordPollTimer;
        this.m_AimingTraceTimer = Other.m_AimingTraceTimer;
        this.m_bAimingTraceTicking = Other.m_bAimingTraceTicking;
        return __r;
    }
    void PostConstruct()
    {
        const UMarkSettings local_2;
        GetGameplaySettings<UMarkSettings> local_4;
        local_2 = local_4;
        UEUIManagerSubsystem local_30 = this.GetManager();
        this.SetFastMarkAction(TEUIModelRef<FVM_InputAction>());
        this.GetFastMarkAction().opArrow().SetbOnlyShowMainKey(true);
        this.ScheduleTick(this.GetModify_ChordPollTimer(), n"PollChordSatisfied", this.GetChordPollInterval(), 0.0f);
        this.PollChordSatisfied();
        return;
    }
    void BeginDestroy()
    {
        this.ClearTimer(this.GetModify_ChordPollTimer());
        this.StopAimingTrace();
        return;
    }
    void PollChordSatisfied()
    {
        this.SetbChordSatisfied(KLEnhancedInput::IsAllChordActionsSatisfied(this.GetFastMarkAction().opArrow().GetInputAction().EnhancedAction));
        return;
    }
    void SyncAimingTraceTimer()
    {
        if (this.GetbChordSatisfied())
        {
            if (!(this.GetbAimingTraceTicking()))
            {
                this.ScheduleTick(this.GetModify_AimingTraceTimer(), n"PollAimingTrace", this.GetAimingTraceInterval(), 0.0f);
                this.SetbAimingTraceTicking(true);
            }
            this.PollAimingTrace();
            return;
        }
        this.StopAimingTrace();
        return;
    }
    void PollAimingTrace()
    {
        if (!(this.GetbChordSatisfied()))
        {
            this.StopAimingTrace();
            return;
        }
        this.SetbAimingMarkable(::MarkUtil::IsAimingEntityOrPositionMarkable(this.GetContext().GetLocalPlayer(), this.GetModify_CurrentAimingEntity()));
        if (!(this.GetbAimingMarkable()))
        {
            this.SetCurrentAimingEntity(ENTITY_NULL);
        }
        return;
    }
    void StopAimingTrace()
    {
        if (this.GetbAimingTraceTicking())
        {
            this.ClearTimer(this.GetModify_AimingTraceTimer());
            this.SetbAimingTraceTicking(false);
        }
        this.SetbAimingMarkable(false);
        this.SetCurrentAimingEntity(ENTITY_NULL);
        return;
    }
    void RefreshShouldShow()
    {
        this.SetbShouldShow(this.GetbChordSatisfied() && this.GetbAimingMarkable());
        return;
    }
    void UpdateActionBarDisplay()
    {
        if (this.GetbShouldShow())
        {
            this.GetFastMarkAction().opArrow().OverrideActionName(this.GetDesiredActionName());
            ::FVMS_CommonBottomActionList::Get(this.GetManager()).AddExistingAction(this.GetFastMarkAction());
            return;
        }
        ::FVMS_CommonBottomActionList::Get(this.GetManager()).RemoveAction(this.GetFastMarkAction());
        return;
    }
    void UpdateActionDisplayName()
    {
        if (this.GetbShouldShow())
        {
            this.GetFastMarkAction().opArrow().OverrideActionName(this.GetDesiredActionName());
        }
        return;
    }
    FText GetDesiredActionName() const
    {
        if (this.GetCurrentAimingEntity())
        {
            FText local_12;
            if (::MarkUtil::IsEntityMarkedBySelf(this.GetContext().GetLocalPlayer(), this.GetCurrentAimingEntity().GetId()) || ::MarkUtil::IsSelfCreateMark(this.GetContext().GetLocalPlayer(), this.GetCurrentAimingEntity().GetId()) || (::FGuidingPathUtils::GetGuidingPathTargetEntityID(this.GetContext().GetLocalPlayer()) == this.GetCurrentAimingEntity().GetId()))
            {
                ::FASCommonUtils::GetEntityDisplayNameText(local_12);
                return FText::Format(NSLOCTEXT("CancelMarkAndGuide", "еЏ–ж¶€ж ‡и®°е’ЊеЇји€Є{0}"), local_12);
            }
            else
            {
                ::FASCommonUtils::GetEntityDisplayNameText(local_12);
                return FText::Format(NSLOCTEXT("MarkAndGuideEntity", "ж ‡и®°е№¶еЇји€Єе€°{0}"), local_12);
            }
        }
        else
        {
            FText local_12;
            NSLOCTEXT(local_12, "MarkAndGuidePosition");
            return local_12;
        }
    }
    const FECSEntity GetCurrentAimingEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_CurrentAimingEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCurrentAimingEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentAimingEntity = __Value;
        return;
    }
    bool GetbShouldShow() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bShouldShow;
    }
    void SetbShouldShow(const bool __Value) property
    {
        if (!(this.m_bShouldShow) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bShouldShow = __Value;
        return;
    }
    bool GetbChordSatisfied() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bChordSatisfied;
    }
    void SetbChordSatisfied(const bool __Value) property
    {
        if (!(this.m_bChordSatisfied) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bChordSatisfied = __Value;
        return;
    }
    bool GetbAimingMarkable() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bAimingMarkable;
    }
    void SetbAimingMarkable(const bool __Value) property
    {
        if (!(this.m_bAimingMarkable) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bAimingMarkable = __Value;
        return;
    }
    TEUIModelRef<FVM_InputAction> GetFastMarkAction() const property
    {
        this.TrackPropertyRead(4);
        return this.m_FastMarkAction;
    }
    void SetFastMarkAction(const TEUIModelRef<FVM_InputAction> &inout __Value) property
    {
        TEUIModelRef<FVM_InputAction> local_2;
        local_2 = this.m_FastMarkAction;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_FastMarkAction = __Value;
        return;
    }
    const float32 GetChordPollInterval() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_ChordPollInterval() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetChordPollInterval(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ChordPollInterval = __Value;
        return;
    }
    const float32 GetAimingTraceInterval() const property
    {
        const float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_AimingTraceInterval() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetAimingTraceInterval(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_AimingTraceInterval = __Value;
        return;
    }
    const FEUITimerHandle GetChordPollTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FEUITimerHandle GetModify_ChordPollTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetChordPollTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ChordPollTimer = __Value;
        return;
    }
    const FEUITimerHandle GetAimingTraceTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FEUITimerHandle GetModify_AimingTraceTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetAimingTraceTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_AimingTraceTimer = __Value;
        return;
    }
    bool GetbAimingTraceTicking() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bAimingTraceTicking;
    }
    void SetbAimingTraceTicking(const bool __Value) property
    {
        if (!(this.m_bAimingTraceTicking) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bAimingTraceTicking = __Value;
        return;
    }
}

namespace FM_FastMarkActionBarDisplay
{
FM_FastMarkActionBarDisplay& Get(const UObject ContextObject)
{
    return FM_FastMarkActionBarDisplay::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_FastMarkActionBarDisplay GetByManager(const UEUIManagerSubsystem Manager)
{
    FM_FastMarkActionBarDisplay __r;
    TEUIModelRef<FM_FastMarkActionBarDisplay> local_6 = TEUIModelRef<FM_FastMarkActionBarDisplay>(EUIInternal::MakeModelWithManager(Manager, FM_FastMarkActionBarDisplay::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelEffectDefine local_8;
    local_8.FunctionName = "SyncAimingTraceTimer";
    Result.EffectFunctions.Add(local_8);
    local_8.FunctionName = "RefreshShouldShow";
    Result.EffectFunctions.Add(local_8);
    FEUIModelDirtyDefine local_16;
    local_16.FunctionName = "__UpdateActionBarDisplay";
    local_16.DirtyFlags.Set(FM_FastMarkActionBarDisplay::__IndexOf_bShouldShow());
    Result.DirtyFunctions.Add(local_16);
    local_16.FunctionName = "__UpdateActionDisplayName";
    local_16.DirtyFlags.Set(FM_FastMarkActionBarDisplay::__IndexOf_CurrentAimingEntity());
    Result.DirtyFunctions.Add(local_16);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_FastMarkActionBarDisplay;
}
void __UpdateActionBarDisplay(FM_FastMarkActionBarDisplay &inout Model)
{
    Model.UpdateActionBarDisplay();
    return;
}
void __UpdateActionDisplayName(FM_FastMarkActionBarDisplay &inout Model)
{
    Model.UpdateActionDisplayName();
    return;
}
int __IndexOf_CurrentAimingEntity()
{
    return 0;
}
int __IndexOf_bShouldShow()
{
    return 1;
}
int __IndexOf_bChordSatisfied()
{
    return 2;
}
int __IndexOf_bAimingMarkable()
{
    return 3;
}
int __IndexOf_FastMarkAction()
{
    return 4;
}
int __IndexOf_ChordPollInterval()
{
    return 5;
}
int __IndexOf_AimingTraceInterval()
{
    return 6;
}
int __IndexOf_ChordPollTimer()
{
    return 7;
}
int __IndexOf_AimingTraceTimer()
{
    return 8;
}
int __IndexOf_bAimingTraceTicking()
{
    return 9;
}
}

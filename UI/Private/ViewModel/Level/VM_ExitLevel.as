
namespace FVMS_ExitLevel
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClick = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnComfirmExit = FEUIModelCallbackSignature();

}
struct FVMS_ExitLevel : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FEUITimerHandle m_AutoLeaveLevelTickTimer;
    UPROPERTY()
    FTimespan m_AutoLeaveLevelTime;
    UPROPERTY()
    bool m_bWillAutoLeaveLevel;

    FVMS_ExitLevel()
    {
        this.m_bWillAutoLeaveLevel = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_ExitLevel(const FVMS_ExitLevel &inout Other)
    {
        this.m_bWillAutoLeaveLevel = false;
        this.m_AutoLeaveLevelTickTimer = Other.m_AutoLeaveLevelTickTimer;
        this.m_AutoLeaveLevelTime = Other.m_AutoLeaveLevelTime;
        this.m_bWillAutoLeaveLevel = Other.m_bWillAutoLeaveLevel;
        return;
    }
    FVMS_ExitLevel opAssign(const FVMS_ExitLevel &inout Other)
    {
        FVMS_ExitLevel __r;
        this.m_AutoLeaveLevelTickTimer = Other.m_AutoLeaveLevelTickTimer;
        this.m_AutoLeaveLevelTime = Other.m_AutoLeaveLevelTime;
        this.m_bWillAutoLeaveLevel = Other.m_bWillAutoLeaveLevel;
        return __r;
    }
    bool WillAutoLeaveLevel() const
    {
        return this.GetbWillAutoLeaveLevel();
    }
    void UpdateWillAutoLeaveLevel()
    {
        this.SetbWillAutoLeaveLevel(this.CheckWillAutoLeaveLevel());
        return;
    }
    bool CheckWillAutoLeaveLevel() const
    {
        Has local_6;
        if (!(this.ShouldDisplay()) || !(local_6.opCall()))
        {
            return false;
        }
        TEUIModelRef<FM_CommissionPopup> local_14 = ::FMS_CommissionModelFactory::Get(this.GetManager()).GetCommissionPopup();
        TEUIModelRef<FM_CommissionPopup> local_12;
        if (!(local_12.IsValid()))
        {
            return false;
        }
        return local_12.opArrow().GetbSkipRewardPopups() || local_12.opArrow().GetbFullScreenRewardPopOpened();
    }
    void BeginDestroy()
    {
        this.StopAutoLeaveTicking();
        return;
    }
    void SyncAutoLeaveTicking()
    {
        if (this.GetbWillAutoLeaveLevel())
        {
            if (!(this.IsTimerActive(this.GetAutoLeaveLevelTickTimer())))
            {
                this.ScheduleTick(this.GetModify_AutoLeaveLevelTickTimer(), n"PollAutoLeaveLevelTime", 0.1f, -1.0f);
            }
            this.PollAutoLeaveLevelTime();
            return;
        }
        this.StopAutoLeaveTicking();
        return;
    }
    void StopAutoLeaveTicking()
    {
        this.ClearTimer(this.GetModify_AutoLeaveLevelTickTimer());
        this.SetAutoLeaveLevelTime(FTimespan::Zero());
        return;
    }
    void PollAutoLeaveLevelTime()
    {
        if (!(this.GetbWillAutoLeaveLevel()))
        {
            this.StopAutoLeaveTicking();
            return;
        }
        this.SetAutoLeaveLevelTime(this.ComputeAutoLeaveLevelTime());
        return;
    }
    FTimespan ComputeAutoLeaveLevelTime() const
    {
        float32 local_13;
        Get local_4;
        const FCS_CommissionFinish& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.GetbSuccess())
            {
                local_13 = ::CommissionUtils::GetCommissionSettings().CommissionFinishKickPlayerTime;
            }
            else
            {
                local_13 = ::CommissionUtils::GetCommissionSettings().CommissionFailKickPlayerTime;
            }
            if (local_13 > 0.0f)
            {
                FFPTime local_22 = (FFPTime(local_6.GetFinishTime()) + FFPTime(local_13));
                return FTimespan::FromSeconds(FMath::Max(0.0, (local_22 - this.GetContext().Time).ToSeconds()));
            }
        }
        return FTimespan::Zero();
    }
    FText GetAutoLeaveLevelTimeText() const
    {
        FNumberFormattingOptions local_6 = FNumberFormattingOptions();
        FText local_14;
        FText::AsNumber(local_14, this.GetAutoLeaveLevelTime().GetTotalSeconds());
        return FText::Format(INVTEXT("({0}s)"), local_14);
    }
    bool IsNearAutoLeave() const
    {
        return (FTimespan(this.GetAutoLeaveLevelTime()).opCmp(FTimespan::FromSeconds(5.0)) < 0);
    }
    bool ShouldDisplay() const
    {
        int local_160 = 0;
        if (this.GetContext().World.IsValid())
        {
            Get local_6;
            const FCS_ExitLevelOverride& local_8 = local_6.opCall();
            if (local_8)
            {
                return local_8.GetbCanExitLevel();
            }
        }
        TDataObjectPtr<FCommissionConfig> local_32;
        if (this.GetContext().World.IsValid())
        {
            Get local_36;
            const FCS_CommissionInfo& local_38 = local_36.opCall();
            if (local_38)
            {
                local_32 = local_38.CommissionConfig;
            }
        }
        TDataObjectPtr<FGlobalSettingsConfig> local_86 = ::FGlobalSettingsConfig::Get();
        if (local_86)
        {
            for (auto& local_124 : local_86.opArrow().GetTutorialMissionConfigs())
            {
                if ((local_124 == local_32.opImplConv()))
                {
                    return false;
                }
            }
        }
        bool local_149 = false;
        Has local_154;
        bool local_1 = local_154.opCall();
        if (local_1)
        {
            local_149 = local_160.GetbHiddenExitLevel();
        }
        if (local_149)
        {
            return false;
        }
        TDataObjectPtr<FLevelInfoConfig> local_184 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
        if (local_184)
        {
            if (int(local_184.opArrow().LevelType) == 3 || (int(local_184.opArrow().LevelType) == 5) || (int(local_184.opArrow().LevelType) == 6))
            {
                return true;
            }
        }
        bool local_1_2 = local_154.opCall();
        if (local_1_2)
        {
            if (int(local_160.GetGameModeType()) != 0)
            {
                return true;
            }
        }
        return false;
    }
    void OnClick()
    {
        FDialogModelCallback local_26;
        local_26.Bind(this, FVMS_ExitLevel::OnComfirmExit);
        FText local_72 = FText();
        FText local_76 = FText();
        FDialogCallback local_58 = FDialogCallback(local_26);
        FText local_62 = NSLOCTEXT("ExitLevel_DialogMessage", "зЎ®е®љи¦Ѓз¦»ејЂе…іеЌЎеђ—пјџ");
        FText local_66 = NSLOCTEXT("ExitLevel_DialogTitle", "з¦»ејЂе…іеЌЎ");
        FCommonDialogParam local_68;
        ::CommonPopup::Dialog_Decision(local_66, local_62, local_58, local_76, local_72, local_68);
        return;
    }
    bool OnComfirmExit(const FCommonDialogAnswer &inout Answer)
    {
        int local_70 = 0;
        if (int(Answer.AnswerType) == 1)
        {
            TDataObjectPtr<FLevelInfoConfig> local_28 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
            if (local_28)
            {
                if (int(local_28.opArrow().LevelType) == 2)
                {
                    ::FGameConnectionUtils::UICallEnterMainCity(this.GetContext().GetLocalPlayer());
                }
                else
                {
                    if (int(local_28.opArrow().LevelType) == 3 || (int(local_28.opArrow().LevelType) == 5) || (int(local_28.opArrow().LevelType) == 6))
                    {
                        ::FGameConnectionUtils::UICallLeaveCurrentLevel(this.GetContext().GetLocalPlayer());
                    }
                    else
                    {
                        bool local_4;
                        Has local_64;
                        local_4 = local_64.opCall();
                        if (local_4)
                        {
                            if (int(local_70.GetGameModeType()) != 0)
                            {
                                ::FGameConnectionUtils::UICallBackToCityLevel(this.GetContext().GetLocalPlayer());
                            }
                        }
                    }
                }
            }
        }
        return true;
    }
    const FEUITimerHandle GetAutoLeaveLevelTickTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUITimerHandle GetModify_AutoLeaveLevelTickTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAutoLeaveLevelTickTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AutoLeaveLevelTickTimer = __Value;
        return;
    }
    const FTimespan GetAutoLeaveLevelTime() const property
    {
        const FTimespan __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FTimespan GetModify_AutoLeaveLevelTime() property
    {
        FTimespan __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAutoLeaveLevelTime(const FTimespan &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AutoLeaveLevelTime = __Value;
        return;
    }
    bool GetbWillAutoLeaveLevel() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bWillAutoLeaveLevel;
    }
    void SetbWillAutoLeaveLevel(const bool __Value) property
    {
        if (!(this.m_bWillAutoLeaveLevel) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bWillAutoLeaveLevel = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_ExitLevel
{
    UPROPERTY()
    bool WillAutoLeaveLevel;
    UPROPERTY()
    FText AutoLeaveLevelTimeText;
    UPROPERTY()
    bool IsNearAutoLeave;
    UPROPERTY()
    bool ShouldDisplay;
    UPROPERTY()
    TEUIModelRef<FVMS_ExitLevel> Self;


}

namespace FVMS_ExitLevel
{
FVMS_ExitLevel& Get(const UObject ContextObject)
{
    return FVMS_ExitLevel::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_ExitLevel GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_ExitLevel __r;
    TEUIModelRef<FVMS_ExitLevel> local_6 = TEUIModelRef<FVMS_ExitLevel>(EUIInternal::MakeModelWithManager(Manager, FVMS_ExitLevel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AutoLeaveLevelTime";
    local_14.TypeName = "FTimespan";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WillAutoLeaveLevel";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AutoLeaveLevelTimeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsNearAutoLeave";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldDisplay";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_ExitLevel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_ExitLevel;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "UpdateWillAutoLeaveLevel";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "SyncAutoLeaveTicking";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_ExitLevel;
}
FTimespan __UIGetter_AutoLeaveLevelTime(const FVMS_ExitLevel &inout Model)
{
    return Model.GetAutoLeaveLevelTime();
}
bool __UIGetter_WillAutoLeaveLevel(const FVMS_ExitLevel &inout Model)
{
    return Model.WillAutoLeaveLevel();
}
FText __UIGetter_AutoLeaveLevelTimeText(const FVMS_ExitLevel &inout Model)
{
    return Model.GetAutoLeaveLevelTimeText();
}
bool __UIGetter_IsNearAutoLeave(const FVMS_ExitLevel &inout Model)
{
    return Model.IsNearAutoLeave();
}
bool __UIGetter_ShouldDisplay(const FVMS_ExitLevel &inout Model)
{
    return Model.ShouldDisplay();
}
TEUIModelRef<FVMS_ExitLevel> __UIGetter_Self(const FVMS_ExitLevel &inout Model)
{
    return TEUIModelRef<FVMS_ExitLevel>(Model);
}
int __IndexOf_AutoLeaveLevelTickTimer()
{
    return 0;
}
int __IndexOf_AutoLeaveLevelTime()
{
    return 1;
}
int __IndexOf_bWillAutoLeaveLevel()
{
    return 2;
}
}
namespace __GeneratedProperties_FVMS_ExitLevel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

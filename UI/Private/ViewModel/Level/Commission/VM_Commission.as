
enum ECommissionViewTransitionPhase
{
    None,
    Disappearing,
    Appearing,
}

namespace FVMS_Commission
{
    const int ModelId = 0;

}
struct FVMS_Commission : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    int m_Nop;
    UPROPERTY()
    TArray<FEUIModelContainer> m_TargetModels;
    UPROPERTY()
    TArray<FEUIModelContainer> m_ViewTargetModels;
    UPROPERTY()
    TEUIModelRef<FVM_MissionInfoTitle> m_TitleModel;
    UPROPERTY()
    TEUIModelRef<FMS_LevelInfo> m_LevelInfo;
    UPROPERTY()
    TEUIModelRef<FMS_ClientCondition> m_ClientCondition;
    UPROPERTY()
    TArray<FEUIModelContainer> m_PendingAddModels;
    UPROPERTY()
    TArray<uint64> m_ViewTargetKeys;
    UPROPERTY()
    ECommissionViewTransitionPhase m_TransitionPhase;
    UPROPERTY()
    float32 m_DisappearDuration;
    UPROPERTY()
    float32 m_AppearDuration;
    UPROPERTY()
    FMW_CounterDown m_CommissionCounterDown;
    UPROPERTY()
    FFPTime m_CachedCommissionTimeoutTime;
    UPROPERTY()
    FEUITimerHandle m_TransitionTimer;

    FVMS_Commission()
    {
        this.m_Nop = 0;
        this.m_TransitionPhase = ECommissionViewTransitionPhase(0);
        this.m_DisappearDuration = 0.3f;
        this.m_AppearDuration = 0.3f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_Commission(const FVMS_Commission &inout Other)
    {
        this.m_Nop = 0;
        this.m_TransitionPhase = ECommissionViewTransitionPhase(0);
        this.m_DisappearDuration = 0.3f;
        this.m_AppearDuration = 0.3f;
        this.m_Nop = int(Other.m_Nop);
        this.m_TargetModels = Other.m_TargetModels;
        this.m_ViewTargetModels = Other.m_ViewTargetModels;
        this.m_TitleModel = Other.m_TitleModel;
        this.m_LevelInfo = Other.m_LevelInfo;
        this.m_ClientCondition = Other.m_ClientCondition;
        this.m_PendingAddModels = Other.m_PendingAddModels;
        this.m_ViewTargetKeys = Other.m_ViewTargetKeys;
        this.m_TransitionPhase = Other.m_TransitionPhase;
        this.m_DisappearDuration = Other.m_DisappearDuration;
        this.m_AppearDuration = Other.m_AppearDuration;
        this.m_CommissionCounterDown = Other.m_CommissionCounterDown;
        this.m_CachedCommissionTimeoutTime = Other.m_CachedCommissionTimeoutTime;
        this.m_TransitionTimer = Other.m_TransitionTimer;
        return;
    }
    FVMS_Commission& opAssign(const FVMS_Commission &inout Other)
    {
        this.m_Nop = int(Other.m_Nop);
        this.m_TargetModels = Other.m_TargetModels;
        this.m_ViewTargetModels = Other.m_ViewTargetModels;
        this.m_TitleModel = Other.m_TitleModel;
        this.m_LevelInfo = Other.m_LevelInfo;
        this.m_ClientCondition = Other.m_ClientCondition;
        this.m_PendingAddModels = Other.m_PendingAddModels;
        this.m_ViewTargetKeys = Other.m_ViewTargetKeys;
        this.m_TransitionPhase = Other.m_TransitionPhase;
        this.m_DisappearDuration = Other.m_DisappearDuration;
        this.m_AppearDuration = Other.m_AppearDuration;
        this.m_CommissionCounterDown = Other.m_CommissionCounterDown;
        this.m_CachedCommissionTimeoutTime = Other.m_CachedCommissionTimeoutTime;
        return Other.m_TransitionTimer;
    }
    bool HasCommission() const
    {
        Has local_4;
        return local_4.opCall() && this.GetCommissionConfig().IsSet();
    }
    bool ShouldDisplay() const
    {
        TDataObjectPtr<FLevelInfoConfig> local_24 = this.GetCurrentLevelInfoConfig();
        if (local_24)
        {
            if (int(local_24.opArrow().LevelType) == 3 || (int(local_24.opArrow().LevelType) == 5))
            {
                return this.HasCommission();
            }
            if (int(local_24.opArrow().LevelType) == 1 || (int(local_24.opArrow().LevelType) == 2))
            {
                return ::MissionUtils::GetCurrentTrackingMission(this.GetContext().GetLocalPlayer(), EMissionType(0)).IsSet();
            }
        }
        return false;
    }
    FText CommissionOnGoingTitle() const
    {
        TDataObjectPtr<FCommissionConfig> local_24 = this.GetCommissionConfig();
        FText local_54;
        if (local_24)
        {
            local_54 = NSLOCTEXT("Commission", "CommissionOnGoingTitle", "{0}иї›иЎЊдё­...");
            return FText::Format(local_54, local_24.opArrow().CommissionName);
        }
        return local_54;
    }
    TDataObjectPtr<FCommissionConfig> GetCommissionConfig() const
    {
        Get local_4;
        const FCS_CommissionInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            return local_6.CommissionConfig;
        }
        return TDataObjectPtr<FCommissionConfig>();
    }
    TDataObjectPtr<FCommissionTypeConfig> GetCommissionTypeConfig() const
    {
        TDataObjectPtr<FCommissionConfig> local_24 = this.GetCommissionConfig();
        if (local_24)
        {
            return ::CommissionUtils::GetCommissionTypeConfig(local_24.opArrow().CommissionType);
        }
        return TDataObjectPtr<FCommissionTypeConfig>();
    }
    FTimespan GetCommissionRemainingTime() const
    {
        return FTimespan::FromSeconds(this.GetCommissionCounterDown().GetRemainedTime().ToSeconds());
    }
    FText GetCommissionRemainingTimeText() const
    {
        return ::CommissionTimeUtils::FormatRemainingTime(this.GetCommissionCounterDown().GetRemainedTime());
    }
    bool HasTimeLimit() const
    {
        TDataObjectPtr<FCommissionConfig> local_24 = this.GetCommissionConfig();
        if (local_24)
        {
            return (local_24.opArrow().CommissionTimeLimit > 0.0f);
        }
        return false;
    }
    void PostConstruct()
    {
        this.SetLevelInfo(TEUIModelRef<FMS_LevelInfo>(::FMS_LevelInfo::Get(this.GetContext().Manager)));
        this.SetClientCondition(TEUIModelRef<FMS_ClientCondition>(::FMS_ClientCondition::Get(this.GetContext().Manager)));
        this.SetTitleModel(TEUIModelRef<FVM_MissionInfoTitle>(::FVM_MissionInfoTitle::Create(this.GetContext().Manager, FText(), false, FSoftBrush(), false)));
        return;
    }
    void RefreshTargetModels()
    {
        this.RefreshTargetsAndSync();
        return;
    }
    void MonitorCommissionInfo(const FCS_CommissionInfo &inout C_CommissionInfo)
    {
        this.RefreshTargetsAndSync();
        return;
    }
    void MonitorCommissionFinish(const FCS_CommissionFinish &inout C_CommissionFinish)
    {
        this.RefreshTargetsAndSync();
        return;
    }
    void MonitorCommissionSubTarget(const FCS_CommissionSubTarget &inout C_CommissionSubTarget)
    {
        this.RefreshTargetsAndSync();
        return;
    }
    void MonitorPVXPhaseState(const FCS_PVXPhaseState &inout C_PVXPhaseState)
    {
        this.RefreshTargetsAndSync();
        return;
    }
    void MonitorPVXMonsterHPDisplay(const FCS_PVXMonsterHPDisplay &inout C_PVXMonsterHPDisplay)
    {
        this.RefreshTargetsAndSync();
        return;
    }
    void MonitorPlayerMissionInfo(const FC_PlayerMissionInfo &inout C_PlayerMissionInfo)
    {
        this.RefreshTargetsAndSync();
        return;
    }
    void MonitorTrackingMission(const FC_TrackingMission &inout C_TrackingMission)
    {
        this.RefreshTargetsAndSync();
        return;
    }
    void RefreshTargetsAndSync()
    {
        TDataObjectPtr<FLevelInfoConfig> local_24 = this.GetCurrentLevelInfoConfig();
        if (!(local_24))
        {
            this.ClearAllTargets();
            this.SyncViewTargetModels();
            return;
        }
        if (int(local_24.opArrow().LevelType) == 3 || (int(local_24.opArrow().LevelType) == 5))
        {
            this.RefreshCommissionOrPVXTargets();
        }
        else
        {
            if (int(local_24.opArrow().LevelType) == 1 || (int(local_24.opArrow().LevelType) == 2))
            {
                this.RefreshMainTaskTargets();
            }
            else
            {
                this.ClearAllTargets();
            }
        }
        this.SyncViewTargetModels();
        return;
    }
    void ClearCommissionCounterDown()
    {
        this.SetCachedCommissionTimeoutTime(FFPTime());
        return;
    }
    TDataObjectPtr<FLevelInfoConfig> GetCurrentLevelInfoConfig() const
    {
        if (this.GetLevelInfo().IsValid())
        {
            TEUIModelRef<FMS_LevelInfo> local_2 = this.GetLevelInfo();
            return GetLevelInfoConfig();
        }
        return ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
    }
    bool IsClientLoading() const
    {
        bool local_9;
        if (this.GetClientCondition().IsValid())
        {
            TEUIModelRef<FMS_ClientCondition> local_2 = this.GetClientCondition();
            local_9 = GetbIsLoading();
        }
        else
        {
            local_9 = KLLoadingScreen::IsLoadingScreenVisible(__GetWorldContext());
        }
        return local_9;
    }
    void ClearAllTargets()
    {
        if (this.GetTitleModel().IsValid())
        {
            TEUIModelRef<FVM_MissionInfoTitle> local_2 = this.GetTitleModel();
            FText local_8;
            local_8.SetTitle();
        }
        this.ClearCommissionCounterDown();
        this.GetModify_TargetModels().Empty(0);
        return;
    }
    void RefreshCommissionOrPVXTargets()
    {
        if (this.IsClientLoading())
        {
            if (this.GetTitleModel().IsValid())
            {
                TEUIModelRef<FVM_MissionInfoTitle> local_4 = this.GetTitleModel();
                FText local_8;
                local_8.SetTitle();
            }
            return;
        }
        Has local_12;
        bool local_1 = local_12.opCall();
        if (local_1)
        {
            this.Commission_Finish();
            return;
        }
        this.Commission_OnGoing();
        return;
    }
    void RefreshMainTaskTargets()
    {
        bool local_5;
        if (!(this.GetContext().GetLocalPlayer().IsValid()))
        {
            return;
        }
        TDataObjectPtr<FMissionConfig> local_30 = ::MissionUtils::GetCurrentTrackingMission(this.GetContext().GetLocalPlayer(), EMissionType(0));
        local_5 = !(local_30.IsSet());
        if (local_5)
        {
            bool local_58;
            bool local_57;
            TEUIModelRef<FVM_MissionInfoTitle> local_56 = this.GetTitleModel();
            if (!(local_56.IsValid()))
            {
                local_58 = true;
            }
            else
            {
                TEUIModelRef<FVM_MissionInfoTitle> local_56_2 = this.GetTitleModel();
                local_57 = local_56_2.IsValid();
                if (!(local_57))
                {
                    local_57 = false;
                }
                else
                {
                    TEUIModelRef<FVM_MissionInfoTitle> local_56_3 = this.GetTitleModel();
                    local_57 = !(GetTitle().IsEmpty());
                }
                local_58 = local_57;
            }
            FSoftBrush local_104;
            if (local_58)
            {
                local_5 = false;
                local_104 = FSoftBrush();
                local_58 = false;
                TEUIModelRef<FVM_MissionInfoTitle> local_56_4 = TEUIModelRef<FVM_MissionInfoTitle>(::FVM_MissionInfoTitle::Create(this.GetContext().Manager, FText(), local_58, local_104, local_5));
                this.SetTitleModel(local_56_4);
            }
            this.GetModify_TargetModels().Empty(0);
            this.CommissionDbg_LogState("RefreshMainTaskTargets:no tracking mission -> TargetModels.Empty", 1);
            return;
        }
        TEUIModelRef<FVM_MissionInfoTitle> local_56_5 = this.GetTitleModel();
        if (!(local_56_5.IsValid()))
        {
            local_5 = true;
        }
        else
        {
            bool local_57;
            local_56_5 = this.GetTitleModel();
            local_57 = local_56_5.IsValid();
            if (!(local_57))
            {
                local_57 = false;
            }
            else
            {
                local_56_5 = this.GetTitleModel();
                FText local_108 = FText(GetTitle());
                local_5 = !local_5;
                local_57 = local_5;
            }
            local_5 = local_57;
        }
        if (local_5)
        {
            FSoftBrush local_104;
            bool local_58;
            bool local_57;
            FSoftBrush local_156;
            TDataObjectPtr<FMissionPhaseConfig> local_180;
            if (::MissionUtils::GetGuidePresentationConfig(local_30, local_180).IsSet())
            {
                local_104.GetGuideIcon();
                local_156 = local_104;
            }
            local_58 = false;
            local_57 = false;
            this.SetTitleModel(local_56_5);
        }
        this.FillMainTaskObjectiveModels(local_30);
        return;
    }
    int CommissionDbg_Level() const
    {
        return UICommonUtil::CVar_UI_DebugCommissionTargetModels.GetInt();
    }
    uint64 CommissionDbg_ItemKey(FEUIModelContainer &inout C)
    {
        int local_6 = 0;
        int local_10 = 0;
        FEUIModelContainer::RequireModel(C);
        int local_9 = local_6.GetSingleObjectiveConfig().IsSet() ? local_10 : 0;
        int64 local_12 = local_9;
        local_10 = 1;
        local_12 = local_12 << local_10;
        local_12 = local_12 | local_6.GetSubObj() ? 1 : 0;
        return local_12;
    }
    FString CommissionDbg_FormatVmLine(const FString &inout Prefix, const int Idx, FEUIModelContainer &inout C)
    {
        int local_6 = 0;
        int local_14 = 0;
        FEUIModelContainer::RequireModel(C);
        int local_10 = this.CommissionDbg_ItemKey(C);
        int local_13 = local_6.GetSingleObjectiveConfig().IsSet() ? local_14 : 0;
        int local_24 = local_6.GetProgress().GetFailedProgressValue();
        int local_23 = local_6.GetProgress().GetSuccessProgressValue();
        int local_22 = int(local_6.GetUIState());
        int local_20 = int(local_6.GetAnimState());
        return FString().Append(Prefix).Append("[").Append(Idx).Append("] k=").Append(local_10).Append(" id=").Append(local_13).Append(" sub=").Append(local_6.GetSubObj()).Append(" anim=").Append(local_20).Append(" ui=").Append(local_22).Append(" ok=").Append(local_23).Append(" fail=").Append(local_24);
    }
    void CommissionDbg_LogState(const FString &inout Where, const int MinLevel = 1)
    {
        if (this.CommissionDbg_Level() < MinLevel)
        {
            return;
        }
        FString local_6 = FString().Append("[FVMS_Commission] ").Append(Where).Append(" | phase=").Append(int(this.GetTransitionPhase())).Append(" T=").Append(this.GetTargetModels().Num()).Append(" V=").Append(this.GetViewTargetModels().Num()).Append(" vk=").Append(this.GetViewTargetKeys().Num()).Append(" pend=").Append(this.GetPendingAddModels().Num());
        int local_16 = 0;
        for (; local_16 < this.GetViewTargetKeys().Num(); )
        {
            local_6 += FString().Append(" vk[").Append(local_16).Append("]=").Append(this.GetViewTargetKeys()[local_16]);
            ++local_16;
        }
        int local_16_2 = 0;
        for (; local_16_2 < this.GetTargetModels().Num(); )
        {
            FString local_24 = (FString(" | ") + this.CommissionDbg_FormatVmLine("T", local_16_2, this.GetModify_TargetModels()[local_16_2]));
            local_6 += local_24;
            ++local_16_2;
        }
        int local_16_3 = 0;
        for (; local_16_3 < this.GetViewTargetModels().Num(); )
        {
            FString local_10 = (FString(" | ") + this.CommissionDbg_FormatVmLine("V", local_16_3, this.GetModify_ViewTargetModels()[local_16_3]));
            local_6 += local_10;
            ++local_16_3;
        }
        XLog(ELog(16), local_6);
        return;
    }
    void Commission_Finish()
    {
        int local_27 = 0;
        bool local_90;
        if (!(this.HasCommission()))
        {
            return;
        }
        TDataObjectPtr<FCommissionConfig> local_26 = this.GetCommissionConfig();
        if (!(::CommissionUtils::GetCommissionTypeConfig(ECommissionType(local_27))))
        {
            XError(ELog(16), "CommissionTypeConfig is null");
            return;
        }
        FText local_86 = NSLOCTEXT("CommissionFinishTargetTitle", "Tile_CommissionEnd", "е…іеЌЎеЌіе°†з»“жќџ");
        TEUIModelRef<FVM_MissionInfoTitle> local_88 = this.GetTitleModel();
        if (!(local_88.IsValid()))
        {
            local_90 = true;
        }
        else
        {
            local_88 = this.GetTitleModel();
            bool local_89 = local_88.IsValid();
            if (!(local_89))
            {
                local_89 = false;
            }
            else
            {
                local_88 = this.GetTitleModel();
                local_89 = !((FText(GetTitle()) == local_86));
            }
            local_90 = local_89;
        }
        if (local_90)
        {
            local_90 = true;
            this.SetTitleModel(local_88);
        }
        TEUIModelRef<FVM_MissionInfoTitle> local_88_2 = this.GetTitleModel();
        Get local_94;
        local_94.opCall().GetKickPlayerTime().SetEndTime();
        this.ClearCommissionCounterDown();
        this.GetModify_TargetModels().Empty(0);
        FCommissionObjItemModelData local_130;
        local_130.DefaultText = NSLOCTEXT("CommissionFinishTargetTitle", "Tile_CommissionEndContent", "ESCжЏђе‰Ќз¦»ејЂе…іеЌЎ");
        FEUIModelContainer::MakeCached local_144;
        this.GetModify_TargetModels().Add(local_144.opImplConv());
        this.CommissionDbg_LogState("Commission_Finish:targets_reset", 1);
        return;
    }
    void Commission_OnGoing()
    {
        int local_27 = 0;
        bool local_118;
        if (!(this.HasCommission()))
        {
            return;
        }
        TDataObjectPtr<FCommissionConfig> local_26 = this.GetCommissionConfig();
        if (!(::CommissionUtils::GetCommissionTypeConfig(ECommissionType(local_27))))
        {
            XError(ELog(16), "CommissionTypeConfig is null");
            return;
        }
        TDataObjectPtr<FCommissionConfig> local_26_2 = this.GetCommissionConfig();
        FText local_114;
        if (local_26_2)
        {
        }
        else
        {
            local_114 = FText();
        }
        TEUIModelRef<FVM_MissionInfoTitle> local_116 = this.GetTitleModel();
        if (!(local_116.IsValid()))
        {
            local_118 = true;
        }
        else
        {
            local_116 = this.GetTitleModel();
            bool local_117 = local_116.IsValid();
            if (!(local_117))
            {
                local_117 = false;
            }
            else
            {
                local_116 = this.GetTitleModel();
                local_117 = !((FText(GetTitle()) == local_114));
            }
            local_118 = local_117;
        }
        if (local_118)
        {
            local_118 = false;
            bool local_1 = this.HasTimeLimit();
            this.SetTitleModel(local_116);
        }
        if (!(this.HasTimeLimit()))
        {
            local_118 = false;
        }
        else
        {
            local_118 = local_26_2;
        }
        if (local_118)
        {
            Get local_122;
            const FCS_CommissionInfo& local_124 = local_122.opCall();
            if (local_124)
            {
                TEUIModelRef<FVM_MissionInfoTitle> local_116_2 = this.GetTitleModel();
                local_124.CommissionTimeoutTime.SetEndTime();
                if ((!((FFPTime(this.GetCachedCommissionTimeoutTime()) == local_124.CommissionTimeoutTime))))
                {
                    this.SetCachedCommissionTimeoutTime(local_124.CommissionTimeoutTime);
                    FFPTime local_126 = local_124.CommissionTimeoutTime;
                    this.GetModify_CommissionCounterDown().SetRemainedTimeWithPrecision(FFPTime(FMath::Max((local_126 - this.GetContext().Time).ToSeconds(), 0.0)), EMWCounterDownPrecision(0));
                }
            }
        }
        else
        {
            this.ClearCommissionCounterDown();
        }
        this.GetModify_TargetModels().Empty(0);
        if (this.IsPVXDualFactionMode())
        {
            this.FillPVXFactionObjectiveModels();
        }
        else
        {
            this.FillCommissionObjectiveModels();
        }
        this.FillCommissionSubObjectiveModels();
        this.CommissionDbg_LogState("Commission_OnGoing:targets_rebuilt", 1);
        return;
    }
    bool IsPVXDualFactionMode() const
    {
        TDataObjectPtr<FLevelInfoConfig> local_24 = this.GetCurrentLevelInfoConfig();
        if (!(local_24) || (int(local_24.opArrow().LevelType) != 5))
        {
            return false;
        }
        Get local_58;
        const FCS_PVXPhaseState& local_60 = local_58.opCall();
        if (local_60)
        {
            return local_60.GetPlayerObjective().IsSet() || local_60.GetBossObjective().IsSet();
        }
        return false;
    }
    EFaction GetLocalPlayerFaction() const
    {
        int local_13;
        bool local_5 = !(this.GetContext().GetLocalPlayer().IsValid());
        if (local_5)
        {
            local_5 = true;
        }
        else
        {
            FECSEntity local_4 = this.GetContext().GetLocalPlayer();
            Has local_10;
            local_5 = !(local_10.opCall());
        }
        if (local_5)
        {
            return EFaction(1);
        }
        FECSEntity local_4_2 = this.GetContext().GetLocalPlayer();
        Get local_18;
        local_13 = local_18.opCall().GetPlayerId();
        Get local_24;
        const FCS_GameMode_MatchData& local_26 = local_24.opCall();
        if (local_26)
        {
            FGameModePlayerMatchDataBase local_34;
            if (local_26.GetPlayerMatchDatas().Find(local_13, local_34))
            {
                return local_34.GetFaction();
            }
        }
        return EFaction(1);
    }
    void FillPVXFactionObjectiveModels()
    {
        TDataObjectPtr<FObjectiveSingleConfig> local_118;
        bool local_119 = false;
        int local_155;
        int local_156;
        FEUIModelContainer::MakeCached local_170;
        int local_190 = 0;
        int local_244 = 0;
        Get local_4;
        if (local_4.opCall())
        {
            EFaction local_9 = this.GetLocalPlayerFaction();
            if (int(local_9) == 6)
            {
            }
            else
            {
            }
            FCommissionTargetProgress local_62;
            FCommissionTargetProgress local_64;
            if (int(local_9) == 6)
            {
            }
            else
            {
            }
            local_62 = local_64;
            TDataObjectPtr<FObjectiveConfig> local_60;
            bool local_7 = !(local_60.IsSet());
            if (local_7)
            {
                return;
            }
            if (0 == 0)
            {
                TDataObjectPtr<FObjectiveSingleConfig> local_94;
                CastTo local_70;
                local_94 = local_70.opCall();
                if (local_7)
                {
                    return;
                }
                bool local_7_2 = (local_62.GetSuccessProgressValue() >= ::ConditionUtils::GetTargetValue(GetFinishCondition()));
                if (!(GetFinishCondition()))
                {
                    local_7_2 = false;
                }
                FCommissionObjItemModelData local_154;
                local_119 = false;
                local_154.SubObj = local_119;
                if (local_7_2)
                {
                    local_156 = 1;
                    local_155 = local_156;
                }
                else
                {
                    local_156 = 0;
                    local_155 = local_156;
                }
                local_154.UIState = EObjectiveItemUIState(local_155);
                local_154.SingleObjectiveConfig = local_94;
                this.GetModify_TargetModels().Add(local_170.opImplConv());
                FEUIModelContainer::RequireModel(this.GetModify_TargetModels().Last(0));
                local_190.SetProgress(local_62);
            }
            else
            {
                CastTo local_194;
                TDataObjectPtr<FObjectiveGroupConfig> local_218 = local_194.opCall();
                if (int(local_9) == 6)
                {
                }
                else
                {
                }
                for (auto& local_258 : GetChildObjectives())
                {
                    local_258;
                    CastTo local_262;
                    local_118 = local_262.opCall();
                    if (local_119)
                    {
                        continue;
                    }
                    local_119 = false;
                    bool local_7_3 = local_119;
                    FCommissionTargetProgress local_264;
                    if (local_244.Contains(unresolved.DataId))
                    {
                        local_119 = (local_264.GetSuccessProgressValue() >= ::ConditionUtils::GetTargetValue(GetFinishCondition()));
                        local_7_3 = local_119;
                    }
                    local_119 = !(GetFinishCondition());
                    if (local_119)
                    {
                        local_119 = false;
                        local_7_3 = local_119;
                    }
                    if (0 == 2)
                    {
                        local_119 = !local_119;
                        if (local_119)
                        {
                            continue;
                        }
                        if (local_7_3)
                        {
                            continue;
                        }
                    }
                    FCommissionObjItemModelData local_154;
                    local_154.SubObj = false;
                    if (local_7_3)
                    {
                        local_156 = 1;
                        local_155 = local_156;
                    }
                    else
                    {
                        local_156 = 0;
                        local_155 = local_156;
                    }
                    local_154.UIState = EObjectiveItemUIState(local_155);
                    local_154.SingleObjectiveConfig = local_118;
                    this.GetModify_TargetModels().Add(local_170.opImplConv());
                    FEUIModelContainer::RequireModel(this.GetModify_TargetModels().Last(0));
                    local_190.SetProgress(local_264);
                }
            }
            Get local_270;
            const FCS_PVXMonsterHPDisplay& local_272 = local_270.opCall();
            if (local_272)
            {
                FCommissionTargetProgress local_264;
                local_264.SetSuccessProgressValue(local_272.GetHPPercent());
                int local_273 = 0;
                for (; local_273 < this.GetTargetModels().Num(); ++local_273)
                {
                    FEUIModelContainer::RequireModel(this.GetModify_TargetModels()[local_273]);
                    if (local_190.GetSingleObjectiveConfig().IsSet() && (0 == 2))
                    {
                        local_190.SetProgress(local_264);
                    }
                }
            }
        }
        return;
    }
    void FillSingleChildObjectiveModel(const FCS_CommissionInfo &inout C_CommissionInfo, const TDataObjectPtr<FObjectiveGroupConfig> &inout ObjGroup, const TDataObjectPtr<FObjectiveSingleConfig> &inout ObjectiveSingleConfig)
    {
        int local_43;
        int local_102 = 0;
        bool local_1 = false;
        FCommissionTargetProgress local_4;
        if (C_CommissionInfo.ChildProgress.Contains(unresolved.DataId))
        {
            local_1 = (local_4.GetSuccessProgressValue() >= ::ConditionUtils::GetTargetValue(GetFinishCondition()));
        }
        bool local_2 = !(GetFinishCondition());
        if (local_2)
        {
            local_2 = false;
            local_1 = local_2;
        }
        if (0 == 2)
        {
            local_2 = !local_2;
            if (local_2)
            {
                return;
            }
            if (local_1)
            {
                return;
            }
        }
        FCommissionObjItemModelData local_42;
        local_42.SubObj = false;
        if (local_1)
        {
            int local_44;
            local_44 = 1;
            local_43 = local_44;
        }
        else
        {
            int local_44;
            local_44 = 0;
            local_43 = local_44;
        }
        local_42.UIState = EObjectiveItemUIState(local_43);
        local_42.SingleObjectiveConfig = ObjectiveSingleConfig;
        FEUIModelContainer::MakeCached local_82;
        this.GetModify_TargetModels().Add(local_82.opImplConv());
        FEUIModelContainer::RequireModel(this.GetModify_TargetModels().Last(0));
        local_102.SetProgress(local_4);
        return;
    }
    void FillCommissionObjectiveModels()
    {
        bool local_7 = false;
        CastTo local_14;
        TDataObjectPtr<FObjectiveSingleConfig> local_38;
        TDataObjectPtr<FObjectiveSingleConfig> local_62;
        bool local_63 = false;
        int local_99;
        int local_100;
        int local_134 = 0;
        bool local_293 = false;
        Get local_4;
        const FCS_CommissionInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.CommissionTargetObjective)
            {
                if (0 == 0)
                {
                    local_38 = local_14.opCall();
                    local_7 = !local_7;
                    if (local_7)
                    {
                        local_7 = (local_6.Progress.GetSuccessProgressValue() >= ::ConditionUtils::GetTargetValue(GetFinishCondition()));
                        if (!(GetFinishCondition()))
                        {
                            local_7 = false;
                        }
                        FCommissionObjItemModelData local_98;
                        local_63 = false;
                        local_98.SubObj = local_63;
                        if (local_7)
                        {
                            local_100 = 1;
                            local_99 = local_100;
                        }
                        else
                        {
                            local_100 = 0;
                            local_99 = local_100;
                        }
                        local_98.UIState = EObjectiveItemUIState(local_99);
                        local_98.SingleObjectiveConfig = local_38;
                        FEUIModelContainer::MakeCached local_114;
                        this.GetModify_TargetModels().Add(local_114.opImplConv());
                        FEUIModelContainer::RequireModel(this.GetModify_TargetModels().Last(0));
                        local_134.SetProgress(local_6.Progress);
                    }
                }
                else
                {
                    CastTo local_138;
                    TDataObjectPtr<FObjectiveGroupConfig> local_162 = local_138.opCall();
                    TSet<uint> local_206;
                    for (auto& local_220 : GetChildObjectives())
                    {
                        local_220;
                        CastTo local_224;
                        local_62 = local_224.opCall();
                        if (local_63)
                        {
                            continue;
                        }
                        this.FillSingleChildObjectiveModel(local_6, local_162, local_62);
                    }
                    for (auto& local_242 : local_6.ChildProgress)
                    {
                        if (local_206.Contains(local_242.GetKey()))
                        {
                            continue;
                        }
                        if (!(::ObjectiveUtils::FindObjectiveConfig(local_242.GetKey()).IsSet()))
                        {
                            continue;
                        }
                        local_38 = local_14.opCall();
                        if (!(local_38.IsSet()) || local_293)
                        {
                            continue;
                        }
                        this.FillSingleChildObjectiveModel(local_6, local_162, local_38);
                    }
                }
            }
            if (local_6.bMonsterHPBar)
            {
                Get local_298;
                const FCS_PVXMonsterHPDisplay& local_300 = local_298.opCall();
                if (local_300)
                {
                    FCommissionTargetProgress local_302;
                    local_302.SetSuccessProgressValue(local_300.GetHPPercent());
                    int local_303 = 0;
                    for (; local_303 < this.GetTargetModels().Num(); ++local_303)
                    {
                        FEUIModelContainer::RequireModel(this.GetModify_TargetModels()[local_303]);
                        if (local_134.GetSingleObjectiveConfig().IsSet() && (0 == 2))
                        {
                            local_134.SetProgress(local_302);
                        }
                    }
                }
            }
        }
        return;
    }
    EObjectiveItemUIState ConvertSubTargetStatusToUIState(const ECommissionSubTargetStatus InStatus)
    {
        if (int(InStatus) == 0)
        {
            return EObjectiveItemUIState(0);
        }
        if (int(InStatus) == 1)
        {
            return EObjectiveItemUIState(1);
        }
        if (int(InStatus) == 2)
        {
            return EObjectiveItemUIState(2);
        }
        return EObjectiveItemUIState(0);
    }
    void FillCommissionSubObjectiveModels()
    {
        bool local_7 = false;
        int local_57 = 0;
        TDataObjectPtr<FObjectiveSingleConfig> local_112;
        FEUIModelContainer::MakeCached local_162;
        int local_182 = 0;
        int local_253 = 0;
        Get local_4;
        const FCS_CommissionSubTarget& local_6 = local_4.opCall();
        if (local_6)
        {
            TDataObjectPtr<FObjectiveConfig> local_32 = local_6.GetSubTargetConfig();
            if (local_32)
            {
                if (local_32)
                {
                    int local_58 = local_57;
                    if (local_58 == 0)
                    {
                        TDataObjectPtr<FObjectiveSingleConfig> local_88;
                        CastTo local_64;
                        local_88 = local_64.opCall();
                        local_7 = !local_7;
                        if (local_7)
                        {
                            FCommissionObjItemModelData local_146;
                            local_7 = true;
                            local_146.SubObj = local_7;
                            local_146.UIState = this.ConvertSubTargetStatusToUIState(local_6.GetStatus());
                            local_146.SingleObjectiveConfig = local_88;
                            this.GetModify_TargetModels().Add(local_162.opImplConv());
                            FEUIModelContainer::RequireModel(this.GetModify_TargetModels().Last(0));
                            local_182.GetModify_Progress().SetSuccessProgressValue(local_6.GetProgress().GetSuccessProgressValue());
                            local_58 = local_6.GetProgress().GetFailedProgressValue();
                            local_182.GetModify_Progress().SetFailedProgressValue(local_58);
                        }
                        return;
                    }
                    CastTo local_186;
                    TDataObjectPtr<FObjectiveGroupConfig> local_210 = local_186.opCall();
                    for (auto& local_248 : GetChildObjectives())
                    {
                        local_248;
                        CastTo local_252;
                        local_112 = local_252.opCall();
                        if (local_7)
                        {
                            continue;
                        }
                        int local_59 = local_253;
                        if (local_59 == 2)
                        {
                            local_7 = !local_7;
                            if (local_7)
                            {
                                continue;
                            }
                            local_7 = GetFinishCondition().IsSet() && ((local_59 >= ::ConditionUtils::GetTargetValue(GetFinishCondition())));
                            if (local_7)
                            {
                                continue;
                            }
                        }
                        if (local_6.GetChildProgress().Contains(unresolved.DataId))
                        {
                            FCommissionObjItemModelData local_146;
                            local_146.SubObj = true;
                            local_146.UIState = this.ConvertSubTargetStatusToUIState(local_6.GetStatus());
                            local_146.SingleObjectiveConfig = local_112;
                            this.GetModify_TargetModels().Add(local_162.opImplConv());
                            FEUIModelContainer::RequireModel(this.GetModify_TargetModels().Last(0));
                            local_182.GetModify_Progress().SetSuccessProgressValue(local_58);
                            local_182.GetModify_Progress().SetFailedProgressValue(local_59);
                            continue;
                        }
                        if (local_253 != 2)
                        {
                            FString local_260 = FString();
                        }
                    }
                }
            }
        }
        return;
    }
    void FillMainTaskObjectiveModels(const TDataObjectPtr<FMissionConfig> &inout TrackingMission)
    {
        int local_5 = 0;
        FMissionObjectiveInfo local_268;
        int local_392 = 0;
        this.GetModify_TargetModels().Empty(0);
        this.CommissionDbg_LogState("FillMainTaskObjectiveModels:cleared", 2);
        int local_4 = TrackingMission ? local_5 : 0;
        if (local_4 == 0)
        {
            return;
        }
        FMissionDetail local_118;
        if (!(::MissionUtils::TryFindMissionDetail(this.GetContext().GetLocalPlayer(), local_4, local_118, false)))
        {
            return;
        }
        TArray<uint> local_128;
        CastTo local_198;
        for (auto& local_146 : local_118.GetActiveObjectiveStatusMap())
        {
            local_146;
            ::ObjectiveUtils::FindObjectiveConfig(GetObjectiveId());
            if (local_198.opCall())
            {
                if (0 == 2)
                {
                    for (auto& local_262 : GetChildObjectives())
                    {
                        local_262;
                    }
                }
            }
        }
        for (auto& local_146 : local_118.GetActiveObjectiveStatusMap())
        {
            local_146;
            bool local_3 = !(::ObjectiveUtils::FindObjectiveConfig(local_268.GetObjectiveId()));
            if (local_3)
            {
                continue;
            }
            CastTo local_296;
            TDataObjectPtr<FObjectiveSingleConfig> local_320 = local_296.opCall();
            if (!(local_320))
            {
                continue;
            }
            if (local_3)
            {
                continue;
            }
            if (local_128.Contains(unresolved.DataId))
            {
                if (int(local_268.GetObjectiveStatus()) != 1)
                {
                    continue;
                }
            }
            FCommissionObjItemModelData local_356;
            local_356.SubObj = false;
            local_356.UIState = ::ObjectiveUtils::ConvertObjectiveStatusToUIState(EObjectiveStatus(local_268.GetObjectiveStatus()));
            local_356.SingleObjectiveConfig = local_320;
            FEUIModelContainer::MakeCached local_372;
            this.GetModify_TargetModels().Add(local_372.opImplConv());
            FEUIModelContainer::RequireModel(this.GetModify_TargetModels().Last(0));
            local_392.GetModify_Progress().SetSuccessProgressValue(local_268.GetFinishProgressValue());
            local_392.GetModify_Progress().SetFailedProgressValue(local_268.GetFailProgressValue());
        }
        return;
    }
    uint64 MakeItemKey(FEUIModelContainer &inout Container)
    {
        int local_6 = 0;
        int local_10 = 0;
        FEUIModelContainer::RequireModel(Container);
        int local_9 = local_6.GetSingleObjectiveConfig().IsSet() ? local_10 : 0;
        int64 local_12 = local_9;
        local_10 = 1;
        local_12 = local_12 << local_10;
        local_12 = local_12 | local_6.GetSubObj() ? 1 : 0;
        return local_12;
    }
    int FindKeyIndex(const TArray<uint64> &inout Keys, const uint64 Key)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    bool KeysEqual(const TArray<uint64> &inout A, const TArray<uint64> &inout B)
    {
        if (A.Num() != B.Num())
        {
            return false;
        }
        int local_4 = 0;
        for (; local_4 < A.Num(); ++local_4)
        {
            if (A[local_4] != B[local_4])
            {
                return false;
            }
        }
        return true;
    }
    void BuildViewKeyOrderMainBeforeSub(TArray<uint64> &inout OutKeys)
    {
        OutKeys.Empty(0);
        int local_2 = 0;
        for (; local_2 < this.GetTargetModels().Num(); ++local_2)
        {
            if (!(FEUIModelContainer::RequireModel(this.GetModify_TargetModels()[local_2]).opCall().GetSubObj()))
            {
                OutKeys.Add(this.MakeItemKey(this.GetModify_TargetModels()[local_2]));
            }
        }
        int local_2_2 = 0;
        for (; local_2_2 < this.GetTargetModels().Num(); ++local_2_2)
        {
            bool local_4 = FEUIModelContainer::RequireModel(this.GetModify_TargetModels()[local_2_2]).opCall().GetSubObj();
            if (local_4)
            {
                OutKeys.Add(this.MakeItemKey(this.GetModify_TargetModels()[local_2_2]));
            }
        }
        return;
    }
    int FindTargetModelIndexForKey(const uint64 Key)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    int GetViewInsertIndexForNewKey(const TArray<uint64> &inout ViewOrderKeys, const uint64 AddKey)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    void SyncViewTargetModels()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void StartDisappearingTransition()
    {
        this.SetTransitionPhase(ECommissionViewTransitionPhase(1));
        this.ClearTimer(this.GetModify_TransitionTimer());
        this.ScheduleCall(this.GetModify_TransitionTimer(), n"FinishDisappearingTransition", this.GetDisappearDuration());
        return;
    }
    void StartAppearingTransition()
    {
        this.SetTransitionPhase(ECommissionViewTransitionPhase(2));
        this.ClearTimer(this.GetModify_TransitionTimer());
        this.ScheduleCall(this.GetModify_TransitionTimer(), n"FinishAppearingTransition", this.GetAppearDuration());
        return;
    }
    void FinishDisappearingTransition()
    {
        if ((int(this.GetTransitionPhase())) != 1)
        {
            return;
        }
        int local_5 = 0;
        int local_7 = this.GetViewTargetKeys().Num() - 1;
        for (; local_7 >= 0; --local_7)
        {
            if ((int(FEUIModelContainer::RequireModel(this.GetModify_ViewTargetModels()[local_7]).opCall().GetAnimState())) == 2)
            {
                this.GetModify_ViewTargetModels().RemoveAt(local_7);
                this.GetModify_ViewTargetKeys().RemoveAt(local_7);
                ++local_5;
            }
        }
        if (local_5 > 0)
        {
            this.CommissionDbg_LogState(FString().Append("FinishDisappearingTransition removed=").Append(local_5), 1);
        }
        this.SetTransitionPhase(ECommissionViewTransitionPhase(ECommissionViewTransitionPhase(0)));
        this.SyncViewTargetModels();
        return;
    }
    void FinishAppearingTransition()
    {
        if ((int(this.GetTransitionPhase())) != 2)
        {
            return;
        }
        this.SetAllViewAnimState(ECommissionObjAnimState(0));
        this.SetTransitionPhase(ECommissionViewTransitionPhase(ECommissionViewTransitionPhase(0)));
        this.CommissionDbg_LogState("FinishAppearingTransition -> Normal & Phase None", 1);
        this.SyncViewTargetModels();
        return;
    }
    void UpdateKeptItemsData(const TArray<uint64> &inout NewKeys)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void UpdateViewDataDuringTransition()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void SetAllViewAnimState(const ECommissionObjAnimState State)
    {
        int local_1 = 0;
        for (; local_1 < this.GetViewTargetModels().Num(); )
        {
            FEUIModelContainer::RequireModel(this.GetModify_ViewTargetModels()[local_1]).opCall().SetAnimState();
            ++local_1;
        }
        return;
    }
    void ApplyPendingAddModels()
    {
        TArray<uint64> local_4;
        int local_18 = 0;
        int local_20;
        int local_21 = 0;
        this.BuildViewKeyOrderMainBeforeSub(local_4);
        int local_6 = this.GetPendingAddModels().Num();
        int local_7 = 0;
        for (; local_7 < this.GetPendingAddModels().Num(); )
        {
            const FEUIModelContainer& local_12 = this.GetPendingAddModels()[local_7];
            FEUIModelContainer::RequireModel(local_12);
            local_20 = local_18.GetSingleObjectiveConfig().IsSet() ? local_21 : 0;
            int64 local_26 = local_20;
            local_21 = 1;
            local_26 = local_26 << local_21;
            local_26 = local_26 | local_18.GetSubObj() ? 1 : 0;
            int local_27 = this.GetViewInsertIndexForNewKey(local_4, local_26);
            this.GetModify_ViewTargetModels().Insert(local_12, local_27);
            this.GetModify_ViewTargetKeys().Insert(local_26, local_27);
            FEUIModelContainer::RequireModel(this.GetModify_ViewTargetModels()[local_27]).opCall().SetAnimState(ECommissionObjAnimState(1));
            ++local_7;
        }
        this.GetModify_PendingAddModels().Empty(0);
        this.CommissionDbg_LogState(FString().Append("ApplyPendingAddModels count=").Append(local_6), 1);
        return;
    }
    int GetNop() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Nop;
    }
    void SetNop(const int __Value) property
    {
        if (this.m_Nop == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Nop = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetTargetModels() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_TargetModels() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTargetModels(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TargetModels = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetViewTargetModels() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_ViewTargetModels() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetViewTargetModels(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ViewTargetModels = __Value;
        return;
    }
    TEUIModelRef<FVM_MissionInfoTitle> GetTitleModel() const property
    {
        this.TrackPropertyRead(3);
        return this.m_TitleModel;
    }
    void SetTitleModel(const TEUIModelRef<FVM_MissionInfoTitle> &inout __Value) property
    {
        TEUIModelRef<FVM_MissionInfoTitle> local_2;
        local_2 = this.m_TitleModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TitleModel = __Value;
        return;
    }
    TEUIModelRef<FMS_LevelInfo> GetLevelInfo() const property
    {
        this.TrackPropertyRead(4);
        return this.m_LevelInfo;
    }
    void SetLevelInfo(const TEUIModelRef<FMS_LevelInfo> &inout __Value) property
    {
        TEUIModelRef<FMS_LevelInfo> local_2;
        local_2 = this.m_LevelInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_LevelInfo = __Value;
        return;
    }
    TEUIModelRef<FMS_ClientCondition> GetClientCondition() const property
    {
        this.TrackPropertyRead(5);
        return this.m_ClientCondition;
    }
    void SetClientCondition(const TEUIModelRef<FMS_ClientCondition> &inout __Value) property
    {
        TEUIModelRef<FMS_ClientCondition> local_2;
        local_2 = this.m_ClientCondition;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ClientCondition = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetPendingAddModels() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_PendingAddModels() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetPendingAddModels(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_PendingAddModels = __Value;
        return;
    }
    const TArray<uint64> GetViewTargetKeys() const property
    {
        const TArray<uint64> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<uint64> GetModify_ViewTargetKeys() property
    {
        TArray<uint64> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetViewTargetKeys(const TArray<uint64> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ViewTargetKeys = __Value;
        return;
    }
    ECommissionViewTransitionPhase GetTransitionPhase() const property
    {
        this.TrackPropertyRead(8);
        return this.m_TransitionPhase;
    }
    void SetTransitionPhase(const ECommissionViewTransitionPhase __Value) property
    {
        if (int(this.m_TransitionPhase) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_TransitionPhase = __Value;
        return;
    }
    const float32 GetDisappearDuration() const property
    {
        const float32 __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    float32 GetModify_DisappearDuration() property
    {
        float32 __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetDisappearDuration(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_DisappearDuration = __Value;
        return;
    }
    const float32 GetAppearDuration() const property
    {
        const float32 __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    float32 GetModify_AppearDuration() property
    {
        float32 __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetAppearDuration(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_AppearDuration = __Value;
        return;
    }
    const FMW_CounterDown GetCommissionCounterDown() const property
    {
        const FMW_CounterDown __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FMW_CounterDown GetModify_CommissionCounterDown() property
    {
        FMW_CounterDown __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetCommissionCounterDown(const FMW_CounterDown &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_CommissionCounterDown = __Value;
        return;
    }
    const FFPTime GetCachedCommissionTimeoutTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FFPTime GetModify_CachedCommissionTimeoutTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetCachedCommissionTimeoutTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_CachedCommissionTimeoutTime = __Value;
        return;
    }
    const FEUITimerHandle GetTransitionTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FEUITimerHandle GetModify_TransitionTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetTransitionTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_TransitionTimer = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_Commission
{
    UPROPERTY()
    bool HasCommission;
    UPROPERTY()
    bool ShouldDisplay;
    UPROPERTY()
    FText CommissionOnGoingTitle;
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> CommissionConfig;
    UPROPERTY()
    TDataObjectPtr<FCommissionTypeConfig> CommissionTypeConfig;
    UPROPERTY()
    FTimespan CommissionRemainingTime;
    UPROPERTY()
    FText CommissionRemainingTimeText;
    UPROPERTY()
    bool HasTimeLimit;
    UPROPERTY()
    TEUIModelRef<FVMS_Commission> Self;


}

namespace FVMS_Commission
{
FVMS_Commission& Get(const UObject ContextObject)
{
    return FVMS_Commission::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_Commission GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_Commission __r;
    TEUIModelRef<FVMS_Commission> local_6 = TEUIModelRef<FVMS_Commission>(EUIInternal::MakeModelWithManager(Manager, FVMS_Commission::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ViewTargetModels";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TitleModel";
    local_14.TypeName = "TEUIModelRef<FVM_MissionInfoTitle>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasCommission";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldDisplay";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionOnGoingTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionConfig";
    local_14.TypeName = "TDataObjectPtr<FCommissionConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionTypeConfig";
    local_14.TypeName = "TDataObjectPtr<FCommissionTypeConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionRemainingTime";
    local_14.TypeName = "FTimespan";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CommissionRemainingTimeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasTimeLimit";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_Commission>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_Commission;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("CommissionCounterDown");
    int local_2_2 = FVMS_Commission::__IndexOf_CommissionCounterDown();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "RefreshTargetModels";
    Result.EffectFunctions.Add(local_26);
    FEUIModelMonitorDefine local_36;
    local_36.FunctionName = "__MonitorCommissionInfo";
    local_36.ComponentType = FCS_CommissionInfo;
    Result.MonitorFunctions.Add(local_36);
    local_36.FunctionName = "__MonitorCommissionFinish";
    local_36.ComponentType = FCS_CommissionFinish;
    Result.MonitorFunctions.Add(local_36);
    local_36.FunctionName = "__MonitorCommissionSubTarget";
    local_36.ComponentType = FCS_CommissionSubTarget;
    Result.MonitorFunctions.Add(local_36);
    local_36.FunctionName = "__MonitorPVXPhaseState";
    local_36.ComponentType = FCS_PVXPhaseState;
    Result.MonitorFunctions.Add(local_36);
    local_36.FunctionName = "__MonitorPVXMonsterHPDisplay";
    local_36.ComponentType = FCS_PVXMonsterHPDisplay;
    Result.MonitorFunctions.Add(local_36);
    local_36.FunctionName = "__MonitorPlayerMissionInfo";
    local_36.ComponentType = FC_PlayerMissionInfo;
    Result.MonitorFunctions.Add(local_36);
    local_36.FunctionName = "__MonitorTrackingMission";
    local_36.ComponentType = FC_TrackingMission;
    Result.MonitorFunctions.Add(local_36);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_Commission;
}
void __MonitorCommissionInfo(FVMS_Commission &inout Model, const FECSEntity &inout Entity, const FCS_CommissionInfo &inout Component)
{
    Get local_4;
    Model.MonitorCommissionInfo(local_4.opCall());
    return;
}
void __MonitorCommissionFinish(FVMS_Commission &inout Model, const FECSEntity &inout Entity, const FCS_CommissionFinish &inout Component)
{
    Get local_4;
    Model.MonitorCommissionFinish(local_4.opCall());
    return;
}
void __MonitorCommissionSubTarget(FVMS_Commission &inout Model, const FECSEntity &inout Entity, const FCS_CommissionSubTarget &inout Component)
{
    Get local_4;
    Model.MonitorCommissionSubTarget(local_4.opCall());
    return;
}
void __MonitorPVXPhaseState(FVMS_Commission &inout Model, const FECSEntity &inout Entity, const FCS_PVXPhaseState &inout Component)
{
    Get local_4;
    Model.MonitorPVXPhaseState(local_4.opCall());
    return;
}
void __MonitorPVXMonsterHPDisplay(FVMS_Commission &inout Model, const FECSEntity &inout Entity, const FCS_PVXMonsterHPDisplay &inout Component)
{
    Get local_4;
    Model.MonitorPVXMonsterHPDisplay(local_4.opCall());
    return;
}
void __MonitorPlayerMissionInfo(FVMS_Commission &inout Model, const FECSEntity &inout Entity, const FC_PlayerMissionInfo &inout Component)
{
    Model.MonitorPlayerMissionInfo(Component);
    return;
}
void __MonitorTrackingMission(FVMS_Commission &inout Model, const FECSEntity &inout Entity, const FC_TrackingMission &inout Component)
{
    Model.MonitorTrackingMission(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TArray<FEUIModelContainer> __UIGetter_ViewTargetModels(const FVMS_Commission &inout Model)
{
    return Model.GetViewTargetModels();
}
TEUIModelRef<FVM_MissionInfoTitle> __UIGetter_TitleModel(const FVMS_Commission &inout Model)
{
    return Model.GetTitleModel();
}
bool __UIGetter_HasCommission(const FVMS_Commission &inout Model)
{
    return Model.HasCommission();
}
bool __UIGetter_ShouldDisplay(const FVMS_Commission &inout Model)
{
    return Model.ShouldDisplay();
}
FText __UIGetter_CommissionOnGoingTitle(const FVMS_Commission &inout Model)
{
    return Model.CommissionOnGoingTitle();
}
TDataObjectPtr<FCommissionConfig> __UIGetter_CommissionConfig(const FVMS_Commission &inout Model)
{
    return Model.GetCommissionConfig();
}
TDataObjectPtr<FCommissionTypeConfig> __UIGetter_CommissionTypeConfig(const FVMS_Commission &inout Model)
{
    return Model.GetCommissionTypeConfig();
}
FTimespan __UIGetter_CommissionRemainingTime(const FVMS_Commission &inout Model)
{
    return Model.GetCommissionRemainingTime();
}
FText __UIGetter_CommissionRemainingTimeText(const FVMS_Commission &inout Model)
{
    return Model.GetCommissionRemainingTimeText();
}
bool __UIGetter_HasTimeLimit(const FVMS_Commission &inout Model)
{
    return Model.HasTimeLimit();
}
TEUIModelRef<FVMS_Commission> __UIGetter_Self(const FVMS_Commission &inout Model)
{
    return TEUIModelRef<FVMS_Commission>(Model);
}
int __IndexOf_Nop()
{
    return 0;
}
int __IndexOf_TargetModels()
{
    return 1;
}
int __IndexOf_ViewTargetModels()
{
    return 2;
}
int __IndexOf_TitleModel()
{
    return 3;
}
int __IndexOf_LevelInfo()
{
    return 4;
}
int __IndexOf_ClientCondition()
{
    return 5;
}
int __IndexOf_PendingAddModels()
{
    return 6;
}
int __IndexOf_ViewTargetKeys()
{
    return 7;
}
int __IndexOf_TransitionPhase()
{
    return 8;
}
int __IndexOf_DisappearDuration()
{
    return 9;
}
int __IndexOf_AppearDuration()
{
    return 10;
}
int __IndexOf_CommissionCounterDown()
{
    return 11;
}
int __IndexOf_CachedCommissionTimeoutTime()
{
    return 12;
}
int __IndexOf_TransitionTimer()
{
    return 13;
}
}
namespace __GeneratedProperties_FVMS_Commission
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

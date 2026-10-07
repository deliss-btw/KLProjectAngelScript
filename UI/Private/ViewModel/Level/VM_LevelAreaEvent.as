
enum EShowInfoType
{
    None,
    LevelEvent,
    UnActiveLevelEvent,
    SideMission,
}

namespace FVMS_LevelAreaEvent
{
    const int ModelId = 0;

}
struct FVMS_LevelAreaEvent : FEUIViewModelSingleton
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
    FECSEntity m_LevelEventTargetEntity;
    UPROPERTY()
    EShowInfoType m_CurrentUIType;
    UPROPERTY()
    TArray<FEUIModelContainer> m_PendingAddModels;
    UPROPERTY()
    TArray<uint64> m_ViewTargetKeys;
    UPROPERTY()
    ECommissionViewTransitionPhase m_TransitionPhase;
    UPROPERTY()
    FEUITimerHandle m_TransitionTimer;
    UPROPERTY()
    float32 m_DisappearDuration;
    UPROPERTY()
    float32 m_AppearDuration;

    FVMS_LevelAreaEvent()
    {
        this.m_Nop = 0;
        this.m_CurrentUIType = EShowInfoType(0);
        this.m_TransitionPhase = ECommissionViewTransitionPhase(0);
        this.m_DisappearDuration = 0.3f;
        this.m_AppearDuration = 1.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_LevelAreaEvent(const FVMS_LevelAreaEvent &inout Other)
    {
        this.m_Nop = 0;
        this.m_CurrentUIType = EShowInfoType(0);
        this.m_TransitionPhase = ECommissionViewTransitionPhase(0);
        this.m_DisappearDuration = 0.3f;
        this.m_AppearDuration = 1.0f;
        this.m_Nop = int(Other.m_Nop);
        this.m_TargetModels = Other.m_TargetModels;
        this.m_ViewTargetModels = Other.m_ViewTargetModels;
        this.m_TitleModel = Other.m_TitleModel;
        this.m_LevelEventTargetEntity = Other.m_LevelEventTargetEntity;
        this.m_CurrentUIType = Other.m_CurrentUIType;
        this.m_PendingAddModels = Other.m_PendingAddModels;
        this.m_ViewTargetKeys = Other.m_ViewTargetKeys;
        this.m_TransitionPhase = Other.m_TransitionPhase;
        this.m_TransitionTimer = Other.m_TransitionTimer;
        this.m_DisappearDuration = Other.m_DisappearDuration;
        this.m_AppearDuration = Other.m_AppearDuration;
        return;
    }
    FVMS_LevelAreaEvent opAssign(const FVMS_LevelAreaEvent &inout Other)
    {
        FVMS_LevelAreaEvent __r;
        this.m_Nop = int(Other.m_Nop);
        this.m_TargetModels = Other.m_TargetModels;
        this.m_ViewTargetModels = Other.m_ViewTargetModels;
        this.m_TitleModel = Other.m_TitleModel;
        this.m_LevelEventTargetEntity = Other.m_LevelEventTargetEntity;
        this.m_CurrentUIType = Other.m_CurrentUIType;
        this.m_PendingAddModels = Other.m_PendingAddModels;
        this.m_ViewTargetKeys = Other.m_ViewTargetKeys;
        this.m_TransitionPhase = Other.m_TransitionPhase;
        this.m_TransitionTimer = Other.m_TransitionTimer;
        this.m_DisappearDuration = Other.m_DisappearDuration;
        this.m_AppearDuration = Other.m_AppearDuration;
        return __r;
    }
    bool HasEvent() const
    {
        return this.HasUnActiveLevelEvent() || this.HasLevelEvent() || this.HasTrackingSideMission();
    }
    TDataObjectPtr<FLevelEventInfoConfigBase> GetEventInfoConfig() const
    {
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        Get local_8;
        if (local_8.opCall())
        {
            CastTo local_22;
            Get local_16;
            if (local_16.opCall())
            {
                return local_22.opCall();
            }
        }
        FECSEntity local_4_2 = this.GetContext().GetLocalPlayer();
        Get local_74;
        if (local_74.opCall())
        {
            CastTo local_22;
            Get local_16;
            if (local_16.opCall())
            {
                return local_22.opCall();
            }
        }
        return TDataObjectPtr<FLevelEventInfoConfigBase>();
    }
    FText GetEventTargetProgressText() const
    {
        return FText();
    }
    void PostConstruct()
    {
        TEUIModelRef<FVM_MissionInfoTitle> local_52 = TEUIModelRef<FVM_MissionInfoTitle>(::FVM_MissionInfoTitle::Create(this.GetContext().Manager, FText::FromString(""), false, FSoftBrush(), false));
        this.SetTitleModel(local_52);
        this.SetCurrentUIType(EShowInfoType(0));
        TEUIModelRef<FVM_MissionInfoTitle> local_52_2 = this.GetTitleModel();
        if (local_52_2.IsValid())
        {
            FText local_48 = FText::FromString("");
            TEUIModelRef<FVM_MissionInfoTitle> local_52_3 = this.GetTitleModel();
            local_48.SetTitle();
        }
        if (this.GetModify_TargetModels().Num() > 0)
        {
            this.GetModify_TargetModels().Empty(0);
        }
        if (this.GetModify_ViewTargetModels().Num() > 0)
        {
            this.GetModify_ViewTargetModels().Empty(0);
        }
        this.SetTransitionPhase(ECommissionViewTransitionPhase(0));
        this.UpdateUIType();
        this.SyncViewTargetModels();
        return;
    }
    int LevelAreaEventDbg_Level() const
    {
        return UICommonUtil::CVar_UI_DebugCommissionTargetModels.GetInt();
    }
    uint64 LevelAreaEventDbg_ItemKey(FEUIModelContainer &inout C)
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
    FString LevelAreaEventDbg_FormatVmLine(const FString &inout Prefix, const int Idx, FEUIModelContainer &inout C)
    {
        int local_6 = 0;
        int local_14 = 0;
        FEUIModelContainer::RequireModel(C);
        int local_10 = this.LevelAreaEventDbg_ItemKey(C);
        int local_13 = local_6.GetSingleObjectiveConfig().IsSet() ? local_14 : 0;
        int local_24 = local_6.GetProgress().GetFailedProgressValue();
        int local_23 = local_6.GetProgress().GetSuccessProgressValue();
        int local_22 = int(local_6.GetUIState());
        int local_20 = int(local_6.GetAnimState());
        return FString().Append(Prefix).Append("[").Append(Idx).Append("] k=").Append(local_10).Append(" id=").Append(local_13).Append(" sub=").Append(local_6.GetSubObj()).Append(" anim=").Append(local_20).Append(" ui=").Append(local_22).Append(" ok=").Append(local_23).Append(" fail=").Append(local_24);
    }
    void LevelAreaEventDbg_LogState(const FString &inout Where, const int MinLevel = 1)
    {
        if (this.LevelAreaEventDbg_Level() < MinLevel)
        {
            return;
        }
        FString local_6 = FString().Append("[FVMS_LevelAreaEvent] ").Append(Where).Append(" | phase=").Append(int(this.GetTransitionPhase())).Append(" T=").Append(this.GetTargetModels().Num()).Append(" V=").Append(this.GetViewTargetModels().Num()).Append(" vk=").Append(this.GetViewTargetKeys().Num()).Append(" pend=").Append(this.GetPendingAddModels().Num()).Append(" uiType=").Append(int(this.GetCurrentUIType()));
        int local_18 = 0;
        for (; local_18 < this.GetViewTargetKeys().Num(); )
        {
            local_6 += FString().Append(" vk[").Append(local_18).Append("]=").Append(this.GetViewTargetKeys()[local_18]);
            ++local_18;
        }
        int local_18_2 = 0;
        for (; local_18_2 < this.GetTargetModels().Num(); )
        {
            FString local_26 = (FString(" | ") + this.LevelAreaEventDbg_FormatVmLine("T", local_18_2, this.GetModify_TargetModels()[local_18_2]));
            local_6 += local_26;
            ++local_18_2;
        }
        int local_18_3 = 0;
        for (; local_18_3 < this.GetViewTargetModels().Num(); )
        {
            FString local_10 = (FString(" | ") + this.LevelAreaEventDbg_FormatVmLine("V", local_18_3, this.GetModify_ViewTargetModels()[local_18_3]));
            local_6 += local_10;
            ++local_18_3;
        }
        XLog(ELog(16), local_6);
        return;
    }
    bool UpdateUIType()
    {
        int local_1 = EShowInfoType(0);
        if (this.HasLevelEvent())
        {
            local_1 = EShowInfoType(1);
        }
        else
        {
            if (this.HasUnActiveLevelEvent())
            {
                local_1 = EShowInfoType(2);
            }
            else
            {
                if (this.HasTrackingSideMission())
                {
                    local_1 = EShowInfoType(3);
                }
            }
        }
        if (int(this.GetCurrentUIType()) == local_1)
        {
            return false;
        }
        this.SetCurrentUIType(EShowInfoType(local_1));
        if (local_1 == 1)
        {
            this.UpdateLevelEvent();
        }
        else
        {
            if (local_1 == 2)
            {
                this.UpdateUnActiveLevelEvent();
            }
            else
            {
                if (local_1 == 3)
                {
                    this.UpdateTrackingSideMission();
                }
                else
                {
                    if (this.GetTitleModel().IsValid())
                    {
                        TEUIModelRef<FVM_MissionInfoTitle> local_8 = this.GetTitleModel();
                        FText::FromString("").SetTitle();
                    }
                    if (this.GetModify_TargetModels().Num() > 0)
                    {
                        this.GetModify_TargetModels().Empty(0);
                        this.LevelAreaEventDbg_LogState("UpdateUIType:clear_targets (no event type)", 1);
                    }
                }
            }
        }
        this.SyncViewTargetModels();
        return true;
    }
    void Monitor_OnLevelAreaEventInfo(const FC_PlayerLevelAreaEventInfo &inout C_PlayerLevelAreaEventInfo)
    {
        bool local_2 = this.UpdateUIType();
        if (this.HasLevelEvent())
        {
            if (C_PlayerLevelAreaEventInfo)
            {
                this.SetLevelEventTargetEntity(C_PlayerLevelAreaEventInfo.GetLevelScriptEntity());
                if (!(local_2))
                {
                    this.UpdateLevelEvent();
                    this.SyncViewTargetModels();
                }
            }
            else
            {
                this.SetLevelEventTargetEntity(FECSEntity());
                if (this.GetTitleModel().IsValid())
                {
                    TEUIModelRef<FVM_MissionInfoTitle> local_8 = this.GetTitleModel();
                    FText::FromString("").SetTitle();
                }
                this.GetModify_TargetModels().Empty(0);
                this.SyncViewTargetModels();
                return;
            }
            return;
        }
        this.SetLevelEventTargetEntity(FECSEntity());
        return;
    }
    void Monitor_OnLevelEventProgressChange(const FC_AreaEventObjective &inout C_AreaEventObjective)
    {
        bool local_2 = this.UpdateUIType();
        if (this.HasLevelEvent())
        {
            if ((C_AreaEventObjective && !(local_2)))
            {
                this.UpdateLevelEvent();
                this.SyncViewTargetModels();
            }
        }
        return;
    }
    void Monitor_OnUnActiveLevelAreaEventInfoChange(const FC_PlayerUnActiveLevelAreaEventInfo &inout C_UnActiveLevelAreaEventInfo)
    {
        bool local_2 = this.UpdateUIType();
        if (this.HasUnActiveLevelEvent())
        {
            if (C_UnActiveLevelAreaEventInfo)
            {
                this.SetLevelEventTargetEntity(C_UnActiveLevelAreaEventInfo.GetLevelScriptEntity());
                if (!(local_2))
                {
                    this.UpdateUnActiveLevelEvent();
                    this.SyncViewTargetModels();
                }
                return;
            }
            else
            {
                if (this.GetTitleModel().IsValid())
                {
                    TEUIModelRef<FVM_MissionInfoTitle> local_4 = this.GetTitleModel();
                    FText::FromString("").SetTitle();
                }
                this.GetModify_TargetModels().Empty(0);
                this.SyncViewTargetModels();
                return;
            }
        }
        return;
    }
    void Monitor_OnLevelEventStateChange(const FC_LevelPublicEventInfo &inout C_AreaEventObjective)
    {
        bool local_2 = this.UpdateUIType();
        if (this.HasUnActiveLevelEvent())
        {
            if ((C_AreaEventObjective && !(local_2)))
            {
                this.UpdateUnActiveLevelEvent();
                this.SyncViewTargetModels();
            }
        }
        return;
    }
    void Monitor_OnTrackingMission(const FC_TrackingMission &inout C_TrackingMission)
    {
        bool local_2 = this.UpdateUIType();
        if (this.HasTrackingSideMission())
        {
            if (!(::MissionUtils::GetCurrentTrackingMission(this.GetContext().GetLocalPlayer(), EMissionType(1)).IsSet()))
            {
                if (this.GetTitleModel().IsValid())
                {
                    TEUIModelRef<FVM_MissionInfoTitle> local_58 = this.GetTitleModel();
                    FText::FromString("").SetTitle();
                }
                this.GetModify_TargetModels().Empty(0);
                this.SyncViewTargetModels();
                return;
            }
            if ((C_TrackingMission && !(local_2)))
            {
                this.UpdateTrackingSideMission();
                this.SyncViewTargetModels();
            }
        }
        return;
    }
    void Monitor_OnTrackingMission(const FC_PlayerMissionInfo &inout C_MissionInfo)
    {
        bool local_2 = this.UpdateUIType();
        if (this.HasTrackingSideMission())
        {
            if (!(::MissionUtils::GetCurrentTrackingMission(this.GetContext().GetLocalPlayer(), EMissionType(1)).IsSet()))
            {
                if (this.GetTitleModel().IsValid())
                {
                    TEUIModelRef<FVM_MissionInfoTitle> local_58 = this.GetTitleModel();
                    FText::FromString("").SetTitle();
                }
                this.GetModify_TargetModels().Empty(0);
                this.SyncViewTargetModels();
                return;
            }
            if ((C_MissionInfo && !(local_2)))
            {
                this.UpdateTrackingSideMission();
                this.SyncViewTargetModels();
            }
        }
        return;
    }
    bool HasUnActiveLevelEvent() const
    {
        int local_18 = 0;
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        Get local_8;
        if (local_8.opCall())
        {
            if (local_18)
            {
                if ((int(local_18.GetStatus())) == 0 || (int(local_18.GetStatus()) == 1))
                {
                    return true;
                }
            }
        }
        return false;
    }
    bool HasLevelEvent() const
    {
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        Has local_8;
        return local_8.opCall();
    }
    bool HasTrackingSideMission() const
    {
        ELevelType local_1 = ::FLevelUtils::GetCurrentLevelType();
        if ((int(local_1) == 3 || (int(local_1) == 5) || (int(local_1) == 6)))
        {
            return false;
        }
        return ::MissionUtils::GetCurrentTrackingMission(this.GetContext().GetLocalPlayer(), EMissionType(1)).IsSet();
    }
    FText GetEventTitleText() const
    {
        TDataObjectPtr<FLevelEventInfoConfigBase> local_24 = this.GetEventInfoConfig();
        if (local_24)
        {
            if (!(local_24.opArrow().EventTargetTitle.IsEmpty()))
            {
                return local_24.opArrow().EventTargetTitle;
            }
            const TDataObjectPtr<FPresentationConfig>& local_52 = local_24.opArrow().GetPresentationConfig();
            if (local_52)
            {
                return local_52.opArrow().Name;
            }
        }
        return FText();
    }
    FSoftBrush GetEventIcon() const
    {
        TDataObjectPtr<FLevelEventInfoConfigBase> local_24 = this.GetEventInfoConfig();
        if (local_24)
        {
            const TDataObjectPtr<FPresentationConfig>& local_52 = local_24.opArrow().GetPresentationConfig();
            if (local_52)
            {
                return local_52.opArrow().GetDefaultIcon();
            }
            return local_24.opArrow().DisplayIcon;
        }
        return FSoftBrush();
    }
    void UpdateUnActiveLevelEvent()
    {
        bool local_24;
        int local_76 = 0;
        FEUIModelContainer::MakeCached local_128;
        bool local_143 = false;
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        Get local_8;
        if (local_8.opCall())
        {
            FText local_20 = this.GetEventTitleText();
            TEUIModelRef<FVM_MissionInfoTitle> local_22 = this.GetTitleModel();
            if (!(local_22.IsValid()))
            {
                local_24 = true;
            }
            else
            {
                TEUIModelRef<FVM_MissionInfoTitle> local_22_2 = this.GetTitleModel();
                bool local_23 = local_22_2.IsValid();
                if (!(local_23))
                {
                    local_23 = false;
                }
                else
                {
                    TEUIModelRef<FVM_MissionInfoTitle> local_22_3 = this.GetTitleModel();
                    local_23 = !((FText(GetTitle()) == local_20));
                }
                local_24 = local_23;
            }
            if (local_24)
            {
                bool local_11 = true;
                local_24 = false;
                TEUIModelRef<FVM_MissionInfoTitle> local_22_4 = TEUIModelRef<FVM_MissionInfoTitle>(::FVM_MissionInfoTitle::Create(this.GetContext().Manager, local_20, local_24, this.GetEventIcon(), local_11));
                this.SetTitleModel(local_22_4);
            }
            this.GetModify_TargetModels().Empty(0);
            if (local_76)
            {
                if (int(local_76.GetStatus()) == 0)
                {
                    FCommissionObjItemModelData local_112;
                    local_112.UIState = EObjectiveItemUIState(0);
                    local_112.DefaultText = NSLOCTEXT("LevelAreaHUDProgress", "UpdateUnActiveLevelEvent_PrepareToInteract", "з­‰еѕ…й›†з»“д№‹еЌ°еЅўж€ђ");
                    this.GetModify_TargetModels().Add(local_128.opImplConv());
                }
                if (int(local_76.GetStatus()) == 1)
                {
                    FCommissionObjItemModelData local_112;
                    local_112.UIState = EObjectiveItemUIState(0);
                    local_112.DefaultText = NSLOCTEXT("LevelAreaHUDProgress", "UpdateUnActiveLevelEvent_Interact", "дє¤дє’й›†з»“д№‹еЌ°пјЊејЂеђЇдє‹д»¶");
                    this.GetModify_TargetModels().Add(local_128.opImplConv());
                }
                local_143 = false;
                if ((int(local_76.GetStatus())) == 0)
                {
                    local_143 = true;
                    bool local_11_2 = true;
                    TEUIModelRef<FVM_MissionInfoTitle> local_22_5 = this.GetTitleModel();
                    local_11_2.SetbHasTimer();
                    TEUIModelRef<FVM_MissionInfoTitle> local_22_6 = this.GetTitleModel();
                    local_76.GetChangeStatusTime().SetEndTime();
                }
                else
                {
                    local_24 = false;
                    TEUIModelRef<FVM_MissionInfoTitle> local_22_7 = this.GetTitleModel();
                    local_24.SetbHasTimer();
                }
            }
        }
        return;
    }
    void UpdateLevelEvent()
    {
        bool local_38;
        int local_106 = 0;
        int local_107 = 0;
        int local_197;
        int local_198;
        FEUIModelContainer::MakeCached local_236;
        int local_256 = 0;
        TConstRawPtr<FObjectiveProgressData> local_328;
        int local_331 = 0;
        int local_332;
        int local_333;
        if (!(this.GetEventInfoConfig()))
        {
            return;
        }
        FText local_34 = this.GetEventTitleText();
        TEUIModelRef<FVM_MissionInfoTitle> local_36 = this.GetTitleModel();
        bool local_25 = !(local_36.IsValid());
        if (local_25)
        {
            local_38 = true;
        }
        else
        {
            bool local_37;
            TEUIModelRef<FVM_MissionInfoTitle> local_36_2 = this.GetTitleModel();
            local_37 = local_36_2.IsValid();
            if (!(local_37))
            {
                local_37 = false;
            }
            else
            {
                TEUIModelRef<FVM_MissionInfoTitle> local_36_3 = this.GetTitleModel();
                local_37 = !((FText(GetTitle()) == local_34));
            }
            local_38 = local_37;
        }
        if (local_38)
        {
            local_25 = true;
            local_38 = false;
            TEUIModelRef<FVM_MissionInfoTitle> local_36_4 = TEUIModelRef<FVM_MissionInfoTitle>(::FVM_MissionInfoTitle::Create(this.GetContext().Manager, local_34, local_38, this.GetEventIcon(), local_25));
            this.SetTitleModel(local_36_4);
        }
        this.GetModify_TargetModels().Empty(0);
        FECSEntity local_90 = this.GetContext().GetLocalPlayer();
        Get local_94;
        if (local_94.opCall())
        {
            bool local_37;
            Has local_100;
            local_37 = local_100.opCall();
            if (local_37)
            {
                if (local_106.GetCurrentObjective())
                {
                    int local_85 = local_107;
                    if (local_85 == 0)
                    {
                        CastTo local_112;
                        TDataObjectPtr<FObjectiveSingleConfig> local_136 = local_112.opCall();
                        local_37 = !local_37;
                        if (local_37)
                        {
                            local_38 = (int(local_106.GetProgress().GetObjectiveState()) == 2);
                            FCommissionObjItemModelData local_196;
                            if (local_38)
                            {
                                local_197 = 1;
                            }
                            else
                            {
                                local_197 = 0;
                            }
                            local_196.UIState = EObjectiveItemUIState(local_197);
                            local_196.SingleObjectiveConfig = local_112.opCall();
                            this.GetModify_TargetModels().Add(local_236.opImplConv());
                            FEUIModelContainer::RequireModel(this.GetModify_TargetModels().Last(0));
                            local_256.GetModify_Progress().SetSuccessProgressValue(local_106.GetProgress().GetSuccessProgressValue());
                            local_256.GetModify_Progress().SetFailedProgressValue(local_106.GetProgress().GetFailedProgressValue());
                        }
                    }
                    else
                    {
                        CastTo local_260;
                        TDataObjectPtr<FObjectiveGroupConfig> local_284 = local_260.opCall();
                        for (auto& local_322 : GetChildObjectives())
                        {
                            TDataObjectPtr<FObjectiveSingleConfig> local_160;
                            CastTo local_326;
                            local_160 = local_326.opCall();
                            if (local_25)
                            {
                                continue;
                            }
                            local_85 = local_331;
                            if (local_85 == 2)
                            {
                                if (!(local_328))
                                {
                                    continue;
                                }
                                if (int(GetObjectiveState()) == 2)
                                {
                                    continue;
                                }
                            }
                            local_332 = 0;
                            local_333 = 0;
                            local_38 = false;
                            if (local_328)
                            {
                                local_332 = GetSuccessProgressValue();
                                local_333 = GetFailedProgressValue();
                                local_38 = (int(GetObjectiveState()) == 2);
                            }
                            FCommissionObjItemModelData local_196;
                            if (local_38)
                            {
                                local_198 = 1;
                            }
                            else
                            {
                                local_198 = 0;
                            }
                            local_196.UIState = EObjectiveItemUIState(local_198);
                            local_196.SingleObjectiveConfig = local_322;
                            this.GetModify_TargetModels().Add(local_236.opImplConv());
                            FEUIModelContainer::RequireModel(this.GetModify_TargetModels().Last(0));
                            local_256.GetModify_Progress().SetSuccessProgressValue(local_332);
                            local_256.GetModify_Progress().SetFailedProgressValue(local_333);
                        }
                    }
                }
            }
            local_38 = false;
            Get local_338;
            const FC_LevelPublicEventInfo& local_340 = local_338.opCall();
            if (local_340)
            {
                if (int(local_340.GetStatus()) == 2)
                {
                    local_38 = true;
                    local_37 = true;
                    TEUIModelRef<FVM_MissionInfoTitle> local_36_5 = this.GetTitleModel();
                    local_37.SetbHasTimer();
                    TEUIModelRef<FVM_MissionInfoTitle> local_36_6 = this.GetTitleModel();
                    local_340.GetChangeStatusTime().SetEndTime();
                }
            }
        }
        return;
    }
    void UpdateTrackingSideMission()
    {
        bool local_105;
        int local_223 = 0;
        bool local_224 = false;
        FMissionObjectiveInfo local_484;
        int local_608 = 0;
        TDataObjectPtr<FMissionConfig> local_30 = ::MissionUtils::GetCurrentTrackingMission(this.GetContext().GetLocalPlayer(), EMissionType(1));
        if (!(local_30.IsSet()))
        {
            local_105 = false;
            TEUIModelRef<FVM_MissionInfoTitle> local_108 = TEUIModelRef<FVM_MissionInfoTitle>(::FVM_MissionInfoTitle::Create(this.GetContext().Manager, FText::FromString(""), local_105, FSoftBrush(), false));
            this.SetTitleModel(local_108);
            this.GetModify_TargetModels().Empty(0);
            return;
        }
        FMissionDetail local_222;
        if (!(::MissionUtils::TryFindMissionDetail(this.GetContext().GetLocalPlayer(), local_223, local_222, false)))
        {
            FSoftBrush local_100;
            local_105 = false;
            local_100 = FSoftBrush();
            TEUIModelRef<FVM_MissionInfoTitle> local_108_2 = TEUIModelRef<FVM_MissionInfoTitle>(::FVM_MissionInfoTitle::Create(this.GetContext().Manager, FText::FromString(""), false, local_100, local_105));
            this.SetTitleModel(local_108_2);
            this.GetModify_TargetModels().Empty(0);
            return;
        }
        TEUIModelRef<FVM_MissionInfoTitle> local_108_3 = this.GetTitleModel();
        if (!(local_108_3.IsValid()))
        {
            local_224 = true;
        }
        else
        {
            local_108_3 = this.GetTitleModel();
            local_105 = local_108_3.IsValid();
            if (!(local_105))
            {
                local_105 = false;
            }
            else
            {
                local_108_3 = this.GetTitleModel();
                FText local_104 = FText(GetTitle());
                local_224 = !local_224;
                local_105 = local_224;
            }
            local_224 = local_105;
        }
        if (local_224)
        {
            FSoftBrush local_100;
            FSoftBrush local_268;
            TDataObjectPtr<FMissionPhaseConfig> local_292;
            if (::MissionUtils::GetGuidePresentationConfig(local_30, local_292).IsSet())
            {
                local_100.GetGuideIcon();
                local_268 = local_100;
            }
            local_105 = false;
            this.SetTitleModel(local_108_3);
        }
        this.GetModify_TargetModels().Empty(0);
        TArray<uint> local_344;
        CastTo local_414;
        for (auto& local_362 : local_222.GetActiveObjectiveStatusMap())
        {
            local_362;
            ::ObjectiveUtils::FindObjectiveConfig(GetObjectiveId());
            if (local_414.opCall())
            {
                if (0 == 2)
                {
                    for (auto& local_478 : GetChildObjectives())
                    {
                        local_478;
                    }
                }
            }
        }
        for (auto& local_362 : local_222.GetActiveObjectiveStatusMap())
        {
            local_362;
            if (!(::ObjectiveUtils::FindObjectiveConfig(local_484.GetObjectiveId())))
            {
                continue;
            }
            CastTo local_512;
            TDataObjectPtr<FObjectiveSingleConfig> local_536 = local_512.opCall();
            if (!(local_536))
            {
                continue;
            }
            if (local_224)
            {
                continue;
            }
            if (local_344.Contains(unresolved.DataId))
            {
                if (int(local_484.GetObjectiveStatus()) != 1)
                {
                    continue;
                }
            }
            FCommissionObjItemModelData local_572;
            local_572.SubObj = false;
            local_572.UIState = ::ObjectiveUtils::ConvertObjectiveStatusToUIState(EObjectiveStatus(local_484.GetObjectiveStatus()));
            local_572.SingleObjectiveConfig = local_536;
            FEUIModelContainer::MakeCached local_588;
            this.GetModify_TargetModels().Add(local_588.opImplConv());
            FEUIModelContainer::RequireModel(this.GetModify_TargetModels().Last(0));
            local_608.GetModify_Progress().SetSuccessProgressValue(local_484.GetFinishProgressValue());
            local_608.GetModify_Progress().SetFailedProgressValue(local_484.GetFailProgressValue());
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
        this.ScheduleCall(this.GetModify_TransitionTimer(), n"FinishDisappearingTransition", this.GetDisappearDuration());
        return;
    }
    void StartAppearingTransition()
    {
        this.SetTransitionPhase(ECommissionViewTransitionPhase(2));
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
            this.LevelAreaEventDbg_LogState(FString().Append("FinishDisappearingTransition removed=").Append(local_5), 1);
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
        this.LevelAreaEventDbg_LogState("FinishAppearingTransition -> Normal & Phase None", 1);
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
        this.LevelAreaEventDbg_LogState(FString().Append("ApplyPendingAddModels count=").Append(local_6), 1);
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
    const FECSEntity GetLevelEventTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FECSEntity GetModify_LevelEventTargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetLevelEventTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_LevelEventTargetEntity = __Value;
        return;
    }
    EShowInfoType GetCurrentUIType() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CurrentUIType;
    }
    void SetCurrentUIType(const EShowInfoType __Value) property
    {
        if (int(this.m_CurrentUIType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CurrentUIType = __Value;
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
    const FEUITimerHandle GetTransitionTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FEUITimerHandle GetModify_TransitionTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetTransitionTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_TransitionTimer = __Value;
        return;
    }
    const float32 GetDisappearDuration() const property
    {
        const float32 __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    float32 GetModify_DisappearDuration() property
    {
        float32 __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetDisappearDuration(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_DisappearDuration = __Value;
        return;
    }
    const float32 GetAppearDuration() const property
    {
        const float32 __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    float32 GetModify_AppearDuration() property
    {
        float32 __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetAppearDuration(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_AppearDuration = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_LevelAreaEvent
{
    UPROPERTY()
    bool HasEvent;
    UPROPERTY()
    TDataObjectPtr<FLevelEventInfoConfigBase> EventInfoConfig;
    UPROPERTY()
    FText EventTargetProgressText;
    UPROPERTY()
    TEUIModelRef<FVMS_LevelAreaEvent> Self;


}

namespace FVMS_LevelAreaEvent
{
FVMS_LevelAreaEvent& Get(const UObject ContextObject)
{
    return FVMS_LevelAreaEvent::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_LevelAreaEvent GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_LevelAreaEvent __r;
    TEUIModelRef<FVMS_LevelAreaEvent> local_6 = TEUIModelRef<FVMS_LevelAreaEvent>(EUIInternal::MakeModelWithManager(Manager, FVMS_LevelAreaEvent::ModelId));
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
    local_14.PropertyName = "HasEvent";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EventInfoConfig";
    local_14.TypeName = "TDataObjectPtr<FLevelEventInfoConfigBase>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EventTargetProgressText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_LevelAreaEvent>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_LevelAreaEvent;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__Monitor_OnLevelAreaEventInfo";
    local_26.ComponentType = FC_PlayerLevelAreaEventInfo;
    Result.MonitorFunctions.Add(local_26);
    local_26.FunctionName = "__Monitor_OnLevelEventProgressChange";
    local_26.ComponentType = FC_AreaEventObjective;
    local_26.MonitorPropertyName = FName("LevelEventTargetEntity");
    int local_2_2 = FVMS_LevelAreaEvent::__IndexOf_LevelEventTargetEntity();
    Result.MonitorFunctions.Add(local_26);
    local_26.FunctionName = "__Monitor_OnUnActiveLevelAreaEventInfoChange";
    local_26.ComponentType = FC_PlayerUnActiveLevelAreaEventInfo;
    Result.MonitorFunctions.Add(local_26);
    local_26.FunctionName = "__Monitor_OnLevelEventStateChange";
    local_26.ComponentType = FC_LevelPublicEventInfo;
    local_26.MonitorPropertyName = FName("LevelEventTargetEntity");
    int local_2_3 = FVMS_LevelAreaEvent::__IndexOf_LevelEventTargetEntity();
    Result.MonitorFunctions.Add(local_26);
    local_26.FunctionName = "__Monitor_OnTrackingMission";
    local_26.ComponentType = FC_TrackingMission;
    Result.MonitorFunctions.Add(local_26);
    local_26.FunctionName = "__Monitor_OnTrackingMission";
    local_26.ComponentType = FC_PlayerMissionInfo;
    Result.MonitorFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_LevelAreaEvent;
}
void __Monitor_OnLevelAreaEventInfo(FVMS_LevelAreaEvent &inout Model, const FECSEntity &inout Entity, const FC_PlayerLevelAreaEventInfo &inout Component)
{
    Model.Monitor_OnLevelAreaEventInfo(Component);
    return;
}
void __Monitor_OnLevelEventProgressChange(FVMS_LevelAreaEvent &inout Model, const FECSEntity &inout Entity, const FC_AreaEventObjective &inout Component)
{
    Model.Monitor_OnLevelEventProgressChange(Component);
    return;
}
void __Monitor_OnUnActiveLevelAreaEventInfoChange(FVMS_LevelAreaEvent &inout Model, const FECSEntity &inout Entity, const FC_PlayerUnActiveLevelAreaEventInfo &inout Component)
{
    Model.Monitor_OnUnActiveLevelAreaEventInfoChange(Component);
    return;
}
void __Monitor_OnLevelEventStateChange(FVMS_LevelAreaEvent &inout Model, const FECSEntity &inout Entity, const FC_LevelPublicEventInfo &inout Component)
{
    Model.Monitor_OnLevelEventStateChange(Component);
    return;
}
void __Monitor_OnTrackingMission(FVMS_LevelAreaEvent &inout Model, const FECSEntity &inout Entity, const FC_TrackingMission &inout Component)
{
    Model.Monitor_OnTrackingMission(Component);
    return;
}
void __Monitor_OnTrackingMission(FVMS_LevelAreaEvent &inout Model, const FECSEntity &inout Entity, const FC_PlayerMissionInfo &inout Component)
{
    Model.Monitor_OnTrackingMission(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TArray<FEUIModelContainer> __UIGetter_ViewTargetModels(const FVMS_LevelAreaEvent &inout Model)
{
    return Model.GetViewTargetModels();
}
TEUIModelRef<FVM_MissionInfoTitle> __UIGetter_TitleModel(const FVMS_LevelAreaEvent &inout Model)
{
    return Model.GetTitleModel();
}
bool __UIGetter_HasEvent(const FVMS_LevelAreaEvent &inout Model)
{
    return Model.HasEvent();
}
TDataObjectPtr<FLevelEventInfoConfigBase> __UIGetter_EventInfoConfig(const FVMS_LevelAreaEvent &inout Model)
{
    return Model.GetEventInfoConfig();
}
FText __UIGetter_EventTargetProgressText(const FVMS_LevelAreaEvent &inout Model)
{
    return Model.GetEventTargetProgressText();
}
TEUIModelRef<FVMS_LevelAreaEvent> __UIGetter_Self(const FVMS_LevelAreaEvent &inout Model)
{
    return TEUIModelRef<FVMS_LevelAreaEvent>(Model);
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
int __IndexOf_LevelEventTargetEntity()
{
    return 4;
}
int __IndexOf_CurrentUIType()
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
int __IndexOf_TransitionTimer()
{
    return 9;
}
int __IndexOf_DisappearDuration()
{
    return 10;
}
int __IndexOf_AppearDuration()
{
    return 11;
}
}
namespace __GeneratedProperties_FVMS_LevelAreaEvent
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

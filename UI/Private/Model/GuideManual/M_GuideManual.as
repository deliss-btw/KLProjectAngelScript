
const FConsoleVariable CVar_GuideManual_Suppress = FConsoleVariable();
const FConsoleCommand CCmd_GuideManual_FinishQueue = FConsoleCommand();
const FConsoleCommand CCmd_GuideManual_TriggerGuide = FConsoleCommand();
const FConsoleCommand CCmd_GuideManual_TriggerAllGuides = FConsoleCommand();
namespace FMS_GuideManual
{
    const int ModelId = 0;

}
struct FGuideCondIndexEntry
{
    UPROPERTY()
    uint CondDataId;
    UPROPERTY()
    TDataObjectPtr<FGuideGroupConfig> GuideConfig;


}

struct FGuideConfigList
{
    UPROPERTY()
    TArray<TDataObjectPtr<FGuideGroupConfig>> Guides;

    FGuideConfigList()
    {
        return;
    }
}

struct FMS_GuideManual : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TSet<uint> m_FinishedGuideDataIds;
    UPROPERTY()
    bool m_bDataReady;
    UPROPERTY()
    bool m_bConditionDataReady;
    UPROPERTY()
    TArray<FGuideCondIndexEntry> m_ReverseIndex;
    UPROPERTY()
    TArray<TDataObjectPtr<FGuideGroupConfig>> m_PendingGuideConfigs;
    UPROPERTY()
    FEUIWidgetRef m_TutorialPageWidget;
    UPROPERTY()
    TArray<TDataObjectPtr<FGuideGroupConfig>> m_TutorialQueue;
    UPROPERTY()
    TSet<uint> m_DebugTutorialForceShowDataIds;
    UPROPERTY()
    bool m_bTutorialShowing;
    UPROPERTY()
    uint m_ShowingTutorialDataId;
    UPROPERTY()
    FEUIWidgetRef m_TutorialHintWidget;
    UPROPERTY()
    TEUIModelRef<FVM_TutorialHint> m_TutorialHintVM;
    UPROPERTY()
    TArray<TDataObjectPtr<FGuideGroupConfig>> m_TutorialHintQueue;
    UPROPERTY()
    TSet<uint> m_DebugTutorialHintForceShowDataIds;
    UPROPERTY()
    bool m_bTutorialHintShowing;
    UPROPERTY()
    uint m_ShowingTutorialHintDataId;
    UPROPERTY()
    FEUIWidgetRef m_TutorialHudWidget;
    UPROPERTY()
    TEUIModelRef<FVM_TutorialHud> m_TutorialHudVM;
    UPROPERTY()
    TMap<FGameplayTag, FGuideConfigList> m_ClientTagIndex;
    UPROPERTY()
    TArray<TDataObjectPtr<FGuideGroupConfig>> m_ClientCommissionGuides;
    UPROPERTY()
    TArray<TDataObjectPtr<FGuideGroupConfig>> m_ClientLevelTypeGuides;
    UPROPERTY()
    TArray<TDataObjectPtr<FGuideGroupConfig>> m_ClientInputTypeGuides;
    UPROPERTY()
    TArray<TDataObjectPtr<FGuideGroupConfig>> m_ClientInTeamGuides;

    FMS_GuideManual()
    {
        this.m_bDataReady = false;
        this.m_bConditionDataReady = false;
        this.m_bTutorialShowing = false;
        this.m_ShowingTutorialDataId = 0;
        this.m_bTutorialHintShowing = false;
        this.m_ShowingTutorialHintDataId = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_GuideManual(const FMS_GuideManual &inout Other)
    {
        this.m_bDataReady = false;
        this.m_bConditionDataReady = false;
        this.m_bTutorialShowing = false;
        this.m_ShowingTutorialDataId = 0;
        this.m_bTutorialHintShowing = false;
        this.m_ShowingTutorialHintDataId = 0;
        this.m_FinishedGuideDataIds = Other.m_FinishedGuideDataIds;
        this.m_bDataReady = Other.m_bDataReady;
        this.m_bConditionDataReady = Other.m_bConditionDataReady;
        this.m_ReverseIndex = Other.m_ReverseIndex;
        this.m_PendingGuideConfigs = Other.m_PendingGuideConfigs;
        this.m_TutorialPageWidget = Other.m_TutorialPageWidget;
        this.m_TutorialQueue = Other.m_TutorialQueue;
        this.m_DebugTutorialForceShowDataIds = Other.m_DebugTutorialForceShowDataIds;
        this.m_bTutorialShowing = Other.m_bTutorialShowing;
        this.m_ShowingTutorialDataId = int(Other.m_ShowingTutorialDataId);
        this.m_TutorialHintWidget = Other.m_TutorialHintWidget;
        this.m_TutorialHintVM = Other.m_TutorialHintVM;
        this.m_TutorialHintQueue = Other.m_TutorialHintQueue;
        this.m_DebugTutorialHintForceShowDataIds = Other.m_DebugTutorialHintForceShowDataIds;
        this.m_bTutorialHintShowing = Other.m_bTutorialHintShowing;
        this.m_ShowingTutorialHintDataId = int(Other.m_ShowingTutorialHintDataId);
        this.m_TutorialHudWidget = Other.m_TutorialHudWidget;
        this.m_TutorialHudVM = Other.m_TutorialHudVM;
        this.m_ClientTagIndex = Other.m_ClientTagIndex;
        this.m_ClientCommissionGuides = Other.m_ClientCommissionGuides;
        this.m_ClientLevelTypeGuides = Other.m_ClientLevelTypeGuides;
        this.m_ClientInputTypeGuides = Other.m_ClientInputTypeGuides;
        this.m_ClientInTeamGuides = Other.m_ClientInTeamGuides;
        return;
    }
    FMS_GuideManual& opAssign(const FMS_GuideManual &inout Other)
    {
        this.m_FinishedGuideDataIds = Other.m_FinishedGuideDataIds;
        this.m_bDataReady = Other.m_bDataReady;
        this.m_bConditionDataReady = Other.m_bConditionDataReady;
        this.m_ReverseIndex = Other.m_ReverseIndex;
        this.m_PendingGuideConfigs = Other.m_PendingGuideConfigs;
        this.m_TutorialPageWidget = Other.m_TutorialPageWidget;
        this.m_TutorialQueue = Other.m_TutorialQueue;
        this.m_DebugTutorialForceShowDataIds = Other.m_DebugTutorialForceShowDataIds;
        this.m_bTutorialShowing = Other.m_bTutorialShowing;
        this.m_ShowingTutorialDataId = int(Other.m_ShowingTutorialDataId);
        this.m_TutorialHintWidget = Other.m_TutorialHintWidget;
        this.m_TutorialHintVM = Other.m_TutorialHintVM;
        this.m_TutorialHintQueue = Other.m_TutorialHintQueue;
        this.m_DebugTutorialHintForceShowDataIds = Other.m_DebugTutorialHintForceShowDataIds;
        this.m_bTutorialHintShowing = Other.m_bTutorialHintShowing;
        this.m_ShowingTutorialHintDataId = int(Other.m_ShowingTutorialHintDataId);
        this.m_TutorialHudWidget = Other.m_TutorialHudWidget;
        this.m_TutorialHudVM = Other.m_TutorialHudVM;
        this.m_ClientTagIndex = Other.m_ClientTagIndex;
        this.m_ClientCommissionGuides = Other.m_ClientCommissionGuides;
        this.m_ClientLevelTypeGuides = Other.m_ClientLevelTypeGuides;
        this.m_ClientInputTypeGuides = Other.m_ClientInputTypeGuides;
        return Other.m_ClientInTeamGuides;
    }
    void PostConstruct()
    {
        this.BuildReverseIndex();
        return;
    }
    void BuildReverseIndex()
    {
        this.GetModify_ReverseIndex().Empty(0);
        FMS_Condition& local_6 = ::FMS_Condition::Get(this.GetManager());
        TDataObjectIterator<FGuideGroupConfig> local_22;
        for (; local_22; )
        {
            TDataObjectPtr<FGuideGroupConfig> local_88 = local_22.GetDataPtr();
            TSet<uint> local_108;
            for (auto& local_122 : GetActiveConds())
            {
                local_6.CollectLeafConditionDataIds(local_122, local_108);
            }
            for (auto local_139 : local_108)
            {
                FGuideCondIndexEntry local_166;
                local_166.CondDataId = local_139;
                local_166.GuideConfig = local_88;
                this.GetModify_ReverseIndex().Add(local_166);
            }
            local_22.Next();
        }
        return;
    }
    void RebuildPendingList()
    {
        this.GetModify_PendingGuideConfigs().Empty(0);
        this.GetModify_ClientTagIndex().Empty(0);
        this.GetModify_ClientCommissionGuides().Empty(0);
        this.GetModify_ClientLevelTypeGuides().Empty(0);
        this.GetModify_ClientInputTypeGuides().Empty(0);
        this.GetModify_ClientInTeamGuides().Empty(0);
        TDataObjectIterator<FGuideGroupConfig> local_18;
        for (; local_18; )
        {
            TDataObjectPtr<FGuideGroupConfig> local_84 = local_18.GetDataPtr();
            if (this.GetFinishedGuideDataIds().Contains(unresolved.DataId))
            {
            }
            else
            {
                if (GetActiveConds().Num() == 0 && (0 == 0))
                {
                }
                else
                {
                    this.GetModify_PendingGuideConfigs().Add(local_84);
                    this.IndexClientConditions(local_84);
                }
            }
            local_18.Next();
        }
        return;
    }
    void IndexClientConditions(const TDataObjectPtr<FGuideGroupConfig> &inout Config)
    {
        TArrayConstIterator<FClientConditionGroup> local_6;
        for (; local_6.CanProceed;)
        {
            const FClientConditionGroup& local_16 = local_6.Proceed();
            for (auto& local_30 : local_16.Conditions)
            {
                if (FInstancedStruct::GetPtr(local_30).opCall())
                {
                    FGameplayTag local_40;
                    if (local_40.IsValid())
                    {
                        if (!(this.GetClientTagIndex().Contains(local_40)))
                        {
                            FGuideConfigList local_44;
                            this.GetModify_ClientTagIndex().Add(local_40, local_44);
                        }
                        this.GetModify_ClientTagIndex()[local_40].Guides.Add(Config);
                    }
                    continue;
                }
                if (FInstancedStruct::GetPtr(local_30).opCall())
                {
                    this.GetModify_ClientCommissionGuides().Add(Config);
                    continue;
                }
                if (FInstancedStruct::GetPtr(local_30).opCall())
                {
                    this.GetModify_ClientLevelTypeGuides().Add(Config);
                    continue;
                }
                if (FInstancedStruct::GetPtr(local_30).opCall())
                {
                    this.GetModify_ClientInputTypeGuides().Add(Config);
                    continue;
                }
                if (FInstancedStruct::GetPtr(local_30).opCall())
                {
                    this.GetModify_ClientInTeamGuides().Add(Config);
                }
            }
        }
        return;
    }
    void OnGuideManualDataNotify(const FPbGuideManualDataNotify &inout Notify)
    {
        this.GetModify_FinishedGuideDataIds().Empty(0);
        TArray<uint> local_6;
        Notify.GetFinishedGuideManualList(local_6);
        for (auto local_20 : local_6)
        {
            this.GetModify_FinishedGuideDataIds().Add(local_20);
        }
        this.SetbDataReady(true);
        this.RebuildPendingList();
        if (this.GetbConditionDataReady())
        {
            this.CheckAllPendingGuides();
        }
        return;
    }
    void OnGuideManualFinishRsp(const FPbGuideManualFinishRsp &inout Rsp)
    {
        int local_4;
        if (Rsp.GetRetcode() != 0)
        {
            return;
        }
        local_4 = Rsp.GetFinishedGuideManualId();
        this.MarkGuideFinishedLocal(local_4);
        return;
    }
    void SendFinishGuide(const uint DataId)
    {
        FPbGuideManualFinishReq local_4;
        local_4.SetFinishedGuideManualId(DataId);
        this.SendProto(local_4.ToWrapper());
        return;
    }
    void CompleteGuideOnShow(const uint DataId)
    {
        if (!(this.GetFinishedGuideDataIds().Contains(DataId)))
        {
            this.SendFinishGuide(DataId);
        }
        this.MarkGuideFinishedLocal(DataId);
        return;
    }
    void MarkGuideFinishedLocal(const uint DataId)
    {
        if (!(this.GetFinishedGuideDataIds().Contains(DataId)))
        {
            this.GetModify_FinishedGuideDataIds().Add(DataId);
        }
        this.RemoveFromPending(DataId);
        this.RemoveFromReverseIndex(DataId);
        this.RemoveFromClientIndex(DataId);
        return;
    }
    void OpenHandbookDetailForGuide(const uint DataId)
    {
        int local_98 = 0;
        GetDataObjectByGSDataId<FGuideGroupConfig> local_48;
        TDataObjectPtr<FGuideGroupConfig> local_72 = local_48.opImplConv();
        if (!(local_72))
        {
            return;
        }
        int local_99 = local_98;
        FVM_TutorialHandbookDetail& local_104 = ::FVM_TutorialHandbookDetail::Create(this.GetManager(), local_99);
        local_104.SelectByGuideDataId(DataId);
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Tutorial_HandbookDetail, FEUIModelRef(local_104));
        return;
    }
    void OnConditionProgressUpdated(const FMsg_ConditionProgressUpdated &inout Msg)
    {
        int local_55;
        bool local_2 = !(this.GetbConditionDataReady());
        this.SetbConditionDataReady(true);
        if (!(this.GetbDataReady()))
        {
            return;
        }
        if (local_2)
        {
            this.CheckAllPendingGuides();
        }
        TSet<uint> local_22;
        TArray<FGuideCondIndexEntry> local_26 = this.GetReverseIndex();
        for (auto local_39 : Msg.ChangedConditionIds)
        {
            for (auto& local_54 : local_26)
            {
                int local_40 = int(local_54.CondDataId);
                if (local_40 != local_39)
                {
                    continue;
                }
                local_55 = local_40;
                if (local_22.Contains(local_55))
                {
                    continue;
                }
                local_22.Add(local_55);
                this.EnqueueGuide(local_54.GuideConfig);
            }
        }
        return;
    }
    void CheckAllPendingGuides()
    {
        for (auto& local_16 : this.GetPendingGuideConfigs())
        {
            this.EnqueueGuide(local_16);
        }
        return;
    }
    void OnClientConditionChanged(const FMsg_ClientConditionChanged &inout Msg)
    {
        int local_44 = 0;
        if (!(this.GetbDataReady()))
        {
            return;
        }
        TSet<uint> local_22;
        if (Msg.ChangedWidgetTag.IsValid() && this.GetClientTagIndex().Contains(Msg.ChangedWidgetTag))
        {
            int local_43;
            TArray<TDataObjectPtr<FGuideGroupConfig>> local_28 = this.GetClientTagIndex()[Msg.ChangedWidgetTag].Guides;
            for (auto& local_42 : local_28)
            {
                local_43 = local_44;
                if (!(local_22.Contains(local_43)))
                {
                    local_22.Add(local_43);
                    this.EnqueueGuide(local_42);
                }
            }
        }
        if (Msg.bCommissionOrMapChanged)
        {
            int local_43;
            TArray<TDataObjectPtr<FGuideGroupConfig>> local_28 = this.GetClientCommissionGuides();
            for (auto& local_42 : local_28)
            {
                local_43 = local_44;
                if (!(local_22.Contains(local_43)))
                {
                    local_22.Add(local_43);
                    this.EnqueueGuide(local_42);
                }
            }
            TArray<TDataObjectPtr<FGuideGroupConfig>> local_48 = this.GetClientLevelTypeGuides();
            for (auto& local_42 : local_48)
            {
                local_43 = local_44;
                if (!(local_22.Contains(local_43)))
                {
                    local_22.Add(local_43);
                    this.EnqueueGuide(local_42);
                }
            }
        }
        if (Msg.bInputTypeChanged)
        {
            int local_43;
            TArray<TDataObjectPtr<FGuideGroupConfig>> local_28 = this.GetClientInputTypeGuides();
            for (auto& local_42 : local_28)
            {
                local_43 = local_44;
                if (!(local_22.Contains(local_43)))
                {
                    local_22.Add(local_43);
                    if (this.IsGuideTriggerable(local_42))
                    {
                        this.EnqueueTutorial(local_42, false, true);
                    }
                }
            }
        }
        if (Msg.bTeamStateChanged)
        {
            int local_43;
            TArray<TDataObjectPtr<FGuideGroupConfig>> local_48 = this.GetClientInTeamGuides();
            for (auto& local_42 : local_48)
            {
                local_43 = local_44;
                if (!(local_22.Contains(local_43)))
                {
                    local_22.Add(local_43);
                    this.EnqueueGuide(local_42);
                }
            }
        }
        this.RemoveUnsatisfiedFromQueue();
        this.TryShowNextTutorial();
        this.TryShowNextTutorialHint();
        return;
    }
    void OnLoadingStateChanged(const FMsg_LoadingStateChanged &inout Msg)
    {
        if (!(Msg.bIsLoading))
        {
            this.TryShowNextTutorial();
            this.TryShowNextTutorialHint();
        }
        return;
    }
    void RemoveUnsatisfiedFromQueue()
    {
        int local_6;
        int local_7 = 0;
        int local_4 = this.GetTutorialQueue().Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            local_6 = local_7;
            if (!(this.CanShowQueuedGuide(this.GetTutorialQueue()[local_4], false)))
            {
                this.ClearGuideForceShow(local_6, false);
                this.GetModify_TutorialQueue().RemoveAt(local_4);
            }
        }
        int local_3 = this.GetTutorialHintQueue().Num() - 1;
        for (; local_3 >= 0; --local_3)
        {
            local_6 = local_7;
            if (!(this.CanShowQueuedGuide(this.GetTutorialHintQueue()[local_3], true)))
            {
                this.ClearGuideForceShow(local_6, true);
                this.GetModify_TutorialHintQueue().RemoveAt(local_3);
            }
        }
        return;
    }
    void OnOpenTutorial(const FCE_NotifyUI_OpenTutorial &inout Event)
    {
        FName local_2;
        int local_16 = 0;
        if (Event.Info.GetTutorialInfoId())
        {
            local_2 = Event.Info.GetTutorialInfoId().GetDataName();
        }
        FName local_7;
        float32 local_8 = -1.0f;
        bool local_3 = false;
        float32 local_10 = local_3;
        bool local_11 = false;
        if (this.GetTutorialHudVM().IsValid())
        {
            TEUIModelRef<FVM_TutorialHud> local_14 = this.GetTutorialHudVM();
            if (local_16.GetCurrentInfoConfig())
            {
                local_7 = local_16.GetCurrentInfoConfig().GetDataName();
            }
            local_8 = local_16.GetCountdown();
            local_10 = local_16.GetbUseCountdown();
            local_11 = local_16.GetbCountdownFinished();
        }
        XLog(ELog(62), FString().Append("[TutorialHud] OnOpenTutorial received InfoDataName=").Append(local_2).Append(" IncomingCountdown=").Append(Event.Info.GetCountdown()).Append(" StepProgressNum=").Append(Event.Info.GetStepProgress().Num()).Append(" WidgetValid=").Append(this.GetTutorialHudWidget().IsValid()).Append(" VMValid=").Append(this.GetTutorialHudVM().IsValid()).Append(" CurrentDataName=").Append(local_7).Append(" CurrentCountdown=").Append(local_8).Append(" CurrentUseCountdown=").Append(local_10).Append(" CurrentCountdownFinished=").Append(local_11));
        this.OpenOrUpdateTutorialHud(Event.Info);
        return;
    }
    void OnOpenTutorialGraphic(const FCE_NotifyUI_OpenTutorialGraphic &inout Event)
    {
        if (Event.GraphicId)
        {
            this.EnqueueTutorialGraphic(Event.GraphicId);
        }
        return;
    }
    void OnClientConditionTriggerReason(const FCE_ClientConditionTriggerReason &inout Event)
    {
        this.TryTriggerGuideImmediately(Event.Reason);
        return;
    }
    void EnqueueGuide(const TDataObjectPtr<FGuideGroupConfig> &inout Config)
    {
        if (!(this.IsGuideTriggerable(Config)))
        {
            return;
        }
        this.EnqueueGuideByDisplayType(Config, false, false);
        return;
    }
    void EnqueueTutorialGraphic(const TDataObjectPtr<FGuideGroupConfig> &inout Config)
    {
        if (!(Config))
        {
            return;
        }
        this.EnqueueGuideByDisplayType(Config, false, true);
        return;
    }
    void EnqueueGuideByDisplayType(const TDataObjectPtr<FGuideGroupConfig> &inout Config, const bool bForceShow, const bool bCheckClientConditions)
    {
        int local_2 = 0;
        if (!(Config))
        {
            return;
        }
        if (this.ShouldHint(EGuideManualType(local_2)))
        {
            this.EnqueueTutorialHint(Config, bForceShow, bCheckClientConditions);
            return;
        }
        this.EnqueueTutorial(Config, bForceShow, bCheckClientConditions);
        return;
    }
    void TryTriggerGuideImmediately(const EClientConditionTriggerReason Reason)
    {
        int local_2 = 0;
        bool local_1 = !(this.GetbDataReady());
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            local_2 = int(Reason);
            local_1 = (local_2 == 0);
        }
        if (local_1)
        {
            return;
        }
        if (::FMS_ClientCondition::Get(this.GetManager()).IsLoading())
        {
            return;
        }
        TDataObjectPtr<FGuideGroupConfig> local_32;
        for (auto& local_46 : this.GetPendingGuideConfigs())
        {
            if (!(this.IsGuideTriggerableForReason(local_46, EClientConditionTriggerReason(Reason))))
            {
                continue;
            }
            if (!(this.CanShowGuideImmediately(local_46)))
            {
                continue;
            }
            if (!(local_32) || (local_2 > 0))
            {
                local_32 = local_46;
            }
        }
        if (local_32)
        {
            this.ShowGuideImmediately(local_32);
        }
        return;
    }
    bool CanShowGuideImmediately(const TDataObjectPtr<FGuideGroupConfig> &inout Config) const
    {
        int local_3 = 0;
        if (!(Config) || CVar_GuideManual_Suppress.GetBool())
        {
            return false;
        }
        return !(this.IsGuideDisplayShowing(this.ShouldHint(EGuideManualType(local_3))));
    }
    void ShowGuideImmediately(const TDataObjectPtr<FGuideGroupConfig> &inout Config)
    {
        int local_2 = 0;
        int local_3 = 0;
        int local_1 = local_2;
        this.RemoveFromQueuedGuides(local_1);
        if (this.ShouldHint(EGuideManualType(local_3)))
        {
            this.ShowTutorialHintImmediately(Config);
            return;
        }
        this.ShowTutorialImmediately(Config);
        return;
    }
    void ShowTutorialImmediately(const TDataObjectPtr<FGuideGroupConfig> &inout Config)
    {
        int local_3 = 0;
        if (this.GetbTutorialShowing())
        {
            return;
        }
        int local_2 = local_3;
        this.SetbTutorialShowing(true);
        this.SetShowingTutorialDataId(local_2);
        this.SetTutorialPageWidget(FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Tutorial_Main, FEUIModelRef(::FVM_TutorialMain::Create(this.GetManager(), local_2))));
        return;
    }
    void ShowTutorialHintImmediately(const TDataObjectPtr<FGuideGroupConfig> &inout Config)
    {
        int local_3 = 0;
        if (this.GetbTutorialHintShowing())
        {
            return;
        }
        int local_2 = local_3;
        this.SetbTutorialHintShowing(true);
        this.SetShowingTutorialHintDataId(local_2);
        FVM_TutorialHint& local_8 = ::FVM_TutorialHint::Create(this.GetManager(), local_2);
        this.SetTutorialHintWidget(FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Tutorial_Hint, FEUIModelRef(local_8)));
        this.SetTutorialHintVM(TEUIModelRef<FVM_TutorialHint>(local_8));
        return;
    }
    void EnqueueTutorial(const TDataObjectPtr<FGuideGroupConfig> &inout Config, const bool bForceShow = false, const bool bCheckClientConditions = true)
    {
        int local_4 = 0;
        int local_20 = 0;
        if (!(this.CanEnqueueTutorial(Config, false, bForceShow, bCheckClientConditions)))
        {
            return;
        }
        int local_3 = local_4;
        if (bForceShow)
        {
            this.GetModify_DebugTutorialForceShowDataIds().Add(local_3);
        }
        for (auto& local_18 : this.GetTutorialQueue())
        {
            local_18;
            if (local_4 == local_3)
            {
                return;
            }
        }
        int local_19 = local_20;
        int local_21 = 0;
        int local_22 = 0;
        for (; local_22 < this.GetTutorialQueue().Num(); ++local_22)
        {
            if (0 >= local_19)
            {
                local_21 = local_22 + 1;
                continue;
            }
            break;
        }
        this.GetModify_TutorialQueue().Insert(Config, local_21);
        this.TryShowNextTutorial();
        return;
    }
    void TryShowNextTutorial()
    {
        int local_8;
        int local_9 = 0;
        if (::FMS_ClientCondition::Get(this.GetManager()).IsLoading())
        {
            return;
        }
        if (this.GetTutorialQueue().Num() > 0)
        {
            if (this.GetbTutorialShowing())
            {
                return;
            }
            local_8 = local_9;
            while (!(this.CanShowQueuedGuide(this.GetTutorialQueue()[0], false)))
            {
                this.ClearGuideForceShow(local_8, false);
                this.GetModify_TutorialQueue().RemoveAt(0);
            }
        }
        else
        {
        }
        if (this.GetbTutorialShowing() || (this.GetTutorialQueue().Num() == 0))
        {
            return;
        }
        TDataObjectPtr<FGuideGroupConfig> local_34 = this.GetTutorialQueue()[0];
        this.GetModify_TutorialQueue().RemoveAt(0);
        this.SetbTutorialShowing(true);
        local_8 = local_9;
        this.SetShowingTutorialDataId(local_8);
        this.SetTutorialPageWidget(FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Tutorial_Main, FEUIModelRef(::FVM_TutorialMain::Create(this.GetManager(), local_8))));
        return;
    }
    void OnTutorialPageClosed(const uint DataId)
    {
        this.SetbTutorialShowing(false);
        this.SetShowingTutorialDataId(0);
        this.TryShowNextTutorial();
        return;
    }
    void EnqueueTutorialHint(const TDataObjectPtr<FGuideGroupConfig> &inout Config, const bool bForceShow = false, const bool bCheckClientConditions = true)
    {
        int local_2 = 0;
        int local_5 = 0;
        int local_22 = 0;
        if (!(Config) || !(this.ShouldHint(EGuideManualType(local_2))))
        {
            return;
        }
        if (!(this.CanEnqueueTutorial(Config, true, bForceShow, bCheckClientConditions)))
        {
            return;
        }
        int local_4 = local_5;
        if (bForceShow)
        {
            this.GetModify_DebugTutorialHintForceShowDataIds().Add(local_4);
        }
        for (auto& local_20 : this.GetTutorialHintQueue())
        {
            local_20;
            if (local_5 == local_4)
            {
                return;
            }
        }
        int local_21 = local_22;
        int local_23 = 0;
        int local_24 = 0;
        for (; local_24 < this.GetTutorialHintQueue().Num(); ++local_24)
        {
            if (0 >= local_21)
            {
                local_23 = local_24 + 1;
                continue;
            }
            break;
        }
        this.GetModify_TutorialHintQueue().Insert(Config, local_23);
        this.TryShowNextTutorialHint();
        return;
    }
    bool CanEnqueueTutorial(const TDataObjectPtr<FGuideGroupConfig> &inout Config, const bool bHint, const bool bForceShow, const bool bCheckClientConditions) const
    {
        if (!(Config))
        {
            return false;
        }
        if (!(bForceShow) && CVar_GuideManual_Suppress.GetBool())
        {
            return false;
        }
        if (this.IsGuideShowing(Config, bHint))
        {
            return false;
        }
        return !(bCheckClientConditions) || this.AreGuideClientConditionsMet(Config);
    }
    void TryShowNextTutorialHint()
    {
        int local_8;
        int local_9 = 0;
        if (::FMS_ClientCondition::Get(this.GetManager()).IsLoading())
        {
            return;
        }
        if (this.GetTutorialHintQueue().Num() > 0)
        {
            if (this.GetbTutorialHintShowing())
            {
                return;
            }
            local_8 = local_9;
            while (!(this.CanShowQueuedGuide(this.GetTutorialHintQueue()[0], true)))
            {
                this.ClearGuideForceShow(local_8, true);
                this.GetModify_TutorialHintQueue().RemoveAt(0);
            }
        }
        else
        {
        }
        if (this.GetbTutorialHintShowing() || (this.GetTutorialHintQueue().Num() == 0))
        {
            return;
        }
        TDataObjectPtr<FGuideGroupConfig> local_34 = this.GetTutorialHintQueue()[0];
        this.GetModify_TutorialHintQueue().RemoveAt(0);
        this.SetbTutorialHintShowing(true);
        local_8 = local_9;
        this.SetShowingTutorialHintDataId(local_8);
        FVM_TutorialHint& local_60 = ::FVM_TutorialHint::Create(this.GetManager(), local_8);
        this.SetTutorialHintWidget(FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Tutorial_Hint, FEUIModelRef(local_60)));
        this.SetTutorialHintVM(TEUIModelRef<FVM_TutorialHint>(local_60));
        return;
    }
    void CloseTutorialHint(const uint DataId)
    {
        bool local_2;
        if (DataId == 0)
        {
            local_2 = false;
        }
        else
        {
            int local_1 = this.GetShowingTutorialHintDataId();
            local_2 = (local_1 != 0);
        }
        local_2 = local_2 && (this.GetShowingTutorialHintDataId() != DataId);
        if (local_2)
        {
            return;
        }
        if (this.GetTutorialHintWidget().IsValid())
        {
            FEUIWidget::RemoveWidget(this.GetTutorialHintWidget());
        }
        this.SetTutorialHintWidget(FEUIWidgetRef());
        this.SetTutorialHintVM(TEUIModelRef<FVM_TutorialHint>());
        this.SetbTutorialHintShowing(false);
        this.SetShowingTutorialHintDataId(0);
        this.TryShowNextTutorialHint();
        return;
    }
    void OpenOrUpdateTutorialHud(const FTutorialInfo &inout Info)
    {
        FVM_TutorialHud& local_18;
        if (!(Info.GetTutorialInfoId()))
        {
            XWarning(ELog(62), FString().Append("[TutorialHud] OpenOrUpdate ignored: invalid TutorialInfoId IncomingCountdown=").Append(Info.GetCountdown()).Append(" StepProgressNum=").Append(Info.GetStepProgress().Num()).Append(" WidgetValid=").Append(this.GetTutorialHudWidget().IsValid()).Append(" VMValid=").Append(this.GetTutorialHudVM().IsValid()));
            return;
        }
        FName local_16 = Info.GetTutorialInfoId().GetDataName();
        XLog(ELog(62), FString().Append("[TutorialHud] OpenOrUpdate enter InfoDataName=").Append(local_16).Append(" IncomingCountdown=").Append(Info.GetCountdown()).Append(" StepProgressNum=").Append(Info.GetStepProgress().Num()).Append(" WidgetValid=").Append(this.GetTutorialHudWidget().IsValid()).Append(" VMValid=").Append(this.GetTutorialHudVM().IsValid()));
        if (this.GetTutorialHudVM().IsValid() && this.GetTutorialHudWidget().IsValid())
        {
            FDataObjectPtr local_94;
            TEUIModelRef<FVM_TutorialHud> local_10 = this.GetTutorialHudVM();
            FName local_20;
            if (local_18.GetCurrentInfoConfig())
            {
                local_20 = local_18.GetCurrentInfoConfig().GetDataName();
            }
            TDataObjectPtr<FTutorialInfoConfig> local_46;
            local_46 = local_18.GetCurrentInfoConfig();
            local_94;
            bool local_1 = !((local_46 == local_94));
            XLog(ELog(62), FString().Append("[TutorialHud] Existing HUD branch InfoDataName=").Append(local_16).Append(" CurrentDataName=").Append(local_20).Append(" StructChanged=").Append(local_1).Append(" CountdownBefore=").Append(local_18.GetCountdown()).Append(" UseCountdownBefore=").Append(local_18.GetbUseCountdown()).Append(" CountdownFinishedBefore=").Append(local_18.GetbCountdownFinished()));
            if (local_1)
            {
                XLog(ELog(62), FString().Append("[TutorialHud] Rebuild required: closing old HUD CurrentDataName=").Append(local_20).Append(" NewDataName=").Append(local_16));
                this.CloseTutorialHud();
            }
            else
            {
                local_18.UpdateFromInfo(Info);
                bool local_21 = local_18.IsAllProgressFinished();
                XLog(ELog(62), FString().Append("[TutorialHud] Updated existing HUD InfoDataName=").Append(local_16).Append(" AllProgressFinished=").Append(local_21).Append(" CountdownAfterUpdate=").Append(local_18.GetCountdown()).Append(" UseCountdownAfterUpdate=").Append(local_18.GetbUseCountdown()).Append(" CountdownFinishedAfterUpdate=").Append(local_18.GetbCountdownFinished()));
                if (local_21 && !(local_18.GetbUseCountdown()))
                {
                    local_18.SetCountdown(::GuideManualSettings::Get().TutorialCompletionLingerSeconds);
                    local_18.SetbUseCountdown(true);
                    local_18.SetbCountdownFinished(false);
                    XLog(ELog(62), FString().Append("[TutorialHud] Completion linger started InfoDataName=").Append(local_16).Append(" Countdown=").Append(local_18.GetCountdown()));
                }
                else
                {
                    XLog(ELog(62), FString().Append("[TutorialHud] Existing HUD kept InfoDataName=").Append(local_16).Append(" Countdown=").Append(local_18.GetCountdown()).Append(" UseCountdown=").Append(local_18.GetbUseCountdown()).Append(" CountdownFinished=").Append(local_18.GetbCountdownFinished()));
                }
                return;
            }
        }
        else
        {
            if (this.GetTutorialHudVM().IsValid())
            {
                XWarning(ELog(62), FString().Append("[TutorialHud] Stale HUD VM without widget: reset VM before create InfoDataName=").Append(local_16));
                this.SetTutorialHudVM(TEUIModelRef<FVM_TutorialHud>());
            }
        }
        local_18 = ::FVM_TutorialHud::Create(this.GetManager());
        local_18.InitFromInfo(Info);
        this.SetTutorialHudWidget(FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Tutorial_Hud, FEUIModelRef(local_18)));
        this.SetTutorialHudVM(TEUIModelRef<FVM_TutorialHud>(local_18));
        XLog(ELog(62), FString().Append("[TutorialHud] Created HUD InfoDataName=").Append(local_16).Append(" WidgetValid=").Append(this.GetTutorialHudWidget().IsValid()).Append(" VMValid=").Append(this.GetTutorialHudVM().IsValid()).Append(" Countdown=").Append(local_18.GetCountdown()).Append(" UseCountdown=").Append(local_18.GetbUseCountdown()).Append(" CountdownFinished=").Append(local_18.GetbCountdownFinished()).Append(" ItemsNum=").Append(local_18.GetItems().Num()));
        return;
    }
    void CloseTutorialHud()
    {
        if (this.GetTutorialHudWidget().IsValid())
        {
            FEUIWidget::RemoveWidget(this.GetTutorialHudWidget());
        }
        this.SetTutorialHudWidget(FEUIWidgetRef());
        this.SetTutorialHudVM(TEUIModelRef<FVM_TutorialHud>());
        return;
    }
    bool IsGuideTriggerable(const TDataObjectPtr<FGuideGroupConfig> &inout Config) const
    {
        int local_3 = 0;
        int local_4 = 0;
        if (!(Config))
        {
            return false;
        }
        if (this.GetFinishedGuideDataIds().Contains(local_3))
        {
            return false;
        }
        if (!(this.ShouldTrigger(EGuideManualType(local_4))))
        {
            return false;
        }
        if (!(this.AreGuideClientConditionsMet(Config)))
        {
            return false;
        }
        return ::FMS_Condition::Get(this.GetManager()).AreAllServerConditionsMet(GetActiveConds());
    }
    bool IsGuideTriggerableForReason(const TDataObjectPtr<FGuideGroupConfig> &inout Config, const EClientConditionTriggerReason Reason) const
    {
        int local_3 = 0;
        int local_4 = 0;
        if (!(Config))
        {
            return false;
        }
        if (this.GetFinishedGuideDataIds().Contains(local_3))
        {
            return false;
        }
        bool local_1 = !(this.ShouldTrigger(EGuideManualType(local_4)));
        if (local_1)
        {
            return false;
        }
        FMS_ClientCondition& local_8 = ::FMS_ClientCondition::Get(this.GetManager());
        local_1 = !local_1;
        if (local_1)
        {
            return false;
        }
        return ::FMS_Condition::Get(this.GetManager()).AreAllServerConditionsMet(GetActiveConds());
    }
    bool AreGuideClientConditionsMet(const TDataObjectPtr<FGuideGroupConfig> &inout Config) const
    {
        bool local_1 = !(Config);
        if (local_1)
        {
            return false;
        }
        FMS_ClientCondition& local_6 = ::FMS_ClientCondition::Get(this.GetManager());
        return local_1;
    }
    bool IsGuideShowing(const TDataObjectPtr<FGuideGroupConfig> &inout Config, const bool bHint) const
    {
        int local_3 = 0;
        if (!(Config))
        {
            return false;
        }
        int local_2 = local_3;
        if (bHint)
        {
            return this.GetbTutorialHintShowing() && (this.GetShowingTutorialHintDataId() == local_2);
        }
        return this.GetbTutorialShowing() && (this.GetShowingTutorialDataId() == local_2);
    }
    bool IsGuideDisplayShowing(const bool bHint) const
    {
        if (bHint)
        {
            return this.GetbTutorialHintShowing();
        }
        return this.GetbTutorialShowing();
    }
    bool CanShowQueuedGuide(const TDataObjectPtr<FGuideGroupConfig> &inout Config, const bool bHint) const
    {
        int local_3 = 0;
        if (!(Config))
        {
            return false;
        }
        int local_2 = local_3;
        if (this.IsGuideForceShown(local_2, bHint))
        {
            return true;
        }
        return this.AreGuideClientConditionsMet(Config);
    }
    bool IsGuideForceShown(const uint DataId, const bool bHint) const
    {
        if (bHint)
        {
            return this.GetDebugTutorialHintForceShowDataIds().Contains(DataId);
        }
        return this.GetDebugTutorialForceShowDataIds().Contains(DataId);
    }
    void ClearGuideForceShow(const uint DataId, const bool bHint)
    {
        if (bHint)
        {
            return;
        }
        return;
    }
    bool ShouldPopup(const EGuideManualType Type) const
    {
        return (int(Type) == 0 || (int(Type) == 1));
    }
    bool ShouldHint(const EGuideManualType Type) const
    {
        return (int(Type) == 2 || (int(Type) == 5));
    }
    bool ShouldTrigger(const EGuideManualType Type) const
    {
        return this.ShouldPopup(EGuideManualType(Type)) || this.ShouldHint(EGuideManualType(Type));
    }
    bool IsGuideFinished(const uint DataId) const
    {
        return this.GetFinishedGuideDataIds().Contains(DataId);
    }
    bool IsVisibleInManual(const TDataObjectPtr<FGuideGroupConfig> &inout Config) const
    {
        const FGuideGroupConfig& local_2;
        if (!(::FMS_ClientCondition::Get(this.GetManager()).AreInputTypeConditionsMet(local_2.ClientConditions)))
        {
            return false;
        }
        if ((int(local_2.IsInManual) == 1 || (int(local_2.IsInManual) == 2) || (int(local_2.IsInManual) == 5)))
        {
            return this.GetFinishedGuideDataIds().Contains(local_2.DataId);
        }
        if (int(local_2.IsInManual) == 3)
        {
            return ::FMS_Condition::Get(this.GetManager()).AreAllServerConditionsMet(local_2.GetActiveConds());
        }
        return false;
    }
    void RemoveFromQueuedGuides(const uint DataId)
    {
        int local_6 = 0;
        int local_4 = this.GetTutorialQueue().Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            if (local_6 == DataId)
            {
                this.GetModify_TutorialQueue().RemoveAt(local_4);
            }
        }
        int local_3 = this.GetTutorialHintQueue().Num() - 1;
        for (; local_3 >= 0; --local_3)
        {
            if (local_6 == DataId)
            {
                this.GetModify_TutorialHintQueue().RemoveAt(local_3);
            }
        }
        return;
    }
    void RemoveFromPending(const uint DataId)
    {
        int local_4 = this.GetPendingGuideConfigs().Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            if (0 == DataId)
            {
                this.GetModify_PendingGuideConfigs().RemoveAt(local_4);
                break;
            }
        }
        return;
    }
    void RemoveFromReverseIndex(const uint DataId)
    {
        int local_4 = this.GetReverseIndex().Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            if (0 == DataId)
            {
                this.GetModify_ReverseIndex().RemoveAt(local_4);
            }
        }
        return;
    }
    void RemoveFromClientIndex(const uint DataId)
    {
        TArray<TDataObjectPtr<FGuideGroupConfig>> local_22;
        int local_27 = 0;
        for (auto& local_20 : this.GetClientTagIndex())
        {
            local_20;
            int local_26 = local_22.Num() - 1;
            for (; local_26 >= 0; --local_26)
            {
                if (local_27 == DataId)
                {
                    local_22.RemoveAt(local_26);
                }
            }
        }
        int local_25 = this.GetClientCommissionGuides().Num() - 1;
        for (; local_25 >= 0; --local_25)
        {
            if (local_27 == DataId)
            {
                this.GetModify_ClientCommissionGuides().RemoveAt(local_25);
            }
        }
        int local_24 = this.GetClientLevelTypeGuides().Num() - 1;
        for (; local_24 >= 0; --local_24)
        {
            if (local_27 == DataId)
            {
                this.GetModify_ClientLevelTypeGuides().RemoveAt(local_24);
            }
        }
        int local_23 = this.GetClientInputTypeGuides().Num() - 1;
        for (; local_23 >= 0; --local_23)
        {
            if (local_27 == DataId)
            {
                this.GetModify_ClientInputTypeGuides().RemoveAt(local_23);
            }
        }
        int local_26_2 = this.GetClientInTeamGuides().Num() - 1;
        for (; local_26_2 >= 0; --local_26_2)
        {
            if (local_27 == DataId)
            {
                this.GetModify_ClientInTeamGuides().RemoveAt(local_26_2);
            }
        }
        return;
    }
    void DebugFinishAllGuides()
    {
        TArray<uint> local_4;
        int local_5 = 0;
        bool local_7;
        bool local_8;
        int local_25;
        if (!(this.GetbTutorialShowing()))
        {
            local_8 = false;
        }
        else
        {
            local_5 = this.GetShowingTutorialDataId();
            local_8 = (local_5 != 0);
        }
        if (local_8)
        {
            local_4.Add(this.GetShowingTutorialDataId());
        }
        if (!(this.GetbTutorialHintShowing()))
        {
            local_7 = false;
        }
        else
        {
            int local_6 = this.GetShowingTutorialHintDataId();
            local_7 = (local_6 != 0);
        }
        if (local_7)
        {
            local_5 = this.GetShowingTutorialHintDataId();
            if (!(local_4.Contains(local_5)))
            {
                local_4.Add(this.GetShowingTutorialHintDataId());
            }
        }
        for (auto& local_24 : this.GetTutorialQueue())
        {
            local_24;
            local_25 = local_5;
            if (!(local_4.Contains(local_25)))
            {
                local_4.Add(local_25);
            }
        }
        for (auto& local_24 : this.GetTutorialHintQueue())
        {
            local_24;
            local_25 = local_5;
            if (!(local_4.Contains(local_25)))
            {
                local_4.Add(local_25);
            }
        }
        auto local_32 = local_4.Iterator();
        for (; local_32.CanProceed;)
        {
            local_25 = local_32.Proceed();
            this.SendFinishGuide(local_25);
            this.MarkGuideFinishedLocal(local_25);
        }
        if (this.GetTutorialPageWidget().IsValid())
        {
            FEUIWidget::RemoveWidget(this.GetTutorialPageWidget());
            this.SetTutorialPageWidget(FEUIWidgetRef());
        }
        this.SetbTutorialShowing(false);
        this.SetShowingTutorialDataId(0);
        this.GetModify_TutorialQueue().Empty(0);
        this.GetModify_DebugTutorialForceShowDataIds().Empty(0);
        if (this.GetTutorialHintWidget().IsValid())
        {
            FEUIWidget::RemoveWidget(this.GetTutorialHintWidget());
            this.SetTutorialHintWidget(FEUIWidgetRef());
        }
        this.SetTutorialHintVM(TEUIModelRef<FVM_TutorialHint>());
        this.SetbTutorialHintShowing(false);
        this.SetShowingTutorialHintDataId(0);
        this.GetModify_TutorialHintQueue().Empty(0);
        this.GetModify_DebugTutorialHintForceShowDataIds().Empty(0);
        return;
    }
    void DebugEnqueueGuide(const TDataObjectPtr<FGuideGroupConfig> &inout Config)
    {
        this.EnqueueGuideByDisplayType(Config, true, false);
        return;
    }
    void DebugEnqueueTutorial(const TDataObjectPtr<FGuideGroupConfig> &inout Config)
    {
        this.EnqueueTutorial(Config, true, false);
        return;
    }
    void DebugEnqueueTutorialHint(const TDataObjectPtr<FGuideGroupConfig> &inout Config)
    {
        this.EnqueueTutorialHint(Config, true, false);
        return;
    }
    void DebugTriggerGuide(const uint TargetDataId)
    {
        GetDataObjectByGSDataId<FGuideGroupConfig> local_48;
        TDataObjectPtr<FGuideGroupConfig> local_24 = local_48.opImplConv();
        if (!(local_24))
        {
            return;
        }
        this.DebugEnqueueGuide(local_24);
        return;
    }
    void DebugTriggerAllGuides()
    {
        TDataObjectIterator<FGuideGroupConfig> local_16;
        for (; local_16; )
        {
            this.DebugEnqueueGuide(local_16.GetDataPtr());
            local_16.Next();
        }
        return;
    }
    void DebugOpenTutorialHud(const int Mode = 0)
    {
        TArray<TDataObjectPtr<FTutorialInfoConfig>> local_4;
        TDataObjectIterator<FTutorialInfoConfig> local_20;
        for (; local_20; )
        {
            local_4.Add(local_20.GetDataPtr());
            local_20.Next();
        }
        int local_65 = Mode == 0 ? 0 : 1;
        if (local_65 >= local_4.Num())
        {
            return;
        }
        TDataObjectPtr<FTutorialInfoConfig> local_90 = local_4[local_65];
        FTutorialInfo local_122;
        local_122.SetTutorialInfoId(local_90);
        if (Mode == 0)
        {
            local_122.SetCountdown(5.0f);
            FTutorialStepProgress local_126;
            local_126.SetCurrentProgress(0);
            local_126.SetMaxProgress(3);
            local_122.GetModify_StepProgress().Add(local_126);
        }
        else
        {
            const FTutorialInfoConfig& local_128;
            local_122.SetCountdown(0.0f);
            int local_129 = 0;
            for (; local_129 < local_128.Steps.Num(); )
            {
                FTutorialStepProgress local_126;
                local_126.SetCurrentProgress(0);
                local_126.SetMaxProgress(1);
                local_122.GetModify_StepProgress().Add(local_126);
                ++local_129;
            }
        }
        this.OpenOrUpdateTutorialHud(local_122);
        return;
    }
    void DebugUpdateTutorialHud(const int StepIdx)
    {
        int local_6 = 0;
        if (!(this.GetTutorialHudVM().IsValid()) || !(this.GetTutorialHudWidget().IsValid()))
        {
            return;
        }
        TEUIModelRef<FVM_TutorialHud> local_2 = this.GetTutorialHudVM();
        if (!(local_6.GetCurrentInfoConfig()))
        {
            return;
        }
        FTutorialInfo local_38;
        local_38.SetTutorialInfoId(local_6.GetCurrentInfoConfig());
        local_38.SetCountdown(local_6.GetCountdown());
        int local_40 = 0;
        int local_42 = 0;
        for (; local_42 < local_6.GetItems().Num(); ++local_42)
        {
            if (!(GetbIsProgress()))
            {
                continue;
            }
            FTutorialStepProgress local_46;
            local_46.SetMaxProgress(1);
            int local_43 = local_40 <= StepIdx ? 1 : 0;
            local_46.SetCurrentProgress(local_43);
            local_38.GetModify_StepProgress().Add(local_46);
            local_40 = local_40 + 1;
        }
        this.OpenOrUpdateTutorialHud(local_38);
        return;
    }
    void DebugCloseTutorialHud()
    {
        this.CloseTutorialHud();
        return;
    }
    const TSet<uint> GetFinishedGuideDataIds() const property
    {
        const TSet<uint> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TSet<uint> GetModify_FinishedGuideDataIds() property
    {
        TSet<uint> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetFinishedGuideDataIds(const TSet<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_FinishedGuideDataIds = __Value;
        return;
    }
    bool GetbDataReady() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bDataReady;
    }
    void SetbDataReady(const bool __Value) property
    {
        if (!(this.m_bDataReady) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bDataReady = __Value;
        return;
    }
    bool GetbConditionDataReady() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bConditionDataReady;
    }
    void SetbConditionDataReady(const bool __Value) property
    {
        if (!(this.m_bConditionDataReady) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bConditionDataReady = __Value;
        return;
    }
    const TArray<FGuideCondIndexEntry> GetReverseIndex() const property
    {
        const TArray<FGuideCondIndexEntry> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<FGuideCondIndexEntry> GetModify_ReverseIndex() property
    {
        TArray<FGuideCondIndexEntry> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetReverseIndex(const TArray<FGuideCondIndexEntry> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ReverseIndex = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FGuideGroupConfig>> GetPendingGuideConfigs() const property
    {
        const TArray<TDataObjectPtr<FGuideGroupConfig>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TDataObjectPtr<FGuideGroupConfig>> GetModify_PendingGuideConfigs() property
    {
        TArray<TDataObjectPtr<FGuideGroupConfig>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetPendingGuideConfigs(const TArray<TDataObjectPtr<FGuideGroupConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PendingGuideConfigs = __Value;
        return;
    }
    const FEUIWidgetRef GetTutorialPageWidget() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FEUIWidgetRef GetModify_TutorialPageWidget() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetTutorialPageWidget(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_TutorialPageWidget = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FGuideGroupConfig>> GetTutorialQueue() const property
    {
        const TArray<TDataObjectPtr<FGuideGroupConfig>> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<TDataObjectPtr<FGuideGroupConfig>> GetModify_TutorialQueue() property
    {
        TArray<TDataObjectPtr<FGuideGroupConfig>> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetTutorialQueue(const TArray<TDataObjectPtr<FGuideGroupConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_TutorialQueue = __Value;
        return;
    }
    const TSet<uint> GetDebugTutorialForceShowDataIds() const property
    {
        const TSet<uint> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TSet<uint> GetModify_DebugTutorialForceShowDataIds() property
    {
        TSet<uint> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetDebugTutorialForceShowDataIds(const TSet<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_DebugTutorialForceShowDataIds = __Value;
        return;
    }
    bool GetbTutorialShowing() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bTutorialShowing;
    }
    void SetbTutorialShowing(const bool __Value) property
    {
        if (!(this.m_bTutorialShowing) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bTutorialShowing = __Value;
        return;
    }
    uint GetShowingTutorialDataId() const property
    {
        this.TrackPropertyRead(9);
        return this.m_ShowingTutorialDataId;
    }
    void SetShowingTutorialDataId(const uint __Value) property
    {
        if (this.m_ShowingTutorialDataId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_ShowingTutorialDataId = __Value;
        return;
    }
    const FEUIWidgetRef GetTutorialHintWidget() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FEUIWidgetRef GetModify_TutorialHintWidget() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetTutorialHintWidget(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_TutorialHintWidget = __Value;
        return;
    }
    TEUIModelRef<FVM_TutorialHint> GetTutorialHintVM() const property
    {
        this.TrackPropertyRead(11);
        return this.m_TutorialHintVM;
    }
    void SetTutorialHintVM(const TEUIModelRef<FVM_TutorialHint> &inout __Value) property
    {
        TEUIModelRef<FVM_TutorialHint> local_2;
        local_2 = this.m_TutorialHintVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_TutorialHintVM = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FGuideGroupConfig>> GetTutorialHintQueue() const property
    {
        const TArray<TDataObjectPtr<FGuideGroupConfig>> __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    TArray<TDataObjectPtr<FGuideGroupConfig>> GetModify_TutorialHintQueue() property
    {
        TArray<TDataObjectPtr<FGuideGroupConfig>> __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetTutorialHintQueue(const TArray<TDataObjectPtr<FGuideGroupConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_TutorialHintQueue = __Value;
        return;
    }
    const TSet<uint> GetDebugTutorialHintForceShowDataIds() const property
    {
        const TSet<uint> __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    TSet<uint> GetModify_DebugTutorialHintForceShowDataIds() property
    {
        TSet<uint> __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetDebugTutorialHintForceShowDataIds(const TSet<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_DebugTutorialHintForceShowDataIds = __Value;
        return;
    }
    bool GetbTutorialHintShowing() const property
    {
        this.TrackPropertyRead(14);
        return this.m_bTutorialHintShowing;
    }
    void SetbTutorialHintShowing(const bool __Value) property
    {
        if (!(this.m_bTutorialHintShowing) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_bTutorialHintShowing = __Value;
        return;
    }
    uint GetShowingTutorialHintDataId() const property
    {
        this.TrackPropertyRead(15);
        return this.m_ShowingTutorialHintDataId;
    }
    void SetShowingTutorialHintDataId(const uint __Value) property
    {
        if (this.m_ShowingTutorialHintDataId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_ShowingTutorialHintDataId = __Value;
        return;
    }
    const FEUIWidgetRef GetTutorialHudWidget() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    FEUIWidgetRef GetModify_TutorialHudWidget() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetTutorialHudWidget(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_TutorialHudWidget = __Value;
        return;
    }
    TEUIModelRef<FVM_TutorialHud> GetTutorialHudVM() const property
    {
        this.TrackPropertyRead(17);
        return this.m_TutorialHudVM;
    }
    void SetTutorialHudVM(const TEUIModelRef<FVM_TutorialHud> &inout __Value) property
    {
        TEUIModelRef<FVM_TutorialHud> local_2;
        local_2 = this.m_TutorialHudVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_TutorialHudVM = __Value;
        return;
    }
    const TMap<FGameplayTag, FGuideConfigList> GetClientTagIndex() const property
    {
        const TMap<FGameplayTag, FGuideConfigList> __r;
        this.TrackPropertyRead(18);
        return __r;
    }
    TMap<FGameplayTag, FGuideConfigList> GetModify_ClientTagIndex() property
    {
        TMap<FGameplayTag, FGuideConfigList> __r;
        this.MarkPropertyDirty(18);
        return __r;
    }
    void SetClientTagIndex(const TMap<FGameplayTag, FGuideConfigList> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_ClientTagIndex = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FGuideGroupConfig>> GetClientCommissionGuides() const property
    {
        const TArray<TDataObjectPtr<FGuideGroupConfig>> __r;
        this.TrackPropertyRead(19);
        return __r;
    }
    TArray<TDataObjectPtr<FGuideGroupConfig>> GetModify_ClientCommissionGuides() property
    {
        TArray<TDataObjectPtr<FGuideGroupConfig>> __r;
        this.MarkPropertyDirty(19);
        return __r;
    }
    void SetClientCommissionGuides(const TArray<TDataObjectPtr<FGuideGroupConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_ClientCommissionGuides = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FGuideGroupConfig>> GetClientLevelTypeGuides() const property
    {
        const TArray<TDataObjectPtr<FGuideGroupConfig>> __r;
        this.TrackPropertyRead(20);
        return __r;
    }
    TArray<TDataObjectPtr<FGuideGroupConfig>> GetModify_ClientLevelTypeGuides() property
    {
        TArray<TDataObjectPtr<FGuideGroupConfig>> __r;
        this.MarkPropertyDirty(20);
        return __r;
    }
    void SetClientLevelTypeGuides(const TArray<TDataObjectPtr<FGuideGroupConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_ClientLevelTypeGuides = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FGuideGroupConfig>> GetClientInputTypeGuides() const property
    {
        const TArray<TDataObjectPtr<FGuideGroupConfig>> __r;
        this.TrackPropertyRead(21);
        return __r;
    }
    TArray<TDataObjectPtr<FGuideGroupConfig>> GetModify_ClientInputTypeGuides() property
    {
        TArray<TDataObjectPtr<FGuideGroupConfig>> __r;
        this.MarkPropertyDirty(21);
        return __r;
    }
    void SetClientInputTypeGuides(const TArray<TDataObjectPtr<FGuideGroupConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_ClientInputTypeGuides = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FGuideGroupConfig>> GetClientInTeamGuides() const property
    {
        const TArray<TDataObjectPtr<FGuideGroupConfig>> __r;
        this.TrackPropertyRead(22);
        return __r;
    }
    TArray<TDataObjectPtr<FGuideGroupConfig>> GetModify_ClientInTeamGuides() property
    {
        TArray<TDataObjectPtr<FGuideGroupConfig>> __r;
        this.MarkPropertyDirty(22);
        return __r;
    }
    void SetClientInTeamGuides(const TArray<TDataObjectPtr<FGuideGroupConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_ClientInTeamGuides = __Value;
        return;
    }
}

void CMD_GuideManual_FinishQueue(const TArray<FString> &inout Arguments)
{
    APlayerController local_4 = FASCommonUtils::GetLocalPlayerController();
    if (local_4 == nullptr)
    {
        return;
    }
    FMS_GuideManual::Get(local_4).DebugFinishAllGuides();
    return;
}
void CMD_GuideManual_TriggerGuide(const TArray<FString> &inout Arguments)
{
    int local_4;
    if (Arguments.Num() < 1)
    {
        return;
    }
    local_4 = String::Conv_StringToInt(Arguments[0]);
    if (local_4 == 0)
    {
        return;
    }
    APlayerController local_10 = FASCommonUtils::GetLocalPlayerController();
    if (local_10 == nullptr)
    {
        return;
    }
    FMS_GuideManual& local_12 = FMS_GuideManual::Get(local_10);
    local_12.DebugTriggerGuide(local_4);
    return;
}
void CMD_GuideManual_TriggerAllGuides(const TArray<FString> &inout Arguments)
{
    APlayerController local_4 = FASCommonUtils::GetLocalPlayerController();
    if (local_4 == nullptr)
    {
        return;
    }
    FMS_GuideManual::Get(local_4).DebugTriggerAllGuides();
    return;
}
namespace FMS_GuideManual
{
FMS_GuideManual& Get(const UObject ContextObject)
{
    return FMS_GuideManual::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_GuideManual GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_GuideManual __r;
    TEUIModelRef<FMS_GuideManual> local_6 = TEUIModelRef<FMS_GuideManual>(EUIInternal::MakeModelWithManager(Manager, FMS_GuideManual::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__OnGuideManualDataNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__OnGuideManualFinishRsp";
    Result.ProtoRspDefines.Add(local_10);
    FEUIModelMsgHandleDefine local_22;
    local_22.FunctionName = "__OnConditionProgressUpdated";
    local_22.MessageTypeName = "Msg_ConditionProgressUpdated";
    local_22.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_22);
    local_22.FunctionName = "__OnClientConditionChanged";
    local_22.MessageTypeName = "Msg_ClientConditionChanged";
    local_22.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_22);
    local_22.FunctionName = "__OnLoadingStateChanged";
    local_22.MessageTypeName = "Msg_LoadingStateChanged";
    local_22.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_22);
    FEUIModelEventDefine local_32;
    local_32.FunctionName = "__OnOpenTutorial";
    local_32.EventType = FCE_NotifyUI_OpenTutorial;
    Result.EventFunctions.Add(local_32);
    local_32.FunctionName = "__OnOpenTutorialGraphic";
    local_32.EventType = FCE_NotifyUI_OpenTutorialGraphic;
    Result.EventFunctions.Add(local_32);
    local_32.FunctionName = "__OnClientConditionTriggerReason";
    local_32.EventType = FCE_ClientConditionTriggerReason;
    Result.EventFunctions.Add(local_32);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_GuideManual;
}
void __OnGuideManualDataNotify(FMS_GuideManual &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.OnGuideManualDataNotify(FPbGuideManualDataNotify::FromWrapper(ProtoWrapper));
    return;
}
void __OnGuideManualFinishRsp(FMS_GuideManual &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.OnGuideManualFinishRsp(FPbGuideManualFinishRsp::FromWrapper(ProtoWrapper));
    return;
}
void __OnConditionProgressUpdated(FMS_GuideManual &inout Model, const FMsg_ConditionProgressUpdated &inout Message)
{
    Model.OnConditionProgressUpdated(Message);
    return;
}
void __OnClientConditionChanged(FMS_GuideManual &inout Model, const FMsg_ClientConditionChanged &inout Message)
{
    Model.OnClientConditionChanged(Message);
    return;
}
void __OnLoadingStateChanged(FMS_GuideManual &inout Model, const FMsg_LoadingStateChanged &inout Message)
{
    Model.OnLoadingStateChanged(Message);
    return;
}
void __OnOpenTutorial(FMS_GuideManual &inout Model, const FCE_NotifyUI_OpenTutorial &inout Event)
{
    Model.OnOpenTutorial(Event);
    return;
}
void __OnOpenTutorialGraphic(FMS_GuideManual &inout Model, const FCE_NotifyUI_OpenTutorialGraphic &inout Event)
{
    Model.OnOpenTutorialGraphic(Event);
    return;
}
void __OnClientConditionTriggerReason(FMS_GuideManual &inout Model, const FCE_ClientConditionTriggerReason &inout Event)
{
    Model.OnClientConditionTriggerReason(Event);
    return;
}
int __IndexOf_FinishedGuideDataIds()
{
    return 0;
}
int __IndexOf_bDataReady()
{
    return 1;
}
int __IndexOf_bConditionDataReady()
{
    return 2;
}
int __IndexOf_ReverseIndex()
{
    return 3;
}
int __IndexOf_PendingGuideConfigs()
{
    return 4;
}
int __IndexOf_TutorialPageWidget()
{
    return 5;
}
int __IndexOf_TutorialQueue()
{
    return 6;
}
int __IndexOf_DebugTutorialForceShowDataIds()
{
    return 7;
}
int __IndexOf_bTutorialShowing()
{
    return 8;
}
int __IndexOf_ShowingTutorialDataId()
{
    return 9;
}
int __IndexOf_TutorialHintWidget()
{
    return 10;
}
int __IndexOf_TutorialHintVM()
{
    return 11;
}
int __IndexOf_TutorialHintQueue()
{
    return 12;
}
int __IndexOf_DebugTutorialHintForceShowDataIds()
{
    return 13;
}
int __IndexOf_bTutorialHintShowing()
{
    return 14;
}
int __IndexOf_ShowingTutorialHintDataId()
{
    return 15;
}
int __IndexOf_TutorialHudWidget()
{
    return 16;
}
int __IndexOf_TutorialHudVM()
{
    return 17;
}
int __IndexOf_ClientTagIndex()
{
    return 18;
}
int __IndexOf_ClientCommissionGuides()
{
    return 19;
}
int __IndexOf_ClientLevelTypeGuides()
{
    return 20;
}
int __IndexOf_ClientInputTypeGuides()
{
    return 21;
}
int __IndexOf_ClientInTeamGuides()
{
    return 22;
}
}

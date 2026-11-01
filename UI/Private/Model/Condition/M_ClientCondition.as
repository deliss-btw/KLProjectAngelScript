namespace FMS_ClientCondition
{
    const int ModelId = 0;

}
struct FMsg_ClientConditionChanged : FEUIMessage
{
    UPROPERTY()
    FGameplayTag ChangedWidgetTag;
    UPROPERTY()
    bool bCommissionOrMapChanged = false;
    UPROPERTY()
    bool bInputTypeChanged = false;
    UPROPERTY()
    bool bTeamStateChanged = false;

}

struct FMsg_LoadingStateChanged : FEUIMessage
{
    UPROPERTY()
    bool bIsLoading = false;

}

struct FMsg_SubPagePresence : FEUIMessage
{
    UPROPERTY()
    FGameplayTag WidgetTag;
    UPROPERTY()
    bool bPresented = false;

}

struct FMS_ClientCondition : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TSet<FGameplayTag> m_ActiveWidgetTags;
    UPROPERTY()
    bool m_bIsLoading;

    FMS_ClientCondition()
    {
        this.m_bIsLoading = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_ClientCondition(const FMS_ClientCondition &inout Other)
    {
        this.m_bIsLoading = true;
        this.m_ActiveWidgetTags = Other.m_ActiveWidgetTags;
        this.m_bIsLoading = Other.m_bIsLoading;
        return;
    }
    FMS_ClientCondition opAssign(const FMS_ClientCondition &inout Other)
    {
        FMS_ClientCondition __r;
        this.m_ActiveWidgetTags = Other.m_ActiveWidgetTags;
        this.m_bIsLoading = Other.m_bIsLoading;
        return __r;
    }
    void OnWidgetPresenceChanged(const FMsg_WidgetPresence &inout Msg)
    {
        this.ApplyWidgetPresence(Msg.WidgetTag, Msg.bPresented);
        return;
    }
    void OnSubPagePresenceChanged(const FMsg_SubPagePresence &inout Msg)
    {
        this.ApplyWidgetPresence(Msg.WidgetTag, Msg.bPresented);
        return;
    }
    void ApplyWidgetPresence(const FGameplayTag &inout WidgetTag, const bool bPresented)
    {
        if (bPresented)
        {
            this.GetModify_ActiveWidgetTags().Add(WidgetTag);
        }
        else
        {
            this.GetModify_ActiveWidgetTags().Remove(WidgetTag);
        }
        FEUIModelRef local_8 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_8).ChangedWidgetTag = WidgetTag;
        return;
    }
    void OnInputMethodChanged(const FMsg_InputMethodChanged &inout Msg)
    {
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_6).bInputTypeChanged = true;
        return;
    }
    void OnSocialTeamChanged(const FMsg_SocialTeamChanged &inout Msg)
    {
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_6).bTeamStateChanged = true;
        return;
    }
    void OnCombatTeamChanged(const FMsg_CombatTeamChanged &inout Msg)
    {
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_6).bTeamStateChanged = true;
        return;
    }
    void OnCurrentLevelInfoConfigChanged(const FMsg_CurrentLevelInfoConfigChanged &inout Msg)
    {
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_6).bCommissionOrMapChanged = true;
        return;
    }
    bool IsLoading() const
    {
        return this.GetbIsLoading();
    }
    void SetLoadingState(const bool bNewLoading)
    {
        if (!(this.GetbIsLoading()) != !(bNewLoading))
        {
            this.SetbIsLoading(bNewLoading);
            FEUIModelRef local_8 = FEUIModelRef(this);
            FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_8).bIsLoading = this.GetbIsLoading();
            if (!(bNewLoading))
            {
                FEUIModelRef local_8_2 = FEUIModelRef(this);
                FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_8_2).bCommissionOrMapChanged = true;
            }
        }
        return;
    }
    bool AreClientConditionsMet(const TArray<FClientConditionGroup> &inout Groups) const
    {
        return this.AreClientConditionsMetWithTriggerReason(Groups, EClientConditionTriggerReason(0));
    }
    bool AreClientConditionsMetForTriggerReason(const TArray<FClientConditionGroup> &inout Groups, const EClientConditionTriggerReason Reason) const
    {
        return this.AreClientConditionsMetWithTriggerReason(Groups, EClientConditionTriggerReason(Reason));
    }
    bool AreInputTypeConditionsMet(const TArray<FClientConditionGroup> &inout Groups) const
    {
        bool local_17;
        bool local_18;
        for (auto& local_16 : Groups)
        {
            local_17 = false;
            local_18 = false;
            for (auto& local_32 : local_16.Conditions)
            {
                TConstRawPtr<FClientCond_InputType> local_38 = FInstancedStruct::GetPtr(local_32).opCall();
                if (local_38)
                {
                    local_17 = true;
                    local_18 = local_18 || this.IsInputTypeMet(local_38.Get());
                }
            }
            if (local_17 && !(local_18))
            {
                return false;
            }
        }
        return true;
    }
    bool AreClientConditionsMetWithTriggerReason(const TArray<FClientConditionGroup> &inout Groups, const EClientConditionTriggerReason Reason) const
    {
        for (auto& local_16 : Groups)
        {
            if (!(this.IsGroupMet(local_16, EClientConditionTriggerReason(Reason))))
            {
                return false;
            }
        }
        return true;
    }
    bool IsGroupMet(const FClientConditionGroup &inout Group, const EClientConditionTriggerReason Reason) const
    {
        if (Group.Conditions.Num() == 0)
        {
            return true;
        }
        for (auto& local_18 : Group.Conditions)
        {
            if (this.IsConditionMet(local_18, EClientConditionTriggerReason(Reason)))
            {
                return true;
            }
        }
        return false;
    }
    bool IsConditionMet(const FInstancedStruct &inout Cond, const EClientConditionTriggerReason Reason) const
    {
        if (FInstancedStruct::GetPtr(Cond).opCall())
        {
            FGameplayTag local_11;
            return !(local_11.IsValid()) || this.GetActiveWidgetTags().Contains(local_11);
        }
        TConstRawPtr<FClientCond_CommissionInMap> local_18 = FInstancedStruct::GetPtr(Cond).opCall();
        if (local_18)
        {
            return this.IsCommissionInMapMet(local_18.Get());
        }
        TConstRawPtr<FClientCond_LevelType> local_26 = FInstancedStruct::GetPtr(Cond).opCall();
        if (local_26)
        {
            return this.IsLevelTypeMet(local_26.Get());
        }
        TConstRawPtr<FClientCond_InputType> local_34 = FInstancedStruct::GetPtr(Cond).opCall();
        if (local_34)
        {
            return this.IsInputTypeMet(local_34.Get());
        }
        TConstRawPtr<FClientCond_InTeam> local_42 = FInstancedStruct::GetPtr(Cond).opCall();
        if (local_42)
        {
            return this.IsInTeamMet(local_42.Get());
        }
        TConstRawPtr<FClientCond_TriggerReason> local_50 = FInstancedStruct::GetPtr(Cond).opCall();
        if (local_50)
        {
            EClientConditionTriggerReason local_53;
            local_53 = local_50.Get().Reason;
            return (int(local_53) != 0 && (int(local_53) == int(Reason)));
        }
        return false;
    }
    bool IsInTeamMet(const FClientCond_InTeam &inout Cond) const
    {
        FMS_LocalPlayerTeamData& local_4 = ::FMS_LocalPlayerTeamData::Get(this.GetManager());
        bool local_5 = !(((local_4.GetTeamMemberCount(ETeamType(1)) >= 2) || (local_4.GetTeamMemberCount(ETeamType(2)) >= 2)));
        bool local_10 = !(Cond.bRequireInTeam);
        local_5 = (local_5 == local_10);
        return local_5;
    }
    bool IsLevelTypeMet(const FClientCond_LevelType &inout Cond) const
    {
        int local_3 = int(::FLevelUtils::GetCurrentLevelType());
        int local_4 = int(Cond.LevelType);
        return (local_3 == local_4);
    }
    bool IsInputTypeMet(const FClientCond_InputType &inout Cond) const
    {
        UEUIInputSubsystem local_4 = UEUIInputSubsystem::Get(this.GetContext().UELocalPlayer);
        if (local_4 == nullptr)
        {
            return false;
        }
        int local_8 = int(local_4.GetCurrentInputType());
        int local_9 = int(Cond.InputType);
        return (local_8 == local_9);
    }
    bool IsCommissionInMapMet(const FClientCond_CommissionInMap &inout Cond) const
    {
        TDataObjectPtr<FCommissionConfig> local_24 = Cond.CommissionConfig;
        if (!(local_24))
        {
            return false;
        }
        TDataObjectPtr<FCommissionConfig> local_48 = ::CommissionUtils::GetCurrentCommissionConfig();
        if (!(local_48) || (local_48.Get().DataId != local_24.Get().DataId))
        {
            return false;
        }
        TDataObjectPtr<FLevelInfoConfig> local_102 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
        TDataObjectPtr<FLevelInfoConfig> local_150 = local_24.Get().GetLevelInfoConfig();
        if ((!(local_102) || !(local_150)))
        {
            return false;
        }
        return (local_102 == local_150.opImplConv());
    }
    const TSet<FGameplayTag> GetActiveWidgetTags() const property
    {
        const TSet<FGameplayTag> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TSet<FGameplayTag> GetModify_ActiveWidgetTags() property
    {
        TSet<FGameplayTag> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetActiveWidgetTags(const TSet<FGameplayTag> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ActiveWidgetTags = __Value;
        return;
    }
    bool GetbIsLoading() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsLoading;
    }
    void SetbIsLoading(const bool __Value) property
    {
        if (!(this.m_bIsLoading) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsLoading = __Value;
        return;
    }
}

namespace FMS_ClientCondition
{
FMS_ClientCondition& Get(const UObject ContextObject)
{
    return FMS_ClientCondition::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_ClientCondition& GetByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FMS_ClientCondition>(EUIInternal::MakeModelWithManager(Manager, FMS_ClientCondition::ModelId)).Get();
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__OnWidgetPresenceChanged";
    local_14.MessageTypeName = "Msg_WidgetPresence";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnSubPagePresenceChanged";
    local_14.MessageTypeName = "Msg_SubPagePresence";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnInputMethodChanged";
    local_14.MessageTypeName = "Msg_InputMethodChanged";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnSocialTeamChanged";
    local_14.MessageTypeName = "Msg_SocialTeamChanged";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnCombatTeamChanged";
    local_14.MessageTypeName = "Msg_CombatTeamChanged";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnCurrentLevelInfoConfigChanged";
    local_14.MessageTypeName = "Msg_CurrentLevelInfoConfigChanged";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_ClientCondition;
}
void __OnWidgetPresenceChanged(FMS_ClientCondition &inout Model, const FMsg_WidgetPresence &inout Message)
{
    Model.OnWidgetPresenceChanged(Message);
    return;
}
void __OnSubPagePresenceChanged(FMS_ClientCondition &inout Model, const FMsg_SubPagePresence &inout Message)
{
    Model.OnSubPagePresenceChanged(Message);
    return;
}
void __OnInputMethodChanged(FMS_ClientCondition &inout Model, const FMsg_InputMethodChanged &inout Message)
{
    Model.OnInputMethodChanged(Message);
    return;
}
void __OnSocialTeamChanged(FMS_ClientCondition &inout Model, const FMsg_SocialTeamChanged &inout Message)
{
    Model.OnSocialTeamChanged(Message);
    return;
}
void __OnCombatTeamChanged(FMS_ClientCondition &inout Model, const FMsg_CombatTeamChanged &inout Message)
{
    Model.OnCombatTeamChanged(Message);
    return;
}
void __OnCurrentLevelInfoConfigChanged(FMS_ClientCondition &inout Model, const FMsg_CurrentLevelInfoConfigChanged &inout Message)
{
    Model.OnCurrentLevelInfoConfigChanged(Message);
    return;
}
int __IndexOf_ActiveWidgetTags()
{
    return 0;
}
int __IndexOf_bIsLoading()
{
    return 1;
}
}

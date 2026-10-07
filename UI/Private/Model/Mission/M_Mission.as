
namespace FMS_Mission
{
    const int ModelId = 0;

}
struct FMS_Mission : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;

    FMS_Mission()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_Mission(const FMS_Mission &inout Other)
    {
        return;
    }
    FMS_Mission opAssign(const FMS_Mission &inout Other)
    {
        FMS_Mission __r;
        return __r;
    }
    void PostConstruct()
    {
        return;
    }
    void HandleCGPlayerEnd(const FMsg_CGPlayerEnd &inout Msg)
    {
        int local_18 = 0;
        if (!(Msg.CGConfig.IsSet()) || !(this.GetContext().GetLocalPlayer().IsValid()))
        {
            return;
        }
        FFPTime local_14 = FFPTime(-1);
        FECSEntity local_6 = this.GetContext().GetLocalPlayer();
        local_18.CGConfig = Msg.CGConfig;
        return;
    }
    void OnMissionPerformTransition(const FCE_MissionPerformTransition &inout Event)
    {
        if (Event.TransitionInfos.IsEmpty())
        {
            return;
        }
        int local_2 = 0;
        for (auto& local_18 : Event.TransitionInfos)
        {
            this.PerformMissionTransition(local_18, local_2);
            if (local_18.GetMissionPhaseId() > 0)
            {
                local_2 = local_18.GetMissionPhaseId();
            }
        }
        return;
    }
    void CheckAndUpdateMissionRedDot(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const EMissionStatus NewStatus) const
    {
        EMissionType local_36 = EMissionType(0);
        int local_37 = 0;
        if (!(MissionConfig.IsSet()))
        {
            return;
        }
        if (int(NewStatus) == 1)
        {
            Get local_8;
            const FC_TrackingMission& local_10 = local_8.opCall();
            if (local_10)
            {
                TDataObjectPtr<FMissionConfig> local_34;
                if (local_10.GetTrackingMissionMap().Find(local_36, local_34) && (local_37 == 0))
                {
                    return;
                }
            }
            XLog(ELog(63), FString().Append("[Mission] Generate New Mission RedDot: ").Append(MissionConfig.GetDataName()).Append(" => ").Append(NewStatus));
            TArray<uint64> local_52;
            int64 local_54 = local_37;
            local_52.Add(local_54);
            int local_2 = int(local_36);
            if (local_2 <= 1)
            {
                if (local_2 != 0)
                {
                    if (local_2 != 1)
                    {
                    }
                }
                else
                {
                    ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateRedDot(ERedPointEvent(9), local_52);
                    ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateRedDot(ERedPointEvent(10), local_52);
                }
            }
            FString local_44 = FString();
            return;
        }
        if (int(NewStatus) >= 2)
        {
            XLog(ELog(63), FString().Append("[Mission] Consume Mission RedDot: ").Append(MissionConfig.GetDataName()).Append(" => ").Append(NewStatus));
            int local_2_2 = int(local_36);
            if (local_2_2 <= 1)
            {
                if (local_2_2 != 0)
                {
                    if (local_2_2 != 1)
                    {
                    }
                }
                else
                {
                    int64 local_54_2 = local_37;
                    ::FMS_RedDotSystem::Get(this.GetContext().Manager).ConsumeRedDot(GameplayTags::RedDotSystem_Mission_NewMainMission, local_54_2);
                    return;
                }
            }
            FString local_44_2 = FString();
        }
        return;
    }
    void PerformMissionHint(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const EMissionStatus NewStatus) const
    {
        this.CheckAndUpdateMissionRedDot(PlayerEntity, MissionConfig, EMissionStatus(NewStatus));
        TDataObjectPtr<FMessageHintConfig> local_24;
        if (::MissionUtils::GetMissionPresentationRuleConfig(MissionConfig).IsSet())
        {
            int local_74 = int(NewStatus);
            if (local_74 <= 2)
            {
                if (local_74 != 1)
                {
                    if (local_74 != 2)
                    {
                    }
                }
                else
                {
                    local_24 = GetMissionStartHint();
                    local_24 = GetMissionFinishHint();
                }
            }
        }
        if (!(local_24.IsSet()))
        {
            XWarning(ELog(63), FString().Append("[Mission] Show Mission Popup failed, MissionHint not found for Mission").Append(MissionConfig.GetDataName()).Append(" => ").Append(NewStatus));
            return;
        }
        TArray<FTextArgument> local_112;
        Make local_118;
        local_112.Add(local_118.opImplConv());
        XLog(ELog(63), FString().Append("[Mission] Show Mission Popup: ").Append(MissionConfig.GetDataName()).Append(" => ").Append(NewStatus));
        ::MessageHintUtils::ShowMessageHint(PlayerEntity, local_24, local_112);
        return;
    }
    void PerformMissionPhaseHint(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMissionConfig> &inout MissionConfig, const uint MissionPhaseId, const EMissionStatus NewStatus) const
    {
        TDataObjectPtr<FMessageHintConfig> local_24;
        if (::MissionUtils::GetMissionPresentationRuleConfig(MissionConfig).IsSet() && GetMissionPhaseHint().Contains(NewStatus))
        {
            local_24 = GetMissionPhaseHint()[NewStatus];
        }
        if (local_24.IsSet() && ::MissionUtils::FindMissionPhaseConfig(MissionPhaseId).IsSet())
        {
            TArray<FTextArgument> local_150;
            Make local_156;
            local_150.Add(local_156.opImplConv());
            ::MessageHintUtils::ShowMessageHint(PlayerEntity, local_24, local_150);
            return;
        }
        XWarning(ELog(63), FString().Append("[Mission] Show MissionPhase Hint failed, MissionPhase").Append(MissionPhaseId).Append(" => ").Append(NewStatus));
        return;
    }
    void PerformMissionTransition(const FStatusTransitionInfo &inout TransInfo, const uint LastMissionPhaseId) const
    {
        EMissionHideType local_227;
        FMissionDetail local_112;
        int local_233 = 0;
        FECSEntity local_116 = FECSEntity(this.GetContext().GetLocalPlayer());
        if (!(::MissionUtils::TryFindMissionDetail(local_116, TransInfo.GetMissionId(), local_112, true)))
        {
            XWarning(ELog(63), FString().Append("[Mission] Perform MissionStartPopup failed, MissionDetail not found for MissionId: ").Append(TransInfo.GetMissionId()));
            return;
        }
        TDataObjectPtr<FMissionConfig> local_154 = local_112.GetMissionConfig();
        if (::MissionUtils::GetMissionPresentationRuleConfig(local_154).IsSet())
        {
            EMissionHideType local_228;
            local_227 = local_228;
        }
        else
        {
            local_227 = EMissionHideType(0);
        }
        bool local_123 = (int(local_227) == 1);
        if (int(local_227) == 2)
        {
            return;
        }
        int local_122 = TransInfo.GetMissionPhaseId();
        if (local_122 == 0)
        {
            if (local_123 && (int(TransInfo.GetNewStatus()) == 1))
            {
                return;
            }
            this.PerformMissionHint(local_116, local_154, EMissionStatus(TransInfo.GetNewStatus()));
            return;
        }
        if (local_123)
        {
            int local_235;
            local_235 = local_233;
            if (TransInfo.GetMissionPhaseId() == local_235)
            {
                return;
            }
            if (LastMissionPhaseId == local_235 && (int(TransInfo.GetNewStatus()) == 1))
            {
                this.PerformMissionHint(local_116, local_154, EMissionStatus(EMissionStatus(1)));
            }
        }
        EMissionStatus local_234_3 = TransInfo.GetNewStatus();
        this.PerformMissionPhaseHint(local_116, local_154, TransInfo.GetMissionPhaseId());
        return;
    }
}

namespace FMS_Mission
{
FMS_Mission& Get(const UObject ContextObject)
{
    return FMS_Mission::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_Mission GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_Mission __r;
    TEUIModelRef<FMS_Mission> local_6 = TEUIModelRef<FMS_Mission>(EUIInternal::MakeModelWithManager(Manager, FMS_Mission::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__HandleCGPlayerEnd";
    local_14.MessageTypeName = "Msg_CGPlayerEnd";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    FEUIModelEventDefine local_24;
    local_24.FunctionName = "__OnMissionPerformTransition";
    local_24.EventType = FCE_MissionPerformTransition;
    Result.EventFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_Mission;
}
void __HandleCGPlayerEnd(FMS_Mission &inout Model, const FMsg_CGPlayerEnd &inout Message)
{
    Model.HandleCGPlayerEnd(Message);
    return;
}
void __OnMissionPerformTransition(FMS_Mission &inout Model, const FCE_MissionPerformTransition &inout Event)
{
    Model.OnMissionPerformTransition(Event);
    return;
}
}

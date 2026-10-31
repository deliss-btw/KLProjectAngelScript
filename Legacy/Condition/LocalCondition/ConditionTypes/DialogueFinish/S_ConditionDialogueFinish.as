class US_ConditionDialogueFinish : UECSScriptSystem
{
    US_ConditionDialogueFinish()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateDialogueFinishCondition(const FCE_DialogueRequestEnd &inout Event, const FCS_LocalConditionSubscriptionManager &inout SubscriptionManager) const
    {
        bool local_81;
        if (Event.bInterrupted)
        {
            return;
        }
        TDataObjectPtr<FDialogueConfig> local_26 = ::DialogueUtils::GetDialogueConfig(Event.DialogueContextEntity);
        if (!(local_26.IsSet()))
        {
            return;
        }
        FName local_52(local_26.Get().GetDataName());
        TConstRawPtr<FDialogueHistory> local_56 = nullptr;
        Get local_62;
        const FC_DialogueStateCache& local_64 = local_62.opCall();
        if (local_64)
        {
            local_56 = local_64.HistoryCache.Find(local_52);
        }
        for (auto& local_80 : SubscriptionManager.GetHandleList(UConditionDialogueFinish, local_52).ConditionInstances)
        {
            if (::ConditionUtils::IsReached(local_80))
            {
                continue;
            }
            local_81 = false;
            TDataObjectPtr<FConditionConfigBase> local_106 = local_80.GetConditionConfig();
            CastTo local_110;
            TDataObjectPtr<FLocalConditionConfig> local_134 = local_110.opCall();
            if (local_134)
            {
                TConstRawPtr<FConditionDialogueFinishConfig> local_164 = FInstancedStruct::GetPtr(local_134.Get().ConditionTypeDefineConfig).opCall();
                if (local_164)
                {
                    TDataObjectPtr<FDialogueLineConfig> local_190 = local_164.Get().CheckOption;
                    if (local_190.IsSet())
                    {
                        if ((local_56 == nullptr) || !(local_56.opArrow().GetOptionHistory().Contains(local_190.Get().GetDataName())))
                        {
                            continue;
                        }
                    }
                    if (int(local_26.Get().DialogueScope) == 2)
                    {
                        local_81 = true;
                    }
                    else
                    {
                        if (int(local_26.Get().DialogueScope) == 0)
                        {
                            if ((Event.PlayerEntity == ::ConditionUtils_Internal::FindLocalConditionInstanceData(local_80.GetLocalConditionInstanceID()).GetContextEntity()))
                            {
                                local_81 = true;
                            }
                        }
                        else
                        {
                            XError(ELog(58), FString().Append("UpdateDialogueFinishCondition Failed, unsupported dialogue scope: ").Append(local_26.Get().DialogueScope));
                        }
                    }
                }
            }
            if (local_81)
            {
                ::ConditionUtils::SetLocalConditionValueForInstance(local_80, (::ConditionUtils::GetCurrentValue(local_80) + 1));
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateDialogueFinishCondition() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        TECSEventConstIterator<FCE_DialogueRequestEnd> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_DialogueRequestEnd& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            if (!(local_70.Validate()) == !(false))
            {
                XError(ELog(3), (FString("Validate Failed: FCE_DialogueRequestEnd, sender") + local_70.Sender.ToString()));
                continue;
            }
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_UpdateDialogueFinishCondition(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


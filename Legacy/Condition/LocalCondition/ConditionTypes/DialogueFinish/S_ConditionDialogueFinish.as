

class US_ConditionDialogueFinish : UECSScriptSystem
{
    US_ConditionDialogueFinish()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateDialogueFinishCondition(const FCE_DialogueRequestEnd &inout Event, const FCS_LocalConditionSubscriptionManager &inout SubscriptionManager) const
    {
        bool local_1;
        bool local_81;
        int local_216 = 0;
        if (Event.bInterrupted)
        {
            return;
        }
        if (!(::DialogueUtils::GetDialogueConfig(Event.DialogueContextEntity).IsSet()))
        {
            return;
        }
        FName local_54;
        local_54.GetDataName();
        FName local_52 = local_54;
        TConstRawPtr<FDialogueHistory> local_56 = nullptr;
        Get local_62;
        const FC_DialogueStateCache& local_64 = local_62.opCall();
        if (local_64)
        {
            local_56 = local_64.HistoryCache.Find(local_52);
        }
        CastTo local_110;
        for (auto& local_80 : SubscriptionManager.GetHandleList(UConditionDialogueFinish, local_52).ConditionInstances)
        {
            if (::ConditionUtils::IsReached(local_80))
            {
                continue;
            }
            local_1 = false;
            local_81 = local_1;
            TDataObjectPtr<FConditionConfigBase> local_106 = local_80.GetConditionConfig();
            if (local_110.opCall())
            {
                FInstancedStruct::GetPtr local_162;
                if (local_162.opCall())
                {
                    TDataObjectPtr<FDialogueLineConfig> local_190;
                    if (local_190.IsSet())
                    {
                        if ((local_56 == nullptr))
                        {
                            local_1 = true;
                        }
                        else
                        {
                            local_54.GetDataName();
                            local_1 = !(local_56.opArrow().GetOptionHistory().Contains(local_54));
                        }
                        if (local_1)
                        {
                            continue;
                        }
                    }
                    if (local_216 == 2)
                    {
                        local_81 = true;
                    }
                    else
                    {
                        int local_218 = local_216;
                        if (local_218 == 0)
                        {
                            if ((Event.PlayerEntity == ::ConditionUtils_Internal::FindLocalConditionInstanceData(local_80.GetLocalConditionInstanceID()).GetContextEntity()))
                            {
                                local_81 = true;
                            }
                        }
                        else
                        {
                            FString local_228 = FString();
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
                FString local_80 = "Validate Failed: FCE_DialogueRequestEnd, sender";
                FString local_76 = local_70.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_UpdateDialogueFinishCondition(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


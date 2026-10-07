

class US_CompanionBehaviorSystem : UECSScriptSystem
{
    UPROPERTY()
    UDataTable PromptDataTable;

    US_CompanionBehaviorSystem()
    {
        return;
    }
    void PawnEntitySpeak(const FECSEntity &inout PawnEntity, const FString &inout SpeakContent) const
    {
        0.SpeakingInfo = SpeakContent;
        return;
    }
    UFUNCTION()
    void HandleChatForNPCChatCallBack(const FString &inout CallBackContent, const FNPCInfoMapWrapper &inout NPCInfoMap) const
    {
        FString local_4;
        NPCInfoMap.FNPCInfoMapData.Find("TestNPCInfo", local_4);
        FString local_10 = "HandleChatForNPCChatCallBack: ";
        FString local_10_2 = "HandleChatForNPCChatCallBack Map Data: ";
        return;
    }
    UFUNCTION()
    void HandleChatForGPTCallBack(const FECSEntity &inout PawnEntity, const FString &inout CallBackContent) const
    {
        FString local_6 = "HandleChatForGPTCallBack: ";
        FName local_2 = PawnEntity.GetEntityName();
        ELog local_10;
        FString local_6_2 = (local_10 + " ");
        return;
    }
    UFUNCTION()
    void Job_HandlePawnEntitySpeakingInfo(const FECSEntity &inout PawnEntity, FC_CompanionSpeakingInfo &inout CompanionSpeakingInfo) const
    {
        int local_12 = 0;
        if (!(CompanionSpeakingInfo.SpeakingInfo.IsEmpty()))
        {
            FFPTime local_8 = FFPTime(-1);
            local_12.SpeakPawnEntity = PawnEntity;
            local_12.SpeakContent = CompanionSpeakingInfo.SpeakingInfo;
            CompanionSpeakingInfo.SpeakingInfo = "";
        }
        return;
    }
    UFUNCTION()
    void Job_HandlePawnEntityChat(const FCE_EntityActorSpeakEvent &inout Event) const
    {
        FECSEntity local_4 = Event.SpeakPawnEntity;
        ::FLLMUtils::EntitySpeak(local_4, FString(Event.SpeakContent));
        return;
    }
    UFUNCTION()
    void ServerJob_TryTriggerCompanionBehavior(const FECSEntity &inout PawnEntity, FC_CompanionBehaviorInfo &inout CompanionBehaviorInfo) const
    {
        Get local_130;
        int local_164 = 0;
        FECSRuntimeView local_40 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Exclude(local_40).opCall();
        Include local_48;
        local_48.opCall();
        FECSRuntimeViewIterator local_82 = local_40.Iterator();
        for (; local_82.CanProceed;)
        {
            const FECSEntity& local_120 = local_82.Proceed();
            FVector local_126 = local_130.opCall().GetPosition();
            float32 local_141 = float32(local_126.Dist2D(FVector(local_130.opCall().GetPosition())));
            float32 local_142 = 400.0f;
            FString local_150 = ::FASCommonUtils::GetEntityLowerName(PawnEntity);
            FString local_146 = ::FASCommonUtils::GetEntityLowerName(local_120);
            if (CompanionBehaviorInfo.GetDistCloseEntities().Contains(local_120))
            {
                if (local_141 <= local_142)
                {
                    continue;
                }
                ::FPrologUtils::RetractFact2("entity_dist_close", local_150, local_146);
            }
            if (local_141 <= local_142)
            {
                FFPTime local_162 = FFPTime(-1);
                local_164.TargetPawnEntity = local_120;
                CompanionBehaviorInfo.GetModify_DistCloseEntities().Add(local_120);
                ::FPrologUtils::AddFact2("entity_dist_close", local_150, local_146, true);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleEventTriggerCompanionBehavior(const FCE_TriggerCompanionBehavior &inout Event) const
    {
        FString local_76;
        FString local_80;
        FString local_146;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        FString local_12 = ::FASCommonUtils::GetEntityLowerName(local_4);
        FECSEntity local_16 = Event.TargetPawnEntity;
        FString local_8 = ::FASCommonUtils::GetEntityLowerName(local_16);
        TArray<FString> local_24;
        TArray<FString> local_28;
        FString local_36_2 = (((((FString("entity_action(") + local_12)) + ",")) + local_8);
        FString local_20_2 = (local_36_2 + ", Action, ActionTarget)");
        FPlQuery local_56 = FPlQuery(local_20_2);
        FPlQueryAllResult local_62 = local_56.AllSolutionAndClose();
        int local_69 = 0;
        for (; local_69 < int(local_62.Num); )
        {
            local_28.Add(local_76);
            local_24.Add(local_80);
            ++local_69;
        }
        if (!(local_28.IsEmpty()))
        {
            int local_81 = FMath::RandRange(0, (local_28.Num() - 1));
            local_76 = local_28[local_81];
            local_80 = local_24[local_81];
            FEntityFactExtraInfo local_86;
            bool local_72 = ::FFactUtils::GetPawnEntityFactExtraInfo(local_16, local_86);
            if (local_72)
            {
                FName local_96;
                FString local_92 = local_86.ShowName;
                this.PromptDataTable.FindRow(n"Shuijing_React", local_96);
                TMap<FString, FString> local_116;
                local_116.Add("{$Memory}", ::FEntityMemoryUtils::ConstructMemoryPromptFragment(local_4));
                FString local_120 = FString().Append("еџЋдё»еҐіе„їењЁй‡Ће¤–йЃ‡е€°").Append(local_92);
                if (::FPrologUtils::Is(FString().Append("entity_action_memory(").Append(local_12).Append(", ").Append(local_8).Append(", ").Append(local_76).Append(")"), false))
                {
                    TMap<FString, FString> local_142;
                    if (::FPrologUtils::GetFirstQueryMapResult(FString().Append("action_emotion(").Append(local_76).Append(", Emotion)"), local_142))
                    {
                        local_142.Find("Emotion", local_146);
                        FString local_150 = "take_a_glance";
                        FString local_154 = FString(FString().Append("entity_action_memory(").Append(local_12).Append(", ").Append(local_8).Append(", ").Append(local_150).Append(")"));
                        FString local_158 = FString().Append(local_12).Append(" ").Append(local_8).Append(" ").Append(local_150).Append(" target, EmotionValue:").Append(local_146);
                        XLog(ELog(0), FString().Append("CompanionBehaviorLog: ").Append(local_158));
                        ::FCompanionBehaviorUitls::ShowBehaviorStringOnHead(local_4, local_158);
                        if (!(::FPrologUtils::Is(local_154, false)))
                        {
                            ::FPrologUtils::AddFact(local_154, true, true);
                        }
                    }
                }
                else
                {
                    FString local_158_2 = FString().Append("entity_action_memory(").Append(local_12).Append(", ").Append(local_8).Append(", ").Append(local_76).Append(")");
                    local_146 = FString(FString().Append(local_12).Append(" ").Append(local_8).Append(" ").Append(local_76).Append(" ").Append(local_80));
                    XLog(ELog(0), FString().Append("CompanionBehaviorLog: ").Append(local_146));
                    ::FCompanionBehaviorUitls::ShowBehaviorStringOnHead(local_4, local_146);
                    if (!(::FPrologUtils::Is(local_158_2, false)))
                    {
                        ::FPrologUtils::AddFact(local_158_2, true, true);
                    }
                    if ((local_76 == "say_hi"))
                    {
                        local_116.Add("{$Task}", FString().Append(local_120).Append("пјЊз”ЁдёЂеЏҐиЇќејЂеїѓзљ„еЇ№").Append(local_92).Append("еЏЈиЇ­еЊ–ењ°ж‰“ж‹›е‘јгЂ‚\nж №жЌ®иЎЊеЉЁеЋ†еЏІиЇґе‡єдёЌдёЂж ·зљ„иЇќ"));
                        ::FLLMUtils::RequestChatForGPT(local_4, ::FLLMUtils::PromptFormat(local_96.PromptContent, local_116));
                    }
                    else
                    {
                        if ((local_76 == "scared"))
                        {
                            local_116.Add("{$Task}", FString().Append(local_120).Append("пјЊз”ЁдёЂеЏҐиЇќе®іжЂ•ењ°еЇ№").Append(local_92).Append("еЏЈиЇ­еЊ–ењ°и®©е®ѓиµ°ејЂгЂ‚\nж №жЌ®иЎЊеЉЁеЋ†еЏІиЇґе‡єдёЌдёЂж ·зљ„иЇќ"));
                            ::FLLMUtils::RequestChatForGPT(local_4, ::FLLMUtils::PromptFormat(local_96.PromptContent, local_116));
                        }
                        else
                        {
                            if ((local_76 == "poor_for"))
                            {
                                FString local_150_2 = FString();
                                local_116.Add("{$Task}", local_150_2.Append(local_120).Append("пјЊз”ЁдёЂеЏҐиЇќйљѕиї‡ењ°еЇ№").Append(local_92).Append("еЏЈиЇ­еЊ–ењ°иЎЁиѕѕеѕ€еЏЇжЂње®ѓгЂ‚\nж №жЌ®иЎЊеЉЁеЋ†еЏІиЇґе‡єдёЌдёЂж ·зљ„иЇќ"));
                                FString local_150_3 = ::FLLMUtils::PromptFormat(local_96.PromptContent, local_116);
                                ::FLLMUtils::RequestChatForGPT(local_4, local_150_3);
                            }
                            else
                            {
                                if ((local_76 == "like"))
                                {
                                    local_116.Add("{$Task}", FString().Append(local_120).Append("пјЊз”ЁдёЂеЏҐиЇќејЂеїѓењ°еЇ№").Append(local_92).Append("еЏЈиЇ­еЊ–ењ°иЎЁиѕѕе®ѓжј‚дє®гЂ‚\nж №жЌ®иЎЊеЉЁеЋ†еЏІиЇґе‡єдёЌдёЂж ·зљ„иЇќ"));
                                    ::FLLMUtils::RequestChatForGPT(local_4, ::FLLMUtils::PromptFormat(local_96.PromptContent, local_116));
                                }
                                else
                                {
                                    if ((local_76 == "admire"))
                                    {
                                        local_116.Add("{$Task}", local_76.Append(local_120).Append("пјЊз”ЁдёЂеЏҐиЇќејЂеїѓењ°еЇ№").Append(local_92).Append("еЏЈиЇ­еЊ–ењ°иЎЁиѕѕе®ѓеѕ€й…·гЂ‚\nж №жЌ®иЎЊеЉЁеЋ†еЏІиЇґе‡єдёЌдёЂж ·зљ„иЇќ"));
                                        ::FLLMUtils::RequestChatForGPT(local_4, ::FLLMUtils::PromptFormat(local_96.PromptContent, local_116));
                                    }
                                }
                            }
                        }
                    }
                }
                FC_BehaviorSpeakingTag local_166;
                Assign local_164;
                local_164.opCall(local_166);
                SendEvent local_170;
                local_170.opCall((ECS::GetContextTime() + FFPTime(5)));
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleEventSpeakingDelayTime(const FCE_CompanionSpeakingDelayEvent &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        Remove local_8;
        local_8.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_ClearCompanionBehaviorString(const FCE_ClearCompanionBehaviorString &inout Event) const
    {
        int local_10 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        local_10.SetShowBehaviorStringOnHead("");
        return;
    }
    UFUNCTION()
    void Run_Job_HandlePawnEntitySpeakingInfo() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_HandlePawnEntitySpeakingInfo(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_HandlePawnEntitySpeakingInfo(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandlePawnEntityChat() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityActorSpeakEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityActorSpeakEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandlePawnEntityChat(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TryTriggerCompanionBehavior() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ServerJob_TryTriggerCompanionBehavior(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_TryTriggerCompanionBehavior(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleEventTriggerCompanionBehavior() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TriggerCompanionBehavior> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TriggerCompanionBehavior& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleEventTriggerCompanionBehavior(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleEventSpeakingDelayTime() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CompanionSpeakingDelayEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CompanionSpeakingDelayEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleEventSpeakingDelayTime(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ClearCompanionBehaviorString() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClearCompanionBehaviorString> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClearCompanionBehaviorString& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_ClearCompanionBehaviorString(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


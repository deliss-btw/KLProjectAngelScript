

class US_EcosimAIV2LLMSystem : UECSScriptSystem
{
    US_EcosimAIV2LLMSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleHttpCallBack() const
    {
        int local_46 = 0;
        UEcosimAIV2LLMGISubsystem local_6 = ::FEcosimAIV2Utils::GetEcosimAIV2LLMGISystem(ECS::GetUEWorld());
        if (!(local_6.LLMCallbackContextList.IsEmpty()))
        {
            for (auto& local_22 : local_6.LLMCallbackContextList)
            {
                if ((FName(local_22.NPCInfoMap.CallBackType) == n"EntityPublicSpeakBySimpleLLM"))
                {
                    ::FEcosimAIV2Utils::HandleEntityPublicSpeakBySimpleLLMCallBack(local_22.Query, local_22.NPCInfoMap);
                    continue;
                }
                if ((FName(local_22.NPCInfoMap.CallBackType) == n"EntityGetLLMCallBack"))
                {
                    FString local_30;
                    if (!(local_22.NPCInfoMap.CallBackContentList.IsEmpty()))
                    {
                        local_30 = local_22.NPCInfoMap.CallBackContentList[0];
                    }
                    XLog(ELog(0), FString().Append("HandleDebugGenerateLLMWithPromptCallBack: Query:\n").Append(local_22.Query).Append(" \n\nCallBackContent:").Append(local_30).Append("\n"));
                    if (!(local_22.NPCInfoMap.ContextEntityList.IsEmpty()))
                    {
                        FECSEntity local_40 = FECSEntity(local_22.NPCInfoMap.ContextEntityList[0]);
                        local_46.ContentList.Add(local_30);
                    }
                }
            }
            local_6.LLMCallbackContextList.Empty(0);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleHttpCallBack() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.1))))
        {
            return;
        }
        this.Job_HandleHttpCallBack();
        return;
    }
}


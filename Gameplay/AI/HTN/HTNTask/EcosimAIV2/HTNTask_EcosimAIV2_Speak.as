

class UHTNTask_EcosimAIV2_TriggerLLMSpeak : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId SourceEntityID;
    UPROPERTY()
    FString PromptFileName;
    UPROPERTY()
    bool bNeedMemory;
    UPROPERTY()
    TMap<FString, FString> ReplaceContentMap;

    UHTNTask_EcosimAIV2_TriggerLLMSpeak()
    {
        this.bNeedMemory = true;
        this.SourceEntityID.SetKey(n"SelfEntity");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_12 = FECSEntity(this.SourceEntityID.GetValue(Context.opImplConv()));
        if (local_12.IsValid())
        {
            TMap<FString, FString> local_34 = this.ReplaceContentMap;
            if (this.bNeedMemory)
            {
                Get local_38;
                const FC_EcosimAIV2LLMSpeakMemory& local_40 = local_38.opCall();
                if (local_40)
                {
                    FString local_44;
                    for (auto& local_58 : local_40.SpeakMemoryContentList)
                    {
                        FString local_62 = (local_58 + "\n");
                        local_44 += local_62;
                    }
                    local_34.Add("MemoryContent", local_44);
                }
            }
            ::FEcosimAIV2Utils::EntityPublicSpeakByLLM(local_12, this.PromptFileName, local_34);
            this.FinishExecuteWithContext(Context, true);
        }
        else
        {
            this.FinishExecuteWithContext(Context, false);
        }
        return;
    }
}

class UHTNTask_EcosimAIV2_GetLLMCallBACK : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId SourceEntityID;
    UPROPERTY()
    FString PromptFileName;
    UPROPERTY()
    bool bNeedMemory;
    UPROPERTY()
    TMap<FString, FAISmart_Name> ReplaceContentMap;
    UPROPERTY()
    FBlackboardKeySelector CallBackContent;

    default SetNodeName("GetLLMCallBack");

    UHTNTask_EcosimAIV2_GetLLMCallBACK()
    {
        this.bNeedMemory = true;
        this.SourceEntityID.SetKey(n"SelfEntity");
        this.CallBackContent.AddNameFilter(this, n"CallBackContent");
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FName local_56;
        FECSEntity local_12 = FECSEntity(this.SourceEntityID.GetValue(Context.opImplConv()));
        if (local_12.IsValid())
        {
            TMap<FString, FString> local_34;
            for (auto& local_52 : this.ReplaceContentMap)
            {
                FAISmartValueContext local_6 = Context.opImplConv();
                FString local_64;
                if (local_56.IsNone())
                {
                    local_64 = "";
                }
                else
                {
                    local_64 = local_56.ToString();
                }
                local_34.Add(local_52.GetKey(), local_64);
            }
            if (this.bNeedMemory)
            {
                Get local_68;
                const FC_EcosimAIV2LLMSpeakMemory& local_70 = local_68.opCall();
                if (local_70)
                {
                    FString local_74 = "и‡Єе·±еЇ№зЋ©е®¶иЇґиЇќзљ„еЋ†еЏІ:\n";
                    for (auto& local_88 : local_70.SpeakMemoryContentList)
                    {
                        FString local_60 = (local_88 + "\n");
                        local_74 += local_60;
                    }
                    local_34.Add("MemoryContent", local_74);
                }
            }
            Modify local_92;
            FC_EcosimAIV2LLMCallBack& local_94 = local_92.opCall();
            if (local_94)
            {
                local_94.ContentList.Empty(0);
            }
            ::FEcosimAIV2Utils::EntityGetLLMCallBack(local_12, this.PromptFileName, local_34);
        }
        else
        {
            this.FinishExecuteWithContext(Context, false);
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaSeconds)
    {
        FECSEntity local_12 = FECSEntity(this.SourceEntityID.GetValue(Context.opImplConv()));
        Get local_16;
        const FC_EcosimAIV2LLMCallBack& local_18 = local_16.opCall();
        if (local_18)
        {
            if (!(local_18.ContentList.IsEmpty()))
            {
                HTNNode::SetWorldStateValueAsName(Context, this.CallBackContent, FName(local_18.ContentList[0]));
                this.FinishExecuteWithContext(Context, true);
            }
        }
        return;
    }
}

struct FHTNTask_EntityPublicSpeakByTypeWriterStyleInstanceData
{
    UPROPERTY()
    float32 TypeWriterStyleTimeCount = 0.0f;
    UPROPERTY()
    float32 TimeCountAfterFinished = 0.0f;
    UPROPERTY()
    bool bStartWaitToEnd = false;
    UPROPERTY()
    bool bIsPausedForPunctuation = false;
    UPROPERTY()
    float32 PunctuationPauseTimeCount = 0.0f;
    UPROPERTY()
    int LastProcessedCharacterIndex = 0;
    UPROPERTY()
    float32 NextCharacterTime = 0.0f;


}

class UHTNTask_EcosimAIV2_EntityPublicSpeakByTypeWriterStyle : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityID;
    UPROPERTY()
    FAISmart_Name Content;
    UPROPERTY()
    int NumberOfWordPersecond;
    UPROPERTY()
    float32 DurationAfterFinished;
    float32 PunctuationWaitTime;
    float32 BaseCharacterDelay;
    float32 PunctuationCharacterDelay;
    float32 SpaceDelay;
    bool bUseNaturalTiming;

    default SetNodeName("EntityPublicSpeakByTypeWriterStyle");

    UHTNTask_EcosimAIV2_EntityPublicSpeakByTypeWriterStyle()
    {
        this.NumberOfWordPersecond = 20;
        this.DurationAfterFinished = 5.0f;
        this.PunctuationWaitTime = 0.5f;
        this.BaseCharacterDelay = 0.05f;
        this.PunctuationCharacterDelay = 0.3f;
        this.SpaceDelay = 0.1f;
        this.bUseNaturalTiming = true;
        this.EntityID.SetKey(n"SelfEntity");
        return;
    }
    UFUNCTION()
    UScriptStruct GetInstanceDataType_Implementation() const
    {
        return FHTNTask_EntityPublicSpeakByTypeWriterStyleInstanceData;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FHTNTask_EntityPublicSpeakByTypeWriterStyleInstanceData local_2;
        local_2.TypeWriterStyleTimeCount = 0.0f;
        local_2.TimeCountAfterFinished = 0.0f;
        local_2.bStartWaitToEnd = false;
        local_2.bIsPausedForPunctuation = false;
        local_2.PunctuationPauseTimeCount = 0.0f;
        local_2.LastProcessedCharacterIndex = 0;
        local_2.NextCharacterTime = 0.0f;
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaSeconds)
    {
        FHTNTask_EntityPublicSpeakByTypeWriterStyleInstanceData& local_2;
        FECSEntity local_14 = FECSEntity(this.EntityID.GetValue(Context.opImplConv()));
        if (local_14.IsValid())
        {
            FString local_26 = this.Content.GetValue(Context.opImplConv()).ToString();
            if (local_2.bIsPausedForPunctuation)
            {
                local_2.PunctuationPauseTimeCount = (local_2.PunctuationPauseTimeCount + DeltaSeconds);
                if (local_2.PunctuationPauseTimeCount >= this.PunctuationWaitTime)
                {
                    local_2.bIsPausedForPunctuation = false;
                    local_2.PunctuationPauseTimeCount = 0.0f;
                }
                return;
            }
            if (!(local_2.bStartWaitToEnd))
            {
                bool local_15;
                local_15 = this.bUseNaturalTiming;
                if (local_15)
                {
                    float32 local_28_2 = local_2.TypeWriterStyleTimeCount;
                    local_2.TypeWriterStyleTimeCount = (local_28_2 + DeltaSeconds);
                    int local_30 = int(local_2.LastProcessedCharacterIndex);
                    while (local_30 < local_26.Len() && ((local_2.TypeWriterStyleTimeCount >= local_2.NextCharacterTime)))
                    {
                        int local_32;
                        local_32 = int(local_2.LastProcessedCharacterIndex);
                        FString local_20 = local_26.Mid(local_32, 1);
                        ++local_2.LastProcessedCharacterIndex;
                        local_28_2 = this.GetCharacterDelay(local_26, local_32);
                        float32 local_27_2 = local_2.NextCharacterTime + local_28_2;
                        local_2.NextCharacterTime = local_27_2;
                        if ((local_20 == "пјЊ") || (local_20 == "гЂ‚") || (local_20 == "пјџ") || (local_20 == "пјЃ"))
                        {
                            local_15 = true;
                            local_2.bIsPausedForPunctuation = local_15;
                            local_27_2 = 0.0f;
                            local_2.PunctuationPauseTimeCount = 0.0f;
                            break;
                        }
                        else
                        {
                        }
                    }
                    ::FEcosimAIV2Utils::SetEntityDialogContent(local_14, local_26.Left(int(local_2.LastProcessedCharacterIndex)));
                    local_30 = local_26.Len();
                    local_15 = int(local_2.LastProcessedCharacterIndex) >= local_30 && !(local_2.bStartWaitToEnd);
                    if (local_15)
                    {
                        local_2.bStartWaitToEnd = true;
                        ::FEcosimAIV2Utils::EntityPublicSpeak(local_14, local_26, this.DurationAfterFinished);
                        ::FEcosimAIV2Utils::AddLLMSpeakMemoryToEntity(local_14, local_26);
                    }
                }
                else
                {
                    float32 local_28_3 = local_2.TypeWriterStyleTimeCount + DeltaSeconds;
                    local_2.TypeWriterStyleTimeCount = local_28_3;
                    local_28_3 = this.NumberOfWordPersecond;
                    local_28_3 = local_28_3 * local_2.TypeWriterStyleTimeCount;
                    int local_30_2 = FMath::FloorToInt(local_28_3);
                    if (local_30_2 <= local_26.Len())
                    {
                        int local_38;
                        int local_37;
                        local_37 = int(local_2.LastProcessedCharacterIndex);
                        local_38 = local_37;
                        while (local_15)
                        {
                            FString local_20_2 = local_26.Mid(local_38, 1);
                            local_37 = local_38 + 1;
                            if ((local_20_2 == "пјЊ") || (local_20_2 == "гЂ‚") || (local_20_2 == "пјџ") || (local_20_2 == "пјЃ"))
                            {
                                local_2.bIsPausedForPunctuation = true;
                                local_28_3 = 0.0f;
                                local_2.PunctuationPauseTimeCount = 0.0f;
                                break;
                            }
                            ++local_38;
                            if (local_38 >= local_30_2)
                            {
                                local_15 = false;
                                continue;
                            }
                            local_15 = (local_38 < local_26.Len());
                        }
                        local_2.LastProcessedCharacterIndex = local_37;
                        ::FEcosimAIV2Utils::SetEntityDialogContent(local_14, local_26.Left(local_37));
                    }
                    else
                    {
                        if (!(local_2.bStartWaitToEnd))
                        {
                            local_2.bStartWaitToEnd = true;
                            ::FEcosimAIV2Utils::EntityPublicSpeak(local_14, local_26, this.DurationAfterFinished);
                            ::FEcosimAIV2Utils::AddLLMSpeakMemoryToEntity(local_14, local_26);
                        }
                    }
                }
            }
            if (local_2.bStartWaitToEnd)
            {
                float32 local_28_4 = local_2.TimeCountAfterFinished;
                local_2.TimeCountAfterFinished = (local_28_4 + DeltaSeconds);
                local_28_4 = local_2.TimeCountAfterFinished;
                if (local_28_4 >= this.DurationAfterFinished)
                {
                    this.FinishExecuteWithContext(Context, true);
                }
            }
        }
        return;
    }
    FHTNTask_EntityPublicSpeakByTypeWriterStyleInstanceData GetInstanceData(const FHTNContext &inout Context) const
    {
        FHTNTask_EntityPublicSpeakByTypeWriterStyleInstanceData __r;
        return __r;
    }
    int GetPunctuationCount(const FString &inout Str)
    {
        int local_1 = 0;
        int local_3 = 0;
        for (; local_3 < Str.Len(); ++local_3)
        {
            FString local_14 = Str.Mid(local_3, 1);
            if ((local_14 == "пјЊ") || (local_14 == "гЂ‚") || (local_14 == "пјџ") || (local_14 == "пјЃ"))
            {
                ++local_1;
            }
        }
        return local_1;
    }
    float32 GetCharacterDelay(const FString &inout ContentStr, const int CharIndex)
    {
        if (!(this.bUseNaturalTiming))
        {
            return float32((1.0 / this.NumberOfWordPersecond));
        }
        if (CharIndex >= ContentStr.Len())
        {
            return this.BaseCharacterDelay;
        }
        FString local_16 = ContentStr.Mid(CharIndex, 1);
        FString local_26;
        if (CharIndex > 0)
        {
            local_26 = ContentStr.Mid(CharIndex - 1, 1);
        }
        else
        {
            local_26 = "";
        }
        if (CharIndex < (ContentStr.Len() - 1))
        {
            FString local_12 = ContentStr.Mid(CharIndex + 1, 1);
        }
        else
        {
            FString local_12_2 = "";
        }
        if ((local_26 == "пјЊ") || (local_26 == "гЂ‚") || (local_26 == "пјџ") || (local_26 == "пјЃ"))
        {
            return (this.BaseCharacterDelay * 1.1f);
        }
        bool local_1 = (local_16 == " ") || (local_16 == "\n");
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            local_1 = (local_16 == "	");
        }
        if (local_1)
        {
            return this.SpaceDelay;
        }
        if ((local_16 == "е•Љ") || (local_16 == "е‘ў") || (local_16 == "еђ§") || (local_16 == "е“¦") || (local_16 == "е—Ї") || (local_16 == "е”‰"))
        {
            return (this.BaseCharacterDelay * 1.5f);
        }
        if ((local_16 == "е“Ћ") || (local_16 == "е’¦") || (local_16 == "е“‡") || (local_16 == "е‘Ђ") || (local_16 == "еї") || (local_16 == "е’і"))
        {
            return (this.BaseCharacterDelay * 1.8f);
        }
        if (CharIndex == 0 || (local_26 == "гЂ‚") || (local_26 == "пјџ") || (local_26 == "пјЃ"))
        {
            return (this.BaseCharacterDelay * 1.3f);
        }
        if ((local_26 == local_16))
        {
            return (this.BaseCharacterDelay * 0.7f);
        }
        return this.BaseCharacterDelay;
    }
}


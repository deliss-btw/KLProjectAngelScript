

class UEcosimAIV2LLMGISubsystem : UScriptGameInstanceSubsystem
{
    TArray<FEcosimAIV2LLMCallbackContext> LLMCallbackContextList;

    UEcosimAIV2LLMGISubsystem()
    {
        return;
    }
    UFUNCTION()
    void HttpCallBack(const FString &inout Query, const FNPCInfoMapWrapper &inout NPCInfoMap)
    {
        FEcosimAIV2LLMCallbackContext local_36;
        local_36.Query = Query;
        local_36.NPCInfoMap = NPCInfoMap;
        this.LLMCallbackContextList.Add(local_36);
        return;
    }
    UFUNCTION()
    void HandleDebugLLMCallBack(const FString &inout Query, const FNPCInfoMapWrapper &inout NPCInfoMap) const
    {
        FString local_4;
        if (!(NPCInfoMap.CallBackContentList.IsEmpty()))
        {
            local_4 = NPCInfoMap.CallBackContentList[0];
        }
        XLog(ELog(0), FString().Append("HandleDebugGenerateLLMWithPromptCallBack: Query:\n").Append(Query).Append(" \n\nCallBackContent:").Append(local_4).Append("\n"));
        return;
    }
    void EntityGetLLMCallBack(const FECSEntity &inout Entity, const FString &inout PromptFileName, const TMap<FString, FString> &inout PromptVarRelaceMap)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void EntityPublicSpeakByLLM(const FECSEntity &inout Entity, const FString &inout PromptFileName, const TMap<FString, FString> &inout PromptVarRelaceMap)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void EntityPublicSpeakBySimpleLLM(const FString &inout PromptFileName, const FString &inout AdditionalContext, const FECSEntity &inout Entity)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}


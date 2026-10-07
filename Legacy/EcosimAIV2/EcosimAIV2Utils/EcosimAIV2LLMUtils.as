
namespace FEcosimAIV2Utils
{
bool GetPromptFromRelativePath(const FString &inout RelativePath, FString &inout PromptData)
{
    FString local_12 = (FPaths::ProjectDir() + "Content/MoleRes/Test/Data/AIGC/Prompt/ZH/");
    FString local_12_2 = ((local_12 + RelativePath) + ".txt");
    if (FFileHelper::LoadFileToString(PromptData, local_12_2, FFileHelper::EHashOptions(0), 4))
    {
        return true;
    }
    else
    {
        XError(ELog(0), FString().Append("Could Not Find File When GetPromptFromRelativePath From : ").Append(local_12_2));
        return false;
    }
}
FString ReplacePromptVar(const FString &inout Prompt, const TMap<FString, FString> &inout PromptVarRelaceMap)
{
    FString local_4 = Prompt;
    for (auto& local_24 : PromptVarRelaceMap)
    {
        local_24;
        FString local_28 = FString();
        FString local_38;
        local_4 = local_38;
    }
    return local_4;
}
UEcosimAIV2LLMGISubsystem SomeOtherWorldTest(const UWorld World)
{
    UEcosimAIV2LLMGISubsystem local_2;
    return local_2;
}
UEcosimAIV2LLMGISubsystem GetEcosimAIV2LLMGISystem(const UWorld World)
{
    return Cast<UEcosimAIV2LLMGISubsystem>(UGameSubSystemBase::GetSubsystem(World, UEcosimAIV2LLMGISubsystem));
}
void DebugChatWithLLM(const FString &inout Prompt)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
void EntityPublicSpeakBySimpleLLM(const FString &inout PromptFileName, const FString &inout AdditionalContext, const FECSEntity &inout Entity)
{
    FEcosimAIV2Utils::GetEcosimAIV2LLMGISystem(ECS::GetUEWorld()).EntityPublicSpeakBySimpleLLM(PromptFileName, AdditionalContext, Entity);
    return;
}
void EntityPublicSpeakByLLM(const FECSEntity &inout Entity, const FString &inout PromptFileName, const TMap<FString, FString> &inout PromptVarRelaceMap)
{
    FEcosimAIV2Utils::GetEcosimAIV2LLMGISystem(ECS::GetUEWorld()).EntityPublicSpeakByLLM(Entity, PromptFileName, PromptVarRelaceMap);
    return;
}
void EntityGetLLMCallBack(const FECSEntity &inout Entity, const FString &inout PromptFileName, const TMap<FString, FString> &inout PromptVarRelaceMap)
{
    FEcosimAIV2Utils::GetEcosimAIV2LLMGISystem(ECS::GetUEWorld()).EntityGetLLMCallBack(Entity, PromptFileName, PromptVarRelaceMap);
    return;
}
void AddLLMSpeakMemoryToEntity(const FECSEntity &inout Entity, const FString &inout Content)
{
    0.SpeakMemoryContentList.Add(Content);
    return;
}
void HandleEntityPublicSpeakBySimpleLLMCallBack(const FString &inout Query, const FNPCInfoMapWrapper &inout NPCInfoMap)
{
    FString local_4;
    if (!(NPCInfoMap.CallBackContentList.IsEmpty()))
    {
        local_4 = NPCInfoMap.CallBackContentList[0];
    }
    XLog(ELog(0), FString().Append("HandleDebugGenerateLLMWithPromptCallBack: Query:\n").Append(Query).Append(" \n\nCallBackContent:").Append(local_4).Append("\n"));
    if (!(NPCInfoMap.ContextEntityList.IsEmpty()))
    {
        FECSEntity local_16 = FECSEntity(NPCInfoMap.ContextEntityList[0]);
        FEcosimAIV2Utils::AddLLMSpeakMemoryToEntity(local_16, local_4);
        FEcosimAIV2Utils::EntityPublicSpeak(local_16, local_4, 5.0f);
    }
    return;
}
}

namespace FAIGenerationUtils
{
UFUNCTION()
void AIGenerateEnvData()
{
    FString local_4;
    FLLMUtils::GetStringDataFromMiscDir("AIData/AIGenEnvDataPrompt", local_4);
    TMap<FString, FString> local_26 = {{"temperature", "1.0"}};
    FLLMUtils::RequestQuestForGPTWithCallContext("", local_4, local_26, US_AIGeneration.GetDefaultObject(), n"HandleAIGenEnvDataPromptCallBack");
    return;
}
}

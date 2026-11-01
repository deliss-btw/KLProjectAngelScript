namespace FLLMUtils
{
struct FPromptData
{
    UPROPERTY()
    FString PromptContent;

    FPromptData()
    {
        return;
    }
}

UFUNCTION()
void MergeLLMCallArgs(TMap<FString, FString> &inout ArgBaseKeyValue, const TMap<FString, FString> &inout ArgAdditionalKeyValue)
{
    for (auto& local_20 : ArgAdditionalKeyValue)
    {
        ArgBaseKeyValue.Add(local_20.GetKey(), local_20.GetValue());
    }
    return;
}
UFUNCTION()
void RequestChatForGPT(const FECSEntity &inout PawnEntity, const FString &inout LLMContent)
{
    TMap<FString, FString> local_20 = {{"Url", "https://preklgpttest02.openai.azure.com/openai/deployments/gpt-4o/chat/completions?api-version=2024-02-15-preview"}, {"APIKEy", "be3d2ba80e3e4711945fd447d6a8130d"}, {"LLMContent", LLMContent}, {"temperature", "0.7"}, {"top_p", "0.95"}, {"stream", "true"}};
    Story::HttpRequestForGPT(local_20, PawnEntity, FLLMCallDelegate(US_CompanionBehaviorSystem.GetDefaultObject(), n"HandleChatForGPTCallBack"));
    return;
}
UFUNCTION()
void RequestQuestForGPTWithEntity(const FECSEntity &inout PawnEntity, const FString &inout LLMContent, const TMap<FString, FString> &inout ArgAdditionalKeyValue, const UObject Object, const FName &inout CallBackName)
{
    TMap<FString, FString> local_20 = {{"Url", "https://preklgpttest02.openai.azure.com/openai/deployments/gpt-4o/chat/completions?api-version=2024-02-15-preview"}, {"APIKEy", "be3d2ba80e3e4711945fd447d6a8130d"}, {"LLMContent", LLMContent}, {"temperature", "0.7"}, {"top_p", "0.95"}, {"stream", "true"}};
    FLLMUtils::MergeLLMCallArgs(local_20, ArgAdditionalKeyValue);
    Story::HttpRequestForGPT(local_20, PawnEntity, FLLMCallDelegate(Object, CallBackName));
    return;
}
UFUNCTION()
void RequestQuestForGPTWithCallContext(const FString &inout CallContext, const FString &inout LLMContent, const TMap<FString, FString> &inout ArgAdditionalKeyValue, const UObject Object, const FName &inout CallBackName)
{
    TMap<FString, FString> local_20 = {{"Url", "https://preklgpttest02.openai.azure.com/openai/deployments/gpt-4o/chat/completions?api-version=2024-02-15-preview"}, {"APIKEy", "be3d2ba80e3e4711945fd447d6a8130d"}, {"CallContext", CallContext}, {"LLMContent", LLMContent}, {"temperature", "0.7"}, {"top_p", "0.95"}, {"stream", "true"}};
    FLLMUtils::MergeLLMCallArgs(local_20, ArgAdditionalKeyValue);
    Story::HttpRequestForGPTWithCallContext(local_20, FLLMCallWithCallContextDelegate(Object, CallBackName));
    return;
}
UFUNCTION()
bool EntitySpeak(const FECSEntity &inout PawnEntity, const FString &inout Content)
{
    return false;
}
UFUNCTION()
FString PromptFormat(const FString &inout PromptContent, const TMap<FString, FString> &inout ReplaceMap)
{
    FString local_4 = PromptContent;
    for (auto& local_24 : ReplaceMap)
    {
        local_4 = local_4.Replace(local_24.GetKey(), local_24.GetValue(), ESearchCase(1));
    }
    return local_4;
}
UFUNCTION()
void TrimLF(FString &inout String)
{
    int local_1 = 0;
    for (; local_1 < (String.Len() - 1); ++local_1)
    {
        if (String.Find("\n", ESearchCase(1), ESearchDir(0), -1) == 0)
        {
            String = String::GetSubstring(String, 1, (String.Len() - 1));
            continue;
        }
        break;
    }
    int local_4 = 0;
    for (; local_4 < (String.Len() - 1); ++local_4)
    {
        int local_6 = String.Len() - 1;
        if (String.Find("\n", ESearchCase(1), ESearchDir(1), -1) == local_6)
        {
            local_6 = String.Len();
            local_6 = local_6 - 1;
            String = String::GetSubstring(String, 0, local_6);
            continue;
        }
        break;
    }
    return;
}
UFUNCTION()
bool GetLLMCallBackValueByKey(const FString &inout SourceString, const FString &inout Key, FString &out Result)
{
    FString local_4;
    Result = local_4;
    int local_9 = SourceString.Find(Key, ESearchCase(1), ESearchDir(0), -1);
    if (local_9 < 0)
    {
        return false;
    }
    int local_5 = SourceString.Find("[", ESearchCase(1), ESearchDir(0), local_9);
    if (local_5 < 0)
    {
        return false;
    }
    int local_11 = SourceString.Find("]", ESearchCase(1), ESearchDir(0), local_9);
    if (local_11 < 0)
    {
        return false;
    }
    int local_12 = local_5 + 1;
    int local_6 = local_11 - local_12;
    if (local_6 <= 0)
    {
        return false;
    }
    Result = String::GetSubstring(SourceString, local_12, local_6);
    return true;
}
UFUNCTION()
void AppendCandidateDataTo(const FString &inout FileName, const FString &inout AppendContent, const bool bIgnoreRepeated = false)
{
    FString local_12 = (FPaths::ProjectDir() + "Content/MoleRes/Dev/Misc/AIData/");
    FString local_8 = (local_12 + FileName);
    FString local_12_2 = (local_8 + ".txt");
    FString local_16;
    bool local_20 = FFileHelper::LoadFileToString(local_16, local_12_2, FFileHelper::EHashOptions(0), 4);
    if (bIgnoreRepeated)
    {
        if (local_16.Contains(AppendContent, ESearchCase(1), ESearchDir(0)))
        {
            return;
        }
    }
    bool local_17 = FFileHelper::SaveStringToFile(AppendContent, local_12_2, FFileHelper::EEncodingOptions(4), 8);
    if (!(local_17))
    {
        XError(ELog(0), FString().Append("AppendCandidateDataTo ").Append(local_12_2).Append(" Fail"));
    }
    return;
}
UFUNCTION()
bool GetLibraryDataFrom(const FString &inout FileName, FString &inout LibraryData)
{
    FString local_12 = (FPaths::ProjectDir() + "Content/MoleRes/Dev/Misc/AIData/");
    FString local_8 = (local_12 + FileName);
    FString local_12_2 = (local_8 + ".txt");
    return FFileHelper::LoadFileToString(LibraryData, local_12_2, FFileHelper::EHashOptions(0), 4);
}
UFUNCTION()
bool GetStringDataFromMiscDir(const FString &inout FileName, FString &inout LibraryData)
{
    FString local_12 = (FPaths::ProjectDir() + "Content/MoleRes/Dev/Misc/");
    FString local_8 = (local_12 + FileName);
    FString local_12_2 = (local_8 + ".txt");
    return FFileHelper::LoadFileToString(LibraryData, local_12_2, FFileHelper::EHashOptions(0), 4);
}
}

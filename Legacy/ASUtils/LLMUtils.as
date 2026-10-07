

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
        ArgBaseKeyValue.Add(local_20.GetKey());
    }
    return;
}
UFUNCTION()
void RequestChatForGPT(const FECSEntity &inout PawnEntity, const FString &inout LLMContent)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UFUNCTION()
void RequestQuestForGPTWithEntity(const FECSEntity &inout PawnEntity, const FString &inout LLMContent, const TMap<FString, FString> &inout ArgAdditionalKeyValue, const UObject Object, const FName &inout CallBackName)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UFUNCTION()
void RequestQuestForGPTWithCallContext(const FString &inout CallContext, const FString &inout LLMContent, const TMap<FString, FString> &inout ArgAdditionalKeyValue, const UObject Object, const FName &inout CallBackName)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
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
        local_24;
        FString local_30;
        local_4 = local_30;
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

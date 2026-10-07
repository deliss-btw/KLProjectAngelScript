
enum EAITokenRecoverMode
{
    Sequential,
    Parallel,
}


struct FEcosimAIV2UnitData : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FString Comment;
    UPROPERTY()
    TSoftClassPtr<AECSPrefab> RealWorldEntityPrefab;

    FEcosimAIV2UnitData()
    {
        return;
    }
}

struct FEcosimAIV2DialogueOption
{
    UPROPERTY()
    TArray<FInstancedStruct> ConditionList;
    UPROPERTY()
    FString OptionContent;
    UPROPERTY()
    FName SuccessRowName;
    UPROPERTY()
    FName FailRowName;

    FEcosimAIV2DialogueOption()
    {
        return;
    }
}

struct FInteractSimpleSpeakToAndOption : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<FInstancedStruct> ConditionList;
    UPROPERTY()
    FString SpeakToContent;
    UPROPERTY()
    TArray<FString> AdditionalSpeakToContentList;
    UPROPERTY()
    TArray<FName> CustomContextKeyList;
    UPROPERTY()
    TArray<FEcosimAIV2DialogueOption> OptionList;

    FInteractSimpleSpeakToAndOption()
    {
        return;
    }
}

struct FEcosimAIV2LLMPublicSpeakData : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FString Comment;
    UPROPERTY()
    FString ConstContent;
    UPROPERTY()
    float32 ConstDuration;
    UPROPERTY()
    FString PromptFileName;
    UPROPERTY()
    FString AdditionalContext;
    UPROPERTY()
    FGameplayTag SpeakKeyTag;
    UPROPERTY()
    float32 MinSpeakInterval = -1.0f;


}

struct FAITokenByTargetConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    float32 MinInteraval = -1.0f;
    UPROPERTY()
    int MaxTokenNum = 2;
    UPROPERTY()
    float32 TokenRecoverTime = 30.0f;
    UPROPERTY()
    EAITokenRecoverMode RecoverMode = EAITokenRecoverMode(0);


}


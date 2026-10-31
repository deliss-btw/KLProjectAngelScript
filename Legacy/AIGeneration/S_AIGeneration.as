class US_AIGeneration : UECSScriptSystem
{
    US_AIGeneration()
    {
        return;
    }
    UFUNCTION()
    void HandleAIGenEnvDataPromptCallBack(const FString &inout CallContext, const FString &inout CallBackContent) const
    {
        XError(ELog(0), (FString("HandleAIGenEnvDataPromptCallBack: \n") + CallBackContent));
        return;
    }
}


class UBTDecorator_CheckTestCVar : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    int UseHthAI;

    UBTDecorator_CheckTestCVar()
    {
        return;
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        return ::FDebugEcologyRefreshUtils::DebugCheckCVarIntValue(FEcologyMisc::CVar_Ecology_HTNAIBranch.GetInt(), this.UseHthAI);
    }
}


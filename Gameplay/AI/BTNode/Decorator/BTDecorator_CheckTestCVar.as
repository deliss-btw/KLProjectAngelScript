

// NOTE: class defaults are not authored in this module: UBTDecorator_CheckTestCVar (default scalar field UBTDecorator.FlowAbortMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

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




class UESMAction_OverrideSightConfig : UESMBPBaseSpanAction
{
    UPROPERTY()
    FName OverrideSightConfigKey;

    UESMAction_OverrideSightConfig()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        bool local_69 = false;
        const FECSEntity& local_2 = Context.GetEntity();
        if (!(local_8))
        {
            XError(ELog(0), FString().Append("AIKnowledgeLog: ").Append(local_2.GetEntityName()).Append(" Missing AIKnowledge Component When OverrideSightConfig"));
            return;
        }
        bool local_9 = (::FAIPerceptionUtils::GetPerceptionConfig(local_2) == nullptr) || (0 == 0);
        if (local_9)
        {
            local_9 = true;
        }
        else
        {
            local_69 = !local_69;
            local_9 = local_69;
        }
        if (local_9)
        {
            XError(ELog(0), FString().Append("AIKnowledgeLog: ").Append(local_2.GetEntityName()).Append(" Does Not Exist SightConfigKey:").Append(this.OverrideSightConfigKey.ToString()).Append(" When Try To Override In ESM"));
        }
        local_8.CurrentOverrideSightConfigKey = this.OverrideSightConfigKey;
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        if (!(local_8))
        {
            return;
        }
        local_8.CurrentOverrideSightConfigKey = NAME_None;
        return;
    }
}


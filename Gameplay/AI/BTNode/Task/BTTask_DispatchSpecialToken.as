class UBTTask_DispatchSpecialToken : UBTTask_ECSScriptBase
{
    UPROPERTY()
    TDataObjectPtr<FAISpecialCombatTokenConfig> SpecialToken;
    UPROPERTY()
    TArray<FAISmartValuePackSource> Params;
    UPROPERTY()
    FFPTime GenerateTokenDelay = 0;
    UPROPERTY()
    EAISpecialTokenDispatchMode DispatchMode = EAISpecialTokenDispatchMode(0);
    UPROPERTY()
    TArray<FAISmart_EntityId> TargetEntities;

    default SetNodeName("分发特殊Token");

    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        const UScriptStruct local_38;
        if (this.SpecialToken)
        {
            const FAISpecialCombatTokenConfig& local_4;
            TArray<FAISmart_AnyValue> local_8;
            local_8.SetNum(local_4.Params.Num());
            for (auto& local_24 : this.Params)
            {
                int local_9 = local_4.GetParamIndex(local_24.Name);
                if (local_9 == INDEX_NONE)
                {
                    XError(ELog(14), FString().Append("Failed to find ").Append(local_24.Name).Append(" in Config ").Append(local_4.GetDataName()));
                    continue;
                }
                const FAISmartValuePackItem& local_36 = local_4.Params[local_9];
                if (local_38 != local_24.Value.GetValueType())
                {
                    XError(ELog(14), FString().Append("Failed to set ").Append(local_24.Name).Append(" in Config ").Append(local_4.GetDataName()).Append(", type not matched."));
                    continue;
                }
                local_8[local_9] = local_24.Value.GetValueAsSmartDefaultValue(Context.opImplConv());
            }
            TArray<FECSEntityId> local_52;
            if (int(this.DispatchMode) == 1)
            {
                for (auto& local_68 : this.TargetEntities)
                {
                    FECSEntityId local_70 = local_68.GetValue(Context.opImplConv());
                    if ((!((local_70 == ENTITY_ID_NULL))))
                    {
                        local_52.Add(local_70);
                    }
                }
            }
            ::FAICombatTokenUtils::GenerateSpecialToken(Context.PawnEntity, this.SpecialToken, local_8, this.GenerateTokenDelay, this.DispatchMode, local_52);
        }
        return EBTNodeResult(0);
    }
    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        return FString().Append(this.GetBaseStaticDescription()).Append(": ").Append(this.SpecialToken);
    }
}


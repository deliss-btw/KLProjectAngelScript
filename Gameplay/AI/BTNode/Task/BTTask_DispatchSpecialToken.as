

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

    default SetNodeName("е€†еЏ‘з‰№ж®ЉToken");


    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        EBTNodeResult __r; return __r;
    }
    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        return FString().Append(this.GetBaseStaticDescription()).Append(": ").Append(this.SpecialToken);
    }
}


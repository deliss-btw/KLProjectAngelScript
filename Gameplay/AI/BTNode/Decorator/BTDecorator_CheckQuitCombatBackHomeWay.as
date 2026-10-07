

class UBTDecorator_CheckQuitCombatBackHomeWay : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId EntityToCheck = FAISmart_EntityId(FAIBlackboardNativeKey::SelfEntity, EAISmartValue(0));
    UPROPERTY()
    EAIBackHomeWay ExpectedBackHomeWay = EAIBackHomeWay(1);

    default SetNodeName("Check QuitCombat BackHomeWay");


    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        return FString().Append(": BackHomeWay == ").Append(this.ExpectedBackHomeWay);
    }
    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        FECSEntity local_12 = FECSEntity(this.EntityToCheck.GetValue(Context.opImplConv()));
        if (!(local_12.IsValid()))
        {
            return false;
        }
        FAIQuitCombatConfig local_50 = ::FAIQuitCombatUtils::GetQuitCombatConfig(local_12);
        int local_53 = int(local_50.BackHomeWay);
        int local_54 = int(this.ExpectedBackHomeWay);
        return (local_53 == local_54);
    }
}


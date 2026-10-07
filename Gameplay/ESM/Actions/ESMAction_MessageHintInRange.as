

class UESMAction_MessageHintInRange : UESMBPBaseInstantAction
{
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHint;
    UPROPERTY()
    float32 Range;

    UESMAction_MessageHintInRange()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Get local_4;
        FVector local_10 = local_4.opCall().GetPosition();
        TArray<FECSEntity> local_16 = ::BlueprintFunctions_Common::GetAllPlayerEntitiesInRangeAS(local_10, this.Range, false);
        for (auto& local_34 : local_16)
        {
            ::MessageHintUtils::ShowMessageHint(local_34, this.MessageHint, TArray<FTextArgument>());
        }
        return;
    }
}


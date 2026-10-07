

class UESMAction_ForceDetachSocialInteractTarget : UESMBPBaseInstantAction
{
    UPROPERTY()
    FVector DetachLocationOffset;
    UPROPERTY()
    FRotator DetachRotationOffset;
    UPROPERTY()
    bool bUseRootRotationOffset = false;
    UPROPERTY()
    bool bCheckSpecificTarget = false;
    UPROPERTY()
    FDataObjectPtr AttackDataConfigWhileDetatch;


    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        ::FASCommonUtils::GetUniquePlayerEntity(local_2);
        FECSEntity local_20 = FECSEntity(ENTITY_NULL);
        Get local_24;
        const FC_InteractionInfoForESM& local_26 = local_24.opCall();
        if (local_26)
        {
            if (local_26.GetTargetEntity().IsValid())
            {
                local_20 = local_26.GetTargetEntity();
            }
        }
        if (!((local_20 == ENTITY_NULL)) && ::FAttachmentUtils::IsEntityAttachedToParent(local_20, local_2))
        {
            ::FAttachmentUtils::EntityDetach(local_20, Time.WorldTime, this.DetachLocationOffset, this.DetachRotationOffset, this.bUseRootRotationOffset, uint8(0), false);
            if (::FCombatUtils::GetAttackDataPtrFromDataTable(this.AttackDataConfigWhileDetatch, Context.GetEntity()))
            {
                ::FDamageUtils::AddDirectDamageByAttackData(local_2, local_2, local_20, Time.WorldTime);
            }
        }
        return;
    }
}


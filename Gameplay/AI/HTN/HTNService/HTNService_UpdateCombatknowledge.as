

class UHTNService_UpdateCombatknowledge : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector AttackTargetEntityID;
    UPROPERTY()
    FBlackboardKeySelector AttackTargetDistance2D;

    default SetNodeName("ж›ґж–°ж‰ЂйњЂж•°жЌ®е€°й»‘жќїеЂј");

    UHTNService_UpdateCombatknowledge()
    {
        this.AttackTargetEntityID.SelectedKeyName = n"AttackTargetEntityID";
        this.AttackTargetEntityID.AddEntityIdFilter(this, n"AttackTargetEntityID");
        this.AttackTargetDistance2D.SelectedKeyName = n"AttackTargetDistance2D";
        this.AttackTargetDistance2D.AddFloatFilter(this, n"AttackTargetDistance2D");
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        this.UpdateData(Context);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        this.UpdateData(Context);
        return;
    }
    void UpdateData(const FHTNContext &inout Context)
    {
        int local_22 = 0;
        int local_24 = 0;
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        FTargetEntity local_6;
        local_6 = FTargetEntity(::FAITargetingUtils::GetCurrentAttackTarget(local_4));
        float local_8 = local_22.GetPosition().Dist2D(local_24.GetPosition());
        local_6.GetEntity().GetId();
        HTNNode::SetWorldStateValueAsFloat(Context, this.AttackTargetDistance2D, float32(local_8));
        return;
    }
}


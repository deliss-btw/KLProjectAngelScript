

struct FHTNMoveStanceDistanceConfig
{
    UPROPERTY()
    float32 MaxDistance = 0.0f;
    UPROPERTY()
    ECreatureMoveStance MoveStance = ECreatureMoveStance(0);


}

class UHTNService_UpdateMoveStanceByDistance : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FAISmart_AnyValue Target;
    UPROPERTY()
    bool b2D;
    UPROPERTY()
    TArray<FHTNMoveStanceDistanceConfig> DistanceConfigs;
    UPROPERTY()
    FBlackboardKeySelector OutMoveStance;

    default SetNodeName("UpdateMoveStanceByDistance");

    UHTNService_UpdateMoveStanceByDistance()
    {
        this.b2D = true;
        this.Target.AddValueFilter(FAISmart_Vector);
        this.Target.AddValueFilter(FAISmart_EntityId);
        this.OutMoveStance.SelectedKeyName = n"LGroundMoveStance";
        this.OutMoveStance.AddIntFilter(this, n"LGroundMoveStance");
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        this.UpdateMoveStance(Context);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        this.UpdateMoveStance(Context);
        return;
    }
    bool ResolveTargetLocation(const FHTNContext &inout Context, FVector &inout OutTargetLocation) const
    {
        GetValue local_4;
        if (local_4.opCall(Context.opImplConv(), OutTargetLocation))
        {
            return true;
        }
        FECSEntityId local_8;
        GetValue local_12;
        if (local_12.opCall(Context.opImplConv(), local_8))
        {
            if (FECSEntity(local_8).IsValid())
            {
                GetDefaulted local_24;
                OutTargetLocation = local_24.opCall().GetPosition();
                return true;
            }
        }
        return false;
    }
    ECreatureMoveStance SelectMoveStance(const float32 Distance) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        ECreatureMoveStance __r; return __r;
    }
    void UpdateMoveStance(const FHTNContext &inout Context) const
    {
        float32 local_29;
        if (this.DistanceConfigs.IsEmpty())
        {
            return;
        }
        if (!(FECSEntity(Context.PawnEntity).IsValid()))
        {
            return;
        }
        FVector local_12(FVector::ZeroVector);
        if (!(this.ResolveTargetLocation(Context, local_12)))
        {
            return;
        }
        GetDefaulted local_22;
        FVector local_18 = local_22.opCall().GetPosition();
        if (this.b2D)
        {
            local_29 = float32(local_18.Dist2D(local_12));
        }
        else
        {
            local_29 = float32(local_18.Distance(local_12));
        }
        ECreatureMoveStance local_31 = this.SelectMoveStance(local_29);
        int local_33 = int(local_31);
        if ((HTNNode::GetWorldStateValueAsInt(Context, this.OutMoveStance)) == local_33)
        {
            return;
        }
        HTNNode::SetWorldStateValueAsInt(Context, this.OutMoveStance, local_33);
        return;
    }
}


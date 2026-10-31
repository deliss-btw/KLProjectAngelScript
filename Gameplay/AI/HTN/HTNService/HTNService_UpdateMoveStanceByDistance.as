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
        bool local_1 = false;
        float32 local_3 = 0.0f;
        ECreatureMoveStance local_6 = ECreatureMoveStance(0);
        bool local_7 = false;
        float32 local_8 = 0.0f;
        ECreatureMoveStance local_6_2 = ECreatureMoveStance(0);
        for (auto& local_24 : this.DistanceConfigs)
        {
            if (!(local_7) || (local_24.MaxDistance > local_8))
            {
                local_7 = true;
                local_8 = local_24.MaxDistance;
                local_6_2 = local_24.MoveStance;
            }
            if (Distance <= local_24.MaxDistance && (!(local_1) || ((local_24.MaxDistance < local_3))))
            {
                local_1 = true;
                local_3 = local_24.MaxDistance;
                local_6_2 = local_24.MoveStance;
            }
        }
        if (local_1)
        {
        }
        else
        {
        }
        return local_6_2;
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


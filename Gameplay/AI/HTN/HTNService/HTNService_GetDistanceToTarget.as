

class UHTNService_GetDistanceToTarget : UHTNService_ECSScriptBase
{
    UPROPERTY()
    FAISmart_AnyValue Source;
    UPROPERTY()
    FAISmart_AnyValue Target;
    UPROPERTY()
    bool b2D;
    UPROPERTY()
    FBlackboardKeySelector Distance;

    default SetNodeName("GetDistanceToTarget");

    UHTNService_GetDistanceToTarget()
    {
        this.Distance.AddFloatFilter(this, n"Distance");
        this.Source.AddValueFilter(FAISmart_EntityId);
        this.Source.AddValueFilter(FAISmart_Vector);
        this.Target.AddValueFilter(FAISmart_EntityId);
        this.Target.AddValueFilter(FAISmart_Vector);
        return;
    }
    UFUNCTION()
    void ExecutionStart_Implementation(const FHTNContext &inout Context)
    {
        this.GetDistance(Context);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaTime)
    {
        this.GetDistance(Context);
        return;
    }
    void GetDistance(const FHTNContext &inout Context)
    {
        GetValue local_16;
        FVector local_6(FVector::ZeroVector);
        FVector local_12(FVector::ZeroVector);
        if (!(local_16.opCall(Context.opImplConv(), local_6)))
        {
            GetDefaulted local_32;
            GetValue local_24;
            FECSEntityId local_20;
            if (local_24.opCall(Context.opImplConv(), local_20))
            {
                FECSEntity local_28 = FECSEntity(local_20);
                local_6 = local_32.opCall().GetPosition();
            }
        }
        if (!(local_16.opCall(Context.opImplConv(), local_12)))
        {
            GetDefaulted local_32;
            GetValue local_24;
            FECSEntityId local_20;
            if (local_24.opCall(Context.opImplConv(), local_20))
            {
                FECSEntity local_28_2 = FECSEntity(local_20);
                local_12 = local_32.opCall().GetPosition();
            }
        }
        float local_34 = 0.0;
        if (this.b2D)
        {
            local_34 = local_6.Dist2D(local_12);
        }
        else
        {
            local_34 = local_6.Distance(local_12);
        }
        HTNNode::SetWorldStateValueAsFloat(Context, this.Distance, float32(local_34));
        return;
    }
}


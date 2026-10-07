

class UBTTask_DebugDrawStringTargetLocation : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TargetLocationKey;
    UPROPERTY()
    float32 DrawLifeTime;

    default SetNodeName("Debug Draw String Location");

    UBTTask_DebugDrawStringTargetLocation()
    {
        this.DrawLifeTime = 3.0f;
        this.TargetLocationKey.SelectedKeyName = n"TargetLocation";
        this.TargetLocationKey.AddVectorFilter(this, n"TargetLocation");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_10 = 0;
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        if (!(local_10))
        {
            return EBTNodeResult(1);
        }
        FVector local_18 = local_10.GetPosition();
        FVector local_30 = local_2.GetValueAsVector(this.TargetLocationKey.SelectedKeyName);
        FString local_34;
        local_34 += "MoveToFail:\n";
        FString local_42 = (FString(" From: ") + local_18);
        FString local_38 = (local_42 + "\n");
        local_34 += local_38;
        FString local_38_2 = (FString(" To: ") + local_30);
        local_34 += local_38_2;
        FECSDebugDraw::DrawDebugString(n"MoveToFail", local_18, local_34, FColor::Red, 1.0f, FColor::Blue, this.DrawLifeTime);
        return EBTNodeResult(0);
    }
}

class UBTTask_EcologyUnstuckErrorLog : UBTTask_ECSScriptBase
{
    UPROPERTY()
    FBlackboardKeySelector TargetLocationKey;
    UPROPERTY()
    bool IsUnstuckFail;

    default SetNodeName("Ecology Unstruck ErrorLog");

    UBTTask_EcologyUnstuckErrorLog()
    {
        this.IsUnstuckFail = false;
        this.TargetLocationKey.SelectedKeyName = n"TargetLocation";
        this.TargetLocationKey.AddVectorFilter(this, n"TargetLocation");
        return;
    }
    UFUNCTION()
    EBTNodeResult ExecuteTask_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        int local_14 = 0;
        UBlackboardComponent local_2 = Context.GetBlackboardComponent();
        FECSEntity local_8 = FECSEntity(Context.PawnEntity);
        if (!(local_14))
        {
            return EBTNodeResult(1);
        }
        FVector local_22 = local_14.GetPosition();
        FVector local_34 = local_2.GetValueAsVector(this.TargetLocationKey.SelectedKeyName);
        if (!(this.IsUnstuckFail))
        {
            XLogV_SPHERE(ELog(30), local_8, local_22, 5.0f, FColor::Red, FString().Append("[Ecology Unstuck Start!!] FromPos = ").Append(local_22).Append(" to ").Append(local_34));
            FString local_38_2 = FString();
            XError(ELog(30), local_38_2.Append("[Ecology Unstuck Start!!] FromPos = ").Append(local_22).Append(" to ").Append(local_34));
        }
        else
        {
            FString local_38_3 = FString();
            XLogV_SPHERE(ELog(30), local_8, local_22, 5.0f, FColor::Red, local_38_3.Append("[Ecology Unstuck Fail!!] Unstuck Point not Found, FromPos = ").Append(local_22).Append(" to ").Append(local_34));
            FString local_38_4 = FString();
            XError(ELog(30), local_38_4.Append("[Ecology Unstuck Fail!!] Unstuck Point not Found, FromPos = ").Append(local_22).Append(" to ").Append(local_34));
        }
        return EBTNodeResult(0);
    }
}


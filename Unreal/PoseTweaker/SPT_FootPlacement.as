

struct FFootPlacementLeg
{
    UPROPERTY()
    FString BoneChainString;
    UPROPERTY()
    FName EffectorBoneName;
    UPROPERTY()
    FName CurveName;
    UPROPERTY()
    float32 StanceThreshold = 0.9f;
    UPROPERTY()
    float32 AbsorptionDuration = 0.2f;
    UPROPERTY()
    float32 SnapThreshold = 5.0f;
    UPROPERTY()
    float32 MaxCarryover = 200.0f;
    UPROPERTY()
    float32 RotJumpThreshold = 5.0f;
    UPROPERTY()
    float32 RotAbsorptionDuration = 0.2f;
    UPROPERTY()
    float32 RotSnapThreshold = 0.5f;
    UPROPERTY()
    bool bDebugDraw = false;
    UPROPERTY()
    FPT_TwoBoneIK IK;
    UPROPERTY()
    FVector Carryover = FVector::ZeroVector;
    UPROPERTY()
    bool bInAbsorption = false;
    UPROPERTY()
    float32 AbsorptionElapsed = 0.0f;
    UPROPERTY()
    FVector AbsorptionStartCarryover = FVector::ZeroVector;
    UPROPERTY()
    bool bWasStanceLastFrame = false;
    UPROPERTY()
    FVector PrevFinalEffector = FVector::ZeroVector;
    UPROPERTY()
    bool bHasPrevFrame = false;
    UPROPERTY()
    FQuat RotCarryover = FQuat::Identity;
    UPROPERTY()
    FQuat PrevAnimRot = FQuat::Identity;
    UPROPERTY()
    FQuat PrevFinalRot = FQuat::Identity;
    UPROPERTY()
    bool bRotInAbsorption = false;
    UPROPERTY()
    float32 RotAbsorptionElapsed = 0.0f;
    UPROPERTY()
    FQuat AbsorptionStartRotCarryover = FQuat::Identity;


    void Reset()
    {
        this.Carryover = FVector::ZeroVector;
        this.bInAbsorption = false;
        this.AbsorptionElapsed = 0.0f;
        this.AbsorptionStartCarryover = FVector::ZeroVector;
        this.bWasStanceLastFrame = false;
        this.PrevFinalEffector = FVector::ZeroVector;
        this.bHasPrevFrame = false;
        this.RotCarryover = FQuat::Identity;
        this.PrevAnimRot = FQuat::Identity;
        this.PrevFinalRot = FQuat::Identity;
        this.bRotInAbsorption = false;
        this.RotAbsorptionElapsed = 0.0f;
        this.AbsorptionStartRotCarryover = FQuat::Identity;
        return;
    }
}

class USPT_FootPlacement_Template : USkeletalPoseTweaker
{
    UPROPERTY()
    TMap<FName, FFootPlacementLeg> Legs;

    USPT_FootPlacement_Template()
    {
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        FFootPlacementLeg& local_22;
        for (auto& local_20 : this.Legs)
        {
            local_20;
            local_22.IK.ChainBoneNames = UPoseTweakerUtil::ParseIntoNames(local_22.BoneChainString);
            local_22.IK.EffectorBoneName = local_22.EffectorBoneName;
            local_22.IK.Initialize();
            local_22.Reset();
        }
        return;
    }
    UFUNCTION()
    void OnReturnFromFrameGap_Implementation()
    {
        for (auto& local_20 : this.Legs)
        {
            local_20;
            Reset();
        }
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        // body not fully recovered вЂ” stub [argmismatch:argint]
    }
    void ProcessLeg(const FName &inout LegName, FFootPlacementLeg &inout Leg, const int Index)
    {
        if (!(Leg.IK.IsValid()))
        {
            return;
        }
        FVector local_44 = this.AnimComponentTransform.TransformPosition(Leg.IK.GetEffectorTM().GetLocation());
        FQuat local_68 = this.AnimComponentTransform.TransformRotation(Leg.IK.GetEffectorTM().GetRotation());
        float32 local_69 = 0.0f;
        bool local_1 = this.GetCurveValue(Leg.CurveName, local_69);
        if (!(local_1))
        {
            Leg.Reset();
            return;
        }
        float32 local_74 = FMath::Clamp(local_69, 0.0f, 1.0f);
        bool local_71 = (local_74 >= Leg.StanceThreshold);
        float32 local_76 = this.CurrentDeltaSeconds;
        if (local_71)
        {
            if (Leg.bHasPrevFrame)
            {
                Leg.Carryover = (local_44 - Leg.PrevFinalEffector);
            }
            else
            {
                Leg.Carryover = FVector::ZeroVector;
            }
            Leg.bInAbsorption = false;
        }
        else
        {
            if (Leg.bWasStanceLastFrame)
            {
                Leg.bInAbsorption = true;
                Leg.AbsorptionElapsed = 0.0f;
                Leg.AbsorptionStartCarryover = Leg.Carryover;
            }
            if (Leg.bInAbsorption)
            {
                float32 local_72 = Leg.AbsorptionElapsed + local_76;
                Leg.AbsorptionElapsed = local_72;
                local_72 = Leg.AbsorptionDuration;
                local_72 = FMath::Clamp(Leg.AbsorptionElapsed / local_72, 0.0f, 1.0f);
                Leg.Carryover = (Leg.AbsorptionStartCarryover * (1.0f - local_72));
                if (local_72 >= 1.0f)
                {
                    Leg.bInAbsorption = false;
                    Leg.Carryover = FVector::ZeroVector;
                }
            }
        }
        if (Leg.Carryover.Size() < Leg.SnapThreshold)
        {
            Leg.Carryover = FVector::ZeroVector;
            Leg.bInAbsorption = false;
        }
        float local_84 = Leg.Carryover.Size();
        if (local_84 > Leg.MaxCarryover)
        {
            Leg.Carryover = (Leg.Carryover.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * Leg.MaxCarryover);
            int local_88 = Index + 51000;
            this.AddOnScreenDebugMessage(FString().Append("[FootPlacement][").Append(LegName).Append("] Carryover clamped: ").Append(local_84).Append(" cm > ").Append(Leg.MaxCarryover).Append(" cm вЂ” upstream may need fixing"), local_88, false, 2.0f);
        }
        FVector local_8 = (local_44 - Leg.Carryover);
        FQuat local_108 = local_68;
        float32 local_72_2 = 0.0f;
        if (Leg.RotJumpThreshold > 0.0f)
        {
            if (Leg.bHasPrevFrame)
            {
                local_72_2 = float32(FMath::RadiansToDegrees(local_68.AngularDistance(Leg.PrevAnimRot)));
            }
            if (local_71 && Leg.bHasPrevFrame && ((local_72_2 >= Leg.RotJumpThreshold)))
            {
                Leg.RotCarryover = (local_68 * Leg.PrevFinalRot.Inverse());
                Leg.AbsorptionStartRotCarryover = Leg.RotCarryover;
                Leg.RotAbsorptionElapsed = 0.0f;
                Leg.bRotInAbsorption = true;
            }
            if (Leg.bRotInAbsorption)
            {
                Leg.RotAbsorptionElapsed = (Leg.RotAbsorptionElapsed + local_76);
                float32 local_79 = FMath::Clamp(Leg.RotAbsorptionElapsed / Leg.RotAbsorptionDuration, 0.0f, 1.0f);
                Leg.RotCarryover = FQuat::Slerp(Leg.AbsorptionStartRotCarryover, FQuat::Identity, local_79);
                if (local_79 >= 1.0f)
                {
                    Leg.bRotInAbsorption = false;
                    Leg.RotCarryover = FQuat::Identity;
                }
            }
            if (float32(FMath::RadiansToDegrees(Leg.RotCarryover.AngularDistance(FQuat::Identity))) < Leg.RotSnapThreshold)
            {
                Leg.RotCarryover = FQuat::Identity;
                Leg.bRotInAbsorption = false;
            }
            local_108 = (Leg.RotCarryover.Inverse() * local_68);
        }
        else
        {
            Leg.RotCarryover = FQuat::Identity;
            Leg.bRotInAbsorption = false;
        }
        FTransform local_136 = FTransform(Leg.IK.GetEffectorTM());
        local_136.SetLocation(this.AnimComponentTransform.InverseTransformPosition(local_8));
        local_136.SetRotation(this.AnimComponentTransform.InverseTransformRotation(local_108));
        Leg.IK.Solve(local_136);
        Leg.PrevFinalEffector = local_8;
        Leg.PrevAnimRot = local_68;
        Leg.PrevFinalRot = local_108;
        Leg.bWasStanceLastFrame = local_71;
        Leg.bHasPrevFrame = true;
        if (Leg.bDebugDraw)
        {
            this.DrawAnimDebugSphere(local_44, 10.0f, 20, FColor::Red, EPTDebugDrawSpace(1), ESceneDepthPriorityGroup(1));
            this.DrawAnimDebugLine(local_8, local_44, FColor::Red, EPTDebugDrawSpace(1), 0.0f, true);
            if (Leg.RotJumpThreshold > 0.0f)
            {
                this.DrawAnimDebugLine(local_8, (local_8 + (local_108.GetAxisX() * 50.0)), FColor::Green, EPTDebugDrawSpace(1), 0.0f, true);
                this.DrawAnimDebugLine(local_8, (local_8 + (local_68.GetAxisX() * 50.0)), FColor::Yellow, EPTDebugDrawSpace(1), 0.0f, true);
            }
            FString local_142;
            if (local_71)
            {
                local_142 = FString().Append("Stance(c=").Append(local_74).Append(")");
            }
            else
            {
                if (Leg.bInAbsorption)
                {
                    local_142 = FString().Append("Swing(c=").Append(local_74).Append(", window ").Append((Leg.AbsorptionDuration - Leg.AbsorptionElapsed)).Append("s left)");
                }
                else
                {
                    local_142 = FString().Append("Swing(c=").Append(local_74).Append(", idle)");
                }
            }
            int local_87 = Index + 51010;
            this.AddOnScreenDebugMessage(FString().Append("[FootPlacement][").Append(LegName).Append("] Carryover=").Append(Leg.Carryover.Size()).Append(" ").Append(local_142), false, (1073741824 != 0));
            if (Leg.RotJumpThreshold > 0.0f)
            {
                float32 local_79_2 = float32(FMath::RadiansToDegrees(Leg.RotCarryover.AngularDistance(FQuat::Identity)));
                FString local_146;
                if (Leg.bRotInAbsorption)
                {
                    local_146 = FString().Append("RotWin(").Append((Leg.RotAbsorptionDuration - Leg.RotAbsorptionElapsed)).Append("s left)");
                }
                else
                {
                    local_146 = "RotIdle";
                }
                int local_88_2 = Index + 51020;
                this.AddOnScreenDebugMessage(FString().Append("[FootPlacement][").Append(LegName).Append("] RotCarryover=").Append(local_79_2).Append("В° Jump=").Append(local_72_2).Append("В° ").Append(local_146), local_88_2, false, 2.0f);
            }
        }
        return;
    }
}

class USPT_Wyvern001_HarbingerOfDoom_FootPlacement : USPT_FootPlacement_Template
{
    USPT_Wyvern001_HarbingerOfDoom_FootPlacement()
    {
        super();
        FFootPlacementLeg local_124;
        local_124.CurveName = n"contact_hand_l";
        local_124.BoneChainString = "upperarm_l|lowerarm_l|hand_l";
        local_124.EffectorBoneName = n"fingerbase_l";
        local_124.SnapThreshold = 10.0f;
        this.Legs.Add(n"hand_l", local_124);
        FFootPlacementLeg local_252;
        local_252.CurveName = n"contact_hand_r";
        local_252.BoneChainString = "upperarm_r|lowerarm_r|hand_r";
        local_252.EffectorBoneName = n"fingerbase_r";
        local_252.SnapThreshold = 10.0f;
        this.Legs.Add(n"hand_r", local_252);
        FFootPlacementLeg local_376;
        local_376.CurveName = n"contact_foot_l";
        local_376.BoneChainString = "thigh_l|calf_l|lowcalf_l";
        local_376.EffectorBoneName = n"foot_l";
        local_376.SnapThreshold = 10.0f;
        this.Legs.Add(n"foot_l", local_376);
        FFootPlacementLeg local_500;
        local_500.CurveName = n"contact_foot_r";
        local_500.BoneChainString = "thigh_r|calf_r|lowcalf_r";
        local_500.EffectorBoneName = n"foot_r";
        local_500.SnapThreshold = 10.0f;
        this.Legs.Add(n"foot_r", local_500);
        return;
    }
}




struct FSphereSurfaceDeformer
{
    UPROPERTY()
    FTransform Transform;
    UPROPERTY()
    float Latitude;
    UPROPERTY()
    float Radius = 30.0;
    UPROPERTY()
    TArray<FVector> PointsToDeform;
    UPROPERTY()
    TArray<FVector> ResultPoints;
    UPROPERTY()
    TArray<FVector> InfluencePoints;
    UPROPERTY()
    float InfluenceArcAngle = 50.0;


    void Reset()
    {
        this.PointsToDeform.Reset(0);
        this.ResultPoints.Reset(0);
        this.InfluencePoints.Reset(0);
        return;
    }
    FVector ComputeDeformPoint(const FVector &inout localPt)
    {
        float local_2 = this.Latitude;
        for (auto& local_20 : this.InfluencePoints)
        {
            FVector local_32 = local_20.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            float local_36 = FMath::Acos(local_32.X);
            float local_4 = FMath::RadiansToDegrees(local_36);
            if (local_4 < this.Latitude)
            {
                FVector2D local_52 = FVector2D(local_32.Y, local_32.Z).GetSafeNormal(9.99999993922529e-9);
                local_36 = ((FVector2D(localPt.Y, localPt.Z).GetSafeNormal(9.99999993922529e-9).DotProduct(local_52)) - 0.8) / 0.2;
                if (local_36 > 0.0)
                {
                    float local_54 = ((local_4 - this.Latitude) * local_36) + this.Latitude;
                    local_2 = FMath::Min(local_54, local_2);
                }
            }
        }
        float local_34 = FMath::DegreesToRadians(local_2 - this.Latitude);
        float local_36_2 = -localPt.Z;
        FQuat local_64 = FQuat(FVector(0.0, local_36_2, localPt.Y).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector), local_34);
        return local_64.RotateVector(localPt);
    }
    void Deform()
    {
        this.ResultPoints.SetNum(this.PointsToDeform.Num());
        int local_2 = 0;
        for (; local_2 < this.PointsToDeform.Num(); )
        {
            this.ResultPoints[local_2] = this.ComputeDeformPoint(this.PointsToDeform[local_2]);
            ++local_2;
        }
        return;
    }
    void DrawDeformer(const USkeletalPoseTweaker PoseTweaker)
    {
        float local_54;
        int local_1 = 30;
        float local_4 = 0.20943951606750488;
        FVector local_28;
        for (auto& local_22 : this.ResultPoints)
        {
            local_28 = local_22.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
            local_28 = this.TransformPosition((local_28 * this.Radius));
            PoseTweaker.DrawAnimDebugPoint(local_28);
        }
        FVector local_40;
        FVector local_46;
        int local_47 = 0;
        for (; local_47 < 30; )
        {
            float local_50 = 0.0;
            float local_52 = 0.0;
            float local_6 = local_47;
            local_6 = local_6 * local_4;
            FMath::SinCos(local_50, local_52, local_6);
            local_54 = this.Latitude;
            for (auto& local_22 : this.InfluencePoints)
            {
                local_28 = local_22.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                local_6 = local_28.X;
                local_6 = FMath::RadiansToDegrees(FMath::Acos(local_6));
                if (local_6 < this.Latitude)
                {
                    float local_64;
                    FVector2D local_80 = FVector2D(local_28.Y, local_28.Z).GetSafeNormal(9.99999993922529e-9);
                    local_64 = 9.99999993922529e-9;
                    local_64 = FVector2D(local_50, local_52).GetSafeNormal(local_64).DotProduct(local_80);
                    float local_76 = 0.6;
                    float local_62 = 0.4;
                    local_76 = (local_64 - local_76) / local_62;
                    if (local_76 > 0.0)
                    {
                        local_62 = this.Latitude;
                        local_62 = (local_6 - local_62) * local_76;
                        local_54 = local_62 + this.Latitude;
                    }
                }
            }
            float local_76_2 = 0.0;
            float local_64_2 = 0.0;
            FMath::SinCos(local_64_2, local_76_2, FMath::DegreesToRadians(local_54));
            local_28.X = 0.0;
            local_28.Y = (local_64_2 * local_50);
            local_28.Z = (local_64_2 * local_52);
            local_28 *= this.Radius;
            if (local_47 == 0)
            {
                local_40 = local_28;
            }
            else
            {
                PoseTweaker.DrawAnimDebugLine(this.TransformPosition(local_28), this.TransformPosition(local_46), FColor::Purple, EPTDebugDrawSpace(0), 0.0f, true);
            }
            if (local_47 == 29)
            {
                PoseTweaker.DrawAnimDebugLine(this.TransformPosition(local_28), this.TransformPosition(local_40), FColor::Purple, EPTDebugDrawSpace(0), 0.0f, true);
            }
            local_46 = local_28;
            ++local_47;
        }
        PoseTweaker.DrawAnimDebugTransform(this, 2.0f, true);
        return;
    }
    bool ComputeRayHitOnSphere(const FVector &inout rayOrgCS, const FVector &inout rayDirCS, FVector &inout hitPt)
    {
        FVector local_12 = this.InverseTransformPosition(rayOrgCS);
        FVector local_6 = (this.InverseTransformPosition((rayOrgCS + rayDirCS)) - local_12);
        local_6.Normalize(9.99999993922529e-9);
        FVector local_18 = (local_12 - (local_6 * local_12.DotProduct(local_6)));
        float local_30 = local_18.SizeSquared();
        if (local_30 > (this.Radius * this.Radius))
        {
            return false;
        }
        hitPt = (local_18 + (local_6 * (FMath::Sqrt((this.Radius * this.Radius) - local_30))));
        return true;
    }
    void DrawPointOnSphere(const USkeletalPoseTweaker PoseTweaker, const FVector &inout localPt)
    {
        FVector local_20 = (localPt.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * this.Radius);
        PoseTweaker.DrawAnimDebugPointEx(this.TransformPosition(local_20), FColor::Red, 4.0f);
        return;
    }
    void DrawLineOnSphere(const USkeletalPoseTweaker PoseTweaker, const FVector &inout pt0, const FVector &inout pt1, const int segments = 10)
    {
        FVector local_14 = pt0.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        FVector local_6 = pt1.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        float local_24 = FMath::Acos(local_14.X);
        float local_22 = FMath::Acos(local_6.X);
        FVector local_20 = FVector(0.0, local_6.Y, local_6.Z);
        FQuat local_52 = FQuat::FindBetween(FVector(0.0, local_14.Y, local_14.Z), local_20);
        FVector local_58;
        int local_59 = 0;
        for (; local_59 <= segments; )
        {
            float local_8_2 = local_59 / segments;
            float local_38_2 = FMath::Lerp(local_24, local_22, local_8_2);
            FQuat local_36 = FQuat::Slerp(FQuat::Identity, local_52, local_8_2);
            FVector local_20_2 = local_36.RotateVector((FVector(0.0, local_14.Y, local_14.Z)).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
            FVector local_90;
            float local_92 = 0.0;
            FMath::SinCos(local_92, local_90.X, local_38_2);
            local_90.Y = (local_20_2.Y * local_92);
            local_90.Z = (local_20_2.Z * local_92);
            if (local_59 != 0)
            {
                PoseTweaker.DrawAnimDebugLine(this.TransformPosition((local_58 * this.Radius)), this.TransformPosition((local_90 * this.Radius)), FColor::Purple, EPTDebugDrawSpace(0), 0.0f, true);
            }
            local_58 = local_90;
            ++local_59;
        }
        return;
    }
}

struct FPT_InfluenceBone
{
    UPROPERTY()
    FPT_BoneRef boneRef;
    UPROPERTY()
    FVector ProbeVector = FVector(1.0, 0.0, 0.0);

    FPT_InfluenceBone()
    {
        return;
    }
}

class USPT_TestSkirtRigging : USkeletalPoseTweaker
{
    UPROPERTY()
    int Root;
    UPROPERTY()
    FPT_BoneRef SkirtRootBone;
    UPROPERTY()
    TArray<FPT_BoneRef> SkirtRingBones;
    UPROPERTY()
    TArray<FPT_InfluenceBone> InfluenceBones;
    UPROPERTY()
    FTransform SD_Offset;
    UPROPERTY()
    float SD_Latitude = 160.0;
    UPROPERTY()
    float SD_YScale = 1.0;
    UPROPERTY()
    float SD_Radius = 30.0;
    UPROPERTY()
    int SkirtRotationSegments = 1;
    UPROPERTY()
    bool DebugDraw = false;
    FSphereSurfaceDeformer sphereDeformer;


    UFUNCTION()
    void OnInitialization_Implementation()
    {
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void ComputeSkirtRingBoneTransforms(const TArray<FTransform> &inout prevTMs, const TArray<FVector> &inout newXOrientPts, TArray<FQuat> &inout newOrieintR, TArray<FQuat> &inout newTwistR)
    {
        int local_1 = prevTMs.Num();
        int local_2 = newXOrientPts.Num();
        int local_1_2 = prevTMs.Num();
        newOrieintR.SetNum(local_1_2);
        newTwistR.SetNum(local_1_2);
        int local_5 = 0;
        for (; local_5 < local_1_2; )
        {
            FVector local_34 = (FVector(newXOrientPts[local_5]) - prevTMs[local_5].GetLocation());
            newOrieintR[local_5] = FQuat::FindBetween(prevTMs[local_5].GetRotation().GetAxisX(), local_34);
            ++local_5;
        }
        TArray<FQuat> local_48;
        local_48.SetNum(local_1_2);
        int local_5_2 = 0;
        for (; local_5_2 < local_1_2; )
        {
            int local_2_2 = (local_5_2 + 1) % local_1_2;
            int local_51 = ((local_5_2 + local_1_2) - 1) % local_1_2;
            FTransform local_76 = FTransform(prevTMs[local_5_2]);
            FTransform local_100 = FTransform(prevTMs[local_2_2]);
            FTransform local_124 = FTransform(prevTMs[local_51]);
            FVector local_34_2 = local_76.InverseTransformPosition(local_100.GetLocation());
            local_34_2.X = 0.0;
            FVector local_28 = local_76.InverseTransformPosition(local_124.GetLocation());
            local_28.X = 0.0;
            FTransform local_164 = FTransform(prevTMs[local_5_2]);
            FTransform local_188 = FTransform(prevTMs[local_2_2]);
            FTransform local_212 = FTransform(prevTMs[local_51]);
            local_164.SetRotation((FQuat(newOrieintR[local_5_2]) * local_164.GetRotation()));
            FQuat local_220 = (FQuat(newOrieintR[local_2_2]) * local_188.GetRotation());
            local_188.SetRotation(local_220);
            local_212.SetRotation((FQuat(newOrieintR[local_51]) * local_212.GetRotation()));
            FVector local_234 = FVector((FVector(newXOrientPts[local_5_2]) - local_76.GetLocation()).Size(), 0.0, 0.0);
            local_76 = (FTransform(local_234) * local_164);
            local_100 = (FTransform(local_234) * local_188);
            local_124 = (FTransform(local_234) * local_212);
            FVector local_138 = local_76.InverseTransformPosition(local_100.GetLocation());
            local_138.X = 0.0;
            FVector local_294 = local_76.InverseTransformPosition(local_124.GetLocation());
            local_294.X = 0.0;
            FQuat local_228 = FQuat::FindBetween(local_34_2, local_138);
            local_220 = FQuat::FindBetween(local_28, local_294);
            local_48[local_5_2] = FQuat::Slerp(local_228, local_220, 0.5);
            ++local_5_2;
        }
        int local_51_2 = 0;
        for (; local_51_2 < local_1_2; )
        {
            newTwistR[local_51_2] = local_48[local_51_2];
            ++local_51_2;
        }
        return;
    }
}

class USPT_BasicSkirtRigging : USPT_TestSkirtRigging
{
    USPT_BasicSkirtRigging()
    {
        super();
        this.SkirtRootBone.SetBoneName(n"Bone_M_Pelvis_A_01");
        this.SkirtRingBones = UPoseTweakerUtil::ParseIntoBoneRefs("Bone_L_Skirt_A_01|Bone_L_Skirt_B_01|Bone_L_Skirt_C_01|Bone_M_Skirt_B_01|Bone_R_Skirt_C_01|Bone_R_Skirt_B_01|Bone_R_Skirt_A_01|Bone_M_Skirt_A_01");
        this.InfluenceBones.SetNum(2);
        this.InfluenceBones[0].boneRef.SetBoneName(n"Bone_R_Thigh_A_01");
        this.InfluenceBones[1].boneRef.SetBoneName(n"Bone_L_Thigh_A_01");
        this.SD_Latitude = 163.162056;
        this.SD_YScale = 0.8;
        this.SD_Radius = 30.0;
        return;
    }
}

class USPT_ShuijingSkirtRigging : USPT_TestSkirtRigging
{
    USPT_ShuijingSkirtRigging()
    {
        super();
        this.SkirtRootBone.SetBoneName(n"Bn_M_spine_03");
        this.SkirtRingBones = UPoseTweakerUtil::ParseIntoBoneRefs("Bn_L_Skirt_A01|Bn_L_Skirt_B01|Bn_L_Skirt_C01|Bn_M_Skirt_B01|Bn_R_Skirt_C01|Bn_R_Skirt_B01|Bn_R_Skirt_A01|Bn_M_Skirt_A01");
        this.InfluenceBones.SetNum(2);
        this.InfluenceBones[0].boneRef.SetBoneName(n"Bn_R_thigh");
        this.InfluenceBones[1].boneRef.SetBoneName(n"Bn_L_thigh");
        this.InfluenceBones[1].ProbeVector = FVector(-1.0, 0.0, 0.0);
        this.SD_Latitude = 171.0;
        this.SD_YScale = 0.388;
        this.SD_Radius = 77.44;
        this.SkirtRotationSegments = 5;
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        for (auto& local_16 : this.SkirtRingBones)
        {
            if (local_16.HasValidSetup())
            {
                this.ResetChildRotation(local_16.GetBoneIndex(), false, false);
            }
        }
        Super::EvaluatePose_Implementation();
        return;
    }
}


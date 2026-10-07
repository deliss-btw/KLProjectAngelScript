

class USPT_BackWeaponPointControl : USkeletalPoseTweaker
{
    UPROPERTY()
    TArray<FPT_BoneRef> WeaponBones;
    UPROPERTY()
    FPT_BoneRef PelvisBone;
    UPROPERTY()
    TArray<FVector> SpineRotWeights;
    UPROPERTY()
    float32 LocationSmoothSpeed;
    UPROPERTY()
    float32 RotationSmoothSpeed;
    UPROPERTY()
    float32 ExtendDistance;
    UPROPERTY()
    float32 MaxCorrectionDegrees;
    UPROPERTY()
    float32 CorrectionSmoothSpeed;
    UPROPERTY()
    bool bWantsDebug;
    TArray<int> SpineChain;
    TArray<FVector> RuntimeRotWeights;
    TArray<int> ValidBoneIndices;
    TArray<FTransform> CachedWeaponRefLocals;
    TArray<int> WeaponParentChainIdx;
    TArray<FVector> SmoothedLocations;
    TArray<FQuat> SmoothedRotations;
    int Spine03Idx;
    int Spine02Idx;
    TArray<float32> RefDistsA;
    TArray<float32> RefDistsB;
    TArray<FQuat> SmoothedCorrections;
    bool bInitialized;

    USPT_BackWeaponPointControl()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        int local_3;
        this.bInitialized = false;
        this.SpineChain.Empty(0);
        this.RuntimeRotWeights.Empty(0);
        this.ValidBoneIndices.Empty(0);
        this.CachedWeaponRefLocals.Empty(0);
        this.WeaponParentChainIdx.Empty(0);
        this.SmoothedLocations.Empty(0);
        this.SmoothedRotations.Empty(0);
        this.RefDistsA.Empty(0);
        this.RefDistsB.Empty(0);
        this.SmoothedCorrections.Empty(0);
        if (!(this.PelvisBone.HasValidSetup()) || (this.WeaponBones.Num() == 0))
        {
            return;
        }
        int local_5 = 0;
        for (; local_5 < this.WeaponBones.Num(); ++local_5)
        {
            if (this.WeaponBones[local_5].HasValidSetup())
            {
                this.ValidBoneIndices.Add(local_5);
                local_3 = this.WeaponBones[local_5].GetBoneIndex();
                this.CachedWeaponRefLocals.Add(this.GetRefPoseTransformLocal(local_3));
            }
        }
        local_3 = this.ValidBoneIndices.Num();
        if (local_3 == 0)
        {
            return;
        }
        local_3 = this.ValidBoneIndices[0];
        this.SpineChain = this.GetBoneIndicesOnChain(this.PelvisBone.GetBoneName(), this.WeaponBones[local_3].GetBoneName());
        if (this.SpineChain.Num() < 3)
        {
            return;
        }
        local_3 = this.SpineChain.Num();
        local_3 = local_3 - 1;
        this.SpineChain.RemoveAt(local_3);
        int local_41 = 0;
        for (; local_41 < this.ValidBoneIndices.Num(); )
        {
            local_3 = this.ValidBoneIndices[local_41];
            local_3 = this.GetParentBoneIndex(this.WeaponBones[local_3].GetBoneIndex());
            int local_43 = this.SpineChain.Num() - 1;
            int local_45 = 0;
            for (; local_45 < this.SpineChain.Num(); ++local_45)
            {
                int local_44 = this.SpineChain[local_45];
                if (local_44 == local_3)
                {
                    local_43 = local_45;
                    break;
                }
            }
            this.WeaponParentChainIdx.Add(local_43);
            ++local_41;
        }
        int local_44_2 = this.SpineChain.Num() - 1;
        this.RuntimeRotWeights.SetNum(local_44_2);
        if (this.SpineRotWeights.Num() >= local_44_2)
        {
            int local_41_2 = 0;
            for (; local_41_2 < local_44_2; )
            {
                this.RuntimeRotWeights[local_41_2] = this.SpineRotWeights[local_41_2];
                ++local_41_2;
            }
        }
        else
        {
            int local_43_2 = 0;
            for (; local_43_2 < local_44_2; )
            {
                this.RuntimeRotWeights[local_43_2] = FVector(0.0, 1.0, 1.0);
                ++local_43_2;
            }
        }
        this.Spine03Idx = this.SpineChain[(this.SpineChain.Num() - 1)];
        int local_42 = this.SpineChain.Num();
        if (local_42 >= 3)
        {
            int local_45_2 = this.SpineChain.Num() - 2;
            this.SpineChain[local_45_2];
        }
        else
        {
        }
        this.Spine02Idx = local_42;
        FTransform local_32 = this.GetRefPoseCS(this.Spine03Idx);
        FVector local_90(local_32.GetRotation().GetAxisY());
        FTransform local_84 = this.GetRefPoseCS(this.Spine02Idx);
        FVector local_130(local_84.GetRotation().GetAxisY());
        int local_41_3 = 0;
        for (; local_41_3 < this.ValidBoneIndices.Num(); )
        {
            local_3 = this.WeaponBones[this.ValidBoneIndices[local_41_3]].GetBoneIndex();
            FTransform local_124 = this.GetRefPoseCS(local_3);
            FVector local_162(local_124.GetLocation());
            FVector local_182 = (local_162 + (FVector(local_124.GetRotation().GetAxisX()) * this.ExtendDistance));
            this.RefDistsA.Add(float32(((local_162 - local_32.GetLocation()).DotProduct(local_90))));
            this.RefDistsB.Add(float32(((local_182 - local_84.GetLocation()).DotProduct(local_130))));
            this.SmoothedCorrections.Add(FQuat::Identity);
            ++local_41_3;
        }
        this.bInitialized = true;
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        int local_34;
        int local_229;
        if (!(this.bInitialized))
        {
            return;
        }
        TArray<FTransform> local_6;
        local_6.SetNum(this.SpineChain.Num());
        int local_8 = this.SpineChain[0];
        local_6[0] = this.GetBoneTransformCS(local_8);
        int local_33 = 1;
        FTransform local_60;
        FQuat local_192;
        for (; local_33 < this.SpineChain.Num(); )
        {
            local_34 = this.SpineChain[local_33];
            FTransform local_32 = this.GetBoneTransformLocal(local_34);
            local_60 = this.GetRefPoseTransformLocal(local_34);
            FQuat local_100 = (local_32.GetRotation() * local_60.GetRotation().Inverse());
            FVector local_128 = FVector(1.0, 0.0, 0.0);
            FQuat local_116 = FQuat::FindBetweenNormals(local_128, local_100.RotateVector(local_128));
            FQuat local_148 = (local_116.Inverse() * local_100);
            int local_7 = local_33 - 1;
            FVector local_162 = this.RuntimeRotWeights[local_7];
            FQuat local_156 = FQuat::Slerp(FQuat::Identity, local_148, local_162.X);
            FRotator local_184 = local_116.Rotator();
            local_184.Roll = 0.0;
            local_184.Pitch = local_184.Pitch * local_162.Y;
            float local_130 = local_184.Yaw;
            local_184.Yaw = (local_130 * local_162.Z);
            FQuat local_92 = (local_184.Quaternion() * local_156);
            FTransform local_224 = local_32;
            local_192 = local_60.GetRotation();
            local_224.SetRotation((local_92 * local_192));
            local_7 = local_33 - 1;
            local_6[local_33] = (local_224 * local_6[local_7]);
            ++local_33;
        }
        TArray<FTransform> local_228;
        local_34 = 0;
        for (; local_34 < this.ValidBoneIndices.Num(); ++local_34)
        {
            int local_8_2 = this.WeaponBones[this.ValidBoneIndices[local_34]].GetBoneIndex();
            local_229 = local_8_2;
            local_8_2 = this.GetParentBoneIndex(local_229);
            int local_231 = -1;
            int local_232 = 0;
            for (; local_232 < local_34; ++local_232)
            {
                if (this.WeaponBones[this.ValidBoneIndices[local_232]].GetBoneIndex() == local_8_2)
                {
                    local_231 = local_232;
                    break;
                }
            }
            if (local_231 >= 0)
            {
                local_60 = (FTransform(this.CachedWeaponRefLocals[local_34]) * local_228[local_231]);
            }
            else
            {
                local_60 = (FTransform(this.CachedWeaponRefLocals[local_34]) * local_6[this.WeaponParentChainIdx[local_34]]);
            }
            FVector local_162_2 = FVector(local_60.GetLocation());
            FVector local_122(local_60.GetRotation().GetAxisX());
            FVector local_140 = (local_122 * this.ExtendDistance);
            FVector local_268 = (local_162_2 + local_140);
            FTransform local_260 = this.GetBoneTransformCS(this.Spine03Idx);
            FVector local_274(local_260.GetRotation().GetAxisY());
            FTransform local_32_2 = this.GetBoneTransformCS(this.Spine02Idx);
            FVector local_280(local_32_2.GetRotation().GetAxisY());
            float local_132 = (local_268 - local_32_2.GetLocation()).DotProduct(local_280);
            float32 local_261 = float32(local_132);
            float32 local_281 = this.RefDistsB[local_34];
            local_281 = local_261 - local_281;
            FQuat local_100_2 = FQuat(FQuat::Identity);
            if (FMath::Abs(local_281) > 0.01f)
            {
                FVector local_128_2 = local_122.CrossProduct(local_280);
                if (!(local_128_2.IsNearlyZero(0.001)))
                {
                    local_128_2 = local_128_2.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
                    local_140 = local_128_2.CrossProduct(local_122);
                    float32 local_283 = this.ExtendDistance * float32(local_140.DotProduct(local_280));
                    if (FMath::Abs(local_283) > 0.01f)
                    {
                        float32 local_297 = -local_281;
                        float32 local_282 = local_297 / local_283;
                        local_297 = FMath::DegreesToRadians(this.MaxCorrectionDegrees);
                        float32 local_298 = -local_297;
                        local_132 = FMath::Clamp(local_282, local_298, local_297);
                        local_100_2 = local_192;
                    }
                }
            }
            if (this.CorrectionSmoothSpeed > 0.0f)
            {
                float32 local_298_2 = this.CurrentDeltaSeconds;
                this.SmoothedCorrections[local_34] = FMath::QInterpTo(this.SmoothedCorrections[local_34], local_100_2, local_298_2, this.CorrectionSmoothSpeed);
            }
            else
            {
                this.SmoothedCorrections[local_34] = local_100_2;
            }
            if (!(this.SmoothedCorrections[local_34].IsIdentity(0.0001)))
            {
                local_60.SetRotation((FQuat(this.SmoothedCorrections[local_34]) * local_60.GetRotation()));
            }
            if (this.SmoothedLocations.Num() <= local_34)
            {
                this.SmoothedLocations.Add(local_60.GetLocation());
            }
            else
            {
                if (this.LocationSmoothSpeed > 0.0f)
                {
                    this.SmoothedLocations[local_34] = FMath::VInterpTo(this.SmoothedLocations[local_34], local_60.GetLocation(), this.CurrentDeltaSeconds, this.LocationSmoothSpeed);
                }
                else
                {
                    this.SmoothedLocations[local_34] = local_60.GetLocation();
                }
            }
            local_60.SetLocation(this.SmoothedLocations[local_34]);
            if (this.SmoothedRotations.Num() <= local_34)
            {
                this.SmoothedRotations.Add(local_60.GetRotation());
            }
            else
            {
                if (this.RotationSmoothSpeed > 0.0f)
                {
                    this.SmoothedRotations[local_34] = FMath::QInterpTo(this.SmoothedRotations[local_34], local_60.GetRotation(), this.CurrentDeltaSeconds, this.RotationSmoothSpeed);
                }
                else
                {
                    this.SmoothedRotations[local_34] = local_60.GetRotation();
                }
            }
            local_60.SetRotation(this.SmoothedRotations[local_34]);
            local_228.Add(local_60);
            FTransform local_224_2 = this.GetBoneTransformCS(this.GetParentBoneIndex(local_229));
            FTransform local_84 = local_60.GetRelativeTransform(local_224_2);
            this.SetBoneTransformLocal(local_229, local_84);
            if (this.bWantsDebug)
            {
                FTransform local_348 = (local_84 * local_224_2);
                FVector local_128_3 = FVector(local_348.GetRotation().GetAxisX());
                local_140 = FVector(local_348.GetLocation());
                FVector local_290 = (local_128_3 * this.ExtendDistance);
                FVector local_296 = (local_140 + local_290);
                if (local_34 == 0)
                {
                }
                else
                {
                }
                FVector local_378 = (local_128_3 * 50.0);
                FColor local_379;
                this.DrawAnimDebugLine(local_140, (local_140 + local_378), local_379, EPTDebugDrawSpace(0), 0.0f, true);
                float local_130_2 = (local_140 - local_260.GetLocation()).DotProduct(local_274);
                float local_134_2 = float32(local_130_2);
                local_378 = (local_274 * local_134_2);
                local_290 = (local_140 - local_378);
                local_134_2 = (local_140 - local_260.GetLocation()).DotProduct(local_274);
                if (FMath::Abs((float32(local_134_2) - this.RefDistsA[local_34])) < 1.0f)
                {
                }
                else
                {
                }
                FColor local_387;
                this.DrawAnimDebugLine(local_140, local_290, local_387, EPTDebugDrawSpace(0), 0.0f, true);
                local_130_2 = (local_296 - local_32_2.GetLocation()).DotProduct(local_280);
                local_134_2 = float32(local_130_2);
                local_378 = (local_280 * local_134_2);
                FVector local_386 = (local_296 - local_378);
                local_130_2 = (local_296 - local_32_2.GetLocation()).DotProduct(local_280);
                if (FMath::Abs((float32(local_130_2) - this.RefDistsB[local_34])) < 1.0f)
                {
                }
                else
                {
                }
                FColor local_395;
                this.DrawAnimDebugLine(local_296, local_386, local_395, EPTDebugDrawSpace(0), 0.0f, true);
                this.DrawAnimDebugLine(local_140, local_296, FColor::White, EPTDebugDrawSpace(0), 0.0f, true);
            }
        }
        return;
    }
    FTransform GetRefPoseCS(const int BoneIndex)
    {
        FTransform local_48 = this.GetRefPoseTransformLocal(BoneIndex);
        int local_50 = this.GetParentBoneIndex(BoneIndex);
        while (local_50 != 0)
        {
            local_48 = (local_48 * this.GetRefPoseTransformLocal(local_50));
            local_50 = this.GetParentBoneIndex(local_50);
        }
        return local_48;
    }
}

class USPT_BackWeaponPointControl_StdF : USPT_BackWeaponPointControl
{
    USPT_BackWeaponPointControl_StdF()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
}




class USPT_WorldSpaceBlend : USkeletalPoseTweaker
{
    TArray<int> BonesInWS;
    FName WorldSpaceName = "WS";
    UPROPERTY()
    FTransform AnimReferenceTransform = FTransform::Identity;

    USPT_WorldSpaceBlend()
    {
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        this.BonesInWS.Reset(0);
        int local_1 = this.GetBoneNum();
        this.BonesInWS.Reserve(local_1);
        int local_3 = 0;
        for (; local_3 < local_1; ++local_3)
        {
            FTransform local_28;
            if (this.GetTransformAttribute(local_3, this.WorldSpaceName, local_28))
            {
                this.BonesInWS.Add(local_3);
            }
        }
        return;
    }
    UFUNCTION()
    void EvaluatePose_Implementation()
    {
        FTransform local_96 = (this.AnimReferenceTransform * this.AnimComponentTransform.Inverse());
        for (auto local_110 : this.BonesInWS)
        {
            FTransform local_136;
            if (this.GetTransformAttribute(local_110, this.WorldSpaceName, local_136))
            {
                FName local_140 = this.GetBoneName(local_110);
                float32 local_141 = 0.0f;
                this.GetCurveValue(local_140, local_141);
                if (local_141 >= 1.0f)
                {
                    this.SetBoneTransformCS(local_110, (local_136 * local_96));
                    continue;
                }
                if (local_141 > 0.0f)
                {
                    FTransform local_48 = this.GetBoneTransformCS(local_110);
                    FTransform local_192;
                    local_192.Blend(local_48, (local_136 * local_96), local_141);
                    this.SetBoneTransformCS(local_110, local_192);
                }
            }
        }
        this.RemoveAllAttributes();
        return;
    }
}


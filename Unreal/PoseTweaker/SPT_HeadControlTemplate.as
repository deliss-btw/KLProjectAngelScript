

class USPT_HeadControlTemplate : USkeletalPoseTweaker
{
    UPROPERTY()
    FName LookAtTargetBoneName;
    FPT_BoneConstRef LookAtTargetBoneRef;

    USPT_HeadControlTemplate()
    {
        return;
    }
    UFUNCTION()
    void OnInitialization_Implementation()
    {
        this.LookAtTargetBoneRef.SetBoneName(this.LookAtTargetBoneName);
        this.InitializeBoneConstRef(this.LookAtTargetBoneRef);
        return;
    }
    FVector GetLookAtBoneForwardAxis(const FVector &inout FallbackDir)
    {
        FVector local_38;
        if (this.LookAtTargetBoneRef.HasValidSetup())
        {
            local_38 = this.LookAtTargetBoneRef.GetRotation().GetAxisX();
        }
        else
        {
            FVector local_32;
            if (FallbackDir.IsNearlyZero(9.999999747378752e-5))
            {
                local_32 = FVector(1.0, 0.0, 0.0);
            }
            else
            {
                local_32 = FallbackDir;
            }
            local_38 = local_32;
        }
        return local_38;
    }
}


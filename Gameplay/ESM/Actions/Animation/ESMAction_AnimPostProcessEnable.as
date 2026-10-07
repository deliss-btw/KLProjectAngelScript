

class UESMAction_AnimPostProcessEnable : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bSteering = false;
    UPROPERTY()
    bool bOrientationWarping = false;
    UPROPERTY()
    bool bSteeringAO = false;
    UPROPERTY()
    bool bOffsetRootBone = false;
    UPROPERTY()
    bool bStrafeMoveLean = false;
    UPROPERTY()
    bool bNaviMoveLean = false;
    UPROPERTY()
    bool bNaviDynamicMoveLean = false;
    UPROPERTY()
    bool bFootPlacement = false;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        TArray<FString> local_4;
        if (this.bSteering)
        {
            local_4.Add("Steering");
        }
        if (this.bOrientationWarping)
        {
            local_4.Add("OrientationWarping");
        }
        if (this.bSteeringAO)
        {
            local_4.Add("SteeringAO");
        }
        if (this.bOffsetRootBone)
        {
            local_4.Add("OffsetRootBone");
        }
        if (this.bStrafeMoveLean)
        {
            local_4.Add("StrafeMoveLean");
        }
        if (this.bNaviMoveLean)
        {
            local_4.Add("NaviMoveLean");
        }
        if (this.bNaviDynamicMoveLean)
        {
            local_4.Add("NaviDynamicMoveLean");
        }
        if (this.bFootPlacement)
        {
            local_4.Add("FootPlacement");
        }
        if (local_4.Num() == 0)
        {
            return "Enable ABP Post Process";
        }
        return ((FString("Enable ABP Post Process [") + FString::Join(local_4, ", ")) + "]");
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ModifyOrAdd local_4;
        FC_AnimPostProcessEnable& local_6 = local_4.opCall();
        if (local_6)
        {
            if (this.bSteering)
            {
                local_6.SetSteeringCount((local_6.GetSteeringCount() + 1));
            }
            if (this.bOrientationWarping)
            {
                local_6.SetOrientationWarpingCount((local_6.GetOrientationWarpingCount() + 1));
            }
            if (this.bSteeringAO)
            {
                local_6.SetSteeringAOCount((local_6.GetSteeringAOCount() + 1));
            }
            if (this.bOffsetRootBone)
            {
                local_6.SetOffsetRootBoneCount((local_6.GetOffsetRootBoneCount() + 1));
            }
            if (this.bStrafeMoveLean)
            {
                local_6.SetStrafeMoveLeanCount((local_6.GetStrafeMoveLeanCount() + 1));
            }
            if (this.bNaviMoveLean)
            {
                local_6.SetNaviMoveLeanCount((local_6.GetNaviMoveLeanCount() + 1));
            }
            if (this.bNaviDynamicMoveLean)
            {
                local_6.SetNaviDynamicMoveLeanCount((local_6.GetNaviDynamicMoveLeanCount() + 1));
            }
            if (this.bFootPlacement)
            {
                local_6.SetFootPlacementCount((local_6.GetFootPlacementCount() + 1));
            }
            local_6.SetbEnableSteering((local_6.GetSteeringCount() > 0));
            local_6.SetbEnableOrientationWarping((local_6.GetOrientationWarpingCount() > 0));
            local_6.SetbEnableSteeringAO((local_6.GetSteeringAOCount() > 0));
            local_6.SetbEnableOffsetRootBone((local_6.GetOffsetRootBoneCount() > 0));
            local_6.SetbEnableStrafeMoveLean((local_6.GetStrafeMoveLeanCount() > 0));
            local_6.SetbEnableNaviMoveLean((local_6.GetNaviMoveLeanCount() > 0));
            local_6.SetbEnableNaviDynamicMoveLean((local_6.GetNaviDynamicMoveLeanCount() > 0));
            local_6.SetbEnableFootPlacement((local_6.GetFootPlacementCount() > 0));
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_AnimPostProcessEnable& local_6 = local_4.opCall();
        if (local_6)
        {
            if (this.bSteering)
            {
                local_6.SetSteeringCount((local_6.GetSteeringCount() - 1));
            }
            if (this.bOrientationWarping)
            {
                local_6.SetOrientationWarpingCount((local_6.GetOrientationWarpingCount() - 1));
            }
            if (this.bSteeringAO)
            {
                local_6.SetSteeringAOCount((local_6.GetSteeringAOCount() - 1));
            }
            if (this.bOffsetRootBone)
            {
                local_6.SetOffsetRootBoneCount((local_6.GetOffsetRootBoneCount() - 1));
            }
            if (this.bStrafeMoveLean)
            {
                local_6.SetStrafeMoveLeanCount((local_6.GetStrafeMoveLeanCount() - 1));
            }
            if (this.bNaviMoveLean)
            {
                local_6.SetNaviMoveLeanCount((local_6.GetNaviMoveLeanCount() - 1));
            }
            if (this.bNaviDynamicMoveLean)
            {
                local_6.SetNaviDynamicMoveLeanCount((local_6.GetNaviDynamicMoveLeanCount() - 1));
            }
            if (this.bFootPlacement)
            {
                local_6.SetFootPlacementCount((local_6.GetFootPlacementCount() - 1));
            }
            local_6.SetbEnableSteering((local_6.GetSteeringCount() > 0));
            local_6.SetbEnableOrientationWarping((local_6.GetOrientationWarpingCount() > 0));
            local_6.SetbEnableSteeringAO((local_6.GetSteeringAOCount() > 0));
            local_6.SetbEnableOffsetRootBone((local_6.GetOffsetRootBoneCount() > 0));
            local_6.SetbEnableStrafeMoveLean((local_6.GetStrafeMoveLeanCount() > 0));
            local_6.SetbEnableNaviMoveLean((local_6.GetNaviMoveLeanCount() > 0));
            local_6.SetbEnableNaviDynamicMoveLean((local_6.GetNaviDynamicMoveLeanCount() > 0));
            local_6.SetbEnableFootPlacement((local_6.GetFootPlacementCount() > 0));
        }
        return;
    }
}




class UESMAction_CharacterAnimFakeAirFloating : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bAllowAirStart = false;
    UPROPERTY()
    float32 MaxInitialHeight = 200.0f;
    UPROPERTY()
    float32 RootMotionFallDist = 0.0f;
    UPROPERTY()
    float32 MaxUpwardWarpScale = 1.0f;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        bool local_7;
        int local_10 = 0;
        int local_30 = 0;
        local_6.SetbAnimFakeAirFloating(true);
        local_10.SetStateKey(Context.State.GetDataPathName());
        local_10.SetTotalRootMotionDeltaZ(0.0f);
        local_10.SetTotalAppliedRiseUp(0.0f);
        local_10.SetInitialHeightAboveGround(0.0f);
        local_10.SetMaxUpwardWarpScale(1.0f);
        local_10.SetRootMotionScaleZ(-1.0f);
        if (this.bAllowAirStart)
        {
            float32 local_18;
            local_18 = 0.0f;
            const FKMFloorInfo& local_20 = local_6.GetFloorInfo();
            local_7 = local_20.bValid;
            if (!(local_7))
            {
                local_7 = false;
            }
            else
            {
                local_7 = local_20.bHasFloor;
            }
            if (local_7)
            {
                local_18 = FMath::Min(local_20.FloorDistance, this.MaxInitialHeight);
            }
            else
            {
                if (local_30)
                {
                    FKMCFloorInfo local_82 = FKinematicMoveCollisionUtils::FindFloorFromEntity(Context.GetEntity(), local_30.GetPosition(), this.MaxInitialHeight);
                    if (local_82.GetbValid() && local_82.GetbHasFloor())
                    {
                        local_18 = FMath::Min(local_82.GetFloorDistance(), this.MaxInitialHeight);
                        Get local_86;
                        local_6.SetFloorInfo(local_82.ToFloorInfo(local_86.opCall().GetScaledShape()));
                    }
                }
            }
            local_10.SetInitialHeightAboveGround(local_18);
            local_10.SetMaxUpwardWarpScale(this.MaxUpwardWarpScale);
            if (this.RootMotionFallDist > 0.0f)
            {
                local_10.SetTotalRootMotionDeltaZ(this.RootMotionFallDist);
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.SetbAnimFakeAirFloating(false);
        Remove local_12;
        local_12.opCall();
        return;
    }
}


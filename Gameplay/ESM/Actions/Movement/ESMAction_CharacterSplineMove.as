

class UESMAction_CharacterSplineMove : UESMBPBaseSpanAction
{
    UESMAction_CharacterSplineMove()
    {
        return;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_5;
        int local_14 = 0;
        USplineComponent local_28;
        int local_44 = 0;
        Has local_4;
        if (!(local_4.opCall()))
        {
            local_5 = false;
        }
        else
        {
            Has local_10;
            local_5 = local_10.opCall();
        }
        if (local_5)
        {
            bool local_11;
            local_11 = !((FECSEntity(local_14.GetSplineEntity()) == ENTITY_ID_NULL));
            if (!(local_11))
            {
                local_11 = false;
            }
            else
            {
                Has local_26;
                local_11 = local_26.opCall();
            }
            if (local_11)
            {
                Get local_32;
                local_28 = local_32.opCall().GetSpline();
                if (local_28 == nullptr)
                {
                    return;
                }
                FVector local_40;
                int local_42 = ::FHookMoveUtils::GetBestOffsetIndexFromSpline(local_14.GetSplineEntity(), Context.GetEntity(), local_40);
                local_44.SetSplineEntity(local_14.GetSplineEntity());
                local_44.SetDistanceOnSpline(0.0f);
                local_44.SetSplineTotalLength(local_28.GetSplineLength());
                local_44.SetbMovingToStart(true);
                local_44.SetbUseRootMotionSpeed(false);
                local_44.SetRootMotionSpeedPct(1.0f);
                local_44.SetStartLocationOnSpline(local_40);
                local_44.SetCurrentOffsetIndex(local_42);
                local_44.SetbIsMoving(true);
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_8 = 0;
        Has local_4;
        bool local_5 = local_4.opCall();
        if (local_5)
        {
            local_8.SetbIsMoving(false);
            Remove local_16;
            local_16.opCall();
        }
        return;
    }
}


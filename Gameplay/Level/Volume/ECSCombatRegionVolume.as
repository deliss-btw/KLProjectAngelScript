

class AECSCombatRegionVolume : AECSRegionVolume
{
    UPROPERTY()
    TArray<FVector> PreferAreaPoints;

    default bAffectCombat = true;

    AECSCombatRegionVolume()
    {
        super();
        return;
    }
    UFUNCTION()
    bool IsPointInPreferArea(const FVector &inout WorldPoint) const
    {
        bool local_3;
        float local_34;
        float local_36;
        float local_38;
        float local_40;
        int local_2 = this.PreferAreaPoints.Num();
        if (local_2 < 3)
        {
            return false;
        }
        FVector local_22 = (WorldPoint - this.GetActorLocation());
        float local_24 = local_22.X;
        float local_28 = local_22.Y;
        bool local_29 = false;
        int local_1 = local_2 - 1;
        int local_31 = 0;
        for (; local_31 < local_2; )
        {
            local_34 = this.PreferAreaPoints[local_31].X;
            local_36 = this.PreferAreaPoints[local_31].Y;
            local_38 = this.PreferAreaPoints[local_1].X;
            local_40 = this.PreferAreaPoints[local_1].Y;
            local_3 = !((local_36 > local_28));
            bool local_41 = !((local_40 > local_28));
            if (local_3 == local_41)
            {
                local_3 = false;
            }
            else
            {
                float local_26 = local_38 - local_34;
                float local_44 = local_28 - local_36;
                local_26 = local_26 * local_44;
                local_44 = local_40 - local_36;
                local_26 = local_26 / local_44;
                local_3 = (local_24 < (local_26 + local_34));
            }
            if (local_3)
            {
                local_29 = !(local_29);
            }
            local_1 = local_31;
            ++local_31;
        }
        return local_29;
    }
}


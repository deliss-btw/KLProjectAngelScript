class UESMAction_ApplyEvnEffect : UESMBPBaseInstantAction
{
    UPROPERTY()
    FVector DetectOffset = FVector(0.0, 0.0, -100.0);

    UESMAction_ApplyEvnEffect()
    {
        return;
    }
    UFUNCTION()
    void ViewDo_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_10 = 0;
        const AActor local_20;
        FECSEntity local_4 = Context.GetEntity();
        if ((!(local_10) || (!((local_10.Settings != nullptr)))))
        {
            return;
        }
        local_20 = local_4.GetActor();
        if (local_20 == nullptr)
        {
            return;
        }
        FVector local_26 = local_20.GetActorLocation();
        FHitResult local_98;
        FCollisionQueryParams local_136;
        local_136.bReturnPhysicalMaterial = true;
        bool local_15 = FPhysicsUtils::LineTraceSingle(ECS::GetUEWorld(), EPhysicsTraceTag(2), local_98, local_26, (local_26 + this.DetectOffset), FCollisionObjectQueryParams(ECollisionChannel(0)), local_136);
        if (local_15)
        {
            int local_149 = int(FGamePhysicsUtils::GetPhysicalSurfaceType(FGamePhysicsUtils::GetPhysicalSurfaceName(local_98.GetPhysMaterial())));
            if (local_10.Settings.GroundSettings.Contains(EPhysicalSurface(local_149)))
            {
                FCharacterEnvEffectGroundData& local_152 = local_10.GroundData.FindOrAdd(EPhysicalSurface(local_149));
                FCharacterEnvEffectGroundSettings& local_154 = local_10.Settings.GroundSettings[EPhysicalSurface(local_149)];
                if (!((local_154.MoveMaterialParameterName == NAME_None)))
                {
                    local_152.MoveDurationSeconds = 0.0f;
                    local_152.MoveWeight = 1.0f;
                }
                if ((!((local_154.FallMaterialParameterName == NAME_None))))
                {
                    local_152.FallDurationSeconds = 0.0f;
                    local_152.FallWeight = 1.0f;
                }
            }
        }
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
}


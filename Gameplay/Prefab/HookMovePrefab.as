

// NOTE: class defaults are not authored in this module: AHookPointPrefab (default scalar field AECSPrefab.NetRelevancePolicyType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class AHookPointPrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_HookPoint Point;
    UPROPERTY()
    FT_InteractTrait Interact;
    UPROPERTY()
    FT_Prop_Presentation Presentation;

    AHookPointPrefab()
    {
        this.bStatic = false;
        this.bHasActor = true;
        this.bHasTransform = true;
        FC_HookMoveConfig local_4;
        local_4.MoveSpeed = 1500.0f;
        return;
    }
    UFUNCTION()
    void DrawVisualisationOnSelected_Implementation() const
    {
        this.UpdateDebugDraw();
        return;
    }
    UFUNCTION()
    void PostEditChangePropertyAS_Implementation(const FName &inout PropertyName)
    {
        if ((PropertyName == FName("Interact")) || (PropertyName == FName("Point")))
        {
            this.UpdateDebugDraw();
        }
        return;
    }
    void UpdateDebugDraw() const
    {
        FC_InteractionTargetConfig local_48;
        bool local_63 = false;
        float32 local_64 = 0.0f;
        FVector local_12;
        FC_HookMoveConfig local_14 = local_12 = this.GetActorLocation();
        for (auto& local_30 : local_14.TargetRangeConfigs)
        {
            DebugDraw::DrawDebugSphere(this.GetWorld(), (local_12 + FVector(local_30.GetOffset())), FMath::Max(local_30.GetCrossOverRadius(), 10.0f), 10, FColor::Yellow, false, -1.0f, uint8(0), 0.0f);
        }
        for (auto& local_62 : local_48.InteractionPoints)
        {
            local_63 = false;
            local_64 = -1.0f;
            if (!(local_62.IdentifierPointName.IsNone()) && local_48.InteractionPointOverrides.Contains(local_62.IdentifierPointName))
            {
                const FInteractionPointOverride& local_68 = local_48.InteractionPointOverrides[local_62.IdentifierPointName];
                if (local_68.bOverrideInteractDistanceMax)
                {
                    local_63 = true;
                    local_64 = local_68.InteractDistanceMax;
                }
            }
            if (!(local_62.IdentifierPointName.IsNone()) && local_48.InteractionPointOverrides.Contains(local_62.IdentifierPointName))
            {
                const FInteractionPointOverride& local_68_2 = local_48.InteractionPointOverrides[local_62.IdentifierPointName];
                if (local_68_2.bOverrideTraceCheckOffsets)
                {
                    local_62.DebugDraw(this.GetWorld(), this.GetActorTransform(), local_68_2.TraceCheckOffsets);
                    continue;
                }
            }
            local_62.DebugDraw(this.GetWorld(), this.GetActorTransform(), local_62.TraceCheckOffsets);
        }
        return;
    }
}


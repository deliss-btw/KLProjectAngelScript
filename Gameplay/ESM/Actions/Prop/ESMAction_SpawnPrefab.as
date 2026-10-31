enum ETransformMode
{
    Absolute,
    RelativeToEntity,
}

class UESMAction_SpawnPrefab : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bRemakeSelf = false;
    UPROPERTY()
    TSubclassOf<AECSPrefab> PrefabClass;
    UPROPERTY()
    ETransformMode LocationOffsetMode = ETransformMode(1);
    UPROPERTY()
    FVector Location = FVector::ZeroVector;
    UPROPERTY()
    ETransformMode RotationOffsetMode = ETransformMode(1);
    UPROPERTY()
    FRotator Rotation = FRotator::ZeroRotator;
    UPROPERTY()
    bool bSpawnOnGround = false;
    UPROPERTY()
    float32 SpawnOnGroundMaxTraceDownDist = 1000.0f;
    UPROPERTY()
    float32 SpawnOnGroundHeightFromGround = 50.0f;

    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_172;
        int local_186 = 0;
        int local_192 = 0;
        int local_198 = 0;
        FVector local_6 = this.Location;
        FRotator local_12 = this.Rotation;
        if (Context.GetEntity().IsValid())
        {
            Get local_18;
            const FC_Transform& local_20 = local_18.opCall();
            if (local_20)
            {
                if (int(this.LocationOffsetMode) == 1)
                {
                    local_6 += local_20.GetPosition();
                }
                if (int(this.RotationOffsetMode) == 1)
                {
                    local_12 += local_20.GetRotation().Rotator();
                }
            }
        }
        bool local_43 = true;
        if (this.bSpawnOnGround)
        {
            FHitResult local_110;
            FCollisionQueryParams local_148;
            local_148.bTraceComplex = false;
            local_148.AddIgnoredEntityId(Context.GetEntity().GetId().GetIdValue());
            FCollisionResponseParams local_170;
            local_172 = FPhysicsUtils::LineTraceSingle(Context.GetEntity(), false, EPhysicsTraceTag(38), local_110, local_6, (local_6 - (FVector(FVector::UpVector) * this.SpawnOnGroundMaxTraceDownDist)), FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)), local_148, local_170);
            if (local_172)
            {
                XLog(ELog(4), FString().Append("SpawnPrefab SpawnOnGround hit at ").Append(local_110.Location).Append(", adjusted Z from ").Append(local_6.Z).Append(" to ").Append((local_110.Location.Z + this.SpawnOnGroundHeightFromGround)));
                local_6.Z = (local_110.Location.Z + this.SpawnOnGroundHeightFromGround);
            }
            else
            {
                XLog(ELog(4), FString().Append("SpawnPrefab SpawnOnGround trace failed from ").Append(local_6).Append(" downward ").Append(this.SpawnOnGroundMaxTraceDownDist).Append(", skip spawn"));
                local_43 = false;
            }
        }
        local_172 = !(local_43);
        if (local_172)
        {
            return;
        }
        if (this.bRemakeSelf)
        {
            if (!(local_192))
            {
                local_172 = false;
            }
            else
            {
                local_172 = local_186;
            }
            local_172 = local_172 && local_186.PrefabClass.IsValid();
            local_172 = local_172 && local_186.Prefab.IsValid();
            if (local_172)
            {
                ECS::RequestEntityByPrefabDeferred(local_186.PrefabClass.Get(), local_6, local_12, EPrefabCollisionAlignment(2), EECSRegType(0), false);
                if (local_198)
                {
                    FC_EcologyPropLayoutInfo local_256;
                    Assign local_214;
                    if (local_214.opCall(local_256))
                    {
                    }
                    FC_EcologyPropPendingInitSpawnerInfoTag local_264;
                    Assign local_262;
                    local_262.opCall(local_264);
                    FC_EcologyPropPendingInitActivationStateTag local_270;
                    Assign local_268;
                    local_268.opCall(local_270);
                }
            }
            return;
        }
        if (this.PrefabClass.IsValid())
        {
            ECS::RequestEntityByPrefabDeferred(this.PrefabClass, local_6, local_12, EPrefabCollisionAlignment(2), EECSRegType(0), false);
        }
        return;
    }
}


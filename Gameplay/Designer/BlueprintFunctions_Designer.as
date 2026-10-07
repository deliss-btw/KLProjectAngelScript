
namespace BlueprintFunctions_Designer
{
UFUNCTION()
TArray<FVector2D> RandomPointsInCircleFibonacci(const float32 Radius, const int NumPoints, const float32 JitterFraction = 0.15f)
{
    TArray<FVector2D> local_4;
    if ((Radius <= 0.0f || (NumPoints <= 0)))
    {
        return local_4;
    }
    float32 local_11 = FMath::Clamp(JitterFraction, 0.0f, 1.0f);
    float32 local_12 = 2.3999631f;
    float32 local_5 = FMath::DegreesToRadians(FMath::FRand() * 360.0f);
    int local_14 = 0;
    for (; local_14 < NumPoints; )
    {
        float32 local_10 = local_14;
        local_10 = (local_10 + 0.5f) / NumPoints;
        float32 local_17 = FMath::Sqrt((FMath::Clamp(local_10 + ((FMath::FRand() - 0.5f) * (local_11 / NumPoints)), 0.0f, 1.0f))) * Radius;
        float32 local_16 = local_14;
        local_16 = local_5 + (local_16 * local_12);
        float32 local_9 = local_16 + ((FMath::FRand() - 0.5f) * local_11);
        local_4.Add(FVector2D((FMath::Cos(local_9) * local_17), (FMath::Sin(local_9) * local_17)));
        ++local_14;
    }
    return local_4;
}
UFUNCTION()
TArray<FVector2D> RandomPointsInRingFibonacci(const float32 InnerRadius, const float32 OuterRadius, const int NumPoints, const float32 JitterFraction = 0.15f)
{
    TArray<FVector2D> local_4;
    if ((OuterRadius <= 0.0f || (NumPoints <= 0) || (InnerRadius < 0.0f) || (InnerRadius >= OuterRadius)))
    {
        return local_4;
    }
    float32 local_11 = FMath::Clamp(JitterFraction, 0.0f, 1.0f);
    float32 local_12 = 2.3999631f;
    float32 local_9 = FMath::FRand();
    float32 local_5 = FMath::DegreesToRadians(local_9 * 360.0f);
    float32 local_9_2 = InnerRadius * InnerRadius;
    float32 local_13 = OuterRadius * OuterRadius;
    int local_16 = 0;
    for (; local_16 < NumPoints; )
    {
        float32 local_10 = local_16;
        float32 local_14 = local_10 + 0.5f;
        local_10 = local_14 / NumPoints;
        float32 local_19 = FMath::Sqrt((FMath::Clamp((local_10 + ((FMath::FRand() - 0.5f) * (local_11 / NumPoints))), 0.0f, 1.0f) * (local_13 - local_9_2)) + local_9_2);
        float32 local_15 = local_16;
        local_15 = local_5 + (local_15 * local_12);
        local_14 = FMath::FRand() - 0.5f;
        local_14 = local_15 + (local_14 * local_11);
        local_4.Add(FVector2D((FMath::Cos(local_14) * local_19), (FMath::Sin(local_14) * local_19)));
        ++local_16;
    }
    return local_4;
}
UFUNCTION()
void ClampProjectileAimDirectionInEntitySpace(FName &out OutSocketName, EProjectileSpawnRotationType &out OutSpawnRotationType, FRotator3f &out OutRotationOffset, FVector &out OutWorldSpaceFirePosition, FVector &out OutWorldSpaceClampedTargetPosition, const FECSEntityAdapter &inout Entity, const FName &inout SocketName, const FVector &inout WorldSpaceTargetPosition, const FVector &inout EntitySpaceTargetPositionOffset, const FVector &inout EntitySpaceSocketOffset, const FVector &inout EntityRootSpaceSocketPosition, const FVector &inout EntitySpaceAimRotationClampMin, const FVector &inout EntitySpaceAimRotationClampMax, const bool bFallbackCondition = false, const bool bForceYawOnlyEntitySpace = false, const bool bDrawDebug = false)
{
    GetDefaulted local_52;
    Has local_116;
    float32 local_123;
    UWorld local_156;
    FName local_2;
    OutSocketName = local_2;
    OutSpawnRotationType = EProjectileSpawnRotationType(0);
    OutRotationOffset = FRotator3f();
    OutWorldSpaceFirePosition = FVector();
    OutWorldSpaceClampedTargetPosition = FVector();
    OutSocketName = SocketName;
    if (bFallbackCondition)
    {
        float32 local_124;
        Get local_122;
        OutSpawnRotationType = EProjectileSpawnRotationType(1);
        OutRotationOffset = FRotator3f::ZeroRotator;
        FTransform local_76 = local_52.opCall().ToFTransform();
        FVector local_82(local_76.GetLocation());
        FRotator local_110 = local_76.GetRotation().Rotator();
        bool local_117 = local_116.opCall();
        if (local_117)
        {
            local_124 = local_122.opCall().GetScaledHalfHeight();
        }
        else
        {
            local_124 = 0.0f;
        }
        FVector local_88 = ((EntityRootSpaceSocketPosition - FVector(0.0, 0.0, local_124)) + EntitySpaceSocketOffset);
        FVector local_130 = (local_110.UnrotateVector((WorldSpaceTargetPosition - local_82)) + EntitySpaceTargetPositionOffset);
        OutWorldSpaceFirePosition = (local_82 + local_110.RotateVector(local_88));
        OutWorldSpaceClampedTargetPosition = (local_82 + local_110.RotateVector(local_130));
        if (bDrawDebug)
        {
            local_156 = ECS::GetUEWorld();
            float32 local_159 = 5.0f;
            int local_160 = 1120403456;
            DebugDraw::DrawDebugSphere(local_156, OutWorldSpaceFirePosition, 100.0f, 16, FColor::Yellow, false, local_159, uint8(0), 0.0f);
            DebugDraw::DrawDebugSphere(local_156, OutWorldSpaceClampedTargetPosition, 100.0f, 16, FColor::Yellow, false, local_159, uint8(0), 0.0f);
        }
        return;
    }
    OutSpawnRotationType = EProjectileSpawnRotationType(0);
    FTransform local_48 = local_52.opCall().ToFTransform();
    FVector local_82_2(local_48.GetLocation());
    FRotator local_94 = local_48.GetRotation().Rotator();
    bool local_117_2 = local_116.opCall();
    if (local_117_2)
    {
        Get local_122;
        local_123 = local_122.opCall().GetScaledHalfHeight();
    }
    else
    {
        local_123 = 0.0f;
    }
    float local_132_2 = local_123;
    FVector local_142_2 = ((EntityRootSpaceSocketPosition - FVector(0.0, 0.0, local_132_2)) + EntitySpaceSocketOffset);
    FVector local_154 = (local_94.UnrotateVector((WorldSpaceTargetPosition - local_82_2)) + EntitySpaceTargetPositionOffset);
    FVector local_130_2 = (local_154 - local_142_2);
    float local_136 = local_130_2.Size();
    float32 local_111 = float32(local_136);
    FVector local_168 = (local_82_2 + local_94.RotateVector(local_142_2));
    OutWorldSpaceFirePosition = local_168;
    int local_160_2 = 1016003125;
    FVector local_206;
    if (bForceYawOnlyEntitySpace)
    {
        float32 local_124;
        FVector local_174 = local_94.RotateVector(FVector(1.0, 0.0, 0.0));
        float local_134;
        FVector local_88_2 = FVector(local_174.X, local_174.Y, 0.0);
        float32 local_187 = 0.0f;
        if (local_88_2.SizeSquared() >= 1e-8)
        {
            float local_136_2 = FMath::RadiansToDegrees(FMath::Atan2(local_174.Y, local_174.X));
            local_187 = float32(local_136_2);
        }
        local_132_2 = local_187;
        FRotator local_110_2 = FRotator(0.0, local_132_2, 0.0);
        if (local_130_2.SizeSquared() >= 1e-8)
        {
            local_206 = local_94.RotateVector(local_130_2).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        }
        else
        {
            local_206 = FVector(1.0, 0.0, 0.0);
        }
        FVector local_180 = local_110_2.UnrotateVector(local_206);
        float32 local_213 = 0.0f;
        float32 local_214 = 0.0f;
        if (local_180.SizeSquared() >= 1e-8)
        {
            local_132_2 = (local_180.X * local_180.X) + (local_180.Y * local_180.Y);
            local_124 = float32(local_132_2);
            local_132_2 = local_180.X;
            local_132_2 = FMath::RadiansToDegrees(FMath::Atan2(local_180.Y, local_132_2));
            local_214 = float32(local_132_2);
            local_132_2 = FMath::Sqrt(local_124);
            local_132_2 = FMath::RadiansToDegrees(FMath::Atan2(local_180.Z, local_132_2));
            local_213 = float32(local_132_2);
        }
        float32 local_159_2 = float32(EntitySpaceAimRotationClampMax.Y);
        float32 local_217 = FMath::Clamp(local_213, float32(EntitySpaceAimRotationClampMin.Y), local_159_2);
        local_124 = float32(EntitySpaceAimRotationClampMax.Z);
        local_159_2 = FMath::Clamp(local_214, float32(EntitySpaceAimRotationClampMin.Z), local_124);
        float32 local_220 = FMath::Clamp(0.0f, float32(EntitySpaceAimRotationClampMin.X), float32(EntitySpaceAimRotationClampMax.X));
        float32 local_218 = FMath::Cos(local_217 * 0.017453292f);
        local_124 = 0.017453292f;
        local_124 = FMath::Sin(local_217 * local_124);
        float32 local_222 = local_159_2 * 0.017453292f;
        float32 local_219 = FMath::Cos(local_222);
        float32 local_221 = FMath::Sin(local_159_2 * 0.017453292f);
        local_134 = local_124;
        local_222 = local_218 * local_221;
        local_132_2 = local_222;
        FVector local_186 = local_110_2.RotateVector(FVector((local_218 * local_219), local_132_2, local_134));
        FVector local_230 = local_94.UnrotateVector(local_186);
        if (local_230.SizeSquared() >= 1e-8)
        {
            local_132_2 = (local_230.X * local_230.X) + (local_230.Y * local_230.Y);
            float32 local_216 = float32(local_132_2);
            local_132_2 = local_230.X;
            local_132_2 = FMath::RadiansToDegrees(FMath::Atan2(local_230.Y, local_132_2));
            float32 local_245 = float32(local_132_2);
            local_132_2 = FMath::Sqrt(local_216);
            local_132_2 = FMath::RadiansToDegrees(FMath::Atan2(local_230.Z, local_132_2));
            local_222 = float32(local_132_2);
        }
        float32 local_245_2 = 0.0f;
        local_132_2 = local_111;
        OutWorldSpaceClampedTargetPosition = (local_168 + (local_186 * local_132_2));
        if (bDrawDebug)
        {
            FVector local_236 = (local_82_2 + local_94.RotateVector(local_154));
            local_156 = ECS::GetUEWorld();
            float32 local_216_2 = 5.0f;
            DebugDraw::DrawDebugSphere(local_156, local_168, 100.0f, 16, FColor::Green, false, local_216_2, uint8(0), 0.0f);
            DebugDraw::DrawDebugSphere(local_156, local_236, 100.0f, 16, FColor::Red, false, local_216_2, uint8(0), 0.0f);
            DebugDraw::DrawDebugSphere(local_156, OutWorldSpaceClampedTargetPosition, 100.0f, 16, FColor::Cyan, false, local_216_2, uint8(0), 0.0f);
            local_245_2 = local_111 * 0.5f;
            DebugDraw::DrawDebugDirectionalArrow(local_156, local_168, (local_168 + (local_206 * local_245_2)), 60.0f, FColor::Red, false, local_216_2, uint8(0), 8.0f);
            FVector local_242_2 = (local_186 * local_111);
            DebugDraw::DrawDebugDirectionalArrow(local_156, local_168, (local_168 + local_242_2), 60.0f, FColor::Green, false, local_216_2, uint8(0), 8.0f);
        }
        return;
    }
    float32 local_255_2 = 0.0f;
    float32 local_254_2 = 0.0f;
    float32 local_187_2 = 0.0f;
    if (local_130_2.SizeSquared() >= 1e-8)
    {
        local_132_2 = (local_130_2.X * local_130_2.X) + (local_130_2.Y * local_130_2.Y);
        float32 local_224 = float32(local_132_2);
        local_132_2 = local_130_2.X;
        local_132_2 = FMath::RadiansToDegrees(FMath::Atan2(local_130_2.Y, local_132_2));
        local_254_2 = float32(local_132_2);
        local_132_2 = FMath::Sqrt(local_224);
        local_132_2 = FMath::RadiansToDegrees(FMath::Atan2(local_130_2.Z, local_132_2));
        local_255_2 = float32(float32(local_132_2));
        local_187_2 = 0.0f;
    }
    float32 local_253_2 = float32(EntitySpaceAimRotationClampMax.Y);
    float32 local_222_2 = FMath::Clamp(local_255_2, float32(EntitySpaceAimRotationClampMin.Y), local_253_2);
    float32 local_213_2 = FMath::Clamp(local_254_2, float32(EntitySpaceAimRotationClampMin.Z), float32(EntitySpaceAimRotationClampMax.Z));
    local_253_2 = float32(EntitySpaceAimRotationClampMax.X);
    float32 local_224_2 = FMath::Clamp(local_187_2, float32(EntitySpaceAimRotationClampMin.X), local_253_2);
    float32 local_245_4 = local_222_2 * 0.017453292f;
    float32 local_214_2 = FMath::Cos(local_245_4);
    local_253_2 = 0.017453292f;
    local_245_4 = local_222_2 * local_253_2;
    local_253_2 = FMath::Sin(local_245_4);
    local_245_4 = local_213_2 * 0.017453292f;
    float32 local_216_3 = FMath::Cos(local_245_4);
    local_245_4 = local_213_2 * 0.017453292f;
    float32 local_217_2 = FMath::Sin(local_245_4);
    float32 local_159_3 = local_214_2 * local_217_2;
    local_132_2 = local_159_3;
    local_245_4 = local_214_2 * local_216_3;
    FVector local_88_3 = local_94.RotateVector(FVector(local_245_4, local_132_2, local_253_2));
    float local_134_3 = local_111;
    local_206 = (local_88_3 * local_134_3);
    OutWorldSpaceClampedTargetPosition = (local_168 + local_206);
    if (bDrawDebug)
    {
        float32 local_124;
        local_206 = (local_82_2 + local_94.RotateVector(local_154));
        local_245_4 = local_255_2 * 0.017453292f;
        local_159_3 = FMath::Cos(local_245_4);
        local_245_4 = local_255_2 * 0.017453292f;
        local_124 = FMath::Sin(local_245_4);
        local_245_4 = local_254_2 * 0.017453292f;
        float32 local_218_2 = FMath::Cos(local_245_4);
        local_245_4 = local_254_2 * 0.017453292f;
        float32 local_219_2 = FMath::Sin(local_245_4);
        local_132_2 = local_124;
        float local_136_7 = (local_159_3 * local_219_2);
        local_245_4 = local_159_3 * local_218_2;
        FVector local_212 = local_94.RotateVector(FVector(local_245_4, local_136_7, local_132_2));
        XLog(ELog(0), FString().Append("ClampProjectileAim worldDir unclamped=(").Append(local_212.X).Append(", ").Append(local_212.Y).Append(", ").Append(local_212.Z).Append(") clamped=(").Append(local_88_3.X).Append(", ").Append(local_88_3.Y).Append(", ").Append(local_212).Append(") deg unclamped=(").Append(local_255_2).Append(",").Append(local_254_2).Append(",").Append(local_187_2).Append(") clamped=(").Append(local_222_2).Append(",").Append(local_213_2).Append(",").Append(local_224_2).Append(")"));
        local_156 = ECS::GetUEWorld();
        int local_262 = 1090519040;
        DebugDraw::DrawDebugSphere(local_156, local_168, 100.0f, 16, FColor::Green, false, 5.0f, uint8(0), 0.0f);
        DebugDraw::DrawDebugSphere(local_156, local_206, 100.0f, 16, FColor::Red, false, 5.0f, uint8(0), 0.0f);
        DebugDraw::DrawDebugSphere(local_156, OutWorldSpaceClampedTargetPosition, 100.0f, 16, FColor::Cyan, false, 5.0f, uint8(0), 0.0f);
        float local_136_8 = (local_111 * 0.5f);
        FVector local_186_2 = (local_212 * local_136_8);
        DebugDraw::DrawDebugDirectionalArrow(local_156, local_168, (local_168 + local_186_2), 60.0f, FColor::Red, false, 5.0f, uint8(0), 8.0f);
        local_134_3 = local_111;
        FVector local_200_2 = (local_88_3 * local_134_3);
        DebugDraw::DrawDebugDirectionalArrow(local_156, local_168, (local_168 + local_200_2), 60.0f, FColor::Green, false, 5.0f, uint8(0), 8.0f);
    }
    return;
}
UFUNCTION()
void TransformPositionFromEntityYawOnlySpace(bool &out bIsValid, FVector &out OutWorldPosition, const FECSEntityAdapter &inout Entity, const FVector &inout LocalOffset)
{
    bIsValid = false;
    FVector local_8;
    OutWorldPosition = local_8;
    if (!(Entity.IsValid()))
    {
        bIsValid = false;
        OutWorldPosition = LocalOffset;
        return;
    }
    bIsValid = true;
    GetDefaulted local_40;
    FTransform local_64 = local_40.opCall().ToFTransform();
    FVector local_70(local_64.GetLocation());
    FRotator local_98 = local_64.GetRotation().Rotator();
    FVector local_116 = local_98.RotateVector(FVector(1.0, 0.0, 0.0));
    FVector local_76 = FVector(local_116.X, local_116.Y, 0.0);
    float32 local_123 = 0.0f;
    if (local_76.SizeSquared() >= 1e-8)
    {
        local_123 = float32((FMath::RadiansToDegrees(FMath::Atan2(local_116.Y, local_116.X))));
    }
    OutWorldPosition = (local_70 + FRotator(0.0, local_123, 0.0).RotateVector(LocalOffset));
    return;
}
UFUNCTION()
void TransformRotationFromEntityYawOnlySpace(bool &out bIsValid, FRotator &out OutWorldRotation, const FECSEntityAdapter &inout Entity, const FRotator &inout RotationOffset)
{
    bIsValid = false;
    FRotator local_8;
    OutWorldRotation = local_8;
    if (!(Entity.IsValid()))
    {
        bIsValid = false;
        OutWorldRotation = RotationOffset;
        return;
    }
    bIsValid = true;
    GetDefaulted local_40;
    FTransform local_64 = local_40.opCall().ToFTransform();
    FRotator local_86 = local_64.GetRotation().Rotator();
    FVector local_110 = local_86.RotateVector(FVector(1.0, 0.0, 0.0));
    FVector local_98 = FVector(local_110.X, local_110.Y, 0.0);
    float32 local_117 = 0.0f;
    if (local_98.SizeSquared() >= 1e-8)
    {
        local_117 = float32((FMath::RadiansToDegrees(FMath::Atan2(local_110.Y, local_110.X))));
    }
    FQuat local_148 = (FQuat(FRotator(0.0, local_117, 0.0)) * FQuat(RotationOffset));
    OutWorldRotation = local_148.Rotator();
    return;
}
UFUNCTION()
void RootMotionSlowStart(const FECSEntityAdapter &inout Entity, const float32 HorizontalScale = 0.5f, const float32 VerticalScale = 0.5f, const float32 YawScale = 1.0f)
{
    int local_16 = 0;
    if (!(ECS::IsAuthorityOrPrediction(Entity.opImplConv())))
    {
        return;
    }
    float32 local_6 = FMath::Max(VerticalScale, 0.0f);
    float32 local_9 = FMath::Max(YawScale, 0.0f);
    local_16.SetExtraHorizontalScale((FMath::Max(HorizontalScale, 0.0f)) - 1.0f);
    local_16.SetExtraVerticalScale(local_6 - 1.0f);
    local_16.SetExtraYawScale(local_9 - 1.0f);
    return;
}
UFUNCTION()
void RootMotionSlowEnd(const FECSEntityAdapter &inout Entity)
{
    if (!(ECS::IsAuthorityOrPrediction(Entity.opImplConv())))
    {
        return;
    }
    Remove local_10;
    local_10.opCall();
    return;
}
UFUNCTION()
void SendCustomAbilityEffectEventToEntity(const FECSEntityAdapter &inout SenderEntity, const FECSEntity &inout TargetEntity, const TSubclassOf<UEASAbility> &inout TargetAbilityClass, const FName &inout EventName)
{
    int local_12 = 0;
    int local_54 = 0;
    int local_64 = 0;
    if (!(TargetEntity.IsValid()) || (TargetAbilityClass == nullptr))
    {
        return;
    }
    Has local_6;
    if (!(local_6.opCall()))
    {
        return;
    }
    FECSEntity local_32 = FECSEntity(local_12.GetInstanceEntityId(FSoftClassPath(TargetAbilityClass)));
    if (!(local_32.IsValid()))
    {
        return;
    }
    FFPTime local_48;
    if (UEASAbility::GetContextAbility() != nullptr)
    {
        local_48 = UEASAbility::GetContextAbility().GetWorldTime();
    }
    else
    {
        FECSWorldPtr local_40 = TargetEntity.GetWorld();
        GetDefaulted local_44;
        local_48 = local_44.opCall().Time;
    }
    FAbilityEffectEventContext& local_58 = FAbilityUtils::CreateAbilityEffectEvent(local_54, EAbilityEffectEvent(0), EventName, local_48);
    FAbilityEffectEventContext::InitializeEventData(local_58);
    local_64.SetEntity(SenderEntity.opImplConv());
    FVector local_78;
    if (SenderEntity.IsValid())
    {
        local_78 = FTransformUtils::GetLocation(SenderEntity.opImplConv(), FFPTime(-1));
    }
    else
    {
        local_78 = FVector::ZeroVector;
    }
    local_64.SetPosition(local_78);
    return;
}
UFUNCTION()
bool IsCurrentFoundationTalent(const FECSEntityAdapter &inout Entity, const int FoundationIndex)
{
    if (!(Entity.IsValid()))
    {
        return false;
    }
    FECSEntity local_10 = Entity.opImplConv();
    FNameHandle_EntityBBVarInt local_16;
    local_16;
    return (local_10.GetBB_Int(local_16) == FoundationIndex);
}
UFUNCTION()
TArray<FECSEntity> GetDeduplicatedPlayerPawnEntities(const TArray<FECSEntity> &inout PlayerControllerEntities, const float32 ProximityThreshold)
{
    bool local_17;
    Get local_50;
    TArray<FECSEntity> local_4;
    for (auto& local_20 : PlayerControllerEntities)
    {
        local_20;
        Get local_24;
        const FC_PlayerController& local_26 = local_24.opCall();
        if (local_26)
        {
            FECSEntity local_30 = local_26.GetPlayerPawnEntity();
            if (!(local_30.IsValid()))
            {
                local_17 = false;
            }
            else
            {
                Has local_34;
                local_17 = local_34.opCall();
            }
            if (local_17)
            {
                local_4.Add(local_30);
            }
        }
    }
    bool local_35 = true;
    bool local_37 = local_35;
    while (local_37)
    {
        local_37 = false;
        int local_38 = 0;
        FVector local_56 = local_50.opCall().GetPosition();
        int local_58 = local_38 + 1;
        for (; local_58 < local_4.Num(); ++local_58)
        {
            if (local_56.Distance(FVector(local_50.opCall().GetPosition())) < ProximityThreshold)
            {
                local_4.RemoveAt(local_58);
                local_35 = true;
                local_37 = local_35;
                break;
            }
        }
        while (local_35)
        {
            ++local_38;
            if (local_38 >= local_4.Num())
            {
                local_35 = false;
                continue;
            }
            local_35 = !(local_37);
        }
    }
    return local_4;
}
UFUNCTION()
APatrolTargetPoint GetNextPatrolPoint(const APatrolTargetPoint PatrolPoint)
{
    if (PatrolPoint == nullptr)
    {
        return nullptr;
    }
    return PatrolPoint.GetNextPatrolPoint();
}
UFUNCTION()
ATargetPoint GetPatrolConfigSpawnPoint(const FPatrolTargetPointConfig &inout Config)
{
    return Config.PickSpawnPoint();
}
UFUNCTION()
ATargetPoint GetPatrolConfigNextPoint(FPatrolTargetPointConfig &inout Config, int &inout CurrentIndex)
{
    return Config.GetNextPoint(CurrentIndex);
}
UFUNCTION()
void SetAIOutOfCombatDistance(const FECSEntityAdapter &inout Entity, const float32 NewDistance, const float32 NewMaxDistance)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (!(ECS::IsAuthorityOrPrediction(Entity.opImplConv())))
    {
        return;
    }
    if (NewDistance <= 0.0f)
    {
        return;
    }
    Modify local_12;
    FC_AIKnowledge& local_14 = local_12.opCall();
    if (local_14)
    {
        local_14.OutOfCombatDistanceOverride = NewDistance;
        local_14.OutOfCombatMaxDistanceOverride = NewMaxDistance;
    }
    return;
}
UFUNCTION()
void GetEntityCurrentSpawnInitEntryName(bool &out OutValid, FName &out OutEntryName, const FECSEntityAdapter &inout Entity)
{
    FEntitySpawnInitEntry local_12;
    OutValid = false;
    FName local_4;
    OutEntryName = local_4;
    OutEntryName = NAME_None;
    OutValid = false;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (!(FEcologySpawnerUtils::GetCurrentSpawnInitEntry(Entity.opImplConv(), local_12)))
    {
        return;
    }
    OutEntryName = local_12.InitEntryName;
    OutValid = true;
    return;
}
UFUNCTION()
FECSEntity SpawnHookMovePointAtLocation(const FVector &inout Position, const FRotator &inout Rotation = FRotator::ZeroRotator)
{
    TSoftClassPtr<AECSPrefab> local_10 = TSoftClassPtr<AECSPrefab>(FSoftObjectPath("/Game/MoleRes/Dev/Prefab/Level/Prefab_HookMovePoint.Prefab_HookMovePoint_C"));
    TSubclassOf<AECSPrefab> local_22 = local_10.Get();
    if (!(local_22.IsValid()))
    {
        XError(ELog(0), "SpawnHookMovePointAtLocation failed: Prefab_HookMovePoint class not loaded");
        return ENTITY_NULL;
    }
    FECSEntity local_34 = ECS::RequestEntityByPrefabDeferred(local_22, Position, Rotation, EPrefabCollisionAlignment(2), EECSRegType(0), false);
    if (!(local_34.IsValid()))
    {
        XError(ELog(0), "SpawnHookMovePointAtLocation failed: RequestEntityByPrefabDeferred returned invalid entity");
    }
    return local_34;
}
UFUNCTION()
FVector FindRandomReachablePointInRadiusWithAngle(bool &out bFound, const FECSEntity &inout Entity, const FVector &inout OriginPoint, const float32 MinRadius, const float32 MaxRadius, const float32 MinHeight, const float32 MaxHeight, const float32 AngleOffset, const float32 AngleClamp, const int MaxAttempt = 10)
{
    bFound = false;
    bFound = false;
    int local_4 = 0;
    GetDefaulted local_20;
    FQuat local_16 = local_20.opCall().GetRotation();
    FVector local_32 = local_16.GetForwardVector();
    float local_38_2 = (FMath::Atan2(local_32.Y, local_32.X)) + FMath::DegreesToRadians(AngleOffset);
    float local_46 = FMath::DegreesToRadians(AngleClamp);
    while (local_4 < MaxAttempt)
    {
        float local_42 = -(local_46);
        float local_36_2 = local_38_2 + BlueprintFunctions_Ability::RandomRange(float32(local_42), float32(local_46));
        float local_52 = BlueprintFunctions_Ability::RandomRange(MinRadius, MaxRadius);
        float local_54 = BlueprintFunctions_Ability::RandomRange(MinHeight, MaxHeight);
        float local_48 = FMath::Sin(local_36_2) * local_52;
        local_42 = FMath::Cos(local_36_2) * local_52;
        FVector local_66 = (OriginPoint + FVector(local_42, local_48, local_54));
        if (FAIPathFollowUtils::IsReachableOnNavMesh(Entity, OriginPoint, local_66))
        {
            bFound = true;
            return local_66;
        }
        ++local_4;
    }
    return OriginPoint;
}
UFUNCTION()
void SortEntitiesByDistanceToEntity(TArray<FECSEntity> &inout Entities, const FECSEntity &inout ReferenceEntity)
{
    Has local_6;
    if (!(ReferenceEntity.IsValid()) || !(local_6.opCall()))
    {
        return;
    }
    for (auto& local_22 : Entities)
    {
        if (!(local_22.IsValid()) || !(local_6.opCall()))
        {
            return;
        }
    }
    Get local_32;
    FVector local_38 = local_32.opCall().GetPosition();
    TArray<float32> local_42;
    int local_43 = Entities.Num();
    local_42.Reserve(local_43);
    for (auto& local_22 : Entities)
    {
        local_22;
        local_42.Add(float32(((FVector(local_32.opCall().GetPosition()) - local_38).SizeSquared())));
    }
    int local_43_2 = Entities.Num();
    int local_55 = 0;
    for (; local_55 < (local_43_2 - 1); ++local_55)
    {
        int local_57 = local_55;
        int local_59 = local_55 + 1;
        for (; local_59 < local_43_2; ++local_59)
        {
            if (local_42[local_59] < local_42[local_57])
            {
                local_57 = local_59;
            }
        }
        if (local_57 != local_55)
        {
            float32 local_65;
            FECSEntity local_64 = FECSEntity(Entities[local_55]);
            Entities[local_55] = Entities[local_57];
            Entities[local_57] = local_64;
            local_65 = local_42[local_55];
            local_42[local_55] = local_42[local_57];
            local_42[local_57] = local_65;
        }
    }
    return;
}
UFUNCTION()
void SetFlockClaimNewResourceSpecified(const FECSEntity &inout BossEntity, const FECSEntityId &inout ResourceID)
{
    if (!(BossEntity.IsValid()))
    {
        XLog(ELog(30), "SetFlockClaimNewResourceSpecified: BossEntity ж— ж•€пјЊи·іиї‡е€‡жЌў");
        return;
    }
    if (!(ECS::IsAuthorityOrPrediction(BossEntity)))
    {
        return;
    }
    FECSEntity local_10 = FEcologyUtils::GetFlockEntity(BossEntity);
    Has local_14;
    if (!(local_10.IsValid()) || !(local_14.opCall()))
    {
        XLog(ELog(30), FString().Append("SetFlockClaimNewResourceSpecified: BossEntity ").Append(BossEntity.GetIdValue()).Append(" жњЄж‰ѕе€°жњ‰ж•€ FlockпјЊи·іиї‡е€‡жЌў"));
        return;
    }
    FECSEntity local_6 = FECSEntity(BossEntity.GetWorld(), ResourceID);
    Has local_32;
    if (!(local_6.IsValid()) || !(local_32.opCall()))
    {
        XLog(ELog(30), FString().Append("SetFlockClaimNewResourceSpecified: з›®ж ‡иµ„жєђж— ж•€ж€–йќћиµ„жєђз‚№ ResourceId ").Append(ResourceID).Append("пјЊи·іиї‡е€‡жЌў"));
        return;
    }
    FEcologyBehaviorUtils::FlockClaimNewResource(local_10, local_6, true);
    FEcologyBehaviorUtils::AllocateChildSlotData(local_10, false, 1.0f);
    return;
}
}

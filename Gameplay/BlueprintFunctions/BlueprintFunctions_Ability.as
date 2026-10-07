
namespace BlueprintFunctions_Ability
{
FFPTime GetWorldTime(const FECSEntity &inout ContextEntity)
{
    return BlueprintFunctions_Common::GetWorldTime(ContextEntity);
}
UFUNCTION()
void AddGameplayTags(const FGameplayTagContainer &inout Tags)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    local_2.GetOwnerEntity().AddGameplayTags(Tags, local_2.GetFName());
    return;
}
UFUNCTION()
void RemoveGameplayTags(const FGameplayTagContainer &inout Tags)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    local_2.GetOwnerEntity().RemoveGameplayTags(Tags, local_2.GetFName());
    return;
}
UFUNCTION()
bool HasGameplayTag(const FECSEntityAdapter &inout Entity, const FGameplayTag &inout Tag)
{
    return Entity.GetEntity().MatchGameplayTag(Tag);
}
UFUNCTION()
void AddAttackIgnoreTargetCondition(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FAttackData> &inout AttackData, FAttackIgnoreTargetCondition &inout Conditon)
{
    int local_22 = 0;
    if ((!((Conditon.GetRoot() != nullptr))))
    {
        if (UEASAbility::GetContextAbility() != nullptr)
        {
            XError(ELog(8), FString().Append("AddAttackIgnoreTargetCondition's param Conditon must be a variable in BP, ability: ").Append(UEASAbility::GetContextAbility().GetAbilityName()));
        }
        else
        {
            XError(ELog(8), FString().Append("AddAttackIgnoreTargetCondition's param Conditon must be a variable in BP"));
        }
        return;
    }
    if (AttackData)
    {
        TDataObjectPtr<FAttackIgnoreTargetCondition> local_70;
        local_22.GetModify_ConditionByAttackData().Add(AttackData, local_70);
    }
    return;
}
UFUNCTION()
void RemoveAttackIgnoreTargetCondition(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FAttackData> &inout AttackData)
{
    if (AttackData)
    {
        Modify local_6;
        if (local_6.opCall())
        {
        }
    }
    return;
}
UFUNCTION()
void MarkIgnoreAttackFromEntity(const FECSEntityAdapter &inout TargetEntity, const FECSEntityAdapter &inout SourceEntity)
{
    int local_8 = 0;
    if (!(TargetEntity.IsValid()) || !(SourceEntity.IsValid()))
    {
        return;
    }
    if (!(local_8.GetIgnoredEntities().Contains(SourceEntity.opImplConv())))
    {
        local_8.GetModify_IgnoredEntities().Add(SourceEntity.opImplConv());
    }
    return;
}
UFUNCTION()
void UndoIgnoreAttackFromEntity(const FECSEntityAdapter &inout TargetEntity, const FECSEntityAdapter &inout SourceEntity)
{
    if (!(TargetEntity.IsValid()) || !(SourceEntity.IsValid()))
    {
        return;
    }
    Modify local_6;
    if (local_6.opCall())
    {
        FECSEntity local_12 = SourceEntity.opImplConv();
    }
    return;
}
UFUNCTION()
bool MatchAttackCategory(const int InputAttackCategory, const EAttackCategory AttackCategory)
{
    int local_1 = InputAttackCategory & (1 << int(AttackCategory));
    return (local_1 != 0);
}
UFUNCTION()
FC_ProjectileHealth GetProjectileHealth(const FECSEntityAdapter &inout ProjectileEntity)
{
    GetDefaulted local_4;
    return local_4.opCall();
}
UFUNCTION()
void KillAbilityOwner(const bool bDestroyImmediately = false, const bool bHasDropItem = true)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if (local_2 != nullptr)
    {
        if (local_2.GetIsServer() || (int(local_2.GetOwnerEntity().GetRegistryType()) == 2))
        {
            FLifeCycleUtils::KillEntityCheckNearDeathRule(local_2.GetOwnerEntity(), local_2.GetOwnerEntity().GetId(), local_2.GetWorldTime(), true, true, bDestroyImmediately, bHasDropItem);
        }
    }
    return;
}
UFUNCTION()
void DisableLogicCollider(const FECSEntityAdapter &inout Entity, const FName &inout ColliderName, const bool bDisabled)
{
    FCollisionUtils::DisablePushCollider(Entity.opImplConv(), ColliderName, ECS::GetContextTime(), bDisabled);
    return;
}
UFUNCTION()
void SetSteadfastMovement(const FECSEntityAdapter &inout Entity, const bool bEnable)
{
    FC_SteadfastMovementCounter& local_8;
    if (!(Entity.IsValid()))
    {
        return;
    }
    if (bEnable)
    {
        local_8.SetCounter((local_8.GetCounter() + 1));
        return;
    }
    Modify local_14;
    local_8 = local_14.opCall();
    if (local_8)
    {
        int local_9_2 = local_8.GetCounter();
        local_8.SetCounter((local_8.GetCounter() - 1));
    }
    return;
}
UFUNCTION()
void DisableHitBox(const FECSEntityAdapter &inout Entity, const FName &inout HitBoxName, const bool bDisabled)
{
    FCollisionUtils::DisableHitBox(Entity.opImplConv(), HitBoxName, ECS::GetContextTime(), bDisabled);
    return;
}
UFUNCTION()
void DisableComponentColliderAndVisibility(const FECSEntityAdapter &inout Entity, const FName &inout ComponentName, const bool bDisabled)
{
    FCollisionUtils::DisablePushCollider(Entity.opImplConv(), ComponentName, ECS::GetContextTime(), bDisabled);
    FCollisionUtils::DisableHitBox(Entity.opImplConv(), ComponentName, ECS::GetContextTime(), bDisabled);
    FVisibilityUtils::SetEntityMeshHidden(Entity.opImplConv(), ComponentName, bDisabled);
    return;
}
UFUNCTION()
float32 RandomFraction()
{
    if ((!((UEASAbility::GetContextAbility() != nullptr))))
    {
        XError(ELog(8), FString().Append("RandomFraction's can only use in ability!"));
        return 0.0f;
    }
    return FAbilityUtils::AbilityRandomFraction(UEASAbility::GetContextAbility().GetAbilityEntity());
}
UFUNCTION()
float32 RandomRange(const float32 Min, const float32 Max)
{
    return FMath::Lerp(Min, Max, BlueprintFunctions_Ability::RandomFraction());
}
UFUNCTION()
FVector2D RandomDirection2D()
{
    float32 local_3 = FMath::DegreesToRadians((BlueprintFunctions_Ability::RandomFraction() * 360.0f));
    return FVector2D(FMath::Cos(local_3), FMath::Sin(local_3));
}
UFUNCTION()
FVector2D RandomPointInCircle(const float32 Radius)
{
    float32 local_2 = BlueprintFunctions_Ability::RandomFraction() * Radius;
    float32 local_4 = FMath::DegreesToRadians((BlueprintFunctions_Ability::RandomFraction() * 360.0f));
    return FVector2D((FMath::Cos(local_4) * local_2), (FMath::Sin(local_4) * local_2));
}
UFUNCTION()
void OverrideLinearMovement(const FECSEntityAdapter &inout Entity, const FVector &inout Velocity)
{
    int local_6 = 0;
    int local_12 = 0;
    local_6.SetVelocity(Velocity);
    local_12.SetMoveBeginTime(BlueprintFunctions_Ability::GetWorldTime(Entity.opImplConv()));
    GetDefaulted local_22;
    local_12.SetInitRotation(local_22.opCall().ToFTransform().GetRotation());
    return;
}
UFUNCTION()
void OverrideSimpleMovement(const FECSEntityAdapter &inout Entity, const FSimpleProjectileMovementConfigData &inout Data)
{
    int local_6 = 0;
    int local_12 = 0;
    local_6.SetData(Data);
    local_12.SetMoveBeginTime(BlueprintFunctions_Ability::GetWorldTime(Entity.opImplConv()));
    GetDefaulted local_22;
    local_12.SetInitRotation(local_22.opCall().ToFTransform().GetRotation());
    return;
}
UFUNCTION()
void OverrideThrowMovement(const FECSEntityAdapter &inout Entity, const FThrowMovementConfigData &inout Data)
{
    int local_6 = 0;
    int local_12 = 0;
    local_6.SetData(Data);
    local_12.SetMoveBeginTime(BlueprintFunctions_Ability::GetWorldTime(Entity.opImplConv()));
    GetDefaulted local_22;
    local_12.SetInitRotation(local_22.opCall().ToFTransform().GetRotation());
    return;
}
UFUNCTION()
void OverrideCurveMovement(const FECSEntityAdapter &inout Entity, const FCurveMovementConfigData &inout Data)
{
    int local_6 = 0;
    int local_12 = 0;
    local_6.SetData(Data);
    local_12.SetMoveBeginTime(BlueprintFunctions_Ability::GetWorldTime(Entity.opImplConv()));
    GetDefaulted local_22;
    local_12.SetInitRotation(local_22.opCall().ToFTransform().GetRotation());
    return;
}
UFUNCTION()
void OverrideGroundMovement(const FECSEntityAdapter &inout Entity, const FGroundMovementConfigData &inout Data)
{
    int local_6 = 0;
    int local_12 = 0;
    local_6.SetData(Data);
    local_12.SetMoveBeginTime(BlueprintFunctions_Ability::GetWorldTime(Entity.opImplConv()));
    GetDefaulted local_22;
    local_12.SetInitRotation(local_22.opCall().ToFTransform().GetRotation());
    return;
}
UFUNCTION()
void OverrideTrackMovement(const FECSEntityAdapter &inout Entity, FTrackMovementConfigData &inout Data)
{
    int local_22 = 0;
    int local_76 = 0;
    if ((!((Data.GetRoot() != nullptr))))
    {
        if (UEASAbility::GetContextAbility() != nullptr)
        {
            XError(ELog(0), FString().Append("OverrideTrackMovement's param Data must be a variable in BP, ability: ").Append(UEASAbility::GetContextAbility().GetAbilityName()));
        }
        else
        {
            XError(ELog(0), FString().Append("OverrideTrackMovement's param Data must be a variable in BP"));
        }
        return;
    }
    local_22.SetDataPtr(TDataObjectPtr<FTrackMovementConfigData>());
    local_76.SetMoveBeginTime(BlueprintFunctions_Ability::GetWorldTime(Entity.opImplConv()));
    GetDefaulted local_86;
    local_76.SetInitRotation(local_86.opCall().ToFTransform().GetRotation());
    return;
}
UFUNCTION()
void OverrideFixedDurationMovement(const FECSEntityAdapter &inout Entity, const FFixedDurationMovementConfigData &inout Data)
{
    int local_6 = 0;
    int local_12 = 0;
    local_6.SetData(Data);
    local_12.SetMoveBeginTime(BlueprintFunctions_Ability::GetWorldTime(Entity.opImplConv()));
    GetDefaulted local_22;
    local_12.SetInitRotation(local_22.opCall().ToFTransform().GetRotation());
    return;
}
UFUNCTION()
void OverrideTrackTarget(const FECSEntityAdapter &inout Entity, const FECSEntity &inout TrackTargetEntity, const FVector &inout TargetSpaceOffset = FVector::ZeroVector)
{
    if (!(ECS::IsAuthorityOrPrediction(Entity.opImplConv())))
    {
        return;
    }
    ModifyOrAdd local_10;
    FC_TrackRuntime& local_12 = local_10.opCall();
    if (local_12)
    {
        local_12.SetTrackTarget(FTargetEntity(TrackTargetEntity));
        local_12.SetTrackTargetOffset(TargetSpaceOffset);
        local_12.SetTrackType(ETrackRuntimeType(0));
    }
    return;
}
UFUNCTION()
void OverrideTrackTargetHistoryPosition(const FECSEntityAdapter &inout Entity, const FECSEntity &inout TrackTargetEntity, const FTrackTargetHistoryPosData &inout TrackTargetHistoryPosConfig)
{
    if (!(ECS::IsAuthorityOrPrediction(Entity.opImplConv())))
    {
        return;
    }
    ModifyOrAdd local_10;
    FC_TrackRuntime& local_12 = local_10.opCall();
    if (local_12)
    {
        local_12.SetTrackTarget(FTargetEntity(TrackTargetEntity));
        local_12.SetTrackType(ETrackRuntimeType(2));
        if (TrackTargetEntity.IsValid())
        {
            Get local_20;
            const FC_TransformHistory& local_22 = local_20.opCall();
            if (local_22)
            {
                FC_Transform local_44;
                FECSWorldPtr local_48 = Entity.GetWorld();
                float local_58 = TrackTargetHistoryPosConfig.GetSeconds();
                Get local_52;
                FFPTime local_62 = (FFPTime(local_52.opCall().Time) - FFPTime(local_58));
                local_22.GetInterpoValue(local_62, local_44);
                local_12.SetTrackPos((FVector(local_44.GetPosition()) + FQuat(local_44.GetRotation()).RotateVector(TrackTargetHistoryPosConfig.GetForwardOffset())));
                local_12.SetTrackTargetHistoryPosConfig(TrackTargetHistoryPosConfig);
            }
        }
    }
    return;
}
UFUNCTION()
void OverrideTrackTargetPosition(const FECSEntityAdapter &inout Entity, const FECSEntity &inout TrackTargetEntity, const FTrackTargetPosConfig &inout TrackTargetPosConfig)
{
    if (!(ECS::IsAuthorityOrPrediction(Entity.opImplConv())))
    {
        return;
    }
    ModifyOrAdd local_10;
    FC_TrackRuntime& local_12 = local_10.opCall();
    if (local_12)
    {
        Get local_32;
        FVector local_18(FVector::ZeroVector);
        local_18 = (FVector(local_32.opCall().GetPosition()) + FQuat(local_32.opCall().GetRotation()).RotateVector(TrackTargetPosConfig.ForwardOffset));
        local_12.SetTrackType(ETrackRuntimeType(1));
        local_12.SetTrackPos(local_18);
    }
    return;
}
UFUNCTION()
void OverrideTrackPosition(const FECSEntityAdapter &inout Entity, const FVector &inout TargetPosition)
{
    if (!(ECS::IsAuthorityOrPrediction(Entity.opImplConv())))
    {
        return;
    }
    ModifyOrAdd local_10;
    FC_TrackRuntime& local_12 = local_10.opCall();
    if (local_12)
    {
        local_12.SetTrackType(ETrackRuntimeType(1));
        local_12.SetTrackPos(TargetPosition);
    }
    return;
}
UFUNCTION()
void ResetTrackTargetParams(const FECSEntityAdapter &inout Entity, const FTrackTargetParams &inout TrackTargetParams)
{
    if (!(ECS::IsAuthorityOrPrediction(Entity.opImplConv())))
    {
        return;
    }
    FECSEntity local_10 = Entity.opImplConv();
    Get local_14;
    const FC_Owner& local_16 = local_14.opCall();
    if (local_16)
    {
        local_10 = local_16.GetOwnerEntity();
    }
    Remove local_20;
    local_20.opCall();
    FMovementUtils::SetTrackInfo(Entity.opImplConv(), local_10, TrackTargetParams, BlueprintFunctions_Ability::GetWorldTime(Entity.opImplConv()));
    return;
}
UFUNCTION()
void OrbitMovementByPos(const FECSEntityAdapter &inout Entity, const FVector &inout TargetPos, const FVector &inout OrbitAxis, const FSyncFloatValueVariant &inout CentripetalVelocity, const FSyncFloatValueVariant &inout AngleVelocity, const FSyncFloatValueVariant &inout AxisVelocity = FSyncFloatValueVariant(), const bool bStopWhenReachCenter = true, const bool bRotateToCircleTangentDir = false, const bool bAxisMoveToTargetPlane = false, const bool bAutoCalcAxisVelocity = false)
{
    int local_6 = 0;
    int local_22 = 0;
    local_6.SetTargetType(EOrbitTargetType(0));
    local_6.SetTargetPos(TargetPos);
    local_6.SetAxis(OrbitAxis.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
    local_6.SetCentripetalVelocity(CentripetalVelocity);
    local_6.SetAngleVelocity(AngleVelocity);
    local_6.SetAxisVelocity(AxisVelocity);
    local_6.SetbStopWhenReachCenter(bStopWhenReachCenter);
    local_6.SetbRotateToCircleTangentDir(bRotateToCircleTangentDir);
    local_6.SetbAxisMoveToTargetPlane(bAxisMoveToTargetPlane);
    local_6.SetbAutoCalcAxisVelocity(bAutoCalcAxisVelocity);
    local_22.SetMoveBeginTime(BlueprintFunctions_Ability::GetWorldTime(Entity.opImplConv()));
    local_22.SetMoveTime(FFPTime(0));
    local_22.SetLastMoveTime(FFPTime(0));
    local_22.SetMoveTotalTime(FFPTime(-1));
    GetDefaulted local_34;
    local_22.SetInitRotation(local_34.opCall().ToFTransform().GetRotation());
    return;
}
UFUNCTION()
void OrbitMovementByEntity(const FECSEntityAdapter &inout Entity, const FECSEntity &inout TargetEntity, const FVector &inout OrbitAxis, const FSyncFloatValueVariant &inout CentripetalVelocity, const FSyncFloatValueVariant &inout AngleVelocity, const FSyncFloatValueVariant &inout AxisVelocity = FSyncFloatValueVariant(), const bool bStopWhenReachCenter = true, const bool bRotateToCircleTangentDir = false, const bool bKeepRelativePosAfterTargetEntityMove = true, const bool bAxisMoveToTargetPlane = false)
{
    int local_6 = 0;
    int local_12 = 0;
    int local_20 = 0;
    int local_68 = 0;
    if ((!(local_6) || !(local_12)))
    {
        return;
    }
    local_20.SetTargetType(EOrbitTargetType(1));
    local_20.SetTargetEntity(TargetEntity);
    local_20.SetAxis(OrbitAxis.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
    local_20.SetCentripetalVelocity(CentripetalVelocity);
    local_20.SetAngleVelocity(AngleVelocity);
    local_20.SetAxisVelocity(AxisVelocity);
    local_20.SetbStopWhenReachCenter(bStopWhenReachCenter);
    local_20.SetbRotateToCircleTangentDir(bRotateToCircleTangentDir);
    local_20.SetbKeepRelativePosAfterTargetEntityMove(bKeepRelativePosAfterTargetEntityMove);
    local_20.SetbAxisMoveToTargetPlane(bAxisMoveToTargetPlane);
    FVector local_42 = (FVector(local_6.GetPosition()) - local_12.GetPosition());
    FVector local_54 = local_12.GetPosition();
    local_20.SetCurDistanceToCenter(float32(((FVector(local_6.GetPosition()) - (local_54 + (FVector(local_20.GetAxis()) * local_42.DotProduct(local_20.GetAxis())))).Size())));
    local_68.SetMoveBeginTime(BlueprintFunctions_Ability::GetWorldTime(Entity.opImplConv()));
    local_68.SetMoveTime(FFPTime(0));
    local_68.SetLastMoveTime(FFPTime(0));
    local_68.SetMoveTotalTime(FFPTime(-1));
    local_68.SetInitRotation(local_6.ToFTransform().GetRotation());
    return;
}
UFUNCTION()
void AddMovementEndSignal(const FECSEntityAdapter &inout MovementEntity, const FECSEntity &inout NotifyEntity, const TSubclassOf<UEASAbility> &inout AbilityClass, const FName &inout SignalName)
{
    int local_12 = 0;
    if (!(AbilityClass.IsValid()) || SignalName.IsNone() || !(MovementEntity.IsValid()) || !(NotifyEntity.IsValid()))
    {
        return;
    }
    Has local_6;
    if (!(local_6.opCall()))
    {
        return;
    }
    local_12.SetNotifyEntity(NotifyEntity);
    local_12.SetAbilityClass(TSoftClassPtr<UEASAbility>(AbilityClass));
    local_12.SetSignalName(SignalName);
    return;
}
UFUNCTION()
float32 GetMoveSpeedByHistory(const FECSEntityAdapter &inout MovementEntity, const float32 Duration = 1.0)
{
    if (!(MovementEntity.IsValid()) || (Duration <= 0.0f))
    {
        return 0.0f;
    }
    FVector local_22 = FTransformUtils::SampleLocation(MovementEntity.GetEntity(), ECS::GetContextTime());
    return float32((local_22.Distance(FTransformUtils::SampleLocation(MovementEntity.GetEntity(), FFPTime(FMath::Max(0.0, (ECS::GetContextTime().ToSeconds() - Duration))))) / Duration));
}
UFUNCTION()
void GetHitData(const FAbilityHitEventData &inout EventData, FECSEntity &out DamageTarget, FECSEntity &out FinalDamageSource, FECSEntity &out DirectDamageSource, FVector &out HitPosition, FVector &out StrikeDirection, FVector &out AttackFromPosition, FName &out HitBodyPart, EDamageType &out DamageType, bool &out bHitWeakness, FAttackBaseDamageValue &out BaseDamage, FAttackData &out AttackData)
{
    FECSEntity local_4;
    DamageTarget = local_4;
    FinalDamageSource = FECSEntity();
    DirectDamageSource = FECSEntity();
    HitPosition = FVector();
    StrikeDirection = FVector();
    AttackFromPosition = FVector();
    HitBodyPart = FName();
    DamageType = EDamageType(0);
    bHitWeakness = false;
    BaseDamage = FAttackBaseDamageValue();
    UEASAbility local_882 = UEASAbility::GetContextAbility();
    if (local_882 != nullptr)
    {
        FECSWorldPtr local_888 = local_882.GetECSWorld();
        Get local_892;
        const FCS_DamageToCalculateFrame& local_894 = local_892.opCall();
        if (local_894)
        {
            if (local_894.DamageDatas.IsValidIndex(int(EventData.DamageIndex)))
            {
                const FDamageBeforeCalculationData& local_898 = local_894.DamageDatas[int(EventData.DamageIndex)];
                DamageTarget = local_898.DamageTarget;
                FinalDamageSource = local_898.FinalDamageSource;
                DirectDamageSource = local_898.DirectDamageSource;
                HitPosition = local_898.Position;
                StrikeDirection = local_898.Direction;
                AttackFromPosition = local_898.AttackFromPosition;
                HitBodyPart = local_898.DamageBodyPart;
                DamageType = local_898.DamageType;
                bHitWeakness = local_898.bIsWeakness;
                BaseDamage = local_898.BaseDamage;
                if (local_898.AttackData)
                {
                }
            }
        }
    }
    return;
}
UFUNCTION()
void ModifyBaseDamage(const FAbilityHitEventData &inout EventData, const EBaseDamagePartType BaseDamagePart, const EDamageValueModifyType ModifyType, const float32 Value)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if (local_2 != nullptr)
    {
        FECSWorldPtr local_8 = local_2.GetECSWorld();
        Modify local_12;
        FCS_DamageToCalculateFrame& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.DamageDatas.IsValidIndex(int(EventData.DamageIndex)))
            {
                FDamageUtils::ModifyBaseDamage(local_14.DamageDatas[int(EventData.DamageIndex)].BaseDamage, Value);
            }
        }
    }
    return;
}
UFUNCTION()
void ModifyDamageType(const FAbilityHitEventData &inout EventData, const EDamageType DamageType)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if (local_2 != nullptr)
    {
        FECSWorldPtr local_8 = local_2.GetECSWorld();
        Modify local_12;
        FCS_DamageToCalculateFrame& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.DamageDatas.IsValidIndex(int(EventData.DamageIndex)))
            {
                local_14.DamageDatas[EventData.DamageIndex].DamageType = DamageType;
            }
        }
    }
    return;
}
UFUNCTION()
void MuteDamage(const FAbilityHitEventData &inout EventData)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if (local_2 != nullptr)
    {
        FECSWorldPtr local_8 = local_2.GetECSWorld();
        Modify local_12;
        FCS_DamageToCalculateFrame& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.DamageDatas.IsValidIndex(int(EventData.DamageIndex)))
            {
                FDamageUtils::SetBaseDamageZero(local_14.DamageDatas[int(EventData.DamageIndex)].BaseDamage);
            }
        }
    }
    return;
}
UFUNCTION()
void AddDamageGameplayTags(const FAbilityHitEventData &inout EventData, const FGameplayTagContainer &inout Tags)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if (local_2 != nullptr)
    {
        FECSWorldPtr local_8 = local_2.GetECSWorld();
        Modify local_12;
        FCS_DamageToCalculateFrame& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.DamageDatas.IsValidIndex(int(EventData.DamageIndex)))
            {
                local_14.DamageDatas[int(EventData.DamageIndex)].AttackTags.Append(Tags);
            }
        }
    }
    return;
}
UFUNCTION()
void OverrideDamageGameplayTags(const FAbilityHitEventData &inout EventData, const FGameplayTagContainer &inout Tags)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if (local_2 != nullptr)
    {
        FECSWorldPtr local_8 = local_2.GetECSWorld();
        Modify local_12;
        FCS_DamageToCalculateFrame& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.DamageDatas.IsValidIndex(int(EventData.DamageIndex)))
            {
                local_14.DamageDatas[int(EventData.DamageIndex)].AttackTags.Init(Tags);
            }
        }
    }
    return;
}
UFUNCTION()
void OverrideDamageType(const FAbilityHitEventData &inout EventData, const EDamageType DamageType)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if (local_2 != nullptr)
    {
        FECSWorldPtr local_8 = local_2.GetECSWorld();
        Modify local_12;
        FCS_DamageToCalculateFrame& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.DamageDatas.IsValidIndex(int(EventData.DamageIndex)))
            {
                local_14.DamageDatas[EventData.DamageIndex].DamageType = DamageType;
            }
        }
    }
    return;
}
UFUNCTION()
void ModifyDamageAttribute(const FAbilityHitEventData &inout EventData, const TSubclassOf<UGameAttribute> &inout Attribute, const EGameAttributeModifyType ModifyType = EGameAttributeModifyType::AddBase, const float32 Value = 0.f)
{
    int local_46 = 0;
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if (local_2 != nullptr)
    {
        FECSWorldPtr local_8 = local_2.GetECSWorld();
        Modify local_12;
        FCS_DamageToCalculateFrame& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.DamageDatas.IsValidIndex(int(EventData.DamageIndex)))
            {
                FDamageBeforeCalculationData& local_18 = local_14.DamageDatas[int(EventData.DamageIndex)];
                UClass local_20;
                FGameAttributeRef local_34 = FGameAttributeRef(TSoftClassPtr<UGameAttribute>(local_20));
                if (int(ModifyType) == 1)
                {
                    local_46.ModValue.SetBaseValue((FAttributeModificationFixedPointNum(local_46.ModValue.GetBaseValue()) + FAttributeModificationFixedPointNum(Value)));
                }
                else
                {
                    if (int(ModifyType) == 2)
                    {
                        local_46.ModValue.SetConstValue((FAttributeModificationFixedPointNum(local_46.ModValue.GetConstValue()) + FAttributeModificationFixedPointNum(Value)));
                    }
                    else
                    {
                        if (int(ModifyType) == 3)
                        {
                            local_46.ModValue.SetMultiplierValue((FAttributeModificationFixedPointNum(local_46.ModValue.GetMultiplierValue()) + FAttributeModificationFixedPointNum(Value)));
                        }
                        else
                        {
                            if (int(ModifyType) == 4)
                            {
                                local_46.ModValue.SetIndependentMultiplierValue((FAttributeModificationFixedPointNum(local_46.ModValue.GetIndependentMultiplierValue()) + FAttributeModificationFixedPointNum(Value)));
                            }
                        }
                    }
                }
            }
        }
    }
    return;
}
UFUNCTION()
void GetCalculatedDamage(const FAbilityDamageCalculatedEventData &inout EventData, FDamageFinalValues &out FinalValues, FAttackData &out AttackData, FECSEntity &out FinalDamageSource, FECSEntity &out DirectDamageCauser, FECSEntity &out DamageTarget)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
UFUNCTION()
void ModifyCalculatedDamageValue(const FAbilityDamageCalculatedEventData &inout EventData, const EDamageFinalValueType ValueType, const EDamageValueModifyType ModifyType, const float32 Value)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
UFUNCTION()
bool IsDamageHasAnyTag(const FAbilityHitEventData &inout EventData, const FGameplayTagContainer &inout Tags)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if (local_2 != nullptr)
    {
        FECSWorldPtr local_8 = local_2.GetECSWorld();
        Modify local_12;
        FCS_DamageToCalculateFrame& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.DamageDatas.IsValidIndex(int(EventData.DamageIndex)))
            {
                FDamageBeforeCalculationData& local_18 = local_14.DamageDatas[int(EventData.DamageIndex)];
                FGameplayTagBisSetWrapper local_82;
                local_82.Init(Tags);
                return local_18.AttackTags.HasAny(local_82);
            }
        }
    }
    return false;
}
UFUNCTION()
bool IsDamageHasAllTag(const FAbilityHitEventData &inout EventData, const FGameplayTagContainer &inout Tags)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if (local_2 != nullptr)
    {
        FECSWorldPtr local_8 = local_2.GetECSWorld();
        Modify local_12;
        FCS_DamageToCalculateFrame& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.DamageDatas.IsValidIndex(int(EventData.DamageIndex)))
            {
                FDamageBeforeCalculationData& local_18 = local_14.DamageDatas[int(EventData.DamageIndex)];
                FGameplayTagBisSetWrapper local_82;
                local_82.Init(Tags);
                return local_18.AttackTags.HasAll(local_82);
            }
        }
    }
    return false;
}
UFUNCTION()
bool IsSpecificAttackData(const FAbilityHitEventData &inout EventData, const TDataObjectPtr<FAttackData> &inout AttackData)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if (local_2 != nullptr)
    {
        FECSWorldPtr local_8 = local_2.GetECSWorld();
        Modify local_12;
        FCS_DamageToCalculateFrame& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.DamageDatas.IsValidIndex(int(EventData.DamageIndex)))
            {
                FDamageBeforeCalculationData& local_18 = local_14.DamageDatas[int(EventData.DamageIndex)];
                TDataObjectPtr<FAttackData> local_42;
                local_42 = local_18.AttackData;
                return (local_42 == AttackData.opImplConv());
            }
        }
    }
    return false;
}
UFUNCTION()
bool IsAttackDataHasAnyTag(const FAttackData &inout AttackData, const FGameplayTagContainer &inout Tags)
{
    return AttackData.AttackCalculationTags.HasAny(Tags) || FDamageUtils::ConvertAttackCategoryToTags(int(AttackData.AttackCategory)).HasAny(Tags);
}
UFUNCTION()
bool IsAttackDataHasAllTag(const FAttackData &inout AttackData, const FGameplayTagContainer &inout Tags)
{
    return AttackData.AttackCalculationTags.HasAll(Tags) || FDamageUtils::ConvertAttackCategoryToTags(int(AttackData.AttackCategory)).HasAll(Tags);
}
UFUNCTION()
void SetDamageTransfer(const FECSEntityAdapter &inout Entity, const FECSEntity &inout DamageTransferToEntity, const bool bTransferHpDamage = true, const bool bTransferPostureDamage = true)
{
    int local_12 = 0;
    if (!(ECS::IsAuthorityOrPrediction(Entity.opImplConv())))
    {
        return;
    }
    local_12.SetDamageValueToEntity(DamageTransferToEntity);
    local_12.SetbTransferDamageToHp(bTransferHpDamage);
    local_12.SetbTransferDamageToPosture(bTransferPostureDamage);
    return;
}
UFUNCTION()
void RemoveDamageTransfer(const FECSEntityAdapter &inout Entity)
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
void ReplaceSkill(const FECSEntityAdapter &inout Entity, const USkillConfig SkillConfig, const ESkillSlot Slot, const bool bReplaceInSameSlot)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (SkillConfig == nullptr)
    {
        return;
    }
    FSkillUtils::CreateSkillEntityAndAddSkill(UEASAbility::GetContextECSWorld(), Entity.opImplConv(), SkillConfig, bReplaceInSameSlot, false, true);
    return;
}
UFUNCTION()
FECSEntity AddSkill(const FECSEntityAdapter &inout Entity, const USkillConfig SkillConfig, const ESkillSlot Slot, const bool bReplaceInSameSlot)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return ENTITY_NULL;
    }
    if (SkillConfig == nullptr)
    {
        return ENTITY_NULL;
    }
    return FSkillUtils::CreateSkillEntityAndAddSkill(UEASAbility::GetContextECSWorld(), Entity.opImplConv(), SkillConfig, bReplaceInSameSlot, false, true);
}
UFUNCTION()
void RemoveSkill(const FECSEntityAdapter &inout Entity, const FECSEntity &inout SkillEntity)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (SkillEntity.IsValid())
    {
        FSkillUtils::RemoveSkill(SkillEntity, Entity.opImplConv(), true);
    }
    return;
}
UFUNCTION()
void RemoveSkillByConfig(const FECSEntityAdapter &inout Entity, const USkillConfig SkillConfig)
{
    if (SkillConfig == nullptr)
    {
        return;
    }
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    FECSEntity local_14 = FSkillUtils::GetSkillEntityByConfig(Entity.opImplConv(), SkillConfig);
    if (local_14.IsValid())
    {
        FSkillUtils::RemoveSkill(local_14, Entity.opImplConv(), true);
    }
    return;
}
UFUNCTION()
void ApplySkillPresentationOverride(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FSkillPresentationOverrideConfig> &inout Config, const bool bEnable)
{
    FSkillPresentationOverrideUtils::ApplyOverride(Entity.opImplConv(), Config, bEnable);
    return;
}
UFUNCTION()
void ChangeSkillPanel(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FSkillBtnConfig> &inout SkillBtnConfig, const bool bEnable)
{
    int local_16 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (bEnable)
    {
        if (!(FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv()).IsValid()))
        {
            return;
        }
        local_16.SetSkillBtnConfig(SkillBtnConfig);
        local_16.SetRefCount((local_16.GetRefCount() + 1));
        return;
    }
    if (!(FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv()).IsValid()))
    {
        return;
    }
    local_16.SetRefCount((local_16.GetRefCount() - 1));
    if (local_16.GetRefCount() < 0)
    {
        XError(ELog(8), "[ChangeSkillPanel]: ChangeSkillPanel.RefCount < 0 !!!");
    }
    if (local_16.GetRefCount() <= 0)
    {
        Remove local_28;
        local_28.opCall();
    }
    return;
}
UFUNCTION()
void SetLBPSkillPanelHUDVisible(const FECSEntityAdapter &inout Entity, const bool bEnable)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    FFPTime local_10 = FFPTime(-1);
    FCE_ECSyncCombatHUD local_4;
    local_4.CombatHUDReason = ECombatHUDReason(15);
    local_4.bEnabled = bEnable;
    return;
}
UFUNCTION()
void TriggerLBPSkillPanelHUDInstant(const FECSEntityAdapter &inout Entity)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    FFPTime local_10 = FFPTime(-1);
    FCE_ECSyncCombatHUD local_4;
    local_4.CombatHUDReason = ECombatHUDReason(16);
    local_4.bEnabled = true;
    return;
}
UFUNCTION()
void SendCombatHUDCustom(const FECSEntityAdapter &inout Entity, const ECombatHUDReason CombatHUDReason, const bool bEnable)
{
    if (!(Entity.IsValid()))
    {
        return;
    }
    FFPTime local_10 = FFPTime(-1);
    FCE_ECSyncCombatHUD local_4;
    local_4.CombatHUDReason = CombatHUDReason;
    local_4.bEnabled = bEnable;
    return;
}
UFUNCTION()
void BatchESMInputSlots(const FECSEntityAdapter &inout Entity, const TArray<EESMTriggerInputSlot> &inout InputSlotsBlock, const bool bEnable)
{
    FC_ESMInputSlotBlocked& local_20;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (bEnable)
    {
        if (!(FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv()).IsValid()))
        {
            return;
        }
        for (auto local_33 : InputSlotsBlock)
        {
            local_20.AddBlockedSlot(EESMTriggerInputSlot(local_33));
        }
        return;
    }
    if (!(FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv()).IsValid()))
    {
        return;
    }
    Modify local_38;
    local_20 = local_38.opCall();
    if (local_20)
    {
        for (auto local_33 : InputSlotsBlock)
        {
            local_20.RemoveBlockedSlot(EESMTriggerInputSlot(local_33));
        }
    }
    return;
}
UFUNCTION()
void StartSelectTargetByViewport(const FECSEntityAdapter &inout Entity, const FName &inout RequestName, const TDataObjectPtr<FViewportSelectTargetParams> &inout Params)
{
    FTargetSelectUtils::AddSelectTargetEntityByViewportRequest(Entity.opImplConv(), RequestName, ESelectTargetRequestType(0), Params);
    return;
}
UFUNCTION()
void StopSelectTargetByViewport(const FECSEntityAdapter &inout Entity, const FName &inout RequestName, const bool bClearCurTarget = false, const FFPTime &inout ResultExpireTime = FFPTime(0))
{
    FTargetSelectUtils::RemoveSelectTargetEntityByViewportRequest(Entity.opImplConv(), RequestName, bClearCurTarget, ResultExpireTime);
    return;
}
UFUNCTION()
TArray<FECSEntity> GetSelectedTargetEntities(const FECSEntityAdapter &inout Entity, const FName &inout RequestName)
{
    return FTargetSelectUtils::GetSelectTargetEntitiesByRequestType(Entity.opImplConv(), ESelectTargetRequestType(0), RequestName);
}
UFUNCTION()
void StartSkillTargetSelectByViewport(const TDataObjectPtr<FViewportSelectTargetParams> &inout Params)
{
    const USkillConfig local_30;
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if ((!((local_2 != nullptr))))
    {
        return;
    }
    FName local_7;
    FECSEntity local_12 = local_2.GetAbilityEntity();
    Get local_16;
    const FC_SkillInstance& local_18 = local_16.opCall();
    if (local_18)
    {
        TSoftObjectPtr<USkillConfig> local_28 = local_18.GetSkillConfig();
        local_7 = local_30.GetSkillName();
        FTargetSelectUtils::AddSelectTargetEntityByViewportRequest(local_2.GetOwnerEntity(), local_7, ESelectTargetRequestType(1), Params);
    }
    else
    {
        XWarning(ELog(8), "Start Select Target By Viewport need ability from skill");
    }
    return;
}
UFUNCTION()
void StopSkillTargetSelectByViewport(const bool bClearCurTarget = false)
{
    const USkillConfig local_30;
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if ((!((local_2 != nullptr))))
    {
        return;
    }
    FName local_7;
    FECSEntity local_12 = local_2.GetAbilityEntity();
    Get local_16;
    const FC_SkillInstance& local_18 = local_16.opCall();
    if (local_18)
    {
        TSoftObjectPtr<USkillConfig> local_28 = local_18.GetSkillConfig();
        local_7 = local_30.GetSkillName();
        FTargetSelectUtils::RemoveSelectTargetEntityByViewportRequest(local_2.GetOwnerEntity(), local_7, bClearCurTarget, FFPTime(-1));
    }
    else
    {
        XWarning(ELog(8), "Stop Select Target By Viewport need ability from skill");
    }
    return;
}
UFUNCTION()
void ClearSkillTargetEntity()
{
    const USkillConfig local_28;
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if ((!((local_2 != nullptr))))
    {
        return;
    }
    FECSEntity local_10 = local_2.GetAbilityEntity();
    Get local_14;
    const FC_SkillInstance& local_16 = local_14.opCall();
    if (local_16)
    {
        TSoftObjectPtr<USkillConfig> local_26 = local_16.GetSkillConfig();
        FTargetSelectUtils::ClearSkillTargetEntity(local_2.GetOwnerEntity(), local_28.GetSkillName());
    }
    else
    {
        XWarning(ELog(8), "Clear Skill Target Entity need ability from skill");
    }
    return;
}
UFUNCTION()
TArray<FECSEntity> GetSkillTargetEntities()
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if (local_2 != nullptr)
    {
        FECSEntity local_10 = local_2.GetAbilityEntity();
        Get local_14;
        const FC_SkillTarget& local_16 = local_14.opCall();
        if (local_16)
        {
            return local_16.GetTargetEntities();
        }
    }
    return TArray<FECSEntity>();
}
UFUNCTION()
void StartSkillTargetPositionSelect(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout Params)
{
    int local_20 = 0;
    int local_28 = 0;
    int local_34 = 0;
    if ((!((UEASAbility::GetContextAbility() != nullptr))))
    {
        return;
    }
    if (ECS::IsAuthorityOrPrediction(FECSEntity(UEASAbility::GetContextAbility().GetOwnerEntity())))
    {
        const FSkillTargetPositionSelectParams& local_22;
        local_20.SetParams(Params);
        local_34.SetAngle((float32(local_28.GetRotation().Rotator().Yaw) + local_22.InitAngle));
        local_34.SetDistance(local_22.InitDistance);
        local_34.SetTargetPosition((FVector(local_28.GetPosition()) + FVector(local_22.InitDistance, 0.0, 0.0).RotateAngleAxis(local_34.GetAngle(), FVector::UpVector)));
        local_34.SetLastTargetPosition(local_34.GetTargetPosition());
    }
    return;
}
UFUNCTION()
void StopSkillTargetPositionSelect()
{
    if ((!((UEASAbility::GetContextAbility() != nullptr))))
    {
        return;
    }
    if (ECS::IsAuthorityOrPrediction(FECSEntity(UEASAbility::GetContextAbility().GetOwnerEntity())))
    {
        Remove local_18;
        local_18.opCall();
    }
    return;
}
UFUNCTION()
FVector GetSkillTargetPosition(bool &out bHasTargetPosition)
{
    bHasTargetPosition = false;
    if ((!((UEASAbility::GetContextAbility() != nullptr))))
    {
        return FVector::ZeroVector;
    }
    return FTargetSelectUtils::GetSkillTargetPosition(UEASAbility::GetContextAbility().GetOwnerEntity(), bHasTargetPosition);
}
UFUNCTION()
void CreateInherentShield(const FECSEntityAdapter &inout ShieldOwnerEntity, const FName &inout ShieldName, const FShieldBaseData &inout Data, const float32 ShieldMaxHP, const float32 ShieldInitHP, const bool bInitActive, const float32 AutoDeactivateDuration = -1, const float32 AutoDestroyDuration = -1)
{
    if (ECS::GetRuntimeInfo().IsClient)
    {
        return;
    }
    FShieldUtils::CreateShield(ShieldOwnerEntity.opImplConv(), ShieldName, Data, EShieldType(0), ShieldMaxHP, ShieldInitHP);
    Modify local_20;
    FC_Shield& local_22 = local_20.opCall();
    if (local_22)
    {
        if (bInitActive)
        {
            local_22.SetbShieldActive(true);
            if (AutoDeactivateDuration > 0.0f)
            {
                local_22.SetDeactivateTime((BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv()) + FFPTime(AutoDeactivateDuration)));
            }
        }
        if (AutoDestroyDuration > 0.0f)
        {
            local_22.SetDestroyTime((BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv()) + FFPTime(AutoDestroyDuration)));
        }
    }
    return;
}
UFUNCTION()
void RecoverShieldHPValue(const FECSEntityAdapter &inout ShieldOwnerEntity, const FName &inout ShieldName, const float32 RecoverValue)
{
    int local_22 = 0;
    if (RecoverValue <= 0.0f)
    {
        return;
    }
    Get local_6;
    const FC_ShieldOwner& local_8 = local_6.opCall();
    if (local_8)
    {
        if (FShieldUtils::GetShieldEntityByName(local_8, ShieldName).IsValid())
        {
            float32 local_1 = local_22.GetShieldHP().Evaluate(BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv()));
            local_22.GetModify_ShieldHP().SetUpdated(local_1, FMath::Min(local_1 + RecoverValue, local_22.GetShieldMaxHP().Evaluate(BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv()))), BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv()));
        }
    }
    return;
}
UFUNCTION()
void DecreaseShieldHPValue(const FECSEntityAdapter &inout ShieldOwnerEntity, const FName &inout ShieldName, const float32 DecreaseValue)
{
    int local_22 = 0;
    if (DecreaseValue <= 0.0f)
    {
        return;
    }
    Get local_6;
    const FC_ShieldOwner& local_8 = local_6.opCall();
    if (local_8)
    {
        if (FShieldUtils::GetShieldEntityByName(local_8, ShieldName).IsValid())
        {
            float32 local_1 = local_22.GetShieldHP().Evaluate(BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv()));
            local_22.GetModify_ShieldHP().SetUpdated(local_1, FMath::Max(local_1 - DecreaseValue, 0.0f), BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv()));
        }
    }
    return;
}
UFUNCTION()
void SetShieldHPValue(const FECSEntityAdapter &inout ShieldOwnerEntity, const FName &inout ShieldName, const float32 Value)
{
    int local_22 = 0;
    Get local_4;
    const FC_ShieldOwner& local_6 = local_4.opCall();
    if (local_6)
    {
        if (FShieldUtils::GetShieldEntityByName(local_6, ShieldName).IsValid())
        {
            float32 local_28 = FMath::Min(Value, local_22.GetShieldMaxHP().Evaluate(BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv())));
            if (local_28 < 0.0f)
            {
                local_28 = 0.0f;
            }
            local_22.GetModify_ShieldHP().SetUpdated(local_22.GetShieldHP().Evaluate(BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv())), local_28, BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv()));
        }
    }
    return;
}
UFUNCTION()
void SetShieldMaxHPValue(const FECSEntityAdapter &inout ShieldOwnerEntity, const FName &inout ShieldName, const float32 Value)
{
    int local_22 = 0;
    Get local_4;
    const FC_ShieldOwner& local_6 = local_4.opCall();
    if (local_6)
    {
        if (FShieldUtils::GetShieldEntityByName(local_6, ShieldName).IsValid())
        {
            local_22.GetModify_ShieldMaxHP().SetUpdated(local_22.GetShieldMaxHP().Evaluate(BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv())), FMath::Max(Value, 0.0f), BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv()));
        }
    }
    return;
}
UFUNCTION()
void ChangeShieldMaxHPValue(const FECSEntityAdapter &inout ShieldOwnerEntity, const FName &inout ShieldName, const float32 DeltaValue)
{
    int local_22 = 0;
    Get local_4;
    const FC_ShieldOwner& local_6 = local_4.opCall();
    if (local_6)
    {
        if (FShieldUtils::GetShieldEntityByName(local_6, ShieldName).IsValid())
        {
            float32 local_27 = local_22.GetShieldMaxHP().Evaluate(BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv()));
            local_22.GetModify_ShieldMaxHP().SetUpdated(local_27, FMath::Max(local_27 + DeltaValue, 0.0f), BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv()));
        }
    }
    return;
}
UFUNCTION()
void FixBrokenShield(const FECSEntityAdapter &inout ShieldOwnerEntity, const FName &inout ShieldName)
{
    int local_22 = 0;
    Get local_4;
    const FC_ShieldOwner& local_6 = local_4.opCall();
    if (local_6)
    {
        if (FShieldUtils::GetShieldEntityByName(local_6, ShieldName).IsValid())
        {
            local_22.SetbBroken(false);
        }
    }
    return;
}
UFUNCTION()
void SetShieldBrokenRecoverCount(const FECSEntityAdapter &inout ShieldOwnerEntity, const FName &inout ShieldName, const int Count)
{
    int local_22 = 0;
    Get local_4;
    const FC_ShieldOwner& local_6 = local_4.opCall();
    if (local_6)
    {
        if (FShieldUtils::GetShieldEntityByName(local_6, ShieldName).IsValid())
        {
            local_22.SetBrokenRecorverCount(Count);
        }
    }
    return;
}
UFUNCTION()
float32 GetShieldHPByName(const FECSEntityAdapter &inout ShieldOwnerEntity, const FName &inout ShieldName)
{
    int local_22 = 0;
    Get local_4;
    const FC_ShieldOwner& local_6 = local_4.opCall();
    if (local_6)
    {
        if (FShieldUtils::GetShieldEntityByName(local_6, ShieldName).IsValid())
        {
            return local_22.GetShieldHP().Evaluate(BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv()));
        }
    }
    return 0.0f;
}
UFUNCTION()
float32 GetShieldMaxHPByName(const FECSEntityAdapter &inout ShieldOwnerEntity, const FName &inout ShieldName)
{
    int local_22 = 0;
    Get local_4;
    const FC_ShieldOwner& local_6 = local_4.opCall();
    if (local_6)
    {
        if (FShieldUtils::GetShieldEntityByName(local_6, ShieldName).IsValid())
        {
            return local_22.GetShieldMaxHP().Evaluate(BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv()));
        }
    }
    return 0.0f;
}
UFUNCTION()
void DestroyShield(const FECSEntityAdapter &inout ShieldOwnerEntity, const FName &inout ShieldName)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        Get local_6;
        const FC_ShieldOwner& local_8 = local_6.opCall();
        if (local_8)
        {
            FShieldUtils::DestroyShieldByName(local_8, ShieldName, BlueprintFunctions_Ability::GetWorldTime(ShieldOwnerEntity.opImplConv()));
        }
    }
    return;
}
UFUNCTION()
FECSEntity StartProgressOperation(const FECSEntityAdapter &inout InitiatorEntity, const FECSEntity &inout TargetEntity, const TDataObjectPtr<FProgressOperationConfig> &inout Config, const bool bTryJoinWhenTargetInOperation = true)
{
    FECSEntity __return;
    if (bTryJoinWhenTargetInOperation)
    {
        Get local_4;
        const FC_ProgressOperationTarget& local_6 = local_4.opCall();
        if (local_6)
        {
            FECSEntity local_12 = InitiatorEntity.opImplConv();
            if (FProgressOperationUtils::JoinProgressOperation(local_6.GetOperationEntity(), local_12))
            {
                return local_6.GetOperationEntity();
            }
            else
            {
                __return = local_12;
            }
        }
        else
        {
        }
    }
    return FProgressOperationUtils::StartProgressOperation(InitiatorEntity.opImplConv(), TargetEntity, Config, false);
}
UFUNCTION()
void JoinProgressOperation(const FECSEntityAdapter &inout Entity, const bool bCanJoinByMemberEntity, const bool bCanJoinByOperationEntity, const bool bCanJoinByTargetEntity)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        if (bCanJoinByMemberEntity)
        {
            Get local_6;
            const FC_ProgressOperationMember& local_8 = local_6.opCall();
            if (local_8)
            {
                FProgressOperationUtils::JoinProgressOperation(local_8.GetOperationEntity(), Entity.opImplConv());
                return;
            }
        }
        if (bCanJoinByOperationEntity)
        {
            Get local_16;
            const FC_ProgressOperationRuntime& local_18 = local_16.opCall();
            if (local_18)
            {
                FProgressOperationUtils::JoinProgressOperation(local_18.GetOperationEntity(), Entity.opImplConv());
                return;
            }
        }
        if (bCanJoinByTargetEntity)
        {
            Get local_22;
            const FC_ProgressOperationTarget& local_24 = local_22.opCall();
            if (local_24)
            {
                FProgressOperationUtils::JoinProgressOperation(local_24.GetOperationEntity(), Entity.opImplConv());
                return;
            }
        }
    }
    return;
}
UFUNCTION()
void LeaveProgressOperation(const FECSEntityAdapter &inout Entity)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        Get local_6;
        const FC_ProgressOperationMember& local_8 = local_6.opCall();
        if (local_8)
        {
            FProgressOperationUtils::LeaveProgressOperation(local_8.GetOperationEntity(), Entity.opImplConv());
        }
    }
    return;
}
UFUNCTION()
void BreakProgressOperation(const FECSEntityAdapter &inout Entity)
{
    int local_16 = 0;
    Get local_4;
    const FC_ProgressOperationMember& local_6 = local_4.opCall();
    if (local_6)
    {
        FProgressOperationUtils::BreakProgressOperation(local_6.GetOperationEntity());
    }
    Get local_12;
    const FC_ProgressOperationRuntime& local_14 = local_12.opCall();
    if (local_14)
    {
        FProgressOperationUtils::BreakProgressOperation(local_14.GetOperationEntity());
    }
    local_16.SetbHide((int(ECS::GetRuntimeInfo().IsClient) != 0));
    return;
}
UFUNCTION()
bool IsProgressOperationMemberInitiator(const FECSEntityAdapter &inout Entity)
{
    if (ECS::GetRuntimeInfo().IsServer)
    {
        Get local_6;
        const FC_ProgressOperationMember& local_8 = local_6.opCall();
        if (local_8)
        {
            return local_8.GetbIsInitiator();
        }
    }
    return false;
}
UFUNCTION()
FC_SpawnEntityRecord GetSpawnEntityRecord(const FECSEntityAdapter &inout Entity, bool &out bIsValid)
{
    bIsValid = false;
    FASCommonUtils::GetUniquePlayerEntity(Entity.opImplConv());
    Get local_18;
    const FC_SpawnEntityRecord& local_20 = local_18.opCall();
    if (local_20)
    {
        bIsValid = true;
        return local_20;
    }
    bIsValid = false;
    return FC_SpawnEntityRecord();
}
UFUNCTION()
void SetSpawnPropNum(const FECSEntityAdapter &inout PlayerEntity, const FECSEntity &inout PropEntity, const FNameHandle_EntityBBVarInt &inout PropNum)
{
    if ((!((PropEntity == ENTITY_NULL)) && !((PlayerEntity == ENTITY_NULL))))
    {
        ModifyOrAdd local_6;
        local_6.opCall().SetOwnerEntity(PlayerEntity.opImplConv());
        PlayerEntity.GetEntity().SetBB_Int(PropNum, (PlayerEntity.GetEntity().GetBB_Int(PropNum) + 1));
        ModifyOrAdd local_18;
        local_18.opCall().GetModify_Entities().Add(PropEntity);
    }
    return;
}
UFUNCTION()
void StartCameraModifier(const FDataObjectPtr &inout ModifierConfig)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if ((!((local_2 != nullptr))))
    {
        return;
    }
    FCameraUtils::StartModifier(local_2.GetOwnerEntity(), UEASAbility::GetContextAbility().GetWorldTime(), local_2.GetFName(), TDataObjectPtr<FTPCameraModifierConfig>(ModifierConfig), -1.0f);
    return;
}
UFUNCTION()
void StopCameraModifier(const FDataObjectPtr &inout ModifierConfig)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if ((!((local_2 != nullptr))))
    {
        return;
    }
    FCameraUtils::StopModifier(local_2.GetOwnerEntity(), UEASAbility::GetContextAbility().GetWorldTime(), local_2.GetFName(), TDataObjectPtr<FTPCameraModifierConfig>(ModifierConfig), -1.0f, true);
    return;
}
UFUNCTION()
int StartCameraShake(const FVector &inout ShakeAtPosition, const FDataObjectPtr &inout ShakeConfig, const bool bLoop = false)
{
    int local_8 = 0;
    int local_18;
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if ((!((local_2 != nullptr))))
    {
        return 0;
    }
    FECSEntity local_12 = local_2.GetOwnerEntity();
    local_8.SetIDCache((local_8.GetIDCache() + 1));
    local_18 = local_8.GetIDCache();
    FName local_22 = local_2.GetFName();
    local_22.SetNumber(local_18);
    FCameraUtils::StartCameraShake(local_2.GetOwnerEntity(), UEASAbility::GetContextAbility().GetWorldTime(), ShakeAtPosition, local_22, ShakeConfig, 1.0f, bLoop);
    return local_18;
}
UFUNCTION()
void StopCameraShake(const int ID)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if ((!((local_2 != nullptr))))
    {
        return;
    }
    FName local_9 = local_2.GetFName();
    local_9.SetNumber(ID);
    FCameraUtils::StopCameraShake(local_2.GetOwnerEntity(), UEASAbility::GetContextAbility().GetWorldTime(), local_9);
    return;
}
UFUNCTION()
void StartCameraShakeForEntity(const FECSEntityAdapter &inout Entity, const TDataObjectPtr<FTPCameraShakeConfig> &inout ShakeConfig)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if ((!((local_2 != nullptr))))
    {
        return;
    }
    FCameraUtils::StartCameraShakeForEntity(Entity.opImplConv(), UEASAbility::GetContextAbility().GetWorldTime(), local_2.GetFName(), ShakeConfig.opImplConv(), 1.0f, false);
    return;
}
UFUNCTION()
void SetCameraAffectorActive(const bool bActive, const FECSEntity &inout Entity = ENTITY_NULL)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if ((!((local_2 != nullptr))))
    {
        return;
    }
    FECSEntity local_18;
    if ((Entity == ENTITY_NULL))
    {
        local_18 = local_2.GetOwnerEntity();
    }
    else
    {
        local_18 = Entity;
    }
    Modify local_22;
    FC_CameraAffector& local_24 = local_22.opCall();
    if (local_24)
    {
        local_24.SetbActive(bActive);
    }
    else
    {
    }
    return;
}
UFUNCTION()
void PushCameraAffectorMultiLevelOverride(const FName &inout Identifier, const FCameraAffectorItem &inout OverrideItem, const FECSEntity &inout Entity = ENTITY_NULL, const bool bAllowRuntimeAdd = false)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if ((!((local_2 != nullptr))))
    {
        return;
    }
    FECSEntity local_18;
    if ((Entity == ENTITY_NULL))
    {
        local_18 = local_2.GetOwnerEntity();
    }
    else
    {
        local_18 = Entity;
    }
    if (bAllowRuntimeAdd)
    {
        FC_CameraAffector& local_30;
        Has local_24;
        if (!(local_24.opCall()))
        {
            local_30.SetbIsRuntimeCreated(true);
        }
        local_30.PushOverride(OverrideItem, Identifier);
    }
    else
    {
        FC_CameraAffector& local_30;
        Modify local_34;
        local_30 = local_34.opCall();
        if (local_30)
        {
            if (!(!(local_30.GetbIsRuntimeCreated())))
            {
                return;
            }
            local_30.PushOverride(OverrideItem, Identifier);
        }
        else
        {
        }
    }
    return;
}
UFUNCTION()
void PopCameraAffectorOverrideByIdentifier(const FName &inout Identifier, const FECSEntity &inout Entity = ENTITY_NULL)
{
    UEASAbility local_2 = UEASAbility::GetContextAbility();
    if ((!((local_2 != nullptr))))
    {
        return;
    }
    FECSEntity local_18;
    if ((Entity == ENTITY_NULL))
    {
        local_18 = local_2.GetOwnerEntity();
    }
    else
    {
        local_18 = Entity;
    }
    Modify local_22;
    FC_CameraAffector& local_24 = local_22.opCall();
    if (local_24)
    {
        local_24.PopOverride(Identifier);
        if (local_24.GetStackedOverride().Num() == 0 && local_24.GetbIsRuntimeCreated())
        {
            Remove local_32;
            local_32.opCall();
        }
    }
    else
    {
    }
    return;
}
UFUNCTION()
void Ability_AddCameraOverride(const FECSEntityAdapter &inout OwnerEntity, const ECameraOverrideLayer OverrideLayer, const FECSEntity &inout LookAtTargetEntity, const FVector &inout LookAtTargetOffset, const FName &inout LookAtTargetSocketName, const TDataObjectPtr<FCameraLookAtTargetConfig> &inout LookAtConfig, const TDataObjectPtr<FTPCameraStateConfig> &inout CameraState)
{
    if (!(FASCommonUtils::GetUniquePlayerEntity(OwnerEntity.opImplConv()).IsValid()))
    {
        return;
    }
    GetDefaulted local_18;
    FECSEntity local_4 = local_18.opCall().GetCameraViewTargetEntity();
    if (!(local_4.IsValid()))
    {
        return;
    }
    FCameraOverrideUtils::AddSyncCameraOverrideLayer(ECameraOverrideLayer(OverrideLayer), local_4, LookAtTargetEntity, LookAtTargetOffset, LookAtTargetSocketName, LookAtConfig, CameraState);
    return;
}
UFUNCTION()
void Ability_RemoveCameraOverride(const FECSEntityAdapter &inout OwnerEntity, const ECameraOverrideLayer OverrideLayer)
{
    if (!(FASCommonUtils::GetUniquePlayerEntity(OwnerEntity.opImplConv()).IsValid()))
    {
        return;
    }
    GetDefaulted local_18;
    FECSEntity local_4 = local_18.opCall().GetCameraViewTargetEntity();
    if (!(local_4.IsValid()))
    {
        return;
    }
    FCameraOverrideUtils::RemoveSyncCameraOverrideLayer(local_4, ECameraOverrideLayer(OverrideLayer));
    return;
}
UFUNCTION()
void Ability_SetLockHp(const FECSEntityAdapter &inout Entity, const FName &inout KeyName, const bool bLockByHpAmount, const float32 LockHpAmount, const float32 LockHpRatio)
{
    FECSEntity local_4 = Entity.GetEntity();
    Has local_8;
    if (!(local_8.opCall()))
    {
        return;
    }
    FECSEntity local_4_2 = Entity.GetEntity();
    ModifyOrAdd local_14;
    local_14.opCall().AddNewLockHPInfo(KeyName, bLockByHpAmount, LockHpAmount, LockHpRatio);
    return;
}
UFUNCTION()
void Ability_RemoveLockHp(const FECSEntityAdapter &inout Entity, const FName &inout KeyName)
{
    FECSEntity local_4 = Entity.GetEntity();
    Has local_8;
    if (!(local_8.opCall()))
    {
        return;
    }
    FECSEntity local_4_2 = Entity.GetEntity();
    ModifyOrAdd local_14;
    local_14.opCall().RemoveLockHPInfo(KeyName);
    return;
}
UFUNCTION()
void ChangeTargetMaterial(const FECSEntityAdapter &inout Target, const int MaterialIndex, const TSoftObjectPtr<UMaterial> &inout TargetMaterial, const TSoftObjectPtr<UMaterialInstance> &inout TargetMaterialInstance)
{
    UEASAbility::GetContextECSWorld();
    UEASAbility::GetContextRuntimeInfo();
    FCE_ChangeTargetMaterial local_8;
    local_8.MaterialIndex = MaterialIndex;
    local_8.TargetMaterial = TargetMaterial;
    local_8.TargetMaterialInstance = TargetMaterialInstance;
    local_8.Target = Target.opImplConv();
    return;
}
UFUNCTION()
void Ability_SendCustomLevelEvent(const FECSEntityAdapter &inout Entity, const FName &inout CustomName)
{
    int local_16 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (UEASAbility::GetContextAbility() == nullptr)
    {
        return;
    }
    FFPTime local_12 = FFPTime(-1);
    if (local_16)
    {
        local_16.CustomName = CustomName;
    }
    return;
}
UFUNCTION()
void SendReviveTeleportEvent(const FECSEntityAdapter &inout Entity, const FName &inout CustomName, const TArray<TSubclassOf<AECSPrefab>> &inout SpecificPrefabClass)
{
    int local_16 = 0;
    if (UEASAbility::GetContextAbility() == nullptr)
    {
        return;
    }
    FFPTime local_12 = FFPTime(-1);
    local_16.CustomName = CustomName;
    local_16.SpecificPrefabClass = SpecificPrefabClass;
    return;
}
UFUNCTION()
FECSEntity GetSwitchTargetForMultiPlayer(const FECSEntityAdapter &inout Entity, const float32 TargetDistance = 2000.0, const float32 MaxSearchDistance = 10000.0)
{
    return FAITargetingUtils::GetSwitchTargetForMultiPlayer(Entity.opImplConv(), TargetDistance, MaxSearchDistance);
}
UFUNCTION()
TSet<FECSEntityId> SearchLevelGroupPoint(const FVector &inout Center, const FKLGameplayTagQuery &inout DomainTagQuery, const float32 SearchDistance = 10000.0f)
{
    FEcologyPointQueryResult local_20;
    FCS_EcologyScriptGlobalContext& local_26 = FEcologyUtils::ModifyGlobalContext(UEASAbility::GetContextECSWorld());
    FEcologyPointQuery local_60;
    local_60.Bounds.SphereRadius = SearchDistance;
    local_60.OwnerGroup = FConfigGUID();
    local_60.DomainTagQuery = DomainTagQuery;
    FEcologyPointUtils::QueryPoints(Center, local_26, local_60);
    return local_20.ActivatePoint;
}
UFUNCTION()
void SearchNearestLevelGroupPointInRadius(const FVector &inout Center, const FKLGameplayTagQuery &inout DomainTagQuery, FECSEntityId &out PointEntityId, FVector &out PointLocation, FVector &out PointDirection, const float32 SearchDistance = 10000.0f)
{
    FECSEntityId local_1;
    PointEntityId = local_1;
    PointLocation = FVector();
    PointDirection = FVector();
    FEcologyPointQueryResult local_34;
    FCS_EcologyScriptGlobalContext& local_40 = FEcologyUtils::ModifyGlobalContext(UEASAbility::GetContextECSWorld());
    FEcologyPointQuery local_74;
    local_74.Bounds.SphereRadius = SearchDistance;
    local_74.OwnerGroup = FConfigGUID();
    local_74.DomainTagQuery = DomainTagQuery;
    FEcologyPointUtils::QueryNearestPoint(Center, local_40, local_74);
    FECSEntityId local_99 = FECSEntityId(ENTITY_ID_NULL);
    FVector local_106(FVector::ZeroVector);
    FVector local_112(FVector::ZeroVector);
    for (auto& local_132 : local_34.ActivatePoint)
    {
        local_99 = local_132;
        FECSEntity local_140 = FECSEntity(local_132);
        Get local_144;
        const FC_Transform& local_146 = local_144.opCall();
        if (local_146)
        {
            local_106 = local_146.GetPosition();
            local_112 = local_146.GetRotation().GetForwardVector();
        }
        break;
    }
    PointEntityId = local_99;
    PointLocation = local_106;
    PointDirection = local_112;
    return;
}
}

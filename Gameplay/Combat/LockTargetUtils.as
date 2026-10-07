
const FConsoleVariable CVar_LockTarget_Debug = FConsoleVariable();
const FConsoleVariable CVar_LockTarget_Debug_Time = FConsoleVariable();

struct __Lambda_Gameplay_Combat_LockTargetUtils_521
{
    __Lambda_Gameplay_Combat_LockTargetUtils_521()
    {
        return;
    }
    bool opCall(const FAILockPointRatingResult &inout A, const FAILockPointRatingResult &inout B)
    {
        return (A.TotalScore > B.TotalScore);
    }
}

namespace FLockTargetUtils
{
void SetPlayerSettingInputFirst(const bool bEnable)
{
    if (!(FECSWorldPtr(ECS::GetECSWorld()).IsValid()))
    {
        return;
    }
    FASCommonUtils::GetLocalPlayerProxy();
    FFPTime local_20 = FFPTime(-1);
    FCE_LockTargetSettingInputFirstEvent local_24;
    local_24.bEnabled = bEnable;
    return;
}
bool IsPlayerSettingInputFirstEnabled()
{
    if (!(FECSWorldPtr(ECS::GetECSWorld()).IsValid()))
    {
        return false;
    }
    FECSEntity local_14 = FASCommonUtils::GetLocalPlayerProxy();
    if ((local_14 == ENTITY_NULL))
    {
        return false;
    }
    GetDefaulted local_18;
    return local_18.opCall().GetbEnabled();
}
bool IsPlayerSettingInputFirstEnabledByPawn(const FECSEntity &inout Entity)
{
    FECSEntity local_8 = FASCommonUtils::GetUniquePlayerEntity(Entity);
    if ((local_8 == ENTITY_NULL))
    {
        return false;
    }
    GetDefaulted local_14;
    return local_14.opCall().GetbEnabled();
}
void UpdateLockTarget(const FECSEntity &inout Entity, const FECSEntity &inout NewLockTarget, const int LockPointIndex, const ELockTargetType NewLockTargetType, const bool bEnableStrafe = false, const float32 KeepDuration = 0)
{
    UpdateLockTargetInternal(Entity, NewLockTarget, LockPointIndex, ELockTargetType(NewLockTargetType), bEnableStrafe, KeepDuration);
    return;
}
void ClearLockTarget(const FECSEntity &inout Entity)
{
    UpdateLockTargetInternal(Entity, ENTITY_NULL, -1, ELockTargetType(0), false, 0.0f);
    return;
}
void DisposeChangeLockTarget(const FCE_LockTargetChangeEvent &inout Event, const ULockTargetConfig LockTargetConfigRef)
{
    FLockTargetUtils::DisposeChangeLockTarget(Event.Sender, Event.TargetEntity, Event.PreTargetEntity, int(Event.LockPointIndex), LockTargetConfigRef.Data.bShouldStrafe, Event.ChangeTargetReason, ELockTargetType(2));
    return;
}
void DisposeChangeLockTarget(const FECSEntity &inout Sender, const FECSEntity &inout TargetEntity, const FECSEntity &inout PreTargetEntity, const int LockPointIndex = -1, const bool bShouldStrafe = true, const EPreChangeTargetReason ChangeTargetReason = EPreChangeTargetReason::Default, const ELockTargetType LockTargetType = ELockTargetType::HardLock)
{
    int local_10 = 0;
    if (!((TargetEntity == ENTITY_NULL)) && Sender.MatchGameplayTag(GameplayTags::CombatState_Ban_LockTarget))
    {
        return;
    }
    FLockTargetUtils::UpdateLockTarget(Sender, TargetEntity, LockPointIndex, ELockTargetType(LockTargetType), bShouldStrafe, 0.0f);
    local_10.SetChangeTargetReason(EPreChangeTargetReason(ChangeTargetReason));
    local_10.SetPreTargetEntity(PreTargetEntity);
    return;
}
FLockTargetResult PickLockTarget(const ELockTargetType LockTargetType, const FECSEntity &inout Entity, const FLockTargetConfigData &inout ConfigData, FLockTargetOverrideInfo &inout OverrideInfo)
{
    FLockTargetResult local_16;
    FLockTargetResult __r;
    FECSWorldPtr local_20 = Entity.GetWorld();
    float32 local_22 = OverrideInfo.GetQueryMaxLockDistance(ConfigData);
    FECSRuntimeQuery local_68 = FECSRuntimeQueryHelper::RuntimeQueryInCylinder(Entity, OverrideInfo.MoveOriginPos, local_22, local_22, true, EECSQueryRegsitryType(3), false);
    Include local_112;
    local_112.opCall();
    Include local_116;
    local_116.opCall();
    Exclude(local_68).opCall();
    FECSRuntimeQueryIterator local_142 = local_68.Iterator();
    for (; local_142.CanProceed;)
    {
        const FECSEntity& local_166 = local_142.Proceed();
        if (!(ConfigData.IsConditionMatchMaxLockDistance(Entity, local_166, OverrideInfo)))
        {
            continue;
        }
        if (!(FLockTargetUtils::IsLockTargetMatchBaseCondition(ELockTargetType(LockTargetType), Entity, local_166, ConfigData.MinDetectBlockDistance, true, OverrideInfo.ViewOriginPos)))
        {
            continue;
        }
        TArray<FLockPointInfo> local_170;
        Get local_176;
        FFPTime local_178 = FTransformUtils::GetPlayerRollbackTime(Entity, local_176.opCall());
        FLockTargetUtils::GetLockPointsFromEntity(local_166, local_170, local_178, false);
        PickLockTargetInternal(local_16, ELockTargetType(LockTargetType), Entity, local_166, ConfigData, OverrideInfo, local_170);
    }
    return __r;
}
FLockTargetResult PickEntityLockPoint(const ELockTargetType LockTargetType, const FECSEntity &inout Entity, const FECSEntity &inout LockableEntity, const FLockTargetConfigData &inout ConfigData, FLockTargetOverrideInfo &inout OverrideInfo, const TArray<FLockPointInfo> &inout InLockPoints)
{
    FLockTargetResult local_16;
    FLockTargetResult __r;
    PickLockTargetInternal(local_16, ELockTargetType(LockTargetType), Entity, LockableEntity, ConfigData, OverrideInfo, InLockPoints);
    return __r;
}
FLockTargetResult PickLockTargetResult(const ELockTargetType LockTargetType, const FECSEntity &inout Entity, const FFPTime &inout Time, const FLockTargetConfigData &inout Config, FLockTargetOverrideInfo &inout OverrideInfo)
{
    int local_32 = 0;
    FLockTargetResult __r;
    GetDefaulted local_10;
    FCharacterInputUtils::GetViewPosition(Entity, local_10.opCall(), Time);
    FRotator3f local_29 = FRotator3f(FCharacterInputUtils::GetViewInputDir(Entity, Time));
    FVector local_42 = local_32.GetPosition();
    FVector local_6 = FCharacterInputUtils::GetWorldMoveInput(Entity, Time, FFPTime(0), false);
    int local_53 = 0;
    FRotator3f local_56;
    if ((local_6 == FVector::ZeroVector))
    {
        local_56 = FRotator3f(local_32.GetRotation().Rotator());
        int local_52_2 = 1;
        int local_53_2 = local_52_2;
    }
    else
    {
        local_56 = FRotator3f(FRotator::MakeFromXZ(local_6, FVector::UpVector));
    }
    FLockTargetUtils::PickLockTarget(ELockTargetType(LockTargetType), Entity, Config, OverrideInfo);
    return __r;
}
void PickSoftLockTarget(const FECSEntity &inout Entity, const FFPTime &inout Time, const FLockTargetConfigData &inout Config, FLockTargetOverrideInfo &inout OverrideInfo, const bool bKeepBeforeExit = false)
{
    Get local_4;
    FC_LockTarget local_6 = local_4.opCall();
    if (local_6)
    {
        if ((int(local_6.GetType())) == 2)
        {
            return;
        }
    }
    FLockTargetResult local_42 = FLockTargetUtils::PickLockTargetResult(ELockTargetType(ELockTargetType(1)), Entity, Time, Config, OverrideInfo);
    int local_44 = bKeepBeforeExit ? -1082130432 : int(Config.KeepDuration);
    Remove local_50;
    local_50.opCall();
    if ((!((local_42.LockTarget == ENTITY_NULL))))
    {
        ELockTargetType local_8_2 = ELockTargetType(1);
        FLockTargetUtils::UpdateLockTarget(Entity, local_42.LockTarget, int(local_42.LockPointIndex), ELockTargetType(local_8_2), Config.bShouldStrafe, local_44);
        Modify local_58;
        FC_LockTarget local_6_2 = local_58.opCall();
        if (local_6_2)
        {
            local_6_2.SetbCachedValidLockTargetPosition(true);
            FRotator local_64;
            FECSWorldPtr local_68 = Entity.GetWorld();
            Get local_72;
            local_6_2.SetLogicLockTargetPosition(FLockTargetUtils::GetLockPositionFromLockPointConfig(local_6_2.GetTargetEntity(), local_6_2.GetCachedLockTargetConfig(), local_64, FTransformUtils::GetPlayerRollbackTime(Entity, local_72.opCall())));
            local_6_2.SetLogicLockTargetRotation(local_64);
        }
    }
    else
    {
        FLockTargetUtils::ClearLockTarget(Entity);
    }
    return;
}
FLockTargetOverrideInfo GetInitOverrideInfo(const FECSEntity &inout Entity, const FFPTime &inout Time)
{
    FLockTargetOverrideInfo local_22;
    int local_44 = 0;
    GetDefaulted local_26;
    local_22.ViewOriginPos = FCharacterInputUtils::GetViewPosition(Entity, local_26.opCall(), Time);
    local_22.ViewDir = FRotator3f(FCharacterInputUtils::GetViewInputDir(Entity, Time));
    local_22.MoveOriginPos = local_44.GetPosition();
    FVector local_32 = FCharacterInputUtils::GetWorldMoveInput(Entity, Time, FFPTime(0), false);
    local_22.bNoInput = false;
    if ((local_32 == FVector::ZeroVector))
    {
        local_22.MoveDir = FRotator3f(local_44.GetRotation().Rotator());
        local_22.bNoInput = true;
    }
    else
    {
        local_22.MoveDir = FRotator3f(FRotator::MakeFromXZ(local_32, FVector::UpVector));
    }
    return local_22;
}
bool GetLogicLockTargetPosition(const FECSEntity &inout Entity, FVector &inout OutPosition)
{
    int local_6 = 0;
    int local_16 = 0;
    if (!(local_6) || !(local_6.GetTargetEntity().IsValid()))
    {
        XError(ELog(7), "[GetLogicLockTargetPosition]: LockTarget.TargetEntity == NULL");
        return false;
    }
    if (local_16 && local_16.GetbCachedValidMultiExtraInfo())
    {
        OutPosition = local_16.GetLockTargetExtraInfo().GetPosition();
        return true;
    }
    if (local_6.GetbCachedValidLockTargetPosition())
    {
        OutPosition = local_6.GetLogicLockTargetPosition();
        return true;
    }
    return false;
}
bool GetLogicLockTargetInfo(const FECSEntity &inout Entity, FLockPointInfo &inout LockPointInfo)
{
    int local_6 = 0;
    int local_16 = 0;
    Get local_24;
    if (!(local_6) || !(local_6.GetTargetEntity().IsValid()))
    {
        XError(ELog(7), "[GetLogicLockTargetInfo]: LockTarget.TargetEntity == NULL");
        return false;
    }
    if (local_16 && local_16.GetbCachedValidMultiExtraInfo())
    {
        const FMultiLockTargetExtraInfo& local_18 = local_16.GetLockTargetExtraInfo();
        LockPointInfo.Index = local_18.GetIndex();
        LockPointInfo.Position = local_18.GetPosition();
        LockPointInfo.SubIndex = local_18.GetSubIndex();
        if (int(LockPointInfo.SubIndex) >= 0)
        {
            FSubLockPoint local_46 = FSubLockPoint(local_24.opCall().GetLockPoints()[local_18.GetIndex()].GetSubPoints()[int(LockPointInfo.SubIndex)]);
            LockPointInfo.Radius = local_46.GetLockTargetTransform().GetRadius();
            LockPointInfo.bFanShapeSoftLockRangeSearch = local_46.GetbFanShapeSoftLockRangeSearch();
        }
        else
        {
            FLockPointConfig local_98 = FLockPointConfig(local_24.opCall().GetLockPoints()[local_18.GetIndex()]);
            LockPointInfo.Radius = local_98.GetLockTargetTransform().GetRadius();
            LockPointInfo.bFanShapeSoftLockRangeSearch = local_98.GetbFanShapeSoftLockRangeSearch();
        }
        return true;
    }
    if (local_6.GetbCachedValidLockTargetPosition())
    {
        LockPointInfo.Index = local_6.GetLockPointIndex();
        LockPointInfo.Position = local_6.GetLogicLockTargetPosition();
        LockPointInfo.SubIndex = -1;
        LockPointInfo.Radius = local_6.GetCachedLockTargetConfig().GetLockTargetTransform().GetRadius();
        LockPointInfo.bFanShapeSoftLockRangeSearch = local_6.GetCachedLockTargetConfig().GetbFanShapeSoftLockRangeSearch();
        return true;
    }
    return false;
}
void KeepLockTargetWhenSwitchControlEntity(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity)
{
    int local_8 = 0;
    int local_26 = 0;
    if (!(SourceEntity.IsValid()))
    {
        return;
    }
    if (!(local_8) || !(local_8.GetTargetEntity().IsValid()))
    {
        FLockTargetUtils::ClearLockTarget(TargetEntity);
    }
    else
    {
        if ((int(local_8.GetType())) != 0)
        {
            bool local_1 = local_8.GetbShouldStrafe();
            ELockTargetType local_10 = local_8.GetType();
            FLockTargetUtils::UpdateLockTarget(TargetEntity, local_8.GetTargetEntity(), local_8.GetLockPointIndex(), local_1, false);
            Modify local_18;
            FC_LockTarget& local_20 = local_18.opCall();
            if (local_20)
            {
                local_20.SetbCachedValidLockTargetPosition(local_8.GetbCachedValidLockTargetPosition());
                local_20.SetLogicLockTargetPosition(local_8.GetLogicLockTargetPosition());
                local_20.SetLogicLockTargetRotation(local_8.GetLogicLockTargetRotation());
                local_20.SetPresentationLockTargetPosition(local_8.GetPresentationLockTargetPosition());
            }
            if (local_26)
            {
                Assign local_30;
                local_30.opCall(local_26);
            }
        }
        else
        {
            FLockTargetUtils::ClearLockTarget(TargetEntity);
        }
    }
    FLockTargetUtils::ClearLockTarget(SourceEntity);
    return;
}
FVector GetLockPositionFromLockPointConfig(const FECSEntity &inout Entity, const FLockPointConfig &inout LockPointConfig, FRotator &inout Rotation, const FFPTime &inout Time)
{
    int local_74 = 0;
    if (!(LockPointConfig.GetLockSocket().IsNone()) && FTransformUtils::DoesSocketExistInGameMesh(Entity, LockPointConfig.GetLockSocket()))
    {
        FTransform local_56 = FTransformUtils::GetSocketTransformInGameMesh(Entity, LockPointConfig.GetLockSocket(), Time, FDownsampleConfig());
        Rotation = local_56.TransformRotation(LockPointConfig.GetLockTargetTransform().GetLockTargetRotation());
        return local_56.TransformPosition(LockPointConfig.GetLockTargetTransform().GetLockTargetOffset());
    }
    else
    {
        FTransform local_28 = local_74.ToFTransform();
        Rotation = local_28.TransformRotation(LockPointConfig.GetLockTargetTransform().GetLockTargetRotation());
        return local_28.TransformPosition(LockPointConfig.GetLockTargetTransform().GetLockTargetOffset());
    }
}
void GetLockPositionRotationFromLockPointConfig(const FECSEntity &inout Entity, const FLockPointConfig &inout LockPointConfig, FVector &inout OutPosition, FRotator &inout OutRotation, const FFPTime &inout Time)
{
    int local_78 = 0;
    if (!(LockPointConfig.GetLockSocket().IsNone()) && FTransformUtils::DoesSocketExistInGameMesh(Entity, LockPointConfig.GetLockSocket()))
    {
        bool local_4 = false;
        FTransform local_60 = FTransformUtils::GetSocketTransformInGameMesh(Entity, LockPointConfig.GetLockSocket(), Time, local_4, FDownsampleConfig());
        OutPosition = local_60.TransformPosition(LockPointConfig.GetLockTargetTransform().GetLockTargetOffset());
        OutRotation = local_60.TransformRotation(LockPointConfig.GetLockTargetTransform().GetLockTargetRotation());
        return;
    }
    FTransform local_32 = local_78.ToFTransform();
    OutPosition = local_32.TransformPosition(LockPointConfig.GetLockTargetTransform().GetLockTargetOffset());
    OutRotation = local_32.TransformRotation(LockPointConfig.GetLockTargetTransform().GetLockTargetRotation());
    return;
}
FVector GetLockPositionFromLockPointConfigWithSubIndex(const FECSEntity &inout Entity, const FLockPointConfig &inout LockPointConfig, const int MainPointIndex, const int SubPointIndex, const FFPTime &inout Time, FRotator &inout OutRotation)
{
    if (SubPointIndex == -1)
    {
        return FLockTargetUtils::GetLockPositionFromLockPointConfig(Entity, LockPointConfig, OutRotation, Time);
    }
    FLockPointInfo local_24;
    local_24.Radius = LockPointConfig.GetSubPoints()[SubPointIndex].GetLockTargetTransform().GetRadius();
    local_24.Index = MainPointIndex;
    local_24.SubIndex = SubPointIndex;
    const FSubLockPoint& local_28 = LockPointConfig.GetSubPoints()[SubPointIndex];
    if (!(local_28.GetSocket().IsNone()) && FTransformUtils::DoesSocketExistInGameMesh(Entity, local_28.GetSocket()))
    {
        bool local_31 = false;
        FTransform local_84 = FTransformUtils::GetSocketTransformInGameMesh(Entity, local_28.GetSocket(), Time, local_31, FDownsampleConfig());
        local_24.Position = local_84.TransformPosition(local_28.GetLockTargetTransform().GetLockTargetOffset());
        OutRotation = local_84.TransformRotation(local_28.GetLockTargetTransform().GetLockTargetRotation());
    }
    else
    {
        FVector local_96;
        FRotator local_102;
        FLockTargetUtils::GetLockPositionRotationFromLockPointConfig(Entity, LockPointConfig, local_96, local_102, Time);
        local_24.Position = local_96;
    }
    return local_24.Position;
}
FLockPointInfo GetMainLockPointFromLockPointConfig(const FECSEntity &inout Entity, const int MainPointIndex, const FLockPointConfig &inout LockPointConfig, const FFPTime &inout Time)
{
    FLockPointInfo local_16;
    int local_108 = 0;
    FQuat local_24 = FQuat(FQuat::Identity);
    if (!(LockPointConfig.GetLockSocket().IsNone()) && FTransformUtils::DoesSocketExistInGameMesh(Entity, LockPointConfig.GetLockSocket()))
    {
        FTransform local_80 = FTransformUtils::GetSocketTransformInGameMesh(Entity, LockPointConfig.GetLockSocket(), Time, FDownsampleConfig());
        local_16.Position = local_80.TransformPosition(LockPointConfig.GetLockTargetTransform().GetLockTargetOffset());
        local_24 = local_80.GetRotation();
        local_16.Rotation = local_80.TransformRotation(LockPointConfig.GetLockTargetTransform().GetLockTargetRotation());
    }
    else
    {
        FTransform local_52 = local_108.ToFTransform();
        local_16.Position = local_52.TransformPosition(LockPointConfig.GetLockTargetTransform().GetLockTargetOffset());
        local_24 = local_52.GetRotation();
    }
    local_16.Radius = LockPointConfig.GetLockTargetTransform().GetRadius();
    local_16.Index = MainPointIndex;
    local_16.SubIndex = -1;
    local_16.bFanShapeSoftLockRangeSearch = LockPointConfig.GetbFanShapeSoftLockRangeSearch();
    return local_16;
}
bool GetSocketTransform(const FECSEntity &inout Entity, const FName &inout SocketName, const FFPTime &inout Time, const bool bUsePresentationSocket, FTransform &inout OutTransform)
{
    if (SocketName.IsNone())
    {
        return false;
    }
    else
    {
        if (bUsePresentationSocket)
        {
            return FTransformUtils::TryGetSocketTransformInActor(Entity, SocketName, OutTransform, ERelativeTransformSpace(0));
        }
        else
        {
            bool local_3;
            local_3 = false;
            OutTransform = FTransformUtils::GetSocketTransformInGameMesh(Entity, SocketName, Time, local_3, FDownsampleConfig());
            return local_3;
        }
    }
}
void GetLockPointsFromLockPointConfig(const FECSEntity &inout Entity, const int MainPointIndex, const FLockPointConfig &inout LockPointConfig, TArray<FLockPointInfo> &inout OutLockPoints, const FFPTime &inout Time, const bool bUsePresentationSocket = false)
{
    FLockPointInfo local_16;
    int local_80 = 0;
    FQuat local_24 = FQuat(FQuat::Identity);
    FTransform local_48;
    bool local_51 = FLockTargetUtils::GetSocketTransform(Entity, LockPointConfig.GetLockSocket(), Time, bUsePresentationSocket, local_48);
    FTransform local_104;
    if (local_51)
    {
        local_16.Position = local_48.TransformPosition(LockPointConfig.GetLockTargetTransform().GetLockTargetOffset());
        local_24 = local_48.GetRotation();
        local_16.Rotation = local_48.TransformRotation(LockPointConfig.GetLockTargetTransform().GetLockTargetRotation());
    }
    else
    {
        local_104 = local_80.ToFTransform();
        local_16.Position = local_104.TransformPosition(LockPointConfig.GetLockTargetTransform().GetLockTargetOffset());
        local_24 = local_104.GetRotation();
    }
    local_16.Radius = LockPointConfig.GetLockTargetTransform().GetRadius();
    local_16.Index = MainPointIndex;
    local_16.SubIndex = -1;
    local_16.bFanShapeSoftLockRangeSearch = LockPointConfig.GetbFanShapeSoftLockRangeSearch();
    OutLockPoints.Add(local_16);
    int local_131 = 0;
    for (; local_131 < LockPointConfig.GetSubPoints().Num(); ++local_131)
    {
        if (!(LockPointConfig.GetSubPoints()[local_131].GetbValid()))
        {
            continue;
        }
        FLockPointInfo local_148;
        local_148.Radius = LockPointConfig.GetSubPoints()[local_131].GetLockTargetTransform().GetRadius();
        local_148.Index = MainPointIndex;
        local_148.SubIndex = local_131;
        local_148.bFanShapeSoftLockRangeSearch = LockPointConfig.GetSubPoints()[local_131].GetbFanShapeSoftLockRangeSearch();
        const FSubLockPoint& local_150 = LockPointConfig.GetSubPoints()[local_131];
        bool local_51_2 = FLockTargetUtils::GetSocketTransform(Entity, local_150.GetSocket(), Time, bUsePresentationSocket, local_104);
        if (local_51_2)
        {
            local_148.Position = local_104.TransformPosition(local_150.GetLockTargetTransform().GetLockTargetOffset());
            local_148.Rotation = local_104.TransformRotation(local_150.GetLockTargetTransform().GetLockTargetRotation());
        }
        else
        {
            local_148.Position = (local_16.Position + local_24.RotateVector(local_150.GetLockTargetTransform().GetLockTargetOffset()));
        }
        OutLockPoints.Add(local_148);
    }
    return;
}
void GetMainLockPointsFromEntity(const FECSEntity &inout TargetEntity, TArray<FLockPointInfo> &inout OutLockPoints, const FFPTime &inout Time)
{
    int local_16 = 0;
    int local_46 = 0;
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5 == false)
    {
        return;
    }
    Has local_10;
    bool local_6 = local_10.opCall();
    if (local_6)
    {
        int local_17 = 0;
        for (; local_17 < local_16.GetLockPoints().Num(); )
        {
            OutLockPoints.Add(FLockTargetUtils::GetMainLockPointFromLockPointConfig(TargetEntity, local_17, local_16.GetLockPoints()[local_17], Time));
            ++local_17;
        }
        return;
    }
    Has local_40;
    bool local_5_2 = local_40.opCall();
    if (local_5_2)
    {
        FLockTargetUtils::GetLockPointsFromLockPointConfig(TargetEntity, -1, local_46.GetLockPoint(), OutLockPoints, Time, false);
        return;
    }
    bool local_5_3 = local_4.opCall();
    if (local_5_3)
    {
        FLockPointInfo local_62;
        Get local_66;
        local_62.Position = local_66.opCall().GetPosition();
        OutLockPoints.Add(local_62);
    }
    return;
}
void GetLockPointsFromEntity(const FECSEntity &inout TargetEntity, TArray<FLockPointInfo> &inout OutLockPoints, const FFPTime &inout Time, const bool bUsePresentationSocket = false)
{
    Has local_4;
    Has local_10;
    bool local_11;
    int local_22 = 0;
    int local_36 = 0;
    bool local_6 = !(false);
    if (!(local_4.opCall()) == local_6)
    {
        local_11 = true;
    }
    else
    {
        local_11 = (!(local_10.opCall()) == !(false));
    }
    if (local_11)
    {
        return;
    }
    Has local_16;
    bool local_5 = local_16.opCall();
    if (local_5)
    {
        int local_23 = 0;
        for (; local_23 < local_22.GetLockPoints().Num(); )
        {
            FLockTargetUtils::GetLockPointsFromLockPointConfig(TargetEntity, local_23, local_22.GetLockPoints()[local_23], OutLockPoints, Time, bUsePresentationSocket);
            ++local_23;
        }
        return;
    }
    Has local_30;
    local_11 = local_30.opCall();
    if (local_11)
    {
        FLockTargetUtils::GetLockPointsFromLockPointConfig(TargetEntity, -1, local_36.GetLockPoint(), OutLockPoints, Time, bUsePresentationSocket);
        return;
    }
    bool local_6_3 = local_10.opCall();
    if (local_6_3)
    {
        FLockPointInfo local_52;
        Get local_56;
        local_52.Position = local_56.opCall().GetPosition();
        OutLockPoints.Add(local_52);
    }
    return;
}
TArray<FAILockPointRatingResult> RateAndSortLockPoints(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAILockPointRatingConfig &inout Config)
{
    TArray<FAILockPointRatingResult> local_4;
    TArray<FLockPointInfo> local_8;
    FECSWorldPtr local_12 = SourceEntity.GetWorld();
    Get local_18;
    FFPTime local_20 = FTransformUtils::GetPlayerRollbackTime(SourceEntity, local_18.opCall());
    FLockTargetUtils::GetLockPointsFromEntity(TargetEntity, local_8, local_20, false);
    if (local_8.IsEmpty())
    {
        return local_4;
    }
    Get local_32;
    FVector local_28 = local_32.opCall().GetPosition();
    for (auto& local_46 : local_8)
    {
        FVector local_58 = local_46.Position;
        FVector local_64 = (local_58 - local_28);
        float32 local_73 = float32((FVector(local_64.X, local_64.Y, 0.0).Size()));
        float32 local_65 = float32(local_64.Z);
        float32 local_74 = FMath::Abs(local_65);
        if (local_74 > Config.MaxZDistance)
        {
            continue;
        }
        float32 local_77 = Config.ScoreCurveByDistanceXY.GetFloatValue(local_73, 0.0f);
        float32 local_76 = Config.ScoreCurveByDistanceZ.GetFloatValue(local_74, 0.0f);
        FAILockPointRatingResult local_102;
        local_102.LockPointInfo = local_46;
        local_102.DistanceXY = local_73;
        local_102.DistanceZ = local_65;
        local_102.ScoreXY = local_77;
        local_102.ScoreZ = local_76;
        local_102.TotalScore = ((local_77 * Config.WeightXY) + (local_76 * Config.WeightZ));
        local_4.Add(local_102);
    }
    return local_4;
}
int GetBestAILockPointIndex(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity, const FAILockPointRatingConfig &inout Config)
{
    TArray<FAILockPointRatingResult> local_4 = FLockTargetUtils::RateAndSortLockPoints(SourceEntity, TargetEntity, Config);
    if (local_4.IsEmpty())
    {
        return 0;
    }
    return local_4[0].LockPointInfo.Index;
}
void PushLockPointRatingOverride(const FECSEntity &inout Entity, const TDataObjectPtr<FAILockPointRatingConfig> &inout Config)
{
    0.ConfigStack.Add(Config);
    return;
}
void PopLockPointRatingOverride(const FECSEntity &inout Entity)
{
    Modify local_4;
    FC_AILockPointRatingOverride& local_6 = local_4.opCall();
    if (local_6)
    {
        if (!(local_6.ConfigStack.IsEmpty()))
        {
            local_6.ConfigStack.RemoveAt((local_6.ConfigStack.Num() - 1));
        }
        if (local_6.ConfigStack.IsEmpty())
        {
            Remove local_14;
            local_14.opCall();
        }
    }
    return;
}
TDataObjectPtr<FAILockPointRatingConfig> GetActiveLockPointRatingConfig(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_AILockPointRatingOverride& local_6 = local_4.opCall();
    if (local_6)
    {
        if (!(local_6.ConfigStack.IsEmpty()))
        {
            return local_6.ConfigStack.Last(0);
        }
    }
    if ((!((FAITargetingUtils::GetTargetingConfig(Entity) == nullptr))))
    {
        return GetLockPointRatingConfig();
    }
    return TDataObjectPtr<FAILockPointRatingConfig>(nullptr);
}
int GetBestAILockPointIndexWithOverride(const FECSEntity &inout SourceEntity, const FECSEntity &inout TargetEntity)
{
    if ((!((FLockTargetUtils::GetActiveLockPointRatingConfig(SourceEntity) == nullptr))))
    {
        return FLockTargetUtils::GetBestAILockPointIndex(SourceEntity, TargetEntity);
    }
    return 0;
}
bool IsLocationInReverseAngleRange(const FVector &inout ZeroPosition, const FVector &inout InMoveDir, const FVector &inout OriginLockPointLocaton, const FVector &inout CheckLockPointLocation, const float32 ConeAngle)
{
    int local_39;
    FVector local_6 = ZeroPosition;
    local_6.Z = 0.0;
    FVector local_14 = InMoveDir;
    local_14.Z = 0.0;
    FVector local_20 = CheckLockPointLocation;
    local_20.Z = 0.0;
    local_20.Z = 0.0;
    FVector local_38 = local_14.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    if (local_38.IsNearlyZero(9.999999747378752e-5))
    {
        return false;
    }
    FVector local_32 = (local_20 - local_6);
    FVector local_46 = (OriginLockPointLocaton - local_6);
    if (local_32.IsNearlyZero(9.999999747378752e-5))
    {
        return false;
    }
    FVector local_52 = local_32.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    float local_8_5 = local_52.DotProduct(local_38);
    float local_62 = FMath::Cos(FMath::DegreesToRadians(ConeAngle));
    float local_66 = local_38.CrossProduct(local_46).Z;
    float local_68 = local_38.CrossProduct(local_32).Z;
    if (local_8_5 < local_62)
    {
        local_39 = 0;
    }
    else
    {
        float local_60 = local_66 * local_68;
        bool local_71 = (local_60 <= 0.0);
        local_39 = local_71;
    }
    return (local_39 != 0);
}
bool IsPointInCone(const FVector &inout ZeroPosition, const FVector &inout InMoveDir, const FVector &inout CheckLockPointLocation, const float32 ConeAngle)
{
    FVector local_12 = (CheckLockPointLocation - ZeroPosition);
    if (local_12.Size() == 0.0)
    {
        return true;
    }
    FVector local_24 = InMoveDir.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    return ((local_24.DotProduct(local_12.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector))) >= (FMath::Cos(((ConeAngle * 3.1415927f) / 180.0f))));
}
bool IsPointInConeTwoSide(const FVector &inout ZeroPosition, const FVector &inout InMoveDir, const TArray<FRangeSearchLockPointInfo> &inout CheckLockPoints, const float32 ConeAngle)
{
    bool local_1 = false;
    bool local_3 = false;
    for (auto& local_18 : CheckLockPoints)
    {
        if (FLockTargetUtils::IsPointInCone(ZeroPosition, InMoveDir, local_18.GetWarpingPosition(), ConeAngle))
        {
            FVector local_30 = InMoveDir.CrossProduct((FVector(local_18.GetWarpingPosition()) - ZeroPosition));
            if (local_30.Z > 0.0)
            {
                local_1 = true;
            }
            else
            {
                if (local_30.Z < 0.0)
                {
                    local_3 = true;
                }
            }
            if (local_1 && local_3)
            {
                return true;
            }
        }
    }
    return false;
}
bool IsPointsDistributedCloseToMoveDir(const FVector &inout ZeroPosition, const FVector &inout InMoveDir, const TArray<FRangeSearchLockPointInfo> &inout CheckLockPoints)
{
    float local_66;
    float local_76;
    if (CheckLockPoints.Num() < 2)
    {
        return false;
    }
    FVector local_18 = InMoveDir.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    if (local_18.IsNearlyZero(9.999999747378752e-5))
    {
        return false;
    }
    TArray<float> local_22;
    for (auto& local_36 : CheckLockPoints)
    {
        FVector local_48 = (FVector(local_36.GetWarpingPosition()) - ZeroPosition);
        float local_12 = local_48.Size();
        if (local_12 < 9.999999747378752e-5)
        {
            continue;
        }
        float local_58 = local_18.CrossProduct(local_48).Z;
        local_22.Add(FMath::RadiansToDegrees(FMath::Atan2(local_58, local_18.DotProduct((local_48 / local_12)))));
    }
    if (local_22.Num() < 2)
    {
        return false;
    }
    float local_58_2 = 0.0;
    int local_69 = 0;
    int local_70 = 0;
    for (; local_70 < (local_22.Num() - 1); ++local_70)
    {
        local_66 = local_22[local_70 + 1];
        local_66 = local_66 - local_22[local_70];
        if (local_66 > local_58_2)
        {
            local_58_2 = local_66;
            local_69 = local_70;
        }
    }
    float local_74 = 360.0;
    float local_50_2 = local_22[local_22.Num() - 1];
    local_50_2 = local_50_2 - local_22[0];
    float local_68 = local_74 - local_50_2;
    if (local_68 > local_58_2)
    {
        local_58_2 = local_68;
        local_69 = -1;
    }
    if (local_69 == -1)
    {
        local_66 = local_22[0];
        local_76 = local_22[(local_22.Num() - 1)];
    }
    else
    {
        local_66 = local_22[local_69 + 1];
        local_76 = local_22[local_69];
    }
    float32 local_77 = 0.0f;
    int local_79 = false;
    if (local_66 <= local_76)
    {
        local_79 = (local_77 >= local_66 && ((local_77 <= local_76)));
    }
    else
    {
        local_79 = (local_77 >= local_66 || ((local_77 <= local_76)));
    }
    return (local_79 != 0);
}
bool FindPointWithSmallestAngle(const FVector &inout MoveOriginPos, const FVector &inout MoveDir, const float32 FanShapeSoftLockRangeSearchAngle, const TArray<FRangeSearchLockPointInfo> &inout LockPoints, FVector &inout OutPoint)
{
    if (LockPoints.Num() == 0)
    {
        return false;
    }
    FVector local_18 = MoveDir.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    if (local_18.IsNearlyZero(9.999999747378752e-5))
    {
        return false;
    }
    float32 local_21 = FMath::Cos(FMath::DegreesToRadians(FanShapeSoftLockRangeSearchAngle));
    float local_24 = 9999.0;
    for (auto& local_38 : LockPoints)
    {
        FVector local_50 = (FVector(local_38.GetWarpingPosition()) - MoveOriginPos);
        float local_12 = local_50.Size();
        if (local_12 < 9.999999747378752e-5)
        {
            continue;
        }
        float local_52 = local_18.DotProduct((local_50 / local_12));
        if (local_52 >= local_21)
        {
            float local_64 = FMath::RadiansToDegrees(FMath::Acos(local_52));
            if (local_64 < local_24)
            {
                OutPoint = local_38.GetWarpingPosition();
                local_24 = local_64;
            }
        }
    }
    return local_24 < 360.0 && true;
}
bool IsLockTargetMatchBaseCondition(const ELockTargetType LockTargetType, const FECSEntity &inout Entity, const FECSEntity &inout LockableEntity, const float32 MinDetectBlockDistance, const bool bCheckView, const FVector &inout ViewOrigin)
{
    bool local_19;
    Has local_36;
    if ((LockableEntity == Entity))
    {
        return false;
    }
    Has local_6;
    if (local_6.opCall())
    {
        return false;
    }
    Has local_10;
    if (!(local_10.opCall()))
    {
        return false;
    }
    if (LockableEntity.MatchGameplayTag(GameplayTags::CombatState_Special_Unlockable))
    {
        return false;
    }
    Has local_14;
    Get local_18;
    if (local_14.opCall() && local_18.opCall().GetbOnlySoftLock() && (int(LockTargetType) == 2))
    {
        return false;
    }
    Has local_26;
    Get local_30;
    if (local_26.opCall() && local_30.opCall().GetbOnlySoftLock() && (int(LockTargetType) == 2))
    {
        return false;
    }
    EFactionRelation local_31 = FASCommonUtils::GetEntityFactionRelation(Entity, LockableEntity);
    if (int(local_31) == 4)
    {
        return false;
    }
    if (!(local_36.opCall()))
    {
        local_19 = false;
    }
    else
    {
        local_19 = local_36.opCall();
    }
    Get local_40;
    Get local_44;
    local_19 = local_19 && (FECSEntity(local_40.opCall().GetPlayerEntity()) == local_44.opCall().GetPlayerEntity());
    if (local_19)
    {
        return false;
    }
    if (int(local_31) == 1 && (int(FASCommonUtils::GetEntityFactionRelation(LockableEntity, Entity)) == 4))
    {
        return false;
    }
    if (bCheckView)
    {
        if (FLockTargetUtils::IsTraceBlockedToTargetEntity(Entity, LockableEntity, MinDetectBlockDistance, ViewOrigin))
        {
            return false;
        }
    }
    return true;
}
bool IsTraceBlockedToTargetEntity(const FECSEntity &inout Entity, const FECSEntity &inout LockableEntity, const float32 MinDetectBlockDistance, const FVector &inout ViewOrigin)
{
    TArray<FECSEntity> local_4;
    local_4.Add(FASCommonUtils::GetRiderEntity(Entity));
    local_4.Add(FASCommonUtils::GetRiderEntity(LockableEntity));
    local_4.Append(FAttachmentUtils::GetEntityAttachedChild(LockableEntity));
    Get local_18;
    const FC_PawnRiddingMount& local_20 = local_18.opCall();
    if (local_20)
    {
        local_4.Add(local_20.GetMountEntity());
    }
    return FLockTargetUtils::IsTraceBlockedToTargetEntity(Entity, LockableEntity, ViewOrigin, MinDetectBlockDistance, local_4);
}
void DisposeMultiLockTargetExtraInfo(const FECSEntity &inout Entity, const FC_LockTarget &inout LockTarget, FLockTargetOverrideInfo &inout OverrideInfo, const bool bWriteMultiLockTargetExtraInfo, const ULockTargetConfig Config)
{
    bool local_2;
    int local_8 = 0;
    int local_14 = 0;
    int local_26 = 0;
    if (!(bWriteMultiLockTargetExtraInfo))
    {
        local_2 = false;
    }
    else
    {
        local_2 = LockTarget;
    }
    if (!(local_2))
    {
        local_2 = false;
    }
    else
    {
        Has local_6;
        local_2 = local_6.opCall();
    }
    if (local_2)
    {
        FECSWorldPtr local_20 = Entity.GetWorld();
        FFPTime local_30 = FTransformUtils::GetPlayerRollbackTime(Entity, local_26);
        TArray<FLockPointInfo> local_34;
        if (int(LockTarget.GetType()) == 2)
        {
            int local_38;
            local_38 = LockTarget.GetLockPointIndex();
            local_34.Add(FLockTargetUtils::GetMainLockPointFromLockPointConfig(LockTarget.GetTargetEntity(), local_38, local_8.GetLockPoints()[local_38], local_30));
        }
        else
        {
            FLockTargetUtils::GetLockPointsFromEntity(LockTarget.GetTargetEntity(), local_34, local_30, false);
        }
        FLockTargetResult local_102 = FLockTargetUtils::PickEntityLockPoint(ELockTargetType(ELockTargetType(1)), Entity, LockTarget.GetTargetEntity(), Config.Data, OverrideInfo, local_34);
        if ((local_102.LockPointPosition == FVector::ZeroVector))
        {
            local_102.LockPointPosition = LockTarget.GetLogicLockTargetPosition();
        }
        if (int(local_102.ArrayIndex) == -1)
        {
            local_14.SetTargetEntity(LockTarget.GetTargetEntity());
            local_14.SetbCachedValidMultiExtraInfo(false);
        }
        else
        {
            local_14.SetTargetEntity(LockTarget.GetTargetEntity());
            FMultiLockTargetExtraInfo local_124;
            int local_37 = local_34[int(local_102.ArrayIndex)].Index;
            local_124.SetIndex(local_37);
            local_37 = local_34[int(local_102.ArrayIndex)].SubIndex;
            local_124.SetSubIndex(local_37);
            local_124.SetPosition(local_102.LockPointPosition);
            local_14.SetLockTargetExtraInfo(local_124);
            local_14.SetbCachedValidMultiExtraInfo(true);
        }
    }
    return;
}
void EnterSoftLock(const FECSEntity &inout Entity, const FFPTime &inout WorldTime, const bool bOverrideMaxDistance, const float32 OverrideMaxDistance, const bool bKeepBeforeExit, const bool bWriteMultiLockTargetExtraInfo, const ULockTargetConfig Config)
{
    int local_52 = 0;
    FLockTargetOverrideInfo local_44 = FLockTargetUtils::GetInitOverrideInfo(Entity, WorldTime);
    if (bOverrideMaxDistance)
    {
        local_44.bOverrideMaxLockDistance = true;
        local_44.MaxMaxLockDistance = OverrideMaxDistance;
    }
    FLockTargetUtils::PickSoftLockTarget(Entity, WorldTime, Config.Data, local_44, bKeepBeforeExit);
    FLockTargetUtils::DisposeMultiLockTargetExtraInfo(Entity, local_52, local_44, bWriteMultiLockTargetExtraInfo, Config);
    return;
}
void ExitSoftLock(const FECSEntity &inout Entity, const FFPTime &inout WorldTime, const bool bOverrideMaxDistance, const float32 OverrideMaxDistance, const bool bClearOnExit, const bool bKeepBeforeExit, const bool bRepickTargetWhenExit, const ULockTargetConfig Config, const FECSEntity &inout TargetEntity, const int LockPointIndex)
{
    int local_8 = 0;
    int local_26 = 0;
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        if (local_8.GetbAdditionalStrafeCounter())
        {
            local_8.SetKeepStrafeCounter((local_8.GetKeepStrafeCounter() - 1));
            local_8.SetbAdditionalStrafeCounter(false);
            FESMTriggerUtils::ActivateESMTrigger(Entity, n"KeepStrafeCounterTrigger", ECS::GetContextTime(), FFPTime(0.1), 0);
        }
    }
    if (local_26 && (int(local_26.GetType()) == 2))
    {
        return;
    }
    if (bRepickTargetWhenExit)
    {
        FLockTargetOverrideInfo local_72 = FLockTargetUtils::GetInitOverrideInfo(Entity, WorldTime);
        if (bOverrideMaxDistance)
        {
            local_72.bOverrideMaxLockDistance = true;
            local_72.MaxMaxLockDistance = OverrideMaxDistance;
        }
        FLockTargetResult local_104 = FLockTargetUtils::PickLockTargetResult(ELockTargetType(ELockTargetType(1)), Entity, WorldTime, Config.Data, local_72);
        if (!((local_104.LockTarget == ENTITY_NULL)))
        {
            FLockTargetUtils::UpdateLockTarget(Entity, local_104.LockTarget, int(local_104.LockPointIndex), ELockTargetType(ELockTargetType(1)), Config.Data.bShouldStrafe, int(Config.Data.KeepDuration));
        }
        return;
    }
    if (!(local_26))
    {
        if (bKeepBeforeExit && TargetEntity.IsValid())
        {
            FLockTargetUtils::UpdateLockTarget(Entity, TargetEntity, LockPointIndex, ELockTargetType(ELockTargetType(1)), Config.Data.bShouldStrafe, int(Config.Data.KeepDuration));
        }
        return;
    }
    if (int(local_26.GetType()) == 2)
    {
        return;
    }
    if (bClearOnExit)
    {
        FLockTargetUtils::ClearLockTarget(Entity);
        return;
    }
    if (bKeepBeforeExit)
    {
        FLockTargetUtils::UpdateLockTarget(Entity, local_26.GetTargetEntity(), local_26.GetLockPointIndex(), ELockTargetType(ELockTargetType(1)), Config.Data.bShouldStrafe, int(Config.Data.KeepDuration));
    }
    return;
}
void OnDisposeFanShapeSoftLockRangeSearch(const FECSEntity &inout Entity, const float32 FanShapeSoftLockRangeSearchAngle, const float32 FindPointSmallestAngleRange, const FFPTime &inout WorldTime, FVector &inout OutTurnToWorldPos)
{
    int local_50 = 0;
    int local_78 = 0;
    FLockTargetOverrideInfo local_44 = FLockTargetUtils::GetInitOverrideInfo(Entity, WorldTime);
    bool local_47 = false;
    if (FLockTargetUtils::IsPlayerSettingInputFirstEnabledByPawn(Entity) && !(local_44.bNoInput))
    {
        local_50.SetbInFanShapeSoftLockRangeSearch(false);
        local_50.SetbUseTransformForward(false);
        return;
    }
    Get local_58;
    const FC_LockTarget& local_60 = local_58.opCall();
    if (local_60)
    {
        FLockPointInfo local_76;
        if (local_60.GetTargetEntity().IsValid() && FLockTargetUtils::GetLogicLockTargetInfo(Entity, local_76))
        {
            if (!(local_76.bFanShapeSoftLockRangeSearch))
            {
                local_50.SetbInFanShapeSoftLockRangeSearch(false);
                local_50.SetbUseTransformForward(false);
                return;
            }
        }
    }
    bool local_45 = FLockTargetUtils::IsPointsDistributedCloseToMoveDir(local_44.MoveOriginPos, FVector(local_44.MoveDir.Vector()), local_78) && !(local_44.bNoInput);
    Get local_96;
    local_47 = FLockTargetUtils::IsPointsDistributedCloseToMoveDir(local_44.MoveOriginPos, FVector(local_96.opCall().GetRotation().Vector()), local_78);
    if (local_45 || local_47)
    {
        local_50.SetbInFanShapeSoftLockRangeSearch(true);
        if (local_45)
        {
            local_50.SetbUseTransformForward(false);
        }
        else
        {
            if (local_47)
            {
                FVector local_108(FVector::ZeroVector);
                if (!(local_44.bNoInput) && FLockTargetUtils::FindPointWithSmallestAngle(local_44.MoveOriginPos, FVector(local_44.MoveDir.Vector()), FindPointSmallestAngleRange, local_78, local_108))
                {
                    OutTurnToWorldPos = local_108;
                }
                local_50.SetbUseTransformForward(true);
            }
        }
        return;
    }
    local_50.SetbInFanShapeSoftLockRangeSearch(false);
    local_50.SetbUseTransformForward(false);
    return;
}
}
void UpdateLockTargetInternal(const FECSEntity &inout Entity, const FECSEntity &inout NewLockTarget, const int LockPointIndex, const ELockTargetType NewLockTargetType, const bool bEnableStrafe, const float32 KeepDuration)
{
    bool local_1;
    Get local_6;
    int local_28 = 0;
    int local_66 = 0;
    int local_72 = 0;
    int local_100 = 0;
    int local_112 = 0;
    int local_146 = 0;
    if ((NewLockTarget == ENTITY_NULL))
    {
        Remove local_64;
        Modify local_46;
        Get local_34;
        const FC_LockTarget& local_8 = local_6.opCall();
        if (local_8)
        {
            if (int(NewLockTargetType) != 2)
            {
                local_1 = false;
            }
            else
            {
                Has local_14;
                local_1 = local_14.opCall();
            }
            if (local_1)
            {
                Modify local_20;
                local_20.opCall().SetType(ELockTargetType(1));
                local_28.SetType(ELockTargetType(1));
                FECSWorldPtr local_30 = Entity.GetWorld();
                local_28.SetKeepTargetTime((FFPTime(local_34.opCall().Time) + FFPTime(KeepDuration)));
            }
            else
            {
                FC_CharacterPoseState& local_48 = local_46.opCall();
                if (local_48)
                {
                    if (local_8.GetbShouldStrafe())
                    {
                        local_48.SetKeepStrafeCounter((local_48.GetKeepStrafeCounter() - 1));
                        FESMTriggerUtils::ActivateESMTrigger(Entity, n"KeepStrafeCounterTrigger", ECS::GetContextTime(), FFPTime(0.1), 0);
                    }
                    int local_51 = (local_48.GetAimRotationValidCounter() - 1);
                    local_48.SetAimRotationValidCounter(uint8(local_51));
                    int local_9 = local_48.GetAimRotationValidCounter();
                }
                Remove local_56;
                local_56.opCall();
                Remove local_60;
                local_60.opCall();
                local_64.opCall();
            }
        }
        if (local_66 && !(local_66.GetbInFanShapeSoftLockRangeSearch()))
        {
            local_72.SetbInFanShapeSoftLockRangeSearch(false);
            local_72.GetModify_RangeSearchLockPoints().Empty(0);
        }
        return;
    }
    FECSEntity local_80 = NewLockTarget;
    Has local_84;
    if (local_84.opCall() == false)
    {
        return;
    }
    bool local_85 = false;
    bool local_86 = false;
    const FC_LockTarget& local_8_2 = local_6.opCall();
    if (local_8_2)
    {
        local_85 = true;
        local_86 = local_8_2.GetbShouldStrafe();
    }
    bool local_87 = false;
    bool local_88 = bEnableStrafe;
    Has local_92;
    bool local_15 = local_92.opCall();
    if (local_15)
    {
        FC_SoftLockTargetTag local_110;
        Assign local_108;
        int local_93 = LockPointIndex;
        if (local_93 == -1)
        {
            local_93 = 0;
        }
        if (local_93 < local_100.GetLockPoints().Num())
        {
            local_8_2.SetType(ELockTargetType(NewLockTargetType));
            local_8_2.SetTargetEntity(NewLockTarget);
            local_8_2.SetLockPointIndex(local_93);
            local_8_2.SetCachedLockTargetConfig(local_100.GetLockPoints()[local_93]);
            local_8_2.SetbShouldStrafe(bEnableStrafe);
            if (int(NewLockTargetType) == 1)
            {
                local_108.opCall(local_110);
            }
            if (int(NewLockTargetType) == 2)
            {
                FMultiLockTargetExtraInfo local_132;
                local_112.SetTargetEntity(NewLockTarget);
                local_132.SetIndex(local_93);
                local_132.SetSubIndex(-1);
                GetDefaulted local_136;
                local_132.SetPosition(local_136.opCall().GetPosition());
                local_112.SetLockTargetExtraInfo(local_132);
                local_112.SetbCachedValidMultiExtraInfo(false);
            }
            local_87 = true;
        }
    }
    else
    {
        FC_SoftLockTargetTag local_110;
        Assign local_108;
        Remove local_64;
        Has local_140;
        bool local_15_2 = local_140.opCall();
        if (local_15_2)
        {
            local_64.opCall();
            if (LockPointIndex == -1)
            {
                local_8_2.SetType(ELockTargetType(NewLockTargetType));
                local_8_2.SetTargetEntity(NewLockTarget);
                local_8_2.SetLockPointIndex(-1);
                local_8_2.SetCachedLockTargetConfig(local_146.GetLockPoint());
                local_8_2.SetbShouldStrafe(bEnableStrafe);
                if (int(NewLockTargetType) == 1)
                {
                    local_108.opCall(local_110);
                }
                local_87 = true;
            }
        }
    }
    if (local_87 == false)
    {
        ELog local_154;
        FString local_150 = "Invalid Lock Target Entity:";
        int local_50 = Entity.GetIdValue();
        (local_150 + int(local_154));
        FString local_150_2 = (local_154 + " TargetEntity:");
        local_50 = NewLockTarget.GetIdValue();
        (local_150_2 + int(local_154));
        FString local_150_3 = (local_154 + " LockPointIndex:");
        (local_150_3 + int(local_154));
        return;
    }
    if (local_85 == false)
    {
        Modify local_46;
        FC_CharacterPoseState& local_48_2 = local_46.opCall();
        if (local_48_2)
        {
            local_48_2.SetAimRotationValidCounter(uint8((local_48_2.GetAimRotationValidCounter() + 1)));
        }
    }
    local_1 = !(local_86);
    bool local_15_3 = !(local_88);
    if (local_1 != local_15_3)
    {
        Modify local_46;
        FC_CharacterPoseState& local_48_3 = local_46.opCall();
        if (local_48_3)
        {
            if (local_88)
            {
                local_48_3.SetKeepStrafeCounter((local_48_3.GetKeepStrafeCounter() + 1));
            }
            else
            {
                local_48_3.SetKeepStrafeCounter((local_48_3.GetKeepStrafeCounter() - 1));
            }
            FESMTriggerUtils::ActivateESMTrigger(Entity, n"KeepStrafeCounterTrigger", ECS::GetContextTime(), FFPTime(0.1), 0);
        }
    }
    if (KeepDuration > 0.0f)
    {
        Get local_34;
        local_28.SetType(ELockTargetType(NewLockTargetType));
        if (KeepDuration > 0.0f)
        {
            FECSWorldPtr local_30_2 = Entity.GetWorld();
            local_28.SetKeepTargetTime((FFPTime(local_34.opCall().Time) + FFPTime(KeepDuration)));
        }
    }
    return;
}
void PickLockTargetInternal(FLockTargetResult &inout OutResult, const ELockTargetType LockTargetType, const FECSEntity &inout Entity, const FECSEntity &inout LockableEntity, const FLockTargetConfigData &inout ConfigData, const FLockTargetOverrideInfo &inout OverrideInfo, const TArray<FLockPointInfo> &inout LockPoints)
{
    bool local_39;
    bool local_52;
    Get local_58;
    float local_115;
    int local_127;
    FScopeCycleCounter local_1 = FScopeCycleCounter(FStatID(n"PickLockTargetInternal"), false);
    bool local_5 = false;
    Has local_10;
    bool local_4 = local_10.opCall();
    Get local_20;
    FVector local_16 = local_20.opCall().GetPosition();
    FVector local_32 = FVector(local_16.X, local_16.Y, 0.0);
    Has local_44;
    bool local_6 = local_44.opCall();
    if (!(ConfigData.bEnableFanShapeSoftLockRangeSearch && (int(LockTargetType) == 1)))
    {
        local_39 = false;
    }
    else
    {
        if (!(local_4))
        {
            local_52 = true;
        }
        else
        {
            Get local_50;
            local_52 = local_4 && (int(local_50.opCall().GetType()) != 2);
        }
        local_39 = local_52;
    }
    if (local_39)
    {
        if (local_6 && local_58.opCall().GetbEnableFanShapeSoftLockRangeBeSearched())
        {
            local_5 = true;
        }
        else
        {
            Has local_62;
            local_39 = local_62.opCall();
            Get local_66;
            if (local_39 && local_66.opCall().GetbEnableFanShapeSoftLockRangeBeSearched())
            {
                local_5 = true;
            }
        }
    }
    float32 local_80 = OverrideInfo.MoveDir.Vector().Y;
    FVector3f local_75 = OverrideInfo.MoveDir.Vector();
    FVector3f local_78 = FVector3f(local_75.X, local_80, 0.0f);
    FECSEntity local_86 = FECSEntity(ENTITY_NULL);
    int local_87 = 0;
    for (; local_87 < LockPoints.Num(); ++local_87)
    {
        if ((ConfigData.AcceptPlayerSettingInputFirst && FLockTargetUtils::IsPlayerSettingInputFirstEnabledByPawn(Entity)) && !(OverrideInfo.bNoInput))
        {
            continue;
        }
        const FLockPointInfo& local_90 = LockPoints[local_87];
        FVector local_26 = local_90.Position;
        FVector3f local_69 = FVector3f((local_26 - OverrideInfo.MoveOriginPos));
        float32 local_80_2 = local_69.Y;
        float32 local_81_2 = local_69.X;
        FVector3f local_75_2 = FVector3f(local_81_2, local_80_2, 0.0f);
        float32 local_79 = FQuat4f::FindBetweenVectors(local_75_2, local_78).GetAngle();
        local_80_2 = FMath::RadiansToDegrees(local_79);
        local_79 = FMath::RadiansToDegrees(FQuat4f::FindBetweenVectors(OverrideInfo.MoveDir.Vector(), local_69).GetAngle());
        if (local_79 >= ConfigData.MinInputAngleXYCurveForDistance.GetFloatValue(local_75_2.Size(), 0.0f))
        {
            if (!(OverrideInfo.bNoInput))
            {
                continue;
            }
        }
        if ((FMath::Abs(local_90.Position.Z - local_16.Z)) >= ConfigData.MinZHeight)
        {
            continue;
        }
        float32 local_114 = local_69.Size();
        local_79 = local_90.Radius;
        if (local_79 > 0.0f)
        {
            local_115 = local_90.Radius;
            local_114 = FMath::Max(0.0f, local_114 - local_115);
        }
        local_79 = ConfigData.MaxLockAngleCurveForDistance.GetFloatValue(local_114, 0.0f);
        local_26 = local_90.Position;
        local_81_2 = FMath::RadiansToDegrees(FQuat4f::FindBetweenVectors(OverrideInfo.ViewDir.GetForwardVector(), FVector3f((local_26 - OverrideInfo.ViewOriginPos))).GetAngle());
        if (local_81_2 >= local_79)
        {
            continue;
        }
        if (int(LockTargetType) == 2)
        {
            if (local_114 >= (ConfigData.GetMaxLockDistanceByEntity(LockableEntity) * ConfigData.MaxLockDistanceReduceRatioForLockAngle.GetFloatValue(local_81_2, 0.0f)))
            {
                continue;
            }
        }
        float32 local_113 = ConfigData.ScoreCurveForDistance.GetFloatValue(local_114, 0.0f);
        float32 local_116 = ConfigData.ScoreCurveForLockAngle.GetFloatValue(local_80_2, 0.0f);
        if (OverrideInfo.bNoInput)
        {
            local_116 = local_116 * 0.1f;
        }
        float32 local_122 = ConfigData.ScoreCurveForCameraAngle.GetFloatValue(local_81_2, 0.0f);
        float32 local_126 = 1.0f;
        int local_128 = 0;
        local_127 = local_128;
        if (!((LockableEntity == ENTITY_NULL)))
        {
            if (int(GetPrefabType(LockableEntity)) == 2)
            {
                local_127 = int(FASCommonUtils::GetMonsterRank(LockableEntity));
            }
        }
        local_126 = local_126 * ConfigData.AdditionalMultiplierForMonsterRank[EMonsterRank(local_127)];
        if (FAIKnowledgeUtils::IsEntityInCombat(LockableEntity))
        {
            local_115 = 1.0f;
        }
        else
        {
            local_115 = int(ConfigData.NonCombatMultiplier);
        }
        local_126 = local_126 * local_115;
        local_115 = local_113 + local_116;
        float32 local_124 = (local_115 + local_122) * local_126;
        if (local_6)
        {
            local_124 = local_124 * local_58.opCall().GetPickTargetScoreRatio();
        }
        FVector local_144 = local_90.Position;
        FVector local_100 = (FVector(FVector::UpVector) * 30.0);
        FECSDebugDraw::DrawDebugString(n"LockTarget", (local_144 + local_100), FString().Append("TotalScore: ").Append(local_124), FColor::Red, 1.0f, FColor(uint8(0), uint8(0), uint8(0), uint8(0)), CVar_LockTarget_Debug_Time.GetFloat());
        if (local_124 <= 0.0f)
        {
            continue;
        }
        if (OutResult.NewScore < local_124)
        {
            OutResult.NewScore = local_124;
            OutResult.LockTarget = LockableEntity;
            OutResult.LockPointIndex = int(local_90.Index);
            OutResult.ArrayIndex = local_87;
            OutResult.LockPointPosition = local_90.Position;
            if (local_5)
            {
                CacheFanShapeSoftLockRangeSearch(Entity, ConfigData, LockPoints, OverrideInfo, local_87);
            }
            else
            {
                ClearFanShapeSoftLockRangeSearch(Entity);
            }
        }
        if (CVar_LockTarget_Debug.GetBool() && (local_124 > 0.0f))
        {
            FECSDebugDraw::SetDebugKeyEnable(n"LockTarget", true);
            local_100 = local_90.Position;
            FECSDebugDraw::DrawDebugString(n"LockTarget", (local_100 + FVector(0.0, 0.0, 150.0)), FString().Append("Scr:").Append(LockableEntity).Append("\nAagScr:").Append(FString::ApplyFormat(local_116, ".2f")).Append(" (").Append(FString::ApplyFormat(local_80_2, ".3f")).Append(")\nDisScr").Append(FString::ApplyFormat(local_113, ".2f")).Append(" (").Append(FString::ApplyFormat(local_114, ".3f")).Append(")\nCamAngScr").Append(FString::ApplyFormat(local_122, ".2f")).Append(" (").Append(FString::ApplyFormat(local_81_2, ".3f")).Append(")"), FColor::Red, 1.3f, FColor::Blue, CVar_LockTarget_Debug_Time.GetFloat());
            int local_123 = CVar_LockTarget_Debug_Time.GetFloat();
            local_144 = local_90.Position;
            FECSDebugDraw::DrawDebugString(n"LockTarget", (local_144 + FVector(0.0, 0.0, 250.0)), (FString("CameraAngleDist ") + local_81_2), FColor::Red, 1.3f, FColor::Blue);
            if (local_90.Radius > 0.0f)
            {
                FECSDebugDraw::DrawDebugSphere(n"LockTarget", local_90.Position, local_90.Radius, 12, FColor::Green, FColor::Blue, CVar_LockTarget_Debug_Time.GetFloat(), uint8(0), 0.0f);
            }
        }
    }
    if (CVar_LockTarget_Debug.GetBool())
    {
        FECSDebugDraw::SetDebugKeyEnable(n"LockTarget", true);
        FECSDebugDraw::DrawDebugSphere(n"LockTarget", OutResult.LockPointPosition, 200.0f, 12, FColor::Yellow, FColor::Yellow, CVar_LockTarget_Debug_Time.GetFloat(), uint8(0), 0.0f);
        FECSDebugDraw::DrawDebugPoint(n"LockTarget", OverrideInfo.MoveOriginPos, 30.0f, FColor::Red, FColor::Blue, CVar_LockTarget_Debug_Time.GetFloat(), uint8(0));
        int local_123_2 = CVar_LockTarget_Debug_Time.GetFloat();
        FVector local_100_2 = (FVector(OverrideInfo.MoveDir.GetForwardVector()) * 300.0);
        FECSDebugDraw::DrawDebugLine(n"LockTarget", OverrideInfo.MoveOriginPos, (OverrideInfo.MoveOriginPos + local_100_2), FColor::Red, FColor::Blue, 0.0f, uint8(0));
        float32 local_120 = CVar_LockTarget_Debug_Time.GetFloat();
        LockableEntity.GetEntityName();
        FString local_162 = FString();
    }
    else
    {
        FECSDebugDraw::SetDebugKeyEnable(n"LockTarget", false);
    }
    return;
}
void CacheFanShapeSoftLockRangeSearch(const FECSEntity &inout Entity, const FLockTargetConfigData &inout ConfigData, const TArray<FLockPointInfo> &inout LockPoints, const FLockTargetOverrideInfo &inout OverrideInfo, const int CurIndex)
{
    int local_4 = 0;
    if (LockPoints[CurIndex].bFanShapeSoftLockRangeSearch)
    {
        local_4.GetModify_RangeSearchLockPoints().Empty(0);
        local_4.SetbInFanShapeSoftLockRangeSearch(false);
        local_4.SetbUseTransformForward(false);
        local_4.SetFindPointSmallestAngleRange(ConfigData.FindPointSmallestAngleRange);
        int local_11 = 0;
        for (; local_11 < LockPoints.Num(); ++local_11)
        {
            if (!(LockPoints[local_11].bFanShapeSoftLockRangeSearch))
            {
                continue;
            }
            FRangeSearchLockPointInfo local_28;
            local_28.SetWarpingPosition(LockPoints[local_11].Position);
            local_28.SetWarpingRotation(LockPoints[local_11].Rotation);
            local_28.SetIndex(LockPoints[local_11].Index);
            local_28.SetSubIndex(LockPoints[local_11].SubIndex);
            local_4.GetModify_RangeSearchLockPoints().Add(local_28);
        }
    }
    return;
}
void ClearFanShapeSoftLockRangeSearch(const FECSEntity &inout Entity)
{
    int local_2 = 0;
    int local_10 = 0;
    if (local_2 && local_2.GetbInFanShapeSoftLockRangeSearch())
    {
        local_10.SetbInFanShapeSoftLockRangeSearch(false);
        local_10.GetModify_RangeSearchLockPoints().Empty(0);
    }
    return;
}

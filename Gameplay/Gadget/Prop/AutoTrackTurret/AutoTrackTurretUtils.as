
const FConsoleVariable CVar_Debug_AutoTrackTurret = FConsoleVariable();

namespace AutoTrackTurretDebug
{
bool IsDebugEnabled()
{
    return CVar_Debug_AutoTrackTurret.GetBool();
}
void Log(const FString &inout Message)
{
    if (CVar_Debug_AutoTrackTurret.GetBool())
    {
        XLog(ELog(42), Message);
    }
    return;
}
void DrawDebugConfig(const FECSEntity &inout TurretEntity, const FC_AutoTrackTurretConfig &inout Config)
{
    int local_6 = 0;
    float32 local_65;
    float32 local_66;
    if (!(local_6))
    {
        return;
    }
    FVector local_14 = local_6.GetPosition();
    FQuat local_24 = local_6.GetRotation();
    FVector local_30(local_24.GetForwardVector());
    FRotator local_48 = local_24.Rotator();
    for (auto& local_62 : Config.TargetingConditionsForMonster)
    {
        if (local_62._base_FAutoTrackTurretTargetingConditionBase > 0.0f)
        {
            local_65 = local_62._base_FAutoTrackTurretTargetingConditionBase;
            local_66 = local_65;
        }
        else
        {
            local_66 = 0.0f;
        }
        if (local_66 > 0.0f)
        {
            FECSDebugDraw::DrawDebugSphere(n"AutoTrackTurret", local_14, local_66, 60, FColor(uint8(200), uint8(200), uint8(200), uint8(255)), FColor(uint8(200), uint8(200), uint8(200), uint8(255)), 0.5f, uint8(0), 2.0f);
        }
        if (local_62.MaxAngle > 0.0f && ((local_62.MaxAngle < 180.0f)))
        {
            if (local_66 > 0.0f)
            {
                local_65 = local_66;
            }
            else
            {
                local_65 = 800.0f;
            }
            FECSDebugDraw::DrawDebugCone(n"AutoTrackTurret", local_14, local_30, local_65, local_62.MaxAngle, local_62.MaxAngle, 32, FColor(uint8(255), uint8(0), uint8(255), uint8(200)), FColor(uint8(255), uint8(0), uint8(255), uint8(200)), false, 0.5f, uint8(0), 2.0f);
        }
    }
    local_65 = 300.0f;
    int local_79 = 20;
    if ((Config.bTrackYaw && Config.bLimitYaw))
    {
        FVector local_86 = (local_48 + FRotator(0.0, Config.MaxYaw, 0.0)).Vector();
        FECSDebugDraw::DrawDebugLine(n"AutoTrackTurret", local_14, (local_14 + (((local_48 + FRotator(0.0, Config.MinYaw, 0.0)).Vector()) * local_65)), FColor::Blue, FColor::Blue, 0.5f, uint8(0), 2.0f);
        FECSDebugDraw::DrawDebugLine(n"AutoTrackTurret", local_14, (local_14 + (local_86 * local_65)), FColor::Blue, FColor::Blue, 0.5f, uint8(0), 2.0f);
        float32 local_78_2 = Config.MinYaw;
        float32 local_63 = Config.MaxYaw - local_78_2;
        int local_111 = 0;
        for (; local_111 < local_79; )
        {
            local_66 = local_63 * local_111;
            float32 local_64_2 = local_66 / local_79;
            float32 local_77 = Config.MinYaw + local_64_2;
            local_66 = Config.MinYaw;
            float32 local_112 = (local_111 + 1);
            local_64_2 = local_63 * local_112;
            local_78_2 = local_64_2 / local_79;
            local_112 = local_66 + local_78_2;
            FVector local_104_2 = ((local_48 + FRotator(0.0, local_77, 0.0)).Vector() * local_65);
            FVector local_110_2 = (local_14 + local_104_2);
            local_104_2 = ((local_48 + FRotator(0.0, local_112, 0.0)).Vector() * local_65);
            FVector local_120 = (local_14 + local_104_2);
            FECSDebugDraw::DrawDebugLine(n"AutoTrackTurret", local_110_2, local_120, FColor::Blue, FColor::Blue, 0.5f, uint8(0), 2.0f);
            ++local_111;
        }
    }
    if ((Config.bTrackYaw && Config.bTrackPitch) && Config.bLimitPitch)
    {
        local_66 = Config.MinPitch;
        FVector local_126 = (local_48 + FRotator(local_66, 0.0, 0.0)).Vector();
        FVector local_104_3 = (local_48 + FRotator(Config.MaxPitch, 0.0, 0.0)).Vector();
        FColor local_67 = FColor(uint8(255), uint8(165), uint8(0), uint8(255));
        FColor local_72 = FColor(uint8(255), uint8(165), uint8(0), uint8(255));
        FVector local_86_2 = (local_126 * local_65);
        FVector local_36_2 = (local_14 + local_86_2);
        FECSDebugDraw::DrawDebugLine(n"AutoTrackTurret", local_14, local_36_2, local_72, local_67, 0.5f, uint8(0), 2.0f);
        FColor local_67_2 = FColor(uint8(255), uint8(165), uint8(0), uint8(255));
        FColor local_72_2 = FColor(uint8(255), uint8(165), uint8(0), uint8(255));
        FVector local_86_3 = (local_104_3 * local_65);
        FVector local_36_3 = (local_14 + local_86_3);
        FECSDebugDraw::DrawDebugLine(n"AutoTrackTurret", local_14, local_36_3, local_72_2, local_67_2, 0.5f, uint8(0), 2.0f);
        float32 local_78_3 = Config.MinPitch;
        float32 local_64_3 = Config.MaxPitch - local_78_3;
        int local_111_2 = 0;
        for (; local_111_2 < local_79; )
        {
            local_66 = local_64_3 * local_111_2;
            local_78_3 = local_66 / local_79;
            float32 local_113 = Config.MinPitch + local_78_3;
            local_66 = Config.MinPitch;
            local_78_3 = (local_111_2 + 1);
            float32 local_63_2 = local_64_3 * local_78_3;
            local_78_3 = local_66 + (local_63_2 / local_79);
            FRotator local_98_2 = (local_48 + FRotator(local_113, 0.0, 0.0));
            FVector local_36_4 = (local_98_2.Vector() * local_65);
            FVector local_86_4 = (local_14 + local_36_4);
            FVector local_110_3 = ((local_48 + FRotator(local_78_3, 0.0, 0.0)).Vector() * local_65);
            local_36_4 = (local_14 + local_110_3);
            FECSDebugDraw::DrawDebugLine(n"AutoTrackTurret", local_86_4, local_36_4, FColor(uint8(255), uint8(165), uint8(0), uint8(255)), FColor(uint8(255), uint8(165), uint8(0), uint8(255)), 0.5f, uint8(0), 2.0f);
            ++local_111_2;
        }
    }
    return;
}
void DrawDebugTracking(const FECSEntity &inout TurretEntity, const FECSEntity &inout TargetEntity)
{
    int local_6 = 0;
    int local_42 = 0;
    if (!(local_6))
    {
        return;
    }
    FVector local_14 = local_6.GetPosition();
    FVector local_20(local_6.GetRotation().GetForwardVector());
    float32 local_27 = 500.0f;
    FECSDebugDraw::DrawDebugLine(n"AutoTrackTurret", local_14, (local_14 + (local_20 * local_27)), FColor::Green, FColor::Green, 0.5f, uint8(0), 6.0f);
    if (TargetEntity.IsValid())
    {
        if (local_42)
        {
            FVector local_26_2 = ((FVector(local_42.GetPosition()) - local_14).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector) * local_27);
            FECSDebugDraw::DrawDebugLine(n"AutoTrackTurret", local_14, (local_14 + local_26_2), FColor::Yellow, FColor::Yellow, 0.5f, uint8(0), 3.0f);
            FECSDebugDraw::DrawDebugLine(n"AutoTrackTurret", local_14, local_42.GetPosition(), FColor::Red, FColor::Red, 0.5f, uint8(0), 3.0f);
        }
    }
    return;
}
}
namespace AutoTrackTurret
{
FECSEntity SeekTarget(const FECSEntity &inout Entity)
{
    FC_AutoTrackTurretConfig local_6;
    int local_14 = 0;
    FECSEntity __return;
    if (!(local_6))
    {
        return ENTITY_NULL;
    }
    if (!(local_14))
    {
        return ENTITY_NULL;
    }
    int local_16 = int(local_6.TargetingMode);
    if (local_16 <= 0)
    {
        if (local_16 != 0)
        {
        }
        else
        {
            __return = AutoTrackTurret::FilterMonster(Entity, local_6);
        }
    }
    __return = ENTITY_NULL;
    return __return;
}
FECSEntity FilterMonster(const FECSEntity &inout Entity, const FC_AutoTrackTurretConfig &inout TurretConfig)
{
    int local_6 = 0;
    float32 local_35;
    float32 local_62;
    int local_96 = 0;
    FVector local_12 = local_6.GetPosition();
    FVector local_18(local_6.GetRotation().GetForwardVector());
    FECSEntity local_28 = FECSEntity(ENTITY_NULL);
    bool local_33 = (int(TurretConfig.RankingMode) == 0);
    if (local_33)
    {
        local_35 = 3.4028235e38f;
    }
    else
    {
        local_35 = 0.0f;
    }
    for (auto& local_50 : TurretConfig.TargetingConditionsForMonster)
    {
        FECSQueryParam local_56;
        local_56.bExcludeDeath = true;
        local_56.bFilterByFaction = local_50.bFilterByFaction;
        local_56.FactionRelation = int(local_50.FactionRelation);
        if (int(local_50.ConditionType) == 0 && local_50.SpecificMonsterConfig.IsSet())
        {
            TSubclassOf<AECSPrefab> local_60;
            local_56.SpecificPrefabClass = local_60;
        }
        else
        {
            local_56.TargetType = 8;
        }
        float32 local_36 = local_50._base_FAutoTrackTurretTargetingConditionBase;
        if (local_36 > 0.0f)
        {
            local_62 = local_50._base_FAutoTrackTurretTargetingConditionBase;
        }
        else
        {
            local_62 = 15000.0f;
        }
        bool local_29 = (local_50.MaxAngle > 0.0f) && (local_50.MaxAngle < 180.0f);
        TArray<FECSEntity> local_68;
        if (local_29)
        {
            local_36 = local_50.MaxAngle;
            local_68 = ECSQueryUtils::QueryInSphereCone(Entity, local_12, local_18, local_62, local_36, local_56, EECSQueryRegsitryType(3), false);
        }
        else
        {
            local_68 = ECSQueryUtils::QueryInSphere(Entity, local_12, local_62, local_56, EECSQueryRegsitryType(3), false);
        }
        AutoTrackTurretDebug::Log(FString().Append("[AutoTrackTurret] FilterMonster Entity[").Append(Entity.GetIdValue()).Append("] Candidates=").Append(local_68.Num()).Append(" Radius=").Append(local_62).Append(" UseCone=").Append(local_29));
        for (auto& local_94 : local_68)
        {
            if (!(AutoTrackTurret::ValidateTarget(Entity, TurretConfig, local_50, local_94)))
            {
                continue;
            }
            if (!(local_96))
            {
                continue;
            }
            local_36 = float32(((FVector(local_96.GetPosition()) - local_12).SizeSquared()));
            if ((local_33 && (local_36 < local_35)) || (!(local_33) && (local_36 > local_35)))
            {
                local_35 = local_36;
                local_28 = local_94;
            }
        }
    }
    if (local_28.IsValid())
    {
        int local_108 = local_28.GetIdValue();
        int local_79 = Entity.GetIdValue();
        AutoTrackTurretDebug::Log(FString().Append("[AutoTrackTurret] FilterMonster Result: Entity[").Append(local_79).Append("] -> Target[").Append(local_108).Append("] Dist=").Append(FString::ApplyFormat(FMath::Sqrt(local_35), ".1f")));
    }
    else
    {
        int local_79_2 = Entity.GetIdValue();
        AutoTrackTurretDebug::Log(FString().Append("[AutoTrackTurret] FilterMonster Result: Entity[").Append(local_79_2).Append("] -> жњЄж‰ѕе€°еђ€жі•з›®ж ‡"));
    }
    return local_28;
}
bool PassesBlackboardConditions(const TArray<FESMBlackboardCondition> &inout Conditions, const FECSEntity &inout Entity)
{
    for (auto& local_16 : Conditions)
    {
        if (!(FEventToESMTriggerFilterUtils::EvaluateBlackboardCondition(local_16, Entity)))
        {
            return false;
        }
    }
    return true;
}
bool ValidateTarget(const FECSEntity &inout TurretEntity, const FC_AutoTrackTurretConfig &inout Config, const FAutoTrackTurretTargetingCondition_Monster &inout Condition, const FECSEntity &inout Candidate)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
void ComputeDesiredAngles(const FECSEntity &inout TurretEntity, const FECSEntity &inout TargetEntity, const FC_AutoTrackTurretConfig &inout Config, float32 &inout OutYaw, float32 &inout OutPitch)
{
    int local_6 = 0;
    int local_8 = 0;
    float32 local_64;
    float32 local_65;
    FRotator local_62 = (local_6.GetRotation().Inverse().RotateVector((FVector(local_8.GetPosition()) - local_6.GetPosition()).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector))).Rotation().GetNormalized();
    if (Config.bTrackYaw)
    {
        local_65 = float32(local_62.Yaw);
    }
    else
    {
        local_65 = 0.0f;
    }
    OutYaw = local_65;
    if ((Config.bTrackYaw && Config.bTrackPitch))
    {
        local_64 = float32(local_62.Pitch);
    }
    else
    {
        local_64 = 0.0f;
    }
    OutPitch = local_64;
    if ((Config.bTrackYaw && Config.bLimitYaw))
    {
        OutYaw = FMath::Clamp(OutYaw, Config.MinYaw, Config.MaxYaw);
    }
    if ((Config.bTrackYaw && Config.bTrackPitch) && Config.bLimitPitch)
    {
        float32 local_67_2 = Config.MinPitch;
        local_64 = OutPitch;
        OutPitch = FMath::Clamp(local_64, local_67_2, Config.MaxPitch);
    }
    return;
}
float32 InterpAngle(const float32 Current, const float32 Desired, const float32 MaxSpeed, const float32 DeltaTime)
{
    float local_6 = FRotator::NormalizeAxis((Desired - Current));
    float32 local_1 = MaxSpeed * DeltaTime;
    float32 local_7 = -local_1;
    return float32((FRotator::NormalizeAxis((Current + FMath::Clamp(float32(local_6), local_7, local_1)))));
}
FQuat ResolveParentWorldRotation(const FName &inout ParentFName, const FQuat &inout EntityRot, const FC_AutoTrackTurretClientCache &inout Cache, const TArray<FQuat> &inout YawWorldRotations)
{
    int local_1 = 0;
    while (local_1 < 0)
    {
        if ((FName(Cache.CachedYawCompFNames[local_1]) == ParentFName) && (local_1 < YawWorldRotations.Num()))
        {
            return YawWorldRotations[local_1];
        }
        ++local_1;
    }
    int local_1_2 = 0;
    while (local_1_2 < 0)
    {
        if ((FName(Cache.CachedStaticCompFNames[local_1_2]) == ParentFName) && (local_1_2 < Cache.StaticComponentInitialWorldRotations.Num()))
        {
            return Cache.StaticComponentInitialWorldRotations[local_1_2];
        }
        ++local_1_2;
    }
    return EntityRot;
}
void UpdateMeshRotation(const FECSEntity &inout Entity, const FC_AutoTrackTurretConfig &inout Config, FC_AutoTrackTurretClientCache &inout ClientCache)
{
    int local_6 = 0;
    int local_21 = 0;
    if (!(local_6))
    {
        return;
    }
    FQuat local_16 = local_6.GetRotation();
    bool local_7 = !((Config.StaticComponentLogicName == NAME_None));
    if (local_7)
    {
        int local_19 = 0;
        while (local_7)
        {
            FQuat local_56 = (local_16.Inverse() * FQuat(ClientCache.StaticComponentInitialWorldRotations[local_19]));
            FTransform& local_66 = Entity.ModifyActorComponent(ClientCache.CachedStaticCompFNames[local_19]).ModifyTransform();
            local_66.SetRotation(local_56);
            if (local_19 < ClientCache.StaticComponentInitialRelativeLocations.Num())
            {
                local_66.SetLocation(ClientCache.StaticComponentInitialRelativeLocations[local_19]);
            }
            if (local_19 < ClientCache.StaticComponentInitialRelativeScales.Num())
            {
                local_66.SetScale3D(ClientCache.StaticComponentInitialRelativeScales[local_19]);
            }
            ++local_19;
            if (local_19 >= ClientCache.CachedStaticCompFNames.Num())
            {
                local_7 = false;
                continue;
            }
            local_21 = ClientCache.StaticComponentInitialWorldRotations.Num();
            local_7 = (local_19 < local_21);
        }
    }
    if (Config.bTrackYaw && !((Config.YawAxisMeshLogicName == NAME_None)))
    {
        TArray<FQuat> local_70;
        FQuat local_56_2 = local_16;
        int local_19_2 = 0;
        while (local_19_2 < local_21)
        {
            FQuat local_32 = local_16;
            if (local_19_2 < ClientCache.CachedYawParentFNames.Num() && !((FName(ClientCache.CachedYawParentFNames[local_19_2]) == NAME_None)))
            {
                TArray<FQuat> local_74;
                local_32 = AutoTrackTurret::ResolveParentWorldRotation(ClientCache.CachedYawParentFNames[local_19_2], local_16, ClientCache, local_74);
            }
            FQuat local_48 = FRotator(0.0, (local_32.Inverse() * local_56_2).Rotator().Yaw, 0.0).Quaternion();
            FTransform& local_66_2 = Entity.ModifyActorComponent(ClientCache.CachedYawCompFNames[local_19_2]).ModifyTransform();
            local_66_2.SetRotation(local_48);
            local_70.Add((local_32 * local_48));
            if (local_19_2 < ClientCache.YawComponentInitialRelativeLocations.Num())
            {
                local_66_2.SetLocation(local_16.Inverse().RotateVector(ClientCache.CachedInitialEntityRotation.RotateVector(FVector(ClientCache.YawComponentInitialRelativeLocations[local_19_2]))));
            }
            local_21 = ClientCache.YawComponentInitialRelativeScales.Num();
            if (local_19_2 < local_21)
            {
                local_66_2.SetScale3D(ClientCache.YawComponentInitialRelativeScales[local_19_2]);
            }
            ++local_19_2;
        }
        if (Config.bTrackPitch && !((Config.PitchAxisMeshLogicName == NAME_None)))
        {
            local_19_2 = 0;
            while (local_19_2 < local_21)
            {
                FQuat local_32_2 = local_16;
                if (local_19_2 < ClientCache.CachedPitchParentFNames.Num() && !((FName(ClientCache.CachedPitchParentFNames[local_19_2]) == NAME_None)))
                {
                    local_32_2 = AutoTrackTurret::ResolveParentWorldRotation(ClientCache.CachedPitchParentFNames[local_19_2], local_16, ClientCache, local_70);
                }
                FQuat local_84 = FRotator((local_32_2.Inverse() * local_56_2).Rotator().Pitch, 0.0, 0.0).Quaternion();
                FTransform& local_66_3 = Entity.ModifyActorComponent(ClientCache.CachedPitchCompFNames[local_19_2]).ModifyTransform();
                local_66_3.SetRotation(local_84);
                if (local_19_2 < ClientCache.PitchComponentInitialRelativeLocations.Num())
                {
                    local_66_3.SetLocation(ClientCache.PitchComponentInitialRelativeLocations[local_19_2]);
                }
                if (local_19_2 < ClientCache.PitchComponentInitialRelativeScales.Num())
                {
                    local_66_3.SetScale3D(ClientCache.PitchComponentInitialRelativeScales[local_19_2]);
                }
                ++local_19_2;
            }
        }
    }
    return;
}
void TryActivateFoundTargetTrigger(const FECSEntity &inout Entity)
{
    FC_AutoTrackTurretConfig local_6;
    if (!(local_6))
    {
        return;
    }
    if ((FName(local_6.ActivateESMTriggerName_FoundTarget.Name) == NAME_None))
    {
        return;
    }
    FESMUtils::ActivateESMTrigger(Entity, local_6.ActivateESMTriggerName_FoundTarget, local_6.ActivateESMTriggerTime_FoundTarget);
    AutoTrackTurretDebug::Log(FString().Append("[AutoTrackTurret] ActivateTrigger FoundTarget Entity[").Append(Entity.GetIdValue()).Append("] Trigger[").Append(local_6.ActivateESMTriggerName_FoundTarget.Name).Append("]"));
    return;
}
void TryActivateLostTargetTrigger(const FECSEntity &inout Entity)
{
    FC_AutoTrackTurretConfig local_6;
    if (!(local_6))
    {
        return;
    }
    if ((FName(local_6.ActivateESMTriggerName_LostTarget.Name) == NAME_None))
    {
        return;
    }
    FESMUtils::ActivateESMTrigger(Entity, local_6.ActivateESMTriggerName_LostTarget, local_6.ActivateESMTriggerTime_LostTarget);
    AutoTrackTurretDebug::Log(FString().Append("[AutoTrackTurret] ActivateTrigger LostTarget Entity[").Append(Entity.GetIdValue()).Append("] Trigger[").Append(local_6.ActivateESMTriggerName_LostTarget.Name).Append("]"));
    return;
}
}

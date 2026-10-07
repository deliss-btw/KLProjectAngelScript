
enum ECharacterDirectionType
{
    Default,
    DesiredMoveDir,
    DesiredViewDir,
    BeHitDir,
    WorldSpaceLocation,
    WorldSpaceRotation,
    LockTargetDir,
    InteractTargetDir,
    CustomEntityLocation,
    CustomEntityRelative,
}

namespace FCharacterDirectionUtils
{
FRotator GetTargetRotation(const FECSEntity &inout Entity, const ECharacterDirectionType DirType, const bool bAllowPitch = false, const FFPTime &inout ExactTime = FFPTime(-1))
{
    int local_1;
    return FCharacterDirectionUtils::GetTargetRotation(Entity, ECharacterDirectionType(DirType), bAllowPitch, ExactTime, local_1);
}
FRotator GetTargetRotation(const FECSEntity &inout Entity, const ECharacterDirectionType DirType, const bool bAllowPitch, const FFPTime &inout ExactTime, bool &out bHasFallback)
{
    int local_8 = 0;
    FCS_FixedTime local_16;
    int local_52 = 0;
    int local_74 = 0;
    bHasFallback = false;
    FECSWorldPtr local_10 = Entity.GetWorld();
    FFPTime local_24;
    if (ExactTime.opCmp(0.0) >= 0)
    {
        local_24 = ExactTime;
    }
    else
    {
        local_24 = local_16.LastTime;
    }
    bool local_25 = false;
    bHasFallback = false;
    FRotator local_38 = local_8.GetRotation().Rotator();
    int local_39 = DirType;
    if (local_39 == 6)
    {
        FNameHandle_EntityBBVarBool local_44;
        local_44;
        if (Entity.GetBB_Bool(local_44))
        {
            int local_45;
            local_45 = 2;
            local_39 = local_45;
        }
        else
        {
            int local_45;
            if (!((FECSEntity(local_52.GetTargetEntity()) == ENTITY_NULL)))
            {
                FVector local_62;
                if (FLockTargetUtils::GetLogicLockTargetPosition(Entity, local_62))
                {
                    local_38 = (local_62 - local_8.GetPosition()).Rotation();
                    local_25 = true;
                }
                else
                {
                    FFPTime local_18 = local_74.GetOffsetTime((int(local_16.Frame) - 1));
                    Get local_80;
                    const FC_TransformHistory& local_82 = local_80.opCall();
                    if (local_82)
                    {
                        FC_Transform local_104;
                        local_82.GetInterpoValue((FFPTime(local_16.Time) - local_18), local_104);
                        local_38 = (FVector(local_104.GetPosition()) - local_8.GetPosition()).Rotation();
                        local_25 = true;
                    }
                }
            }
            if (!(local_25) == !(false))
            {
                bHasFallback = true;
                local_45 = 1;
                local_39 = local_45;
            }
        }
    }
    else
    {
        int local_45;
        if (local_39 == 7)
        {
            GetDefaulted local_118;
            const FC_InteractionInfoForESM& local_120 = local_118.opCall();
            if (local_120)
            {
                if (!((FVector(local_120.GetInteractTargetLocation()) == FVector::ZeroVector)))
                {
                    FVector local_68_2 = (FVector(local_120.GetInteractTargetLocation()) - local_8.GetPosition());
                    local_38 = local_68_2.Rotation();
                }
            }
            else
            {
                bHasFallback = true;
                local_45 = 1;
                local_39 = local_45;
            }
            local_25 = true;
        }
    }
    if (local_39 == 1)
    {
        FVector local_112_2 = FCharacterInputUtils::GetWorldMoveInput(Entity, local_24, local_16.DeltaTime, bAllowPitch);
        if (!(local_112_2.IsNearlyZero(9.999999747378752e-5)))
        {
            local_38 = FRotator::MakeFromXZ(local_112_2, FVector::UpVector);
        }
        else
        {
            local_38 = local_8.GetRotation().Rotator();
        }
    }
    else
    {
        if (local_39 == 2)
        {
            local_38 = FCharacterInputUtils::GetViewInputDir(Entity, local_24);
        }
        else
        {
            if (local_39 == 3)
            {
                GetDefaulted local_124;
                local_38 = FVector(local_124.opCall().GetBeHitPushVector()).Rotation();
            }
            else
            {
                int local_40_2 = local_39;
                if (local_40_2 == 0)
                {
                    local_38 = local_8.GetRotation().Rotator();
                }
                else
                {
                    bool local_22_4 = !(false);
                    if (!(local_25) == local_22_4)
                    {
                        ELog local_132;
                        (FString("Encounter undefined dir type ") + local_132);
                        return FRotator::ZeroRotator;
                    }
                }
            }
        }
    }
    if (bAllowPitch == false)
    {
        local_38.Pitch = 0.0;
    }
    local_38.Roll = 0.0;
    return local_38;
}
FQuat GetTargetRotationQuat(const FECSEntity &inout Entity, const ECharacterDirectionType TargetDirType, const bool bAllowPitch = false)
{
    return FCharacterDirectionUtils::GetTargetRotation(Entity, ECharacterDirectionType(TargetDirType), bAllowPitch, FFPTime(-1)).Quaternion();
}
}

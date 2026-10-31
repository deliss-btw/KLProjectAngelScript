namespace FAIGroupFollowCaptainLayout
{
    const int NumAngles = 5;
    const float32 StartAngleDeg = 120f;
    const float32 AngleStepDeg = 30f;
    const float32 InitialDistance = 200f;
    const float32 DistanceStep = 100f;

}
namespace FAIGroupFollowCaptainUtils
{
void EnsureSlotStatesSize(FC_AIGroupFollowCaptain &inout FollowCaptain, const int RequiredSize)
{
    while (FollowCaptain.SlotStates.Num() < RequiredSize)
    {
        FollowCaptain.SlotStates.Add(0);
    }
    return;
}
int CountOccupied(const FC_AIGroupFollowCaptain &inout FollowCaptain)
{
    int local_1 = 0;
    for (auto local_16 : FollowCaptain.SlotStates)
    {
        if (local_16 == 1)
        {
            ++local_1;
        }
    }
    return local_1;
}
FVector GetSlotLocalOffset(const int SlotIndex)
{
    int local_1 = SlotIndex % 5;
    float32 local_7_2 = ((FMath::IntegerDivisionTrunc(SlotIndex, 5)) * 100.0f) + 200.0f;
    float32 local_8 = FMath::DegreesToRadians((local_1 * 30.0f) + 120.0f);
    return FVector((FMath::Cos(local_8) * local_7_2), (FMath::Sin(local_8) * local_7_2), 0.0);
}
bool IsFollowSlotAcceptableByLineTrace(const FECSEntity &inout MemberEntity, const FECSEntity &inout CaptainEntity, const FVector &inout SlotWorldPos, const FVector &inout CaptainWorldPos)
{
    if (!(MemberEntity.IsValid()) || !(CaptainEntity.IsValid()))
    {
        return false;
    }
    int local_3 = 1117782016;
    FVector local_28 = (SlotWorldPos + FVector(0.0, 0.0, 80.0));
    FVector local_10 = (CaptainWorldPos + FVector(0.0, 0.0, 80.0));
    FCollisionQueryParams local_72;
    local_72.bTraceComplex = false;
    local_72.AddIgnoredEntityId(MemberEntity.GetIdValue());
    ECollisionChannel local_76 = FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5));
    FHitResult local_142;
    FCollisionResponseParams local_151;
    bool local_1 = FPhysicsUtils::LineTraceSingle(MemberEntity, false, EPhysicsTraceTag(26), local_142, local_28, local_10, local_76, local_72, local_151);
    if (!(local_1))
    {
        return true;
    }
    return (int(local_142.ECSEntityId) == CaptainEntity.GetIdValue());
}
FVector ClaimFollowSlot(FC_AIGroupFollowCaptain &inout FollowCaptain, bool &out bFound, int &out OutSlotIndex, const FECSEntity &inout MemberEntity, const FECSEntity &inout CaptainEntity, const FVector &inout CaptainWorldPos, const FQuat &inout CaptainWorldRot)
{
    int local_17;
    bFound = false;
    OutSlotIndex = 0;
    bFound = false;
    OutSlotIndex = -1;
    int local_4 = FAIGroupFollowCaptainUtils::CountOccupied(FollowCaptain);
    int local_8_2 = ((FMath::IntegerDivisionTrunc(local_4, 5)) + 2) * 5;
    FAIGroupFollowCaptainUtils::EnsureSlotStatesSize(FollowCaptain, local_8_2);
    TArray<int> local_14;
    int local_15 = 0;
    for (; local_15 < local_8_2; ++local_15)
    {
        int local_5_2 = FollowCaptain.SlotStates[local_15];
        if (local_5_2 == 0)
        {
            local_14.Add(local_15);
        }
    }
    int local_6 = local_14.Num() - 1;
    for (; local_6 > 0; )
    {
        int local_15_2 = FMath::RandRange(0, local_6);
        local_17 = local_14[local_6];
        local_14[local_6] = local_14[local_15_2];
        local_14[local_15_2] = local_17;
        --local_6;
    }
    auto local_24 = local_14.Iterator();
    for (; local_24.CanProceed;)
    {
        local_17 = local_24.Proceed();
        FVector local_42 = FAIGroupFollowCaptainUtils::GetSlotLocalOffset(local_17);
        FVector local_54 = (CaptainWorldPos + CaptainWorldRot.RotateVector(local_42));
        if (FAIGroupFollowCaptainUtils::IsFollowSlotAcceptableByLineTrace(MemberEntity, CaptainEntity, local_54, CaptainWorldPos))
        {
            FollowCaptain.SlotStates[local_17] = 1;
            OutSlotIndex = local_17;
            bFound = true;
            return local_42;
        }
        FollowCaptain.SlotStates[local_17] = -1;
    }
    return FVector::ZeroVector;
}
void ReleaseFollowSlot(FC_AIGroupFollowCaptain &inout FollowCaptain, const int SlotIndex)
{
    if (SlotIndex >= 0 && (SlotIndex < FollowCaptain.SlotStates.Num()))
    {
        FollowCaptain.SlotStates[SlotIndex] = 0;
    }
    return;
}
bool IsSlotStillValid(FC_AIGroupFollowCaptain &inout FollowCaptain, const int SlotIndex, const FECSEntity &inout MemberEntity, const FECSEntity &inout CaptainEntity, const FVector &inout PredictedCaptainPos, const FQuat &inout CaptainRot)
{
    FVector local_24 = (PredictedCaptainPos + CaptainRot.RotateVector(FAIGroupFollowCaptainUtils::GetSlotLocalOffset(SlotIndex)));
    return FAIGroupFollowCaptainUtils::IsFollowSlotAcceptableByLineTrace(MemberEntity, CaptainEntity, local_24, PredictedCaptainPos);
}
void ResetInvalidSlots(FC_AIGroupFollowCaptain &inout FollowCaptain)
{
    int local_1 = 0;
    for (; local_1 < FollowCaptain.SlotStates.Num(); ++local_1)
    {
        if (FollowCaptain.SlotStates[local_1] == -1)
        {
            FollowCaptain.SlotStates[local_1] = 0;
        }
    }
    return;
}
void UpdateMemberTargetPos(const float IntervalTime, FC_AIGroupData &inout InGroupData, FC_AIGroupFollowCaptain &inout FollowCaptain)
{
    int local_12 = 0;
    int local_48;
    bool local_65;
    FECSEntity local_4 = InGroupData.CaptainEntity;
    if (!(local_4.IsValid()))
    {
        return;
    }
    FVector local_18 = local_12.GetPosition();
    FQuat local_28 = local_12.GetRotation();
    FAIGroupFollowCaptainUtils::ResetInvalidSlots(FollowCaptain);
    for (auto& local_42 : InGroupData.MemberEntityInfos)
    {
        FECSEntity local_46 = FECSEntity(local_42.MemberEntity);
        if (!(local_46.IsValid()) || (local_46 == local_4))
        {
            continue;
        }
        bool local_47 = FollowCaptain.MemberSlotMap.Find(local_46, local_48);
        if (FASCommonUtils::IsInCombat(local_46))
        {
            if (local_47)
            {
                FAIGroupFollowCaptainUtils::ReleaseFollowSlot(FollowCaptain, local_48);
                FollowCaptain.MemberSlotMap.Remove(local_46);
            }
            continue;
        }
        if (local_47)
        {
            if (FAIGroupFollowCaptainUtils::IsSlotStillValid(FollowCaptain, local_48, local_46, local_4, local_18, local_28))
            {
                InGroupData.SetMemberCommand(local_46, EGroupCommandType(1), ENTITY_NULL, FAIGroupFollowCaptainUtils::GetSlotLocalOffset(local_48));
                continue;
            }
            FAIGroupFollowCaptainUtils::ReleaseFollowSlot(FollowCaptain, local_48);
            FollowCaptain.SlotStates[local_48] = -1;
            FollowCaptain.MemberSlotMap.Remove(local_46);
        }
        local_65 = false;
        int local_66 = -1;
        FVector local_56 = FAIGroupFollowCaptainUtils::ClaimFollowSlot(FollowCaptain, local_65, local_66, local_46, local_4, local_18, local_28);
        if (local_65)
        {
            FollowCaptain.MemberSlotMap.Add(local_46, local_66);
            InGroupData.SetMemberCommand(local_46, EGroupCommandType(1), ENTITY_NULL, local_56);
        }
    }
    return;
}
void Tick(const float DeltaTime, FC_AIGroupData &inout InGroupData, FC_AIGroupFollowCaptain &inout FollowCaptain)
{
    if (FollowCaptain.TickInterval <= 0.0f)
    {
        return;
    }
    FollowCaptain.AccumulatedTime += float32(DeltaTime);
    if (FollowCaptain.AccumulatedTime >= FollowCaptain.TickInterval)
    {
        FAIGroupFollowCaptainUtils::UpdateMemberTargetPos(FollowCaptain.AccumulatedTime, InGroupData, FollowCaptain);
        FollowCaptain.AccumulatedTime = 0.0f;
    }
    return;
}
}
namespace FAIGroupBehaviorDispatcher
{
FECSEntity GetModifierHostEntity(const FECSEntity &inout GroupEntity, FC_AIGroupData &inout GroupData)
{
    if (GroupData.TeamEntity.IsValid())
    {
        return GroupData.TeamEntity;
    }
    return GroupEntity;
}
void TickAll(const float DeltaTime, const FECSEntity &inout GroupEntity, FC_AIGroupData &inout GroupData)
{
    if (!(FAIGroupBehaviorDispatcher::GetModifierHostEntity(GroupEntity, GroupData).IsValid()))
    {
        return;
    }
    Has local_14;
    bool local_9 = local_14.opCall();
    if (local_9)
    {
        Modify local_18;
        FC_AIGroupFollowCaptain& local_20 = local_18.opCall();
        if (local_20)
        {
            FAIGroupFollowCaptainUtils::Tick(DeltaTime, GroupData, local_20);
        }
    }
    return;
}
}

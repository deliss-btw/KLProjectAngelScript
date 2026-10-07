
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
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
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
    // body not fully recovered вЂ” stub [argmismatch:argtype]
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

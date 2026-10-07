
namespace AutoTest::API::SkillAPI
{
int GetSkillIndexBySlot(const uint EntityId, const int SkillSlot)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    int __r; return __r;
}
int GetAvatarSkillIndexBySlot(const int SkillSlot)
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_8.IsValid()), "AvatarEntity is invalid.");
    return AutoTest::API::SkillAPI::GetSkillIndexBySlot(local_8.GetIdValue());
}
float32 GetSkillCDRemainTime(const uint EntityId, const int SkillIndex)
{
    int local_20 = 0;
    ThrowIf(!(FECSEntity(EntityId).IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is invalid."));
    ThrowIf(!(local_20), FString().Append("EntityID: ").Append(EntityId).Append(", FC_Skill is null."));
    if (SkillIndex < 0 || (SkillIndex >= local_20.GetInstances().Num()))
    {
        return -1.0f;
    }
    FFPTime local_28 = FFPTime(ECS::GetECSWorld().GetLocalTime().LastTime);
    FFPTime local_34 = local_20.GetSkillInstance(SkillIndex).GetCDRemainTime(local_28);
    return float32(local_34.ToSeconds());
}
float32 GetAvatarSkillCDRemainTime(const int SkillIndex)
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_8.IsValid()), "AvatarEntity is invalid.");
    return AutoTest::API::SkillAPI::GetSkillCDRemainTime(local_8.GetIdValue());
}
float32 GetSkillCDDuration(const uint EntityId, const int SkillIndex)
{
    FECSEntity local_4 = FECSEntity(EntityId);
    ThrowIf(!(local_4.IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is invalid."));
    FFPTime local_18 = FSkillUtils::GetSkillCDDuration(local_4, SkillIndex);
    if (local_18.opCmp(0.0) < 0)
    {
        return -1.0f;
    }
    return float32(local_18.ToSeconds());
}
float32 GetAvatarSkillCDDuration(const int SkillIndex)
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_8.IsValid()), "AvatarEntity is invalid.");
    return AutoTest::API::SkillAPI::GetSkillCDDuration(local_8.GetIdValue());
}
void ResetSkillCD(const uint EntityId, const int SkillIndex)
{
    int local_20 = 0;
    int local_30 = 0;
    ThrowIf(!(FECSEntity(EntityId).IsValid()), FString().Append("EntityID: ").Append(EntityId).Append(" is invalid."));
    ThrowIf(!(local_20), FString().Append("EntityID: ").Append(EntityId).Append(", FC_Skill is null."));
    if (SkillIndex < 0 || (SkillIndex >= local_20.GetInstances().Num()))
    {
        XError(ELog(0), FString().Append("Invalid skill index: ").Append(SkillIndex).Append(" for EntityID: ").Append(EntityId));
        return;
    }
    FC_SkillInstance& local_32 = local_30.ModifySkillInstance(SkillIndex);
    FFPTime local_44 = (FFPTime(ECS::GetECSWorld().GetLocalTime().LastTime) - FFPTime(1.0));
    local_32.GetModify_CDCost().SetRecover(local_44, 1.0f, 0.0f, 0.0f, 1.0f);
    return;
}
void ResetAvatarSkillCD(const int SkillIndex)
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_8.IsValid()), "AvatarEntity is invalid.");
    AutoTest::API::SkillAPI::ResetSkillCD(local_8.GetIdValue());
    return;
}
void ResetAvatarSkillCDBySlot(const int SkillSlot)
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_8.IsValid()), "AvatarEntity is invalid.");
    int local_11 = AutoTest::API::SkillAPI::GetAvatarSkillIndexBySlot(SkillSlot);
    if (local_11 < 0)
    {
        XError(ELog(0), FString().Append("Skill slot ").Append(SkillSlot).Append(" not found for avatar."));
        return;
    }
    AutoTest::API::SkillAPI::ResetSkillCD(local_8.GetIdValue(), local_11);
    return;
}
}

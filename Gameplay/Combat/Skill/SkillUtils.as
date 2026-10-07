
namespace FSkillUtils
{
UFUNCTION()
void AddTemporarySkill(const FECSEntity &inout Entity, const TDataObjectPtr<FAddTemporarySkillConfig> &inout AddTemporarySkillConfig)
{
    int local_10 = 0;
    if (!(!(Entity.IsValid())) && AddTemporarySkillConfig)
    {
        const FAddTemporarySkillConfig& local_4;
        if (local_10.GetSkillEntity().IsValid())
        {
            FSkillUtils::RemoveSkill(local_10.GetSkillEntity(), Entity, true);
            local_10.SetSkillEntity(ENTITY_NULL);
            local_10.SetUsableTime(0);
        }
        FECSEntity local_24 = FSkillUtils::CreateSkillEntityAndAddSkill(Entity.GetWorld(), Entity, local_4.SkillConfig, ESkillSlot(9), true, false, 1);
        if (local_24.IsValid())
        {
            local_10.SetSkillEntity(local_24);
            local_10.SetUsableTime(int(local_4.MaxUsableTime));
            FDataObjectPtr local_72;
            local_72;
        }
    }
    return;
}
}

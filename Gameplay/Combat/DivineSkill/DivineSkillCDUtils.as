namespace DivineSkillCDUtils
{
void SetPawnDivineSkillFullCD(const FECSEntity &inout PawnEntity, const FFPTime &inout Time)
{
    if (!(PawnEntity.IsValid()))
    {
        return;
    }
    int local_4 = FSkillUtils::GetSkillIndex(PawnEntity, ESkillSlot(7));
    if (local_4 != INDEX_NONE)
    {
        FSkillUtils::SetSkillCD(PawnEntity, local_4, Time, 0.0f);
    }
    return;
}
void SetPlayerTeamDivineSkillFullCD(const FECSEntity &inout PlayerEntity, const FFPTime &inout Time)
{
    Get local_4;
    const FC_PlayerController& local_6 = local_4.opCall();
    if (local_6)
    {
        for (auto& local_22 : local_6.GetAllPlayerPawnEntities())
        {
            DivineSkillCDUtils::SetPawnDivineSkillFullCD(local_22, Time);
        }
    }
    return;
}
void RecoverPlayerTeamDivineSkillCDBySecond(const FECSEntity &inout PlayerEntity, const FFPTime &inout Time, const float32 RecoverSeconds)
{
    if (RecoverSeconds <= 0.0f)
    {
        return;
    }
    Get local_6;
    const FC_PlayerController& local_8 = local_6.opCall();
    if (local_8)
    {
        for (auto& local_22 : local_8.GetAllPlayerPawnEntities())
        {
            if (!(local_22.IsValid()))
            {
                continue;
            }
            int local_25 = FSkillUtils::GetSkillIndex(local_22, ESkillSlot(7));
            if (local_25 != INDEX_NONE)
            {
                FSkillUtils::RecoverSkillCDBySecond(local_22, local_25, Time, RecoverSeconds);
            }
        }
    }
    return;
}
}

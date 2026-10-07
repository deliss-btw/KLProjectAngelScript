
namespace DivineSkillCDUtils
{
void SetPawnDivineSkillFullCD(const FECSEntity &inout PawnEntity, const FFPTime &inout Time)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
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
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
}

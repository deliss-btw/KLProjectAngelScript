
enum EHealHPType
{
    SkillHeal,
    NonSkillHeal,
    RecoverHp,
}

namespace HealHpUtils
{
bool HealHP(const FECSEntity &inout HealFromEntity, const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 HP, const float32 HPRatio, const EHealHPType HealHPType, float32 &out RealHealHP)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
}

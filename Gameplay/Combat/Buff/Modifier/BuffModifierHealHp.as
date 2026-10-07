

// NOTE: class defaults are not authored in this module: FBuffModifierHealHp (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FBuffModifierHealHp : FBuffModifierOnceScriptable
{
    FBuffModifierOnceScriptable _base_FBuffModifierOnceScriptable;
    UPROPERTY()
    FBuffParamValue_Float HP;
    UPROPERTY()
    FBuffParamValue_Float HPRatio;
    UPROPERTY()
    EHealHPType HealHPType;

    FBuffModifierHealHp()
    {
        this.HealHPType = EHealHPType(0);
        this.__InitDefaults();
        return;
    }
    void ApplyAS_Implementation(const FModifierEvaluateContext &inout Context, const FFPTime &inout WorldTime) const
    {
        int local_9 = 0;
        ::HealHpUtils::HealHP(FECSEntity(Context.SourceEntity), FECSEntity(Context.TargetEntity), WorldTime, this.HP.GetInstanceValue(Context), this.HPRatio.GetInstanceValue(Context), this.HealHPType, local_9);
        return;
    }
}


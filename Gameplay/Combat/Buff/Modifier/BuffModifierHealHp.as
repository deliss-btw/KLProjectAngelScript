struct FBuffModifierHealHp : FBuffModifierOnceScriptable
{
    FBuffModifierOnceScriptable _base_FBuffModifierOnceScriptable;
    UPROPERTY()
    FBuffParamValue_Float HP;
    UPROPERTY()
    FBuffParamValue_Float HPRatio;
    UPROPERTY()
    EHealHPType HealHPType;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FBuffModifierHealHp.Get());

    FBuffModifierHealHp()
    {
        this.HealHPType = EHealHPType(0);
        this.__InitDefaults();
        return;
    }
    void ApplyAS_Implementation(const FModifierEvaluateContext &inout Context, const FFPTime &inout WorldTime) const
    {
        float32 local_9 = 0.0f;
        ::HealHpUtils::HealHP(FECSEntity(Context.SourceEntity), FECSEntity(Context.TargetEntity), WorldTime, this.HP.GetInstanceValue(Context), this.HPRatio.GetInstanceValue(Context), this.HealHPType, local_9);
        return;
    }
}


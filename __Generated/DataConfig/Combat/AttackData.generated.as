namespace __FComboHitDamageReductionFunctions
{
UFUNCTION()
float32 __FComboHitDamageReduction_GetReduceRatio(const TDataObjectPtr<FComboHitDamageReduction> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReduceRatio' from a null 'FComboHitDamageReduction' DataObject!");
        }
        FComboHitDamageReduction defaultValue;
        return defaultValue.ReduceRatio;
    }
    return DataObject.Get().ReduceRatio;
}
UFUNCTION()
float32 __FComboHitDamageReduction_GetMinDamageRatio(const TDataObjectPtr<FComboHitDamageReduction> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinDamageRatio' from a null 'FComboHitDamageReduction' DataObject!");
        }
        FComboHitDamageReduction defaultValue;
        return defaultValue.MinDamageRatio;
    }
    return DataObject.Get().MinDamageRatio;
}
UFUNCTION()
float32 __FComboHitDamageReduction_GetDuration(const TDataObjectPtr<FComboHitDamageReduction> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Duration' from a null 'FComboHitDamageReduction' DataObject!");
        }
        FComboHitDamageReduction defaultValue;
        return defaultValue.Duration;
    }
    return DataObject.Get().Duration;
}
UFUNCTION()
FComboHitDamageReduction CastToFComboHitDamageReduction(const TDataObjectPtr<FComboHitDamageReduction> &inout DataObject)
{
    FComboHitDamageReduction __r;
    return __r;
}
}
namespace __FAttackDataFunctions
{
UFUNCTION()
FName __FAttackData_GetAttackTag(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttackTag' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.AttackTag;
    }
    return DataObject.Get().AttackTag;
}
UFUNCTION()
FGameplayTag __FAttackData_GetSpecialHitType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpecialHitType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.SpecialHitType;
    }
    return DataObject.Get().SpecialHitType;
}
UFUNCTION()
EDamageCalculationType __FAttackData_GetDamageCalculationType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DamageCalculationType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.DamageCalculationType;
    }
    return DataObject.Get().DamageCalculationType;
}
UFUNCTION()
FAttackDataFloatVariant __FAttackData_GetDamageRatio(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DamageRatio' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.DamageRatio;
    }
    return DataObject.Get().DamageRatio;
}
UFUNCTION()
FAttackDataFloatVariant __FAttackData_GetDamageConstVal(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DamageConstVal' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.DamageConstVal;
    }
    return DataObject.Get().DamageConstVal;
}
UFUNCTION()
FAttackDataFloatVariant __FAttackData_GetPercentDamage(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PercentDamage' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.PercentDamage;
    }
    return DataObject.Get().PercentDamage;
}
UFUNCTION()
FGameAttributeCompositeCoefficient __FAttackData_GetDamageAttributeCoefficient(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DamageAttributeCoefficient' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.DamageAttributeCoefficient;
    }
    return DataObject.Get().DamageAttributeCoefficient;
}
UFUNCTION()
FAttackDataFloatVariant __FAttackData_GetPostureDamageRatio(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PostureDamageRatio' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.PostureDamageRatio;
    }
    return DataObject.Get().PostureDamageRatio;
}
UFUNCTION()
FAttackDataFloatVariant __FAttackData_GetPostureDamageConstVal(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PostureDamageConstVal' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.PostureDamageConstVal;
    }
    return DataObject.Get().PostureDamageConstVal;
}
UFUNCTION()
EEcologyPostureDamageRatioType __FAttackData_GetEcologyPostureDamageRatioType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EcologyPostureDamageRatioType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.EcologyPostureDamageRatioType;
    }
    return DataObject.Get().EcologyPostureDamageRatioType;
}
UFUNCTION()
float32 __FAttackData_GetEcologyPostureDamageRatio(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EcologyPostureDamageRatio' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.EcologyPostureDamageRatio;
    }
    return DataObject.Get().EcologyPostureDamageRatio;
}
UFUNCTION()
float32 __FAttackData_GetEcologyPostureDamageConstVal(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EcologyPostureDamageConstVal' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.EcologyPostureDamageConstVal;
    }
    return DataObject.Get().EcologyPostureDamageConstVal;
}
UFUNCTION()
FGameplayTagContainer __FAttackData_GetAttackCalculationTags(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttackCalculationTags' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.AttackCalculationTags;
    }
    return DataObject.Get().AttackCalculationTags;
}
UFUNCTION()
TDataObjectPtr<FComboHitDamageReduction> __FAttackData_GetComboDamageReduction(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ComboDamageReduction' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.GetComboDamageReduction();
    }
    return DataObject.Get().GetComboDamageReduction();
}
UFUNCTION()
uint8 __FAttackData_GetAffectFactionRelation(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AffectFactionRelation' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return int(local_840.AffectFactionRelation);
    }
    return DataObject.Get().AffectFactionRelation;
}
UFUNCTION()
int __FAttackData_GetAttackCategory(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttackCategory' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.AttackCategory;
    }
    return DataObject.Get().AttackCategory;
}
UFUNCTION()
EAttackType __FAttackData_GetAttackType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttackType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.AttackType;
    }
    return DataObject.Get().AttackType;
}
UFUNCTION()
EHitBreakLevel __FAttackData_GetHitBreakLevel(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitBreakLevel' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitBreakLevel;
    }
    return DataObject.Get().HitBreakLevel;
}
UFUNCTION()
EAttackDataHitState __FAttackData_GetHitLevel(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitLevel' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitLevel;
    }
    return DataObject.Get().HitLevel;
}
UFUNCTION()
EHitStunDuration __FAttackData_GetHitStunDurationConfigType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitStunDurationConfigType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitStunDurationConfigType;
    }
    return DataObject.Get().HitStunDurationConfigType;
}
UFUNCTION()
float32 __FAttackData_GetCustomHitStunDuration(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomHitStunDuration' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.CustomHitStunDuration;
    }
    return DataObject.Get().CustomHitStunDuration;
}
UFUNCTION()
float32 __FAttackData_GetCustomHitStunDetach(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomHitStunDetach' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.CustomHitStunDetach;
    }
    return DataObject.Get().CustomHitStunDetach;
}
UFUNCTION()
EHitDirection __FAttackData_GetHitDirection(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitDirection' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitDirection;
    }
    return DataObject.Get().HitDirection;
}
UFUNCTION()
EDamageType __FAttackData_GetDamageType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DamageType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.DamageType;
    }
    return DataObject.Get().DamageType;
}
UFUNCTION()
EAbnormalState __FAttackData_GetAbnormalState(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AbnormalState' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.AbnormalState;
    }
    return DataObject.Get().AbnormalState;
}
UFUNCTION()
bool __FAttackData_GetbIsAbnormalEnhanced(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsAbnormalEnhanced' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bIsAbnormalEnhanced;
    }
    return DataObject.Get().bIsAbnormalEnhanced;
}
UFUNCTION()
FCapability_Float __FAttackData_GetAbnormalStateAccumulation(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AbnormalStateAccumulation' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.AbnormalStateAccumulation;
    }
    return DataObject.Get().AbnormalStateAccumulation;
}
UFUNCTION()
bool __FAttackData_GetbHitRecoverSkillEnergyEffectByExternalCoefficient(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHitRecoverSkillEnergyEffectByExternalCoefficient' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bHitRecoverSkillEnergyEffectByExternalCoefficient;
    }
    return DataObject.Get().bHitRecoverSkillEnergyEffectByExternalCoefficient;
}
UFUNCTION()
FCapability_Float __FAttackData_GetHitRecoverCustomSkillEnergy(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitRecoverCustomSkillEnergy' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitRecoverCustomSkillEnergy;
    }
    return DataObject.Get().HitRecoverCustomSkillEnergy;
}
UFUNCTION()
FCapability_Float __FAttackData_GetHitRecoverCustomSkillEnergy_2(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitRecoverCustomSkillEnergy_2' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitRecoverCustomSkillEnergy_2;
    }
    return DataObject.Get().HitRecoverCustomSkillEnergy_2;
}
UFUNCTION()
FCapability_Float __FAttackData_GetHitRecoverCustomSkillEnergy_3(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitRecoverCustomSkillEnergy_3' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitRecoverCustomSkillEnergy_3;
    }
    return DataObject.Get().HitRecoverCustomSkillEnergy_3;
}
UFUNCTION()
FCapability_Float __FAttackData_GetHitRecoverCustomSkillEnergy_4(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitRecoverCustomSkillEnergy_4' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitRecoverCustomSkillEnergy_4;
    }
    return DataObject.Get().HitRecoverCustomSkillEnergy_4;
}
UFUNCTION()
float32 __FAttackData_GetHitRecoverSwitchPlayerEnergy(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitRecoverSwitchPlayerEnergy' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.HitRecoverSwitchPlayerEnergy;
    }
    return DataObject.Get().HitRecoverSwitchPlayerEnergy;
}
UFUNCTION()
FCapability_Float __FAttackData_GetHitRecoverUltraSkillEnergy(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitRecoverUltraSkillEnergy' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitRecoverUltraSkillEnergy;
    }
    return DataObject.Get().HitRecoverUltraSkillEnergy;
}
UFUNCTION()
FBuffConfigRef __FAttackData_GetHitApplyBuffToTarget(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitApplyBuffToTarget' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitApplyBuffToTarget;
    }
    return DataObject.Get().HitApplyBuffToTarget;
}
UFUNCTION()
FBuffConfigRef __FAttackData_GetHitApplyBuffToSelf(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitApplyBuffToSelf' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitApplyBuffToSelf;
    }
    return DataObject.Get().HitApplyBuffToSelf;
}
UFUNCTION()
FNameHandle_EntityBBVarInt __FAttackData_GetHitAddEntityBB(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitAddEntityBB' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitAddEntityBB;
    }
    return DataObject.Get().HitAddEntityBB;
}
UFUNCTION()
int __FAttackData_GetHitAddEntityBBValue(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitAddEntityBBValue' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.HitAddEntityBBValue;
    }
    return DataObject.Get().HitAddEntityBBValue;
}
UFUNCTION()
FVector2D __FAttackData_GetHitAddEntityBBValueMinMax(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitAddEntityBBValueMinMax' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitAddEntityBBValueMinMax;
    }
    return DataObject.Get().HitAddEntityBBValueMinMax;
}
UFUNCTION()
EDamageTargetDeathType __FAttackData_GetTargetDeathType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetDeathType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.TargetDeathType;
    }
    return DataObject.Get().TargetDeathType;
}
UFUNCTION()
float32 __FAttackData_GetFreezeFrameTime(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FreezeFrameTime' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.FreezeFrameTime;
    }
    return DataObject.Get().FreezeFrameTime;
}
UFUNCTION()
FFPTime __FAttackData_GetFreezeUpdateTime(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FreezeUpdateTime' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.FreezeUpdateTime;
    }
    return DataObject.Get().FreezeUpdateTime;
}
UFUNCTION()
EFreezeFrameCurve __FAttackData_GetFreezeCurve(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FreezeCurve' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.FreezeCurve;
    }
    return DataObject.Get().FreezeCurve;
}
UFUNCTION()
bool __FAttackData_GetbUseFreezeAttenuationCurve(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bUseFreezeAttenuationCurve' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bUseFreezeAttenuationCurve;
    }
    return DataObject.Get().bUseFreezeAttenuationCurve;
}
UFUNCTION()
float32 __FAttackData_GetBeHitFreezeFrameTime(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BeHitFreezeFrameTime' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.BeHitFreezeFrameTime;
    }
    return DataObject.Get().BeHitFreezeFrameTime;
}
UFUNCTION()
FFPTime __FAttackData_GetBeHitFreezeUpdateTime(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BeHitFreezeUpdateTime' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.BeHitFreezeUpdateTime;
    }
    return DataObject.Get().BeHitFreezeUpdateTime;
}
UFUNCTION()
EFreezeFrameCurve __FAttackData_GetBeHitFreezeCurve(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BeHitFreezeCurve' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.BeHitFreezeCurve;
    }
    return DataObject.Get().BeHitFreezeCurve;
}
UFUNCTION()
bool __FAttackData_GetbUseDefaultFreezeAttenuationCurve(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bUseDefaultFreezeAttenuationCurve' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bUseDefaultFreezeAttenuationCurve;
    }
    return DataObject.Get().bUseDefaultFreezeAttenuationCurve;
}
UFUNCTION()
UCurveFloat __FAttackData_GetFreezeAttenuationCurve(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FreezeAttenuationCurve' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.FreezeAttenuationCurve;
    }
    UCurveFloat local_842;
    return local_842;
}
UFUNCTION()
bool __FAttackData_GetbEnableBeHitShakePause(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableBeHitShakePause' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bEnableBeHitShakePause;
    }
    return DataObject.Get().bEnableBeHitShakePause;
}
UFUNCTION()
float32 __FAttackData_GetBeHitShakePauseTime(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BeHitShakePauseTime' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.BeHitShakePauseTime;
    }
    return DataObject.Get().BeHitShakePauseTime;
}
UFUNCTION()
float32 __FAttackData_GetHitShakePauseStartPercent(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitShakePauseStartPercent' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.HitShakePauseStartPercent;
    }
    return DataObject.Get().HitShakePauseStartPercent;
}
UFUNCTION()
float32 __FAttackData_GetHitShakeTime(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitShakeTime' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.HitShakeTime;
    }
    return DataObject.Get().HitShakeTime;
}
UFUNCTION()
float32 __FAttackData_GetHitShakeRatio(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitShakeRatio' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.HitShakeRatio;
    }
    return DataObject.Get().HitShakeRatio;
}
UFUNCTION()
float32 __FAttackData_GetDynamicShakeStrengthScale(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DynamicShakeStrengthScale' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.DynamicShakeStrengthScale;
    }
    return DataObject.Get().DynamicShakeStrengthScale;
}
UFUNCTION()
float32 __FAttackData_GetDynamicShakeTimeScale(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DynamicShakeTimeScale' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.DynamicShakeTimeScale;
    }
    return DataObject.Get().DynamicShakeTimeScale;
}
UFUNCTION()
bool __FAttackData_GetbForceShowDamageNumber(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bForceShowDamageNumber' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bForceShowDamageNumber;
    }
    return DataObject.Get().bForceShowDamageNumber;
}
UFUNCTION()
TDataObjectPtr<FSpecialDamageTextConfig> __FAttackData_GetSpecialDamageTextConfig(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpecialDamageTextConfig' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.GetSpecialDamageTextConfig();
    }
    return DataObject.Get().GetSpecialDamageTextConfig();
}
UFUNCTION()
float32 __FAttackData_GetDamageNumberRandomRatio(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DamageNumberRandomRatio' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.DamageNumberRandomRatio;
    }
    return DataObject.Get().DamageNumberRandomRatio;
}
UFUNCTION()
FDataObjectPtr __FAttackData_GetHitCameraShakeSelf(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitCameraShakeSelf' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitCameraShakeSelf;
    }
    return DataObject.Get().HitCameraShakeSelf;
}
UFUNCTION()
FDataObjectPtr __FAttackData_GetHitCameraShakeTarget(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitCameraShakeTarget' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitCameraShakeTarget;
    }
    return DataObject.Get().HitCameraShakeTarget;
}
UFUNCTION()
float32 __FAttackData_GetHitWeaknessCameraShakeRatio(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitWeaknessCameraShakeRatio' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.HitWeaknessCameraShakeRatio;
    }
    return DataObject.Get().HitWeaknessCameraShakeRatio;
}
UFUNCTION()
FName __FAttackData_GetHitCameraShakeToSelf(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitCameraShakeToSelf' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitCameraShakeToSelf;
    }
    return DataObject.Get().HitCameraShakeToSelf;
}
UFUNCTION()
FName __FAttackData_GetHitCameraShakeToTarget(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitCameraShakeToTarget' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitCameraShakeToTarget;
    }
    return DataObject.Get().HitCameraShakeToTarget;
}
UFUNCTION()
bool __FAttackData_GetbEnableImpactVFX(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableImpactVFX' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bEnableImpactVFX;
    }
    return DataObject.Get().bEnableImpactVFX;
}
UFUNCTION()
bool __FAttackData_GetbEnableImpactSFX(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableImpactSFX' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bEnableImpactSFX;
    }
    return DataObject.Get().bEnableImpactSFX;
}
UFUNCTION()
TSoftObjectPtr<UAkAudioEvent> __FAttackData_GetImpactSFXEvent(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ImpactSFXEvent' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.ImpactSFXEvent;
    }
    return DataObject.Get().ImpactSFXEvent;
}
UFUNCTION()
EAttackFXConfigType __FAttackData_GetFXConfigType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FXConfigType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.FXConfigType;
    }
    return DataObject.Get().FXConfigType;
}
UFUNCTION()
FFXConfig __FAttackData_GetHitFXConfig(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitFXConfig' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitFXConfig;
    }
    return DataObject.Get().HitFXConfig;
}
UFUNCTION()
bool __FAttackData_GetbUseDefaultHitWeaknessFX(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bUseDefaultHitWeaknessFX' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bUseDefaultHitWeaknessFX;
    }
    return DataObject.Get().bUseDefaultHitWeaknessFX;
}
UFUNCTION()
FSoftClassPath __FAttackData_GetHitWeaknessFXAsset(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitWeaknessFXAsset' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitWeaknessFXAsset;
    }
    return DataObject.Get().HitWeaknessFXAsset;
}
UFUNCTION()
EImpactType __FAttackData_GetImpactType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ImpactType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.ImpactType;
    }
    return DataObject.Get().ImpactType;
}
UFUNCTION()
EImpactStrength __FAttackData_GetImpactStrengthValue(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ImpactStrengthValue' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.ImpactStrengthValue;
    }
    return DataObject.Get().ImpactStrengthValue;
}
UFUNCTION()
EEnvBreakDamage __FAttackData_GetEnvBreakDamage(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EnvBreakDamage' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.EnvBreakDamage;
    }
    return DataObject.Get().EnvBreakDamage;
}
UFUNCTION()
float32 __FAttackData_GetCustomEnvBreakDamage(const TDataObjectPtr<FAttackData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomEnvBreakDamage' from a null 'FAttackData' DataObject!");
        }
        FAttackData defaultValue;
        return defaultValue.CustomEnvBreakDamage;
    }
    return DataObject.Get().CustomEnvBreakDamage;
}
UFUNCTION()
bool __FAttackData_GetbOverridePrefabDestructDamageLevel(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bOverridePrefabDestructDamageLevel' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bOverridePrefabDestructDamageLevel;
    }
    return DataObject.Get().bOverridePrefabDestructDamageLevel;
}
UFUNCTION()
EDestructibleClassLevel __FAttackData_GetCustomDestructibleDamageLevel(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomDestructibleDamageLevel' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.CustomDestructibleDamageLevel;
    }
    return DataObject.Get().CustomDestructibleDamageLevel;
}
UFUNCTION()
FAttackData CastToFAttackData(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FAttackData __r;
    return __r;
}
}

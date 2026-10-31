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
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttackTag' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.AttackTag;
    }
    return __r;
}
UFUNCTION()
FGameplayTag __FAttackData_GetSpecialHitType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FGameplayTag __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpecialHitType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.SpecialHitType;
    }
    return __r;
}
UFUNCTION()
EDamageCalculationType __FAttackData_GetDamageCalculationType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DamageCalculationType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.DamageCalculationType);
        return EDamageCalculationType(local_841);
    }
    return EDamageCalculationType(local_841);
}
UFUNCTION()
FAttackDataFloatVariant __FAttackData_GetDamageRatio(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FAttackDataFloatVariant __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DamageRatio' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.DamageRatio;
    }
    return __r;
}
UFUNCTION()
FAttackDataFloatVariant __FAttackData_GetDamageConstVal(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FAttackDataFloatVariant __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DamageConstVal' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.DamageConstVal;
    }
    return __r;
}
UFUNCTION()
FAttackDataFloatVariant __FAttackData_GetPercentDamage(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FAttackDataFloatVariant __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PercentDamage' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.PercentDamage;
    }
    return __r;
}
UFUNCTION()
FGameAttributeCompositeCoefficient __FAttackData_GetDamageAttributeCoefficient(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FGameAttributeCompositeCoefficient __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DamageAttributeCoefficient' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.DamageAttributeCoefficient;
    }
    return __r;
}
UFUNCTION()
FAttackDataFloatVariant __FAttackData_GetPostureDamageRatio(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FAttackDataFloatVariant __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PostureDamageRatio' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.PostureDamageRatio;
    }
    return __r;
}
UFUNCTION()
FAttackDataFloatVariant __FAttackData_GetPostureDamageConstVal(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FAttackDataFloatVariant __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PostureDamageConstVal' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.PostureDamageConstVal;
    }
    return __r;
}
UFUNCTION()
EEcologyPostureDamageRatioType __FAttackData_GetEcologyPostureDamageRatioType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EcologyPostureDamageRatioType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.EcologyPostureDamageRatioType);
        return EEcologyPostureDamageRatioType(local_841);
    }
    return EEcologyPostureDamageRatioType(local_841);
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
    FGameplayTagContainer __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttackCalculationTags' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.AttackCalculationTags;
    }
    return __r;
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
    return GetComboDamageReduction();
}
UFUNCTION()
uint8 __FAttackData_GetAffectFactionRelation(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AffectFactionRelation' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return int(local_840.AffectFactionRelation);
    }
    return local_841;
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
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttackType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.AttackType);
        return EAttackType(local_841);
    }
    return EAttackType(local_841);
}
UFUNCTION()
EHitBreakLevel __FAttackData_GetHitBreakLevel(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitBreakLevel' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.HitBreakLevel);
        return EHitBreakLevel(local_841);
    }
    return EHitBreakLevel(local_841);
}
UFUNCTION()
EAttackDataHitState __FAttackData_GetHitLevel(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitLevel' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.HitLevel);
        return EAttackDataHitState(local_841);
    }
    return EAttackDataHitState(local_841);
}
UFUNCTION()
EHitStunDuration __FAttackData_GetHitStunDurationConfigType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitStunDurationConfigType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.HitStunDurationConfigType);
        return EHitStunDuration(local_841);
    }
    return EHitStunDuration(local_841);
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
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitDirection' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.HitDirection);
        return EHitDirection(local_841);
    }
    return EHitDirection(local_841);
}
UFUNCTION()
EDamageType __FAttackData_GetDamageType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DamageType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.DamageType);
        return EDamageType(local_841);
    }
    return EDamageType(local_841);
}
UFUNCTION()
EAbnormalState __FAttackData_GetAbnormalState(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AbnormalState' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.AbnormalState);
        return EAbnormalState(local_841);
    }
    return EAbnormalState(local_841);
}
UFUNCTION()
bool __FAttackData_GetbIsAbnormalEnhanced(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsAbnormalEnhanced' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bIsAbnormalEnhanced;
    }
    return local_1;
}
UFUNCTION()
FCapability_Float __FAttackData_GetAbnormalStateAccumulation(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FCapability_Float __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AbnormalStateAccumulation' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.AbnormalStateAccumulation;
    }
    return __r;
}
UFUNCTION()
bool __FAttackData_GetbHitRecoverSkillEnergyEffectByExternalCoefficient(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bHitRecoverSkillEnergyEffectByExternalCoefficient' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bHitRecoverSkillEnergyEffectByExternalCoefficient;
    }
    return local_1;
}
UFUNCTION()
FCapability_Float __FAttackData_GetHitRecoverCustomSkillEnergy(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FCapability_Float __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitRecoverCustomSkillEnergy' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitRecoverCustomSkillEnergy;
    }
    return __r;
}
UFUNCTION()
FCapability_Float __FAttackData_GetHitRecoverCustomSkillEnergy_2(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FCapability_Float __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitRecoverCustomSkillEnergy_2' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitRecoverCustomSkillEnergy_2;
    }
    return __r;
}
UFUNCTION()
FCapability_Float __FAttackData_GetHitRecoverCustomSkillEnergy_3(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FCapability_Float __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitRecoverCustomSkillEnergy_3' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitRecoverCustomSkillEnergy_3;
    }
    return __r;
}
UFUNCTION()
FCapability_Float __FAttackData_GetHitRecoverCustomSkillEnergy_4(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FCapability_Float __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitRecoverCustomSkillEnergy_4' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitRecoverCustomSkillEnergy_4;
    }
    return __r;
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
    FCapability_Float __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitRecoverUltraSkillEnergy' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitRecoverUltraSkillEnergy;
    }
    return __r;
}
UFUNCTION()
FBuffConfigRef __FAttackData_GetHitApplyBuffToTarget(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FBuffConfigRef __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitApplyBuffToTarget' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitApplyBuffToTarget;
    }
    return __r;
}
UFUNCTION()
FBuffConfigRef __FAttackData_GetHitApplyBuffToSelf(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FBuffConfigRef __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitApplyBuffToSelf' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitApplyBuffToSelf;
    }
    return __r;
}
UFUNCTION()
FNameHandle_EntityBBVarInt __FAttackData_GetHitAddEntityBB(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FNameHandle_EntityBBVarInt __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitAddEntityBB' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitAddEntityBB;
    }
    return __r;
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
    FVector2D __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitAddEntityBBValueMinMax' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitAddEntityBBValueMinMax;
    }
    return __r;
}
UFUNCTION()
EDamageTargetDeathType __FAttackData_GetTargetDeathType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetDeathType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.TargetDeathType);
        return EDamageTargetDeathType(local_841);
    }
    return EDamageTargetDeathType(local_841);
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
    FFPTime __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FreezeUpdateTime' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.FreezeUpdateTime;
    }
    return __r;
}
UFUNCTION()
EFreezeFrameCurve __FAttackData_GetFreezeCurve(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FreezeCurve' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.FreezeCurve);
        return EFreezeFrameCurve(local_841);
    }
    return EFreezeFrameCurve(local_841);
}
UFUNCTION()
bool __FAttackData_GetbUseFreezeAttenuationCurve(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bUseFreezeAttenuationCurve' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bUseFreezeAttenuationCurve;
    }
    return local_1;
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
    FFPTime __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BeHitFreezeUpdateTime' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.BeHitFreezeUpdateTime;
    }
    return __r;
}
UFUNCTION()
EFreezeFrameCurve __FAttackData_GetBeHitFreezeCurve(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BeHitFreezeCurve' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.BeHitFreezeCurve);
        return EFreezeFrameCurve(local_841);
    }
    return EFreezeFrameCurve(local_841);
}
UFUNCTION()
bool __FAttackData_GetbUseDefaultFreezeAttenuationCurve(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bUseDefaultFreezeAttenuationCurve' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bUseDefaultFreezeAttenuationCurve;
    }
    return local_1;
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
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableBeHitShakePause' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bEnableBeHitShakePause;
    }
    return local_1;
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
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bForceShowDamageNumber' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bForceShowDamageNumber;
    }
    return local_1;
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
    return GetSpecialDamageTextConfig();
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
    FDataObjectPtr __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitCameraShakeSelf' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitCameraShakeSelf;
    }
    return __r;
}
UFUNCTION()
FDataObjectPtr __FAttackData_GetHitCameraShakeTarget(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FDataObjectPtr __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitCameraShakeTarget' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitCameraShakeTarget;
    }
    return __r;
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
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitCameraShakeToSelf' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitCameraShakeToSelf;
    }
    return __r;
}
UFUNCTION()
FName __FAttackData_GetHitCameraShakeToTarget(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitCameraShakeToTarget' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitCameraShakeToTarget;
    }
    return __r;
}
UFUNCTION()
bool __FAttackData_GetbEnableImpactVFX(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableImpactVFX' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bEnableImpactVFX;
    }
    return local_1;
}
UFUNCTION()
bool __FAttackData_GetbEnableImpactSFX(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnableImpactSFX' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bEnableImpactSFX;
    }
    return local_1;
}
UFUNCTION()
TSoftObjectPtr<UAkAudioEvent> __FAttackData_GetImpactSFXEvent(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    TSoftObjectPtr<UAkAudioEvent> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ImpactSFXEvent' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.ImpactSFXEvent;
    }
    return __r;
}
UFUNCTION()
EAttackFXConfigType __FAttackData_GetFXConfigType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FXConfigType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.FXConfigType);
        return EAttackFXConfigType(local_841);
    }
    return EAttackFXConfigType(local_841);
}
UFUNCTION()
FFXConfig __FAttackData_GetHitFXConfig(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FFXConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitFXConfig' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitFXConfig;
    }
    return __r;
}
UFUNCTION()
bool __FAttackData_GetbUseDefaultHitWeaknessFX(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bUseDefaultHitWeaknessFX' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bUseDefaultHitWeaknessFX;
    }
    return local_1;
}
UFUNCTION()
FSoftClassPath __FAttackData_GetHitWeaknessFXAsset(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FSoftClassPath __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HitWeaknessFXAsset' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.HitWeaknessFXAsset;
    }
    return __r;
}
UFUNCTION()
EImpactType __FAttackData_GetImpactType(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ImpactType' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.ImpactType);
        return EImpactType(local_841);
    }
    return EImpactType(local_841);
}
UFUNCTION()
EImpactStrength __FAttackData_GetImpactStrengthValue(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ImpactStrengthValue' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.ImpactStrengthValue);
        return EImpactStrength(local_841);
    }
    return EImpactStrength(local_841);
}
UFUNCTION()
EEnvBreakDamage __FAttackData_GetEnvBreakDamage(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EnvBreakDamage' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.EnvBreakDamage);
        return EEnvBreakDamage(local_841);
    }
    return EEnvBreakDamage(local_841);
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
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bOverridePrefabDestructDamageLevel' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        return local_840.bOverridePrefabDestructDamageLevel;
    }
    return local_1;
}
UFUNCTION()
EDestructibleClassLevel __FAttackData_GetCustomDestructibleDamageLevel(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    int local_841 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomDestructibleDamageLevel' from a null 'FAttackData' DataObject!");
        }
        FAttackData local_840;
        local_841 = int(local_840.CustomDestructibleDamageLevel);
        return EDestructibleClassLevel(local_841);
    }
    return EDestructibleClassLevel(local_841);
}
UFUNCTION()
FAttackData CastToFAttackData(const TDataObjectPtr<FAttackData> &inout DataObject)
{
    FAttackData __r;
    return __r;
}
}

namespace __FGameRuleConfigFunctions
{
UFUNCTION()
FString __FGameRuleConfig_GetGameRuleName(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameRuleName' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.GameRuleName;
    }
    return __r;
}
UFUNCTION()
bool __FGameRuleConfig_GetCanChangeSquad(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CanChangeSquad' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.CanChangeSquad;
    }
    return local_1;
}
UFUNCTION()
bool __FGameRuleConfig_GetCanChangePlan(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CanChangePlan' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.CanChangePlan;
    }
    return local_1;
}
UFUNCTION()
bool __FGameRuleConfig_GetbCanSavePosition(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bCanSavePosition' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.bCanSavePosition;
    }
    return local_1;
}
UFUNCTION()
bool __FGameRuleConfig_GetbShouldWaitAllPlayerReady(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShouldWaitAllPlayerReady' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.bShouldWaitAllPlayerReady;
    }
    return local_1;
}
UFUNCTION()
ECombatTeamRule __FGameRuleConfig_GetCombatTeamRule(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    int local_35 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CombatTeamRule' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        local_35 = int(local_34.CombatTeamRule);
        return ECombatTeamRule(local_35);
    }
    return ECombatTeamRule(local_35);
}
UFUNCTION()
FName __FGameRuleConfig_GetDivineSkillDisplayTag(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DivineSkillDisplayTag' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.DivineSkillDisplayTag;
    }
    return __r;
}
UFUNCTION()
TArray<TDataObjectPtr<FSystemControlConfig>> __FGameRuleConfig_GetDisabledSystemControls(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DisabledSystemControls' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.GetDisabledSystemControls();
    }
    return GetDisabledSystemControls();
}
UFUNCTION()
FCombatRestrictionSettings __FGameRuleConfig_GetCombatRestriction(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    FCombatRestrictionSettings __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CombatRestriction' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.CombatRestriction;
    }
    return __r;
}
UFUNCTION()
FGameRuleConfig CastToFGameRuleConfig(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    FGameRuleConfig __r;
    return __r;
}
}

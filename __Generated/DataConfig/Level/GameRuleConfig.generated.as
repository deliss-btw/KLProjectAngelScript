namespace __FGameRuleConfigFunctions
{
UFUNCTION()
FString __FGameRuleConfig_GetGameRuleName(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GameRuleName' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.GameRuleName;
    }
    return DataObject.Get().GameRuleName;
}
UFUNCTION()
bool __FGameRuleConfig_GetCanChangeSquad(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CanChangeSquad' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.CanChangeSquad;
    }
    return DataObject.Get().CanChangeSquad;
}
UFUNCTION()
bool __FGameRuleConfig_GetCanChangePlan(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CanChangePlan' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.CanChangePlan;
    }
    return DataObject.Get().CanChangePlan;
}
UFUNCTION()
bool __FGameRuleConfig_GetbCanSavePosition(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bCanSavePosition' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.bCanSavePosition;
    }
    return DataObject.Get().bCanSavePosition;
}
UFUNCTION()
bool __FGameRuleConfig_GetbShouldWaitAllPlayerReady(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShouldWaitAllPlayerReady' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.bShouldWaitAllPlayerReady;
    }
    return DataObject.Get().bShouldWaitAllPlayerReady;
}
UFUNCTION()
ECombatTeamRule __FGameRuleConfig_GetCombatTeamRule(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CombatTeamRule' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.CombatTeamRule;
    }
    return DataObject.Get().CombatTeamRule;
}
UFUNCTION()
FName __FGameRuleConfig_GetDivineSkillDisplayTag(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DivineSkillDisplayTag' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.DivineSkillDisplayTag;
    }
    return DataObject.Get().DivineSkillDisplayTag;
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
    return DataObject.Get().GetDisabledSystemControls();
}
UFUNCTION()
FCombatRestrictionSettings __FGameRuleConfig_GetCombatRestriction(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CombatRestriction' from a null 'FGameRuleConfig' DataObject!");
        }
        FGameRuleConfig local_34;
        return local_34.CombatRestriction;
    }
    return DataObject.Get().CombatRestriction;
}
UFUNCTION()
FGameRuleConfig CastToFGameRuleConfig(const TDataObjectPtr<FGameRuleConfig> &inout DataObject)
{
    FGameRuleConfig __r;
    return __r;
}
}

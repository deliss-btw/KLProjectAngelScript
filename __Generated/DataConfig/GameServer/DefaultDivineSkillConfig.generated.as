namespace __FDefaultDivineSkillConfigFunctions
{
UFUNCTION()
EDivineSkillType __FDefaultDivineSkillConfig_GetDivineSkillType(const TDataObjectPtr<FDefaultDivineSkillConfig> &inout DataObject)
{
    int local_41 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DivineSkillType' from a null 'FDefaultDivineSkillConfig' DataObject!");
        }
        FDefaultDivineSkillConfig local_40;
        local_41 = int(local_40.DivineSkillType);
        return EDivineSkillType(local_41);
    }
    return EDivineSkillType(local_41);
}
UFUNCTION()
TDataObjectPtr<FDivineSkillConfig> __FDefaultDivineSkillConfig_GetDivineSkill(const TDataObjectPtr<FDefaultDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DivineSkill' from a null 'FDefaultDivineSkillConfig' DataObject!");
        }
        FDefaultDivineSkillConfig local_40;
        return local_40.GetDivineSkill();
    }
    return GetDivineSkill();
}
UFUNCTION()
FDefaultDivineSkillConfig CastToFDefaultDivineSkillConfig(const TDataObjectPtr<FDefaultDivineSkillConfig> &inout DataObject)
{
    FDefaultDivineSkillConfig __r;
    return __r;
}
}

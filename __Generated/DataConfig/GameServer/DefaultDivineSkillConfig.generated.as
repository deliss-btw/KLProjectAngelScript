namespace __FDefaultDivineSkillConfigFunctions
{
UFUNCTION()
EDivineSkillType __FDefaultDivineSkillConfig_GetDivineSkillType(const TDataObjectPtr<FDefaultDivineSkillConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DivineSkillType' from a null 'FDefaultDivineSkillConfig' DataObject!");
        }
        FDefaultDivineSkillConfig local_40;
        return local_40.DivineSkillType;
    }
    return DataObject.Get().DivineSkillType;
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
    return DataObject.Get().GetDivineSkill();
}
UFUNCTION()
FDefaultDivineSkillConfig CastToFDefaultDivineSkillConfig(const TDataObjectPtr<FDefaultDivineSkillConfig> &inout DataObject)
{
    FDefaultDivineSkillConfig __r;
    return __r;
}
}

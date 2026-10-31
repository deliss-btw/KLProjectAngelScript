namespace __FSignificanceConfigFunctions
{
UFUNCTION()
EECSSignificanceValue __FSignificanceConfig_GetDefault(const TDataObjectPtr<FSignificanceConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Default' from a null 'FSignificanceConfig' DataObject!");
        }
        FSignificanceConfig local_18;
        local_19 = int(local_18.Default);
        return EECSSignificanceValue(local_19);
    }
    return EECSSignificanceValue(local_19);
}
UFUNCTION()
EECSSignificanceValue __FSignificanceConfig_GetAvatar(const TDataObjectPtr<FSignificanceConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Avatar' from a null 'FSignificanceConfig' DataObject!");
        }
        FSignificanceConfig local_18;
        local_19 = int(local_18.Avatar);
        return EECSSignificanceValue(local_19);
    }
    return EECSSignificanceValue(local_19);
}
UFUNCTION()
EECSSignificanceValue __FSignificanceConfig_GetNamedNPC(const TDataObjectPtr<FSignificanceConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NamedNPC' from a null 'FSignificanceConfig' DataObject!");
        }
        FSignificanceConfig local_18;
        local_19 = int(local_18.NamedNPC);
        return EECSSignificanceValue(local_19);
    }
    return EECSSignificanceValue(local_19);
}
UFUNCTION()
EECSSignificanceValue __FSignificanceConfig_GetCommonNPC(const TDataObjectPtr<FSignificanceConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommonNPC' from a null 'FSignificanceConfig' DataObject!");
        }
        FSignificanceConfig local_18;
        local_19 = int(local_18.CommonNPC);
        return EECSSignificanceValue(local_19);
    }
    return EECSSignificanceValue(local_19);
}
UFUNCTION()
EECSSignificanceValue __FSignificanceConfig_GetBoss(const TDataObjectPtr<FSignificanceConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Boss' from a null 'FSignificanceConfig' DataObject!");
        }
        FSignificanceConfig local_18;
        local_19 = int(local_18.Boss);
        return EECSSignificanceValue(local_19);
    }
    return EECSSignificanceValue(local_19);
}
UFUNCTION()
EECSSignificanceValue __FSignificanceConfig_GetEliteMonster(const TDataObjectPtr<FSignificanceConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EliteMonster' from a null 'FSignificanceConfig' DataObject!");
        }
        FSignificanceConfig local_18;
        local_19 = int(local_18.EliteMonster);
        return EECSSignificanceValue(local_19);
    }
    return EECSSignificanceValue(local_19);
}
UFUNCTION()
EECSSignificanceValue __FSignificanceConfig_GetNormalMonster(const TDataObjectPtr<FSignificanceConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'NormalMonster' from a null 'FSignificanceConfig' DataObject!");
        }
        FSignificanceConfig local_18;
        local_19 = int(local_18.NormalMonster);
        return EECSSignificanceValue(local_19);
    }
    return EECSSignificanceValue(local_19);
}
UFUNCTION()
EECSSignificanceValue __FSignificanceConfig_GetMount(const TDataObjectPtr<FSignificanceConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Mount' from a null 'FSignificanceConfig' DataObject!");
        }
        FSignificanceConfig local_18;
        local_19 = int(local_18.Mount);
        return EECSSignificanceValue(local_19);
    }
    return EECSSignificanceValue(local_19);
}
UFUNCTION()
EECSSignificanceValue __FSignificanceConfig_GetProjectile(const TDataObjectPtr<FSignificanceConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Projectile' from a null 'FSignificanceConfig' DataObject!");
        }
        FSignificanceConfig local_18;
        local_19 = int(local_18.Projectile);
        return EECSSignificanceValue(local_19);
    }
    return EECSSignificanceValue(local_19);
}
UFUNCTION()
EECSSignificanceValue __FSignificanceConfig_GetStaticObject(const TDataObjectPtr<FSignificanceConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StaticObject' from a null 'FSignificanceConfig' DataObject!");
        }
        FSignificanceConfig local_18;
        local_19 = int(local_18.StaticObject);
        return EECSSignificanceValue(local_19);
    }
    return EECSSignificanceValue(local_19);
}
UFUNCTION()
EECSSignificanceValue __FSignificanceConfig_GetDynamicObject(const TDataObjectPtr<FSignificanceConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DynamicObject' from a null 'FSignificanceConfig' DataObject!");
        }
        FSignificanceConfig local_18;
        local_19 = int(local_18.DynamicObject);
        return EECSSignificanceValue(local_19);
    }
    return EECSSignificanceValue(local_19);
}
UFUNCTION()
EECSSignificanceValue __FSignificanceConfig_GetCommonInteractive(const TDataObjectPtr<FSignificanceConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommonInteractive' from a null 'FSignificanceConfig' DataObject!");
        }
        FSignificanceConfig local_18;
        local_19 = int(local_18.CommonInteractive);
        return EECSSignificanceValue(local_19);
    }
    return EECSSignificanceValue(local_19);
}
UFUNCTION()
EECSSignificanceValue __FSignificanceConfig_GetSpecialInteractive(const TDataObjectPtr<FSignificanceConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpecialInteractive' from a null 'FSignificanceConfig' DataObject!");
        }
        FSignificanceConfig local_18;
        local_19 = int(local_18.SpecialInteractive);
        return EECSSignificanceValue(local_19);
    }
    return EECSSignificanceValue(local_19);
}
UFUNCTION()
EECSSignificanceValue __FSignificanceConfig_GetPickup(const TDataObjectPtr<FSignificanceConfig> &inout DataObject)
{
    int local_19 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Pickup' from a null 'FSignificanceConfig' DataObject!");
        }
        FSignificanceConfig local_18;
        local_19 = int(local_18.Pickup);
        return EECSSignificanceValue(local_19);
    }
    return EECSSignificanceValue(local_19);
}
UFUNCTION()
FSignificanceConfig CastToFSignificanceConfig(const TDataObjectPtr<FSignificanceConfig> &inout DataObject)
{
    FSignificanceConfig __r;
    return __r;
}
}

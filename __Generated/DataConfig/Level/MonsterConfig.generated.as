namespace __FMonsterPresentationConfigFunctions
{
UFUNCTION()
int __FMonsterPresentationConfig_GetHPBarSegment(const TDataObjectPtr<FMonsterPresentationConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HPBarSegment' from a null 'FMonsterPresentationConfig' DataObject!");
        }
        FMonsterPresentationConfig defaultValue;
        return defaultValue.HPBarSegment;
    }
    return DataObject.Get().HPBarSegment;
}
UFUNCTION()
TArray<EDamageType> __FMonsterPresentationConfig_GetAttributeTypes(const TDataObjectPtr<FMonsterPresentationConfig> &inout DataObject)
{
    TArray<EDamageType> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttributeTypes' from a null 'FMonsterPresentationConfig' DataObject!");
        }
        FMonsterPresentationConfig local_150;
        return local_150.AttributeTypes;
    }
    return __r;
}
UFUNCTION()
TArray<EDamageType> __FMonsterPresentationConfig_GetWeaknessDamageTypes(const TDataObjectPtr<FMonsterPresentationConfig> &inout DataObject)
{
    TArray<EDamageType> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeaknessDamageTypes' from a null 'FMonsterPresentationConfig' DataObject!");
        }
        FMonsterPresentationConfig local_150;
        return local_150.WeaknessDamageTypes;
    }
    return __r;
}
UFUNCTION()
FText __FMonsterPresentationConfig_GetPrefix(const TDataObjectPtr<FMonsterPresentationConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Prefix' from a null 'FMonsterPresentationConfig' DataObject!");
        }
        FMonsterPresentationConfig local_150;
        return local_150.Prefix;
    }
    return __r;
}
UFUNCTION()
FText __FMonsterPresentationConfig_GetHuntInfo(const TDataObjectPtr<FMonsterPresentationConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HuntInfo' from a null 'FMonsterPresentationConfig' DataObject!");
        }
        FMonsterPresentationConfig local_150;
        return local_150.HuntInfo;
    }
    return __r;
}
UFUNCTION()
FText __FMonsterPresentationConfig_GetBackgroundStory(const TDataObjectPtr<FMonsterPresentationConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BackgroundStory' from a null 'FMonsterPresentationConfig' DataObject!");
        }
        FMonsterPresentationConfig local_150;
        return local_150.BackgroundStory;
    }
    return __r;
}
UFUNCTION()
bool __FMonsterPresentationConfig_GetbShowChangeArea(const TDataObjectPtr<FMonsterPresentationConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowChangeArea' from a null 'FMonsterPresentationConfig' DataObject!");
        }
        FMonsterPresentationConfig local_150;
        return local_150.bShowChangeArea;
    }
    return local_1;
}
UFUNCTION()
TDataObjectPtr<FDivineLiteraryTypeConfig> __FMonsterPresentationConfig_GetDivineLiteraryType(const TDataObjectPtr<FMonsterPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DivineLiteraryType' from a null 'FMonsterPresentationConfig' DataObject!");
        }
        FMonsterPresentationConfig local_150;
        return local_150.GetDivineLiteraryType();
    }
    return GetDivineLiteraryType();
}
UFUNCTION()
FMonsterPresentationConfig CastToFMonsterPresentationConfig(const TDataObjectPtr<FMonsterPresentationConfig> &inout DataObject)
{
    FMonsterPresentationConfig __r;
    return __r;
}
}
namespace __FMonsterMainConfigFunctions
{
UFUNCTION()
int __FMonsterMainConfig_GetMonsterId(const TDataObjectPtr<FMonsterMainConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MonsterId' from a null 'FMonsterMainConfig' DataObject!");
        }
        FMonsterMainConfig defaultValue;
        return defaultValue.MonsterId;
    }
    return DataObject.Get().MonsterId;
}
UFUNCTION()
int __FMonsterMainConfig_GetLevel(const TDataObjectPtr<FMonsterMainConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Level' from a null 'FMonsterMainConfig' DataObject!");
        }
        FMonsterMainConfig defaultValue;
        return defaultValue.Level;
    }
    return DataObject.Get().Level;
}
UFUNCTION()
TDataObjectPtr<FMonsterPresentationConfig> __FMonsterMainConfig_GetPresentationConfig(const TDataObjectPtr<FMonsterMainConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PresentationConfig' from a null 'FMonsterMainConfig' DataObject!");
        }
        FMonsterMainConfig local_214;
        return local_214.GetPresentationConfig();
    }
    return GetPresentationConfig();
}
UFUNCTION()
TDataObjectPtr<FGameAttributeInherit> __FMonsterMainConfig_GetAttributeInheritConfig(const TDataObjectPtr<FMonsterMainConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttributeInheritConfig' from a null 'FMonsterMainConfig' DataObject!");
        }
        FMonsterMainConfig local_214;
        return local_214.GetAttributeInheritConfig();
    }
    return GetAttributeInheritConfig();
}
UFUNCTION()
EFaction __FMonsterMainConfig_GetFactionOverride(const TDataObjectPtr<FMonsterMainConfig> &inout DataObject)
{
    int local_215 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FactionOverride' from a null 'FMonsterMainConfig' DataObject!");
        }
        FMonsterMainConfig local_214;
        local_215 = int(local_214.FactionOverride);
        return EFaction(local_215);
    }
    return EFaction(local_215);
}
UFUNCTION()
EAbnormalState __FMonsterMainConfig_GetWeaknessAbnormalState(const TDataObjectPtr<FMonsterMainConfig> &inout DataObject)
{
    int local_215 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeaknessAbnormalState' from a null 'FMonsterMainConfig' DataObject!");
        }
        FMonsterMainConfig local_214;
        local_215 = int(local_214.WeaknessAbnormalState);
        return EAbnormalState(local_215);
    }
    return EAbnormalState(local_215);
}
UFUNCTION()
TArray<EAbnormalState> __FMonsterMainConfig_GetAbnormalStateResistanceArr(const TDataObjectPtr<FMonsterMainConfig> &inout DataObject)
{
    TArray<EAbnormalState> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AbnormalStateResistanceArr' from a null 'FMonsterMainConfig' DataObject!");
        }
        FMonsterMainConfig local_214;
        return local_214.AbnormalStateResistanceArr;
    }
    return __r;
}
UFUNCTION()
FMonsterMainConfig CastToFMonsterMainConfig(const TDataObjectPtr<FMonsterMainConfig> &inout DataObject)
{
    FMonsterMainConfig __r;
    return __r;
}
}
namespace __FMonsterWeaknessPartConfigFunctions
{
UFUNCTION()
FText __FMonsterWeaknessPartConfig_GetPartName(const TDataObjectPtr<FMonsterWeaknessPartConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PartName' from a null 'FMonsterWeaknessPartConfig' DataObject!");
        }
        FMonsterWeaknessPartConfig local_42;
        return local_42.PartName;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FDropItemConfigBase> __FMonsterWeaknessPartConfig_GetDestroyDropItemConfig(const TDataObjectPtr<FMonsterWeaknessPartConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DestroyDropItemConfig' from a null 'FMonsterWeaknessPartConfig' DataObject!");
        }
        FMonsterWeaknessPartConfig local_42;
        return local_42.GetDestroyDropItemConfig();
    }
    return GetDestroyDropItemConfig();
}
UFUNCTION()
FMonsterWeaknessPartConfig CastToFMonsterWeaknessPartConfig(const TDataObjectPtr<FMonsterWeaknessPartConfig> &inout DataObject)
{
    FMonsterWeaknessPartConfig __r;
    return __r;
}
}

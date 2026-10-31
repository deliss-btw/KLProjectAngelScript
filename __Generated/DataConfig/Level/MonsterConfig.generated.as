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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttributeTypes' from a null 'FMonsterPresentationConfig' DataObject!");
        }
        FMonsterPresentationConfig local_150;
        return local_150.AttributeTypes;
    }
    return DataObject.Get().AttributeTypes;
}
UFUNCTION()
TArray<EDamageType> __FMonsterPresentationConfig_GetWeaknessDamageTypes(const TDataObjectPtr<FMonsterPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeaknessDamageTypes' from a null 'FMonsterPresentationConfig' DataObject!");
        }
        FMonsterPresentationConfig local_150;
        return local_150.WeaknessDamageTypes;
    }
    return DataObject.Get().WeaknessDamageTypes;
}
UFUNCTION()
FText __FMonsterPresentationConfig_GetPrefix(const TDataObjectPtr<FMonsterPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Prefix' from a null 'FMonsterPresentationConfig' DataObject!");
        }
        FMonsterPresentationConfig local_150;
        return local_150.Prefix;
    }
    return DataObject.Get().Prefix;
}
UFUNCTION()
FText __FMonsterPresentationConfig_GetHuntInfo(const TDataObjectPtr<FMonsterPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HuntInfo' from a null 'FMonsterPresentationConfig' DataObject!");
        }
        FMonsterPresentationConfig local_150;
        return local_150.HuntInfo;
    }
    return DataObject.Get().HuntInfo;
}
UFUNCTION()
FText __FMonsterPresentationConfig_GetBackgroundStory(const TDataObjectPtr<FMonsterPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BackgroundStory' from a null 'FMonsterPresentationConfig' DataObject!");
        }
        FMonsterPresentationConfig local_150;
        return local_150.BackgroundStory;
    }
    return DataObject.Get().BackgroundStory;
}
UFUNCTION()
bool __FMonsterPresentationConfig_GetbShowChangeArea(const TDataObjectPtr<FMonsterPresentationConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bShowChangeArea' from a null 'FMonsterPresentationConfig' DataObject!");
        }
        FMonsterPresentationConfig local_150;
        return local_150.bShowChangeArea;
    }
    return DataObject.Get().bShowChangeArea;
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
    return DataObject.Get().GetDivineLiteraryType();
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
    return DataObject.Get().GetPresentationConfig();
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
    return DataObject.Get().GetAttributeInheritConfig();
}
UFUNCTION()
EFaction __FMonsterMainConfig_GetFactionOverride(const TDataObjectPtr<FMonsterMainConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FactionOverride' from a null 'FMonsterMainConfig' DataObject!");
        }
        FMonsterMainConfig local_214;
        return local_214.FactionOverride;
    }
    return DataObject.Get().FactionOverride;
}
UFUNCTION()
EAbnormalState __FMonsterMainConfig_GetWeaknessAbnormalState(const TDataObjectPtr<FMonsterMainConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeaknessAbnormalState' from a null 'FMonsterMainConfig' DataObject!");
        }
        FMonsterMainConfig local_214;
        return local_214.WeaknessAbnormalState;
    }
    return DataObject.Get().WeaknessAbnormalState;
}
UFUNCTION()
TArray<EAbnormalState> __FMonsterMainConfig_GetAbnormalStateResistanceArr(const TDataObjectPtr<FMonsterMainConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AbnormalStateResistanceArr' from a null 'FMonsterMainConfig' DataObject!");
        }
        FMonsterMainConfig local_214;
        return local_214.AbnormalStateResistanceArr;
    }
    return DataObject.Get().AbnormalStateResistanceArr;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PartName' from a null 'FMonsterWeaknessPartConfig' DataObject!");
        }
        FMonsterWeaknessPartConfig local_42;
        return local_42.PartName;
    }
    return DataObject.Get().PartName;
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
    return DataObject.Get().GetDestroyDropItemConfig();
}
UFUNCTION()
FMonsterWeaknessPartConfig CastToFMonsterWeaknessPartConfig(const TDataObjectPtr<FMonsterWeaknessPartConfig> &inout DataObject)
{
    FMonsterWeaknessPartConfig __r;
    return __r;
}
}

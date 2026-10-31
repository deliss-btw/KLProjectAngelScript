namespace __FTraitConfigFunctions
{
UFUNCTION()
FText __FTraitConfig_GetTraitName(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TraitName' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        return local_168.TraitName;
    }
    return DataObject.Get().TraitName;
}
UFUNCTION()
FSoftBrush __FTraitConfig_GetTraitIcon(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TraitIcon' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        return local_168.TraitIcon;
    }
    return DataObject.Get().TraitIcon;
}
UFUNCTION()
FBuffConfigRef __FTraitConfig_GetBuff(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Buff' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        return local_168.Buff;
    }
    return DataObject.Get().Buff;
}
UFUNCTION()
TMap<int, FTraitModifiers> __FTraitConfig_GetModifiersByLevel(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ModifiersByLevel' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        return local_168.ModifiersByLevel;
    }
    return DataObject.Get().ModifiersByLevel;
}
UFUNCTION()
TMap<int, FTraitCapabilities> __FTraitConfig_GetCapabilitiesByLevel(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CapabilitiesByLevel' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        return local_168.CapabilitiesByLevel;
    }
    return DataObject.Get().CapabilitiesByLevel;
}
UFUNCTION()
EItemRarity __FTraitConfig_GetRarity(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Rarity' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        return local_168.Rarity;
    }
    return DataObject.Get().Rarity;
}
UFUNCTION()
TDataObjectPtr<FAvatarMappingConfig> __FTraitConfig_GetAdaptAvatar(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AdaptAvatar' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        return local_168.GetAdaptAvatar();
    }
    return DataObject.Get().GetAdaptAvatar();
}
UFUNCTION()
EBoonTraitAdaptRule __FTraitConfig_GetBoonRule(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BoonRule' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        return local_168.BoonRule;
    }
    return DataObject.Get().BoonRule;
}
UFUNCTION()
TArray<TDataObjectPtr<FAvatarMappingConfig>> __FTraitConfig_GetBoonAvatarList(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BoonAvatarList' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        return local_168.GetBoonAvatarList();
    }
    return DataObject.Get().GetBoonAvatarList();
}
UFUNCTION()
int __FTraitConfig_GetBoonDropNumLimit(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BoonDropNumLimit' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig defaultValue;
        return defaultValue.BoonDropNumLimit;
    }
    return DataObject.Get().BoonDropNumLimit;
}
UFUNCTION()
FTraitConfig CastToFTraitConfig(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    FTraitConfig __r;
    return __r;
}
}
namespace __FTraitDepotElemConfigFunctions
{
UFUNCTION()
FTraitParam __FTraitDepotElemConfig_GetParam(const TDataObjectPtr<FTraitDepotElemConfig> &inout DataObject)
{
    FTraitParam __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Param' from a null 'FTraitDepotElemConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FTraitDepotElemConfig CastToFTraitDepotElemConfig(const TDataObjectPtr<FTraitDepotElemConfig> &inout DataObject)
{
    FTraitDepotElemConfig __r;
    return __r;
}
}
namespace __FTestThreeChooseOneTraitConfigFunctions
{
UFUNCTION()
TArray<FTraitParam> __FTestThreeChooseOneTraitConfig_GetTraitParams(const TDataObjectPtr<FTestThreeChooseOneTraitConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TraitParams' from a null 'FTestThreeChooseOneTraitConfig' DataObject!");
        }
        FTestThreeChooseOneTraitConfig local_18;
        return local_18.TraitParams;
    }
    return DataObject.Get().TraitParams;
}
UFUNCTION()
FTestThreeChooseOneTraitConfig CastToFTestThreeChooseOneTraitConfig(const TDataObjectPtr<FTestThreeChooseOneTraitConfig> &inout DataObject)
{
    FTestThreeChooseOneTraitConfig __r;
    return __r;
}
}
namespace __FEquipmentConfigFunctions
{
UFUNCTION()
EEquipmentType __FEquipmentConfig_GetEquipmentType(const TDataObjectPtr<FEquipmentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EquipmentType' from a null 'FEquipmentConfig' DataObject!");
        }
        FEquipmentConfig local_248;
        return local_248.EquipmentType;
    }
    return DataObject.Get().EquipmentType;
}
UFUNCTION()
int __FEquipmentConfig_GetLevel(const TDataObjectPtr<FEquipmentConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Level' from a null 'FEquipmentConfig' DataObject!");
        }
        FEquipmentConfig defaultValue;
        return defaultValue.Level;
    }
    return DataObject.Get().Level;
}
UFUNCTION()
TArray<FEquipmentAttributeData> __FEquipmentConfig_GetAttributeDatas(const TDataObjectPtr<FEquipmentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttributeDatas' from a null 'FEquipmentConfig' DataObject!");
        }
        FEquipmentConfig local_248;
        return local_248.AttributeDatas;
    }
    return DataObject.Get().AttributeDatas;
}
UFUNCTION()
TArray<FTraitParam> __FEquipmentConfig_GetDefaultTrait(const TDataObjectPtr<FEquipmentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultTrait' from a null 'FEquipmentConfig' DataObject!");
        }
        FEquipmentConfig local_248;
        return local_248.DefaultTrait;
    }
    return DataObject.Get().DefaultTrait;
}
UFUNCTION()
FSoftBrush __FEquipmentConfig_GetEquipmentDisplayImage(const TDataObjectPtr<FEquipmentConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EquipmentDisplayImage' from a null 'FEquipmentConfig' DataObject!");
        }
        FEquipmentConfig local_248;
        return local_248.EquipmentDisplayImage;
    }
    return DataObject.Get().EquipmentDisplayImage;
}
UFUNCTION()
FEquipmentConfig CastToFEquipmentConfig(const TDataObjectPtr<FEquipmentConfig> &inout DataObject)
{
    FEquipmentConfig __r;
    return __r;
}
}
namespace __FWeaponConfigFunctions
{
UFUNCTION()
EWeaponType __FWeaponConfig_GetWeaponType(const TDataObjectPtr<FWeaponConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeaponType' from a null 'FWeaponConfig' DataObject!");
        }
        FWeaponConfig local_264;
        return local_264.WeaponType;
    }
    return DataObject.Get().WeaponType;
}
UFUNCTION()
FName __FWeaponConfig_GetWeaponShowCaseSocketName(const TDataObjectPtr<FWeaponConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeaponShowCaseSocketName' from a null 'FWeaponConfig' DataObject!");
        }
        FWeaponConfig local_264;
        return local_264.WeaponShowCaseSocketName;
    }
    return DataObject.Get().WeaponShowCaseSocketName;
}
UFUNCTION()
TSoftClassPtr<AECSPrefab> __FWeaponConfig_GetWeaponPrefab(const TDataObjectPtr<FWeaponConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeaponPrefab' from a null 'FWeaponConfig' DataObject!");
        }
        FWeaponConfig local_264;
        return local_264.WeaponPrefab;
    }
    return DataObject.Get().WeaponPrefab;
}
UFUNCTION()
FWeaponConfig CastToFWeaponConfig(const TDataObjectPtr<FWeaponConfig> &inout DataObject)
{
    FWeaponConfig __r;
    return __r;
}
}
namespace __FTalismanConfigFunctions
{
UFUNCTION()
ETalismanType __FTalismanConfig_GetTalismanType(const TDataObjectPtr<FTalismanConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalismanType' from a null 'FTalismanConfig' DataObject!");
        }
        FTalismanConfig local_252;
        return local_252.TalismanType;
    }
    return DataObject.Get().TalismanType;
}
UFUNCTION()
FTalismanConfig CastToFTalismanConfig(const TDataObjectPtr<FTalismanConfig> &inout DataObject)
{
    FTalismanConfig __r;
    return __r;
}
}

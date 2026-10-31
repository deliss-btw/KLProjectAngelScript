namespace __FTraitConfigFunctions
{
UFUNCTION()
FText __FTraitConfig_GetTraitName(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TraitName' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        return local_168.TraitName;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FTraitConfig_GetTraitIcon(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TraitIcon' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        return local_168.TraitIcon;
    }
    return __r;
}
UFUNCTION()
FBuffConfigRef __FTraitConfig_GetBuff(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    FBuffConfigRef __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Buff' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        return local_168.Buff;
    }
    return __r;
}
UFUNCTION()
TMap<int, FTraitModifiers> __FTraitConfig_GetModifiersByLevel(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    TMap<int, FTraitModifiers> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ModifiersByLevel' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        return local_168.ModifiersByLevel;
    }
    return __r;
}
UFUNCTION()
TMap<int, FTraitCapabilities> __FTraitConfig_GetCapabilitiesByLevel(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    TMap<int, FTraitCapabilities> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CapabilitiesByLevel' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        return local_168.CapabilitiesByLevel;
    }
    return __r;
}
UFUNCTION()
EItemRarity __FTraitConfig_GetRarity(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    int local_169 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Rarity' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        local_169 = int(local_168.Rarity);
        return EItemRarity(local_169);
    }
    return EItemRarity(local_169);
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
    return GetAdaptAvatar();
}
UFUNCTION()
EBoonTraitAdaptRule __FTraitConfig_GetBoonRule(const TDataObjectPtr<FTraitConfig> &inout DataObject)
{
    int local_169 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BoonRule' from a null 'FTraitConfig' DataObject!");
        }
        FTraitConfig local_168;
        local_169 = int(local_168.BoonRule);
        return EBoonTraitAdaptRule(local_169);
    }
    return EBoonTraitAdaptRule(local_169);
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
    return GetBoonAvatarList();
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
    TArray<FTraitParam> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TraitParams' from a null 'FTestThreeChooseOneTraitConfig' DataObject!");
        }
        FTestThreeChooseOneTraitConfig local_18;
        return local_18.TraitParams;
    }
    return __r;
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
    int local_249 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EquipmentType' from a null 'FEquipmentConfig' DataObject!");
        }
        FEquipmentConfig local_248;
        local_249 = int(local_248.EquipmentType);
        return EEquipmentType(local_249);
    }
    return EEquipmentType(local_249);
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
    TArray<FEquipmentAttributeData> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttributeDatas' from a null 'FEquipmentConfig' DataObject!");
        }
        FEquipmentConfig local_248;
        return local_248.AttributeDatas;
    }
    return __r;
}
UFUNCTION()
TArray<FTraitParam> __FEquipmentConfig_GetDefaultTrait(const TDataObjectPtr<FEquipmentConfig> &inout DataObject)
{
    TArray<FTraitParam> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultTrait' from a null 'FEquipmentConfig' DataObject!");
        }
        FEquipmentConfig local_248;
        return local_248.DefaultTrait;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FEquipmentConfig_GetEquipmentDisplayImage(const TDataObjectPtr<FEquipmentConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EquipmentDisplayImage' from a null 'FEquipmentConfig' DataObject!");
        }
        FEquipmentConfig local_248;
        return local_248.EquipmentDisplayImage;
    }
    return __r;
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
    int local_265 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeaponType' from a null 'FWeaponConfig' DataObject!");
        }
        FWeaponConfig local_264;
        local_265 = int(local_264.WeaponType);
        return EWeaponType(local_265);
    }
    return EWeaponType(local_265);
}
UFUNCTION()
FName __FWeaponConfig_GetWeaponShowCaseSocketName(const TDataObjectPtr<FWeaponConfig> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeaponShowCaseSocketName' from a null 'FWeaponConfig' DataObject!");
        }
        FWeaponConfig local_264;
        return local_264.WeaponShowCaseSocketName;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<AECSPrefab> __FWeaponConfig_GetWeaponPrefab(const TDataObjectPtr<FWeaponConfig> &inout DataObject)
{
    TSoftClassPtr<AECSPrefab> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeaponPrefab' from a null 'FWeaponConfig' DataObject!");
        }
        FWeaponConfig local_264;
        return local_264.WeaponPrefab;
    }
    return __r;
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
    int local_253 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalismanType' from a null 'FTalismanConfig' DataObject!");
        }
        FTalismanConfig local_252;
        local_253 = int(local_252.TalismanType);
        return ETalismanType(local_253);
    }
    return ETalismanType(local_253);
}
UFUNCTION()
FTalismanConfig CastToFTalismanConfig(const TDataObjectPtr<FTalismanConfig> &inout DataObject)
{
    FTalismanConfig __r;
    return __r;
}
}

namespace __FPVX_LevelExpConfigFunctions
{
UFUNCTION()
int __FPVX_LevelExpConfig_GetLevel(const TDataObjectPtr<FPVX_LevelExpConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Level' from a null 'FPVX_LevelExpConfig' DataObject!");
        }
        FPVX_LevelExpConfig defaultValue;
        return defaultValue.Level;
    }
    return DataObject.Get().Level;
}
UFUNCTION()
int __FPVX_LevelExpConfig_GetExp(const TDataObjectPtr<FPVX_LevelExpConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Exp' from a null 'FPVX_LevelExpConfig' DataObject!");
        }
        FPVX_LevelExpConfig defaultValue;
        return defaultValue.Exp;
    }
    return DataObject.Get().Exp;
}
UFUNCTION()
FPVX_LevelExpConfig CastToFPVX_LevelExpConfig(const TDataObjectPtr<FPVX_LevelExpConfig> &inout DataObject)
{
    FPVX_LevelExpConfig __r;
    return __r;
}
}
namespace __FPVX_MonsterKillExpConfigFunctions
{
UFUNCTION()
TDataObjectPtr<FBasePrefabConfig> __FPVX_MonsterKillExpConfig_GetMonsterConfig(const TDataObjectPtr<FPVX_MonsterKillExpConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MonsterConfig' from a null 'FPVX_MonsterKillExpConfig' DataObject!");
        }
        FPVX_MonsterKillExpConfig local_42;
        return local_42.GetMonsterConfig();
    }
    return GetMonsterConfig();
}
UFUNCTION()
int __FPVX_MonsterKillExpConfig_GetExp(const TDataObjectPtr<FPVX_MonsterKillExpConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Exp' from a null 'FPVX_MonsterKillExpConfig' DataObject!");
        }
        FPVX_MonsterKillExpConfig defaultValue;
        return defaultValue.Exp;
    }
    return DataObject.Get().Exp;
}
UFUNCTION()
int __FPVX_MonsterKillExpConfig_GetCoin(const TDataObjectPtr<FPVX_MonsterKillExpConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Coin' from a null 'FPVX_MonsterKillExpConfig' DataObject!");
        }
        FPVX_MonsterKillExpConfig defaultValue;
        return defaultValue.Coin;
    }
    return DataObject.Get().Coin;
}
UFUNCTION()
bool __FPVX_MonsterKillExpConfig_GetUseExpMul(const TDataObjectPtr<FPVX_MonsterKillExpConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UseExpMul' from a null 'FPVX_MonsterKillExpConfig' DataObject!");
        }
        FPVX_MonsterKillExpConfig local_42;
        return local_42.UseExpMul;
    }
    return local_1;
}
UFUNCTION()
FPVX_MonsterKillExpConfig CastToFPVX_MonsterKillExpConfig(const TDataObjectPtr<FPVX_MonsterKillExpConfig> &inout DataObject)
{
    FPVX_MonsterKillExpConfig __r;
    return __r;
}
}

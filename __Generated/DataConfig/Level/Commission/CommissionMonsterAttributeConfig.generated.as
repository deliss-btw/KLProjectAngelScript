namespace __FCommissionMonsterAttributeConfigFunctions
{
UFUNCTION()
TMap<EMonsterRank, FCommissionAttributeScale> __FCommissionMonsterAttributeConfig_GetMonsterRankConfig(const TDataObjectPtr<FCommissionMonsterAttributeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MonsterRankConfig' from a null 'FCommissionMonsterAttributeConfig' DataObject!");
        }
        FCommissionMonsterAttributeConfig local_34;
        return local_34.MonsterRankConfig;
    }
    return DataObject.Get().MonsterRankConfig;
}
UFUNCTION()
FCommissionMonsterAttributeConfig CastToFCommissionMonsterAttributeConfig(const TDataObjectPtr<FCommissionMonsterAttributeConfig> &inout DataObject)
{
    FCommissionMonsterAttributeConfig __r;
    return __r;
}
}

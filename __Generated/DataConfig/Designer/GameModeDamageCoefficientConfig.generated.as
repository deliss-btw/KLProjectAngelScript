namespace __FGameModeDamageCoefficientRowFunctions
{
UFUNCTION()
EGameModeDamageCoefficientEntity __FGameModeDamageCoefficientRow_GetTaker(const TDataObjectPtr<FGameModeDamageCoefficientRow> &inout DataObject)
{
    int local_27 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Taker' from a null 'FGameModeDamageCoefficientRow' DataObject!");
        }
        FGameModeDamageCoefficientRow local_26;
        local_27 = int(local_26.Taker);
        return EGameModeDamageCoefficientEntity(local_27);
    }
    return EGameModeDamageCoefficientEntity(local_27);
}
UFUNCTION()
float32 __FGameModeDamageCoefficientRow_GetPlayer(const TDataObjectPtr<FGameModeDamageCoefficientRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Player' from a null 'FGameModeDamageCoefficientRow' DataObject!");
        }
        FGameModeDamageCoefficientRow defaultValue;
        return defaultValue.Player;
    }
    return DataObject.Get().Player;
}
UFUNCTION()
float32 __FGameModeDamageCoefficientRow_GetShuiJing(const TDataObjectPtr<FGameModeDamageCoefficientRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShuiJing' from a null 'FGameModeDamageCoefficientRow' DataObject!");
        }
        FGameModeDamageCoefficientRow defaultValue;
        return defaultValue.ShuiJing;
    }
    return DataObject.Get().ShuiJing;
}
UFUNCTION()
float32 __FGameModeDamageCoefficientRow_GetPlayerWizard(const TDataObjectPtr<FGameModeDamageCoefficientRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerWizard' from a null 'FGameModeDamageCoefficientRow' DataObject!");
        }
        FGameModeDamageCoefficientRow defaultValue;
        return defaultValue.PlayerWizard;
    }
    return DataObject.Get().PlayerWizard;
}
UFUNCTION()
float32 __FGameModeDamageCoefficientRow_GetWaiXiangRen(const TDataObjectPtr<FGameModeDamageCoefficientRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WaiXiangRen' from a null 'FGameModeDamageCoefficientRow' DataObject!");
        }
        FGameModeDamageCoefficientRow defaultValue;
        return defaultValue.WaiXiangRen;
    }
    return DataObject.Get().WaiXiangRen;
}
UFUNCTION()
float32 __FGameModeDamageCoefficientRow_GetQiong(const TDataObjectPtr<FGameModeDamageCoefficientRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Qiong' from a null 'FGameModeDamageCoefficientRow' DataObject!");
        }
        FGameModeDamageCoefficientRow defaultValue;
        return defaultValue.Qiong;
    }
    return DataObject.Get().Qiong;
}
UFUNCTION()
float32 __FGameModeDamageCoefficientRow_GetQiongSolarResonance(const TDataObjectPtr<FGameModeDamageCoefficientRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'QiongSolarResonance' from a null 'FGameModeDamageCoefficientRow' DataObject!");
        }
        FGameModeDamageCoefficientRow defaultValue;
        return defaultValue.QiongSolarResonance;
    }
    return DataObject.Get().QiongSolarResonance;
}
UFUNCTION()
float32 __FGameModeDamageCoefficientRow_GetPlayerMan(const TDataObjectPtr<FGameModeDamageCoefficientRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerMan' from a null 'FGameModeDamageCoefficientRow' DataObject!");
        }
        FGameModeDamageCoefficientRow defaultValue;
        return defaultValue.PlayerMan;
    }
    return DataObject.Get().PlayerMan;
}
UFUNCTION()
float32 __FGameModeDamageCoefficientRow_GetPlayerManWizard(const TDataObjectPtr<FGameModeDamageCoefficientRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PlayerManWizard' from a null 'FGameModeDamageCoefficientRow' DataObject!");
        }
        FGameModeDamageCoefficientRow defaultValue;
        return defaultValue.PlayerManWizard;
    }
    return DataObject.Get().PlayerManWizard;
}
UFUNCTION()
float32 __FGameModeDamageCoefficientRow_GetPC_Monster_QiongQi(const TDataObjectPtr<FGameModeDamageCoefficientRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PC_Monster_QiongQi' from a null 'FGameModeDamageCoefficientRow' DataObject!");
        }
        FGameModeDamageCoefficientRow defaultValue;
        return defaultValue.PC_Monster_QiongQi;
    }
    return DataObject.Get().PC_Monster_QiongQi;
}
UFUNCTION()
float32 __FGameModeDamageCoefficientRow_GetMonsterCommon(const TDataObjectPtr<FGameModeDamageCoefficientRow> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MonsterCommon' from a null 'FGameModeDamageCoefficientRow' DataObject!");
        }
        FGameModeDamageCoefficientRow defaultValue;
        return defaultValue.MonsterCommon;
    }
    return DataObject.Get().MonsterCommon;
}
UFUNCTION()
FGameModeDamageCoefficientRow CastToFGameModeDamageCoefficientRow(const TDataObjectPtr<FGameModeDamageCoefficientRow> &inout DataObject)
{
    FGameModeDamageCoefficientRow __r;
    return __r;
}
}

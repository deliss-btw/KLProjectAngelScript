namespace __FMailConfigFunctions
{
UFUNCTION()
FText __FMailConfig_GetMailTitle(const TDataObjectPtr<FMailConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MailTitle' from a null 'FMailConfig' DataObject!");
        }
        FMailConfig local_80;
        return local_80.MailTitle;
    }
    return DataObject.Get().MailTitle;
}
UFUNCTION()
FText __FMailConfig_GetMailContent(const TDataObjectPtr<FMailConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MailContent' from a null 'FMailConfig' DataObject!");
        }
        FMailConfig local_80;
        return local_80.MailContent;
    }
    return DataObject.Get().MailContent;
}
UFUNCTION()
FText __FMailConfig_GetMailSender(const TDataObjectPtr<FMailConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MailSender' from a null 'FMailConfig' DataObject!");
        }
        FMailConfig local_80;
        return local_80.MailSender;
    }
    return DataObject.Get().MailSender;
}
UFUNCTION()
int __FMailConfig_GetExpireDay(const TDataObjectPtr<FMailConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExpireDay' from a null 'FMailConfig' DataObject!");
        }
        FMailConfig defaultValue;
        return defaultValue.ExpireDay;
    }
    return DataObject.Get().ExpireDay;
}
UFUNCTION()
TDataObjectPtr<FRewardConfig> __FMailConfig_GetAttachmentRewardConfig(const TDataObjectPtr<FMailConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AttachmentRewardConfig' from a null 'FMailConfig' DataObject!");
        }
        FMailConfig local_80;
        return local_80.GetAttachmentRewardConfig();
    }
    return DataObject.Get().GetAttachmentRewardConfig();
}
UFUNCTION()
TDataObjectPtr<FServerConditionConfigBase> __FMailConfig_GetCondition(const TDataObjectPtr<FMailConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Condition' from a null 'FMailConfig' DataObject!");
        }
        FMailConfig local_80;
        return local_80.GetCondition();
    }
    return DataObject.Get().GetCondition();
}
UFUNCTION()
bool __FMailConfig_GetIsRepeatable(const TDataObjectPtr<FMailConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IsRepeatable' from a null 'FMailConfig' DataObject!");
        }
        FMailConfig local_80;
        return local_80.IsRepeatable;
    }
    return DataObject.Get().IsRepeatable;
}
UFUNCTION()
FMailConfig CastToFMailConfig(const TDataObjectPtr<FMailConfig> &inout DataObject)
{
    FMailConfig __r;
    return __r;
}
}

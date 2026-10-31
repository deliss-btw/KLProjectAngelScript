namespace __FChatSettingsConfigFunctions
{
UFUNCTION()
FStringCheckerConfig __FChatSettingsConfig_GetStringChecker(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    FStringCheckerConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StringChecker' from a null 'FChatSettingsConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FChatContentConfig> __FChatSettingsConfig_GetGetItemChatId(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GetItemChatId' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.GetGetItemChatId();
    }
    return GetGetItemChatId();
}
UFUNCTION()
TDataObjectPtr<FChatContentConfig> __FChatSettingsConfig_GetJoinTeamChatId(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'JoinTeamChatId' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.GetJoinTeamChatId();
    }
    return GetJoinTeamChatId();
}
UFUNCTION()
TDataObjectPtr<FChatContentConfig> __FChatSettingsConfig_GetLeaveTeamChatId(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LeaveTeamChatId' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.GetLeaveTeamChatId();
    }
    return GetLeaveTeamChatId();
}
UFUNCTION()
TDataObjectPtr<FChatContentConfig> __FChatSettingsConfig_GetJoinCombatTeamChatId(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'JoinCombatTeamChatId' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.GetJoinCombatTeamChatId();
    }
    return GetJoinCombatTeamChatId();
}
UFUNCTION()
TDataObjectPtr<FChatContentConfig> __FChatSettingsConfig_GetLeaveCombatTeamChatId(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LeaveCombatTeamChatId' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.GetLeaveCombatTeamChatId();
    }
    return GetLeaveCombatTeamChatId();
}
UFUNCTION()
TDataObjectPtr<FChatContentConfig> __FChatSettingsConfig_GetCreateTeamChatId(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CreateTeamChatId' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.GetCreateTeamChatId();
    }
    return GetCreateTeamChatId();
}
UFUNCTION()
TDataObjectPtr<FChatContentConfig> __FChatSettingsConfig_GetEndTeamChatId(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EndTeamChatId' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.GetEndTeamChatId();
    }
    return GetEndTeamChatId();
}
UFUNCTION()
TDataObjectPtr<FChatContentConfig> __FChatSettingsConfig_GetKickTeamMemberChatId(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'KickTeamMemberChatId' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.GetKickTeamMemberChatId();
    }
    return GetKickTeamMemberChatId();
}
UFUNCTION()
TDataObjectPtr<FChatContentConfig> __FChatSettingsConfig_GetKickOutTeamChatId(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'KickOutTeamChatId' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.GetKickOutTeamChatId();
    }
    return GetKickOutTeamChatId();
}
UFUNCTION()
TDataObjectPtr<FChatContentConfig> __FChatSettingsConfig_GetTeamCaptainTransferChatId(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TeamCaptainTransferChatId' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.GetTeamCaptainTransferChatId();
    }
    return GetTeamCaptainTransferChatId();
}
UFUNCTION()
TDataObjectPtr<FChatContentConfig> __FChatSettingsConfig_GetAddFriendChatId(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AddFriendChatId' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.GetAddFriendChatId();
    }
    return GetAddFriendChatId();
}
UFUNCTION()
TDataObjectPtr<FChatContentConfig> __FChatSettingsConfig_GetAddExpChatId(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AddExpChatId' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.GetAddExpChatId();
    }
    return GetAddExpChatId();
}
UFUNCTION()
TDataObjectPtr<FChatContentConfig> __FChatSettingsConfig_GetAddExpOverflowChatId(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AddExpOverflowChatId' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.GetAddExpOverflowChatId();
    }
    return GetAddExpOverflowChatId();
}
UFUNCTION()
TDataObjectPtr<FChatContentConfig> __FChatSettingsConfig_GetAddExpConvertChatId(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AddExpConvertChatId' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.GetAddExpConvertChatId();
    }
    return GetAddExpConvertChatId();
}
UFUNCTION()
int __FChatSettingsConfig_GetStrangerChatOfflineMaxCount(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StrangerChatOfflineMaxCount' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig defaultValue;
        return defaultValue.StrangerChatOfflineMaxCount;
    }
    return DataObject.Get().StrangerChatOfflineMaxCount;
}
UFUNCTION()
int __FChatSettingsConfig_GetFriendChatOfflineMaxCount(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FriendChatOfflineMaxCount' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig defaultValue;
        return defaultValue.FriendChatOfflineMaxCount;
    }
    return DataObject.Get().FriendChatOfflineMaxCount;
}
UFUNCTION()
int __FChatSettingsConfig_GetFriendChatHistoryMaxCount(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FriendChatHistoryMaxCount' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig defaultValue;
        return defaultValue.FriendChatHistoryMaxCount;
    }
    return DataObject.Get().FriendChatHistoryMaxCount;
}
UFUNCTION()
int __FChatSettingsConfig_GetFriendChatHistoryMaxDays(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'FriendChatHistoryMaxDays' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig defaultValue;
        return defaultValue.FriendChatHistoryMaxDays;
    }
    return DataObject.Get().FriendChatHistoryMaxDays;
}
UFUNCTION()
int __FChatSettingsConfig_GetRecruitSendCDSeconds(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RecruitSendCDSeconds' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig defaultValue;
        return defaultValue.RecruitSendCDSeconds;
    }
    return DataObject.Get().RecruitSendCDSeconds;
}
UFUNCTION()
TDataObjectPtr<FChatContentConfig> __FChatSettingsConfig_GetRecruitChatId(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RecruitChatId' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.GetRecruitChatId();
    }
    return GetRecruitChatId();
}
UFUNCTION()
TArray<EChatChannelTab> __FChatSettingsConfig_GetServerHistoryChannels(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    TArray<EChatChannelTab> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ServerHistoryChannels' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig local_432;
        return local_432.ServerHistoryChannels;
    }
    return __r;
}
UFUNCTION()
int __FChatSettingsConfig_GetChatSendCDMilliseconds(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ChatSendCDMilliseconds' from a null 'FChatSettingsConfig' DataObject!");
        }
        FChatSettingsConfig defaultValue;
        return defaultValue.ChatSendCDMilliseconds;
    }
    return DataObject.Get().ChatSendCDMilliseconds;
}
UFUNCTION()
FChatSettingsConfig CastToFChatSettingsConfig(const TDataObjectPtr<FChatSettingsConfig> &inout DataObject)
{
    FChatSettingsConfig __r;
    return __r;
}
}


namespace FGameConnectionUtils
{
uint GetCurrentProtoLanguageType()
{
    ESearchCase local_8;
    Internationalization::GetCurrentLanguage();
    FString local_14;
    local_14.ToLower();
    if (local_8.StartsWith("zh-hant", ESearchCase(1)) || local_8.StartsWith("zh-tw", ESearchCase(1)) || local_8.StartsWith("zh-hk", ESearchCase(1)) || local_8.StartsWith("zh-mo", ESearchCase(1)) || (local_8 == "tc"))
    {
        return 3;
    }
    if ((local_8.StartsWith("zh", ESearchCase(1)) || (local_8 == "sc")))
    {
        return 2;
    }
    if (local_8.StartsWith("fr", ESearchCase(1)))
    {
        return 4;
    }
    if (local_8.StartsWith("de", ESearchCase(1)))
    {
        return 5;
    }
    if (local_8.StartsWith("es", ESearchCase(1)))
    {
        return 6;
    }
    if (local_8.StartsWith("pt", ESearchCase(1)))
    {
        return 7;
    }
    if (local_8.StartsWith("ru", ESearchCase(1)))
    {
        return 8;
    }
    if (local_8.StartsWith("ja", ESearchCase(1)) || local_8.StartsWith("jp", ESearchCase(1)))
    {
        return 9;
    }
    if (local_8.StartsWith("ko", ESearchCase(1)) || local_8.StartsWith("kr", ESearchCase(1)))
    {
        return 10;
    }
    if (local_8.StartsWith("th", ESearchCase(1)))
    {
        return 11;
    }
    if (local_8.StartsWith("vi", ESearchCase(1)) || local_8.StartsWith("vn", ESearchCase(1)))
    {
        return 12;
    }
    if (local_8.StartsWith("id", ESearchCase(1)))
    {
        return 13;
    }
    if (local_8.StartsWith("tr", ESearchCase(1)))
    {
        return 14;
    }
    if (local_8.StartsWith("it", ESearchCase(1)))
    {
        return 15;
    }
    if (local_8.StartsWith("en", ESearchCase(1)))
    {
        return 1;
    }
    return 0;
}
UFUNCTION()
void UICallQuitGame(const APlayerController PlayerController)
{
    AECSPlayerController local_12;
    bool local_1 = false;
    if (PlayerController.GetWorld() != nullptr && (int(PlayerController.GetWorld().GetNetMode()) == 3))
    {
        local_12 = (Cast<AECSPlayerController>(PlayerController));
        if (local_12 != nullptr)
        {
            if (local_12.GetPlayerEntity().IsValid())
            {
                FFPTime local_24 = FFPTime(-1);
                FECSEntity local_18 = local_12.GetPlayerEntity();
                SendEvent local_22;
                local_22.opCall(local_24);
                local_1 = true;
            }
        }
    }
    if (!(local_1))
    {
        System::QuitGame(__GetWorldContext(), PlayerController, EQuitPreference(0), true);
    }
    return;
}
UFUNCTION()
void UICallForceQuitGame(const APlayerController PlayerController)
{
    if (!(IsValid(PlayerController)))
    {
        XError(ELog(27), "UICallForceQuitGame: PlayerController is invalid, cannot quit");
        return;
    }
    System::QuitGame(__GetWorldContext(), PlayerController, EQuitPreference(0), true);
    return;
}
UFUNCTION()
void UICallEnterMainCity(const FECSEntity &inout PlayerEntity)
{
    int local_52 = 0;
    if (!(!(PlayerEntity.IsValid())) && ECS::GetRuntimeInfo().IsClient)
    {
        if (FLevelUtils::GetCurrentLevelInfoConfig(nullptr))
        {
            int local_51;
            local_51 = local_52;
            if (local_51 > 0)
            {
                FFPTime local_58 = FFPTime(-1);
                FCE_PlayerRequestEnterLevel local_62;
                local_62.LevelKey = local_51;
            }
        }
    }
    return;
}
UFUNCTION()
void UICallMoveToTeleporter(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FTeleporterConfig> &inout TeleporterConfig, const ELoadingScreenAction Action = ELoadingScreenAction::None)
{
    bool local_1;
    if (!(PlayerEntity.IsValid()))
    {
        local_1 = false;
    }
    else
    {
        local_1 = ECS::GetRuntimeInfo().IsClient;
    }
    if (!(local_1))
    {
    }
    else
    {
        TeleporterConfig;
    }
    FFPTime local_10 = FFPTime(-1);
    FCE_PlayerRequestMoveToTeleporter local_14;
    local_14.TeleporterConfig = TeleporterConfig;
    local_14.Action = Action;
    return;
}
UFUNCTION()
void UICallMoveToWorldEvent(const FECSEntity &inout PlayerEntity, const FECSEntityId &inout WorldEventEntityId, const ELoadingScreenAction Action = ELoadingScreenAction::None)
{
    bool local_6;
    XLog(ELog(27), FString().Append("UICallMoveToWorldEvent PlayerEntity=").Append(PlayerEntity).Append(" WorldEventEntityId=").Append(WorldEventEntityId).Append(" Action=").Append(Action));
    if (!(PlayerEntity.IsValid()))
    {
        local_6 = false;
    }
    else
    {
        local_6 = ECS::GetRuntimeInfo().IsClient;
    }
    local_6 = local_6 && !((WorldEventEntityId == ENTITY_ID_NULL));
    if (local_6)
    {
        FCE_TeleportToPublicEventRequest local_18;
        FFPTime local_14 = FFPTime(-1);
        local_18.PublicEventEntity = FECSEntity(WorldEventEntityId);
        local_18.Action = Action;
    }
    return;
}
UFUNCTION()
void UICallLeaveCurrentLevel(const FECSEntity &inout PlayerEntity)
{
    if (!(!(PlayerEntity.IsValid())) && ECS::GetRuntimeInfo().IsClient)
    {
        SendEvent local_6;
        local_6.opCall(FFPTime(-1));
    }
    return;
}
UFUNCTION()
void UICallBackToCityLevel(const FECSEntity &inout PlayerEntity)
{
    if (!(!(PlayerEntity.IsValid())) && ECS::GetRuntimeInfo().IsClient)
    {
        SendEvent local_6;
        local_6.opCall(FFPTime(-1));
    }
    return;
}
bool UICheckTeleportAllowed(const FECSEntity &inout PlayerPawnEntity, const bool bShowTips)
{
    if (!(PlayerPawnEntity.IsValid()) || !(TeleporterUtils::IsTeleportAllowed(PlayerPawnEntity)))
    {
        if (bShowTips)
        {
            FCommonTipsParam local_10;
            CommonPopup::Tips(NSLOCTEXT("GameConnectionUtils", "TeleportNotAllowedTips", "еЅ“е‰ЌзЉ¶жЂЃж— жі•дј йЂЃ"), local_10);
        }
        return false;
    }
    return true;
}
void DestroyExitPlayerEntity(const FECSEntity &inout PlayerEntity)
{
    int local_14 = 0;
    FCE_PlayerLeaveEvent local_24;
    XLog(ELog(27), FString().Append("DestroyExitPlayerEntity PlayerEntity=").Append(PlayerEntity));
    UGameDSConnectionSubsystem::Get().OnDestroyPlayerEntity(PlayerEntity);
    FFPTime local_20 = FFPTime(-1);
    if (local_24)
    {
        int local_21 = local_14.GetPlayerId();
        int local_21_2 = local_14.GetTeam();
    }
    FECSNetUtils::ResetPlayerEntityNetworkParam(PlayerEntity);
    for (auto& local_40 : local_14.GetAllPlayerPawnEntities())
    {
        GetDefaulted local_44;
        FECSEntity local_48 = FECSEntity(local_44.opCall().FakeEntity);
        if (local_48.IsValid())
        {
            FLifeCycleUtils::EntityDestroyDirectly(local_48, ECS::GetContextTime());
        }
        FLifeCycleUtils::EntityDestroyDirectly(local_40, ECS::GetContextTime());
    }
    GetDefaulted local_52;
    FECSEntity local_48_2 = FECSEntity(local_52.opCall().GetMountEntity());
    if (local_48_2)
    {
        FLifeCycleUtils::EntityDestroyDirectly(local_48_2, ECS::GetContextTime());
    }
    FLifeCycleUtils::EntityDestroyDirectly(PlayerEntity, ECS::GetContextTime());
    return;
}
void DisconnectPlayer(const FECSEntity &inout PlayerEntity, const EDisconnectReason Reason)
{
    APXECSPlayerController local_26;
    XLog(ELog(27), FString().Append("DisconnectPlayer PlayerEntity=").Append(PlayerEntity).Append(" Reason=").Append(Reason));
    ModifyOrAdd local_10;
    local_10.opCall().Reason = Reason;
    Get local_14;
    const FC_PlayerController& local_16 = local_14.opCall();
    if (local_16)
    {
        TWeakObjectPtr<AECSPlayerController> local_19 = local_16.GetUEPlayerController();
        AECSPlayerController local_22;
        local_26 = (Cast<APXECSPlayerController>(local_22));
        if (local_26 != nullptr)
        {
            local_26.DisconnectPlayer(EDisconnectReason(Reason));
        }
        else
        {
            XLog(ELog(27), FString().Append("DisconnectPlayer PlayerEntity=").Append(PlayerEntity).Append(" UEPlayerController is invalid"));
            FC_PlayerPendingLogoutTag local_32;
            Assign local_30;
            local_30.opCall(local_32);
        }
    }
    return;
}
void DisconnectPlayerForQuitGame(const FECSEntity &inout PlayerEntity)
{
    APXECSPlayerController local_22;
    XLog(ELog(27), FString().Append("DisconnectPlayerForQuitGame PlayerEntity=").Append(PlayerEntity));
    Get local_10;
    const FC_PlayerController& local_12 = local_10.opCall();
    if (local_12)
    {
        TWeakObjectPtr<AECSPlayerController> local_15 = local_12.GetUEPlayerController();
        AECSPlayerController local_18;
        local_22 = (Cast<APXECSPlayerController>(local_18));
        if (local_22 != nullptr)
        {
            local_22.DisconnectPlayer(EDisconnectReason(6));
        }
    }
    return;
}
FString GetErrorCodeDebugString(const int ErrorCode)
{
    const UErrorCodeSettings local_2;
    GetGameplaySettings<UErrorCodeSettings> local_4;
    local_2 = local_4;
    return local_2.GetErrorCodeDebugString(ErrorCode);
}
void DisplayErrorCode(const int ErrorCode)
{
    const UErrorCodeSettings local_10;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    bool local_7 = local_6.opCall();
    if (local_7)
    {
        GetGameplaySettings<UErrorCodeSettings> local_12;
        local_10 = local_12;
        FText local_18;
        if (local_10.GetErrorCodeText(ErrorCode, local_18))
        {
            FCommonTipsParam local_22;
            CommonPopup::WeakTips(local_18, local_22);
        }
    }
    return;
}
void DisplayErrorCodeWithoutECSWorld(const ULocalPlayer LocalPlayer, const int ErrorCode)
{
    const UErrorCodeSettings local_2;
    GetGameplaySettings<UErrorCodeSettings> local_4;
    local_2 = local_4;
    FText local_10;
    if (local_2.GetErrorCodeText(ErrorCode, local_10))
    {
        FCommonTipsParam local_30;
        CommonPopup_Internal::OpenTips(local_10, local_30, ECommonTipsType(0), FEUIModelContainer(), LocalPlayer);
    }
    return;
}
FText GetDSDisconnectReasonText(const EDisconnectReason Reason)
{
    switch (int(Reason))
    {
    case 0:
    {
        return NSLOCTEXT("Disconnect", "None", "иїћжЋҐе·Іж–­ејЂ");
    }
    case 1:
    {
        return NSLOCTEXT("Disconnect", "TokenError", "з™»еЅ•е‡­иЇЃеј‚еёёпјЊиЇ·й‡Ќж–°з™»еЅ•");
    }
    case 2:
    {
        return NSLOCTEXT("Disconnect", "VersionError", "е®ўж€·з«Їз‰€жњ¬дёЌеЊ№й…ЌпјЊиЇ·ж›ґж–°е®ўж€·з«Ї");
    }
    case 3:
    {
        return NSLOCTEXT("Disconnect", "GSKickPlayer", "ж‚Ёе·Іиў«иёўе‡єжёёж€Џ");
    }
    case 4:
    {
        return NSLOCTEXT("Disconnect", "DSKickPlayer", "ж‚Ёе·Іиў«жњЌеЉЎе™Ёиёўе‡є");
    }
    case 5:
    {
        return NSLOCTEXT("Disconnect", "PlayerDSTravel", "ж­ЈењЁе€‡жЌўжњЌеЉЎе™Ё");
    }
    case 6:
    {
        return NSLOCTEXT("Disconnect", "PlayerQuitGame", "зЋ©е®¶йЂЂе‡єжёёж€Џ");
    }
    case 7:
    {
        return NSLOCTEXT("Disconnect", "XmitDeadLink", "зЅ‘з»њиїћжЋҐе·Іж–­ејЂ");
    }
    case 8:
    {
        return NSLOCTEXT("Disconnect", "RecvTimeout", "зЅ‘з»њиїћжЋҐи¶…ж—¶");
    }
    }
    return NSLOCTEXT("Disconnect", "Unknown", "иїћжЋҐе·Іж–­ејЂ");
}
FText GetKickoutErrorCodeText(const int ErrorCode)
{
    const UErrorCodeSettings local_2;
    GetGameplaySettings<UErrorCodeSettings> local_4;
    local_2 = local_4;
    if (local_2 != nullptr)
    {
        FText local_12;
        if (local_2.GetNetErrorCodeText(ENetReason(ErrorCode), local_12))
        {
            return local_12;
        }
    }
    return NSLOCTEXT("Disconnect", "Unknown", "иїћжЋҐе·Іж–­ејЂ");
}
}

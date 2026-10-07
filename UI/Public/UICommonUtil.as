
namespace UICommonUtil
{
    const FConsoleVariable CVar_UI_DebugEnableNewMiniHpBar = FConsoleVariable();
    const FConsoleVariable CVar_UI_DebugEnableNewSkillBtns = FConsoleVariable();
    const FConsoleVariable CVar_UI_DebugEnableNewItemBtns = FConsoleVariable();
    const FConsoleVariable CVar_UI_DebugEnableNewDamageText = FConsoleVariable();
    const FConsoleVariable CVar_UI_DebugEnableNewSkillCastHint = FConsoleVariable();
    const FConsoleVariable CVar_UI_DebugSkillVideoPlayer = FConsoleVariable();
    const FConsoleVariable CVar_UI_DebugShowMailId = FConsoleVariable();
    const FConsoleVariable CVar_UI_UseAttributePresentation = FConsoleVariable();
    const FConsoleVariable CVar_UI_DebugCommissionTargetModels = FConsoleVariable();
    const FConsoleCommand CCmd_UI_SetDPIScale = FConsoleCommand();
    const FText PlayerNameSeparator = FText();

EEUIInputType GetCurrentInputType(const ULocalPlayer InLocalPlayer = nullptr)
{
    ULocalPlayer local_2;
    if (InLocalPlayer != nullptr)
    {
    }
    else
    {
        if (GetCurrentWorld() != nullptr)
        {
            local_2 = Gameplay::GetPlayerController(__GetWorldContext(), 0).GetLocalPlayer();
        }
        else
        {
            local_2 = FASCommonUtils::GetLocalPlayerController().GetLocalPlayer();
        }
    }
    return UEUIActionRouter::Get(local_2).GetCurrentInputType();
}
FKey GetFirstKeyForCurrentInputType(const ULocalPlayer LocalPlayer, const FEUIInputAction &inout InputAction)
{
    return InputAction.GetFirstKeyForInputType(LocalPlayer, UICommonUtil::GetCurrentInputType(LocalPlayer), false).MainKey;
}
FKey GetFirstKeyForCurrentInputType(const ULocalPlayer LocalPlayer, const UInputAction InputAction)
{
    return UICommonUtil::GetFirstKeyForCurrentInputType(LocalPlayer, FEUIInputAction(InputAction));
}
TSoftClassPtr<UUserWidget> WidgetPathFromString(const FString &inout ObjectPath)
{
    FString local_4 = (ObjectPath + "_C");
    FSoftClassPath local_12 = FSoftClassPath(local_4);
    return TSoftClassPtr<UUserWidget>();
}
TSoftClassPtr<UEUIUserWidget> EUIWidgetPathFromString(const FString &inout ObjectPath)
{
    FString local_4 = (ObjectPath + "_C");
    FSoftClassPath local_12 = FSoftClassPath(local_4);
    return TSoftClassPtr<UEUIUserWidget>();
}
UFUNCTION()
bool IsValid(const FDataObjectPtr &inout DataObject)
{
    return DataObject;
}
bool IsValidPawnContext(const FECSEntity &inout PawnEntity)
{
    int local_20 = 0;
    FECSEntity local_8 = FASCommonUtils::GetUniqueAvatarPawnEntity(PawnEntity);
    FECSWorldPtr local_12 = ECS::GetECSWorld();
    if (!(local_12.IsValid()))
    {
        return false;
    }
    if ((local_8 == ENTITY_NULL))
    {
        return false;
    }
    if (!(local_20))
    {
        return false;
    }
    return true;
}
bool GetInputActionKeyName(const ULocalPlayer LocalPlayer, const FEUIInputAction &inout InputAction, FText &inout OutKeyName)
{
    FKey local_12 = UICommonUtil::GetFirstKeyForCurrentInputType(LocalPlayer, InputAction);
    if ((local_12 == EKeys::Invalid))
    {
        return false;
    }
    OutKeyName = local_12.GetDisplayName(false);
    return true;
}
bool GetInputActionKeyName(const ULocalPlayer LocalPlayer, const UInputAction InputAction, FText &inout OutKeyName)
{
    return UICommonUtil::GetInputActionKeyName(LocalPlayer, FEUIInputAction(InputAction), OutKeyName);
}
FText InputActionToText(const ULocalPlayer LocalPlayer, const FEUIInputAction &inout InputAction)
{
    FText local_8 = InputAction.GetDisplayName();
    FText local_14 = local_8.IsEmptyOrWhitespace() ? NSLOCTEXT("NoDescriptionInputAction", "<жњЄе‘ЅеђЌ>") : local_8;
    return FText::Format(FText::AsCultureInvariant("[{0}]{1}"), UICommonUtil::GetFirstKeyForCurrentInputType(LocalPlayer, InputAction).GetDisplayName(false), local_14);
}
FText InputActionToText(const ULocalPlayer LocalPlayer, const UInputAction InputAction)
{
    return UICommonUtil::InputActionToText(LocalPlayer, FEUIInputAction(InputAction));
}
UInputAction GetConfirmAction()
{
    return UICommonUtil_Internal::GetEnhancedInputSettings().GlobalConfirmAction;
}
UInputAction GetCancelAction()
{
    return UICommonUtil_Internal::GetEnhancedInputSettings().GlobalCancelAction;
}
}
void CMD_UI_SetDPIScale(const TArray<FString> &inout Arguments)
{
    if (Arguments.Num() != 1 || !(Arguments[0].IsNumeric()))
    {
        PrintToScreen(FString().Append("Usage: UI.SetDPIScale <float>  (current: ").Append(FSlateApplication::GetGameUIScale()).Append(")"), 10.0f, FLinearColor::Yellow);
        return;
    }
    float32 local_9 = float32(String::Conv_StringToDouble(Arguments[0]));
    if (local_9 <= 0.0f)
    {
        PrintToScreen(FString().Append("Invalid DPI scale value: ").Append(Arguments[0]), 10.0f, FLinearColor::Red);
        return;
    }
    float32 local_11 = FSlateApplication::GetGameUIScale();
    FSlateApplication::SetGameUIScale(local_9);
    PrintToScreen(FString().Append("Game UI DPI scale: ").Append(local_11).Append(" -> ").Append(local_9), 10.0f, FLinearColor::Green);
    return;
}
namespace UICommonUtil_Internal
{
UEnhancedInputSettings GetEnhancedInputSettings()
{
    return Cast<UEnhancedInputSettings>(System::LoadAsset_Blocking(UGameplayConfigsManager::GetEnhancedInputSettings()));
}
}

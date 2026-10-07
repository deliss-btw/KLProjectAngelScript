
namespace AutoTest::API::GameConnectionAPI
{
void UICallQuitGame()
{
    int local_12 = 0;
    ThrowIf(!(ECS::GetECSWorld().IsValid()), "ECSWorld is invalid.");
    ThrowIf(!(local_12.PlayerEntity.IsValid()), "LocalPlayer entity is invalid.");
    FGameConnectionUtils::UICallQuitGame(local_12.UEPlayerController);
    return;
}
void UICallMoveToTeleporter(const uint TeleporterConfigId)
{
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalPlayerEntity();
    ThrowIf(!(local_8.IsValid()), "PlayerEntity is invalid.");
    GetDataObjectByGSDataId<FTeleporterConfig> local_58;
    TDataObjectPtr<FTeleporterConfig> local_34 = local_58.opImplConv();
    ThrowIf((local_34 == nullptr), (FString("TeleporterConfig is invalid for id: ") + TeleporterConfigId));
    FGameConnectionUtils::UICallMoveToTeleporter(local_8, local_34, ELoadingScreenAction(0));
    return;
}
}

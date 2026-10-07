
namespace FWwisePluginTest
{
UFUNCTION()
void OpenSetMiaSidechain()
{
    FGameAudioUtils::SetAudioState(FName("Sender1"), FName("Sender1_On"), FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
    return;
}
UFUNCTION()
void CloseSetMiaSidechain()
{
    FGameAudioUtils::SetAudioState(FName("Sender1"), FName("Sender1_Off"), FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
    return;
}
}

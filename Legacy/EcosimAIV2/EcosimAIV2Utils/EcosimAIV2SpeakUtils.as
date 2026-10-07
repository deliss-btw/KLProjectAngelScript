
namespace FEcosimAIV2Utils
{
void SetEntityDialogContent(const FECSEntity &inout Entity, const FString &inout Content)
{
    0.SetDialogText(Content);
    return;
}
void EntityPublicSpeak(const FECSEntity &inout Entity, const FString &inout Content, const float32 Duration)
{
    int local_20 = 0;
    0.TargetWorldTime = (ECS::GetContextTime() + FFPTime(Duration));
    local_20.SetDialogText(Content);
    return;
}
void CloseEntityPublicSpeak(const FECSEntity &inout Entity)
{
    Remove local_4;
    local_4.opCall();
    return;
}
void EntityPublicSpeakByLLMPublicSpeakData(const FECSEntity &inout Entity, const TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> &inout SpeakData)
{
    int local_12 = 0;
    if (!(SpeakData) || !(SpeakData.IsSet()))
    {
        return;
    }
    FFPTime local_8 = FFPTime(-1);
    local_12.SpeakData = SpeakData;
    return;
}
void EntityClearPublicSpeakDataKeyTimeRecord(const FECSEntity &inout Entity, const TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> &inout SpeakData)
{
    int local_12 = 0;
    if (!(SpeakData) || !(SpeakData.IsSet()))
    {
        return;
    }
    FFPTime local_8 = FFPTime(-1);
    local_12.SpeakData = SpeakData;
    return;
}
void SetEntityPublicSpeakByDistance(const FECSEntity &inout Entity, const TDataObjectPtr<FEcosimAIV2LLMPublicSpeakData> &inout SpeakData, const float32 SpeakTriggerDistance = 2000, const float32 TriggerMinInterval = 20)
{
    if (!(SpeakData) || !(SpeakData.IsSet()))
    {
        return;
    }
    FC_EcosimAIV2PublicSpeakByDistance local_8;
    local_8.SpeakData = SpeakData;
    local_8.SpeakTriggerDistance = SpeakTriggerDistance;
    local_8.TriggerMinInterval = TriggerMinInterval;
    return;
}
void RemoveEntityPublicSpeakByDistance(const FECSEntity &inout Entity)
{
    Remove local_4;
    local_4.opCall();
    return;
}
}

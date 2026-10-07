
namespace FTutorialUtils
{
UFUNCTION()
FTutorialInfo MakeTutorialInfoDynamic(const TDataObjectPtr<FTutorialInfoConfig> &inout TutorialInfoId, const TArray<FTutorialStepProgress> &inout StepProgress, bool &out bAllCompleted, const float32 Countdown = 0.0f)
{
    bAllCompleted = false;
    FTutorialInfo local_34;
    local_34.SetTutorialInfoId(TutorialInfoId);
    local_34.SetStepProgress(StepProgress);
    local_34.SetCountdown(Countdown);
    bAllCompleted = (StepProgress.Num() > 0);
    for (auto& local_52 : StepProgress)
    {
        if (local_52.GetCurrentProgress() < local_52.GetMaxProgress())
        {
            bAllCompleted = false;
            break;
        }
    }
    return local_34;
}
UFUNCTION()
void SendOpenTutorialEvent(const FECSEntity &inout PlayerEntity, const FTutorialInfo &inout Info)
{
    int local_14 = 0;
    if (!(PlayerEntity.IsValid()))
    {
        return;
    }
    FFPTime local_10 = FFPTime(-1);
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    local_14.Info = Info;
    return;
}
UFUNCTION()
void SendOpenTutorialGraphicEvent(const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FGuideGroupConfig> &inout GraphicConfig)
{
    int local_14 = 0;
    if (!(PlayerEntity.IsValid()))
    {
        return;
    }
    FFPTime local_10 = FFPTime(-1);
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    local_14.GraphicId = GraphicConfig;
    return;
}
}

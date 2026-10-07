

class US_TutorialGraphic : UECSScriptSystem
{
    US_TutorialGraphic()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_CloseTutorialGraphic(const FCE_CloseTutorialGraphic &inout CloseTutorialGraphic) const
    {
        ULevelEventManager local_2 = ::ULevelEventManager::Get();
        local_2.BroadcastTutorialGraphicClosed(CloseTutorialGraphic.GraphicId);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_CloseTutorialGraphic() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CloseTutorialGraphic> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CloseTutorialGraphic& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_CloseTutorialGraphic(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


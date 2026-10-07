

class US_ASGameModeSystemSP : US_ECSScriptGameModeSystemBase
{
    US_ASGameModeSystemSP()
    {
        return;
    }
    UFUNCTION()
    void Job_Begin() const
    {
        XLog(ELog(0), " US_ASGameModeSystemSP Job_Begin");
        return;
    }
    UFUNCTION()
    void Job_Tick() const
    {
        return;
    }
    UFUNCTION()
    void Run_Job_Begin() const
    {
        ECS::GetContextJob();
        this.Job_Begin();
        return;
    }
    UFUNCTION()
    void Run_Job_Tick() const
    {
        ECS::GetContextJob();
        this.Job_Tick();
        return;
    }
}




class US_DebugServerSystem : UECSScriptSystem
{
    US_DebugServerSystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void ServerJob_DebugCheckServerFrameRate(const FCS_FixedTime &inout Time) const
    {
        if (ECS::GetRuntimeInfo().IsDedicatedServerProcess() == false)
        {
            return;
        }
        if (int(Time.LatestFrame) > int(Time.EarliestFrame))
        {
            FDebugMessageUtils::SendError(ELog(3), n"DS ГЁВїВЅГҐВёВ§ГЇВјВЃГЇВјВЃГЇВјВЃ");
            XWarning(ELog(3), "DS иїЅеё§пјЃпјЃпјЃ");
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DebugCheckServerFrameRate() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        this.ServerJob_DebugCheckServerFrameRate(local_6);
        return;
    }
}


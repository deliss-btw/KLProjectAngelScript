

class US_LocalConditionTimeDuration : UECSScriptSystem
{
    US_LocalConditionTimeDuration()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateTimeDurationCondition(const FCS_TimeDurationConditionManager &inout TimeDurationConditionManager, const FCS_FixedTime &inout FixedTime) const
    {
        for (auto& local_16 : TimeDurationConditionManager.ConditionInstances)
        {
            if (::ConditionUtils::IsReached(local_16))
            {
                continue;
            }
            ::ConditionUtils::SetLocalConditionValueForInstance(local_16, (::ConditionUtils::GetCurrentValue(local_16) + 1));
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateTimeDurationCondition() const
    {
        int local_18 = 0;
        int local_24 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        FECSWorldPtr local_12 = this.GetECSWorld();
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        FECSWorldPtr local_12_2 = this.GetECSWorld();
        this.ServerJob_UpdateTimeDurationCondition(local_18, local_24);
        return;
    }
}


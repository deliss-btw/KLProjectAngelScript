

class US_SocialTeamSystem : UECSScriptSystem
{
    US_SocialTeamSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateSocialTeamInfo() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Remove local_12;
        local_12.opCall();
        if ((int(::FTeamUtils::GetCombatTeamRule())) == 1)
        {
            ::FSocialTeamUtils::ServerUpdateCombatTeamBySocialTeam();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateSocialTeamInfo() const
    {
        ECS::GetContextJob();
        this.ServerJob_UpdateSocialTeamInfo();
        return;
    }
}


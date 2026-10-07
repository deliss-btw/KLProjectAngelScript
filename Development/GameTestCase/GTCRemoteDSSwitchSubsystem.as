

class UGTCRemoteDSSwitchSubsystem : UGameInstanceSubsystem
{
    bool bSubscribed = false;


    void EnsureSubscribed()
    {
        if (this.bSubscribed)
        {
            return;
        }
        UGameDSConnectionSubsystem local_6 = ::UGameDSConnectionSubsystem::Get();
        if (local_6 == nullptr)
        {
            return;
        }
        local_6.OnPlayerExitDS.AddUFunction(this, n"OnPlayerExitDS");
        this.bSubscribed = true;
        return;
    }
    void EnsureUnsubscribed()
    {
        if (!(this.bSubscribed))
        {
            return;
        }
        UGameDSConnectionSubsystem local_6 = ::UGameDSConnectionSubsystem::Get();
        if (local_6 != nullptr)
        {
            local_6.OnPlayerExitDS.Unbind(this, n"OnPlayerExitDS");
        }
        this.bSubscribed = false;
        return;
    }
    UFUNCTION()
    void OnPlayerExitDS(const FECSEntity &inout PlayerEntity)
    {
        EDisconnectReason local_1 = EDisconnectReason(4);
        Get local_6;
        const FC_PlayerExitDSReason& local_8 = local_6.opCall();
        if (local_8)
        {
            local_1 = local_8.Reason;
        }
        if ((int(local_1)) != 5)
        {
            return;
        }
        FECSEntity local_16;
        Get local_20;
        const FC_PlayerController& local_22 = local_20.opCall();
        if (local_22)
        {
            local_16 = local_22.GetPlayerPawnEntity();
        }
        if (!(local_16.IsValid()))
        {
            return;
        }
        FString local_32 = local_16.GetEntityName().ToString();
        XLog(ELog(40), FString().Append("[GTC Remote DS] Player DS-travel detected, finalizing GTC session pawn=").Append(local_32).Append(" PlayerEntity=").Append(PlayerEntity));
        UKLGTCTestCaseLoader::DisconnectDSSessionByPawnName(local_32);
        if ((UKLGTCTestCaseLoader::GetDSActiveSessionCount()) == 0)
        {
            this.EnsureUnsubscribed();
        }
        return;
    }
}


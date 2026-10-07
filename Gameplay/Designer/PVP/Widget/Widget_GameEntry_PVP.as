

class UWidget_GameEntry_PVP : ULobbyWidget
{
    UWidget_GameEntry_PVP()
    {
        return;
    }
    UFUNCTION()
    void OnReadyButtonClicked()
    {
        int local_22 = 0;
        AAS_ECSPlayerController local_2 = (Cast<AAS_ECSPlayerController>(this.GetOwningPlayer()));
        if ((!((local_2 != nullptr))))
        {
            return;
        }
        if (!(FECSEntity(local_2.GetPlayerEntity()).IsValid()))
        {
            return;
        }
        FFPTime local_28 = FFPTime(-1);
        FCE_PlayerSetReady local_32;
        local_32.bReady = !(local_22.GetbReady());
        return;
    }
    UFUNCTION()
    void OnGoButtonClicked()
    {
        AAS_ECSPlayerController local_2 = (Cast<AAS_ECSPlayerController>(this.GetOwningPlayer()));
        if ((!((local_2 != nullptr))))
        {
            return;
        }
        if (!(FECSEntity(local_2.GetPlayerEntity()).IsValid()))
        {
            return;
        }
        return;
    }
}


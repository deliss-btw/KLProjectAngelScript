
namespace PlayerNotify
{
void NotifyPlayer(const EPlayerNotify NotifyType)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ModifyOrAdd local_6;
    FCS_PlayerNotifyRegistry& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.PlayerNotifies.SetBit(int(NotifyType), true);
    }
    return;
}
void CancelNotify(const EPlayerNotify NotifyType)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Modify local_6;
    FCS_PlayerNotifyRegistry& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.PlayerNotifies.SetBit(int(NotifyType), false);
    }
    return;
}
void ResponseToNotify(const EPlayerNotify NotifyType)
{
    int local_10 = 0;
    if (!(PlayerNotify::IsNotifyPending(EPlayerNotify(NotifyType))))
    {
        return;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    if (local_10)
    {
        ModifyOrAdd local_14;
        FC_PlayerNotifyClientCache& local_16 = local_14.opCall();
        if (local_16)
        {
            local_16.HandledNotifies.SetBit(int(NotifyType), true);
        }
        ModifyOrAdd local_22;
        FC_PlayerNotifyPendingResponse& local_24 = local_22.opCall();
        if (local_24)
        {
            local_24.Responce.SetBit(int(NotifyType), true);
        }
    }
    return;
}
bool IsNotifyPending(const EPlayerNotify NotifyType)
{
    int local_8 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (local_8)
    {
        Get local_14;
        const FC_PlayerNotify& local_16 = local_14.opCall();
        if (local_16)
        {
            if (local_16.GetPlayerNotifies().GetBit(int(NotifyType)) && !(local_16.GetPlayerResponce().GetBit(int(NotifyType))))
            {
                Get local_22;
                const FC_PlayerNotifyClientCache& local_24 = local_22.opCall();
                if (local_24)
                {
                    return !(local_24.HandledNotifies.GetBit(int(NotifyType)));
                }
                return true;
            }
        }
    }
    return false;
}
}

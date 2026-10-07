

class UMessageHintHandler_ImportantTips : UMessageHintHandler
{
    UMessageHintHandler_ImportantTips()
    {
        super();
        return;
    }
    void ShowMessageHint(const FShowMessageHintParams &inout Params) const
    {
        CastTo local_28;
        TDataObjectPtr<FMessageHintConfig_ImportantTips> local_52 = local_28.opCall();
        if (!(!(!(local_52))))
        {
            return;
        }
        ::MessageHintHandler_TipsInternal::ShowTips(Params, ECommonTipsType(2), FEUIModelContainer(::FVM_ImportantTips::Create(ECS::GetUEWorld(), local_52.opArrow().Style)));
        return;
    }
}


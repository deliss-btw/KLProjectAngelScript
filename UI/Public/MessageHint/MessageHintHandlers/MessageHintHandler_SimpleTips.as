

class UMessageHintHandler_SimpleTips : UMessageHintHandler
{
    UMessageHintHandler_SimpleTips()
    {
        super();
        return;
    }
    void ShowMessageHint(const FShowMessageHintParams &inout Params) const
    {
        ::MessageHintHandler_TipsInternal::ShowTips(Params, ECommonTipsType(0), FEUIModelContainer());
        return;
    }
}

class UMessageHintHandler_WeakTips : UMessageHintHandler
{
    UMessageHintHandler_WeakTips()
    {
        super();
        return;
    }
    void ShowMessageHint(const FShowMessageHintParams &inout Params) const
    {
        ::MessageHintHandler_TipsInternal::ShowTips(Params, ECommonTipsType(1), FEUIModelContainer());
        return;
    }
}

namespace MessageHintHandler_TipsInternal
{
void ShowTips(const FShowMessageHintParams &inout Params, const ECommonTipsType Type, const FEUIModelContainer &inout TypeSpecificModels = FEUIModelContainer())
{
    CastTo local_28;
    TDataObjectPtr<FMessageHintConfig_SimpleTips> local_52 = local_28.opCall();
    if (!(!(local_52)))
    {
        MessageHintUtils::ParseText(local_52.opArrow().Content, Params.GetArguments());
    }
    return;
}
}



class UMessageHintHandler_SmallHint : UMessageHintHandler
{
    UMessageHintHandler_SmallHint()
    {
        super();
        return;
    }
    void ShowMessageHint(const FShowMessageHintParams &inout Params) const
    {
        CastTo local_28;
        TDataObjectPtr<FMessageHintConfig_SmallHint> local_52 = local_28.opCall();
        ::CommonPopup::SmallHint(::MessageHintUtils::ParseIcon(local_52.opArrow().Icon, Params.GetArguments()), ::MessageHintUtils::ParseText(local_52.opArrow().Content, Params.GetArguments()), local_52.opArrow().ExtraParam, local_52.opArrow().Priority);
        return;
    }
}


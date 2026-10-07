

class UMessageHintHandler_LargeHint : UMessageHintHandler
{
    UMessageHintHandler_LargeHint()
    {
        super();
        return;
    }
    void ShowMessageHint(const FShowMessageHintParams &inout Params) const
    {
        CastTo local_28;
        TDataObjectPtr<FMessageHintConfig_LargeHint> local_52 = local_28.opCall();
        ::CommonPopup::LargeHint(::MessageHintUtils::ParseIcon(local_52.opArrow().Icon, Params.GetArguments()), ::MessageHintUtils::ParseText(local_52.opArrow().Title, Params.GetArguments()), ::MessageHintUtils::ParseText(local_52.opArrow().Content, Params.GetArguments()), local_52.opArrow().ExtraParam, local_52.opArrow().Priority);
        return;
    }
}


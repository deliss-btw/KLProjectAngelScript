

class UMessageHintHandler_NewsTicker : UMessageHintHandler
{
    UMessageHintHandler_NewsTicker()
    {
        super();
        return;
    }
    void ShowMessageHint(const FShowMessageHintParams &inout Params) const
    {
        CastTo local_28;
        TDataObjectPtr<FMessageHintConfig_NewsTicker> local_52 = local_28.opCall();
        if (!(!(!(local_52))))
        {
            return;
        }
        ::CommonPopup::NewsTicker(::MessageHintUtils::ParseText(local_52.opArrow().Content, Params.GetArguments()), local_52.opArrow().ExtraParam, local_52.opArrow().Priority, local_52.opArrow().RepeatCount, nullptr);
        return;
    }
}


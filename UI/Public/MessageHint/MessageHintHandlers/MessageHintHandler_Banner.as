class UMessageHintHandler_Banner : UMessageHintHandler
{
    UMessageHintHandler_Banner()
    {
        super();
        return;
    }
    void ShowMessageHint(const FShowMessageHintParams &inout Params) const
    {
        CastTo local_28;
        TDataObjectPtr<FMessageHintConfig_Banner> local_52 = local_28.opCall();
        ::CommonPopup::Banner(local_52.opArrow().HintType, ::MessageHintUtils::ParseText(local_52.opArrow().Title, Params.GetArguments()), local_52.opArrow().BGType, ::MessageHintUtils::ParseIcon(local_52.opArrow().Icon, Params.GetArguments()), ::MessageHintUtils::ParseText(local_52.opArrow().Content, Params.GetArguments()), false, local_52.opArrow().ExtraParam.LifetimeOverride, local_52.opArrow().SpecialWidgetType, local_52.opArrow().Priority);
        return;
    }
}


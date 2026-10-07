

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
        int local_149 = local_52.opArrow().Priority;
        int local_150 = int(local_52.opArrow().SpecialWidgetType);
        int local_151 = int(local_52.opArrow().ExtraParam.LifetimeOverride);
        ::MessageHintUtils::ParseText(local_52.opArrow().Content, Params.GetArguments());
        int local_153 = int(local_52.opArrow().BGType);
        ::MessageHintUtils::ParseText(local_52.opArrow().Title, Params.GetArguments());
        return;
    }
}


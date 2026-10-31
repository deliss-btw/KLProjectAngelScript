class UMessageHintHandler_Banner_MissionChapter : UMessageHintHandler
{
    UMessageHintHandler_Banner_MissionChapter()
    {
        super();
        return;
    }
    void ShowMessageHint(const FShowMessageHintParams &inout Params) const
    {
        CastTo local_28;
        TDataObjectPtr<FMessageHintConfig_Banner_MissionChapter> local_52 = local_28.opCall();
        if (!(!(!(local_52))))
        {
            return;
        }
        int local_109 = local_52.opArrow().Priority;
        float32 local_111 = local_52.opArrow().ExtraParam.LifetimeOverride;
        bool local_53 = local_52.opArrow().bEnd;
        ::CommonPopup::Banner(local_52.opArrow().HintType, ::MessageHintUtils::ParseText(local_52.opArrow().Title, Params.GetArguments()), EBannerBGType(0), FSoftBrush(), ::MessageHintUtils::ParseText(local_52.opArrow().SubTitle, Params.GetArguments()), local_53, local_111, EBannerWidgetType(1), local_109);
        return;
    }
}


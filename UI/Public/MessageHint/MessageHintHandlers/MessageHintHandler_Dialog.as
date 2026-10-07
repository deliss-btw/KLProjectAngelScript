

class UMessageHintHandler_Dialog : UMessageHintHandler
{
    UMessageHintHandler_Dialog()
    {
        super();
        return;
    }
    void ShowMessageHint(const FShowMessageHintParams &inout Params) const
    {
        CastTo local_28;
        TDataObjectPtr<FMessageHintConfig_Dialog> local_52 = local_28.opCall();
        FText local_88 = ::MessageHintUtils::ParseText(local_52.opArrow().Content, Params.GetArguments());
        FDialogCallback local_84;
        FCommonDialogParam local_90;
        ::CommonPopup::Dialog_Confirm(local_52.opArrow().Title, local_88, local_84, local_52.opArrow().ButtonText, local_90);
        return;
    }
}


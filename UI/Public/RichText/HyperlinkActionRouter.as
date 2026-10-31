namespace HyperlinkActionHelper
{
bool HandleHyperlink(const FEUIHyperlinkInfo &in Info)
{
    if (!(Info.Action.IsEmpty()))
    {
        HyperlinkActionHelper::RouteAction(Info.Action, Info.Param);
        return true;
    }
    return false;
}
void RouteAction(const FString &in ActionName, const FString &in Param)
{
    FString local_8 = (FString("HyperlinkActionHelper: Unhandled action '") + ActionName);
    FString local_8_2 = ((local_8 + "' param='") + Param);
    FString local_4_2 = (local_8_2 + "'");
    Print(local_4_2, 5.0f, FLinearColor::LucBlue);
    return;
}
}
namespace ChatSystemHyperlinkRouter
{
bool Handle(const FEUIHyperlinkInfo &in Info, const UEUIUserWidget Widget)
{
    int local_16;
    if (Info.Action.IsEmpty() || (Widget == nullptr))
    {
        return false;
    }
    UEnum local_4 = UEnum::GetEnumType(n"EChatSystemHyperlinkKind");
    int local_10 = INDEX_NONE;
    if (local_4.GetIndexByNameString(Info.Action, EGetByNameFlags(0)) == local_10)
    {
        return false;
    }
    switch (local_4.GetValueByNameString(Info.Action, EGetByNameFlags(0)))
    {
    case 1:
    {
        local_16 = String::Conv_StringToInt(Info.Param);
        if (local_16 != 0)
        {
            FEUIMessageBus::PublishWithWidgetReferencedModels(EUIMessageBus);
            FMsg_OpenPlayerBasicInfo local_24;
            local_24.PlayerUid = local_16;
        }
        return true;
    }
    case 2:
    {
        local_16 = String::Conv_StringToInt(Info.Param);
        if (local_16 != 0)
        {
            FEUIMessageBus::PublishWithWidgetReferencedModels(EUIMessageBus);
            FMsg_ChatSystemItemHyperlinkClicked local_30;
            local_30.ItemDataId = local_16;
        }
        return true;
    }
    case 0:
    default:
    {
    }
    }
    return false;
}
}

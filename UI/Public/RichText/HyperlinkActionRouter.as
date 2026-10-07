
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
    // body not fully recovered вЂ” stub [opcode-uncovered]
    bool __r; return __r;
}
}

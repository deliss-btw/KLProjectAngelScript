
namespace AutoTest::WidgetUtils
{
bool IsWidgetVisible(const UWidget Widget)
{
    if (Widget == nullptr)
    {
        return false;
    }
    if (!(Widget.IsVisible()))
    {
        return false;
    }
    if (Widget.GetRenderOpacity() < 0.01f)
    {
        return false;
    }
    if (Widget.GetParent() != nullptr)
    {
        return AutoTest::WidgetUtils::IsWidgetVisible(Widget.GetParent());
    }
    return true;
}
}

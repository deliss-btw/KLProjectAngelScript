
namespace ECSWorldLifetimePage
{
FEUIWidgetRef Open(const FGameplayTag &inout PageTag, const FEUIModelContainer &inout Models = FEUIModelContainer())
{
    FAsToCpp_OpenECSWorldLifetimePageByTagDelegate local_6 = FAsToCpp_OpenECSWorldLifetimePageByTagDelegate(UScriptAsToCppModelFunctionRouter::Get().OnOpenECSWorldLifetimePageByTag);
    if (local_6.IsBound())
    {
        return local_6.Execute(PageTag, Models);
    }
    return FEUIWidgetRef();
}
FEUIWidgetRef OpenByClass(const TSoftClassPtr<UEUIUserWidget> &inout PageClass)
{
    FAsToCpp_OpenECSWorldLifetimePageByClassDelegate local_6 = FAsToCpp_OpenECSWorldLifetimePageByClassDelegate(UScriptAsToCppModelFunctionRouter::Get().OnOpenECSWorldLifetimePageByClass);
    if (local_6.IsBound())
    {
        return local_6.Execute(PageClass);
    }
    return FEUIWidgetRef();
}
void Close(const FEUIWidgetRef &inout Page)
{
    FAsToCpp_CloseECSWorldLifetimePageDelegate local_6 = FAsToCpp_CloseECSWorldLifetimePageDelegate(UScriptAsToCppModelFunctionRouter::Get().OnCloseECSWorldLifetimePage);
    if (local_6.IsBound())
    {
        local_6.Execute(Page);
    }
    return;
}
void CloseAll()
{
    FAsToCpp_SimpleDelegate local_6 = FAsToCpp_SimpleDelegate(UScriptAsToCppModelFunctionRouter::Get().OnCloseAllECSWorldLifetimePages);
    if (local_6.IsBound())
    {
        local_6.Execute();
    }
    return;
}
}

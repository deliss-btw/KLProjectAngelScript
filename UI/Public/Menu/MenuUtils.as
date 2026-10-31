namespace MenuUtils
{
int GetMenuIndex(const TDataObjectPtr<FMenuConfig> &inout MenuConfig)
{
    int local_3 = MenuSettings::Get().GetBelongingCategoryIndex(MenuConfig);
    if (local_3 == INDEX_NONE)
    {
        return INDEX_NONE;
    }
    return MenuSettings::Get().MenuCategories[local_3].MenuConfigs.IndexOfByKey(MenuConfig);
}
}

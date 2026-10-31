namespace AutoTest::API::GameLevelAPI
{
uint GetCurrentLevelKey()
{
    int local_50;
    TDataObjectPtr<FLevelInfoConfig> local_24 = FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
    if (local_24)
    {
        local_50 = local_24.Get().DataId;
    }
    else
    {
        local_50 = 0;
    }
    return local_50;
}
uint GetCommissionStartAreaKey()
{
    int local_50;
    TDataObjectPtr<FWorldAreaConfig> local_24 = CommissionUtils::GetCommissionStartArea();
    if (local_24)
    {
        local_50 = local_24.Get().DataId;
    }
    else
    {
        local_50 = 0;
    }
    return local_50;
}
}

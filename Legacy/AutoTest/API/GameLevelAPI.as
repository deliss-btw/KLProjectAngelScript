
namespace AutoTest::API::GameLevelAPI
{
uint GetCurrentLevelKey()
{
    int local_51 = 0;
    int local_50 = FLevelUtils::GetCurrentLevelInfoConfig(nullptr) ? local_51 : 0;
    return local_50;
}
uint GetCommissionStartAreaKey()
{
    int local_51 = 0;
    int local_50 = CommissionUtils::GetCommissionStartArea() ? local_51 : 0;
    return local_50;
}
}


namespace EventToESMTriggerUtils
{
FName GetWeatherName(const FECSEntity &inout Entity)
{
    FECSEntity local_4;
    int local_10 = 0;
    int local_16 = 0;
    int local_22 = 0;
    FName __return;
    if (local_10)
    {
        local_4 = FWeatherUtils::GetWeatherRegionEntityBySoftPtr(local_10.LayoutInfo.SpawnerBoundWeatherVolume);
    }
    else
    {
        if (local_16)
        {
            local_4 = FWeatherUtils::GetWeatherRegionEntityBySoftPtr(local_16.LayoutInfo.SpawnerBoundWeatherVolume);
        }
        else
        {
            if (local_22)
            {
                local_4 = FWeatherUtils::GetWeatherRegionEntityBySoftPtr(local_22.LayoutInfo.WeatherVolume);
            }
            else
            {
                __return = NAME_None;
            }
        }
    }
    if (local_4.IsValid())
    {
        return FWeatherUtils::GetWeatherNameFromRegionEntity(local_4);
    }
    __return = NAME_None;
    return __return;
}
}


namespace OpenTimeRangeUtils
{
    const int64 SecondsPerDay = 86400;

bool ParseTimeOfDay(const FString &inout InTime, int &out OutSecondsOfDay)
{
    OutSecondsOfDay = 0;
    OutSecondsOfDay = 0;
    if (InTime.IsEmpty())
    {
        return false;
    }
    TArray<FString> local_8;
    InTime.ParseIntoArray(local_8, ":", true);
    if (local_8.Num() == 0)
    {
        return false;
    }
    int local_15 = local_8.Num() > 0 ? String::Conv_StringToInt(local_8[0].TrimStartAndEnd()) : 0;
    int local_17 = local_8.Num() > 1 ? String::Conv_StringToInt(local_8[1].TrimStartAndEnd()) : 0;
    OutSecondsOfDay = (((local_15 * 3600) + (local_17 * 60)) + (local_8.Num() > 2 ? String::Conv_StringToInt(local_8[2].TrimStartAndEnd()) : 0));
    return true;
}
int GetDaysInMonth(const int Year, const int Month)
{
    if (Month == 2)
    {
        bool local_2;
        int local_1 = Year % 4;
        local_2 = (local_1 == 0);
        if (!(local_2))
        {
            local_2 = false;
        }
        else
        {
            local_1 = Year % 100;
            local_2 = (local_1 != 0);
        }
        if (local_2)
        {
            local_2 = true;
        }
        else
        {
            local_1 = Year % 400;
            local_2 = (local_1 == 0);
        }
        if (local_2)
        {
        }
        else
        {
        }
        return 28;
    }
    if ((Month == 4 || (Month == 6) || (Month == 9) || (Month == 11)))
    {
        return 30;
    }
    return 31;
}
FDateTime MakeDateTime(const int Year, const int Month, const int Day, const int SecondsOfDay)
{
    int local_3 = FMath::IntegerDivisionTrunc(SecondsOfDay, 3600);
    int local_2 = FMath::IntegerDivisionTrunc(SecondsOfDay % 3600, 60);
    int local_4 = SecondsOfDay % 60;
    return FDateTime(Year, Month, Day, local_3, local_2, local_4, 0);
}
int64 GetNowRef(const bool bUseUtc0)
{
    int local_8;
    if (bUseUtc0)
    {
        local_8 = FDateTime::UtcNow().ToUnixTimestamp();
    }
    else
    {
        local_8 = FDateTime::Now().ToUnixTimestamp();
    }
    return local_8;
}
bool GetLastOccurrence(const FOpenTimeRange &inout Range, const int64 NowRef, int64 &out OutStart)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    bool __r; return __r;
}
bool IsNowInAnyRange(const TArray<TDataObjectPtr<FOpenTimeRange>> &inout Ranges)
{
    int local_1 = Ranges.Num();
    if (local_1 == 0)
    {
        return true;
    }
    for (auto& local_18 : Ranges)
    {
        bool local_3 = !(local_18.IsSet());
        if (local_3)
        {
            continue;
        }
        if (local_1 <= 0)
        {
            continue;
        }
        int64 local_22 = OpenTimeRangeUtils::GetNowRef(local_3);
        int64 local_24 = 0;
        if (!(OpenTimeRangeUtils::GetLastOccurrence(local_24, local_22)))
        {
            continue;
        }
        if (local_22 < (local_24 + 0))
        {
            return true;
        }
    }
    return false;
}
FText FormatHourMinute(const int SecondsOfDay)
{
    int local_2 = SecondsOfDay % 86400;
    if (local_2 < 0)
    {
        local_2 = local_2 + 86400;
    }
    int local_1 = FMath::IntegerDivisionTrunc(local_2 % 3600, 60);
    FDateTime local_10 = FDateTime(2000, 1, 1, (FMath::IntegerDivisionTrunc(local_2, 3600)), local_1, 0, 0);
    return FText::AsTime(local_10, EDateTimeStyle(1), "Etc/Unknown");
}
FText GetRangesDisplayText(const TArray<TDataObjectPtr<FOpenTimeRange>> &inout Ranges)
{
    TArray<FText> local_4;
    int local_22 = 0;
    int64 local_32;
    FText local_42;
    for (auto& local_20 : Ranges)
    {
        bool local_17 = !(local_20.IsSet());
        if (local_17)
        {
            continue;
        }
        int local_21 = 0;
        local_17 = !local_17;
        if (local_17)
        {
            continue;
        }
        if (local_17)
        {
            local_32 = FDateTime::Now().ToUnixTimestamp() - FDateTime::UtcNow().ToUnixTimestamp();
        }
        else
        {
            local_32 = 0;
        }
        local_22 = local_21 + local_22;
        int64 local_24 = local_21;
        int local_33 = (local_24 + local_32);
        OpenTimeRangeUtils::FormatHourMinute(local_42);
        local_4.Add(FText::Format(NSLOCTEXT("OpenTimeRange", "Segment", "{0}~{1}"), local_42, OpenTimeRangeUtils::FormatHourMinute((local_22 + local_32))));
    }
    return FText::Join(NSLOCTEXT("OpenTimeRange", "Separator", "пјЊ"), local_4);
}
}

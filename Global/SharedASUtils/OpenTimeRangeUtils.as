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
    int local_25;
    int local_33 = 0;
    int local_43 = 0;
    OutStart = 0;
    OutStart = 0;
    int local_5 = 0;
    if (!(OpenTimeRangeUtils::ParseTimeOfDay(Range.Time, local_5)))
    {
        return false;
    }
    switch (Range.RuleType)
    {
    case EOpenTimeRuleType::Daily:
    {
        int64 local_12 = (NowRef - (NowRef % 86400)) + local_5;
        if (local_12 > NowRef)
        {
            local_12 = local_12 - 86400;
        }
        OutStart = local_12;
        return true;
    }
    case EOpenTimeRuleType::Weekly:
    {
        int local_6 = String::Conv_StringToInt(Range.DateParam.TrimStartAndEnd());
        if (local_6 < 1 || (local_6 > 7))
        {
            return false;
        }
        int64 local_24 = FMath::IntegerDivisionTrunc(NowRef, 86400);
        int64 local_14 = 3;
        int64 local_28 = 7;
        local_14 = (local_24 + local_14) % local_28;
        int local_9 = (local_14 + 1);
        int local_31 = 0;
        for (; local_31 < 8; ++local_31)
        {
            local_25 = local_9 - 1;
            local_25 = local_25 - local_31;
            local_25 = local_25 % 7;
            local_33 = local_25 + 7;
            int local_35 = (local_33 % 7) + 1;
            local_28 = local_31;
            local_28 = (local_24 - local_28) * 86400;
            int64 local_12_2 = local_28 + local_5;
            if (local_35 == local_6 && (local_12_2 <= NowRef))
            {
                OutStart = local_12_2;
                return true;
            }
        }
        return false;
    }
    case EOpenTimeRuleType::Monthly:
    {
        int local_34 = String::Conv_StringToInt(Range.DateParam.TrimStartAndEnd());
        if (local_34 < 1)
        {
            return false;
        }
        FDateTime local_42 = FDateTime::FromUnixTimestamp(NowRef);
        int local_35_2 = local_42.GetYear();
        local_33 = local_42.GetMonth();
        int local_31_2 = 0;
        for (; local_31_2 < 2; ++local_31_2)
        {
            if (local_34 > OpenTimeRangeUtils::GetDaysInMonth(local_35_2, local_33))
            {
            }
            else
            {
            }
            FDateTime local_40 = OpenTimeRangeUtils::MakeDateTime(local_35_2, local_33, local_43, local_5);
            int64 local_38 = local_40.ToUnixTimestamp();
            if (local_38 <= NowRef)
            {
                OutStart = local_38;
                return true;
            }
            local_33 = local_33 - 1;
            if (local_33 < 1)
            {
                local_33 = 12;
                local_35_2 = local_35_2 - 1;
            }
        }
        return false;
    }
    case EOpenTimeRuleType::Yearly:
    {
            int local_44;
        TArray<FString> local_50;
        Range.DateParam.ParseIntoArray(local_50, "/", true);
        if (local_50.Num() < 2)
        {
            return false;
        }
        local_43 = String::Conv_StringToInt(local_50[0].TrimStartAndEnd());
        int local_34_2 = String::Conv_StringToInt(local_50[1].TrimStartAndEnd());
        if (local_43 < 1 || (local_43 > 12) || (local_34_2 < 1))
        {
            return false;
        }
        FDateTime local_46 = FDateTime::FromUnixTimestamp(NowRef);
        int local_36 = local_46.GetYear();
        local_44 = 0;
        for (; local_44 < 2; local_36 = local_36 - 1, ++local_44)
        {
            int local_6_2 = OpenTimeRangeUtils::GetDaysInMonth(local_36, local_43);
            if (local_34_2 > local_6_2)
            {
            }
            else
            {
            }
            FDateTime local_42_2 = OpenTimeRangeUtils::MakeDateTime(local_36, local_43, local_33, local_5);
            int64 local_14_2 = local_42_2.ToUnixTimestamp();
            if (local_14_2 <= NowRef)
            {
                OutStart = local_14_2;
                return true;
            }
        }
        return false;
    }
    }
    return false;
}
bool IsNowInAnyRange(const TArray<TDataObjectPtr<FOpenTimeRange>> &inout Ranges)
{
    if (Ranges.Num() == 0)
    {
        return true;
    }
    for (auto& local_18 : Ranges)
    {
        if (!(local_18.IsSet()))
        {
            continue;
        }
        if (local_18.Get().DurationSeconds <= 0)
        {
            continue;
        }
        int64 local_22 = OpenTimeRangeUtils::GetNowRef(local_18.Get().bUseUtc0);
        int64 local_24 = 0;
        if (!(OpenTimeRangeUtils::GetLastOccurrence(local_18.Get(), local_22, local_24)))
        {
            continue;
        }
        if (local_22 < (local_24 + local_18.Get().DurationSeconds))
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
    int64 local_32;
    FText local_42;
    TArray<FText> local_4;
    for (auto& local_20 : Ranges)
    {
        if (!(local_20.IsSet()))
        {
            continue;
        }
        int local_21 = 0;
        if (!(OpenTimeRangeUtils::ParseTimeOfDay(local_20.Get().Time, local_21)))
        {
            continue;
        }
        if (local_20.Get().bUseUtc0)
        {
            local_32 = FDateTime::Now().ToUnixTimestamp() - FDateTime::UtcNow().ToUnixTimestamp();
        }
        else
        {
            local_32 = 0;
        }
        int64 local_24 = local_21;
        int local_33 = (local_24 + local_32);
        OpenTimeRangeUtils::FormatHourMinute(local_42);
        local_4.Add(FText::Format(NSLOCTEXT("OpenTimeRange", "Segment", "{0}~{1}"), local_42, OpenTimeRangeUtils::FormatHourMinute(((local_21 + local_20.Get().DurationSeconds) + local_32))));
    }
    return FText::Join(NSLOCTEXT("OpenTimeRange", "Separator", "，"), local_4);
}
}


namespace FMapUtils
{
    const FMapConfig DefaultMapConfig = FMapConfig();

UFUNCTION()
FMapConfig GetMapConfig(const FName &inout WorldPathName)
{
    UDataTable local_4;
    FMapConfig __r;
    if (local_4 == nullptr)
    {
        XWarning(ELog(0), "GetMapConfigByRefrence can not find datatable: MapConfig Table");
    }
    else
    {
        TArray<FMapConfig> local_10;
        local_4.GetAllRows(local_10);
        for (auto& local_24 : local_10)
        {
            if (local_24.FullName.IsEqual(WorldPathName, true, true))
            {
                return __r;
            }
        }
    }
    return __r;
}
UFUNCTION()
FMapConfig GetMapConfigByRefrence(const TSoftObjectPtr<UWorld> &inout WorldWeakPtr)
{
    UDataTable local_6;
    FMapConfig __r;
    if (WorldWeakPtr.IsNull())
    {
    }
    else
    {
        if (local_6 == nullptr)
        {
            XWarning(ELog(0), "GetMapConfigByRefrence can not find datatable: MapConfig Table");
        }
        else
        {
            TArray<FMapConfig> local_12;
            local_6.GetAllRows(local_12);
            for (auto& local_26 : local_12)
            {
                FName local_34 = FName(WorldWeakPtr.GetAssetName());
                if (local_26.AssetName.IsEqual(local_34, true, true))
                {
                    return __r;
                }
            }
        }
    }
    return __r;
}
UFUNCTION()
FString FixMapName(const FString &inout InputStr)
{
    FString local_4 = "UEDPIE_";
    int local_5 = -1;
    FString local_10 = InputStr;
    local_10.FindLastChar(int16(47), local_5);
    FString local_20 = local_10.Left(local_5 + 1);
    if (local_5 != -1)
    {
        local_10 = local_10.RightChop(local_5 + 1);
        if (local_10.StartsWith("UEDPIE_", ESearchCase(1)))
        {
            local_10.RemoveFromStart("UEDPIE_", ESearchCase(1));
        }
    }
    if (48 <= local_10[0] && (local_10[0] <= 57))
    {
        int local_25 = -1;
        if (local_10.FindChar(int16(95), local_25))
        {
            local_10 = local_10.RightChop(local_25 + 1);
        }
    }
    return (local_20 + local_10);
}
}

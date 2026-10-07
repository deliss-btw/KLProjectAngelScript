

class UEQT_IsUnderSky : UEnvQueryTest_ECS_BlueprintBase
{
    default SetWorkOnBool(true);
    default SetValidItemType(UEnvQueryItemType_VectorBase);

    UEQT_IsUnderSky()
    {
        return;
    }
    UFUNCTION()
    void RunTest_Implementation(FEnvQueryTest_ECSContext &inout Context, const FEnvQueryTest_ECSItemIterator &inout Item) const
    {
        int local_2 = 0;
        int local_1 = local_2;
        FVector local_14 = Item.GetItemLocation();
        FECSEntity local_18 = FECSEntity(Context.QueryEntity);
        if (::FASCommonUtils::IsLocationUnderSky(local_14, Context.QueryEntity))
        {
            Item.SetScore(1.0f);
        }
        else
        {
            Item.SetScore(-1.0f);
        }
        return;
    }
}




class UEQT_PointNotOccupyByWorldDynamic : UEnvQueryTest_ECS_BlueprintBase
{
    default SetWorkOnBool(true);
    default SetValidItemType(UEnvQueryItemType_VectorBase);

    UEQT_PointNotOccupyByWorldDynamic()
    {
        return;
    }
    UFUNCTION()
    void RunTest_Implementation(FEnvQueryTest_ECSContext &inout Context, const FEnvQueryTest_ECSItemIterator &inout Item) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}


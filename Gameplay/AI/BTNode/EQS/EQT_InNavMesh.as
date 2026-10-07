

class UEQT_InNavMesh : UEnvQueryTest_ECS_BlueprintBase
{
    default SetWorkOnBool(true);
    default SetValidItemType(UEnvQueryItemType_VectorBase);

    UEQT_InNavMesh()
    {
        return;
    }
    UFUNCTION()
    void RunTest_Implementation(FEnvQueryTest_ECSContext &inout Context, const FEnvQueryTest_ECSItemIterator &inout Item) const
    {
        FVector local_14 = Item.GetItemLocation();
        Item.SetScore(FAIPathFollowUtils::IsPointOnNavigation(FECSEntity(Context.QueryEntity), local_14, FVector(50.0, 50.0, 50.0)));
        return;
    }
}


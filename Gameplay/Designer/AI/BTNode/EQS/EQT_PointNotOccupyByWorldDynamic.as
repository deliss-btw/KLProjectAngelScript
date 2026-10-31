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
        int local_18 = 0;
        FECSEntity local_4 = FECSEntity(Context.QueryEntity);
        Has local_10;
        if (!(local_4.IsValid()) || !(local_10.opCall()))
        {
            Item.SetScore(true);
            return;
        }
        float32 local_20 = local_18.GetScaledRadius();
        float32 local_19 = local_18.GetScaledHalfHeight();
        FVector local_52 = (Item.GetItemLocation() + FVector(0.0, 0.0, local_19));
        FCollisionQueryParams local_90;
        local_90.bTraceComplex = false;
        local_90.AddIgnoredEntityId(local_4.GetIdValue());
        bool local_5 = FPhysicsUtils::OverlapAnyTest(local_4, false, EPhysicsTraceTag(26), local_52, FQuat::Identity, FCollisionObjectQueryParams(ECollisionChannel(1)), FCollisionShape::MakeCapsule(local_20, local_19), local_90);
        Item.SetScore(!(local_5));
        return;
    }
}


class ASplinePointPrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FString SplineTag;
    UPROPERTY()
    USplineComponent Spline;
    UPROPERTY()
    FT_SplinePoint SplinePoint;
    UPROPERTY()
    FT_InteractTrait Interact;
    UPROPERTY()
    FT_EntityBlackboard EntityBlackboard;
    UPROPERTY()
    FT_Ability Ability;
    UPROPERTY()
    FT_Skill Skill;
    UPROPERTY()
    FT_Prop Prop;
    UPROPERTY()
    FT_Collision Collision;
    UPROPERTY()
    FT_Prop_Presentation PropPresentation;

    ASplinePointPrefab()
    {
        this.bStatic = false;
        this.bHasActor = true;
        this.bHasTransform = true;
        return;
    }
    UFUNCTION()
    void PostPrefabLoad_Implementation(const FECSEntity &inout Entity) const
    {
        Has local_4;
        bool local_5;
        int local_14 = 0;
        ASplinePointPrefab local_24;
        if (!(local_4.opCall()))
        {
            local_5 = false;
        }
        else
        {
            Has local_10;
            local_5 = local_10.opCall();
        }
        if (local_5)
        {
            Get local_22;
            local_14.SplinePrefab = local_22.opCall().Prefab;
            AECSPrefab local_26;
            local_24 = (Cast<ASplinePointPrefab>(local_26));
            if (local_24 != nullptr)
            {
                local_14.Tag = local_24.SplineTag;
            }
        }
        return;
    }
    UFUNCTION()
    float32 GetCollisionHalfHeight_Implementation() const
    {
        return 0.0f;
    }
    void DrawDebug()
    {
        // body not fully recovered — stub [opcode-uncovered]
    }
}


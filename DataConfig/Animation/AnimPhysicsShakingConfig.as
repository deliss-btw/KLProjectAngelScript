

struct FAnimPhysicsShakingConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<FBoneChainBaseConfig> BoneChainBaseConfigs;
    UPROPERTY()
    FBoneChainShakeCurveConfig DefaultShakeCurveConfig;
    UPROPERTY()
    TArray<FBoneChainShakeCurveConfig> OverrideShakeCurveConfigs;

    FAnimPhysicsShakingConfig()
    {
        return;
    }
}


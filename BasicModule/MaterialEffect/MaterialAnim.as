
enum EMaterialAnimCurveSource
{
    Time,
    EntityBB,
    Attribute,
}


struct FMaterialAnimCurveFloat
{
    UPROPERTY()
    FRuntimeFloatCurve Curve;
    UPROPERTY()
    EMaterialAnimCurveSource Source = EMaterialAnimCurveSource(0);
    UPROPERTY()
    FNameHandle_EntityBBVarFloat BBVarName;
    UPROPERTY()
    FGameAttributeSelectorView Attribute;
    UPROPERTY()
    float32 DefaultValue = 0.0f;
    UPROPERTY()
    float32 InterpoSpeed = 0.0f;


}

struct FMaterialAnimCurveVector
{
    UPROPERTY()
    FRuntimeVectorCurve Curve;
    UPROPERTY()
    EMaterialAnimCurveSource Source = EMaterialAnimCurveSource(0);
    UPROPERTY()
    FNameHandle_EntityBBVarFloat BBVarName;
    UPROPERTY()
    FGameAttributeSelectorView Attribute;


}

struct FMaterialAnimCurveColor
{
    UPROPERTY()
    FRuntimeCurveLinearColor Curve;
    UPROPERTY()
    EMaterialAnimCurveSource Source = EMaterialAnimCurveSource(0);
    UPROPERTY()
    FNameHandle_EntityBBVarFloat BBVarName;
    UPROPERTY()
    FGameAttributeSelectorView Attribute;


}

struct FMaterialAnimCurve
{
    UPROPERTY()
    TMap<FName, FMaterialAnimCurveFloat> FloatCurves;

    FMaterialAnimCurve()
    {
        return;
    }
    void ApplyValue(const FECSEntity &inout Entity, const FName &inout LogicName) const
    {
        AGameActor local_6 = (Cast<AGameActor>(Entity.GetActor()));
        if (local_6 == nullptr)
        {
            return;
        }
        for (auto local_26 : local_6.GetCachedSceneComponentByLogicName(LogicName))
        {
            FECSMeshComponentProxy local_36 = Entity.ModifyActorComponent(local_26.GetFName()).CastToMeshComponent();
            if (local_36)
            {
                for (auto& local_58 : this)
                {
                    FMaterialAnimCurveFloat local_62;
                    local_36.SetScalarParameterValueOnMaterials(local_58.GetKey(), local_62.DefaultValue);
                }
            }
        }
        return;
    }
    void Update(const FECSEntity &inout Entity, const FName &inout LogicName, const float Time, const FFPTime &inout WorldTime, const float32 DeltaSeconds, TMap<FName, float32> &inout InterpoPrevValues) const
    {
        const FMaterialAnimCurveFloat& local_30;
        float32 local_37 = 0.0f;
        AGameActor local_6 = (Cast<AGameActor>(Entity.GetActor()));
        if (local_6 == nullptr)
        {
            return;
        }
        for (auto& local_26 : this)
        {
            const FName& local_28 = local_26.GetKey();
            float local_36 = this.GetSampleTime(local_30.Source, Entity, Time, local_30.BBVarName, local_30.Attribute.AttributeClass, WorldTime);
            float32 local_38 = local_30.InterpoSpeed;
            if (local_38 > 0.0f)
            {
                float32 local_42 = InterpoPrevValues.FindOrAdd(local_28);
                local_38 = float32(local_36);
                local_38 = FMath::FInterpTo(local_42, local_30.Curve.GetFloatValue(local_38, 0.0f), DeltaSeconds, local_30.InterpoSpeed);
                local_42 = local_38;
            }
            else
            {
                local_37 = local_30.Curve.GetFloatValue(float32(local_36), 0.0f);
            }
            for (auto local_62 : local_6.GetCachedSceneComponentByLogicName(LogicName))
            {
                FECSMeshComponentProxy local_72 = Entity.ModifyActorComponent(local_62.GetFName()).CastToMeshComponent();
                if (local_72)
                {
                    local_72.SetScalarParameterValueOnMaterials(local_28, local_37);
                }
            }
        }
        return;
    }
    float GetSampleTime(const EMaterialAnimCurveSource Source, const FECSEntity &inout Entity, const float Time, const FNameHandle_EntityBBVarFloat &inout BBVarName, const TSoftClassPtr<UGameAttribute> &inout Attribute, const FFPTime &inout WorldTime) const
    {
        switch (int(Source))
        {
        case 0:
        {
            return Time;
        }
        case 1:
        {
            return Entity.GetBB_Float(BBVarName);
        }
        case 2:
        {
            return FGameAttributeUtils::GetAttributeValue(Entity, FGameAttributeRef(Attribute), WorldTime, false, 0.0f, false, FGameAttributeModificationValue());
        }
        default:
        {
            return 0.0;
        }
        }
    }
}


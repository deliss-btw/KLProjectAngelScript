
enum EFXAnimCurveSource
{
    Time,
    EntityBB,
    Attribute,
}


struct FFXAnimCurveFloat
{
    UPROPERTY()
    FRuntimeFloatCurve Curve;
    UPROPERTY()
    EFXAnimCurveSource Source = EFXAnimCurveSource(0);
    UPROPERTY()
    FNameHandle_EntityBBVarFloat BBVarName;
    UPROPERTY()
    FGameAttributeSelectorView Attribute;
    UPROPERTY()
    float32 InterpoSpeed = 0.0f;


}

struct FFXAnimCurveVector
{
    UPROPERTY()
    FRuntimeVectorCurve Curve;
    UPROPERTY()
    EFXAnimCurveSource Source = EFXAnimCurveSource(0);
    UPROPERTY()
    FNameHandle_EntityBBVarFloat BBVarName;
    UPROPERTY()
    FGameAttributeSelectorView Attribute;
    UPROPERTY()
    float32 InterpoSpeed = 0.0f;


}

struct FFXAnimCurveColor
{
    UPROPERTY()
    FRuntimeCurveLinearColor Curve;
    UPROPERTY()
    EFXAnimCurveSource Source = EFXAnimCurveSource(0);
    UPROPERTY()
    FNameHandle_EntityBBVarFloat BBVarName;
    UPROPERTY()
    FGameAttributeSelectorView Attribute;
    UPROPERTY()
    float32 InterpoSpeed = 0.0f;


}

struct FFXAnimCurveInterpoState
{
    UPROPERTY()
    TMap<FName, float32> FloatPrevValues;
    UPROPERTY()
    TMap<FName, FVector> VectorPrevValues;
    UPROPERTY()
    TMap<FName, FLinearColor> ColorPrevValues;

    FFXAnimCurveInterpoState()
    {
        return;
    }
}

struct FFXAnimCurve
{
    UPROPERTY()
    TMap<FName, FFXAnimCurveFloat> FloatCurves;
    UPROPERTY()
    TMap<FName, FFXAnimCurveVector> VectorCurves;
    UPROPERTY()
    TMap<FName, FFXAnimCurveColor> ColorCurves;

    FFXAnimCurve()
    {
        return;
    }
    void UpdateFX(const FECSEntity &inout Entity, const FECSEntity &inout OwnerEntity, const float Time, const FFPTime &inout WorldTime, const float32 DeltaSeconds, FFXAnimCurveInterpoState &inout InterpoState) const
    {
        const FFXAnimCurveFloat& local_24;
        float32 local_31 = 0.0f;
        const FFXAnimCurveVector& local_58;
        const FFXAnimCurveColor& local_98;
        for (auto& local_20 : this)
        {
            const FName& local_22 = local_20.GetKey();
            float local_30 = this.GetSampleTime(local_24.Source, OwnerEntity, Time, local_24.BBVarName, local_24.Attribute.AttributeClass, WorldTime);
            if ((local_24.InterpoSpeed > 0.0f && (DeltaSeconds > 0.0f)))
            {
                float32 local_36 = InterpoState.FloatPrevValues.FindOrAdd(local_22);
                local_36 = (FMath::FInterpTo(local_36, local_24.Curve.GetFloatValue(float32(local_30), 0.0f), DeltaSeconds, local_24.InterpoSpeed));
            }
            else
            {
                local_31 = local_24.Curve.GetFloatValue(float32(local_30), 0.0f);
            }
            ECSFX::SetFXParameterFloat(Entity, local_22, local_31);
        }
        for (auto& local_56 : this.VectorCurves)
        {
            const FName& local_22_2 = local_56.GetKey();
            float local_26 = this.GetSampleTime(local_58.Source, OwnerEntity, Time, local_58.BBVarName, local_58.Attribute.AttributeClass, WorldTime);
            FVector local_64;
            if ((local_58.InterpoSpeed > 0.0f && (DeltaSeconds > 0.0f)))
            {
                local_64 = FMath::VInterpTo(InterpoState.VectorPrevValues.FindOrAdd(local_22_2), local_58.Curve.GetValue(float32(local_26)), DeltaSeconds, local_58.InterpoSpeed);
                FVector& local_66 = local_64;
            }
            else
            {
                local_64 = local_58.Curve.GetValue(float32(local_26));
            }
            ECSFX::SetFXParameterVector(Entity, local_22_2, local_64);
        }
        for (auto& local_96 : this.ColorCurves)
        {
            const FName& local_22_3 = local_96.GetKey();
            float local_30_2 = this.GetSampleTime(local_98.Source, OwnerEntity, Time, local_98.BBVarName, local_98.Attribute.AttributeClass, WorldTime);
            FLinearColor local_102;
            if ((local_98.InterpoSpeed > 0.0f && (DeltaSeconds > 0.0f)))
            {
                float32 local_33_2 = local_98.InterpoSpeed;
                local_102 = FMath::CInterpTo(InterpoState.ColorPrevValues.FindOrAdd(local_22_3), local_98.Curve.GetLinearColorValue(float32(local_30_2)), DeltaSeconds, local_33_2);
                FLinearColor& local_104 = local_102;
            }
            else
            {
                local_102 = local_98.Curve.GetLinearColorValue(float32(local_30_2));
            }
            ECSFX::SetFXParameterLinearColor(Entity, local_22_3, local_102);
        }
        return;
    }
    float GetSampleTime(const EFXAnimCurveSource Source, const FECSEntity &inout Entity, const float Time, const FNameHandle_EntityBBVarFloat &inout BBVarName, const TSoftClassPtr<UGameAttribute> &inout Attribute, const FFPTime &inout WorldTime) const
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

class UFXAnimCurveConfig : UDataAsset
{
    UPROPERTY()
    FFXAnimCurve AnimCurve;

    UFXAnimCurveConfig()
    {
        return;
    }
}


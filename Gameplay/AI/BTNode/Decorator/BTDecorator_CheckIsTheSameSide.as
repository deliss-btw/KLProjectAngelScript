

// NOTE: class defaults are not authored in this module: UBTDecorator_CheckIsTheSameSide (default scalar field UBTDecorator.FlowAbortMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UBTDecorator_CheckIsTheSameSide : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    FAISmart_EntityId SelfEntity = FAISmart_EntityId(FAIBlackboardNativeKey::SelfEntity, EAISmartValue(0));
    UPROPERTY()
    FAISmart_EntityId TeammateEntity = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
    UPROPERTY()
    FAISmart_EntityId TargetEntity = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
    UPROPERTY()
    float32 RequiredDegree = 75.0f;


    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        if (!(FECSEntity(this.SelfEntity.GetValue(Context.opImplConv())).IsValid()) || !(FECSEntity(this.TargetEntity.GetValue(Context.opImplConv())).IsValid()) || !(FECSEntity(this.TeammateEntity.GetValue(Context.opImplConv())).IsValid()))
        {
            return false;
        }
        Get local_32;
        FVector local_28 = local_32.opCall().GetPosition();
        FVector local_38 = local_32.opCall().GetPosition();
        FVector local_44 = local_32.opCall().GetPosition();
        FVector local_56 = (local_28 - local_38);
        FVector local_50 = (local_44 - local_38);
        local_56.Z = 0.0;
        local_50.Z = 0.0;
        return (((FMath::Acos((local_56.DotProduct(local_50) / (local_56.Size() * local_50.Size())))) * 57.29577791868205) <= this.RequiredDegree);
    }
}


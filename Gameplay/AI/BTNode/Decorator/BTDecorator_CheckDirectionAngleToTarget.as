enum EBTCheckDirectionAngleCompareType
{
    InRange,
    OutOfRange,
}

enum EBTCheckDirectionAnchorType
{
    Root,
    Socket,
}


class UBTDecorator_CheckDirectionAngleToTarget : UBTDecorator_ECSScriptBase
{
    UPROPERTY()
    bool bIgnoreHeight = true;
    UPROPERTY()
    FAISmart_EntityId OriginEntity = FAISmart_EntityId(FAIBlackboardNativeKey::SelfEntity, EAISmartValue(0));
    UPROPERTY()
    FAISmart_EntityId TargetEntity = FAISmart_EntityId(n"TargetEntityID", EAISmartValue(0));
    UPROPERTY()
    EBTCheckDirectionAngleCompareType CompareType;
    UPROPERTY()
    bool bDegreeSigned = false;
    UPROPERTY()
    FAISmart_Float StartDegree;
    UPROPERTY()
    FAISmart_Float EndDegree;
    UPROPERTY()
    EBTCheckDirectionAnchorType OriginLocationType;
    UPROPERTY()
    FName OriginSocketName;
    UPROPERTY()
    EBTCheckDirectionAnchorType OriginForwardType;


    UFUNCTION()
    bool CalculateRawConditionValue_Implementation(const FAIBehaviorTreeContext &inout Context, const FBTNodeMemory &inout NodeMemory) const
    {
        Get local_92;
        float32 local_152;
        FECSEntity local_12 = FECSEntity(this.OriginEntity.GetValue(Context.opImplConv()));
        if (!(local_12.IsValid()) || !(FECSEntity(this.TargetEntity.GetValue(Context.opImplConv())).IsValid()))
        {
            return false;
        }
        FTransform local_44;
        bool local_17 = (int(this.OriginLocationType) == 1);
        if (local_17)
        {
            local_44 = FTransformUtils::GetSocketTransformInGameMesh(local_12, this.OriginSocketName, ECS::GetContextTime(), local_17, FDownsampleConfig());
        }
        bool local_45 = local_17 && (int(this.OriginForwardType) == 1);
        FVector local_104;
        if (local_17)
        {
            local_104 = local_44.GetTranslation();
        }
        else
        {
            local_104 = local_92.opCall().GetPosition();
        }
        FVector local_110 = local_92.opCall().GetPosition();
        FVector local_130;
        if (local_45)
        {
            local_130 = local_44.GetRotation().GetForwardVector();
        }
        else
        {
            local_130 = local_92.opCall().GetRotation().GetForwardVector();
        }
        FVector local_98 = (local_110 - local_104);
        FVector local_116;
        if (this.bIgnoreHeight)
        {
            local_116 = local_130.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
        }
        else
        {
            local_116 = local_130.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        }
        local_130 = local_104;
        if (this.bIgnoreHeight)
        {
            local_116 = local_98.GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
        }
        else
        {
            local_116 = local_98.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
        }
        local_98 = local_116;
        float32 local_139 = FMathUtils::AngleBetween(local_130, local_98);
        if (this.bDegreeSigned)
        {
            if (local_130.CrossProduct(local_98).Z < 0.0)
            {
                float32 local_140 = -local_139;
                local_139 = local_140;
            }
        }
        float32 local_140_2 = this.EndDegree.GetValue(Context.opImplConv());
        bool local_81 = this.bDegreeSigned;
        if (local_81)
        {
            local_152 = this.StartDegree.GetValue(Context.opImplConv());
        }
        else
        {
            float32 local_151 = -local_140_2;
            local_152 = local_151;
        }
        if (local_140_2 < local_152)
        {
            float32 local_153 = local_152;
            local_152 = local_140_2;
            local_140_2 = local_153;
        }
        switch (int(this.CompareType))
        {
        case 0:
        {
            return local_139 >= local_152 && (local_139 <= local_140_2);
        }
        case 1:
        {
            return local_139 < local_152 || (local_139 > local_140_2);
        }
        default:
        {
            XError(ELog(14), FString().Append("Unsupported compare type").Append(this.CompareType));
            local_81 = false;
        }
        }
        return local_81;
    }
    UFUNCTION()
    FString GetStaticDescription_Implementation() const
    {
        FString local_4;
        switch (this.CompareType)
        {
        case EBTCheckDirectionAngleCompareType::InRange:
        {
            local_4 = "In Range";
            break;
        }
        case EBTCheckDirectionAngleCompareType::OutOfRange:
        {
            local_4 = "Out of Range";
            break;
        }
        }
        if (this.bDegreeSigned)
        {
            return (FString(FString().Append("\n\n  ").Append(this.OriginEntity).Append(" -> ").Append(this.TargetEntity)) + FString().Append("\n  ").Append(local_4).Append(" [ ").Append(this.StartDegree).Append(" , ").Append(this.EndDegree).Append(" ]"));
        }
        return (FString(FString().Append("\n\n  ").Append(this.OriginEntity).Append(" -> ").Append(this.TargetEntity)) + FString().Append("\n  ").Append(local_4).Append(" [ -").Append(this.EndDegree).Append(" , ").Append(this.EndDegree).Append(" ]"));
    }
}


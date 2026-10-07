

struct FLineInteractFxInstanceData
{
    UPROPERTY()
    FECSEntity LineFx;

    FLineInteractFxInstanceData()
    {
        return;
    }
}

class UESMAction_LineInteractFx : UESMBPBaseSpanAction
{
    UPROPERTY()
    TSubclassOf<AFXActor> LineInteractFx;
    UPROPERTY()
    FAttachRefName Attach;
    UPROPERTY()
    ELineInteractTargetType InteractTarget = ELineInteractTargetType(0);
    UPROPERTY()
    FVector NoLockTargetRelativeOffset = FVector(500.0, 0.0, 100.0);
    UPROPERTY()
    FNameHandle_EntityBBVarVector TargetBBName;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntity;
    UPROPERTY()
    FVector RelativeOffset = FVector(500.0, 0.0, 100.0);
    UPROPERTY()
    EFXActionExitMode FXActionExitMode = EFXActionExitMode(2);


    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FLineInteractFxInstanceData);
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        AFXActor local_4 = this.LineInteractFx.GetDefaultObject();
        if (local_4 != nullptr)
        {
            if (!(local_4.FXParamBakedData.bLoop))
            {
                UClass local_12;
                Info.AddDataInvalidComment(EESMDataValidType(2), FString().Append(local_12.GetName()).Append(" loop should be true"));
            }
        }
        return;
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(1);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_156 = 0;
        int local_164 = 0;
        const AActor local_188;
        USkeletalMeshComponent local_190;
        int local_206 = 0;
        if ((this.LineInteractFx == nullptr))
        {
            return;
        }
        FECSEntity local_8 = Context.GetEntity();
        FFXConfig local_124;
        local_124.SetAsset(FSoftClassPath(this.LineInteractFx));
        local_124.SetAttachRefName(this.Attach);
        FLineInteractFxInstanceData& local_136 = this.ModifyViewInstanceData(Context);
        local_136.LineFx = ECSFX::PlayFXDurational(local_8, local_124, Time.WorldTime, 1.0f, false);
        FC_LineInteractTargetData local_148;
        local_148.LineInteractTarget = this.InteractTarget;
        local_148.TargetBBName = this.TargetBBName;
        local_148.TargetEntity = this.TargetEntity;
        if (int(this.InteractTarget) == 4)
        {
            local_148.NoLockTargetWorldLocation = (FVector(local_164.GetPosition()) + local_164.GetRotation().RotateVector(this.RelativeOffset));
        }
        else
        {
            if (local_156 && local_156.GetbCachedValidLockTargetPosition())
            {
                local_188 = local_156.GetTargetEntity().GetActor();
                local_148.CachedEntity = local_156.GetTargetEntity();
                local_190 = (Cast<USkeletalMeshComponent>(local_188.GetDefaultAttachComponent()));
                FVector local_200 = local_156.GetLogicLockTargetPosition();
                if (local_206 && local_206.GetbCachedValidMultiExtraInfo())
                {
                    local_200 = local_206.GetLockTargetExtraInfo().GetPosition();
                }
                if (local_190 != nullptr)
                {
                    bool local_183;
                    FHitResult local_272;
                    local_183 = false;
                    bool local_3 = true;
                    Get local_162;
                    bool local_274 = FPhysicsUtils::LineTraceComponent(local_272, local_190, EPhysicsTraceTag(33), local_162.opCall().GetPosition(), local_200, local_3, local_183);
                    if (local_274)
                    {
                        local_148.Offset = local_190.GetSocketTransform(local_272.BoneName, ERelativeTransformSpace(0)).InverseTransformPosition(local_272.ImpactPoint);
                        local_148.BoneName = local_272.BoneName;
                    }
                    else
                    {
                        local_148.Offset = local_190.GetWorldTransform().InverseTransformPosition(local_200);
                    }
                }
                else
                {
                    USceneComponent local_302 = local_188.GetDefaultAttachComponent();
                    if (local_302 != nullptr)
                    {
                        local_148.Offset = local_302.GetWorldTransform().InverseTransformPosition(local_200);
                    }
                    else
                    {
                        local_148.Offset = local_188.GetActorTransform().InverseTransformPosition(local_200);
                    }
                }
            }
            else
            {
                local_148.NoLockTargetWorldLocation = (FVector(local_164.GetPosition()) + local_164.GetRotation().RotateVector(this.NoLockTargetRelativeOffset));
            }
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FLineInteractFxInstanceData& local_2 = this.ModifyViewInstanceData(Context);
        if (local_2.LineFx)
        {
            ECSFX::StopFX(local_2.LineFx, (int(this.FXActionExitMode) != 1), true, 0.0f);
        }
        return;
    }
    const FLineInteractFxInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FLineInteractFxInstanceData __r;
        return __r;
    }
    FLineInteractFxInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FLineInteractFxInstanceData __r;
        return __r;
    }
}

namespace LineInteractTarget
{
UFUNCTION()
FVector GetLineInteractTargetLocation(const FECSEntity &inout Entity, const FECSEntity &inout OwnerEntity, bool &out bHasValidTarget)
{
    FC_LineInteractTargetData local_8;
    FName local_22;
    const AActor local_26;
    USkeletalMeshComponent local_28;
    int local_68 = 0;
    int local_76 = 0;
    bHasValidTarget = false;
    if (!(local_8))
    {
        bHasValidTarget = false;
        return FVector::ZeroVector;
    }
    bHasValidTarget = true;
    switch (int(local_8.LineInteractTarget))
    {
    case 0:
    {
        FNameHandle_EntityBBVarVector local_16;
        local_16;
        return local_22;
    }
    case 1:
    {
        if (local_8.CachedEntity)
        {
            local_26 = local_8.CachedEntity.GetActor();
            if (local_26 != nullptr)
            {
                local_28 = (Cast<USkeletalMeshComponent>(local_26.GetDefaultAttachComponent()));
                if (local_28 != nullptr)
                {
                    FTransform local_60 = local_28.GetSocketTransform(local_8.BoneName, ERelativeTransformSpace(0));
                    return local_22;
                }
                USceneComponent local_62 = local_26.GetDefaultAttachComponent();
                if (local_62 != nullptr)
                {
                    FTransform local_60_2 = local_62.GetWorldTransform();
                    return local_22;
                }
                return local_22;
            }
        }
        else
        {
            if (local_68 && local_68.GetbCachedValidLockTargetPosition())
            {
                if (local_76 && local_76.GetbCachedValidMultiExtraInfo())
                {
                    return local_76.GetLockTargetExtraInfo().GetPosition();
                }
                return local_68.GetLogicLockTargetPosition();
            }
        }
        bHasValidTarget = false;
        return local_8.NoLockTargetWorldLocation;
    }
    case 2:
    {
        return local_22;
    }
    case 3:
    {
        local_26 = OwnerEntity.GetBB_Entity(local_8.TargetEntity).GetActor();
        if (local_26 != nullptr)
        {
            local_26.GetActorLocation();
            return local_22;
        }
        bHasValidTarget = false;
        return FVector::ZeroVector;
    }
    case 4:
    {
        bHasValidTarget = false;
        return local_8.NoLockTargetWorldLocation;
    }
    }
    return FVector::ZeroVector;
}
}

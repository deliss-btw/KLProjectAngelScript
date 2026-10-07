

struct FESMViewSocketAlignInstanceData
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    bool bInitialized = false;


}

class UESMAction_ViewSocketAlign : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    EViewSocketAlignMode AlignMode = EViewSocketAlignMode(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;
    UPROPERTY()
    FName TargetSocketName = NAME_None;
    UPROPERTY()
    FName SourceSocketName = NAME_None;
    UPROPERTY()
    FNameHandle_EntityBBVarVector RelativeLocationCurveBBVar;
    UPROPERTY()
    FNameHandle_EntityBBVarVector RelativeRotationCurveBBVar;
    UPROPERTY()
    float32 BlendInDuration = 0.2f;
    UPROPERTY()
    float32 SmoothSpeed = 20.0f;


    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMViewSocketAlignInstanceData);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    bool IsNotifyTypeAllowed_Implementation(const EESMNotifyType InType) const
    {
        return (int(InType) == 1);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FESMViewSocketAlignInstanceData& local_2 = this.ModifyViewInstanceData(Context);
        FNameHandle_EntityBBVarEntity local_10;
        local_10;
        FECSEntity local_14 = Context.GetEntity().GetBB_Entity(local_10);
        if (!(local_14.IsValid()))
        {
            return;
        }
        local_2.TargetEntity = local_14;
        local_2.bInitialized = true;
        FECSEntity local_6;
        if (int(this.AlignMode) == 0)
        {
            local_6 = Context.GetEntity();
        }
        else
        {
            local_6 = local_14;
        }
        FECSEntity local_20 = this.GetMovedEntity(Context, local_2);
        FC_ViewSocketAlign local_34;
        local_34.SelfEntity = Context.GetEntity();
        local_34.TargetEntity = local_14;
        local_34.TargetSocketName = this.TargetSocketName;
        local_34.SourceSocketName = this.SourceSocketName;
        local_34.AlignMode = this.AlignMode;
        local_34.CurveOffset = this.SampleCurveOffset(local_6);
        local_34.BlendInDuration = this.BlendInDuration;
        local_34.bBlendInitialized = false;
        local_34.bSmoothInitialized = false;
        local_34.SmoothSpeed = this.SmoothSpeed;
        Assign local_66;
        local_66.opCall(FC_TransformSyncDisabled());
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FESMViewSocketAlignInstanceData& local_2 = this.GetViewInstanceData(Context);
        if (!(local_2.bInitialized))
        {
            return;
        }
        FECSEntity local_12 = this.GetMovedEntity(Context, local_2);
        Modify local_16;
        FC_ViewSocketAlign& local_18 = local_16.opCall();
        if (local_18)
        {
            FECSEntity local_8;
            if (int(this.AlignMode) == 0)
            {
                local_8 = Context.GetEntity();
            }
            else
            {
                local_8 = local_2.TargetEntity;
            }
            local_18.CurveOffset = this.SampleCurveOffset(local_8);
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_3;
        const FESMViewSocketAlignInstanceData& local_2 = this.GetViewInstanceData(Context);
        if (!(local_2.bInitialized))
        {
            return;
        }
        if (!(this.GetMovedEntity(Context, local_2).IsValid()))
        {
            local_3 = false;
        }
        else
        {
            Has local_16;
            local_3 = local_16.opCall();
        }
        if (local_3)
        {
            Remove local_22;
            local_22.opCall();
        }
        return;
    }
    const FESMViewSocketAlignInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMViewSocketAlignInstanceData __r;
        return __r;
    }
    FESMViewSocketAlignInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMViewSocketAlignInstanceData __r;
        return __r;
    }
    FTransform SampleCurveOffset(const FECSEntity &inout Entity) const
    {
        FNameHandle_EntityBBVarVector local_10;
        local_10;
        FVector local_16 = Entity.GetBB_Vector(local_10);
        local_10;
        FVector local_6 = Entity.GetBB_Vector(local_10);
        FQuat local_48 = FRotator::MakeFromEuler(local_6).Quaternion();
        return FTransform(local_48, local_16, FVector::OneVector);
    }
    FECSEntity GetMovedEntity(const FESMViewContext &inout Context, const FESMViewSocketAlignInstanceData &inout InstanceData) const
    {
        if (int(this.AlignMode) == 1)
        {
            return Context.GetEntity();
        }
        return InstanceData.TargetEntity;
    }
}


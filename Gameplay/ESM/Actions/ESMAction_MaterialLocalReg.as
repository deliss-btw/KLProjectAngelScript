

// NOTE: class defaults are not authored in this module: UESMAction_UpdateMaterialLocalReg (default scalar field UESMAction.ActionFilterType has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FESMUpdateMaterialLocalRegInstanceData
{
    UPROPERTY()
    TArray<bool> UpdateParamTriggerHistory;

    FESMUpdateMaterialLocalRegInstanceData()
    {
        return;
    }
}

class UESMAction_UpdateMaterialLocalReg : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool bAttachToEntity = false;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity AttachToEntity;
    UPROPERTY()
    TArray<FMaterialUpdateParam> UpdateParams;
    UPROPERTY()
    float32 BlendOutTime = 1.0f;
    UPROPERTY()
    FSoftObjectPath BlendOutCurve;


    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMUpdateMaterialLocalRegInstanceData);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(1);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        this.ModifyViewInstanceData(Context).UpdateParamTriggerHistory.SetNumZeroed(this.UpdateParams.Num());
        FECSEntity local_12 = this.GetDefaultEntity(Context);
        if (!(local_12.IsValid()))
        {
            return;
        }
        FECSEntity local_18 = local_12;
        if (this.bAttachToEntity)
        {
            local_18 = local_12.GetBB_Entity(this.AttachToEntity);
        }
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_8 = this.GetDefaultEntity(Context);
        if (!(local_8.IsValid()))
        {
            return;
        }
        FECSEntity local_14 = local_8;
        if (this.bAttachToEntity)
        {
            local_14 = local_8.GetBB_Entity(this.AttachToEntity);
        }
        FESMUpdateMaterialLocalRegInstanceData& local_16 = this.ModifyViewInstanceData(Context);
        int local_17 = 0;
        for (auto& local_32 : this.UpdateParams)
        {
            if (!(FGameAttributeUtils::GetAttributeValue(local_8, local_32.ListenAttribute, Time.WorldTime, false, 0.0f, false, FGameAttributeModificationValue()) < local_32.AttributeThreshold) && (!(local_16.UpdateParamTriggerHistory[local_17]) == !(false)))
            {
                local_16.UpdateParamTriggerHistory[local_17] = true;
                FName local_50 = FName((this.GetDataPathName().ToString() + local_17));
                ::FMaterialUtils::LocalOnlyRequestChangeMaterialParam(local_14, local_50, local_32.MaterialParams);
            }
            ++local_17;
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_8 = this.GetDefaultEntity(Context);
        if (!(local_8.IsValid()))
        {
            return;
        }
        FECSEntity local_14 = local_8;
        if (this.bAttachToEntity)
        {
            local_14 = local_8.GetBB_Entity(this.AttachToEntity);
        }
        int local_15 = 0;
        for (; local_15 <= this.UpdateParams.Num(); )
        {
            FName local_19 = FName((this.GetDataPathName().ToString() + local_15));
            ::FMaterialUtils::LocalOnlyRemoveChangeMaterialRequest(local_14, local_19, this.BlendOutTime, this.BlendOutCurve);
            ++local_15;
        }
        return;
    }
    const FESMUpdateMaterialLocalRegInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMUpdateMaterialLocalRegInstanceData __r;
        return __r;
    }
    FESMUpdateMaterialLocalRegInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMUpdateMaterialLocalRegInstanceData __r;
        return __r;
    }
    FECSEntity GetDefaultEntity(const FESMViewContext &inout Context) const
    {
        Get local_4;
        const FC_LocalToDefault& local_6 = local_4.opCall();
        if (local_6)
        {
            return FECSEntity(local_6.DefaultEntityId);
        }
        return ENTITY_NULL;
    }
}

class UESMAction_OverrideMaterialLocalReg : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    bool bAttachToEntity = false;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity AttachToEntity;
    UPROPERTY()
    TArray<FSingleMaterialParamRequestData> ChangeMaterialParam;
    UPROPERTY()
    float32 BlendInTime = 0.2f;
    UPROPERTY()
    FSoftObjectPath BlendInCurvePath;
    UPROPERTY()
    float32 BlendOutTime = 0.2f;
    UPROPERTY()
    FSoftObjectPath BlendOutCurvePath;
    UPROPERTY()
    TArray<FMeshMaterialInfo> MeshMaterialOverrides;


    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(1);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_8 = this.GetDefaultEntity(Context);
        if (!(local_8.IsValid()))
        {
            return;
        }
        FECSEntity local_14 = local_8;
        if (this.bAttachToEntity)
        {
            local_14 = local_8.GetBB_Entity(this.AttachToEntity);
        }
        FName local_16 = FName(this.GetDataPathName().ToString());
        ::FMaterialUtils::LocalOnlyRequestChangeMaterialParam(local_14, local_16, this.ChangeMaterialParam);
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_8 = this.GetDefaultEntity(Context);
        if (!(local_8.IsValid()))
        {
            return;
        }
        FECSEntity local_14 = local_8;
        if (this.bAttachToEntity)
        {
            local_14 = local_8.GetBB_Entity(this.AttachToEntity);
        }
        FName local_16 = FName(this.GetDataPathName().ToString());
        ::FMaterialUtils::LocalOnlyRemoveChangeMaterialRequest(local_14, local_16, this.BlendOutTime, this.BlendOutCurvePath);
        return;
    }
    FECSEntity GetDefaultEntity(const FESMViewContext &inout Context) const
    {
        Get local_4;
        const FC_LocalToDefault& local_6 = local_4.opCall();
        if (local_6)
        {
            return FECSEntity(local_6.DefaultEntityId);
        }
        return ENTITY_NULL;
    }
}

class UESMAction_ShowMaterialSectionLocalReg : UESMBPBaseSpanAction
{
    UPROPERTY()
    TArray<FShowMaterialSectionSingleRequest> MaterialSections;

    UESMAction_ShowMaterialSectionLocalReg()
    {
        return;
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(1);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_8 = this.GetDefaultEntity(Context);
        if (!(local_8.IsValid()))
        {
            return;
        }
        ::FMaterialUtils::RequestShowMaterialSection(local_8, this.GetDataPathName(), this.MaterialSections);
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_8 = this.GetDefaultEntity(Context);
        if (!(local_8.IsValid()))
        {
            return;
        }
        ::FMaterialUtils::RemoveShowMaterialSectionRequest(local_8, this.GetDataPathName());
        return;
    }
    FECSEntity GetDefaultEntity(const FESMViewContext &inout Context) const
    {
        Get local_4;
        const FC_LocalToDefault& local_6 = local_4.opCall();
        if (local_6)
        {
            return FECSEntity(local_6.DefaultEntityId);
        }
        return ENTITY_NULL;
    }
}

struct FESMMaterialAnimCurveLocalRegInstanceData
{
    UPROPERTY()
    TMap<FName, float32> InterpoValues;

    FESMMaterialAnimCurveLocalRegInstanceData()
    {
        return;
    }
}

class UESMAction_MaterialAnimCurveLocalReg : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FName LogicName = n"ViewMesh";
    UPROPERTY()
    FMaterialAnimCurve AnimCurve;

    UESMAction_MaterialAnimCurveLocalReg()
    {
        return;
    }
    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMMaterialAnimCurveLocalRegInstanceData);
    }
    UFUNCTION()
    int GetActionPriority_Implementation() const
    {
        return 1;
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
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
        FECSEntity local_8 = this.GetDefaultEntity(Context);
        if (!(local_8.IsValid()))
        {
            return;
        }
        this.AnimCurve.ApplyValue(local_8, this.LogicName);
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_8 = this.GetDefaultEntity(Context);
        if (!(local_8.IsValid()))
        {
            return;
        }
        this.AnimCurve.ApplyValue(local_8, this.LogicName);
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_8 = this.GetDefaultEntity(Context);
        if (!(local_8.IsValid()))
        {
            return;
        }
        this.AnimCurve.Update(local_8, this.LogicName, Time.ActionTime.ToSeconds(), Time.WorldTime, float32(Time.StateDeltaTime.ToSeconds()), this.ModifyViewInstanceData(Context).InterpoValues);
        return;
    }
    const FESMMaterialAnimCurveLocalRegInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMMaterialAnimCurveLocalRegInstanceData __r;
        return __r;
    }
    FESMMaterialAnimCurveLocalRegInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMMaterialAnimCurveLocalRegInstanceData __r;
        return __r;
    }
    FECSEntity GetDefaultEntity(const FESMViewContext &inout Context) const
    {
        Get local_4;
        const FC_LocalToDefault& local_6 = local_4.opCall();
        if (local_6)
        {
            return FECSEntity(local_6.DefaultEntityId);
        }
        return ENTITY_NULL;
    }
}


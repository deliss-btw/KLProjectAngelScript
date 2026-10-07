
enum EMaterialUpdateType
{
    Float,
    Color,
}


struct FMaterialUpdateParam
{
    UPROPERTY()
    FGameAttributeRef ListenAttribute;
    UPROPERTY()
    float32 AttributeThreshold;
    UPROPERTY()
    TArray<FSingleMaterialParamRequestData> MaterialParams;


}

struct FESMUpdateMaterialInstanceData
{
    UPROPERTY()
    TArray<bool> UpdateParamTriggerHistory;

    FESMUpdateMaterialInstanceData()
    {
        return;
    }
}

class UESMAction_UpdateMaterial : UESMBPBaseSpanTickAction
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
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMUpdateMaterialInstanceData);
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
        FECSEntity local_8 = Context.GetEntity();
        if (this.bAttachToEntity)
        {
            local_8 = Context.GetEntity().GetBB_Entity(this.AttachToEntity);
        }
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        FECSEntity local_6 = Context.GetEntity();
        if (this.bAttachToEntity)
        {
            local_6 = Context.GetEntity().GetBB_Entity(this.AttachToEntity);
        }
        FESMUpdateMaterialInstanceData& local_14 = this.ModifyViewInstanceData(Context);
        int local_15 = 0;
        for (auto& local_30 : this.UpdateParams)
        {
            if (!(FGameAttributeUtils::GetAttributeValue(local_2, local_30.ListenAttribute, Time.WorldTime, false, 0.0f, false, FGameAttributeModificationValue()) < local_30.AttributeThreshold) && (!(local_14.UpdateParamTriggerHistory[local_15]) == !(false)))
            {
                local_14.UpdateParamTriggerHistory[local_15] = true;
                FName local_48 = FName((this.GetDataPathName().ToString() + local_15));
                ::FMaterialUtils::LocalOnlyRequestChangeMaterialParam(local_6, local_48, local_30.MaterialParams);
            }
            ++local_15;
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_4 = Context.GetEntity();
        if (this.bAttachToEntity)
        {
            local_4 = Context.GetEntity().GetBB_Entity(this.AttachToEntity);
        }
        int local_11 = 0;
        for (; local_11 <= this.UpdateParams.Num(); )
        {
            FName local_15 = FName((this.GetDataPathName().ToString() + local_11));
            ::FMaterialUtils::LocalOnlyRemoveChangeMaterialRequest(local_4, local_15, this.BlendOutTime, this.BlendOutCurve);
            ++local_11;
        }
        return;
    }
    const FESMUpdateMaterialInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMUpdateMaterialInstanceData __r;
        return __r;
    }
    FESMUpdateMaterialInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMUpdateMaterialInstanceData __r;
        return __r;
    }
}

class UESMAction_OverrideMaterial : UESMBPBaseSpanTickAction
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
        return EESMActionType(3);
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
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_4 = Context.GetEntity();
        if (this.bAttachToEntity)
        {
            local_4 = Context.GetEntity().GetBB_Entity(this.AttachToEntity);
        }
        FName local_12 = FName(this.GetDataPathName().ToString());
        ::FMaterialUtils::SyncRequestChangeMaterialParam(local_4, local_12, this.ChangeMaterialParam);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_4 = Context.GetEntity();
        if (this.bAttachToEntity)
        {
            local_4 = Context.GetEntity().GetBB_Entity(this.AttachToEntity);
        }
        FName local_12 = FName(this.GetDataPathName().ToString());
        ::FMaterialUtils::SyncRemoveChangeMaterialRequest(local_4, local_12, this.BlendOutTime, this.BlendOutCurvePath);
        return;
    }
}

class UESMAction_ShowMaterialSection : UESMBPBaseSpanAction
{
    UPROPERTY()
    TArray<FShowMaterialSectionSingleRequest> MaterialSections;

    UESMAction_ShowMaterialSection()
    {
        return;
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
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::FMaterialUtils::RequestShowMaterialSection(Context.GetEntity(), this.GetDataPathName(), this.MaterialSections);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        ::FMaterialUtils::RemoveShowMaterialSectionRequest(Context.GetEntity(), this.GetDataPathName());
        return;
    }
}

struct FESMMaterialAnimCurveInstanceData
{
    UPROPERTY()
    TMap<FName, float32> InterpoValues;

    FESMMaterialAnimCurveInstanceData()
    {
        return;
    }
}

class UESMAction_MaterialAnimCurve : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FName LogicName = n"ViewMesh";
    UPROPERTY()
    FMaterialAnimCurve AnimCurve;

    UESMAction_MaterialAnimCurve()
    {
        return;
    }
    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMMaterialAnimCurveInstanceData);
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
        this.AnimCurve.ApplyValue(Context.GetEntity(), this.LogicName);
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        this.AnimCurve.ApplyValue(Context.GetEntity(), this.LogicName);
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        this.AnimCurve.Update(Context.GetEntity(), this.LogicName, Time.ActionTime.ToSeconds(), Time.WorldTime, float32(Time.StateDeltaTime.ToSeconds()), this.ModifyViewInstanceData(Context).InterpoValues);
        return;
    }
    const FESMMaterialAnimCurveInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMMaterialAnimCurveInstanceData __r;
        return __r;
    }
    FESMMaterialAnimCurveInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMMaterialAnimCurveInstanceData __r;
        return __r;
    }
}


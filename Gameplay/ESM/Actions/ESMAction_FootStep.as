
const FConsoleVariable CVar_FootStep_EnableDebugDraw = FConsoleVariable();

class UESMAction_InstantFootStep : UESMSFXBaseInstantAction
{
    UPROPERTY()
    float32 TraceLengthForSurfaceDetection = 150.0f;
    UPROPERTY()
    FAttachRefName TraceSocketName;
    UPROPERTY()
    FVector TraceStartOffset = FVector(0.0, 0.0, 20.0);
    UPROPERTY()
    FVector TraceDir = FVector::DownVector;
    UPROPERTY()
    ELandedStrength StepStrengthLevel = ELandedStrength(0);
    UPROPERTY()
    EImpactRotationType ImpactRotationType = EImpactRotationType(0);
    UPROPERTY()
    float32 VFXDelay = 0.0f;
    UPROPERTY()
    float32 SFXDelay = 0.0f;
    UPROPERTY()
    FName RootBoneName = n"Rider_Point";
    UPROPERTY()
    uint8 ImpactFeedbackType = (3 != 0);


    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(2);
    }
    UFUNCTION()
    void ViewDo_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_32 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        if (::FASCommonUtils::IsMonsterPrefab(local_2))
        {
            return;
        }
        int local_7 = this.ImpactFeedbackType & 1;
        if (local_7 != 0)
        {
            FECSWorldPtr local_10 = Context.GetECSWorld();
            FFPTime local_30 = (FFPTime(Time.WorldTime) + FFPTime(this.VFXDelay));
            FECSWorldPtr local_10_2 = Context.GetECSWorld();
            local_32.EntityLandedInfo.SetImpactEventType(EImpactEventType(1));
            this.FillLandedEventData(local_2, local_32);
        }
        int local_8 = this.ImpactFeedbackType & 2;
        if (local_8 != 0)
        {
            FFPTime local_30_2 = (FFPTime(Time.WorldTime) + FFPTime(this.SFXDelay));
            FECSWorldPtr local_10_3 = Context.GetECSWorld();
            local_32.EntityLandedInfo.SetImpactEventType(EImpactEventType(2));
            this.FillLandedEventData(local_2, local_32);
        }
        if (Context.GetECSRuntime().IsClient)
        {
            FString local_38 = ((FString("Client Entity ") + local_2.GetEntityName()) + "FootStep VFXDelay: ");
            XLogIf(CVar_FootStep_EnableDebugDraw.GetBool(), ELog(1), (local_38 + this.VFXDelay));
            FString local_44_2 = (FString("Client Entity ") + local_2.GetEntityName());
            FString local_38_2 = (local_44_2 + "FootStep SFXDelay: ");
            XLogIf(CVar_FootStep_EnableDebugDraw.GetBool(), ELog(1), (local_38_2 + this.SFXDelay));
            return;
        }
        FString local_44_3 = (FString("Server Entity ") + local_2.GetEntityName());
        FString local_38_3 = (local_44_3 + "FootStep VFXDelay:");
        XLogIf(CVar_FootStep_EnableDebugDraw.GetBool(), ELog(1), (local_38_3 + this.VFXDelay));
        FString local_44_4 = (FString("Server Entity ") + local_2.GetEntityName());
        FString local_38_4 = (local_44_4 + "FootStep SFXDelay:");
        XLogIf(CVar_FootStep_EnableDebugDraw.GetBool(), ELog(1), (local_38_4 + this.SFXDelay));
        return;
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void PreviewBegin_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time, const bool bNewlyBegin)
    {
        if (Context.GetbPlaying() == false)
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        return;
    }
    void FillLandedEventData(const FECSEntity &inout Entity, FCE_EntityLandedEvent &inout LandedEvent) const
    {
        int local_10 = 0;
        LandedEvent.EntityLandedInfo.SetTraceLength(this.TraceLengthForSurfaceDetection);
        LandedEvent.EntityLandedInfo.SetImpactRotationType(this.ImpactRotationType);
        LandedEvent.EntityLandedInfo.SetAttachName(this.TraceSocketName.Name);
        LandedEvent.EntityLandedInfo.SetRootBoneName(this.RootBoneName);
        LandedEvent.EntityLandedInfo.SetTraceStartOffset(this.TraceStartOffset);
        LandedEvent.EntityLandedInfo.SetTraceDir(FVector::DownVector);
        float32 local_1 = ::FPhysicsUtils::GetMass(Entity);
        FVector local_16(local_10.GetVelocity());
        FVector local_36 = FVector((local_1 * local_16.X), (local_1 * local_16.Y), (local_1 * local_16.Z));
        LandedEvent.EntityLandedInfo.SetVelocity(local_16);
        LandedEvent.EntityLandedInfo.SetEntityMass(local_1);
        LandedEvent.EntityLandedInfo.SetLandedStrength(local_36);
        LandedEvent.EntityLandedInfo.SetbUseLandedStrengthLevelDirectly(true);
        LandedEvent.EntityLandedInfo.SetLandedStrengthLevel(this.StepStrengthLevel);
        LandedEvent.EntityLandedInfo.SetbDurational(false);
        int local_39 = 0;
        LandedEvent.EntityLandedInfo.SetCharacterSize(EPrefabSize(local_39));
        if (::GetPrefabConfigPtr(Entity))
        {
            LandedEvent.EntityLandedInfo.SetCharacterSize(EPrefabSize(local_39));
        }
        return;
    }
}

class UESMAction_ActionImpactFX : UESMSFXBaseInstantAction
{
    UPROPERTY()
    float32 TraceLengthForSurfaceDetection = 150.0f;
    UPROPERTY()
    FAttachRefName TraceSocketName;
    UPROPERTY()
    FVector TraceStartOffset = FVector::ZeroVector;
    UPROPERTY()
    FVector TraceDir = FVector::DownVector;
    UPROPERTY()
    EActionImpactType ActionImpactType = EActionImpactType(0);
    UPROPERTY()
    EImpactRotationType ImpactRotationType = EImpactRotationType(0);
    UPROPERTY()
    float32 VFXDelay = 0.0f;
    UPROPERTY()
    float32 SFXDelay = 0.0f;
    UPROPERTY()
    FName RootBoneName = n"Rider_Point";
    UPROPERTY()
    uint8 ImpactFeedbackType = (3 != 0);


    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(2);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewDo_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_32 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        FECSWorldPtr local_4 = Context.GetECSWorld();
        int local_14 = this.ImpactFeedbackType & 1;
        if (local_14 != 0)
        {
            FFPTime local_30 = (FFPTime(Time.WorldTime) + FFPTime(this.VFXDelay));
            FECSWorldPtr local_4_2 = Context.GetECSWorld();
            local_32.EntityLandedInfo.SetImpactEventType(EImpactEventType(1));
            this.FillLandedEventData(local_2, local_32);
        }
        int local_14_2 = this.ImpactFeedbackType & 2;
        if (local_14_2 != 0)
        {
            FFPTime local_30_2 = (FFPTime(Time.WorldTime) + FFPTime(this.SFXDelay));
            FECSWorldPtr local_4_3 = Context.GetECSWorld();
            local_32.EntityLandedInfo.SetImpactEventType(EImpactEventType(2));
            this.FillLandedEventData(local_2, local_32);
        }
        if (Context.GetECSRuntime().IsClient)
        {
            FString local_38 = ((FString("Client Entity ") + local_2.GetEntityName()) + "FootStep VFXDelay: ");
            XLogIf(CVar_FootStep_EnableDebugDraw.GetBool(), ELog(1), (local_38 + this.VFXDelay));
            FString local_44_2 = (FString("Client Entity ") + local_2.GetEntityName());
            FString local_38_2 = (local_44_2 + "FootStep SFXDelay: ");
            XLogIf(CVar_FootStep_EnableDebugDraw.GetBool(), ELog(1), (local_38_2 + this.SFXDelay));
            return;
        }
        FString local_44_3 = (FString("Client Entity ") + local_2.GetEntityName());
        FString local_38_3 = (local_44_3 + "FootStep VFXDelay: ");
        XLogIf(CVar_FootStep_EnableDebugDraw.GetBool(), ELog(1), (local_38_3 + this.VFXDelay));
        FString local_44_4 = (FString("Client Entity ") + local_2.GetEntityName());
        FString local_38_4 = (local_44_4 + "FootStep SFXDelay: ");
        XLogIf(CVar_FootStep_EnableDebugDraw.GetBool(), ELog(1), (local_38_4 + this.SFXDelay));
        return;
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void PreviewBegin_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time, const bool bNewlyBegin)
    {
        if (Context.GetbPlaying() == false)
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        return;
    }
    void FillLandedEventData(const FECSEntity &inout Entity, FCE_EntityLandedEvent &inout LandedEvent) const
    {
        int local_10 = 0;
        LandedEvent.EntityLandedInfo.SetTraceLength(this.TraceLengthForSurfaceDetection);
        LandedEvent.EntityLandedInfo.SetImpactRotationType(this.ImpactRotationType);
        LandedEvent.EntityLandedInfo.SetAttachName(this.TraceSocketName.Name);
        LandedEvent.EntityLandedInfo.SetRootBoneName(this.RootBoneName);
        LandedEvent.EntityLandedInfo.SetTraceStartOffset(this.TraceStartOffset);
        LandedEvent.EntityLandedInfo.SetTraceDir(FVector::DownVector);
        float32 local_1 = ::FPhysicsUtils::GetMass(Entity);
        FVector local_16(local_10.GetVelocity());
        FVector local_36 = FVector((local_1 * local_16.X), (local_1 * local_16.Y), (local_1 * local_16.Z));
        LandedEvent.EntityLandedInfo.SetVelocity(local_16);
        LandedEvent.EntityLandedInfo.SetEntityMass(local_1);
        LandedEvent.EntityLandedInfo.SetActionImpactType(this.ActionImpactType);
        LandedEvent.EntityLandedInfo.SetbDurational(false);
        int local_39 = 0;
        LandedEvent.EntityLandedInfo.SetCharacterSize(EPrefabSize(local_39));
        if (::GetPrefabConfigPtr(Entity))
        {
            LandedEvent.EntityLandedInfo.SetCharacterSize(EPrefabSize(local_39));
        }
        return;
    }
}


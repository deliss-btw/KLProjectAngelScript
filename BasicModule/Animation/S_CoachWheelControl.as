

class US_CoachWheelControlSystemAS : UECSScriptSystem
{
    US_CoachWheelControlSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Monitor_EnsureControlRigInit(const FECSEntity &inout Entity, const FC_CoachWheelControl &inout CoachWheelControl) const
    {
        const AActor local_4;
        local_4 = Entity.GetActor();
        if ((!((local_4 != nullptr))))
        {
            return;
        }
        UControlRigComponent local_10 = Cast<UControlRigComponent>(local_4.GetComponentByClass(UControlRigComponent));
        if (local_10 != nullptr)
        {
            local_10.Initialize();
            FC_CoachWheelControl local_16;
            local_16.bControlRigReady = true;
        }
        return;
    }
    UFUNCTION()
    void Job_CoachWheelControl(const FECSEntity &inout Entity, FC_CoachWheelControl &inout CoachWheelControl, const FC_Transform &inout TransformComp) const
    {
        const AActor local_6;
        float32 local_73;
        float32 local_137;
        if (!(CoachWheelControl.bControlRigReady))
        {
            return;
        }
        local_6 = Entity.GetActor();
        if ((!((local_6 != nullptr))))
        {
            return;
        }
        UControlRigComponent local_10 = Cast<UControlRigComponent>(local_6.GetComponentByClass(UControlRigComponent));
        if (local_10 != nullptr)
        {
            FTransform local_60 = TransformComp.ToFTransform();
            int local_61 = 0;
            while (local_61 < 0)
            {
                FName local_65 = CoachWheelControl.WheelData[local_61].WheelCtrlName;
                FVector local_72 = CoachWheelControl.WheelData[local_61].LocationOffset;
                local_73 = CoachWheelControl.WheelData[local_61].WheelRadius;
                FTransform local_100 = FTransform(local_10.GetRelativeTransform());
                FVector local_112 = (local_100 * CoachWheelControl.LastTransform).TransformPosition(local_72);
                FVector local_106 = (local_100 * local_60).TransformPosition(local_72);
                FVector local_118 = (local_106 - local_112);
                float32 local_74 = float32((local_118.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector).DotProduct(FVector(local_60.Rotator().GetForwardVector()).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector))));
                local_137 = float32((((local_112.Distance(local_106) / local_73) / 3.1415927410125732) * 180.0));
                if (local_74 > 0.0f)
                {
                    float32 local_147 = -local_137;
                    local_137 = local_147;
                }
                local_10.GetControlRotator(local_65, EControlRigComponentSpace(4)).Quaternion();
                EControlRigComponentSpace local_176;
                FQuat local_192 = (local_176 * FRotator(local_137, 0.0, 0.0).Quaternion());
                FECSActorComponentProxy local_198 = Entity.ModifyActorComponent(local_10.GetFName());
                ModifyOrAdd local_206;
                local_206.opCall().SetControlRotator(local_65, local_192.Rotator(), EControlRigComponentSpace(4));
                ++local_61;
            }
            CoachWheelControl.LastTransform = local_60;
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_EnsureControlRigInit() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCoachWheelControlOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_EnsureControlRigInit(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CoachWheelControl() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        MarkModifiedIfDirty local_52;
        int local_180 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_CoachWheelControl(local_36, local_38, local_44);
                local_52.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_90.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_CoachWheelControl(local_180, local_38, local_44);
            local_52.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


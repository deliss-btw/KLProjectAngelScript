

class US_TurretSystem : UECSScriptSystem
{
    US_TurretSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_UpdateTurretMeshPresentation(const FECSEntity &inout Entity, const FC_TurretConfig &inout TurretConfig, const FC_PropManipulated &inout Manipulated) const
    {
        FRotator local_6;
        AGameActor local_12 = (Cast<AGameActor>(Entity.GetActor()));
        if ((!((local_12 != nullptr))))
        {
            return;
        }
        Has local_18;
        bool local_13 = local_18.opCall();
        if (local_13)
        {
            FECSWorldPtr local_20 = ECS::GetECSWorld();
            Get local_24;
            local_6 = local_24.opCall().ViewDir;
            local_6 -= local_12.GetActorRotation();
        }
        else
        {
            if (FECSEntity(Manipulated.GetManipulatorPawnEntity()).IsValid())
            {
                Get local_44;
                const FC_AnimAimTargetControl& local_46 = local_44.opCall();
                if (local_46)
                {
                    local_6 = local_46.GetAimTarget().Rotation();
                }
            }
        }
        if (int(TurretConfig.TurretMeshType) == 0)
        {
            TArray<USceneComponent> local_54 = local_12.GetCachedSceneComponentByLogicName(TurretConfig.YawAxisMeshLogicName);
            if (local_54.Num() > 0)
            {
                for (auto local_72 : local_54)
                {
                    FRotator local_30 = local_72.GetRelativeRotation();
                    Entity.ModifyActorComponent(local_72.GetFName()).ModifyTransform().SetRotation(FRotator(local_30.Pitch, local_6.Yaw, local_30.Roll).Quaternion());
                }
            }
            TArray<USceneComponent> local_58 = local_12.GetCachedSceneComponentByLogicName(TurretConfig.PitchAxisMeshLogicName);
            if (local_58.Num() > 0)
            {
                for (auto local_72 : local_58)
                {
                    FRotator local_78 = local_72.GetRelativeRotation();
                    Entity.ModifyActorComponent(local_72.GetFName()).ModifyTransform().SetRotation(FRotator(local_78.Pitch, local_78.Yaw, local_6.Pitch).Quaternion());
                }
            }
            return;
        }
        UControlRigComponent local_116 = Cast<UControlRigComponent>(local_12.GetComponentByClass(UControlRigComponent));
        if (local_116 != nullptr)
        {
            FRotator local_30_2 = FRotator(0.0, local_6.Yaw, 0.0);
            FRotator local_84 = FRotator(local_6.Pitch, 0.0, 0.0);
            local_116.SetControlRotator(TurretConfig.YawAxisBoneName, local_30_2, EControlRigComponentSpace(4));
            local_116.SetControlRotator(TurretConfig.PitchAxisBoneName, local_84, EControlRigComponentSpace(4));
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateManipulatorEntityTransform(const FC_DefaultAttachComponentMeshSpaceTransform &inout DefaultAttachComponentMeshSpaceTransformComp, const FC_TurretAttachmentConfig &inout TurretAttachmentConfig, const FC_PropManipulated &inout TurretManipulated, const FECSEntity &inout Entity) const
    {
        int local_6 = 0;
        int local_12 = 0;
        bool local_13;
        if (!(local_6))
        {
            local_13 = false;
        }
        else
        {
            local_13 = local_12;
        }
        local_13 = local_13 && local_12.GetbDataValid();
        if (local_13)
        {
            Get local_60;
            FRotator local_32 = FRotator(0.0, local_12.GetAimTarget().Rotation().Yaw, 0.0);
            local_6.SetLocationOffset((DefaultAttachComponentMeshSpaceTransformComp.Transform.GetLocation() + local_32.RotateVector(TurretAttachmentConfig.AttachConfig.GetLocationOffset())));
            FECSDebugDraw::DrawDebugLine(n"TurretAttachment", local_60.opCall().GetPosition(), (FVector(local_60.opCall().GetPosition()) + DefaultAttachComponentMeshSpaceTransformComp.Transform.GetLocation()), FColor::Red, FColor::Black, 0.0f, uint8(1), 1.0f);
            FVector local_50 = ((FVector(local_60.opCall().GetPosition()) + DefaultAttachComponentMeshSpaceTransformComp.Transform.GetLocation()) + local_32.RotateVector(TurretAttachmentConfig.AttachConfig.GetLocationOffset()));
            FECSDebugDraw::DrawDebugLine(n"TurretAttachment", (FVector(local_60.opCall().GetPosition()) + DefaultAttachComponentMeshSpaceTransformComp.Transform.GetLocation()), local_50, FColor::Blue, FColor::Black, 0.0f, uint8(1), 1.0f);
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateTurretManipulatorCameraYawLimit(const FECSEntity &inout Entity, FC_TPCameraYawLimitRelativeTo &inout TPCameraYawLimitRelativeTo, const FC_PropManipulator &inout PropManipulator, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_5;
        if (!(FECSEntity(PropManipulator.GetManipulatedPropEntity()).IsValid()))
        {
            local_5 = false;
        }
        else
        {
            Has local_10;
            local_5 = local_10.opCall();
        }
        if (local_5)
        {
            Get local_16;
            const FC_Transform& local_18 = local_16.opCall();
            if (local_18)
            {
                TPCameraYawLimitRelativeTo.SetYaw(FMathUtils::LerpDegree(TPCameraYawLimitRelativeTo.GetYaw(), float32(local_18.GetRotation().Rotator().Yaw), 0.05f));
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_UpdateTurretMeshPresentation() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_172 = 0;
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
                this.ClientJob_UpdateTurretMeshPresentation(local_36, local_38, local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Exclude(local_86).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_100 = 0;
        FECSRuntimeViewIterator local_134 = local_86.Iterator();
        for (; local_134.CanProceed;)
        {
            local_36 = local_134.Proceed();
            ++local_100;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_UpdateTurretMeshPresentation(local_172, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_100);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateManipulatorEntityTransform() const
    {
        int local_36 = 0;
        int local_42 = 0;
        int local_48 = 0;
        const FECSEntity& local_54;
        int local_186 = 0;
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
                this.Job_UpdateManipulatorEntityTransform(local_36, local_42, local_48, local_54);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_92 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_92).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_92.Iterator();
        for (; local_148.CanProceed;)
        {
            local_54 = local_148.Proceed();
            ++local_114;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_54.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_54);
            this.Job_UpdateManipulatorEntityTransform(local_36, local_42, local_48, local_186);
        }
        local_2.UpdateCachedEntityCount(local_114);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateTurretManipulatorCameraYawLimit() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_184 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdateTurretManipulatorCameraYawLimit(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_TPCameraYawLimitRelativeTo> local_56;
                local_56.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateTurretManipulatorCameraYawLimit(local_184, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_TPCameraYawLimitRelativeTo>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}


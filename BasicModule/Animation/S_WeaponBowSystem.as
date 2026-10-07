

class US_WeaponBowLineSystemAS : UECSScriptSystem
{
    US_WeaponBowLineSystemAS()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Job_WeaponBowLine(const FECSEntity &inout Entity, const FC_Owner &inout OwnerComp, const FC_WeaponBowLine &inout WeaponBowLine) const
    {
        const AActor local_18;
        int local_48 = 0;
        FName local_2(WeaponBowLine.GetTargetSocketName());
        FECSEntity local_8 = FECSEntity(OwnerComp.GetOwnerEntity());
        if (local_8)
        {
            local_18 = local_8.GetActor();
            if (local_18 != nullptr)
            {
                USkeletalMeshComponent local_22 = Cast<USkeletalMeshComponent>(local_18.GetComponentByClass(USkeletalMeshComponent));
                if ((!((local_22.GetSocketBoneName(local_2) == NAME_None))))
                {
                    FECSActorProxy local_26 = Entity.ModifyActor();
                    FName local_4 = local_26.GetComponentNameByClass(UControlRigComponent);
                    if (!(local_4.IsNone()))
                    {
                        FECSActorComponentProxy local_38 = Entity.ModifyActorComponent(local_4);
                        if (WeaponBowLine.GetAttachBowLine())
                        {
                            FVector local_54 = local_26.GetActor().GetActorTransform().InverseTransformPosition(local_22.GetSocketLocation(local_2));
                            local_48.SetControlPosition(WeaponBowLine.GetControlName(), local_54, EControlRigComponentSpace(2));
                        }
                        else
                        {
                            local_48.SetControlPosition(WeaponBowLine.GetControlName(), FVector(0.0, 0.0, 0.0), EControlRigComponentSpace(4));
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Monitor_EnsureBowControlRigInit(const FECSEntity &inout Entity, const FC_WeaponBowLineSelf &inout WeaponBowLine) const
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
        }
        return;
    }
    UFUNCTION()
    void Job_WeaponBowLineSelf(const FECSEntity &inout Entity, const FC_WeaponBowLineSelf &inout WeaponBowLine) const
    {
        const AActor local_4;
        int local_34 = 0;
        local_4 = Entity.GetActor();
        if ((!((local_4 != nullptr))))
        {
            return;
        }
        AGameCharacterActor local_10 = (Cast<AGameCharacterActor>(local_4));
        if (local_10 == nullptr)
        {
            return;
        }
        USkeletalMeshComponent local_12 = local_10.ViewMesh;
        if (local_12 == nullptr)
        {
            return;
        }
        if ((local_12.GetSocketBoneName(WeaponBowLine.GetTargetSocketName()) == NAME_None))
        {
            return;
        }
        UControlRigComponent local_20 = Cast<UControlRigComponent>(local_4.GetComponentByClass(UControlRigComponent));
        if (local_20 == nullptr)
        {
            return;
        }
        FECSActorComponentProxy local_24 = Entity.ModifyActorComponent(local_20.GetFName());
        if (WeaponBowLine.GetAttachBowLine())
        {
            FVector local_40 = local_20.GetWorldTransform().InverseTransformPosition(local_12.GetSocketLocation(WeaponBowLine.GetTargetSocketName()));
            local_34.SetControlPosition(WeaponBowLine.GetControlName(), local_40, EControlRigComponentSpace(2));
        }
        else
        {
            local_34.SetControlPosition(WeaponBowLine.GetControlName(), FVector(0.0, 0.0, 0.0), EControlRigComponentSpace(4));
        }
        return;
    }
    UFUNCTION()
    void Run_Job_WeaponBowLine() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_176 = 0;
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
                this.Job_WeaponBowLine(local_36, local_38, local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Exclude(local_86).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_86.Iterator();
        for (; local_138.CanProceed;)
        {
            local_36 = local_138.Proceed();
            ++local_104;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_WeaponBowLine(local_176, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_EnsureBowControlRigInit() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorWeaponBowLineSelfOnAssignView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_EnsureBowControlRigInit(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_WeaponBowLineSelf() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
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
                this.Job_WeaponBowLineSelf(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_WeaponBowLineSelf(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}


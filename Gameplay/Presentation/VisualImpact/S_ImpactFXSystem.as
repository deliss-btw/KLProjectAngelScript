
const FConsoleVariable CVar_Impact_EnableDebugDraw = FConsoleVariable();
const FConsoleVariable CVar_LandedImpact_EnableDebugDraw = FConsoleVariable();
const FConsoleVariable CVar_LandedImpact_PrintLogToScreen = FConsoleVariable();
const FConsoleVariable CVar_SurfaceContact_EnableDebugDraw = FConsoleVariable();
const FConsoleVariable CVar_SurfaceContact_PrintLogToScreen = FConsoleVariable();
const FConsoleVariable CVar_LandedImpactCheck_Enable = FConsoleVariable();
const FConsoleVariable CVar_Impact_ImpactFxDetachTime = FConsoleVariable();

class US_ImpactFXSystem : UECSScriptSystem
{
    US_ImpactFXSystem()
    {
        return;
    }
    UFUNCTION()
    void Init_Implementation()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleLandedEffect(const FCE_EntityLandedEvent &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            XLog(ELog(0), FString().Append("Job_HandleLandedEffect Event sender is not valid. CharacterSize:").Append(int(Event.EntityLandedInfo.GetCharacterSize())).Append(", AttachName:").Append(Event.EntityLandedInfo.GetAttachName()));
            return;
        }
        ::FImpactFXUtils::HandleEntityLandedEffect(Event.Sender, Event.EntityLandedInfo, Event.Time, CVar_LandedImpact_EnableDebugDraw.GetBool(), CVar_LandedImpact_PrintLogToScreen.GetBool());
        return;
    }
    UFUNCTION()
    void Job_HandleLandedSound(const FCE_EntityLandedEvent &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            XLog(ELog(0), FString().Append("Job_HandleLandedSound Event sender is not valid. CharacterSize:").Append(int(Event.EntityLandedInfo.GetCharacterSize())).Append(", AttachName:").Append(Event.EntityLandedInfo.GetAttachName()));
            return;
        }
        ::FImpactFXUtils::HandleEntityLandedSound(Event.Sender, Event.EntityLandedInfo, CVar_LandedImpact_EnableDebugDraw.GetBool(), CVar_LandedImpact_PrintLogToScreen.GetBool());
        return;
    }
    UFUNCTION()
    void Job_HandleLandedEffectWithSync(const FCE_EntityLandedEventWithSync &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            XLog(ELog(0), FString().Append("Job_HandleLandedEffectWithSync Event sender is not valid. CharacterSize:").Append(int(Event.EntityLandedInfo.GetCharacterSize())).Append(", AttachName:").Append(Event.EntityLandedInfo.GetAttachName()));
            return;
        }
        ::FImpactFXUtils::HandleEntityLandedEffect(Event.Sender, Event.EntityLandedInfo, Event.Time, CVar_LandedImpact_EnableDebugDraw.GetBool(), CVar_LandedImpact_PrintLogToScreen.GetBool());
        return;
    }
    UFUNCTION()
    void Job_HandleLandedSoundWithSync(const FCE_EntityLandedEventWithSync &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            XLog(ELog(0), FString().Append("Job_HandleLandedSoundWithSync Event sender is not valid. CharacterSize:").Append(int(Event.EntityLandedInfo.GetCharacterSize())).Append(", AttachName:").Append(Event.EntityLandedInfo.GetAttachName()));
            return;
        }
        ::FImpactFXUtils::HandleEntityLandedSound(Event.Sender, Event.EntityLandedInfo, CVar_LandedImpact_EnableDebugDraw.GetBool(), CVar_LandedImpact_PrintLogToScreen.GetBool());
        return;
    }
    UFUNCTION()
    void Job_HandleSurfaceContactEffect(const FCE_SurfaceContactEvent &inout Event) const
    {
        if (!(Event.Sender.IsValid()))
        {
            XLog(ELog(0), FString().Append("Job_HandleSurfaceContactEffect Event sender is not valid. CharacterSize:").Append(int(Event.SurfaceContactInfo.GetCharacterSize())).Append(", AttachName:").Append(Event.SurfaceContactInfo.GetSocketName().Name));
            return;
        }
        ::FImpactFXUtils::HandleSurfaceContactEffect(Event.Sender, Event.SurfaceContactInfo, Event.Time, CVar_SurfaceContact_EnableDebugDraw.GetBool(), CVar_SurfaceContact_PrintLogToScreen.GetBool());
        return;
    }
    UFUNCTION()
    void Job_HandleCleanupWeaponDraggingFX(const FCE_CleanupWeaponDraggingFX &inout Event) const
    {
        int local_10 = 0;
        int local_20 = 0;
        AActor local_22;
        if (!(Event.Sender.IsValid()))
        {
            XLog(ELog(0), FString().Append("Job_HandleCleanupWeaponDraggingFX Event sender is not valid."));
            return;
        }
        Has local_14;
        bool local_1 = local_14.opCall();
        if (local_1)
        {
            local_22 = local_20.FxActor;
            if (local_22 != nullptr)
            {
                local_20.FxActor.DetachFromActor(EDetachmentRule(0), EDetachmentRule(0), EDetachmentRule(0));
                local_20.FxActor.DestroyActor();
            }
            if (local_20.FxEntity.IsValid())
            {
                ::FFXUtils::StopFX(local_20.FxEntity, false);
            }
            local_20.ClearAllFX();
            XLogIf(CVar_SurfaceContact_EnableDebugDraw.GetBool(), ELog(0), FString().Append("Cleaned up weapon dragging FX for entity: ").Append(local_10.GetEntityName()));
        }
        return;
    }
    UFUNCTION()
    void Job_HandleSyncImpact(const FCE_SyncImpactFXEvent &inout Event) const
    {
        return;
    }
    UFUNCTION()
    void Job_HandleImpactEffect(const FCE_ImpactFXEvent &inout Event) const
    {
        UDataTable local_16;
        UGamePhysicalMaterial local_44;
        if (!(Event.bHasVFX))
        {
            return;
        }
        bool local_1 = !(Event.Sender.IsValid());
        if (local_1)
        {
            XLog(ELog(0), FString().Append("Job_HandleImpactEffect Event sender is not valid. PhysicalMaterial:").Append(Event.PhysicalMaterial.ToString()).Append(", ImpactType:").Append(Event.ImpactType));
            return;
        }
        if (local_16 == nullptr)
        {
            return;
        }
        TDataObjectPtr<FImpactConfigVFX> local_40;
        if (local_44 != nullptr)
        {
            UDataTable::FindDataObject local_48;
            local_40 = local_48.opCall(local_44.FinalSurfaceTypeName);
            local_1 = !(local_40);
            if (local_1)
            {
                local_40 = local_48.opCall(local_44.MainSurfaceTypeName);
            }
        }
        else
        {
            UDataTable::FindDataObject local_48;
            local_40 = local_48.opCall(n"Default");
        }
        if (local_40)
        {
            const FImpactVFXDataWithStrength& local_100 = int(Event.ImpactType).GetData();
            FImpactVFXData local_122;
            switch (int(Event.ImpactStrength))
            {
            case 1:
            {
                break;
            }
            case 2:
            {
                break;
            }
            case 3:
            {
                break;
            }
            default:
            {
            }
            }
            if (!(local_122.FXActor.IsNull()))
            {
                local_1 = false;
            }
            else
            {
                local_1 = local_100.bFallBack;
            }
            if (local_1)
            {
                const FImpactVFXDataWithStrength& local_128 = int(local_100.FallBack).GetData();
                switch (int(Event.ImpactStrength))
                {
                case 1:
                {
                    break;
                }
                case 2:
                {
                    break;
                }
                case 3:
                {
                    break;
                }
                default:
                {
                }
                }
            }
            FFXConfig local_244;
            if (CVar_Impact_EnableDebugDraw.GetBool())
            {
                FString local_10 = Event.PhysicalMaterial.ToString();
                FString local_6 = FString();
                Print(local_6.Append("Pop Impact FX: ").Append(local_10).Append(" -> PhysicalMaterial: ").Append(local_10).Append(" = ").Append(local_122.FXActor), 5.0f, FLinearColor::LucBlue);
            }
            if (local_122.FXActor.IsNull())
            {
                return;
            }
            local_244.SetAsset(FSoftClassPath(local_122.FXActor.ToString()));
            local_244.SetLocationOffset(Event.ImpactPosition);
            local_244.SetRotationOffset(FRotator(Event.ImpactRotation));
            if (local_122.RandomRotationAngle >= 0.0f && !(Event.ImpactOutDir.IsZero()))
            {
                float32 local_261 = FMath::DegreesToRadians(FMath::RandRange(0.0f, local_122.RandomRotationAngle));
                float32 local_245 = float32(FMath::Acos(local_244.GetRotationOffset().GetForwardVector().DotProduct(Event.ImpactOutDir)));
                if (local_261 > local_245)
                {
                    local_261 = local_245;
                }
                FVector local_286 = local_244.GetRotationOffset().GetForwardVector().CrossProduct(Event.ImpactOutDir);
                local_244.SetRotationOffset((FQuat(local_286, local_261) * local_244.GetRotationOffset().Quaternion()).Rotator());
            }
            if (!((local_122.LocationOffset == FVector3f::ZeroVector)) || !((local_122.RotationOffset == FRotator3f::ZeroRotator)))
            {
                FTransform local_344 = FTransform(local_244.GetRotationOffset(), local_244.GetLocationOffset(), FVector::OneVector);
                local_244.SetLocationOffset(local_344.TransformPosition(FVector(local_122.LocationOffset)));
                local_244.SetRotationOffset(local_344.TransformRotation(FRotator(local_122.RotationOffset)));
            }
            local_244.SetScale(FVector(local_122.Scale));
            local_244.SetbUseWorldOriginAsBaseTransformSource(true);
            local_244.SetLocationOffsetSpace(EFXOffsetSpace(2));
            local_244.SetRotationOffsetSpace(EFXOffsetSpace(2));
            local_244.SetbDetach(true);
            if (Event.bDurational)
            {
                local_244.SetbDetach(true);
                if (CVar_Impact_ImpactFxDetachTime.GetFloat() > 0.0f)
                {
                    local_244.SetbDetach(false);
                    local_244.SetAutoDetachTime(CVar_Impact_ImpactFxDetachTime.GetFloat());
                }
                ECSFX::PlayFXDurationalEx(Event.Sender, local_244, Event.Time, 1.0f, false, Event.TargetEntity, EAttachFXStopMethod(0), false);
            }
            else
            {
                ECSFX::PlayFXInstant(Event.Sender, local_244, Event.Time, 1.0f, false, true);
            }
            return;
        }
        if (CVar_Impact_EnableDebugDraw.GetBool())
        {
            FString local_10_2 = Event.PhysicalMaterial.ToString();
            FString local_6_2 = FString();
            Print(local_6_2.Append("Pop Impact FX: ").Append(local_10_2).Append(" -> PhysicalMaterial: ").Append(local_10_2).Append(" = NoConfig"), 5.0f, FLinearColor::LucBlue);
        }
        return;
    }
    UFUNCTION()
    void Job_HandleImpactSound(const FCE_ImpactFXEvent &inout Event) const
    {
        UDataTable local_16;
        UGamePhysicalMaterial local_44;
        if (!(Event.bHasSFX))
        {
            return;
        }
        if (!(Event.Sender.IsValid()))
        {
            XLog(ELog(0), FString().Append("Job_HandleImpactSound Event sender is not valid. PhysicalMaterial:").Append(Event.PhysicalMaterial.ToString()).Append(", ImpactType:").Append(Event.ImpactType));
            return;
        }
        if (!(Event.ImpactSFXEvent.IsNull()) == !(false))
        {
            ::ImpactFXUtils::HandleAttackImpact(Event);
            return;
        }
        if (local_16 == nullptr)
        {
            return;
        }
        TDataObjectPtr<FImpactConfigSFX> local_40;
        if (local_44 != nullptr)
        {
            UDataTable::FindDataObject local_48;
            local_40 = local_48.opCall(local_44.FinalSurfaceTypeName);
            if (!(local_40))
            {
                local_40 = local_48.opCall(local_44.MainSurfaceTypeName);
            }
        }
        else
        {
            UDataTable::FindDataObject local_48;
            local_40 = local_48.opCall(n"Default");
        }
        if (local_40)
        {
            const FImpactSFXData& local_100 = int(Event.ImpactType).GetData();
            if (local_100.Event.IsNull())
            {
                FString local_104 = FString().Append("Job_HandleImpactSound Event is null");
                XLog(ELog(0), local_104);
                return;
            }
            if (local_100.Event.IsPending())
            {
                FString local_104_2 = FString().Append("Job_HandleImpactSound Event is Pending, begin to load...").Append(local_100.Event.GetAssetName());
                XLog(ELog(0), local_104_2);
            }
            FString local_104_3 = FString().Append("Sound Impact Sender:").Append(Event.Sender.ToString()).Append(": PhysicalMaterial: ").Append(Event.PhysicalMaterial.ToString()).Append(" -> ImpactType:").Append(Event.ImpactType).Append("  -> SoundEvent: ").Append(local_100.Event);
            if (CVar_Impact_EnableDebugDraw.GetBool())
            {
                XLog(ELog(0), local_104_3);
                Print(local_104_3, 5.0f, FLinearColor::LucBlue);
            }
            if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
            {
                FGameAudioUtils::GetCachedAudioWorld();
                Event.ImpactRotation.Quaternion();
                FLoadEventCallback local_120 = FLoadEventCallback();
            }
            return;
        }
        FString local_10 = Event.PhysicalMaterial.ToString();
        FString local_108 = FString();
        XLog(ELog(0), local_108.Append("Pop Impact SFX: ").Append(local_10).Append(" -> PhysicalMaterial: ").Append(local_10).Append(" = NoConfig"));
        return;
    }
    UFUNCTION()
    void Run_Job_HandleLandedEffect() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityLandedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityLandedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleLandedEffect(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleLandedSound() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityLandedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityLandedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleLandedSound(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleLandedEffectWithSync() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityLandedEventWithSync> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityLandedEventWithSync& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleLandedEffectWithSync(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleLandedSoundWithSync() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EntityLandedEventWithSync> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EntityLandedEventWithSync& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleLandedSoundWithSync(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleSurfaceContactEffect() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SurfaceContactEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SurfaceContactEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleSurfaceContactEffect(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleCleanupWeaponDraggingFX() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CleanupWeaponDraggingFX> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CleanupWeaponDraggingFX& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleCleanupWeaponDraggingFX(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleSyncImpact() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SyncImpactFXEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SyncImpactFXEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleSyncImpact(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleImpactEffect() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ImpactFXEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ImpactFXEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleImpactEffect(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleImpactSound() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ImpactFXEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ImpactFXEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleImpactSound(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


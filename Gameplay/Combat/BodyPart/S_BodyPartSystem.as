

class US_BodyPartSystem : UECSScriptSystem
{
    US_BodyPartSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_BodyPartsConfigActive(const FECSEntity &inout Entity, const FC_BodyPartsConfig &inout BodyPartsConfig) const
    {
        bool local_3 = false;
        int local_10 = 0;
        if (BodyPartsConfig.BodyPartData != nullptr)
        {
            for (auto& local_28 : BodyPartsConfig.BodyPartData.BodyParts)
            {
                FCharacterBodyPartRuntimeData local_30;
                local_30.SetbCanDestroy(local_3);
                local_10.GetModify_BodyPartDatas().Add(local_28.GetKey(), local_30);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_BodyPartDestroyFX(const FCE_BodyPartDestroyEvent &inout BodyPartDestroyEvent) const
    {
        int local_6 = 0;
        if ((!(local_6) || (!((local_6.BodyPartData != nullptr)))))
        {
            return;
        }
        FCharacterBodyPartConfig local_204;
        local_6.BodyPartData.BodyParts.Find(BodyPartDestroyEvent.BodyPart, local_204);
        if (local_204.DestroyFX.IsValid())
        {
            FFXConfig local_320 = local_204.DestroyFX;
            local_320.SetbUseWorldOriginAsBaseTransformSource(false);
            local_320.SetLocationOffsetSpace(EFXOffsetSpace(0));
            local_320.SetRotationOffsetSpace(EFXOffsetSpace(0));
            local_320.SetbDetach(true);
            FAttachRefName local_323 = local_320.GetAttachRefName();
            local_323.Name = local_204.FXAttachmentSocket;
            local_320.SetAttachRefName(local_323);
            ECSFX::PlayFXInstant(BodyPartDestroyEvent.Sender, local_320, BodyPartDestroyEvent.Time, 1.0f, false, true);
        }
        return;
    }
    UFUNCTION()
    void Job_RecoverBodyPart(const FCE_BodyPartRecoverEvent &inout BodyPartRecoverEvent) const
    {
        int local_10 = 0;
        int local_16 = 0;
        int local_28 = 0;
        FECSEntity local_4 = FECSEntity(BodyPartRecoverEvent.Sender);
        if (!(!(local_10)) && local_16)
        {
            FCharacterBodyPartRuntimeData& local_20 = local_16.GetModify_BodyPartDatas()[BodyPartRecoverEvent.BodyPartKey];
            FCharacterBodyPartConfig& local_22 = local_10.BodyPartData.BodyParts[BodyPartRecoverEvent.BodyPartKey];
            float32 local_30 = local_28.GetAttributeValue(Attribute::HPMax, BodyPartRecoverEvent.Time);
            local_20.SetbCanDestroy(true);
            if (local_22.bUseEnvBreakDamage)
            {
                float32 local_31 = 1.0f - BodyPartRecoverEvent.RecoverHPRatio;
                local_20.SetAccumulatedDamage(local_22.EnvBreakBodyPartHP * local_31);
            }
            else
            {
                float32 local_29 = local_30 * local_22.DestroyHpRatio;
                float32 local_32_2 = 1.0f - BodyPartRecoverEvent.RecoverHPRatio;
                local_20.SetAccumulatedDamage(local_29 * local_32_2);
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_BodyPartsConfigActive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorBodyPartsConfigOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_BodyPartsConfigActive(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_BodyPartDestroyFX() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BodyPartDestroyEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BodyPartDestroyEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_BodyPartDestroyFX(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_RecoverBodyPart() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BodyPartRecoverEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BodyPartRecoverEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_RecoverBodyPart(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


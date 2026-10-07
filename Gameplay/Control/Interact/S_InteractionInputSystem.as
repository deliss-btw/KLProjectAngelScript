

class US_InteractionInputSystem : UECSScriptSystem
{
    US_InteractionInputSystem()
    {
        return;
    }
    void SendEndInteractEvent(const FECSEntity &inout Entity, const FECSEntity &inout TargetEntity, const FInteractionPointAndBehaviorIndex &inout TargetPointAndBehaviorIndex, const UInteractionBehaviorBase BehaviorConfig, const FFPTime &inout TriggerTime) const
    {
        int local_8 = 0;
        if (BehaviorConfig != nullptr && BehaviorConfig.HasPresentationOnlyEndActions())
        {
            ::FInteractUtils::ExecuteInteractEndActionPresentationOnly(Entity, TargetEntity, TargetPointAndBehaviorIndex);
        }
        local_8.TargetEntity = TargetEntity;
        local_8.InteractTargetPointAndBehaviorIndex = TargetPointAndBehaviorIndex;
        return;
    }
    void SendEndAutoInteractEvent(const FECSEntity &inout Entity, const UInteractionBehaviorBase BehaviorConfig, const FFPTime &inout TriggerTime) const
    {
        if (BehaviorConfig != nullptr && BehaviorConfig.HasPresentationOnlyEndActions())
        {
            ::FInteractUtils::ExecuteAutoInteractEndActionPresentationOnly(Entity);
        }
        SendEvent local_6;
        local_6.opCall(TriggerTime);
        return;
    }
    void SendBeginInteractEvent(const FECSEntity &inout Entity, const FECSEntity &inout TargetEntity, const FInteractionPointAndBehaviorIndex &inout TargetPointAndBehaviorIndex, const UInteractionBehaviorBase BehaviorConfig, const FFPTime &inout TriggerTime, const bool bIsSecondaryInteract, const EInteractMode InteractMode) const
    {
        if (BehaviorConfig != nullptr && BehaviorConfig.HasPresentationOnlyBeginActions())
        {
            ::FInteractUtils::ExecuteInteractBeginActionPresentationOnly(Entity, TargetEntity, TargetPointAndBehaviorIndex);
        }
        FCE_BeginInteractEvent local_8;
        local_8.TargetEntity = TargetEntity;
        local_8.InteractTargetPointAndBehaviorIndex = TargetPointAndBehaviorIndex;
        local_8.bIsSecondaryInteract = bIsSecondaryInteract;
        local_8.InteractMode = InteractMode;
        return;
    }
    void SendBeginAutoInteractEvent(const FECSEntity &inout Entity, const UInteractionBehaviorBase BehaviorConfig, const FFPTime &inout TriggerTime) const
    {
        if (BehaviorConfig != nullptr && BehaviorConfig.HasPresentationOnlyBeginActions())
        {
            ::FInteractUtils::ExecuteAutoInteractBeginActionPresentationOnly(Entity);
        }
        SendEvent local_6;
        local_6.opCall(TriggerTime);
        return;
    }
    UFUNCTION()
    void ClientJob_HandleInteractionInput(const FECSEntity &inout Entity, const FC_Input &inout Input, const FCS_LocalTime &inout LocalTime, const FC_ESMTrigger &inout ESMTrigger) const
    {
        int local_6 = 0;
        bool local_7;
        UInteractionBehaviorBase local_12;
        int local_48 = 0;
        FC_BestInteractionTargetInfo local_54;
        Remove local_88;
        int local_94 = 0;
        if (local_6)
        {
            if (local_6.TargetEntity.IsActive())
            {
                local_12 = ::FInteractUtils::GetInteractionBehaviorFromEntity(local_6.TargetEntity, local_6.InteractTargetPointAndBehaviorIndex);
                if (local_12 == nullptr)
                {
                    local_7 = false;
                }
                else
                {
                    TObjectPtr<UESMInputTriggerAsset> local_14;
                    local_14 = local_12.InputTriggerEnd;
                    local_7 = !((local_14 == nullptr));
                }
                if (local_7)
                {
                    FActiveTriggerResult local_34 = local_12.InputTriggerEnd.opArrow().TestTrigger(Input.State, LocalTime.LastTime, LocalTime.Time, ESMTrigger.Storage);
                    if (local_34.bActive && (FFPTime(local_34.TriggerTime).opCmp(LocalTime.Time) <= 0) && (local_34.GetTriggerExpireTime().opCmp(LocalTime.LastTime) >= 0))
                    {
                        this.SendEndInteractEvent(Entity, local_6.TargetEntity, local_6.InteractTargetPointAndBehaviorIndex, local_12, local_34.TriggerTime);
                        Remove local_42;
                        local_42.opCall();
                    }
                }
            }
        }
        bool local_15 = local_48 && local_48.GetbIsSecondaryInteractSource();
        if (!(local_15))
        {
            local_7 = false;
        }
        else
        {
            local_7 = local_54;
        }
        if (!(local_7))
        {
            local_15 = false;
        }
        else
        {
            local_15 = local_54.bIsSecondaryTarget;
        }
        if (local_48 && !(local_15))
        {
            Get local_64;
            bool local_55;
            if (local_48.GetbIsAutoInteract())
            {
                const FC_AutoInteractSourceConfig& local_66 = local_64.opCall();
                if (local_66)
                {
                    if (local_66.AutoInteractBehavior.IsValid())
                    {
                        local_12 = local_66.AutoInteractBehavior.GetDefaultObject();
                        TObjectPtr<UESMInputTriggerAsset> local_60_2 = local_12.InputTriggerEnd;
                        TObjectPtr<UESMInputTriggerAsset> local_14;
                        local_14 = local_12.InputTriggerEnd;
                        if (!((local_14 == nullptr)))
                        {
                            FActiveTriggerResult local_24 = local_12.InputTriggerEnd.opArrow().TestTrigger(Input.State, LocalTime.LastTime, LocalTime.Time, ESMTrigger.Storage);
                            if ((local_24.bActive && (FFPTime(local_24.TriggerTime).opCmp(LocalTime.Time) <= 0)) && (local_24.GetTriggerExpireTime().opCmp(LocalTime.LastTime) >= 0))
                            {
                                this.SendEndAutoInteractEvent(Entity, local_12, local_24.TriggerTime);
                            }
                        }
                    }
                }
            }
            else
            {
                if (local_48.GetTargetEntity().IsActive())
                {
                    local_12 = ::FInteractUtils::GetInteractionBehaviorFromEntity(local_48.GetTargetEntity(), local_48.GetTargetPointAndBehaviorIndex());
                    if (local_12 != nullptr)
                    {
                        TObjectPtr<UESMInputTriggerAsset> local_14;
                        local_14 = local_12.InputTriggerEnd;
                        if (!((local_14 == nullptr)))
                        {
                            FActiveTriggerResult local_34_2 = local_12.InputTriggerEnd.opArrow().TestTrigger(Input.State, LocalTime.LastTime, LocalTime.Time, ESMTrigger.Storage);
                            local_55 = local_34_2.bActive && (FFPTime(local_34_2.TriggerTime).opCmp(LocalTime.Time) <= 0);
                            if (local_55 && (local_34_2.GetTriggerExpireTime().opCmp(LocalTime.LastTime) >= 0))
                            {
                                this.SendEndInteractEvent(Entity, local_48.GetTargetEntity(), local_48.GetTargetPointAndBehaviorIndex(), local_12, local_34_2.TriggerTime);
                            }
                        }
                    }
                }
            }
            return;
        }
        Get local_70;
        const FC_BestInteractionTargetInfoModeZ& local_72 = local_70.opCall();
        if (local_72)
        {
            bool local_57;
            bool local_55;
            local_57 = !(local_6);
            bool local_56 = local_57 || !((local_6.TargetEntity == local_72.TargetEntity));
            if (local_56 && local_72.TargetEntity.IsActive())
            {
                local_12 = ::FInteractUtils::GetInteractionBehaviorFromEntity(local_72.TargetEntity, local_72.InteractTargetPointAndBehaviorIndex);
                TObjectPtr<UESMInputTriggerAsset> local_14;
                local_14 = local_12.InputTriggerBegin;
                local_55 = !((local_14 == nullptr));
                if (local_12 != nullptr)
                {
                    FActiveTriggerResult local_24_2 = local_12.InputTriggerBegin.opArrow().TestTrigger(Input.State, LocalTime.LastTime, LocalTime.Time, ESMTrigger.Storage);
                    local_56 = local_24_2.bActive && (FFPTime(local_24_2.TriggerTime).opCmp(LocalTime.Time) <= 0);
                    if (local_56 && (local_24_2.GetTriggerExpireTime().opCmp(LocalTime.LastTime) >= 0))
                    {
                        this.SendBeginInteractEvent(Entity, local_72.TargetEntity, local_72.InteractTargetPointAndBehaviorIndex, local_12, local_24_2.TriggerTime, false, EInteractMode(1));
                        return;
                    }
                }
            }
        }
        if (local_54 && !(local_6))
        {
            bool local_57;
            if (local_54.TargetEntity.IsActive())
            {
                local_12 = ::FInteractUtils::GetInteractionBehaviorFromEntity(local_54.TargetEntity, local_54.InteractTargetPointAndBehaviorIndex);
                TObjectPtr<UESMInputTriggerAsset> local_14;
                local_14 = local_12.InputTriggerBegin;
                local_57 = !((local_14 == nullptr));
                if (local_12 != nullptr)
                {
                    FActiveTriggerResult local_34_3 = local_12.InputTriggerBegin.opArrow().TestTrigger(Input.State, LocalTime.LastTime, LocalTime.Time, ESMTrigger.Storage);
                    if ((local_34_3.bActive && (FFPTime(local_34_3.TriggerTime).opCmp(LocalTime.Time) <= 0)) && (local_34_3.GetTriggerExpireTime().opCmp(LocalTime.LastTime) >= 0))
                    {
                        this.SendBeginInteractEvent(Entity, local_54.TargetEntity, local_54.InteractTargetPointAndBehaviorIndex, local_12, local_34_3.TriggerTime, local_54.bIsSecondaryTarget, EInteractMode(0));
                    }
                }
            }
            return;
        }
        if (::FInteractUtils::EvaluateAutoInteractConditions(Entity))
        {
            Get local_64;
            const FC_AutoInteractSourceConfig& local_66_2 = local_64.opCall();
            if (local_66_2)
            {
                if (local_66_2.AutoInteractBehavior.IsValid())
                {
                    local_12 = local_66_2.AutoInteractBehavior.GetDefaultObject();
                    TObjectPtr<UESMInputTriggerAsset> local_14;
                    if (!((local_12.InputTriggerBegin == nullptr)))
                    {
                        UESMInputTriggerAsset local_26 = local_12.InputTriggerBegin.opArrow();
                        FActiveTriggerResult local_24_3 = local_26.TestTrigger(Input.State, LocalTime.LastTime, LocalTime.Time, ESMTrigger.Storage);
                        Get local_82;
                        const FC_AutoInteractHoldInput& local_84 = local_82.opCall();
                        if (local_84)
                        {
                            FFPTime local_36 = local_84.TriggerTime;
                            if (local_36.opCmp(LocalTime.Time) <= 0 && ((local_84.ExpireTime.opCmp(LocalTime.LastTime) >= 0)))
                            {
                                this.SendBeginAutoInteractEvent(Entity, local_12, local_84.ExpireTime);
                                local_88.opCall();
                            }
                            else
                            {
                                FFPTime local_36_2 = local_84.ExpireTime;
                                if (local_36_2.opCmp(LocalTime.LastTime) < 0)
                                {
                                    local_88.opCall();
                                }
                            }
                        }
                        else
                        {
                            if (local_24_3.bActive)
                            {
                                if (FFPTime(local_24_3.TriggerTime).opCmp(LocalTime.Time) <= 0 && (local_24_3.GetTriggerExpireTime().opCmp(LocalTime.LastTime) >= 0))
                                {
                                    this.SendBeginAutoInteractEvent(Entity, local_12, local_24_3.GetTriggerExpireTime());
                                    local_88.opCall();
                                }
                                else
                                {
                                    local_94.TriggerTime = local_24_3.TriggerTime;
                                    local_94.ExpireTime = (FFPTime(local_24_3.TriggerTime) + FFPTime(local_26.CoreTriggerItem.ValidateTime));
                                }
                            }
                        }
                        if (local_24_3.bClear)
                        {
                            local_88.opCall();
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleInteractActionOpenUIEvent(const FCE_InteractActionOpenUIEvent &inout Event, const FCS_LocalPlayer &inout LocalPlayer, const FCS_FixedTime &inout FixedTime) const
    {
        UUserWidget local_48;
        APlayerController local_2 = LocalPlayer.UEPlayerController;
        if ((!((local_2 != nullptr))))
        {
            return;
        }
        if (Event.UIWidget.IsNull())
        {
            XError(ELog(0), "UInteractionBehaviorAction_OpenUI: UIWidget is null!");
            return;
        }
        XWarning(ELog(0), (FString("UInteractionBehaviorAction_OpenUI: Time: ") + FixedTime.Frame));
        UClass local_26 = (Cast<UClass>(Event.UIWidget.ToSoftObjectPath().TryLoad()));
        if ((!((local_26 != nullptr))))
        {
            XError(ELog(0), FString().Append("UInteractionBehaviorAction_OpenUI: can't load WidgetBPClass ").Append(Event.UIWidget.ToString()));
            return;
        }
        TArray<UUserWidget> local_30;
        Widget::GetAllWidgetsOfClass(__GetWorldContext(), local_30, TSubclassOf<UUserWidget>(local_26), true);
        if (local_30.Num() > 0)
        {
            auto local_40 = local_30.Iterator();
            for (; local_40.CanProceed;)
            {
                local_48 = local_40.Proceed();
                if (!(local_48.IsVisible()))
                {
                    local_48.SetVisibility(ESlateVisibility(0));
                }
            }
        }
        else
        {
            local_48 = WidgetBlueprint::CreateWidget(__GetWorldContext(), TSubclassOf<UUserWidget>(local_26), local_2);
            local_48.AddToViewport(0);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_PlayInteractSound(const FCE_BeginInteractEvent &inout Event) const
    {
        UKLUIAudioSettings::PlayInteractSound();
        return;
    }
    UFUNCTION()
    void ClientJob_HandleDebugTriggerClientInteractEvent(const FCE_DebugTriggerClientInteract &inout Event) const
    {
        FC_BestInteractionTargetInfo local_14;
        FECSEntity local_4 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (local_14)
        {
            if (local_14.TargetEntity.IsValid())
            {
                this.SendBeginInteractEvent(local_4, local_14.TargetEntity, local_14.InteractTargetPointAndBehaviorIndex, ::FInteractUtils::GetInteractionBehaviorFromEntity(local_14.TargetEntity, local_14.InteractTargetPointAndBehaviorIndex), FFPTime(-1), local_14.bIsSecondaryTarget, EInteractMode(0));
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleInteractionInput() const
    {
        int local_12 = 0;
        const FECSEntity& local_46;
        int local_48 = 0;
        int local_54 = 0;
        int local_186 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 0;
        int local_17 = local_18;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_2.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.ClientJob_HandleInteractionInput(local_46, local_48, local_12, local_54);
            }
            local_2.UpdateCachedEntityCount(local_23);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_2.BeginViewCacheBuild();
        int local_24 = local_2.GetViewCacheEpoch();
        int local_114 = 0;
        FECSRuntimeViewIterator local_148 = local_96.Iterator();
        for (; local_148.CanProceed;)
        {
            local_46 = local_148.Proceed();
            ++local_114;
            if (local_9)
            {
                local_2.AddViewCacheEntity(local_46.GetId());
            }
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
            this.ClientJob_HandleInteractionInput(local_186, local_48, local_12, local_54);
        }
        local_2.UpdateCachedEntityCount(local_114);
        if (local_9)
        {
            local_2.CommitViewCacheBuild(local_24);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleInteractActionOpenUIEvent() const
    {
        int local_14 = 0;
        int local_20 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        TECSEventConstIterator<FCE_InteractActionOpenUIEvent> local_52 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_52.CanProceed;)
        {
            const FCE_InteractActionOpenUIEvent& local_74 = local_52.Proceed();
            FECSEntityScopeCycleCounter local_75 = FECSEntityScopeCycleCounter(local_74.Sender);
            ECSInternal::PushContextTime(local_74.GetHandleTime());
            this.ClientJob_HandleInteractActionOpenUIEvent(local_74, local_14, local_20);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PlayInteractSound() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_BeginInteractEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_BeginInteractEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_PlayInteractSound(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleDebugTriggerClientInteractEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DebugTriggerClientInteract> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DebugTriggerClientInteract& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleDebugTriggerClientInteractEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


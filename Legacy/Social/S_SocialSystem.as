

class US_SocialSystem : UECSScriptSystem
{
    UPROPERTY()
    float32 EnemyHeadUIInfoVisibleDistance = 500000.0f;


    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void Init_Implementation()
    {
        const USocialViewPageSettings local_2;
        GetGameplaySettings<USocialViewPageSettings> local_4;
        local_2 = local_4;
        if (local_2 == nullptr)
        {
            return;
        }
        if (local_2.SingleActionCondition != nullptr)
        {
            local_2.SingleActionCondition.BlackboardConditionAndArray.InitConditionRuntime(false);
        }
        if (local_2.DualActionSourceCondition != nullptr)
        {
            local_2.DualActionSourceCondition.BlackboardConditionAndArray.InitConditionRuntime(false);
        }
        if (local_2.DualActionTargetCondition != nullptr)
        {
            local_2.DualActionTargetCondition.BlackboardConditionAndArray.InitConditionRuntime(false);
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateSocialHeadUIInfoWidget(const FECSEntity &inout PawnEntity, FC_SocialInteractionPresentationInfo &inout SocialInteractionPresentationInfo) const
    {
        const AActor local_4;
        UWidget_SocialHeadInfo local_34;
        local_4 = PawnEntity.GetActor();
        if (local_4 != nullptr && !(SocialInteractionPresentationInfo.SocialHeadInfoWidget.IsValid()))
        {
            TArray<UWidgetComponent> local_10 = local_4.GetComponentsByClass(UWidgetComponent);
            for (auto& local_28 : local_10)
            {
                local_34 = Cast<UWidget_SocialHeadInfo>(local_28.GetWidget());
                if (local_34 != nullptr)
                {
                    SocialInteractionPresentationInfo.SocialHeadInfoWidget = local_34;
                    break;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateSocialHeadUIInfoText(const FECSEntity &inout PawnEntity, FC_SocialInteractionPresentationInfo &inout SocialInteractionPresentationInfo) const
    {
        bool local_19;
        int local_22 = 0;
        int local_28 = 0;
        int local_40 = 0;
        int local_50 = 0;
        int local_56 = 0;
        FECSEntity local_8 = ::FASCommonUtils::GetLocalUniquePlayerEntity();
        FECSEntity local_4 = ::FASCommonUtils::GetUniquePlayerEntity(PawnEntity);
        if ((local_8 == ENTITY_NULL))
        {
            return;
        }
        if (!(SocialInteractionPresentationInfo.SocialHeadInfoWidget.IsValid()))
        {
            return;
        }
        FText local_18;
        bool local_13 = false;
        local_19 = local_13;
        if (!(local_22))
        {
            local_13 = false;
        }
        else
        {
            local_13 = local_28;
        }
        if (local_13)
        {
            if (PawnEntity.MatchGameplayTag(GameplayTags::ESM_Social_RequestInteractAction) && !((local_8 == local_4)) && ((FECSEntity(local_28.GetRequestInteractActionTargetPlayerEntity()) == ENTITY_NULL) || (FECSEntity(local_28.GetRequestInteractActionTargetPlayerEntity()) == local_8)))
            {
                local_18 = NSLOCTEXT("SocialInfo", "InvitingToInteract", "дє¤дє’й‚ЂиЇ·...");
            }
        }
        if (local_40 && !(local_40.GetShowBehaviorStringOnHead().IsEmpty()))
        {
            local_19 = true;
            local_18 = FText::FromString(local_40.GetShowBehaviorStringOnHead());
        }
        if (local_50 && !(local_50.GetInfoOnHead().IsEmpty()))
        {
            local_19 = true;
            local_18 = FText::FromString(local_50.GetInfoOnHead());
        }
        if (local_56 && !(local_56.GetExpressionContent().IsEmpty()))
        {
            local_19 = true;
            local_18 = FText::FromString(local_56.GetExpressionContent());
        }
        UTextBlock local_60 = SocialInteractionPresentationInfo.SocialHeadInfoWidget.opArrow().AS_HeadInfoContent;
        if (local_60 != nullptr)
        {
            if (local_19)
            {
                SocialInteractionPresentationInfo.SocialHeadInfoWidget.opArrow().AS_HeadInfoContent.SetVisibility(ESlateVisibility(0));
                SocialInteractionPresentationInfo.SocialHeadInfoWidget.opArrow().AS_TextBorder.SetVisibility(ESlateVisibility(0));
                SocialInteractionPresentationInfo.SocialHeadInfoWidget.opArrow().AS_HeadInfoContent.SetText(local_18);
            }
            else
            {
                SocialInteractionPresentationInfo.SocialHeadInfoWidget.opArrow().AS_HeadInfoContent.SetVisibility(ESlateVisibility(2));
                SocialInteractionPresentationInfo.SocialHeadInfoWidget.opArrow().AS_TextBorder.SetVisibility(ESlateVisibility(2));
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateSocialHeadUIInfoUserName(const FECSEntity &inout PawnEntity, FC_SocialInteractionPresentationInfo &inout SocialInteractionPresentationInfo) const
    {
        int local_14 = 0;
        UTextBlock local_18;
        int local_31 = 0;
        FECSEntity local_8 = ::FASCommonUtils::GetUniquePlayerEntity(PawnEntity);
        if (!(local_14))
        {
            return;
        }
        if (SocialInteractionPresentationInfo.SocialHeadInfoWidget.IsValid())
        {
            local_18 = SocialInteractionPresentationInfo.SocialHeadInfoWidget.opArrow().AS_TextBlock_UserName;
            if (local_18 != nullptr)
            {
                bool local_15 = false;
                FECSEntity local_4 = ::FASCommonUtils::GetLocalUniquePlayerEntity();
                FECSEntity local_26 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
                if (local_15)
                {
                    bool local_54;
                    local_18.SetVisibility(ESlateVisibility(0));
                    local_18.SetText(FText::FromString(local_14.GetNickName()));
                    if (!((local_4 == local_8)))
                    {
                        if (::FASCommonUtils::IsTargetEntityEnemy(local_26, PawnEntity))
                        {
                            local_18.SetColorAndOpacity(FSlateColor(FLinearColor(1.0f, 0.0f, 0.0f, 1.0f)));
                        }
                        else
                        {
                            if (::FTeamUtils::IsInSameTeam(local_4, local_8))
                            {
                                local_18.SetColorAndOpacity(FSlateColor(FLinearColor(0.0f, 0.5f, 1.0f, 1.0f)));
                            }
                            else
                            {
                                local_18.SetColorAndOpacity(FSlateColor(FLinearColor(1.0f, 1.0f, 1.0f, 1.0f)));
                            }
                        }
                    }
                    local_54 = false;
                    Get local_58;
                    const FC_PlayerController& local_60 = local_58.opCall();
                    if (local_60)
                    {
                        if (::FSocialTeamUtils::ClientGetSocialTeamInfo().LeaderID == local_60.GetPlayerId())
                        {
                            local_54 = true;
                        }
                    }
                    if (local_54)
                    {
                        local_31 = 0;
                    }
                    else
                    {
                        local_31 = 2;
                    }
                    SocialInteractionPresentationInfo.SocialHeadInfoWidget.opArrow().AS_TeamMasterMask.SetVisibility();
                }
                else
                {
                    local_18.SetVisibility(ESlateVisibility(2));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleSocialActionEvent(const FCE_SocialActionAnimEvent &inout Event) const
    {
        const USocialViewPageSettings local_16;
        EMotionType local_23;
        int local_36 = 0;
        EInteractionSocialTypeForESM local_37;
        int local_44 = 0;
        int local_52 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        FECSEntity local_12 = ::FASCommonUtils::GetUniquePlayerEntity(local_4);
        if (local_12.IsValid())
        {
            GetGameplaySettings<USocialViewPageSettings> local_18;
            local_16 = local_18;
            if (local_16 != nullptr && !(this.EvaluateSocialCondition(local_16.SingleActionCondition, local_4, ENTITY_NULL)))
            {
                if (Event.MotionData.IsSet())
                {
                    EMotionType local_24;
                    local_23 = local_24;
                }
                else
                {
                    local_23 = EMotionType(0);
                }
                this.SendSocialActionRejected(local_12, EMotionType(local_23), true, false);
                return;
            }
        }
        FESMTriggerUtils::ActivateESMTrigger(local_4, n"SocialActionTrigger", Event.Time, FFPTime(0.1), 0);
        if (Event.MotionData)
        {
            local_37 = Event.MotionData.opArrow().AnimName;
        }
        else
        {
            local_37 = EInteractionSocialTypeForESM(0);
        }
        local_36.SetSocialAnimName(EInteractionSocialTypeForESM(local_37));
        if (local_12.IsValid())
        {
            local_37 = local_36.GetSocialAnimName();
            local_44.SetSocialAnimName(EInteractionSocialTypeForESM(local_37));
        }
        FECSWorldPtr local_46 = local_4.GetWorld();
        local_36.SetExpireTime(local_52.Time);
        this.ReportAvatarActionTrigger(local_4, Event.MotionData);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleSpawnPropEvent(const FCE_SpawnPropEvent &inout Event) const
    {
        int local_18 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        ::FASCommonUtils::GetUniquePlayerEntity(local_4);
        local_18.SetSelectParams(Event.SelectParams);
        local_18.SetPrefab(Event.Prefab);
        local_18.SetPropNum(Event.PropNum);
        FESMTriggerUtils::ActivateESMTrigger(local_4, n"SpawnPropTrigger", Event.Time, FFPTime(0.2), 0);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleSocialRequestInteractActionEvent(const FCE_SocialRequestInteractActionEvent &inout Event) const
    {
        const USocialViewPageSettings local_16;
        EMotionType local_26;
        int local_34 = 0;
        EInteractionSocialTypeForESM local_39;
        FECSEntity local_4 = Event.RequestInteractAnimSourceEntity;
        FECSEntity local_12 = ::FASCommonUtils::GetUniquePlayerEntity(local_4);
        if (local_12.IsValid())
        {
            GetGameplaySettings<USocialViewPageSettings> local_18;
            local_16 = local_18;
            if (local_16 != nullptr)
            {
                FECSEntity local_24 = Event.RequestInteractAnimTargetEntity;
                if (Event.MotionData.IsSet())
                {
                    EMotionType local_27;
                    local_26 = local_27;
                }
                else
                {
                    local_26 = EMotionType(1);
                }
                if (!(this.EvaluateSocialCondition(local_16.DualActionSourceCondition, local_4, local_24)))
                {
                    this.SendSocialActionRejected(local_12, EMotionType(local_26), true, false);
                    return;
                }
                if (local_24.IsValid() && !(this.EvaluateSocialCondition(local_16.DualActionTargetCondition, local_4, local_24)))
                {
                    this.SendSocialActionRejected(local_12, EMotionType(local_26), false, true);
                    return;
                }
            }
        }
        FECSEntity local_8 = ::FASCommonUtils::GetUniquePlayerEntity(FECSEntity(Event.RequestInteractAnimTargetEntity));
        local_34.SetRequestInteractActionTargetPlayerEntity(local_8);
        local_34.SetbHasTargetPlayerEntity(!((local_8 == ENTITY_NULL)));
        if (Event.MotionData)
        {
            local_39 = Event.MotionData.opArrow().AnimName;
        }
        else
        {
            local_39 = EInteractionSocialTypeForESM(0);
        }
        local_34.SetSocialAnimName(EInteractionSocialTypeForESM(local_39));
        FESMTriggerUtils::ActivateESMTrigger(local_4, n"SocialRequestInteractActionTrigger", Event.Time, FFPTime(0.1), 0);
        this.ReportAvatarActionTrigger(local_4, Event.MotionData);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleTryTrigeerESM(const FCE_TryTriggerESM &inout Event) const
    {
        if (!(Event.Entity.IsValid()) || (Event.TriggerName == NAME_None))
        {
            return;
        }
        FFPTime local_6 = FFPTime(0.1);
        ECS::GetContextTime();
        return;
    }
    void ReportAvatarActionTrigger(const FECSEntity &inout PawnEntity, const TDataObjectPtr<FMotionData> &inout MotionData) const
    {
        if (!(MotionData.IsSet()))
        {
            return;
        }
        FPbPlayerLogDsAvatarActionTrigger local_14;
        FMotionData local_4;
        local_14.SetActionId(int(local_4.DataId));
        int local_19 = int(local_4.MotionType) == 1 ? 1 : 0;
        local_14.SetSceneType(local_19);
        local_14.SetAreaId(::FLevelUtils::GetPlayerAreaID(::FASCommonUtils::GetUniquePlayerEntity(PawnEntity)));
        ::ServerDataTrackerHelper::LogProtoMessage3WithPawn(PawnEntity, 105001, local_14.ToWrapper());
        return;
    }
    bool EvaluateSocialCondition(const UInteractCustomCheckConditionBase Condition, const FECSEntity &inout Source, const FECSEntity &inout Target) const
    {
        if (Condition == nullptr)
        {
            return true;
        }
        FInteractionPoint local_192;
        return Condition.CheckCondition(Source, Target, local_192, (0 != 0));
    }
    void SendSocialActionRejected(const FECSEntity &inout PlayerEntity, const EMotionType MotionType, const bool bSourceFailed, const bool bTargetFailed) const
    {
        FFPTime local_6 = FFPTime(-1);
        FCE_SocialActionRejected local_10;
        local_10.MotionType = MotionType;
        local_10.bSourceConditionFailed = bSourceFailed;
        local_10.bTargetConditionFailed = bTargetFailed;
        return;
    }
    UFUNCTION()
    void ClientJob_OnSocialActionRejected(const FCE_SocialActionRejected &inout Event) const
    {
        UInteractCustomCheckConditionBase local_2;
        const USocialViewPageSettings local_4;
        GetGameplaySettings<USocialViewPageSettings> local_6;
        local_4 = local_6;
        if (local_4 != nullptr)
        {
            if (int(Event.MotionType) == 1)
            {
                if (Event.bSourceConditionFailed)
                {
                    local_2 = local_4.DualActionSourceCondition;
                }
                else
                {
                    if (Event.bTargetConditionFailed)
                    {
                        local_2 = local_4.DualActionTargetCondition;
                    }
                }
            }
            else
            {
                local_2 = local_4.SingleActionCondition;
            }
        }
        FText local_16;
        if (local_2 != nullptr && local_2.bShowCheckFailContent && local_2.CheckFailContentTextData.IsSet())
        {
        }
        if (local_16.IsEmpty())
        {
            local_16 = NSLOCTEXT("Social", "SocialActionConditionFailed", "еЅ“е‰ЌзЉ¶жЂЃж— жі•дЅїз”ЁиЇҐеЉЁдЅњ");
        }
        FCommonTipsParam local_26;
        ::CommonPopup::Tips(local_16, local_26);
        return;
    }
    UFUNCTION()
    void ServerJob_TickSocialInteractAction(const FECSEntity &inout PlayerEntity, const FC_SocialInteractionInfo &inout SocialInteractionInfo) const
    {
        if ((!((FECSEntity(SocialInteractionInfo.GetRequestInteractActionTargetPlayerEntity()) == ENTITY_NULL))))
        {
            FECSEntity local_4 = ::FASCommonUtils::GetControlledPawnEntity(PlayerEntity);
            if (!(local_4.MatchGameplayTag(GameplayTags::ESM_Social_RequestInteractAction)))
            {
                ::FSocialUtils::CancelSocialInteractActionRequest(local_4);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleSocialSpawnProp(const FCE_SocialSpawnProp &inout SocialSpawnPropEvent) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_HandleSetSocialExpressionContent(const FCE_SetSocialExpressionContent &inout Event) const
    {
        int local_10 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (local_10)
        {
            local_10.SetExpressionContent(Event.ExpressionContent);
            local_10.SetCreateTime(ECS::GetContextTime());
            if (this.GetECSRuntime().IsServer)
            {
                SendEvent local_18;
                local_18.opCall((ECS::GetContextTime() + FFPTime(5)));
            }
        }
        else
        {
            XError(ELog(0), FString().Append("Job_HandleSetExpressionContent Entity(").Append(local_4.GetEntityName()).Append(") null SocialExpressionInfo"));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleClearSocialExpressionContent(const FCE_ClearSocialExpressionContent &inout Event) const
    {
        int local_10 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        FFPTime local_14 = (ECS::GetContextTime() - local_10.GetCreateTime());
        if (local_14.opCmp(FFPTime(5)) >= 0)
        {
            local_10.SetExpressionContent("");
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateSocialHeadUIInfoWidget() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
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
                this.Job_UpdateSocialHeadUIInfoWidget(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdateSocialHeadUIInfoWidget(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateSocialHeadUIInfoText() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
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
                this.Job_UpdateSocialHeadUIInfoText(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdateSocialHeadUIInfoText(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateSocialHeadUIInfoUserName() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
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
                this.Job_UpdateSocialHeadUIInfoUserName(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_UpdateSocialHeadUIInfoUserName(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleSocialActionEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SocialActionAnimEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SocialActionAnimEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleSocialActionEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleSpawnPropEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SpawnPropEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SpawnPropEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleSpawnPropEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleSocialRequestInteractActionEvent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SocialRequestInteractActionEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SocialRequestInteractActionEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleSocialRequestInteractActionEvent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleTryTrigeerESM() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TryTriggerESM> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TryTriggerESM& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_TryTriggerESM, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleTryTrigeerESM(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_OnSocialActionRejected() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SocialActionRejected> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SocialActionRejected& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_OnSocialActionRejected(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickSocialInteractAction() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
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
                this.ServerJob_TickSocialInteractAction(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_TickSocialInteractAction(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleSocialSpawnProp() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SocialSpawnProp> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SocialSpawnProp& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleSocialSpawnProp(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleSetSocialExpressionContent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SetSocialExpressionContent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SetSocialExpressionContent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleSetSocialExpressionContent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleClearSocialExpressionContent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClearSocialExpressionContent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClearSocialExpressionContent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleClearSocialExpressionContent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}




class US_ThreeChooseOneSystem : UECSScriptSystem
{
    US_ThreeChooseOneSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandleThreeChooseOneEvent(const FCE_ThreeChooseOneRequest &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        int local_8 = 0;
        const FTraitConfig& local_14;
        FTraitModifiers local_22;
        ULevelEventAttribute local_184;
        int local_317 = 0;
        if (!(Event.ChooseItemEntity.IsValid()))
        {
            XError(ELog(0), "FCE_ThreeChooseOneRequest with invalid item entity");
            return;
        }
        if (!(local_8))
        {
            XError(ELog(0), "FCE_ThreeChooseOneRequest with invalid FC_ThreeChooseOneInfo");
            return;
        }
        if (local_8.GetInfos().Num() <= int(Event.ChooseIndex))
        {
            XError(ELog(0), "FCE_ThreeChooseOneRequest with invalid ChooseIndex");
            return;
        }
        const FTraitParam& local_12 = local_8.GetInfos()[int(Event.ChooseIndex)];
        int local_23 = local_12.GetLevel();
        if (local_14.ModifiersByLevel.Find(local_23, local_22))
        {
            for (auto& local_38 : local_22.Modifiers)
            {
                FGameplayModifierUtils::AddGameplayModifier(Event.Sender, local_38, FFPTime(-1), false);
            }
        }
        if (local_14.Buff.IsValid())
        {
            FBuffUtils::AddBuff(Event.Sender, local_14.Buff, FixedTime.Time, Event.Sender, false, -1.0f, 1, false);
        }
        FECSEntity local_50 = FECSEntity(ENTITY_NULL);
        Get local_54;
        const FC_ControlledByPlayer& local_56 = local_54.opCall();
        if (local_56)
        {
            local_50 = local_56.GetPlayerEntity();
            Get local_60;
            const FC_PlayerController& local_62 = local_60.opCall();
            if (local_62)
            {
                FECSEntity local_158;
                FTraitCapabilities local_70;
                local_23 = local_12.GetLevel();
                if (local_14.CapabilitiesByLevel.Find(local_23, local_70))
                {
                    for (auto& local_84 : local_62.GetAllPlayerPawnEntities())
                    {
                        for (auto& local_98 : local_70.Capabilities)
                        {
                            FCapabilityUtils::AddCapability(local_84, local_98.GetCapabilityConfig(), local_98.GetLevel());
                        }
                    }
                }
                ModifyOrAdd local_104;
                FC_ThreeChooseOnePlayerRecord& local_106 = local_104.opCall();
                if (local_106)
                {
                    if (local_106.ChoosedTraitCount.Contains(local_12.GetTrait()))
                    {
                        int local_9 = local_106.ChoosedTraitCount[local_12.GetTrait()] + 1;
                    }
                    else
                    {
                        local_106.ChoosedTraitCount.Add(local_12.GetTrait(), 1);
                    }
                }
                ::FEcologyLevelEventBuffUtils::GetSelectedRuntimeRandomEventInfo(Event.Sender);
                CastTo local_134;
                local_134.opCall();
                if (local_158)
                {
                    FLevelEventTypeAttribute local_316;
                    if (local_184 != nullptr && local_184.GetTypeAttribute(ELevelRandomEventType(local_317), local_316))
                    {
                        ::DivineSkillCDUtils::RecoverPlayerTeamDivineSkillCDBySecond(local_56.GetPlayerEntity(), FixedTime.Time, local_316.DivineSkillCDRecoverSeconds);
                    }
                }
            }
        }
        FPbPlayerLogDsBuffSelect local_328;
        for (auto& local_342 : local_8.GetInfos())
        {
            if (local_342.GetTrait())
            {
                local_328.AddBuffChoice(local_23);
            }
        }
        local_328.SetBuffSelected(int(local_14.DataId));
        local_328.SetTreasureInstanceId(Event.ChooseItemEntity.GetIdValue());
        ::ServerDataTrackerHelper::LogProtoMessage3WithPlayer(local_50, 102510, local_328.ToWrapper());
        ModifyOrAdd local_352;
        FC_CollectionPrefabPresentationState& local_354 = local_352.opCall();
        if (local_354)
        {
            local_354.SetState(ECollectionPrefabPresentationState(2));
        }
        Event.ChooseItemEntity.DestroyDeferred();
        int local_9_2 = int(local_14.Rarity);
        FNameHandle_EntityBBVarInt local_360;
        local_360;
        FESMTriggerUtils::ActivateESMTrigger(Event.Sender, n"InteractSuccessTrigger", FixedTime.Time, FFPTime(0.1), 0);
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleThreeChooseOneEvent() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ThreeChooseOneRequest> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_ThreeChooseOneRequest& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            if (local_64.Validate() == false)
            {
                FString local_74 = "Validate Failed: FCE_ThreeChooseOneRequest, sender";
                FString local_70 = local_64.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.ServerJob_HandleThreeChooseOneEvent(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


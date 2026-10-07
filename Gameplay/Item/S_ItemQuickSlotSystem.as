

class US_ItemQuickSlotSystem : UECSScriptSystem
{
    US_ItemQuickSlotSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_HandleRequestSetQuickSlotItem(const FCE_RequestSetQuickSlotItem &inout Event) const
    {
        ::InventoryUtils::SetQuickSlotItem(Event.Sender, Event.QuickSlot, Event.Item);
        return;
    }
    UFUNCTION()
    void Job_InitItemQuickSlot(const FECSEntity &inout Entity, FC_ItemQuickSlot &inout C_ItemQuickSlot) const
    {
        bool local_2 = true;
        bool local_1 = local_2;
        Get local_6;
        const FC_PlayerController& local_8 = local_6.opCall();
        if (local_8)
        {
            int local_9;
            local_9 = local_8.GetPlayerId();
            FPbDsPlayerInfo local_32 = ::UGameDSConnectionSubsystem::Get().GetPlayerInfo(local_9);
            if (local_32.IsValid())
            {
                int local_45 = local_32.GetDsMiscInfo().GetQuickSlotList_Num();
                if (local_45 > 0)
                {
                    int local_46 = 0;
                    for (; local_46 < local_45; ++local_46)
                    {
                        FPbQuickSlotInfo local_68 = local_32.GetDsMiscInfo().GetQuickSlotList_Index(local_46);
                        if (!(local_68.IsValid()))
                        {
                            local_2 = false;
                        }
                        else
                        {
                            int local_47 = local_68.GetItemKey();
                            local_2 = (local_47 != 0);
                        }
                        if (local_2)
                        {
                            TDataObjectPtr<FItemConfig> local_94 = ::FItemConfig::GetByDataId(local_68.GetItemKey());
                            CastTo local_122;
                            if (local_122.opCall())
                            {
                                XLog(ELog(0), FString().Append("LoadPlayer QuickSlot: skip PresentationOnlyItem ").Append(local_68.GetItemKey()));
                                continue;
                            }
                            TDataObjectPtr<FItemQuickSlotConfig> local_176 = ::FItemQuickSlotConfig::GetByDataId(local_68.GetSlotKey());
                            this.InitQuickSlotItem(Entity, local_176, local_94);
                            XLog(ELog(0), FString().Append("LoadPlayer QuickSlot:").Append(local_68.GetSlotKey()).Append(" ").Append(local_68.GetItemKey()));
                        }
                        else
                        {
                            XLog(ELog(0), FString().Append("LoadPlayer QuickSlot: ").Append(local_68.GetSlotKey()).Append(" is not valid"));
                        }
                    }
                    local_1 = false;
                }
            }
        }
        if (local_1)
        {
            UDataTable local_202 = ::InventoryUtils::GetItemQuickSlotTable();
            if (local_202 != nullptr)
            {
                TArray<FItemQuickSlotConfig> local_208;
                local_202.GetAllRows(local_208);
                for (auto& local_222 : local_208)
                {
                    if (local_222.GetDefaultItem())
                    {
                        this.InitQuickSlotItem(Entity, TDataObjectPtr<FItemQuickSlotConfig>(local_222), local_222.GetDefaultItem());
                    }
                }
            }
        }
        Remove local_226;
        local_226.opCall();
        FC_MountPendingInitTag local_232;
        Assign local_230;
        local_230.opCall(local_232);
        FC_ConsumableItemNeedInitTag local_238;
        Assign local_236;
        local_236.opCall(local_238);
        return;
    }
    UFUNCTION()
    void Job_NotifyQuickSlotItemChanged(const FECSEntity &inout Entity, const FC_ItemQuickSlotChangeHistory &inout C_ChangeHistory) const
    {
        int local_30 = 0;
        for (auto& local_20 : C_ChangeHistory.ChangeHistory)
        {
            FFPTime local_26 = FFPTime(-1);
            local_30.QuickSlot = local_20.GetKey();
        }
        Remove local_82;
        local_82.opCall();
        return;
    }
    void InitQuickSlotItem(const FECSEntity &inout Entity, const TDataObjectPtr<FItemQuickSlotConfig> &inout QuickSlot, const TDataObjectPtr<FItemConfig> &inout Item) const
    {
        if (!(!(!(QuickSlot))))
        {
            return;
        }
        ::FASCommonUtils::GetUniquePlayerEntity(Entity);
        ModifyOrAdd local_14;
        FC_ItemQuickSlot& local_16 = local_14.opCall();
        if (local_16)
        {
            if (Item)
            {
                local_16.GetModify_QuickSlots().Add(QuickSlot, Item);
            }
            else
            {
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_LoadInitConsumableItemSkill(const FECSEntity &inout Entity, FC_ItemQuickSlot &inout C_ItemQuickSlot, const FC_PlayerController &inout PlayerController, const FCS_FixedTime &inout FixedTime) const
    {
        if (PlayerController.GetAllPlayerPawnEntities().Num() == 0)
        {
            return;
        }
        for (auto& local_18 : PlayerController.GetAllPlayerPawnEntities())
        {
            ::InventoryUtils::InitQuickSlotConsumableItemsForPawn(local_18);
        }
        Remove local_22;
        local_22.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_HandleQuickSlotItemChanged(const FCE_NotifyQuickSlotItemChanged &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        int local_22 = 0;
        USkillConfig local_100;
        USkillConfig local_102;
        USkillConfig local_104;
        if (int(Event.QuickSlot.opArrow().ItemFilter.AllowedItemType) == 101)
        {
            return;
        }
        if (int(Event.QuickSlot.opArrow().ItemFilter.AllowedItemType) == 4)
        {
            if (::FGameModeUtils::IsTacticalSlotRestricted(Event.QuickSlot))
            {
                return;
            }
            ::FASCommonUtils::GetUniquePlayerEntity(Event.Sender);
            FECSWorldPtr local_16 = ECS::GetECSWorld();
            if (local_22)
            {
                float32 local_201;
                CastTo local_50;
                TDataObjectPtr<FCombatItemConfig> local_74 = local_50.opCall();
                TDataObjectPtr<FCombatItemConfig> local_46 = local_50.opCall();
                if (local_74)
                {
                    local_102 = local_74.opArrow().ItemSkillConfig;
                }
                else
                {
                }
                local_100 = local_102;
                if (local_46)
                {
                    local_102 = local_46.opArrow().ItemSkillConfig;
                }
                else
                {
                }
                local_104 = local_102;
                FBuffConfigRef local_152;
                if (local_74)
                {
                    local_152 = local_74.opArrow().ItemBuffConfig;
                }
                else
                {
                    local_152 = FBuffConfigRef();
                }
                FBuffConfigRef local_128;
                if (local_46)
                {
                    local_128 = local_46.opArrow().ItemBuffConfig;
                }
                else
                {
                    local_128 = FBuffConfigRef();
                }
                local_201 = 1.0f;
                for (auto& local_216 : local_22.GetAllPlayerPawnEntities())
                {
                    if (local_100 != nullptr)
                    {
                        local_201 = ::InventoryUtils::UnequipQuickSlotSkill(local_216, local_100, EESMTriggerInputSlot(Event.QuickSlot.opArrow().InputSlot));
                    }
                    if (local_104 != nullptr)
                    {
                        ::InventoryUtils::EquipQuickSlotSkill(local_216, local_104, EESMTriggerInputSlot(Event.QuickSlot.opArrow().InputSlot));
                        int local_3 = FSkillUtils::GetSkillIndex(local_216, local_104);
                        if ((local_201 > 0.0f && (local_201 < 1.0f)))
                        {
                            float32 local_202 = 1.0f - local_201;
                            FSkillUtils::SetSkillCD(local_216, local_3, FixedTime.Time, local_202);
                        }
                    }
                    if (local_152.IsValid())
                    {
                        FBuffUtils::RemoveBuff(local_216, local_152, FixedTime.Time, EBuffEndType(0));
                    }
                    if (local_128.IsValid())
                    {
                        FBuffUtils::AddBuff(local_216, local_128, FixedTime.Time, local_216, false, -1.0f, 1, false);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandleRequestSetQuickSlotItem() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RequestSetQuickSlotItem> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RequestSetQuickSlotItem& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleRequestSetQuickSlotItem(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitItemQuickSlot() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
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
                this.Job_InitItemQuickSlot(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_InitItemQuickSlot(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_NotifyQuickSlotItemChanged() const
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
                this.Job_NotifyQuickSlotItemChanged(local_36, local_38);
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
            this.Job_NotifyQuickSlotItemChanged(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_LoadInitConsumableItemSkill() const
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
                this.ServerJob_LoadInitConsumableItemSkill(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_ItemQuickSlot> local_56;
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
            this.ServerJob_LoadInitConsumableItemSkill(local_184, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_ItemQuickSlot>(local_40).opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleQuickSlotItemChanged() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_NotifyQuickSlotItemChanged> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_NotifyQuickSlotItemChanged& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.ServerJob_HandleQuickSlotItemChanged(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


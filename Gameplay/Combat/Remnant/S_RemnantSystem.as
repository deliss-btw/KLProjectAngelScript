class US_RemnantSystem : UECSScriptSystem
{
    US_RemnantSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandleRemnantQuickSlotReplaced(const FCE_NotifyQuickSlotItemChanged &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        int local_70 = 0;
        int local_126 = 0;
        if (!((Event.QuickSlot.GetDataName() == n"ConsumableItem_TemporaryAbility")))
        {
            return;
        }
        CastTo local_8;
        TDataObjectPtr<FRemnantItemConfig> local_32 = local_8.opCall();
        if (!(local_32))
        {
            return;
        }
        if (!(::FASCommonUtils::GetUniquePlayerEntity(Event.Sender).IsValid()))
        {
            return;
        }
        bool local_4 = !(local_70);
        if (local_4)
        {
            local_4 = true;
        }
        else
        {
            TDataObjectPtr<FRemnantItemConfig> local_56;
            local_56 = local_70.GetRemnantItemConfig();
            local_4 = !((local_56 == local_32.opImplConv()));
        }
        if (local_4)
        {
            return;
        }
        if (local_126)
        {
            ::RemnantUtils::UnequipRemnantSkillAndDropItem(local_126.GetPlayerPawnEntity(), FixedTime.Time);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_RemoveRemnantWhenUsableCountIsZero(const FECSEntity &inout Entity, const FC_RemnantInfo &inout RemnantInfo, const FCS_FixedTime &inout FixedTime) const
    {
        USkillConfig local_22;
        if (RemnantInfo.GetRemainUsableCount() > 0)
        {
            Remove local_8;
            local_8.opCall();
            return;
        }
        Get local_12;
        const FC_PlayerController& local_14 = local_12.opCall();
        if (local_14)
        {
            Remove local_8;
            bool local_19;
            FECSEntity local_18 = local_14.GetPlayerPawnEntity();
            local_19 = true;
            if (local_22 != nullptr)
            {
                if (FSkillUtils::GetSkillIndex(local_18, local_22) == INDEX_NONE)
                {
                    local_19 = false;
                }
                else
                {
                    Get local_28;
                    const FC_SkillBtnDurationEffect& local_30 = local_28.opCall();
                    if (local_30)
                    {
                        if (local_30.Contains(ESkillSlot(9)))
                        {
                            local_19 = false;
                        }
                    }
                }
            }
            if (local_19)
            {
                ::RemnantUtils::UnequipRemnantSkillAndDropItem(local_18, FixedTime.Time);
                local_8.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_RemnantSlotChanged(const FCE_RemnantSlotChangedEvent &inout Event) const
    {
        bool local_1 = false;
        FECSEntity local_10 = ::FASCommonUtils::GetLocalUniquePlayerEntity();
        if ((FECSEntity(Event.Sender) == local_10))
        {
            local_1 = true;
        }
        else
        {
            if ((::FASCommonUtils::GetUniquePlayerEntity(Event.Sender) == local_10))
            {
                local_1 = true;
            }
        }
        if (!(local_1))
        {
            return;
        }
        if (::FASCommonUtils::GetLocalPlayerPawnEntity().IsValid())
        {
            FCE_CombatHUD local_16;
            FFPTime local_22 = FFPTime(-1);
            local_16.CombatHUDReason = ECombatHUDReason(19);
            local_16.bEnabled = true;
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleRemnantQuickSlotReplaced() const
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
            this.ServerJob_HandleRemnantQuickSlotReplaced(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_RemoveRemnantWhenUsableCountIsZero() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_170 = 0;
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
                this.ServerJob_RemoveRemnantWhenUsableCountIsZero(local_40, local_42, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_RemoveRemnantWhenUsableCountIsZero(local_170, local_42, local_6);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_RemnantSlotChanged() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_RemnantSlotChangedEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_RemnantSlotChangedEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_RemnantSlotChanged(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

namespace RemnantUtils
{
void PickupRemnant(const FECSEntity &inout InteractSource, const TDataObjectPtr<FRemnantItemConfig> &inout RemnantItemConfig, const int RemainUsableCount)
{
    int local_18 = 0;
    int local_24 = 0;
    USkillConfig local_124;
    USkillConfig local_126;
    int local_222 = 0;
    if (ECS::GetRuntimeInfo().IsClient)
    {
        return;
    }
    FECSEntity local_10 = FASCommonUtils::GetUniquePlayerEntity(InteractSource);
    if (!(local_10.IsValid()))
    {
        return;
    }
    FECSWorldPtr local_12 = ECS::GetECSWorld();
    RemnantUtils::UnequipRemnantSkillAndDropItem(InteractSource, local_18.Time);
    if (local_24)
    {
        TDataObjectPtr<FItemQuickSlotConfig> local_74 = InventoryUtils::GetQuickSlotConfigByName(n"ConsumableItem_TemporaryAbility");
        TDataObjectPtr<FRemnantItemConfig> local_98 = RemnantItemConfig;
        if (local_98)
        {
            local_126 = local_98.opArrow().ItemSkillConfig;
        }
        else
        {
        }
        local_124 = local_126;
        FBuffConfigRef local_174;
        if (local_98)
        {
            local_174 = local_98.opArrow().ItemBuffConfig;
        }
        else
        {
            local_174 = FBuffConfigRef();
        }
        for (auto& local_212 : local_24.GetAllPlayerPawnEntities())
        {
            if (local_124 != nullptr)
            {
                InventoryUtils::EquipQuickSlotSkill(local_212, local_124, local_74.opArrow().InputSlot);
            }
            if (local_174.IsValid())
            {
                FBuffUtils::AddBuff(local_212, local_174, local_18.Time, local_212, false, -1.0f, 1, false);
            }
        }
        if (local_98)
        {
            local_222.SetRemnantItemConfig(local_98);
            local_222.SetRemainUsableCount(RemainUsableCount);
        }
        CastTo local_226;
        InventoryUtils::ForceSetQuickSlotItem_Internal(local_10, local_74, local_226.opCall());
        SendEvent local_254;
        local_254.opCall(FFPTime(-1));
    }
    return;
}
void UnequipRemnantSkillAndDropItem(const FECSEntity &inout SkillPawnEntity, const FFPTime &inout Time)
{
    int local_16 = 0;
    int local_22 = 0;
    USkillConfig local_244;
    USkillConfig local_246;
    if (ECS::GetRuntimeInfo().IsClient)
    {
        return;
    }
    FECSEntity local_10 = FASCommonUtils::GetUniquePlayerEntity(SkillPawnEntity);
    if (!(local_10.IsValid()))
    {
        return;
    }
    if (!(local_16))
    {
        return;
    }
    if (local_22)
    {
        TDataObjectPtr<FItemQuickSlotConfig> local_72 = InventoryUtils::GetQuickSlotConfigByName(n"ConsumableItem_TemporaryAbility");
        TDataObjectPtr<FRemnantItemConfig> local_96 = local_16.GetRemnantItemConfig();
        if (local_96 && (local_16.GetRemainUsableCount() > 0))
        {
            FDropItemData local_128;
            CastTo local_158;
            local_128.DropItemPackages.Add(FDropItemPackage(local_158.opCall(), 1));
            DropItemsUtils::FDropWeigthChooseItem local_216;
            local_216.DropAllocation = EDropItemAllocation(2);
            local_216.RemnantUsableCount = local_16.GetRemainUsableCount();
            local_216.Drops.Add(local_128);
            FDropMovementConfigData local_242;
            DropItemsUtils::DropItemsFromWeightChooseItem(local_216, local_242, SkillPawnEntity);
        }
        if (local_96)
        {
            local_246 = local_96.opArrow().ItemSkillConfig;
        }
        else
        {
        }
        local_244 = local_246;
        FBuffConfigRef local_294;
        if (local_96)
        {
            local_294 = local_96.opArrow().ItemBuffConfig;
        }
        else
        {
            local_294 = FBuffConfigRef();
        }
        for (auto& local_332 : local_22.GetAllPlayerPawnEntities())
        {
            if (local_244 != nullptr)
            {
                InventoryUtils::UnequipQuickSlotSkill(local_332, local_244, local_72.opArrow().InputSlot);
            }
            if (local_294.IsValid())
            {
                FBuffUtils::RemoveBuff(local_332, local_294, Time, EBuffEndType(0));
            }
        }
        InventoryUtils::ForceSetQuickSlotItem_Internal(local_10, local_72, TDataObjectPtr<FItemConfig>(nullptr));
        Remove local_340;
        local_340.opCall();
        SendEvent local_344;
        local_344.opCall(FFPTime(-1));
    }
    return;
}
void EquipRemnantSkillForNewPawnEntity(const FECSEntity &inout OldPawnEntity, const FECSEntity &inout NewPawnEntity, const FFPTime &inout Time)
{
    int local_16 = 0;
    int local_102 = 0;
    if (ECS::GetRuntimeInfo().IsClient)
    {
        return;
    }
    if (!(FASCommonUtils::GetUniquePlayerEntity(NewPawnEntity).IsValid()))
    {
        return;
    }
    if (!(local_16) || !(local_16.GetRemnantItemConfig()))
    {
        return;
    }
    TDataObjectPtr<FItemQuickSlotConfig> local_68 = InventoryUtils::GetQuickSlotConfigByName(n"ConsumableItem_TemporaryAbility");
    USkillConfig local_70 = local_16.GetRemnantItemConfig().opArrow().ItemSkillConfig;
    FBuffConfigRef local_94 = FBuffConfigRef(local_16.GetRemnantItemConfig().opArrow().ItemBuffConfig);
    if (local_70 != nullptr)
    {
        InventoryUtils::EquipQuickSlotSkill(NewPawnEntity, local_70, local_68.opArrow().InputSlot);
    }
    if (local_94.IsValid())
    {
        FBuffUtils::AddBuff(NewPawnEntity, local_94, Time, NewPawnEntity, false, -1.0f, 1, false);
    }
    if (local_102 && (local_70 != nullptr) && OldPawnEntity.IsValid())
    {
        int local_43 = FSkillUtils::GetSkillIndex(OldPawnEntity, local_70);
        int local_103 = INDEX_NONE;
        if (local_43 != local_103)
        {
            float32 local_104 = 0.0f;
            float32 local_96 = float32((FSkillUtils::GetSkillCDRemainTime(OldPawnEntity, local_43).ToSeconds()));
            float32 local_105 = FSkillUtils::GetSkillCDDuration(OldPawnEntity, local_43);
            if (local_105 > 0.0f)
            {
                local_104 = local_96 / local_105;
            }
            if (local_104 > 0.0f && (local_104 <= 1.0f))
            {
                local_103 = FSkillUtils::GetSkillIndex(NewPawnEntity, local_70);
                FSkillUtils::SetSkillCD(NewPawnEntity, local_103, Time, 1.0f - local_104);
            }
        }
    }
    FFPTime local_108 = FFPTime(-1);
    SendEvent local_116;
    local_116.opCall(local_108);
    return;
}
bool CheckCanChangeRemnantSkill(const FECSEntity &inout PlayerEntity, const FECSEntity &inout PawnEntity)
{
    int local_8 = 0;
    if (!(PlayerEntity))
    {
        return false;
    }
    if (!(local_8))
    {
        return true;
    }
    USkillConfig local_10 = local_8.GetRemnantItemConfig().Get().ItemSkillConfig;
    if (local_10 != nullptr)
    {
        int local_12 = FSkillUtils::GetSkillIndex(PawnEntity, local_10);
        if (local_12 == INDEX_NONE)
        {
            return false;
        }
        if (float32(FSkillUtils::GetSkillCDRemainTime(PawnEntity, local_12).ToSeconds()) > 0.0f && (local_8.GetRemainUsableCount() > 0))
        {
            return false;
        }
        Get local_26;
        const FC_SkillBtnDurationEffect& local_28 = local_26.opCall();
        if (local_28)
        {
            if (local_28.Contains(ESkillSlot(9)))
            {
                return false;
            }
        }
    }
    return true;
}
}

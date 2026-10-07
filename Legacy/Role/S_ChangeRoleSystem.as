
enum EChangeRoleReplaceOutcome
{
    Replaced,
    NoChange,
    FailConfig,
    FailFakeControl,
    FailSpawn,
}


class US_ChangeRoleSystem : UECSScriptSystem
{
    UPROPERTY()
    UDataTable AvatarConfigTable;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> ChangeNameSuccessMessageHint;

    US_ChangeRoleSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_LoadAvatarConfigTable() const
    {
        if (this.AvatarConfigTable == nullptr)
        {
            XError(ELog(0), "AvatarConfigTable is null");
            return;
        }
        FECSWorldPtr local_6 = this.GetECSWorld();
        ModifyOrAdd local_10;
        local_10.opCall().DTRoles = this.AvatarConfigTable;
        return;
    }
    UFUNCTION()
    void ServerJob_TickPlayerChangeName(const FCE_ClientToServerChangeName &inout Event) const
    {
        Modify local_4;
        FC_DSPlayerInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetNickName(Event.PlayerName);
        }
        if (Event.Sender.IsValid())
        {
            SendEvent local_12;
            local_12.opCall(FFPTime(-1));
            ::MessageHintUtils::ShowMessageHint(Event.Sender, this.ChangeNameSuccessMessageHint, TArray<FTextArgument>());
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerChangeSpecialty(const FCE_ClientChangeSpecialty &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        Modify local_8;
        FC_DSPlayerInfo& local_10 = local_8.opCall();
        if (local_10)
        {
            if (local_10.GetPlayerSpecialtyID() != int(Event.FromAvatarId))
            {
                XError(ELog(0), FString().Append("FromAvatarId: ").Append(Event.FromAvatarId).Append(" not equal to DSPlayerInfo.PlayerSpecialtyID: ").Append(local_10.GetPlayerSpecialtyID()));
                return;
            }
            local_10.SetPlayerSpecialtyID(int(Event.ToAvatarId));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePlayerChangeRole(const FCE_ClientToServerChangeRole &inout Event) const
    {
        this.PlayerChangeRoleToSpecialty(Event.Sender, int(Event.SlotIndex), int(Event.AvatarId), Event.bForceChangeRole);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleSwitchMainAvatarGender(const FCE_SwitchMainAvatarGender &inout Event) const
    {
        int local_10 = 0;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        FECSEntity::Modify<FC_PlayerController> local_8 = FECSEntity::Modify<FC_PlayerController>(local_4);
        if (!(local_10))
        {
            return;
        }
        FECSWorldPtr local_16 = local_4.GetWorld();
        Get local_20;
        FFPTime local_14 = FFPTime(local_20.opCall().Time);
        if (int(Event.CurAvatarId) > 0)
        {
            this.TryReplaceAvatarAtSlot(local_4, local_10, 0, int(Event.CurAvatarId), local_14);
        }
        if (int(Event.SwitchAvatarId) > 0)
        {
            this.TryReplaceAvatarAtSlot(local_4, local_10, 1, int(Event.SwitchAvatarId), local_14);
        }
        return;
    }
    EChangeRoleReplaceOutcome TryReplaceAvatarAtSlot(const FECSEntity &inout PlayerEntity, FC_PlayerController &inout PlayerController, const int SlotIndex, const uint AvatarId, const FFPTime &inout FixedTime) const
    {
        bool local_76;
        int local_96 = 0;
        TDataObjectPtr<FAvatarPrefabConfig> local_24 = ::FAvatarPrefabConfig::GetByDataId(AvatarId);
        bool local_49 = !(local_24);
        if (local_49)
        {
            XError(ELog(0), FString().Append("TryReplaceAvatarAtSlot: Cannot find AvatarConfig for AvatarId: ").Append(AvatarId));
            return EChangeRoleReplaceOutcome(2);
        }
        FSoftObjectPath local_64;
        UClass local_70 = (Cast<UClass>(local_64.TryLoad()));
        if (local_70 == nullptr)
        {
            XError(ELog(0), FString().Append("TryReplaceAvatarAtSlot: Prefab is null for AvatarId: ").Append(AvatarId));
            return EChangeRoleReplaceOutcome(2);
        }
        FECSEntity local_74;
        bool local_49_2 = SlotIndex >= 0 && (SlotIndex < PlayerController.GetAllPlayerPawnEntities().Num());
        if (local_49_2)
        {
            local_74 = PlayerController.GetAllPlayerPawnEntities()[SlotIndex];
        }
        if (!(local_74.IsValid()))
        {
            local_76 = false;
        }
        else
        {
            TSoftClassPtr<AECSPrefab> local_90;
            GetDefaulted local_80;
            local_90 = local_80.opCall().PrefabClass;
            local_76 = (local_90 == local_70);
        }
        if (local_76)
        {
            local_96.SetConfigPtr(TDataObjectPtr<FBasePrefabConfig>());
            local_96.SetPrefabType(EPrefabType(1));
            return EChangeRoleReplaceOutcome(1);
        }
        if (!(FECSEntity(PlayerController.GetPlayerPawnEntity()).IsValid()))
        {
            local_49_2 = false;
        }
        else
        {
            Has local_130;
            local_49_2 = local_130.opCall();
        }
        if (local_49_2)
        {
            XError(ELog(42), FString().Append("TryReplaceAvatarAtSlot: Cannot ReplaceAvatar When In Fake Avatar State"));
            return EChangeRoleReplaceOutcome(3);
        }
        bool local_49_3 = local_74.IsValid() && local_74.IsActive();
        FECSEntity local_140;
        if (local_74.IsValid())
        {
            local_140 = local_74;
        }
        else
        {
            local_140 = PlayerController.GetPlayerPawnEntity();
        }
        Get local_150;
        FVector local_146 = local_150.opCall().GetPosition();
        FQuat local_160 = local_150.opCall().GetRotation();
        FName local_166 = FName(FString().Append("Pawn_").Append(PlayerController.GetPlayerId()).Append("_").Append(SlotIndex));
        FECSEntity local_136 = ::FGameModeUtils::CreateAvatarEntity(PlayerEntity, PlayerController, local_146, local_160, local_24, TSubclassOf<AECSPrefab>(nullptr), local_166, local_49_3, false);
        if (!(local_136.IsValid()))
        {
            return EChangeRoleReplaceOutcome(4);
        }
        if (local_49_3)
        {
            Assign local_172;
            local_172.opCall(FC_ImmediatelyCheckOverlappingTag());
        }
        ::FGameModeUtils::ReplaceInitAttribute(local_136, 1);
        if (local_74.IsValid())
        {
            ::DivineSkillUtils::SaveDivineSkillInfo(local_74, FixedTime);
            FGameAttributeUtils::SaveSwitchSyncValues(local_74, FixedTime);
        }
        FFPTime local_180 = FFPTime(-1);
        FCE_ServerToClientChangeRole local_182;
        local_182.SlotIndex = SlotIndex;
        local_182.OldPawnEntity = local_74;
        local_182.NewPawnEntity = local_136;
        return EChangeRoleReplaceOutcome(0);
    }
    UFUNCTION()
    void ServerJob_FinishPlayerChangeRole(const FCE_ServerToClientChangeRole &inout Event) const
    {
        int local_6 = 0;
        bool local_73 = false;
        int local_81 = 0;
        if (!(local_6))
        {
            XError(ELog(0), "PlayerController is null");
            return;
        }
        FECSWorldPtr local_12 = Event.Sender.GetWorld();
        Get local_16;
        FFPTime local_10 = FFPTime(local_16.opCall().Time);
        while (local_6.GetModify_AllPlayerPawnEntities().Num() <= int(Event.SlotIndex))
        {
            local_6.GetModify_AllPlayerPawnEntities().Add(FECSEntity());
        }
        local_6.GetModify_AllPlayerPawnEntities()[Event.SlotIndex] = Event.NewPawnEntity;
        this.AddItemSkillsForPawnEntity(Event.OldPawnEntity, Event.NewPawnEntity, Event.Sender, local_10);
        if (!(::UGameDSConnectionSubsystem::Get().IsConnectedToGameServer()))
        {
            ::FEquipmentUtils::AddInitEquipmentWithoutGS(Event.NewPawnEntity);
        }
        if (::GetAvatarConfig(Event.NewPawnEntity))
        {
            local_73 = local_73 && Event.NewPawnEntity.IsActive();
            if (local_73)
            {
                Modify local_78;
                FC_DSPlayerInfo& local_80 = local_78.opCall();
                if (local_80)
                {
                    local_80.SetPlayerSpecialtyID(local_81);
                }
            }
        }
        if (Event.NewPawnEntity.IsActive())
        {
            ::FSwitchPlayerUtils::SwitchPlayerForChangeRole(Event.OldPawnEntity, Event.NewPawnEntity, local_10);
        }
        if (Event.OldPawnEntity.IsValid())
        {
            ::FLifeCycleUtils::EntityDestroyByChangeRole(Event.OldPawnEntity, local_10);
        }
        return;
    }
    void AddItemSkillsForPawnEntity(const FECSEntity &inout OldPawnEntity, const FECSEntity &inout PawnEntity, const FECSEntity &inout PlayerEntity, const FFPTime &inout Time) const
    {
        ::InventoryUtils::InitQuickSlotConsumableItemsForPawn(PawnEntity);
        ::RemnantUtils::EquipRemnantSkillForNewPawnEntity(OldPawnEntity, PawnEntity, Time);
        return;
    }
    void SendChangeRoleFailed(const FECSEntity &inout PlayerEntity, const int SlotIndex, const uint AvatarId, const EChangeRoleFailReason Reason, const ESwitchPlayerBlockReason BlockReason = ESwitchPlayerBlockReason::None) const
    {
        if (!(PlayerEntity.IsValid()))
        {
            return;
        }
        XWarning(ELog(42), FString().Append("[ChangeRole] rejected Slot=").Append(SlotIndex).Append(" Avatar=").Append(AvatarId).Append(" Reason=").Append(int(Reason)).Append(" BlockReason=").Append(int(BlockReason)));
        FFPTime local_16 = FFPTime(-1);
        FCE_ServerToClientChangeRoleResult local_18;
        local_18.SlotIndex = SlotIndex;
        local_18.AvatarId = AvatarId;
        local_18.bAccepted = false;
        local_18.Reason = Reason;
        local_18.BlockReason = BlockReason;
        return;
    }
    void SendChangeRoleAccepted(const FECSEntity &inout PlayerEntity, const int SlotIndex, const uint AvatarId) const
    {
        if (!(PlayerEntity.IsValid()))
        {
            return;
        }
        FFPTime local_8 = FFPTime(-1);
        FCE_ServerToClientChangeRoleResult local_12;
        local_12.SlotIndex = SlotIndex;
        local_12.AvatarId = AvatarId;
        local_12.bAccepted = true;
        local_12.Reason = EChangeRoleFailReason(0);
        local_12.BlockReason = ESwitchPlayerBlockReason(0);
        return;
    }
    void PlayerChangeRoleToSpecialty(const FECSEntity &inout PlayerEntity, const int SlotIndex, const uint AvatarId, const bool bForceChangeRole = false) const
    {
        int local_6 = 0;
        Get local_18;
        if (!(local_6))
        {
            XError(ELog(0), "PlayerController is null");
            this.SendChangeRoleFailed(PlayerEntity, SlotIndex, AvatarId, EChangeRoleFailReason(1), ESwitchPlayerBlockReason(ESwitchPlayerBlockReason(0)));
            return;
        }
        if (!(bForceChangeRole))
        {
            FECSWorldPtr local_14 = PlayerEntity.GetWorld();
            ESwitchPlayerBlockReason local_9_2 = ::FSwitchPlayerUtils::GetSwitchPlayerBlockReason(PlayerEntity, FFPTime(local_18.opCall().Time));
            if (int(local_9_2) != 0)
            {
                XWarning(ELog(42), FString().Append("SwitchPlayerCondition not met, BlockReason=").Append(int(local_9_2)));
                this.SendChangeRoleFailed(PlayerEntity, SlotIndex, AvatarId, EChangeRoleFailReason(2), ESwitchPlayerBlockReason(local_9_2));
                return;
            }
        }
        UGameDSConnectionSubsystem local_30 = ::UGameDSConnectionSubsystem::Get();
        if (local_30 != nullptr && local_30.IsConnectedToGameServer())
        {
            bool local_32;
            local_32 = false;
            FPbDsPlayerInfo local_42 = local_30.GetPlayerInfo(local_6.GetPlayerId());
            if (local_42.IsValid())
            {
                FPbDsPlayerAvatarCompInfo local_62 = local_42.GetAvatarCompInfo();
                TArray<FPbAvatar> local_76;
                local_62.GetAvatarList(local_76);
                for (auto& local_90 : local_76)
                {
                    if ((local_90.GetAvatarId()) == AvatarId)
                    {
                        local_32 = true;
                        break;
                    }
                }
            }
            if (!(local_32))
            {
                XError(ELog(0), FString().Append("AvatarId: ").Append(AvatarId).Append(" not in Player's AvatarList"));
                this.SendChangeRoleFailed(PlayerEntity, SlotIndex, AvatarId, EChangeRoleFailReason(3), ESwitchPlayerBlockReason(0));
                return;
            }
        }
        if (SlotIndex < 0 || (SlotIndex >= local_6.GetAllPlayerPawnEntities().Num()))
        {
            XError(ELog(0), FString().Append("Invalid SlotIndex: ").Append(SlotIndex));
            this.SendChangeRoleFailed(PlayerEntity, SlotIndex, AvatarId, EChangeRoleFailReason(4), ESwitchPlayerBlockReason(0));
            return;
        }
        FECSEntity local_96 = FECSEntity(local_6.GetAllPlayerPawnEntities()[SlotIndex]);
        if (local_96.IsValid())
        {
            if (!(!(local_96.IsActive()) || (FECSEntity(local_6.GetPlayerPawnEntity()) == local_96)))
            {
                this.SendChangeRoleFailed(PlayerEntity, SlotIndex, AvatarId, EChangeRoleFailReason(5), ESwitchPlayerBlockReason(0));
                return;
            }
        }
        FECSWorldPtr local_14_2 = PlayerEntity.GetWorld();
        EChangeRoleReplaceOutcome local_102 = this.TryReplaceAvatarAtSlot(PlayerEntity, local_6, SlotIndex, AvatarId, FFPTime(local_18.opCall().Time));
        if (int(local_102) == 1)
        {
            this.SendChangeRoleAccepted(PlayerEntity, SlotIndex, AvatarId);
        }
        else
        {
            if (int(local_102) == 2)
            {
                this.SendChangeRoleFailed(PlayerEntity, SlotIndex, AvatarId, EChangeRoleFailReason(6), ESwitchPlayerBlockReason(0));
            }
            else
            {
                if (int(local_102) == 3)
                {
                    this.SendChangeRoleFailed(PlayerEntity, SlotIndex, AvatarId, EChangeRoleFailReason(7), ESwitchPlayerBlockReason(0));
                }
                else
                {
                    if (int(local_102) == 4)
                    {
                        this.SendChangeRoleFailed(PlayerEntity, SlotIndex, AvatarId, EChangeRoleFailReason(8), ESwitchPlayerBlockReason(0));
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_LoadAvatarConfigTable() const
    {
        ECS::GetContextJob();
        this.Job_LoadAvatarConfigTable();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickPlayerChangeName() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClientToServerChangeName> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClientToServerChangeName& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TickPlayerChangeName(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerChangeSpecialty() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClientChangeSpecialty> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClientChangeSpecialty& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_ClientChangeSpecialty, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerChangeSpecialty(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandlePlayerChangeRole() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ClientToServerChangeRole> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ClientToServerChangeRole& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            if (local_60.Validate() == false)
            {
                FString local_70 = "Validate Failed: FCE_ClientToServerChangeRole, sender";
                FString local_66 = local_60.Sender.ToString();
                continue;
            }
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandlePlayerChangeRole(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleSwitchMainAvatarGender() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SwitchMainAvatarGender> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SwitchMainAvatarGender& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleSwitchMainAvatarGender(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_FinishPlayerChangeRole() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ServerToClientChangeRole> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ServerToClientChangeRole& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_FinishPlayerChangeRole(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}


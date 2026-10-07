

// NOTE: class defaults are not authored in this module: FDialogueNode_Speech (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FShopPanelModelData
{
    UPROPERTY()
    TDataObjectPtr<FShopConfig> ShopConfig;

    FShopPanelModelData()
    {
        return;
    }
}

struct FDialogueNode_Speech : FDialogueSectionNodeBase
{
    FDialogueSectionNodeBase _base_FDialogueSectionNodeBase;
    UPROPERTY()
    bool bIsAttachPoint;
    UPROPERTY()
    float32 SubtitleDuration;
    UPROPERTY()
    bool bUseVoiceDuration;
    UPROPERTY()
    TArray<TDataObjectPtr<FDialogueLineConfig>> DialogueLines;
    UPROPERTY()
    TDataObjectPtr<FDialogueLineConfig> DialogueLineOnLeave;

    FDialogueNode_Speech()
    {
        this.bIsAttachPoint = false;
        this.SubtitleDuration = 2.0f;
        this.bUseVoiceDuration = true;
        this.__InitDefaults();
        return;
    }
    bool FillSubtitle(FDialogueSubtitle &inout Subtitle) const
    {
        bool local_30;
        TDataObjectPtr<FDialogueLineConfig> local_24;
        if (!(this.DialogueLineOnLeave))
        {
            local_30 = false;
        }
        else
        {
            FName local_26;
            local_26.GetDataName();
            local_30 = (local_26 == Subtitle.GetDialogueLineName());
        }
        if (local_30)
        {
            local_24 = this.DialogueLineOnLeave;
        }
        else
        {
            FName local_26;
            for (auto& local_68 : this.DialogueLines)
            {
                if (!(local_68))
                {
                    continue;
                }
                local_26.GetDataName();
                if ((!((local_26 == Subtitle.GetDialogueLineName()))))
                {
                    continue;
                }
                local_24 = local_68;
            }
        }
        if (local_24)
        {
            FText local_72;
            local_72.GetSpeakerName();
            Subtitle.SetSpeakerName(local_72);
            FDialogueVOSource local_80;
            if (this.TryFindVoiceSource(local_24, local_80))
            {
                Subtitle.SetVOFile(local_80.VOFile);
            }
            return true;
        }
        return false;
    }
    void FillSection(FDialogueSection &inout Section, const FDialogueDeliveryContext &inout Context) const
    {
        if (this.DialogueLineOnLeave)
        {
            Section.SetSubtitleOnPaused(this.CreateSubtitle(Context, this.DialogueLineOnLeave));
        }
        for (auto& local_38 : this.DialogueLines)
        {
            if (local_38)
            {
                Section.GetModify_Subtitles().Add(this.CreateSubtitle(Context, local_38));
            }
        }
        return;
    }
    bool NeedGoOn_Implementation(const FECSEntity &inout ContextEntity)
    {
        FInstancedStruct::GetPtr local_82;
        FDialogueDeliveryContext local_46;
        if (!(::DialogueUtils::TryFindDialogueContext(ContextEntity, local_46)))
        {
            return false;
        }
        else
        {
            if (this.NextNodeIds.Num() == 0)
            {
                return false;
            }
            else
            {
                FDialogueGraphScriptBase local_58 = local_46.LoadDialogueGraph();
                if (this.NextNodeIds.Num() == 1)
                {
                    FInstancedStruct local_72 = local_58.GetNode(this.NextNodeIds[0]);
                    if (this.bIsAttachPoint && (local_46.GetAttachableDialogues().Num() > 0))
                    {
                        return !((local_82.opCall() == nullptr));
                    }
                    else
                    {
                        FInstancedStruct::GetPtr local_88;
                        FInstancedStruct::GetPtr local_94;
                        return !((local_82.opCall() == nullptr)) || !((local_88.opCall() == nullptr)) || !((local_94.opCall() == nullptr));
                    }
                }
                else
                {
                    int local_97 = 0;
                    for (; local_97 < this.NextNodeIds.Num(); ++local_97)
                    {
                        FInstancedStruct local_76 = local_58.GetNode(this.NextNodeIds[local_97]);
                        if ((FInstancedStruct::GetPtr(local_76).opCall() == nullptr))
                        {
                            XError(ELog(64), FString().Append("Speech Node ").Append(this.NodeId).Append(" has multiple non-option next nodes, not supported"));
                            return false;
                        }
                    }
                    return true;
                }
            }
        }
    }
    bool TryFindVoiceSource(const TDataObjectPtr<FDialogueLineConfig> &inout Line, FDialogueVOSource &out OutVoiceSource) const
    {
        const FDialogueVoiceConfig& local_14;
        if (!(GetVoiceConfig().IsSet()))
        {
            return false;
        }
        int local_11 = 2;
        int local_10 = local_11;
        for (auto& local_28 : local_14.VOSources)
        {
            if ((int(local_28.PlayerGender) == 0 || (int(local_28.PlayerGender) == local_10)))
            {
                return true;
            }
        }
        return false;
    }
    FDialogueSubtitle CreateSubtitle(const FDialogueDeliveryContext &inout Context, const TDataObjectPtr<FDialogueLineConfig> &inout Line) const
    {
        FName local_24;
        local_24.GetDataName();
        FDialogueSubtitle local_22 = FDialogueSubtitle(Context.GetInteractTarget(), int(this.NodeId), local_24);
        local_22.SetDuration(this.SubtitleDuration);
        if (this.bUseVoiceDuration)
        {
            FDialogueVOSource local_36;
            if (this.TryFindVoiceSource(Line, local_36) && (local_36.Duration > 0.0f))
            {
                local_22.SetDuration(local_36.Duration);
            }
        }
        return local_22;
    }
}

struct FDialogueNode_Option : FDialogueSectionNodeBase
{
    FDialogueSectionNodeBase _base_FDialogueSectionNodeBase;
    UPROPERTY()
    FInstancedStruct Condition;
    UPROPERTY()
    TDataObjectPtr<FDialogueLineConfig> OptionText;
    UPROPERTY()
    TDataObjectPtr<FDialogueOptionStyleConfig> OptionStyle;

    FDialogueNode_Option()
    {
        return;
    }
    FName GetOptionName() const
    {
        if (this.OptionText.IsSet())
        {
            FName local_3;
            local_3.GetDataName();
            return local_3;
        }
        return NAME_None;
    }
    bool CheckCondition(const FECSEntity &inout DialogueContextEntity, const FDialogueDeliveryContext &inout Context) const
    {
        if ((FInstancedStruct::GetPtr(this.Condition).opCall() == nullptr))
        {
            return true;
        }
        return DialogueContextEntity.CheckCondition(Context.GetInteractTarget());
    }
    bool FillOption(FDialogueOptionInfo &inout Option) const
    {
        if (!(this.OptionText.IsSet()))
        {
            return false;
        }
        Option.SetOptionStyle(this.OptionStyle);
        return true;
    }
    FDialogueOptionInfo CreateOptionInfo() const
    {
        return FDialogueOptionInfo(int(this.NodeId));
    }
    void FillSection(FDialogueSection &inout Section, const FDialogueDeliveryContext &inout Context) const
    {
        if (!(this.CheckCondition(Section.GetDialogueContextEntity(), Context)))
        {
            return;
        }
        TArray<uint> local_6;
        Context.GatherRelatedActionNodeIds(int(this.NodeId), local_6);
        FDialogueOptionInfo local_72 = this.CreateOptionInfo();
        local_72.SetRelatedActionNodeIds(local_6);
        Section.GetModify_Options().Add(local_72);
        return;
    }
}

struct FDialogueNode_AddMetaBuff : FDialogueActionNodeBase
{
    FDialogueActionNodeBase _base_FDialogueActionNodeBase;
    UPROPERTY()
    TDataObjectPtr<FMetaBuffConfig> MetaBuffConfig;

    FDialogueNode_AddMetaBuff()
    {
        this.__InitDefaults();
        return;
    }
    void InternalExecute_Implementation(const FECSEntity &inout ContextEntity)
    {
        if (!(this.MetaBuffConfig.IsSet()))
        {
            XError(ELog(64), FString().Append("AddMetaBuff Node ").Append(this.NodeId).Append(" failed, MetaBuffConfig is not set"));
            return;
        }
        Has local_12;
        if (!(local_12.opCall()))
        {
            XError(ELog(64), FString().Append("AddMetaBuff Node ").Append(this.NodeId).Append(" failed, Player Controller is not found"));
            return;
        }
        if (!(::FMetaBuffUtils::AddMetaBuff(ContextEntity, this.MetaBuffConfig, TArray<TDataObjectPtr<FGameplayModifierConfig>>(), TArray<TDataObjectPtr<FMetaBuffCapabilityConfig>>())))
        {
            XError(ELog(64), FString().Append("AddMetaBuff Node ").Append(this.NodeId).Append(" failed, meta buff config=").Append(this.MetaBuffConfig.GetDataName()));
        }
        return;
    }
}

struct FDialogueNode_OpenFrontendSystem : FDialogueActionNodeBase
{
    FDialogueActionNodeBase _base_FDialogueActionNodeBase;
    UPROPERTY()
    UFrontendSystemConfig System;

    FDialogueNode_OpenFrontendSystem()
    {
        this.System = nullptr;
        this.__InitDefaults();
        return;
    }
    void InternalExecute_Implementation(const FECSEntity &inout ContextEntity)
    {
        FECSEntity local_4 = ::FASCommonUtils::GetLocalPlayerProxy();
        if (!(::FrontendSystemUtil::IsSystemOpen(local_4, this.System)))
        {
            ::FrontendSystemUtil::EnterSystem(local_4, this.System);
        }
        else
        {
            XWarning(ELog(64), FString().Append("Frontend System ").Append(this.System.GetName()).Append(" is already open, skipping enter system node ").Append(this.NodeId));
        }
        return;
    }
}

struct FDialogueNode_DebugSpawnPrefab : FDialogueActionNodeBase
{
    FDialogueActionNodeBase _base_FDialogueActionNodeBase;
    UPROPERTY()
    FSoftClassPath PrefabToSpawn;
    UPROPERTY()
    FVector RelativeLocation;
    UPROPERTY()
    float32 RelativeYaw;

    FDialogueNode_DebugSpawnPrefab()
    {
        this.RelativeYaw = 0.0f;
        this.RelativeLocation = FVector(-1000.0, 0.0, 0.0);
        this.__InitDefaults();
        return;
    }
    void InternalExecute_Implementation(const FECSEntity &inout ContextEntity)
    {
        FDialogueDeliveryContext local_46;
        int local_54 = 0;
        if (!(::DialogueUtils::TryFindDialogueContext(ContextEntity, local_46)))
        {
            return;
        }
        FTransform local_80 = FTransform(FTransform::Identity);
        local_80.SetLocation(local_54.GetPosition());
        local_80.SetRotation(local_54.GetRotation());
        FVector local_86 = local_80.TransformPosition(this.RelativeLocation);
        System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("KLSpawnMonster ").Append(this.PrefabToSpawn.ToString()).Append(" ").Append(local_86.X).Append(" ").Append(local_86.Y).Append(" ").Append(local_86.Z).Append(" ").Append(float32(local_80.TransformRotation(FRotator(0.0, this.RelativeYaw, 0.0)).Yaw)), nullptr);
        return;
    }
}

struct FDialogueNode_DebugSpawnMonsterByID : FDialogueActionNodeBase
{
    FDialogueActionNodeBase _base_FDialogueActionNodeBase;
    UPROPERTY()
    TDataObjectPtr<FMonsterMainConfig> MonsterConfig;
    UPROPERTY()
    UDataTable MonsterDifficultyLevelConfig;
    UPROPERTY()
    int MonsterSpawnFixedDifficultyLevel;
    UPROPERTY()
    bool bEnableAI;
    UPROPERTY()
    FVector RelativeLocation;
    UPROPERTY()
    float32 RelativeYaw;

    FDialogueNode_DebugSpawnMonsterByID()
    {
        this.MonsterDifficultyLevelConfig = nullptr;
        this.RelativeYaw = 0.0f;
        this.MonsterSpawnFixedDifficultyLevel = 0;
        this.bEnableAI = true;
        this.RelativeLocation = FVector(-1000.0, 0.0, 0.0);
        this.__InitDefaults();
        return;
    }
    void InternalExecute_Implementation(const FECSEntity &inout ContextEntity)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}

struct FDialogueNode_DebugTriggerTargetAbilitySignal : FDialogueActionNodeBase
{
    FDialogueActionNodeBase _base_FDialogueActionNodeBase;
    UPROPERTY()
    TSoftClassPtr<UEASAbility> AbilityClass;
    UPROPERTY()
    FString SignalName;

    FDialogueNode_DebugTriggerTargetAbilitySignal()
    {
        this.__InitDefaults();
        return;
    }
    void InternalExecute_Implementation(const FECSEntity &inout ContextEntity)
    {
        if (!(this.AbilityClass.IsValid()))
        {
            XError(ELog(64), FString().Append("TriggerTargetAbilitySignal: AbilityClass is not set"));
            return;
        }
        if (this.SignalName.IsEmpty())
        {
            XError(ELog(64), FString().Append("TriggerTargetAbilitySignal: SignalName is not set"));
            return;
        }
        FDialogueDeliveryContext local_54;
        if (!(::DialogueUtils::TryFindDialogueContext(ContextEntity, local_54)))
        {
            XError(ELog(64), FString().Append("TriggerTargetAbilitySignal: Failed to find dialogue context"));
            return;
        }
        FECSEntity local_58 = FECSEntity(local_54.GetInteractTarget());
        if (!(local_58.IsValid()))
        {
            XError(ELog(64), FString().Append("TriggerTargetAbilitySignal: InteractTarget is invalid"));
            return;
        }
        int local_63 = FAbilityUtils::GetAbilityIndexByClass(local_58, this.AbilityClass.Get());
        if (local_63 < 0)
        {
            XError(ELog(64), FString().Append("TriggerTargetAbilitySignal: Ability not found on target entity"));
            return;
        }
        bool local_64 = false;
        FC_EASAbilityInstance& local_66 = FAbilityUtils::GetAbilityInstance(local_58, local_63, local_64);
        if (!(!(local_64)) && local_66)
        {
            FAbilityUtils::InvokeSignal(local_66, local_58, FName(this.SignalName), FFPTime(-1), true);
        }
        else
        {
            XError(ELog(64), FString().Append("TriggerTargetAbilitySignal: Failed to get ability instance at index ").Append(local_63));
        }
        return;
    }
}


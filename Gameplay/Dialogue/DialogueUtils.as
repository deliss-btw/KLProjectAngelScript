
namespace DialogueUtils
{
bool IsPlayingDialogue(const FECSEntity &inout DialogueEntity)
{
    Has local_4;
    bool local_5;
    if (local_4.opCall())
    {
        local_5 = true;
    }
    else
    {
        Has local_10;
        local_5 = local_10.opCall();
    }
    return local_5;
}
EDialogueVoiceType GetDialogueVoiceType(const EDialogueType DialogueType)
{
    int local_1 = int(DialogueType);
    if (local_1 <= 1)
    {
        if (local_1 != 0)
        {
            if (local_1 != 1)
            {
            }
        }
        else
        {
            return EDialogueVoiceType(0);
        }
    }
    return EDialogueVoiceType(0);
}
bool TryFindDialogueContext(const FECSEntity &inout DialogueEntity, FDialogueDeliveryContext &out DialogueContext)
{
    FDialogueDeliveryContext local_46;
    DialogueContext = local_46;
    if (!(DialogueEntity.IsValid()))
    {
        XError(ELog(64), FString().Append("[Dialogue] No context entity found"));
        return false;
    }
    Get local_58;
    const FC_DialogueAmbientPlaying& local_60 = local_58.opCall();
    if (local_60)
    {
        DialogueContext = local_60.GetDialogueContext();
        return true;
    }
    Get local_64;
    const FC_DialogueSimplePlaying& local_66 = local_64.opCall();
    if (local_66)
    {
        DialogueContext = local_66.GetDialogueContext();
        return true;
    }
    XError(ELog(64), FString().Append("[Dialogue] No dialogue context found"));
    return false;
}
bool TryFillDialogueSubtitle(const FECSEntity &inout DialogueEntity, FDialogueSubtitle &inout Subtitle)
{
    FDialogueDeliveryContext local_46;
    if (!(DialogueUtils::TryFindDialogueContext(DialogueEntity, local_46)))
    {
        return false;
    }
    return local_46.FillSubtitle(Subtitle);
}
void SetDialogueLastNodeId(const FECSEntity &inout DialogueEntity, const uint LastNodeId)
{
    Modify local_4;
    FC_DialogueSimplePlaying& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.GetDialogueContext().SetLastNodeId(LastNodeId);
        return;
    }
    Modify local_12;
    FC_DialogueAmbientPlaying& local_14 = local_12.opCall();
    if (local_14)
    {
        local_14.GetDialogueContext().SetLastNodeId(LastNodeId);
        return;
    }
    XError(ELog(64), FString().Append("[Dialogue] Failed to set dialogue last node id: ").Append(LastNodeId));
    return;
}
TDataObjectPtr<FDialogueConfig> GetDialogueConfig(const FECSEntity &inout DialogueEntity)
{
    FDialogueDeliveryContext local_46;
    if (!(DialogueUtils::TryFindDialogueContext(DialogueEntity, local_46)))
    {
        return TDataObjectPtr<FDialogueConfig>();
    }
    return local_46.GetDialogueConfig();
}
UFUNCTION()
FName GetDialogueName(const TDataObjectPtr<FDialogueConfig> &inout DialogueConfig)
{
    FName local_3;
    if (!(DialogueConfig.IsSet()))
    {
        return local_3;
    }
    local_3.GetDataName();
    return local_3;
}
bool TryFindDialogueEntity(const TDataObjectPtr<FDialogueConfig> &inout Dialogue, FECSEntity &out DialogueEntity)
{
    const UDialogueSettings local_6;
    FECSEntity local_4;
    int local_184 = 0;
    int local_238;
    FString local_254;
    DialogueEntity = local_4;
    GetGameplaySettings<UDialogueSettings> local_8;
    local_6 = local_8;
    if (GetInteractTargetNPC().IsSet())
    {
        TDataObjectPtr<FNPCMainConfig> local_36 = GetInteractTargetNPC();
        FECSRuntimeView local_100 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        FECSRuntimeViewIterator local_142 = local_100.Iterator();
        for (; local_142.CanProceed;)
        {
            const FECSEntity& local_178 = local_142.Proceed();
            TDataObjectPtr<FNPCMainConfig> local_60;
            local_60 = local_184.GetMainConfig();
            if ((!((local_60 == local_36.opImplConv()))))
            {
                continue;
            }
            for (auto& local_252 : local_238.InteractionPoints)
            {
                local_252.PointType.GetDataName();
                if ((local_254 == local_6.DialogueInteractionPointName))
                {
                    DialogueEntity = local_178;
                    return true;
                }
            }
            local_178.GetEntityName();
            FString local_258 = local_254;
        }
    }
    return false;
}
bool ActivatePlayerDialogue(const TDataObjectPtr<FDialogueConfig> &inout Dialogue, const FECSEntity &inout PlayerEntity)
{
    int local_12 = 0;
    int local_118 = 0;
    if (!(Dialogue.IsSet()))
    {
        XError(ELog(64), FString().Append("[Dialogue] Failed to Activate Player Dialogue: dialogue is null."));
        return false;
    }
    FName local_11;
    local_11.GetDataName();
    FName local_9 = local_11;
    if (!(PlayerEntity.IsValid()))
    {
        XError(ELog(64), FString().Append("[Dialogue] Failed to Activate Player Dialogue: ").Append(local_9).Append(", player entity is invalid."));
        return false;
    }
    int local_13 = local_12;
    if (local_13 != 0)
    {
        XError(ELog(64), FString().Append("[Dialogue] Failed to Activate Player Dialogue: ").Append(local_9).Append(", dialogue scope is not personal."));
        return false;
    }
    if (!(GetInteractTargetNPC().IsSet()))
    {
        XError(ELog(64), FString().Append("[Dialogue] Failed to Activate Player Dialogue: ").Append(local_9).Append(", InteractTargetNPC is not set."));
        return false;
    }
    TDataObjectPtr<FLevelInfoConfig> local_38 = GetLevelInfo();
    if (local_38.IsSet() && !((local_38 == FLevelUtils::GetCurrentLevelInfoConfig(nullptr).opImplConv())))
    {
        XLog(ELog(64), FString().Append("[Dialogue] Skip Activate Player Dialogue: ").Append(local_9).Append(", level is not match"));
        return false;
    }
    XLog(ELog(64), FString().Append("[Dialogue] Activate Player Dialogue: ").Append(local_9));
    local_118.GetModify_NPCDialogueMap().FindOrAdd(GetInteractTargetNPC()).GetDialogueInfos().FindOrAdd(local_9) = FDialogueInfo(Dialogue);
    return true;
}
bool DeactivatePlayerDialogue(const TDataObjectPtr<FDialogueConfig> &inout Dialogue, const FECSEntity &inout PlayerEntity)
{
    if (!(Dialogue.IsSet()))
    {
        XError(ELog(64), FString().Append("[Dialogue] Failed to Activate Player Dialogue: dialogue is null."));
        return false;
    }
    FName local_11;
    local_11.GetDataName();
    FName local_9 = local_11;
    if (!(PlayerEntity.IsValid()))
    {
        XError(ELog(64), FString().Append("[Dialogue] Failed to Activate Player Dialogue: ").Append(local_9).Append(", player entity is invalid."));
        return false;
    }
    XLog(ELog(64), FString().Append("[Dialogue] Deactivate Player Dialogue: ").Append(local_9));
    Modify local_16;
    FC_DialogueStateCache& local_18 = local_16.opCall();
    if (local_18)
    {
        if (local_18.HistoryCache.Contains(local_9))
        {
        }
        if (local_18.HistoryCache.Num() == 0)
        {
            Remove local_24;
            local_24.opCall();
        }
    }
    Modify local_28;
    FC_PlayerDialogues& local_30 = local_28.opCall();
    if (local_30)
    {
        TDataObjectPtr<FNPCMainConfig> local_54 = GetInteractTargetNPC();
        if (local_54.IsSet())
        {
            if (local_30.GetNPCDialogueMap().Contains(local_54))
            {
                FDialogueInfoList& local_80 = local_30.GetModify_NPCDialogueMap()[local_54];
                if (local_80.GetDialogueInfos().Num() == 0)
                {
                }
            }
        }
        if (local_30.GetNPCDialogueMap().Num() == 0)
        {
            Remove local_84;
            local_84.opCall();
        }
        return true;
    }
    return false;
}
UFUNCTION()
bool ActivateGlobalDialogue(const TDataObjectPtr<FDialogueConfig> &inout Dialogue, const FECSEntity &inout DialogueEntity = ENTITY_NULL)
{
    int local_18 = 0;
    if (!(Dialogue))
    {
        FName local_8;
        local_8.GetDataName();
        XError(ELog(64), FString().Append("[Dialogue] Failed to Activate Global Dialogue: ").Append(local_8).Append(", dialogue is null."));
        return false;
    }
    else
    {
        FName local_8;
        if (0 != 2)
        {
            local_8.GetDataName();
            XError(ELog(64), FString().Append("[Dialogue] Failed to Activate Global Dialogue: ").Append(local_8).Append(", dialogue scope is not global."));
            return false;
        }
        else
        {
            if (DialogueEntity.IsValid())
            {
                local_8.GetDataName();
                XLog(ELog(64), FString().Append("[Dialogue] Activate Global Dialogue: ").Append(local_8));
                FDialogueInfo local_46 = FDialogueInfo(Dialogue);
                local_8.GetDataName();
                local_18.GetModify_DialogueInfos().FindOrAdd(local_8) = local_46;
                return true;
            }
            else
            {
                FECSEntity local_50;
                if (DialogueUtils::TryFindDialogueEntity(Dialogue, local_50))
                {
                    local_8.GetDataName();
                    XLog(ELog(64), FString().Append("[Dialogue] Activate Global Dialogue: ").Append(local_8));
                    FDialogueInfo local_46_2 = FDialogueInfo(Dialogue);
                    local_8.GetDataName();
                    local_18.GetModify_DialogueInfos().FindOrAdd(local_8) = local_46_2;
                    return true;
                }
                else
                {
                    local_8.GetDataName();
                    XError(ELog(64), FString().Append("[Dialogue] Failed to Activate Global Dialogue: ").Append(local_8).Append(", no dialogue entity found."));
                    return false;
                }
            }
        }
    }
}
UFUNCTION()
bool DeactivateGlobalDialogue(const TDataObjectPtr<FDialogueConfig> &inout Dialogue, const FECSEntity &inout DialogueEntity = ENTITY_NULL)
{
    FC_GlobalDialogues& local_138;
    Remove local_144;
    FName local_4;
    local_4.GetDataName();
    FName local_2 = local_4;
    if (!(Dialogue))
    {
        XError(ELog(64), FString().Append("[Dialogue] Failed to Deactivate Global Dialogue: ").Append(local_2).Append(", dialogue is null."));
        return false;
    }
    else
    {
        XLog(ELog(64), FString().Append("[Dialogue] Deactivate Global Dialogue: ").Append(local_2));
        FECSRuntimeView local_52 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_56;
        local_56.opCall();
        FECSRuntimeViewIterator local_90 = local_52.Iterator();
        for (; local_90.CanProceed;)
        {
            const FECSEntity& local_126 = local_90.Proceed();
            Modify local_130;
            FC_DialogueStateCache& local_132 = local_130.opCall();
            if (local_132)
            {
                if (local_132.HistoryCache.Contains(local_2))
                {
                    XLog(ELog(64), FString().Append("[Dialogue] Clear Dialogue History for Player: ").Append(local_126.GetEntityName()).Append(", Dialogue: ").Append(local_2));
                }
            }
        }
        if (DialogueEntity.IsValid())
        {
            Modify local_136;
            local_138 = local_136.opCall();
            if (local_138)
            {
                if (local_138.GetDialogueInfos().Num() == 0)
                {
                    local_144.opCall();
                }
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            bool local_145;
            local_145 = false;
            FECSRuntimeView local_30 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
            Include local_168;
            local_168.opCall();
            FECSRuntimeViewIterator local_124 = local_30.Iterator();
            for (; local_124.CanProceed;)
            {
                const FECSEntity& local_126_2 = local_124.Proceed();
                if (local_138.GetDialogueInfos().Contains(local_2))
                {
                    if (local_138.GetDialogueInfos().Num() == 0)
                    {
                        local_144.opCall();
                    }
                    local_145 = true;
                }
            }
            return local_145;
        }
    }
}
UFUNCTION()
bool StartAmbientDialogue(const FECSEntity &inout DialogueEntity, const TDataObjectPtr<FAmbientDialogueConfig> &inout DialogueConfig, const FECSEntity &inout TriggerPlayer = ENTITY_NULL, const float32 InterruptDistance = 500.f, const float32 ResumeDistance = -1.f)
{
    int local_45 = 0;
    if (!(DialogueConfig.IsSet()))
    {
        XError(ELog(64), FString().Append("[Dialogue] Failed to Start Ambient Dialogue: dialogue config is null."));
        return false;
    }
    if (!(DialogueEntity.IsValid()))
    {
        FName local_9;
        local_9.GetDataName();
        XError(ELog(64), FString().Append("[Dialogue] Failed to Start Ambient Dialogue: ").Append(local_9).Append(", dialogue entity is invalid."));
        return false;
    }
    FFPTime local_16 = FFPTime(-1);
    FCE_NotifyStartAmbientDialogue local_20;
    local_20.TriggerPlayer = TriggerPlayer;
    local_20.DialogueEntity = DialogueEntity;
    local_20.DialogueConfig = DialogueConfig;
    local_20.BroadcastScope = EDialogueScope(local_45);
    local_20.InterruptDistance = InterruptDistance;
    local_20.ResumeDistance = ResumeDistance;
    return true;
}
UFUNCTION()
bool StopAmbientDialogue(const FECSEntity &inout DialogueEntity)
{
    if (!(DialogueEntity.IsValid()))
    {
        XError(ELog(64), FString().Append("[Dialogue] Failed to Stop Ambient Dialogue: dialogue entity is invalid."));
        return false;
    }
    Has local_12;
    if (!(local_12.opCall()))
    {
        XError(ELog(64), FString().Append("[Dialogue] Failed to Stop Ambient Dialogue: ").Append(DialogueEntity.GetEntityName()).Append(" is not playing ambient dialogue."));
        return false;
    }
    XLog(ELog(64), FString().Append("[Dialogue] Stop Ambient Dialogue: ").Append(DialogueEntity.GetEntityName()));
    FC_DialogueEndedTag local_20;
    Assign local_18;
    local_18.opCall(local_20);
    return true;
}
UFUNCTION()
bool StartNarrationDialogue(const TDataObjectPtr<FNarrationDialogueConfig> &inout DialogueConfig, const FECSEntity &inout TriggerPlayer = FECSEntity())
{
    const FNarrationDialogueConfig& local_10;
    Include local_64;
    int local_156 = 0;
    if (!(DialogueConfig.IsSet()))
    {
        XError(ELog(64), FString().Append("[Dialogue] Failed to Start Narration Dialogue: dialogue config is null."));
        return false;
    }
    XLog(ELog(64), FString().Append("[Dialogue] Start Narration Dialogue: ").Append(local_10.GetDataName()).Append(", BroadcastScope=").Append(local_10.BroadcastScope));
    TArray<FECSEntity> local_16;
    switch (int(local_10.BroadcastScope))
    {
    case 0:
    {
        if (!(TriggerPlayer.IsValid()))
        {
            XError(ELog(64), FString().Append("[Dialogue] Failed to Start Narration Dialogue: ").Append(local_10.GetDataName()).Append(", Personal mode requires a valid TriggerPlayer."));
            return false;
        }
        local_16.Add(TriggerPlayer);
        break;
    }
    case 1:
    {
        if (!(TriggerPlayer.IsValid()))
        {
            XError(ELog(64), FString().Append("[Dialogue] Failed to Start Narration Dialogue: ").Append(local_10.GetDataName()).Append(", Team mode requires a valid TriggerPlayer."));
            return false;
        }
        FECSRuntimeView local_60 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        local_64.opCall();
        FECSRuntimeViewIterator local_98 = local_60.Iterator();
        for (; local_98.CanProceed;)
        {
            FECSEntity local_134 = local_98.Proceed();
            if ((local_134 == TriggerPlayer) || FTeamUtils::IsInSameTeam(local_134, TriggerPlayer))
            {
                local_16.Add(local_134);
            }
        }
        break;
    }
    case 2:
    {
        FECSRuntimeView local_38 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        local_64.opCall();
        FECSRuntimeViewIterator local_132 = local_38.Iterator();
        for (; local_132.CanProceed;)
        {
            FECSEntity local_134_2 = local_132.Proceed();
            local_16.Add(local_134_2);
        }
        break;
    }
    }
    auto local_142 = local_16.Iterator();
    for (; local_142.CanProceed;)
    {
        FECSEntity local_134_3 = local_142.Proceed();
        FFPTime local_154 = FFPTime(-1);
        local_156.DialogueConfig = DialogueConfig;
    }
    return true;
}
bool IsSameDialogue(const TDataObjectPtr<FDialogueConfig> &inout Dialogue1, const TDataObjectPtr<FDialogueConfig> &inout Dialogue2)
{
    if (!(Dialogue1.IsSet()) || !(Dialogue2.IsSet()))
    {
        return false;
    }
    FName local_4;
    local_4.GetDataName();
    FName local_6;
    local_6.GetDataName();
    return (local_4 == local_6);
}
FText GetNPCDisplayName(const TDataObjectPtr<FNPCMainConfig> &inout NPCConfig)
{
    FText __r;
    if (!(NPCConfig.IsSet()))
    {
        return FText();
    }
    if (!(GetPresentationConfig().IsSet()))
    {
        return FText();
    }
    return __r;
}
}

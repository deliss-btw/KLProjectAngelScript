
enum ESoundSourceType
{
    Root,
    Part,
    Socket,
    Offset,
}

const FConsoleVariable CVar_FX_DebugLog = FConsoleVariable();
const FConsoleVariable CVar_FX_DebugSocketVis = FConsoleVariable();

struct FSoundSourceConfig
{
    UPROPERTY()
    ESoundSourceType SourceType = ESoundSourceType(0);
    UPROPERTY()
    bool bFollow = true;
    UPROPERTY()
    FName WeaponMeshComponent;
    UPROPERTY()
    EGameAudioEmitterPartType PartType = EGameAudioEmitterPartType(0);
    UPROPERTY()
    FName Socket;
    UPROPERTY()
    FVector3f LocationOffset;
    UPROPERTY()
    FRotator3f RotationOffset;


}

class UESMAction_InstantSFX : UESMSFXBaseSpanAction
{
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> Event = nullptr;
    UPROPERTY()
    FSoundSourceConfig SourceConfig;
    UPROPERTY()
    bool bSelfOnly = false;
    UPROPERTY()
    bool bOnSpanEntry = false;


    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(2);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    bool IsUseAsInstant_Implementation() const
    {
        bool local_1 = (!(this.bOnSpanEntry) == !(false));
        return local_1;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("ж’­ж”ѕйџіж•€: ").Append(this.Event.GetAssetName());
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_7;
        if (!(this.CheckEventValied(this.Event)))
        {
            return;
        }
        if (!(this.bSelfOnly))
        {
            local_7 = false;
        }
        else
        {
            Has local_6;
            bool local_1 = (!(local_6.opCall()) == !(false));
            local_7 = local_1;
        }
        if (local_7)
        {
            XWarning(ELog(0), FString().Append("SFX Action: ").Append(this.DebugGetPath()).Append(", bSelfOnly && Context.Entity.Has<FC_LocalTag>() == false."));
            return;
        }
        ::FSoundSourceConfig::PostEvent(Context.GetEntity(), this.Event, this.SourceConfig, false, false, Context.GetWorld());
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        XLogIf(CVar_FX_DebugLog.GetBool(), ELog(1), FString().Append("SFX Action Exit: ").Append(this.DebugGetPath()).Append(", Exit Begin Time: ").Append(Time.ActionTime).Append("-----------------."));
        return;
    }
    UFUNCTION()
    void OnInitData_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        XLogIf(CVar_FX_DebugLog.GetBool(), ELog(1), FString().Append("SFX Action OnInitData: ").Append(this.DebugGetPath()));
        return;
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void PreviewBegin_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time, const bool bNewlyBegin)
    {
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        UESMAsset::ModifyAutoCustomConfig local_4;
        UESMPreloadCustomData local_8 = local_4.opCall(this);
        if (local_8 != nullptr)
        {
            local_8.PreloadEvents.AddUnique(this.Event);
        }
        return;
    }
    bool CheckEventValied(const TSoftObjectPtr<UAkAudioEvent> &inout InEvent) const
    {
        if (InEvent.IsNull())
        {
            XWarning(ELog(0), FString().Append("SFX Action: ").Append(this.DebugGetPath()).Append(" , The event is not configured yet."));
            return false;
        }
        if (InEvent.IsPending())
        {
            XWarning(ELog(0), FString().Append("SFX Action: ").Append(this.DebugGetPath()).Append(" , The event is not loaded yet. try to loading ").Append(InEvent.GetAssetName()));
        }
        return true;
    }
}

struct FBlendableInstantSFX
{
    UPROPERTY()
    bool bEntered = false;


}

class UESMAction_DurationalSFX : UESMSFXBaseSpanAction
{
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> EnterEvent = nullptr;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> ExitEvent = nullptr;
    UPROPERTY()
    FSoundSourceConfig SourceConfig;
    UPROPERTY()
    bool bSelfOnly = false;


    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(0);
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(2);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        return FString().Append("ж’­ж”ѕйџіж•€:Enter: ").Append(this.EnterEvent.GetAssetName()).Append(", Exit: ").Append(this.ExitEvent.GetAssetName());
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
    UFUNCTION()
    bool CanPreview_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_7;
        if (!(this.CheckEventValied(this.EnterEvent)))
        {
            return;
        }
        if (!(this.bSelfOnly))
        {
            local_7 = false;
        }
        else
        {
            Has local_6;
            bool local_1 = (!(local_6.opCall()) == !(false));
            local_7 = local_1;
        }
        if (local_7)
        {
            return;
        }
        ::FSoundSourceConfig::PostEvent(Context.GetEntity(), this.EnterEvent, this.SourceConfig, true, false, Context.GetWorld());
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_7;
        if (!(this.CheckEventValied(this.ExitEvent)))
        {
            return;
        }
        if (!(this.bSelfOnly))
        {
            local_7 = false;
        }
        else
        {
            Has local_6;
            bool local_1 = (!(local_6.opCall()) == !(false));
            local_7 = local_1;
        }
        if (local_7)
        {
            return;
        }
        ::FSoundSourceConfig::PostEvent(Context.GetEntity(), this.ExitEvent, this.SourceConfig, true, true, Context.GetWorld());
        return;
    }
    UFUNCTION()
    void PreviewBegin_Implementation(const FESMPreviewContext &inout Context, const FESMActionTime &inout Time, const bool bNewlyBegin)
    {
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        UESMAsset::ModifyAutoCustomConfig local_4;
        UESMPreloadCustomData local_8 = local_4.opCall(this);
        if (local_8 != nullptr)
        {
            local_8.PreloadEvents.AddUnique(this.EnterEvent);
            local_8.PreloadEvents.AddUnique(this.ExitEvent);
        }
        return;
    }
    bool CheckEventValied(const TSoftObjectPtr<UAkAudioEvent> &inout Event) const
    {
        if (Event.IsNull())
        {
            XWarning(ELog(0), FString().Append("Action: ").Append(this.DebugGetPath()).Append(" , The event is not configured yet."));
            return false;
        }
        if (Event.IsPending())
        {
            XWarning(ELog(0), FString().Append("SFX Action: ").Append(this.DebugGetPath()).Append(" , The event is not loaded yet. try to loading ").Append(Event.GetAssetName()));
        }
        return true;
    }
}

class UESMAction_KeepSwitchValue : UESMSwitchBaseSpanAction
{
    UPROPERTY()
    TSoftObjectPtr<UAkSwitchValue> KeepSwitchValue = nullptr;
    UPROPERTY()
    TSoftObjectPtr<UAkSwitchValue> ResetSwitchValue = nullptr;

    UESMAction_KeepSwitchValue()
    {
        return;
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(2);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(this.CheckEventValied(this.KeepSwitchValue)))
        {
            return;
        }
        if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
        {
            FGameAudioUtils::SetAudioSwitch(this.KeepSwitchValue, Context.GetEntity(), FOnLoadEventCallbackWithEntity(), true, Context.GetWorld());
            return;
        }
        UAkSwitchValue local_10;
        FGameAudioUtils::SetSwitch(Context.GetEntity(), local_10);
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(this.CheckEventValied(this.ResetSwitchValue)))
        {
            return;
        }
        if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
        {
            FGameAudioUtils::SetAudioSwitch(this.ResetSwitchValue, Context.GetEntity(), FOnLoadEventCallbackWithEntity(), true, Context.GetWorld());
            return;
        }
        UAkSwitchValue local_10;
        FGameAudioUtils::SetSwitch(Context.GetEntity(), local_10);
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        UAkSwitchValue local_2;
        UAkSwitchValue local_8;
        UAkSwitchValue local_10;
        if (local_2 != nullptr && (local_2 == nullptr))
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "Reset switch value not set");
        }
        if (local_2 != nullptr && (local_8 != nullptr))
        {
            if (FGameAudioUtils::GetSwitchGroupId(local_10) != FGameAudioUtils::GetSwitchGroupId(local_10))
            {
                Info.AddDataInvalidComment(EESMDataValidType(2), "Reset switch group is not paired with Keep switch group");
            }
        }
        UESMAsset::ModifyAutoCustomConfig local_16;
        UESMPreloadCustomData local_20 = local_16.opCall(this);
        if (local_20 != nullptr)
        {
            local_20.PreloadSwitches.AddUnique(this.KeepSwitchValue);
            local_20.PreloadSwitches.AddUnique(this.ResetSwitchValue);
        }
        return;
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        if (this.CheckEventValied(this.KeepSwitchValue))
        {
            UAkSwitchValue local_4;
            OutParam.IdentifyName = FName(n"AkSwitchGroup", FGameAudioUtils::GetSwitchGroupId(local_4));
        }
        return;
    }
    bool CheckEventValied(const TSoftObjectPtr<UAkSwitchValue> &inout InSwitchValue) const
    {
        if (InSwitchValue.IsNull())
        {
            XWarning(ELog(0), FString().Append("Action: ").Append(this.DebugGetPath()).Append(" , The SwitchValue is not configured yet."));
            return false;
        }
        if (InSwitchValue.IsPending())
        {
            XWarning(ELog(0), FString().Append("Action: ").Append(this.DebugGetPath()).Append(" , The SwitchValue is not loaded yet. try to loading ").Append(InSwitchValue.GetAssetName()));
        }
        return true;
    }
}

class UESMAction_KeepRtpcValue : UESMRtpcBaseSpanAction
{
    UPROPERTY()
    TSoftObjectPtr<UAkRtpc> Rtpc = nullptr;
    UPROPERTY()
    bool bUseCurveValue = false;
    UPROPERTY()
    FESMBBVar_Float Value = 0.0f;
    UPROPERTY()
    FRuntimeFloatCurve CurveValue;
    UPROPERTY()
    float32 ResetValue = 0.0f;
    UPROPERTY()
    float32 InterpolateTime = 0.1f;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Effect;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        UESMAsset::ModifyAutoCustomConfig local_4;
        UESMPreloadCustomData local_8 = local_4.opCall(this);
        if (local_8 != nullptr)
        {
            local_8.PreloadRtpcs.AddUnique(this.Rtpc);
        }
        return;
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(2);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_3 = 0.0f;
        float32 local_6;
        if (this.CheckEventValied(this.Rtpc))
        {
            if (this.bUseCurveValue)
            {
                local_6 = this.CurveValue.GetFloatValue(0.0f, 0.0f);
            }
            else
            {
                local_6 = local_3;
            }
            if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
            {
                FOnLoadEventCallbackWithEntity local_12 = FOnLoadEventCallbackWithEntity();
                FGameAudioUtils::SetAudioRtpc(this.Rtpc, Context.GetEntity(), local_6, FMath::RoundToInt((this.InterpolateTime * 1000.0f)), local_12, true, Context.GetWorld());
                return;
            }
            float32 local_5 = this.InterpolateTime * 1000.0f;
            UAkRtpc local_16;
            FGameAudioUtils::SetRTPC(Context.GetEntity(), local_16, local_6, FMath::RoundToInt(local_5));
        }
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.CheckEventValied(this.Rtpc) && this.bUseCurveValue)
        {
            float32 local_6 = this.CurveValue.GetFloatValue(0.0f, 0.0f);
            if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
            {
                FGameAudioUtils::SetAudioRtpc(this.Rtpc, Context.GetEntity(), local_6, FMath::RoundToInt(this.InterpolateTime * 1000.0f), FOnLoadEventCallbackWithEntity(), true, Context.GetWorld());
                return;
            }
            UAkRtpc local_16;
            FGameAudioUtils::SetRTPC(Context.GetEntity(), local_16, local_6, FMath::RoundToInt(this.InterpolateTime * 1000.0f));
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.CheckEventValied(this.Rtpc))
        {
            if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
            {
                FGameAudioUtils::SetAudioRtpc(this.Rtpc, Context.GetEntity(), this.ResetValue, FMath::RoundToInt((this.InterpolateTime * 1000.0f)), FOnLoadEventCallbackWithEntity(), true, Context.GetWorld());
                return;
            }
            UAkRtpc local_14;
            FGameAudioUtils::SetRTPC(Context.GetEntity(), local_14, this.ResetValue, FMath::RoundToInt((this.InterpolateTime * 1000.0f)));
        }
        return;
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        if (this.CheckEventValied(this.Rtpc))
        {
            UAkRtpc local_4;
            OutParam.IdentifyName = FName(n"AkRtpc", local_4.GetWwiseShortID());
        }
        return;
    }
    bool CheckEventValied(const TSoftObjectPtr<UAkRtpc> &inout InRtpc) const
    {
        if (InRtpc.IsNull())
        {
            XWarning(ELog(0), FString().Append("Action: ").Append(this.DebugGetPath()).Append(" , The Rtpc is not configured yet."));
            return false;
        }
        if (InRtpc.IsPending())
        {
            XWarning(ELog(0), FString().Append("Action: ").Append(this.DebugGetPath()).Append(" , The Rtpc is not loaded yet. try to loading ").Append(InRtpc.GetAssetName()));
        }
        return true;
    }
}

namespace FSoundSourceConfig
{
void LogSocketDebug(const FString &inout Message)
{
    XLogIf(CVar_FX_DebugLog.GetBool(), ELog(1), FString().Append("[SFX.SocketDebug] ").Append(Message));
    return;
}
void WarnSocketFail(const FString &inout Message)
{
    XWarning(ELog(1), FString().Append("[SFX.SocketFail] ").Append(Message));
    return;
}
FString GetActorDebugName(const AActor &inout Actor)
{
    AActor local_2;
    FString local_12;
    if (local_2 != nullptr)
    {
        local_12 = Actor.GetName();
    }
    else
    {
        local_12 = "None";
    }
    return local_12;
}
void DrawSocketDebugPoint(const UWorld World, const FVector &inout Location, const FColor &inout Color)
{
    if (!(CVar_FX_DebugSocketVis.GetBool()) || !((World != nullptr)))
    {
        return;
    }
    int local_3 = 1086324736;
    DebugDraw::DrawDebugSphere(World, Location, 8.0f, 8, Color, false, 6.0f, uint8(0), 0.8f);
    return;
}
USceneComponent FindWeaponMeshComponentOnOwnerActor(const AActor &inout OwnerActor, const FSoundSourceConfig &inout Source)
{
    AActor local_2;
    if (!((local_2 != nullptr)))
    {
        return nullptr;
    }
    bool local_3 = !(Source.WeaponMeshComponent.IsNone());
    FString local_16 = Source.WeaponMeshComponent.ToString();
    TArray<UStaticMeshComponent> local_24 = OwnerActor.GetComponentsByClass(UStaticMeshComponent);
    for (auto local_38 : local_24)
    {
        if ((!((local_38 != nullptr))))
        {
            continue;
        }
        if (!(local_38.DoesSocketExist(Source.Socket)))
        {
            continue;
        }
        if (!(local_3) || (local_38.GetName() == local_16))
        {
            return local_38;
        }
    }
    TArray<USkinnedMeshComponent> local_48 = OwnerActor.GetComponentsByClass(USkinnedMeshComponent);
    for (auto local_62 : local_48)
    {
        if ((!((local_62 != nullptr))))
        {
            continue;
        }
        if (!(local_62.DoesSocketExist(Source.Socket)))
        {
            continue;
        }
        if (!(local_3) || (local_62.GetName() == local_16))
        {
            return local_62;
        }
    }
    USceneComponent local_6;
    return local_6;
}
bool TryPostEventAtOwnerWeaponMeshSocket(const FECSEntity &inout Entity, const TSoftObjectPtr<UAkAudioEvent> &inout Event, const FSoundSourceConfig &inout Source, const bool bIsLoop, const bool bLoopEnd, const UWorld WorldContext)
{
    const AActor local_4;
    local_4 = Entity.GetActor();
    USceneComponent local_6 = FSoundSourceConfig::FindWeaponMeshComponentOnOwnerActor(local_4, Source);
    if (!((local_6 != nullptr)) || !(local_6.DoesSocketExist(Source.Socket)))
    {
        if (local_4 != nullptr)
        {
            FSoundSourceConfig::DrawSocketDebugPoint(local_4.GetWorld(), local_4.GetActorLocation(), FColor::Red);
        }
        FSoundSourceConfig::WarnSocketFail(FString().Append("Owner weapon mesh socket check failed. Entity=").Append(Entity.ToString()).Append(", Socket=").Append(Source.Socket).Append(", OwnerActor=").Append(FSoundSourceConfig::GetActorDebugName(local_4)).Append(", WeaponMeshComponent=").Append(Source.WeaponMeshComponent));
        return false;
    }
    if (!(FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool()))
    {
        FSoundSourceConfig::WarnSocketFail(FString().Append("Audio async path disabled (AsynLoad=false). Entity=").Append(Entity.ToString()).Append(", Socket=").Append(Source.Socket));
        return false;
    }
    if (Source.bFollow || bIsLoop)
    {
        if (local_4 != nullptr && local_4.DoesSocketExist(Source.Socket))
        {
            FSoundSourceConfig::DrawSocketDebugPoint(local_4.GetWorld(), local_4.GetSocketTransform(Source.Socket, ERelativeTransformSpace(0)).GetLocation(), FColor::Green);
            FSoundSourceConfig::LogSocketDebug(FString().Append("Route=OwnerActorSocketFollow, Entity=").Append(Entity.ToString()).Append(", Event=").Append(Event.GetAssetName()).Append(", Socket=").Append(Source.Socket));
            FGameAudioUtils::PlayEventAtSocket(Event, Entity, FLoadEventCallback(), Source.Socket, Source.bFollow, bIsLoop, bLoopEnd, WorldContext, true);
            return true;
        }
        if (local_4 != nullptr)
        {
            FSoundSourceConfig::DrawSocketDebugPoint(local_4.GetWorld(), local_4.GetActorLocation(), FColor::Red);
        }
        FSoundSourceConfig::WarnSocketFail(FString().Append("Follow/Loop requires owner actor socket but not found. Entity=").Append(Entity.ToString()).Append(", OwnerActor=").Append(FSoundSourceConfig::GetActorDebugName(local_4)).Append(", Socket=").Append(Source.Socket));
        return false;
    }
    FTransform local_56 = local_6.GetSocketTransform(Source.Socket, ERelativeTransformSpace(0));
    FQuat4f local_108 = FQuat4f(local_56.GetRotation());
    FSoundSourceConfig::DrawSocketDebugPoint(local_4.GetWorld(), local_56.GetLocation(), FColor::Cyan);
    FSoundSourceConfig::LogSocketDebug(FString().Append("Route=OwnerWeaponMeshOneShot, Entity=").Append(Entity.ToString()).Append(", Event=").Append(Event.GetAssetName()).Append(", Socket=").Append(Source.Socket).Append(", Location=").Append(local_56.GetLocation().ToString()));
    FGameAudioUtils::PlayEventAtLocation(Event, Entity, FLoadEventCallback(), local_56.GetLocation(), local_108, WorldContext, false, true);
    return true;
}
bool TryPostEventAtWeaponSocket(const FECSEntity &inout Entity, const TSoftObjectPtr<UAkAudioEvent> &inout Event, const FSoundSourceConfig &inout Source, const bool bIsLoop, const bool bLoopEnd, const UWorld WorldContext)
{
    int local_12 = 0;
    const AActor local_20;
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        if (local_12)
        {
            FECSEntity local_16 = local_12.GetCurrentWeaponEntity();
            local_20 = local_16.GetActor();
            if (local_16.IsValid() && (local_20 != nullptr) && local_20.DoesSocketExist(Source.Socket))
            {
                if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
                {
                    FSoundSourceConfig::DrawSocketDebugPoint(local_20.GetWorld(), local_20.GetSocketTransform(Source.Socket, ERelativeTransformSpace(0)).GetLocation(), FColor::Green);
                    FSoundSourceConfig::LogSocketDebug(FString().Append("Route=WeaponEntitySocket, WeaponEntity=").Append(local_16.ToString()).Append(", Event=").Append(Event.GetAssetName()).Append(", Socket=").Append(Source.Socket).Append(", Follow=").Append(Source.bFollow).Append(", Loop=").Append(bIsLoop));
                    FGameAudioUtils::PlayEventAtSocket(Event, local_16, FLoadEventCallback(), Source.Socket, Source.bFollow, bIsLoop, bLoopEnd, WorldContext, true);
                    return true;
                }
                FSoundSourceConfig::WarnSocketFail(FString().Append("Weapon entity socket matched but AsynLoad=false. WeaponEntity=").Append(local_16.ToString()).Append(", Socket=").Append(Source.Socket));
            }
            else
            {
                if (local_20 != nullptr)
                {
                    FSoundSourceConfig::DrawSocketDebugPoint(local_20.GetWorld(), local_20.GetActorLocation(), FColor::Red);
                }
                FSoundSourceConfig::WarnSocketFail(FString().Append("Weapon entity socket path miss. Entity=").Append(Entity.ToString()).Append(", WeaponEntity=").Append(local_16.ToString()).Append(", Socket=").Append(Source.Socket));
            }
        }
    }
    FSoundSourceConfig::LogSocketDebug(FString().Append("Route=FallbackToOwnerWeaponMesh, Entity=").Append(Entity.ToString()).Append(", Event=").Append(Event.GetAssetName()).Append(", Socket=").Append(Source.Socket));
    return FSoundSourceConfig::TryPostEventAtOwnerWeaponMeshSocket(Entity, Event, Source, bIsLoop, bLoopEnd, WorldContext);
}
void PostEvent(const FECSEntity &inout Entity, const TSoftObjectPtr<UAkAudioEvent> &inout Event, const FSoundSourceConfig &inout Source, const bool bIsLoop, const bool bLoopEnd, const UWorld WorldContext)
{
    FGameAudioEventFollowOption local_1;
    bool local_2 = Source.bFollow || bIsLoop;
    local_1.SetbFollow(local_2);
    local_1.SetbStartLoopEvent(bIsLoop && !(bLoopEnd));
    local_2 = bIsLoop && bLoopEnd;
    local_1.SetbStopLoopEvent(local_2);
    FName local_7 = GetPrefabAvatarSwitchName(Entity);
    if (!(local_7.IsNone()))
    {
        FGameAudioUtils::SetAudioSwitch(local_7, Entity, FOnLoadEventCallbackWithEntity(), false, WorldContext);
    }
    if (int(Source.SourceType) == 1)
    {
        if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
        {
            FGameAudioUtils::PlayEventOnEmitter(Event, Entity, FLoadEventCallback(), Source.PartType, Source.bFollow, bIsLoop, bLoopEnd, WorldContext, true);
        }
    }
    else
    {
        if (int(Source.SourceType) == 2)
        {
            if (FSoundSourceConfig::TryPostEventAtWeaponSocket(Entity, Event, Source, bIsLoop, bLoopEnd, WorldContext))
            {
                return;
            }
            if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
            {
                FSoundSourceConfig::WarnSocketFail(FString().Append("Route=RootEntitySocketFallback. Entity=").Append(Entity.ToString()).Append(", Event=").Append(Event.GetAssetName()).Append(", Socket=").Append(Source.Socket));
                FGameAudioUtils::PlayEventAtSocket(Event, Entity, FLoadEventCallback(), Source.Socket, Source.bFollow, bIsLoop, bLoopEnd, WorldContext, true);
            }
            else
            {
                FSoundSourceConfig::WarnSocketFail(FString().Append("Socket source failed and AsynLoad=false, event dropped. Entity=").Append(Entity.ToString()).Append(", Event=").Append(Event.GetAssetName()).Append(", Socket=").Append(Source.Socket));
            }
        }
        else
        {
            if (int(Source.SourceType) == 3)
            {
                if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
                {
                    FGameAudioUtils::PlayEventAtLocation(Event, Entity, FLoadEventCallback(), FVector(Source.LocationOffset), Source.RotationOffset.Quaternion(), WorldContext, true, true);
                }
            }
            else
            {
                if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
                {
                    FGameAudioUtils::PlayEventOnEmitter(Event, Entity, FLoadEventCallback(), EGameAudioEmitterPartType(0), true, bIsLoop, bLoopEnd, WorldContext, true);
                }
            }
        }
    }
    return;
}
}

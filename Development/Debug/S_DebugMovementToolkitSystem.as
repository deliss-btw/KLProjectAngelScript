

class US_DebugMovementToolkitSystem : UECSScriptSystem
{
    float32 ScanGridSize = 3000.0f;
    float32 ScanStep = 10.0f;
    int ScanCountPerTick = 2000;
    float32 DebugMoveToWaitTime = 3.0f;
    float32 MergeStuckPointDist = 50.0f;


    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return true;
    }
    UFUNCTION()
    void Job_HandleDebugTeleportRequest(const FCE_DebugTeleportRequest &inout Event) const
    {
        Event.Sender.TeleportDelta(Event.OffsetLocation, FFPTime(-1));
        Modify local_8;
        FC_Rigidbody& local_10 = local_8.opCall();
        if (local_10)
        {
            local_10.GetModify_Velocity().Z = 0.0;
        }
        Modify local_18;
        FC_CharacterMovementControl& local_20 = local_18.opCall();
        if (local_20)
        {
            local_20.GetModify_InternalVelocity().Z = 0.0;
        }
        return;
    }
    UFUNCTION()
    void Job_ApplyDebugAirborneInfoAfterTeleport(const FECSEntity &inout Entity, FC_DebugAirborneInfoAfterTeleport &inout DebugAirborneInfo, FC_CharacterMovement &inout CharacterMovement, FC_CharacterMovementNew &inout CharacterMovementNew, FC_CharacterMovementControl &inout CharacterMovementControl, FC_Rigidbody &inout Rigidbody, const FCS_FixedTime &inout FixedTime) const
    {
        CharacterMovement.SetbAirborne(true);
        CharacterMovement.GetModify_FloorInfo().bValid = false;
        CharacterMovementNew.GetFloorInfo_New().SetbValid(false);
        if (System::GetConsoleVariableBoolValue("CharacterMovement.ExtendCapsuleHeightInAir"))
        {
            CharacterMovementNew.SetStepUpHeight(DebugAirborneInfo.GetStepUpHeight());
        }
        Rigidbody.SetVelocity(FVector(DebugAirborneInfo.GetVelocity()));
        CharacterMovementControl.SetInternalVelocity(Rigidbody.GetVelocity());
        CharacterMovement.SetDeltaMovement((FVector(Rigidbody.GetVelocity()) * float32(FixedTime.DeltaTime.ToSeconds())));
        Remove local_22;
        local_22.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_ScanStuckPoints(FCS_DebugCheckStuckProgress &inout Progress, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_2;
        FC_CharacterMovementParam local_24;
        int local_30 = 0;
        if (!(FixedTime.bFirstTimeTick) || !(FixedTime.bLatestFrame))
        {
            return;
        }
        if (System::GetConsoleVariableFloatValue("CharacterMovement.ScanStuckPointRange") <= 0.0f)
        {
            this.StopScanStuckPoints();
            return;
        }
        FECSWorldPtr local_6 = this.GetECSWorld();
        GetDefaulted local_10;
        FECSEntity local_14 = FECSEntity(local_10.opCall().GetPlayerPawnEntity());
        if (!(local_14.IsValid()))
        {
            return;
        }
        if (!(local_24) || !(local_30))
        {
            return;
        }
        int local_45 = FMath::CeilToInt((Progress.Box.GetExtent().X * 2.0) / this.ScanStep);
        float local_44 = Progress.Box.GetExtent().Y;
        float local_42 = local_44 * 2.0;
        float local_48 = this.ScanStep;
        local_45 = local_45 * FMath::CeilToInt(local_42 / local_48);
        float32 local_55 = (Progress.ScanCount * 100.0f) / local_45;
        PrintToScreen(FString().Append("Scanning ").Append(FString::ApplyFormat(local_55, " .3")).Append("%"), 0.0f, FLinearColor::LucBlue);
        TArray<FCheckStuckResult> local_66;
        int local_67 = this.ScanCountPerTick;
        FCollisionRollbackScope local_70 = FCollisionRollbackScope(local_14);
        float32 local_55_2 = this.ScanGridSize + this.ScanStep;
        float32 local_56_2 = this.ScanStep;
        float32 local_61 = this.ScanGridSize % local_56_2;
        float32 local_56_3 = local_55_2 - local_61;
        bool local_1 = true;
        FString local_60 = Gameplay::GetCurrentLevelName(__GetWorldContext(), local_1);
        while (local_48 < local_44)
        {
            while (local_42 < local_48)
            {
                local_2 = Progress.bNeedTeleport;
                if (local_2)
                {
                    float32 local_61_2 = this.ScanGridSize * 0.5f;
                    local_48 = local_61_2;
                    float32 local_55_3 = this.ScanGridSize;
                    local_44 = (local_55_3 * 0.5f);
                    FVector local_96 = (Progress.Base + FVector(local_44, local_48, 0.0));
                    System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("DebugMoveTo ").Append(local_96.X).Append(" ").Append(local_96.Y).Append(" ").Append(local_96), nullptr);
                    local_2 = false;
                    Progress.bNeedTeleport = local_2;
                    Progress.LastTeleportTime = FixedTime.Time;
                    return;
                }
                FFPTime local_100 = (FFPTime(FixedTime.Time) - Progress.LastTeleportTime);
                if (local_100.opCmp(this.DebugMoveToWaitTime) < 0)
                {
                    return;
                }
                while (local_1)
                {
                    FKinematicMoveCollisionUtils::CheckAirborneStuckAtPosition2D(local_66, local_14, FVector(Progress.Base.X + Progress.Local.X, (Progress.Base.Y + Progress.Local.Y), 0.0), local_30.GetScaledShape(), local_24.WalkableSlopDegree, local_24.MaxHoverHeight, 1000000.0, -1000000.0, false);
                    for (auto& local_124 : local_66)
                    {
                        local_2 = local_124.bMayStuck;
                        if (local_2)
                        {
                            bool local_125;
                            local_125 = false;
                            for (auto& local_140 : Progress.StuckPoints)
                            {
                                float32 local_55_4 = this.MergeStuckPointDist;
                                if (((FVector(local_124.FinalPosition) - local_140).SizeSquared()) < (this.MergeStuckPointDist * local_55_4))
                                {
                                    local_125 = true;
                                    break;
                                }
                            }
                            if (local_125)
                            {
                                continue;
                            }
                            Progress.StuckPoints.Add(local_124.FinalPosition);
                            FString local_152 = FString().Append(FString::ApplyFormat(local_124.FinalPosition.X, ".6")).Append(", ").Append(FString::ApplyFormat(local_124.FinalPosition.Y, ".6")).Append(", ").Append(FString::ApplyFormat(local_124.FinalPosition.Z, ".6"));
                            FString local_156 = FString().Append(FString::ApplyFormat(local_124.CheckPosition.X, ".6")).Append(", ").Append(FString::ApplyFormat(local_124.CheckPosition.Y, ".6")).Append(", ").Append(FString::ApplyFormat(local_124.CheckPosition.Z, ".6"));
                            FDebugReportUtils::UploadLog(ELog(11), "ScanStuckResult", FString().Append("     DebugStuck ").Append(local_152).Append("          @ ").Append(local_60).Append(", ").Append(local_14).Append(", From=(DebugStuck ").Append(local_156).Append("), Iter=").Append(local_124.IterCount));
                        }
                    }
                    while (local_2)
                    {
                        ++Progress.ScanCount;
                        --local_67;
                        if (local_67 <= 0)
                        {
                            return;
                        }
                        Progress.Local.Y = (Progress.Local.Y + this.ScanStep);
                        float32 local_61_3 = this.ScanGridSize;
                        if (Progress.Local.Y >= local_61_3)
                        {
                            local_2 = false;
                            continue;
                        }
                        local_2 = ((Progress.Base.Y + Progress.Local.Y) < Progress.Box.Max.Y);
                    }
                    local_48 = 0.0;
                    Progress.Local.Y = 0.0;
                    Progress.Local.X = (Progress.Local.X + this.ScanStep);
                    float32 local_55_5 = this.ScanGridSize;
                    if (Progress.Local.X >= local_55_5)
                    {
                        local_1 = false;
                        continue;
                    }
                    local_1 = ((Progress.Base.X + Progress.Local.X) < Progress.Box.Max.X);
                }
                Progress.Local.X = 0.0;
                Progress.bNeedTeleport = true;
                Progress.Base.Y = (Progress.Base.Y + local_56_3);
            }
            Progress.Base.Y = Progress.Box.Min.Y;
            Progress.Base.X = (Progress.Base.X + local_56_3);
        }
        if (!(Progress.InitPosition.IsZero()))
        {
            System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("DebugMoveTo ").Append(Progress.InitPosition.X).Append(" ").Append(Progress.InitPosition.Y).Append(" ").Append(Progress.InitPosition.Z), nullptr);
        }
        System::ExecuteConsoleCommand(__GetWorldContext(), "CharacterMovement.ScanStuckPointRange 0", nullptr);
        return;
    }
    void StopScanStuckPoints() const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Get local_6;
        const FCS_DebugCheckStuckProgress& local_8 = local_6.opCall();
        if (local_8)
        {
            if (local_8.Box.IsValid)
            {
                System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("DebugIgnoreMovementCollision 0"), nullptr);
            }
            if (!(local_8.InitPosition.IsZero()))
            {
                System::ExecuteConsoleCommand(__GetWorldContext(), FString().Append("DebugMoveTo ").Append(local_8.InitPosition.X).Append(" ").Append(local_8.InitPosition.Y).Append(" ").Append(local_8.InitPosition.Z), nullptr);
            }
            FBlueprintDebugFunctions::ExchangeMaxScriptExecutionTime(local_8.PrevMaxScriptExcutionTime);
            FECSWorldPtr local_20 = ECS::GetECSWorld();
            Remove local_24;
            local_24.opCall();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_DiagnoseStuckAtPosition(const FCS_DebugDiagnoseStuckRequest &inout Request, const FCS_FixedTime &inout FixedTime) const
    {
        FC_CharacterMovementParam local_24;
        int local_30 = 0;
        if ((!(FixedTime.bFirstTimeTick) || !(FixedTime.bLatestFrame)))
        {
            return;
        }
        FECSWorldPtr local_4 = this.GetECSWorld();
        GetDefaulted local_8;
        FECSEntity local_12 = FECSEntity(local_8.opCall().GetPlayerPawnEntity());
        if (!(local_12.IsValid()))
        {
            XWarning(ELog(11), "[StuckDiag] DiagnoseStuckAt: no local player entity");
            return;
        }
        if ((!(local_24) || !(local_30)))
        {
            XWarning(ELog(11), "[StuckDiag] DiagnoseStuckAt: missing movement/collision component");
            return;
        }
        FVector local_36 = Request.Position;
        FCollisionRollbackScope local_38 = FCollisionRollbackScope(local_12);
        XLog(ELog(11), FString().Append("[StuckDiag] ========== Runtime DiagnoseStuckAt (").Append(FString::ApplyFormat(local_36.X, ".3f")).Append(", ").Append(FString::ApplyFormat(local_36.Y, ".3f")).Append(", ").Append(FString::ApplyFormat(local_36.Z, ".3f")).Append(") Entity=").Append(local_12).Append(" =========="));
        XLog(ELog(11), FString().Append("[StuckDiag] Config: Slop=").Append(FString::ApplyFormat(local_24.WalkableSlopDegree, ".1f")).Append(" Hover=").Append(FString::ApplyFormat(local_24.MaxHoverHeight, ".1f")).Append(" Step=").Append(FString::ApplyFormat(local_24.StepHeight, ".1f")));
        TArray<FCheckStuckResult> local_62;
        FKinematicMoveCollisionUtils::CheckAirborneStuckAtPosition2D(local_62, local_12, local_36, local_30.GetScaledShape(), local_24.WalkableSlopDegree, local_24.MaxHoverHeight, 1000000.0, -1000000.0, true);
        XLog(ELog(11), FString().Append("[StuckDiag] CheckAirborneStuckAtPosition2D returned ").Append(local_62.Num()).Append(" results"));
        int local_71 = 0;
        FString local_52;
        for (; local_71 < local_62.Num(); )
        {
            FCheckStuckResult& local_74 = local_62[local_71];
            if (local_74.bMayStuck)
            {
                local_52 = "STUCK";
            }
            else
            {
                local_52 = "OK";
            }
            XLog(ELog(11), FString().Append("[StuckDiag]   Result[").Append(local_71).Append("]: CheckPos=").Append(local_74.CheckPosition).Append(" FinalPos=").Append(local_74.FinalPosition).Append(" IterCount=").Append(local_74.IterCount).Append(" ").Append(local_52));
            ++local_71;
        }
        if (local_62.Num() == 0)
        {
            XLog(ELog(11), "[StuckDiag]   No stuck detected вЂ” floor found or capsule falls clear");
        }
        XLog(ELog(11), "[StuckDiag] ========== End Runtime DiagnoseStuckAt ==========");
        FECSWorldPtr local_4_2 = ECS::GetECSWorld();
        Remove local_82;
        local_82.opCall();
        return;
    }
    UFUNCTION()
    void Run_Job_HandleDebugTeleportRequest() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DebugTeleportRequest> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DebugTeleportRequest& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleDebugTeleportRequest(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ApplyDebugAirborneInfoAfterTeleport() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_60 = 0;
        int local_66 = 0;
        MarkModifiedIfDirty local_74;
        MarkModifiedIfDirty local_78;
        MarkModifiedIfDirty local_82;
        MarkModifiedIfDirty local_86;
        MarkModifiedIfDirty local_90;
        int local_230 = 0;
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
                this.Job_ApplyDebugAirborneInfoAfterTeleport(local_40, local_42, local_48, local_54, local_60, local_66, local_6);
                local_74.opCall(local_42);
                local_78.opCall(local_48);
                local_82.opCall(local_54);
                local_86.opCall(local_60);
                local_90.opCall(local_66);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_128 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_132;
        local_132.opCall();
        Include local_136;
        local_136.opCall();
        Include local_140;
        local_140.opCall();
        Include local_144;
        local_144.opCall();
        Include local_148;
        local_148.opCall();
        Include local_152;
        local_152.opCall();
        Exclude(local_128).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_158 = 0;
        FECSRuntimeViewIterator local_192 = local_128.Iterator();
        for (; local_192.CanProceed;)
        {
            local_40 = local_192.Proceed();
            ++local_158;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_ApplyDebugAirborneInfoAfterTeleport(local_230, local_42, local_48, local_54, local_60, local_66, local_6);
            local_74.opCall(local_42);
            local_78.opCall(local_48);
            local_82.opCall(local_54);
            local_86.opCall(local_60);
            local_90.opCall(local_66);
        }
        local_4.UpdateCachedEntityCount(local_158);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ScanStuckPoints() const
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
        this.ClientJob_ScanStuckPoints(local_14, local_20);
        FECSWorldPtr local_6_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_24;
        local_24.opCall(local_14);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_DiagnoseStuckAtPosition() const
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
        this.ClientJob_DiagnoseStuckAtPosition(local_14, local_20);
        return;
    }
}

namespace __ConsoleCommond
{
class UStuckPointScanConsoleCommand : UKLConsoleCommandLibrary
{
    default Category = n"CharacterMovement";

    UStuckPointScanConsoleCommand()
    {
        return;
    }
    UFUNCTION()
    void DiagnoseStuckAt_Implementation(const float32 X, const float32 Y, const float32 Z = 0.f)
    {
        int local_12 = 0;
        if (!(KLConsoleCommand::CheatGetECSWorld().IsValid()))
        {
            return;
        }
        local_12.Position = FVector(X, Y, Z);
        return;
    }
    void DiagnoseStuckAt(const float32 X, const float32 Y, const float32 Z = 0.f)
    {
        __Evt_PushArgument__float(X);
        __Evt_PushArgument__float(Y);
        __Evt_PushArgument__float(Z);
        __Evt_Execute(this, n"DiagnoseStuckAt");
        return;
    }
}

}
namespace MovementStopDiagnosis
{
void Log(const FString &inout Msg)
{
    XLog(ELog(11), Msg);
    return;
}
void Warn(const FString &inout Msg)
{
    XWarning(ELog(11), Msg);
    return;
}
void Section(const FString &inout Title)
{
    MovementStopDiagnosis::Log(FString().Append("[DumpMove] ======== ").Append(Title).Append(" ========"));
    return;
}
void DumpMoveStanceLayerLine(const FECSEntity &inout Entity, const ECharacterMoveStanceLayer Layer, const ECharacterMoveStanceLayer ActiveLayer)
{
    int local_2 = int(FAIInputUtils::GetMoveStanceAtLayer(Entity, ECharacterMoveStanceLayer(Layer)));
    bool local_7 = (int(Layer) == int(ActiveLayer));
    FString local_16;
    if (local_7)
    {
        local_16 = " <<ACTIVE";
    }
    else
    {
        local_16 = "";
    }
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]     [").Append((int(Layer) - 1)).Append("] ").Append(Layer).Append(local_16).Append(": ").Append(local_2));
    return;
}
ECharacterMoveStanceLayer FindActiveMoveStanceLayer(const FC_CharacterMovementControl &inout Ctrl)
{
    int local_4 = Ctrl.GetMoveStanceLayers().Num() - 1;
    for (; local_4 >= 0; --local_4)
    {
        if (int(Ctrl.GetMoveStanceLayers()[local_4]) != 0)
        {
            int local_8 = (local_4 + 1);
            return ECharacterMoveStanceLayer(local_8);
        }
    }
    return ECharacterMoveStanceLayer(0);
}
bool DumpMoveStanceByLayer(const FECSEntity &inout Entity, const FC_CharacterMovementControl &inout Ctrl, const bool bIncludeRawArray)
{
    ECharacterMoveStance local_2 = FAIInputUtils::GetMoveStance(Entity);
    ECharacterMoveStanceLayer local_4 = MovementStopDiagnosis::FindActiveMoveStanceLayer(Ctrl);
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]   MoveStance effective = ").Append(local_2));
    if (int(local_4) != 0)
    {
        FString local_8_2 = FString();
        MovementStopDiagnosis::Log(local_8_2.Append("[DumpMove]   MoveStance winning layer = ").Append(local_4));
    }
    else
    {
        FString local_8_3 = FString();
        MovementStopDiagnosis::Log(local_8_3.Append("[DumpMove]   MoveStance winning layer = (none, all layers None)"));
    }
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]   MoveStance by layer (high -> low priority):"));
    MovementStopDiagnosis::DumpMoveStanceLayerLine(Entity, ECharacterMoveStanceLayer(4), ECharacterMoveStanceLayer(local_4));
    MovementStopDiagnosis::DumpMoveStanceLayerLine(Entity, ECharacterMoveStanceLayer(3), ECharacterMoveStanceLayer(local_4));
    MovementStopDiagnosis::DumpMoveStanceLayerLine(Entity, ECharacterMoveStanceLayer(2), ECharacterMoveStanceLayer(local_4));
    MovementStopDiagnosis::DumpMoveStanceLayerLine(Entity, ECharacterMoveStanceLayer(1), ECharacterMoveStanceLayer(local_4));
    if (bIncludeRawArray)
    {
        MovementStopDiagnosis::Log(FString().Append("[DumpMove]   MoveStanceLayers raw (array index):"));
        if (Ctrl.GetMoveStanceLayers().Num() == 0)
        {
            MovementStopDiagnosis::Log(FString().Append("[DumpMove]     (empty)"));
        }
        int local_12 = 0;
        for (; local_12 < Ctrl.GetMoveStanceLayers().Num(); )
        {
            FString local_8_4 = FString();
            MovementStopDiagnosis::Log(local_8_4.Append("[DumpMove]     [").Append(local_12).Append("] = ").Append(Ctrl.GetMoveStanceLayers()[local_12]));
            ++local_12;
        }
    }
    FString local_8_5 = FString();
    MovementStopDiagnosis::Log(local_8_5.Append("[DumpMove]   WalkDeferCounter = ").Append(Ctrl.GetWalkDeferCounter()));
    FString local_8_6 = FString();
    MovementStopDiagnosis::Log(local_8_6.Append("[DumpMove]   bCachedModifyMoveStanceByScript = ").Append(Ctrl.GetbCachedModifyMoveStanceByScript()));
    Get local_16;
    const FC_AIPathFollow& local_18 = local_16.opCall();
    if (local_18)
    {
        local_8_6 = FString();
        MovementStopDiagnosis::Log(local_8_6.Append("[DumpMove]   PathFollow.MoveStance (command intent) = ").Append(local_18.MoveStance));
    }
    if (int(local_2) == 0)
    {
        if (Ctrl.GetMovementInput().IsNearlyZero(9.999999747378752e-5))
        {
            local_8_6 = "";
        }
        else
        {
            local_8_6 = ", MovementInput non-zero";
        }
        MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: effective MoveStance=None").Append(local_8_6).Append(" - check per-layer dump above (WalkDeferCounter=").Append(Ctrl.GetWalkDeferCounter()).Append(")"));
        return true;
    }
    return false;
}
void DumpPreCollision(const FECSEntity &inout Entity)
{
    MovementStopDiagnosis::Log(FString().Append("[DumpMove] ====== [PRE-COLLISION] Entity ").Append(Entity).Append(" ======"));
    Get local_8;
    const FC_Rigidbody& local_10 = local_8.opCall();
    if (local_10)
    {
        MovementStopDiagnosis::Log(FString().Append("[DumpMove]   Rigidbody.Velocity = ").Append(local_10.GetVelocity()));
        FString local_4_2 = FString();
        MovementStopDiagnosis::Log(local_4_2.Append("[DumpMove]   Velocity.Size2D() = ").Append(FString::ApplyFormat(local_10.GetVelocity().Size2D(), ".3f")));
    }
    Get local_22;
    const FC_CharacterMovementControl& local_24 = local_22.opCall();
    if (local_24)
    {
        FString local_4_3 = FString();
        MovementStopDiagnosis::Log(local_4_3.Append("[DumpMove]   InternalVelocity = ").Append(local_24.GetInternalVelocity()));
        FString local_18 = FString();
        MovementStopDiagnosis::Log(local_18.Append("[DumpMove]   InternalVelocity.Size2D() = ").Append(FString::ApplyFormat(local_24.GetInternalVelocity().Size2D(), ".3f")));
        MovementStopDiagnosis::DumpMoveStanceByLayer(Entity, local_24, false);
    }
    Get local_30;
    const FC_CharacterMovement& local_32 = local_30.opCall();
    if (local_32)
    {
        FString local_4_4 = FString();
        MovementStopDiagnosis::Log(local_4_4.Append("[DumpMove]   DeltaMovement = ").Append(local_32.GetDeltaMovement()));
        FString local_18_2 = FString();
        MovementStopDiagnosis::Log(local_18_2.Append("[DumpMove]   Position = ").Append(local_32.GetPosition()));
    }
    Get local_36;
    const FC_Transform& local_38 = local_36.opCall();
    if (local_38)
    {
        FString local_4_5 = FString();
        MovementStopDiagnosis::Log(local_4_5.Append("[DumpMove]   Transform.Position = ").Append(local_38.GetPosition()));
    }
    MovementStopDiagnosis::Log(FString().Append("[DumpMove] ====== [PRE-COLLISION] End ======"));
    return;
}
void DumpPostCollision(const FECSEntity &inout Entity)
{
    int local_24 = 0;
    int local_66 = 0;
    int local_78 = 0;
    int local_102 = 0;
    float32 local_108 = 0.0f;
    int local_126 = 0;
    int local_168 = 0;
    int local_178 = 0;
    int local_186 = 0;
    int local_226 = 0;
    int local_236 = 0;
    int local_246 = 0;
    int local_256 = 0;
    int local_266 = 0;
    int local_282 = 0;
    Has local_288;
    int local_294 = 0;
    int local_362 = 0;
    MovementStopDiagnosis::Log(FString().Append("[DumpMove] ========================================"));
    MovementStopDiagnosis::Log(FString().Append("[DumpMove] [POST-COLLISION] Movement Stuck Diagnosis for Entity ").Append(Entity));
    MovementStopDiagnosis::Log(FString().Append("[DumpMove] ========================================"));
    int local_5 = 0;
    MovementStopDiagnosis::Section("1. Tag & Component Existence");
    Has local_12;
    bool local_13 = local_12.opCall();
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_LocalTag: ").Append(local_13));
    if (!(local_13))
    {
        MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: Missing FC_LocalTag - all movement jobs require this!"));
        ++local_5;
    }
    Has local_18;
    bool local_7 = local_18.opCall();
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_IgnoreMovement exists: ").Append(local_7));
    if (local_7)
    {
        MovementStopDiagnosis::Log(FString().Append("[DumpMove]     Counter = ").Append(local_24.GetCounter()));
        if (local_24.GetCounter() > 0)
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: FC_IgnoreMovement.Counter=").Append(local_24.GetCounter()).Append(" > 0 - velocity zeroed by Job_ClearVelocity!"));
            ++local_5;
        }
    }
    Has local_30;
    bool local_14 = local_30.opCall();
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_AttachIgnoreMovementTag: ").Append(local_14));
    if (local_14)
    {
        MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: FC_AttachIgnoreMovementTag present - velocity generation & delta movement excluded!"));
        ++local_5;
    }
    Has local_36;
    bool local_26 = local_36.opCall();
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_CharacterAccelerationFromRootMotion: ").Append(local_26));
    if (local_26)
    {
        MovementStopDiagnosis::Log(FString().Append("[DumpMove]     (General velocity job excluded, using RootMotion accel path)"));
    }
    Has local_42;
    bool local_31 = local_42.opCall();
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_CharacterMovementParam: ").Append(local_31));
    if (!(local_31))
    {
        MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: Missing FC_CharacterMovementParam - Job_UpdateDeltaMovement requires this!"));
        ++local_5;
    }
    Has local_48;
    bool local_37 = local_48.opCall();
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_CharacterMovement: ").Append(local_37));
    Has local_54;
    bool local_43 = local_54.opCall();
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_Rigidbody: ").Append(local_43));
    Has local_60;
    bool local_49 = local_60.opCall();
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_CharacterMovementControl: ").Append(local_49));
    MovementStopDiagnosis::Section("2. Rigidbody & Velocity");
    if (local_43)
    {
        FString local_4_2 = FString();
        MovementStopDiagnosis::Log(local_4_2.Append("[DumpMove]   Velocity = ").Append(local_66.GetVelocity()));
        FString local_4_3 = FString();
        MovementStopDiagnosis::Log(local_4_3.Append("[DumpMove]   Velocity.Size() = ").Append(FString::ApplyFormat(local_66.GetVelocity().Size(), ".3f")));
        FString local_4_4 = FString();
        MovementStopDiagnosis::Log(local_4_4.Append("[DumpMove]   Velocity.Size2D() = ").Append(FString::ApplyFormat(local_66.GetVelocity().Size2D(), ".3f")));
        if (local_49)
        {
            FString local_4_5 = FString();
            MovementStopDiagnosis::Log(local_4_5.Append("[DumpMove]   InternalVelocity = ").Append(local_78.GetInternalVelocity()));
            FString local_72 = FString();
            MovementStopDiagnosis::Log(local_72.Append("[DumpMove]   InternalVelocity.Size2D() = ").Append(FString::ApplyFormat(local_78.GetInternalVelocity().Size2D(), ".3f")));
            FVector local_96 = (FVector(local_66.GetVelocity()) - local_78.GetInternalVelocity());
            if (!(local_96.IsNearlyZero(9.999999747378752e-5)))
            {
                MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> NOTE: Velocity != InternalVelocity (diff=").Append(local_96).Append(") - modified after TickMovement (by collision/ApplyMovement/FreezeFrame)!"));
            }
        }
        if (local_66.GetVelocity().IsNearlyZero(9.999999747378752e-5))
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: Rigidbody.Velocity is nearly zero!"));
            ++local_5;
        }
    }
    else
    {
        MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: No FC_Rigidbody component!"));
        ++local_5;
    }
    MovementStopDiagnosis::Section("3. CharacterMovement State");
    if (local_37)
    {
        FString local_4_6 = FString();
        MovementStopDiagnosis::Log(local_4_6.Append("[DumpMove]   Position = ").Append(local_102.GetPosition()));
        FString local_72_2 = FString();
        MovementStopDiagnosis::Log(local_72_2.Append("[DumpMove]   DeltaMovement = ").Append(local_102.GetDeltaMovement()));
        FString local_4_7 = FString();
        MovementStopDiagnosis::Log(local_4_7.Append("[DumpMove]   bAirborne = ").Append(local_102.GetbAirborne()));
        FString local_72_3 = FString();
        MovementStopDiagnosis::Log(local_72_3.Append("[DumpMove]   bWallRunning = ").Append(local_102.GetbWallRunning()));
        FString local_4_8 = FString();
        MovementStopDiagnosis::Log(local_4_8.Append("[DumpMove]   bUsingCurveSpeed = ").Append(local_102.GetbUsingCurveSpeed()));
        FString local_72_4 = FString();
        MovementStopDiagnosis::Log(local_72_4.Append("[DumpMove]   bAnimFakeAirFloating = ").Append(local_102.GetbAnimFakeAirFloating()));
        FString local_4_9 = FString();
        MovementStopDiagnosis::Log(local_4_9.Append("[DumpMove]   ForwardSlope = ").Append(FString::ApplyFormat(local_102.GetForwardSlope(), ".2f")));
        FString local_4_10 = FString();
        MovementStopDiagnosis::Log(local_4_10.Append("[DumpMove]   MoveDirSlope = ").Append(FString::ApplyFormat(local_102.GetMoveDirSlope(), ".2f")));
        if (local_102.GetDeltaMovement().IsNearlyZero(9.999999747378752e-5))
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: DeltaMovement is nearly zero!"));
            ++local_5;
        }
        if (local_102.GetbWallRunning())
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: bWallRunning=true - Job_GenerateVelocityAndTurn_General returns early!"));
            ++local_5;
        }
        if (local_102.GetbUsingCurveSpeed())
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: bUsingCurveSpeed=true - acceleration disabled, SpeedCurveMove may not have exited properly!"));
            ++local_5;
        }
    }
    MovementStopDiagnosis::Section("4. CharacterMovementControl");
    if (local_49)
    {
        float32 local_109;
        FString local_4_11 = FString();
        MovementStopDiagnosis::Log(local_4_11.Append("[DumpMove]   bInMovementState = ").Append(local_78.GetbInMovementState()));
        FString local_72_5 = FString();
        MovementStopDiagnosis::Log(local_72_5.Append("[DumpMove]   MovementInput = ").Append(local_78.GetMovementInput()));
        FString local_4_12 = FString();
        MovementStopDiagnosis::Log(local_4_12.Append("[DumpMove]   MovementSpeedScale = ").Append(FString::ApplyFormat(local_78.GetMovementSpeedScale(), ".4f")));
        FString local_4_13 = FString();
        MovementStopDiagnosis::Log(local_4_13.Append("[DumpMove]   MovementAccelScale = ").Append(FString::ApplyFormat(local_78.GetMovementAccelScale(), ".4f")));
        FString local_4_14 = FString();
        MovementStopDiagnosis::Log(local_4_14.Append("[DumpMove]   MovementStopAccelScale = ").Append(FString::ApplyFormat(local_78.GetMovementStopAccelScale(), ".4f")));
        FString local_4_15 = FString();
        MovementStopDiagnosis::Log(local_4_15.Append("[DumpMove]   MovementSpeedAdditivePercent = ").Append(local_78.GetMovementSpeedAdditivePercent()));
        FString local_72_6 = FString();
        MovementStopDiagnosis::Log(local_72_6.Append("[DumpMove]   bSteeringMovement = ").Append(local_78.GetbSteeringMovement()));
        FString local_4_16 = FString();
        MovementStopDiagnosis::Log(local_4_16.Append("[DumpMove]   bFlyingMovement = ").Append(local_78.GetbFlyingMovement()));
        FString local_72_7 = FString();
        MovementStopDiagnosis::Log(local_72_7.Append("[DumpMove]   CachedLastMovementSpeedScale = ").Append(FString::ApplyFormat(local_78.GetCachedLastMovementSpeedScale(), ".4f")));
        FString local_72_8 = FString();
        MovementStopDiagnosis::Log(local_72_8.Append("[DumpMove]   AnimMoveSpeedScale = ").Append(FString::ApplyFormat(local_78.GetAnimMoveSpeedScale(), ".4f")));
        if (MovementStopDiagnosis::DumpMoveStanceByLayer(Entity, local_78, true))
        {
            ++local_5;
        }
        if (!(local_78.GetbInMovementState()))
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: bInMovementState=false - MoveSpeedScale forced to 0! ESM MovementAction not running?"));
            ++local_5;
        }
        if (local_78.GetMovementInput().IsNearlyZero(9.999999747378752e-5))
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: MovementInput is zero - no input from AI or player!"));
            ++local_5;
        }
        if (local_78.GetMovementSpeedScale() <= 0.0f)
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: MovementSpeedScale=").Append(local_78.GetMovementSpeedScale()).Append(" <= 0!"));
            ++local_5;
        }
        if (local_78.GetMovementSpeedAdditivePercent() <= 0)
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: MovementSpeedAdditivePercent=").Append(local_78.GetMovementSpeedAdditivePercent()).Append(" <= 0!"));
            ++local_5;
        }
        if (local_78.GetbInMovementState())
        {
            local_109 = local_78.GetMovementSpeedScale() * FMath::Max((local_78.GetMovementSpeedAdditivePercent() / 100.0f), 0.0f);
        }
        else
        {
            local_109 = 0.0f;
        }
        FString local_4_17 = FString();
        MovementStopDiagnosis::Log(local_4_17.Append("[DumpMove]   >> Effective MoveSpeedScale = ").Append(FString::ApplyFormat(local_109, ".4f")));
        if (local_109 <= 0.0f)
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: Effective MoveSpeedScale=0 - movement will decelerate to stop."));
            ++local_5;
        }
    }
    MovementStopDiagnosis::Section("5. CharacterMovementParam");
    if (local_31)
    {
        FC_CharacterMovementParam local_116;
        FString local_72_9 = FString();
        MovementStopDiagnosis::Log(local_72_9.Append("[DumpMove]   MoveSpeed = ").Append(FString::ApplyFormat(local_116.MoveSpeed, ".2f")));
        FString local_72_10 = FString();
        MovementStopDiagnosis::Log(local_72_10.Append("[DumpMove]   MoveAcceleration = ").Append(FString::ApplyFormat(local_116.MoveAcceleration, ".2f")));
        FString local_72_11 = FString();
        MovementStopDiagnosis::Log(local_72_11.Append("[DumpMove]   MoveStopAccel = ").Append(FString::ApplyFormat(local_116.MoveStopAccel, ".2f")));
        FString local_72_12 = FString();
        MovementStopDiagnosis::Log(local_72_12.Append("[DumpMove]   WalkableSlopDegree = ").Append(FString::ApplyFormat(local_116.WalkableSlopDegree, ".2f")));
        if (local_116.MoveSpeed <= 0.0f)
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: MoveSpeed=").Append(local_116.MoveSpeed).Append(" <= 0! MovementInput will be zero!"));
            ++local_5;
        }
    }
    MovementStopDiagnosis::Section("6. CharacterMovementSpeedModifier");
    Has local_120;
    bool local_104 = local_120.opCall();
    if (local_104)
    {
        float32 local_109;
        local_109 = 1.0f;
        for (auto& local_144 : local_126.GetESMSpeedModifiers())
        {
            local_109 = local_109 * local_108;
        }
        FString local_4_18 = FString();
        MovementStopDiagnosis::Log(local_4_18.Append("[DumpMove]   TotalESMSpeedModifier = ").Append(FString::ApplyFormat(local_109, ".4f")));
        FString local_4_19 = FString();
        MovementStopDiagnosis::Log(local_4_19.Append("[DumpMove]   AttributeSpeedModifier = ").Append(FString::ApplyFormat(local_126.GetAttributeSpeedModifier(), ".4f")));
        FString local_4_20 = FString();
        MovementStopDiagnosis::Log(local_4_20.Append("[DumpMove]   SpecialSystemSpeedModifier = ").Append(FString::ApplyFormat(local_126.GetSpecialSystemSpeedModifier(), ".4f")));
        for (auto& local_144_2 : local_126.GetESMSpeedModifiers())
        {
            FString local_72_13 = FString();
            MovementStopDiagnosis::Log(local_72_13.Append("[DumpMove]     ESMSpeedModifiers[").Append(local_144_2.GetKey()).Append("] = ").Append());
        }
        local_108 = local_109 * local_126.GetAttributeSpeedModifier();
        float32 local_107 = local_126.GetSpecialSystemSpeedModifier();
        FString local_4_21 = FString();
        MovementStopDiagnosis::Log(local_4_21.Append("[DumpMove]   >> Product = ").Append(FString::ApplyFormat((local_108 * local_107), ".4f")));
        if (local_109 <= 0.0f)
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: TotalESMSpeedModifier=").Append(local_109).Append(" <= 0!"));
            ++local_5;
        }
        if (local_126.GetAttributeSpeedModifier() <= 0.0f)
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: AttributeSpeedModifier=").Append(local_126.GetAttributeSpeedModifier()).Append(" <= 0!"));
            ++local_5;
        }
        if (local_126.GetSpecialSystemSpeedModifier() <= 0.0f)
        {
            local_107 = local_126.GetSpecialSystemSpeedModifier();
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: SpecialSystemSpeedModifier=").Append(local_107).Append(" <= 0!"));
            ++local_5;
        }
        for (auto& local_144_3 : local_126.GetESMSpeedModifiers())
        {
            if (local_107 <= 0.0f)
            {
                MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: ESMSpeedModifiers[").Append(local_144_3.GetKey()).Append("]=").Append().Append(" <= 0!"));
                ++local_5;
            }
        }
    }
    else
    {
        MovementStopDiagnosis::Log(FString().Append("[DumpMove]   (No FC_CharacterMovementSpeedModifier component)"));
    }
    MovementStopDiagnosis::Section("7. AI Input");
    Has local_150;
    bool local_55 = local_150.opCall();
    Has local_156;
    bool local_104_2 = local_156.opCall();
    Has local_162;
    bool local_146 = local_162.opCall();
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_AIInput: ").Append(local_55));
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_Input: ").Append(local_104_2));
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_AIIgnorePlayerInputTag: ").Append(local_146));
    if (local_55)
    {
        FVector local_90 = local_168.GetMoveInputVector();
        FString local_72_14 = FString();
        MovementStopDiagnosis::Log(local_72_14.Append("[DumpMove]   AIInput.GetMoveInputVector() = ").Append(local_90));
        if (local_90.IsNearlyZero(9.999999747378752e-5))
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: AIInput move vector is zero - AI not sending movement input!"));
            ++local_5;
        }
    }
    else
    {
        if (!(local_104_2))
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: Neither FC_AIInput nor FC_Input exists - no input source!"));
            ++local_5;
        }
        else
        {
            if (local_146)
            {
                MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: FC_Input exists but FC_AIIgnorePlayerInputTag blocks it, no FC_AIInput fallback!"));
                ++local_5;
            }
        }
    }
    MovementStopDiagnosis::Section("8. FreezeFrame");
    Has local_172;
    bool local_151 = local_172.opCall();
    if (local_151)
    {
        FECSWorldPtr local_180 = ECS::GetECSWorld();
        FFreezeFrameState local_196 = local_178.SampleInvolve(local_186.Time);
        FString local_72_15 = FString();
        MovementStopDiagnosis::Log(local_72_15.Append("[DumpMove]   FC_FreezeFrame present, SampleInvolve.bFreeze = ").Append(local_196));
        if (local_196.bFreeze)
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: FreezeFrame active - velocity zeroed by Job_HandleFreezeFrame!"));
            ++local_5;
        }
    }
    else
    {
        MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_FreezeFrame: not present"));
    }
    MovementStopDiagnosis::Section("9. RootMotion & CustomMotion");
    Has local_210;
    bool local_157 = local_210.opCall();
    if (local_157)
    {
        FC_RootMotion local_216;
        FString local_72_16 = FString();
        MovementStopDiagnosis::Log(local_72_16.Append("[DumpMove]   FC_RootMotion.PosDelta = ").Append(local_216.PosDelta));
        FString local_4_22 = FString();
        MovementStopDiagnosis::Log(local_4_22.Append("[DumpMove]   FC_RootMotion.YawDelta = ").Append(local_216.YawDelta));
        Has local_220;
        bool local_151_2 = local_220.opCall();
        if (local_151_2)
        {
            FString local_72_17 = FString();
            MovementStopDiagnosis::Log(local_72_17.Append("[DumpMove]   FC_RootMotionBlend.HorizontalWeight = ").Append(FString::ApplyFormat(local_226.GetHorizontalWeight(), ".3f")));
            FString local_72_18 = FString();
            MovementStopDiagnosis::Log(local_72_18.Append("[DumpMove]   FC_RootMotionBlend.VerticalWeight = ").Append(FString::ApplyFormat(local_226.GetVerticalWeight(), ".3f")));
            if (local_216.PosDelta.IsNearlyZero(9.999999747378752e-5) && (local_226.GetHorizontalWeight() >= 0.99f))
            {
                MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: RootMotion.PosDelta~=0 + HorizontalWeight~=1 => velocity lerped to 0!"));
                ++local_5;
            }
        }
    }
    else
    {
        MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_RootMotion: not present"));
    }
    Has local_230;
    bool local_151_3 = local_230.opCall();
    if (local_151_3)
    {
        FString local_4_23 = FString();
        MovementStopDiagnosis::Log(local_4_23.Append("[DumpMove]   FC_RootMotionInterruptBlendOut.CachedVelocity = ").Append(local_236.GetCachedVelocity()));
        if (local_236.GetCachedVelocity().IsNearlyZero(9.999999747378752e-5))
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: RootMotionInterruptBlendOut.CachedVelocity~=0 - blending toward 0!"));
            ++local_5;
        }
    }
    Has local_240;
    bool local_157_2 = local_240.opCall();
    if (local_157_2)
    {
        FString local_72_19 = FString();
        MovementStopDiagnosis::Log(local_72_19.Append("[DumpMove]   FC_CustomMotion.PosDelta = ").Append(local_246.GetPosDelta()));
        FString local_4_24 = FString();
        MovementStopDiagnosis::Log(local_4_24.Append("[DumpMove]   FC_CustomMotion.HorizontalWeight = ").Append(FString::ApplyFormat(local_246.GetHorizontalWeight(), ".3f")));
        FString local_4_25 = FString();
        MovementStopDiagnosis::Log(local_4_25.Append("[DumpMove]   FC_CustomMotion.VerticalWeight = ").Append(FString::ApplyFormat(local_246.GetVerticalWeight(), ".3f")));
        if (local_246.GetPosDelta().IsNearlyZero(9.999999747378752e-5) && (local_246.GetHorizontalWeight() >= 0.99f))
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: CustomMotion.PosDelta~=0 + HorizontalWeight~=1 => velocity lerped to 0!"));
            ++local_5;
        }
    }
    else
    {
        MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_CustomMotion: not present"));
    }
    MovementStopDiagnosis::Section("10. RigidbodyDeltaMove");
    Has local_250;
    bool local_157_3 = local_250.opCall();
    if (local_157_3)
    {
        FString local_4_26 = FString();
        MovementStopDiagnosis::Log(local_4_26.Append("[DumpMove]   DeltaMove = ").Append(local_256.DeltaMove));
        FString local_72_20 = FString();
        MovementStopDiagnosis::Log(local_72_20.Append("[DumpMove]   Velocity = ").Append(local_256.Velocity));
        if (local_256.Velocity.IsNearlyZero(9.999999747378752e-5))
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: RigidbodyDeltaMove.Velocity~=0 - overrides rigidbody velocity!"));
            ++local_5;
        }
    }
    else
    {
        MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_RigidbodyDeltaMove: not present"));
    }
    MovementStopDiagnosis::Section("11. Transform & Collision");
    Has local_260;
    bool local_151_4 = local_260.opCall();
    if (local_151_4)
    {
        FString local_4_27 = FString();
        MovementStopDiagnosis::Log(local_4_27.Append("[DumpMove]   Position = ").Append(local_266.GetPosition()));
        FString local_72_21 = FString();
        MovementStopDiagnosis::Log(local_72_21.Append("[DumpMove]   Rotation = ").Append(local_266.GetRotation().Rotator()));
    }
    Has local_276;
    bool local_157_4 = local_276.opCall();
    if (local_157_4)
    {
        FString local_4_28 = FString();
        MovementStopDiagnosis::Log(local_4_28.Append("[DumpMove]   Collision.ShapeType = ").Append(local_282.GetShapeType()));
        FString local_72_22 = FString();
        MovementStopDiagnosis::Log(local_72_22.Append("[DumpMove]   Collision.ScaledHalfHeight = ").Append(FString::ApplyFormat(local_282.GetScaledHalfHeight(), ".2f")));
    }
    MovementStopDiagnosis::Section("12. Floor Info");
    if (local_37)
    {
        FC_CharacterMovementParam local_116;
        FString local_4_29 = FString();
        MovementStopDiagnosis::Log(local_4_29.Append("[DumpMove]   FloorInfo.bHasFloor = ").Append(local_102.GetFloorInfo().bHasFloor));
        FString local_72_23 = FString();
        MovementStopDiagnosis::Log(local_72_23.Append("[DumpMove]   FloorInfo.bTouchingFloor = ").Append(local_102.GetFloorInfo().bTouchingFloor));
        FString local_4_30 = FString();
        MovementStopDiagnosis::Log(local_4_30.Append("[DumpMove]   FloorInfo.FloorImpactPoint = ").Append(local_102.GetFloorInfo().FloorImpactPoint));
        bool local_157_5 = local_288.opCall();
        if (local_157_5)
        {
            FString local_4_31 = FString();
            MovementStopDiagnosis::Log(local_4_31.Append("[DumpMove]   FloorInfo_New.bHasFloor = ").Append(local_294.GetFloorInfo_New().GetbHasFloor()));
            FString local_72_24 = FString();
            MovementStopDiagnosis::Log(local_72_24.Append("[DumpMove]   FloorInfo_New.FloorSlope = ").Append(FString::ApplyFormat(local_294.GetFloorInfo_New().GetFloorSlope(), ".2f")));
            if (local_31)
            {
                FString local_4_32 = FString();
                MovementStopDiagnosis::Log(local_4_32.Append("[DumpMove]   WalkableSlopDegree = ").Append(FString::ApplyFormat(local_116.WalkableSlopDegree, ".2f")));
                if (local_294.GetFloorInfo_New().GetFloorSlope() > local_116.WalkableSlopDegree)
                {
                    MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: FloorSlope=").Append(FString::ApplyFormat(local_294.GetFloorInfo_New().GetFloorSlope(), ".2f")).Append(" > WalkableSlopDegree=").Append(FString::ApplyFormat(local_116.WalkableSlopDegree, ".2f")).Append("!"));
                    ++local_5;
                }
            }
        }
    }
    MovementStopDiagnosis::Section("13. NavMesh Restriction");
    bool local_151_5 = local_288.opCall();
    if (local_151_5)
    {
        float32 local_109;
        MovementStopDiagnosis::Log(FString().Append("[DumpMove]   RestrictInNavmeshCount = ").Append(local_294.GetRestrictInNavmeshCount()));
        bool local_157_6 = local_294.GetRestrictInNavmeshCount() > 0 && local_37;
        if (!(local_157_6))
        {
            local_157_6 = false;
        }
        else
        {
            local_157_6 = local_276.opCall();
        }
        if (local_157_6)
        {
            FCollisionShape local_306 = local_282.GetScaledShape();
            FVector local_316 = (FVector(local_102.GetPosition()) - FVector(0.0, 0.0, (float32(local_306.GetExtent().Z) + local_294.GetStepUpHeight())));
            bool local_157_7 = FAIPathFollowUtils::IsPointOnNavigation(Entity, local_316, FVector(1.0, 1.0, 200.0));
            FString local_72_25 = FString();
            MovementStopDiagnosis::Log(local_72_25.Append("[DumpMove]   FloorPos = ").Append(local_316));
            FString local_4_33 = FString();
            MovementStopDiagnosis::Log(local_4_33.Append("[DumpMove]   IsOnNavigation = ").Append(local_157_7));
            if (!(local_157_7))
            {
                FVector local_84 = FAIPathFollowUtils::ProjectPointToNavigation(Entity, local_316, FVector::ZeroVector);
                FString local_4_34 = FString();
                MovementStopDiagnosis::Log(local_4_34.Append("[DumpMove]   NearestNavPos = ").Append(local_84));
                FVector local_324 = (local_84 - local_316);
                FString local_4_35 = FString();
                MovementStopDiagnosis::Log(local_4_35.Append("[DumpMove]   OffsetToNav = ").Append(local_324).Append(" (Size2D=").Append(FString::ApplyFormat(local_324.Size2D(), ".1f")).Append(")"));
                MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: Current position OFF NavMesh with RestrictInNavmesh active!"));
                ++local_5;
            }
            if (local_157_7 && local_49)
            {
                FVector local_330 = FVector(local_78.GetMovementInput()).GetSafeNormal2D(9.99999993922529e-9, FVector::ZeroVector);
                if (!(local_330.IsNearlyZero(9.999999747378752e-5)))
                {
                    local_109 = 50.0f;
                    FVector local_96_2 = (local_330 * 50.0);
                    FVector local_324_2 = (local_316 + local_96_2);
                    bool local_317 = FAIPathFollowUtils::IsPointOnNavigation(Entity, local_324_2, FVector(1.0, 1.0, 200.0));
                    FString local_4_36 = FString::ApplyFormat(50.0f, ".0f");
                    FString local_298_2 = FString();
                    MovementStopDiagnosis::Log(local_298_2.Append("[DumpMove]   TargetFloorPos (InputDir*").Append(local_4_36).Append(") = ").Append(local_324_2));
                    FString local_72_26 = FString();
                    MovementStopDiagnosis::Log(local_72_26.Append("[DumpMove]   TargetIsOnNavigation = ").Append(local_317));
                    if (!(local_317))
                    {
                        FString local_72_27 = FString();
                        MovementStopDiagnosis::Log(local_72_27.Append("[DumpMove]   NearestNavToTarget = ").Append(FAIPathFollowUtils::ProjectPointToNavigation(Entity, local_324_2, FVector::ZeroVector)));
                        MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> ISSUE: Move direction leads OFF NavMesh - virtual nav hit blocks movement!"));
                        ++local_5;
                    }
                }
            }
        }
    }
    MovementStopDiagnosis::Section("14. Collision Config");
    if (local_37)
    {
        bool local_331;
        local_331 = (local_102.GetMutePreventEdgeFalling() <= 0) && (local_102.GetPreventEdgeFalling() > 0);
        MovementStopDiagnosis::Log(FString().Append("[DumpMove]   PreventEdgeFalling=").Append(local_102.GetPreventEdgeFalling()).Append(", Mute=").Append(local_102.GetMutePreventEdgeFalling()).Append(", Active=").Append(local_331));
        if (local_331)
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> NOTE: PreventEdgeFalling active - movement may be blocked near ledge edges!"));
        }
        FString local_298_3 = FString();
        MovementStopDiagnosis::Log(local_298_3.Append("[DumpMove]   PassThroughCharacter = ").Append(local_102.GetPassThroughCharacter()));
        FString local_72_28 = FString();
        MovementStopDiagnosis::Log(local_72_28.Append("[DumpMove]   bDontLand = ").Append(local_102.GetbDontLand()));
        if (local_102.GetbDontLand() && local_102.GetbAirborne())
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> NOTE: bDontLand=true while airborne - entity cannot land!"));
        }
    }
    bool local_151_6 = local_288.opCall();
    if (local_151_6)
    {
        FString local_72_29 = FString();
        MovementStopDiagnosis::Log(local_72_29.Append("[DumpMove]   StepUpHeight = ").Append(FString::ApplyFormat(local_294.GetStepUpHeight(), ".2f")));
        FString local_4_37 = FString();
        MovementStopDiagnosis::Log(local_4_37.Append("[DumpMove]   MoveCollisionType = ").Append(local_294.GetMoveCollisionType()));
    }
    if (local_49)
    {
        FC_CharacterMovementParam local_116;
        FString local_298_4 = FString();
        MovementStopDiagnosis::Log(local_298_4.Append("[DumpMove]   StepHeightScale = ").Append(FString::ApplyFormat(local_78.GetStepHeightScale(), ".4f")));
        FString local_72_30 = FString();
        MovementStopDiagnosis::Log(local_72_30.Append("[DumpMove]   WalkableSlopDegreeScale = ").Append(FString::ApplyFormat(local_78.GetWalkableSlopDegreeScale(), ".4f")));
        bool local_317_2 = local_288.opCall();
        if (local_317_2)
        {
            float32 local_105 = local_294.GetStepUpHeight() * local_78.GetStepHeightScale();
            float32 local_103_2 = local_78.GetStepHeightScale();
            local_108 = local_294.GetStepUpHeight();
            FString local_72_31 = FString();
            MovementStopDiagnosis::Log(local_72_31.Append("[DumpMove]   >> EffectiveStepHeight = ").Append(FString::ApplyFormat(local_105, ".2f")).Append(" (base=").Append(FString::ApplyFormat(local_108, ".2f")).Append(" * scale=").Append(FString::ApplyFormat(local_103_2, ".4f")).Append(")"));
            if (local_78.GetStepHeightScale() < 1.0f)
            {
                MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> NOTE: StepHeightScale=").Append(FString::ApplyFormat(local_78.GetStepHeightScale(), ".4f")).Append(" < 1 - step height reduced, may fail to climb small obstacles!"));
            }
        }
        if (local_31)
        {
            float32 local_107_2 = local_116.WalkableSlopDegree * local_78.GetWalkableSlopDegreeScale();
            float32 local_145 = local_78.GetWalkableSlopDegreeScale();
            float32 local_105_2 = local_116.WalkableSlopDegree;
            FString local_298_5 = FString();
            MovementStopDiagnosis::Log(local_298_5.Append("[DumpMove]   >> EffectiveWalkableSlopDegree = ").Append(FString::ApplyFormat(local_107_2, ".2f")).Append(" (base=").Append(FString::ApplyFormat(local_105_2, ".2f")).Append(" * scale=").Append(FString::ApplyFormat(local_145, ".4f")).Append(")"));
            if (local_78.GetWalkableSlopDegreeScale() < 1.0f)
            {
                MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> NOTE: WalkableSlopDegreeScale=").Append(FString::ApplyFormat(local_78.GetWalkableSlopDegreeScale(), ".4f")).Append(" < 1 - slope limit tightened to ").Append(FString::ApplyFormat(local_107_2, ".1f")).Append("В°, may be blocked by mild slopes!"));
            }
        }
    }
    Has local_348;
    bool local_317_3 = local_348.opCall();
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_IgnoreMovementCollisionCounter: ").Append(local_317_3));
    if (local_317_3)
    {
        MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> NOTE: FC_IgnoreMovementCollisionCounter present - collision job excluded!"));
    }
    Has local_352;
    bool local_151_7 = local_352.opCall();
    MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_AISimpleMovement: ").Append(local_151_7));
    if (local_151_7)
    {
        MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> NOTE: FC_AISimpleMovement present - collision job excluded!"));
    }
    MovementStopDiagnosis::Section("15. External Force");
    Has local_356;
    bool local_157_8 = local_356.opCall();
    if (local_157_8)
    {
        FString local_298_6 = FString();
        MovementStopDiagnosis::Log(local_298_6.Append("[DumpMove]   ExternalForce.Velocity = ").Append(local_362.GetVelocity()));
        if (!(local_362.GetVelocity().IsNearlyZero(9.999999747378752e-5)))
        {
            MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   >>> NOTE: ExternalForce active - may counteract movement direction!"));
        }
    }
    else
    {
        MovementStopDiagnosis::Log(FString().Append("[DumpMove]   FC_CharacterMovementExternalForce: not present"));
    }
    MovementStopDiagnosis::Section("SUMMARY");
    if (local_5 == 0)
    {
        MovementStopDiagnosis::Log(FString().Append("[DumpMove]   No obvious issues found. Check collision system or AI behavior tree."));
    }
    else
    {
        MovementStopDiagnosis::Warn(FString().Append("[DumpMove]   Found ").Append(local_5).Append(" potential issue(s). Search for '>>> ISSUE' in log."));
    }
    MovementStopDiagnosis::Log(FString().Append("[DumpMove] ========================================"));
    return;
}
}

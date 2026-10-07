
const FConsoleVariable CVar_Camera_DebugDraw = FConsoleVariable();
const FConsoleVariable CVar_Camera_DebugTraceTime = FConsoleVariable();
const FConsoleVariable CVar_Camera_DebugTraceDirArrow = FConsoleVariable();
const FConsoleVariable CVar_Camera_DebugTraceFollowTarget = FConsoleVariable();
const FConsoleVariable CVar_Camera_DebugTraceForwardOffset = FConsoleVariable();
const FConsoleVariable CVar_Camera_DebugDrawViewInputDir = FConsoleVariable();
const FConsoleVariable CVar_Camera_DebugDrawAimViewInputDir = FConsoleVariable();
const FConsoleVariable CVar_Camera_DebugState = FConsoleVariable();
const FConsoleVariable CVar_Camera_DebugCollisionObject = FConsoleVariable();

struct FDebugCameraInfo
{
    UPROPERTY()
    FVector LastPosition;
    UPROPERTY()
    FRotator LastRotation;
    UPROPERTY()
    FVector LastRawFollowPosWithOffset;
    UPROPERTY()
    FVector LastFollowPosition;
    UPROPERTY()
    FVector LastFollowPosWithOffset;
    UPROPERTY()
    float32 LastTime;


}

class US_DebugCameraSystem : UECSScriptSystem
{
    UPROPERTY()
    FInstancedStruct CameraInfo = FInstancedStruct(FDebugCameraInfo);

    US_DebugCameraSystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return true;
    }
    FDebugCameraInfo GetCameraInfo() const
    {
        FDebugCameraInfo __r;
        TRawPtr<FDebugCameraInfo> local_6 = FInstancedStruct::GetMutablePtr_Const(this.CameraInfo).opCall();
        return __r;
    }
    UFUNCTION()
    void ClientJob_DebugESMState(const FCS_LocalPlayer &inout LocalPlayer, const FCS_FixedTime &inout Time) const
    {
        int local_38 = 0;
        UESMState local_124;
        float32 local_131;
        if (!(Time.bLatestFrame))
        {
            return;
        }
        FECSEntity local_6 = FECSEntity(LocalPlayer.GetPlayerPawnEntity());
        if (!(local_6.IsValid()))
        {
            return;
        }
        Get local_14;
        const FC_MountIsDrivenBy& local_16 = local_14.opCall();
        if (local_16)
        {
            local_6 = local_16.GetDriverEntity();
        }
        Has local_20;
        Has local_26;
        if (!(local_6.IsValid()) || !(local_20.opCall()) || !(local_26.opCall()))
        {
            return;
        }
        Get local_30;
        UESMAsset local_32 = local_30.opCall().Asset;
        FString local_42 = FString().Append("[ESM] ").Append(local_32.GetFName());
        int local_49 = 0;
        for (; local_49 < local_38.Player.GetSMRuntime().Num(); ++local_49)
        {
            FESMRT local_100 = FESMRT(local_38.Player.GetSMRuntime()[local_49]);
            UESMStateMachine local_104 = local_32.GetStateMachine(local_49);
            UESMBaseState local_108 = local_104.GetBaseState(local_100.GetStateIndex());
            FString local_116;
            if (local_108 != nullptr)
            {
                local_116 = local_108.GetDataName().ToString();
            }
            else
            {
                local_116 = "Invalid";
            }
            FString local_112 = local_104.GetDataName().ToString();
            float32 local_122 = local_100.GetStateLastTime();
            local_124 = Cast<UESMState>(local_108);
            if (local_124 != nullptr)
            {
                local_131 = local_124.GetStateLength();
            }
            else
            {
                local_131 = 0.0f;
            }
            if (local_131 > 0.0f)
            {
                local_42 += FString().Append("\n  [").Append(local_112).Append("] ").Append(local_116).Append("  ").Append(FString::ApplyFormat(((local_122 / local_131) * 100.0f), ".0f")).Append("%  speed=").Append(FString::ApplyFormat(local_100.GetSMPlaySpeed(), ".2f"));
                continue;
            }
            local_42 += FString().Append("\n  [").Append(local_112).Append("] ").Append(local_116).Append("  t=").Append(FString::ApplyFormat(local_122, ".2f")).Append("s  speed=").Append(FString::ApplyFormat(local_100.GetSMPlaySpeed(), ".2f"));
        }
        System::PrintString(__GetWorldContext(), local_42, true, false, FLinearColor::Gray, 0.2f, n"CameraDebug_ESMState");
        return;
    }
    UFUNCTION()
    void ClientJob_DebugCamera(const FCS_LocalPlayer &inout LocalPlayer, const FCS_FixedTime &inout Time) const
    {
        int local_8 = 0;
        if (!(Time.bLatestFrame))
        {
            return;
        }
        if (!(local_8))
        {
            return;
        }
        FECSEntity local_16 = LocalPlayer.GetCameraViewTargetEntity();
        FCS_TPCameraParam& local_18 = FCameraUtils::GetCameraParam(local_16);
        FDebugCameraInfo& local_20 = this.GetCameraInfo();
        FVector local_26 = local_8.GetPosition();
        if (CVar_Camera_DebugTraceForwardOffset.GetFloat() != 0.0f)
        {
            FVector local_42 = (local_8.GetRotation().Vector() * CVar_Camera_DebugTraceForwardOffset.GetFloat());
            local_26 += local_42;
        }
        FVector local_48(local_18.RawFollowTargetPosWithOffset);
        FVector local_54(local_18.FollowTargetPosition);
        FVector local_34 = (local_54 + FVector(local_18.StateParams.GetCombinedTargetOffset()));
        if (CVar_Camera_DebugTraceTime.GetFloat() > 0.0f)
        {
            float32 local_65 = CVar_Camera_DebugTraceTime.GetFloat() - (float32(Time.Time.ToSeconds()) - local_20.LastTime);
            if (local_65 > 0.0f)
            {
                FECSDebugDraw::DrawDebugLine(NAME_None, local_20.LastPosition, local_26, FColor::Red, FColor::Red, local_65, uint8(0), 2.0f);
                FECSDebugDraw::DrawDebugPoint(NAME_None, local_26, 2.0f, FColor::Yellow, FColor::Yellow, local_65, uint8(1));
                if (CVar_Camera_DebugTraceDirArrow.GetBool())
                {
                    FVector local_42_2 = (local_8.GetRotation().Vector() * 20.0);
                    FECSDebugDraw::DrawDebugDirectionalArrow(NAME_None, local_26, (local_26 + local_42_2), 1.0f, FColor::Green, FColor::Green, local_65, uint8(1), 0.0f);
                }
                if (CVar_Camera_DebugTraceFollowTarget.GetBool())
                {
                    FECSDebugDraw::DrawDebugLine(NAME_None, local_20.LastFollowPosition, local_54, FColor::Green, FColor::Green, local_65, uint8(0), 2.0f);
                    FECSDebugDraw::DrawDebugPoint(NAME_None, local_54, 2.0f, FColor::Yellow, FColor::Yellow, local_65, uint8(1));
                    FECSDebugDraw::DrawDebugLine(NAME_None, local_20.LastFollowPosWithOffset, local_34, FColor::Emerald, FColor::Emerald, local_65, uint8(0), 2.0f);
                    FECSDebugDraw::DrawDebugPoint(NAME_None, local_34, 2.0f, FColor::Yellow, FColor::Yellow, local_65, uint8(1));
                    FECSDebugDraw::DrawDebugLine(NAME_None, local_20.LastRawFollowPosWithOffset, local_48, FColor::Blue, FColor::Blue, local_65, uint8(0), 2.0f);
                    FECSDebugDraw::DrawDebugPoint(NAME_None, local_48, 2.0f, FColor::Yellow, FColor::Yellow, local_65, uint8(1));
                }
            }
        }
        local_20.LastPosition = local_26;
        local_20.LastFollowPosition = local_54;
        local_20.LastFollowPosWithOffset = local_34;
        local_20.LastRawFollowPosWithOffset = local_48;
        local_20.LastRotation = local_8.GetRotation();
        local_20.LastTime = float32(Time.Time.ToSeconds());
        return;
    }
    UFUNCTION()
    void ClientJob_DebugDrawViewInputDir(const FCS_LocalPlayer &inout LocalPlayer, const FCS_FixedTime &inout Time) const
    {
        bool local_2;
        bool local_3;
        int local_18 = 0;
        if (!(Time.bLatestFrame))
        {
            return;
        }
        local_2 = CVar_Camera_DebugDrawViewInputDir.GetBool();
        local_3 = CVar_Camera_DebugDrawAimViewInputDir.GetBool();
        if (!(local_2) && !(local_3))
        {
            return;
        }
        FECSEntity local_8 = FECSEntity(LocalPlayer.GetPlayerPawnEntity());
        if (!(local_8.IsValid()))
        {
            return;
        }
        if (!(local_18))
        {
            return;
        }
        FVector local_30 = FCharacterInputUtils::GetViewPosition(local_8, local_18, Time.Time);
        float32 local_31 = 2000.0f;
        float32 local_33 = 5.0f;
        if (local_2)
        {
            FRotator local_46 = FCharacterInputUtils::GetViewInputDir(local_8, Time.Time);
            FVector local_24 = local_46.Vector();
            FVector local_66 = (local_30 + (local_24 * local_31));
            FQuat local_84 = FQuat::FindBetweenNormals(FVector::UpVector, local_24);
            FECSDebugDraw::DrawDebugCapsule(NAME_None, local_66, local_31, local_33, local_84, FColor::Blue, FColor::Blue, 0.0f, uint8(1), 0.0f);
        }
        if (local_3)
        {
            FRotator local_40 = FCharacterInputUtils::GetAimViewInputDir(local_8, Time.Time);
            FVector local_52_2 = local_40.Vector();
            FVector local_24_2 = (local_52_2 * local_31);
            FVector local_58 = (local_30 + local_24_2);
            FQuat local_76 = FQuat::FindBetweenNormals(FVector::UpVector, local_52_2);
            FECSDebugDraw::DrawDebugCapsule(NAME_None, local_58, local_31, local_33, local_76, FColor::Green, FColor::Green, 0.0f, uint8(1), 0.0f);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_DebugCollisionObject(const FCS_LocalPlayer &inout LocalPlayer, const FCS_FixedTime &inout Time) const
    {
        int local_8 = 0;
        UPrimitiveComponent local_126;
        if (!(Time.bLatestFrame))
        {
            return;
        }
        if (!(local_8))
        {
            return;
        }
        FCS_TPCameraParam& local_18 = FCameraUtils::GetCameraParam(LocalPlayer.GetCameraViewTargetEntity());
        if (!(local_18))
        {
            return;
        }
        if (!((local_18.TargetOffsetScale < 0.99f) || (local_18.SocketOffsetScale < 0.99f)))
        {
            return;
        }
        FHitResult local_88;
        bool local_22 = ::CameraDebugUtils::SweepCameraCollisionObject(local_18.FollowTargetPosition, local_8.GetRotation(), FVector(local_18.StateParams.GetTargetOffset()), FVector(local_18.StateParams.GetCombinedSocketOffset()), local_18.CamOffsetHorizontalFlipRatio, local_18.MuteCollisionDistance, local_88);
        FString local_116;
        if (local_22)
        {
            AActor local_106 = local_88.GetActor();
            FString local_120;
            if (local_106 != nullptr)
            {
                local_120 = local_106.GetActorNameOrLabel();
            }
            else
            {
                local_120 = "None";
            }
            if (local_126 != nullptr)
            {
                local_116 = local_126.GetName();
            }
            else
            {
                local_116 = "None";
            }
            PrintToScreen(FString().Append("[CameraCollision]  Actor=").Append(local_120).Append(",  Component=").Append(local_116).Append(", Level=").Append(Gameplay::GetCurrentLevelName(__GetWorldContext(), true)), 1.0f, FLinearColor::Yellow);
            XLog(ELog(10), FString().Append("[CameraCollision]  Actor=").Append(local_120).Append(",  Component=").Append(local_116).Append(", Level=").Append(Gameplay::GetCurrentLevelName(__GetWorldContext(), true)));
            if (local_106 != nullptr)
            {
                PrintToScreen(FString().Append("[CameraCollision] ActorPath=").Append(local_106.GetPathName(nullptr)), 1.0f, FLinearColor::Yellow);
                XLog(ELog(10), FString().Append("[CameraCollision] ActorPath=").Append(local_106.GetPathName(nullptr)));
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_DebugESMState() const
    {
        int local_14 = 0;
        int local_20 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (CVar_Camera_DebugState.GetBool() == false)
        {
            return;
        }
        FECSWorldPtr local_8 = this.GetECSWorld();
        Has local_12;
        if (!(local_12.opCall()))
        {
            return;
        }
        FECSWorldPtr local_8_2 = this.GetECSWorld();
        this.ClientJob_DebugESMState(local_14, local_20);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_DebugCamera() const
    {
        int local_14 = 0;
        int local_20 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (CVar_Camera_DebugDraw.GetBool() == false)
        {
            return;
        }
        FECSWorldPtr local_8 = this.GetECSWorld();
        Has local_12;
        if (!(local_12.opCall()))
        {
            return;
        }
        FECSWorldPtr local_8_2 = this.GetECSWorld();
        this.ClientJob_DebugCamera(local_14, local_20);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_DebugDrawViewInputDir() const
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
        this.ClientJob_DebugDrawViewInputDir(local_14, local_20);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_DebugCollisionObject() const
    {
        int local_18 = 0;
        int local_24 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (CVar_Camera_DebugCollisionObject.GetBool() == false)
        {
            return;
        }
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        FECSWorldPtr local_12 = this.GetECSWorld();
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        FECSWorldPtr local_12_2 = this.GetECSWorld();
        this.ClientJob_DebugCollisionObject(local_18, local_24);
        return;
    }
}

namespace CameraDebugUtils
{
bool SweepCameraCollisionObject(const FVector &inout FollowTarget, const FRotator &inout CamRotation, const FVector &inout TargetOffset, const FVector &inout SocketOffset, const float32 HorizontalFlip, const float32 MuteCollisionDistance, FHitResult &inout OutHit)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
}

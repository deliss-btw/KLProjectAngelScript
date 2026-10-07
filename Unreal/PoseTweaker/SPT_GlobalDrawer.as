

class AKLGroundPlaneTracer : AKLEditorTickableActor
{
    UPROPERTY()
    UBillboardComponent Billboard;
    UPROPERTY()
    float32 TraceRadius;
    UPROPERTY()
    int TracePointNum;
    UPROPERTY()
    FKLGroundPlaneTraceParams GroundTraceParams;
    FKLGroundPlaneTraceResult GroundTraceResult;

    AKLGroundPlaneTracer()
    {
        this.TraceRadius = 25.0f;
        this.TracePointNum = 32;
        this.GroundTraceParams.DownOffset = 1000.0f;
        this.GroundTraceParams.UpOffset = 20.0f;
        this.GroundTraceParams.bWantDebugInfo = true;
        ::FootIKUtils::CreateGroundPlaneTraceParams(this.GroundTraceParams, this.TracePointNum, int(this.TraceRadius), this.TraceRadius);
        return;
    }
    UFUNCTION()
    void EditorPostEditChange_Implementation()
    {
        ::FootIKUtils::CreateGroundPlaneTraceParams(this.GroundTraceParams, this.TracePointNum, int(this.TraceRadius), this.TraceRadius);
        return;
    }
    UFUNCTION()
    void EditorTick_Implementation(const float32 DeltaTime)
    {
        UWorld local_2 = this.GetWorld();
        this.GroundTraceResult = local_2.GroundPlaneTrace(this.GetActorTransform(), this.GroundTraceParams);
        return;
    }
}

class UKLPoseTweakerDrawer : UGameDebugImGuiGlobalDrawer
{
    FName SkeletalMeshName = n"SkeletalMesh";

    UKLPoseTweakerDrawer()
    {
        return;
    }
    UFUNCTION()
    void WhenDraw_Implementation(const FGameDebugDrawHandle &inout Handle, const FGameDebugGlobalDrawerContext &inout Context)
    {
        bool local_35;
        UKLAnimInstance local_38;
        TArray<UKLAnimInstance> local_6 = Context.DrawerWorld.GetObjectsInWorld(UKLAnimInstance);
        for (auto local_26 : local_6)
        {
            USkeletalMeshComponent local_30 = local_26.GetOwningComponent();
            if (local_30.GetOwner() != nullptr && local_30.GetOwner().IsHidden())
            {
                continue;
            }
            if (!(local_30.IsPoseTweakerCompatible()))
            {
                continue;
            }
            local_38 = Cast<UKLAnimInstance>(local_30.GetAnimInstance());
            if (local_38 != nullptr)
            {
                for (auto& local_56 : local_38.PoseTweakersToVisualize)
                {
                    local_56;
                }
                if (int(local_38.GroundTracePointCount) > 0)
                {
                    FTransform local_84 = FTransform(local_38.GroundTraceResult.PlaneTransform);
                    if (local_38.GroundTraceResult.bHasValidGroundPlane)
                    {
                    }
                    else
                    {
                    }
                    Handle.DrawRectangle(local_84, 120.0f, 120.0f, FLinearColor());
                    Handle.DrawCoordinateSystem(local_84, 20.0f, ESceneDepthPriorityGroup(1), 0.0f, 0.0f);
                    for (auto& local_108 : local_38.GroundTraceResult.GroundHitPoints)
                    {
                        Handle.DrawPoint(local_108, FLinearColor(FColor::Yellow), 4.0f, ESceneDepthPriorityGroup(1));
                    }
                }
            }
        }
        TArray<AKLGroundPlaneTracer> local_112 = Context.DrawerWorld.GetActorsInWorld(AKLGroundPlaneTracer);
        for (auto& local_130 : local_112)
        {
            if (local_130.GroundTraceResult.bHasValidGroundPlane)
            {
                Handle.DrawCoordinateSystem(local_130.GroundTraceResult.PlaneTransform, 20.0f, ESceneDepthPriorityGroup(1), 0.0f, 0.0f);
                Handle.DrawRectangle(local_130.GroundTraceResult.PlaneTransform, 100.0f, 100.0f, FLinearColor(FColor::Red), ESceneDepthPriorityGroup(1), 0.0f, 0.0f);
            }
            for (auto& local_108 : local_130.GroundTraceResult.GroundHitPoints)
            {
                Handle.DrawPoint(local_108, FLinearColor(FColor::Yellow), 4.0f, ESceneDepthPriorityGroup(1));
            }
            ImGui::SetNextWindowBgAlpha(0.4f);
            local_35 = Handle.BeginPanelAt(local_130.GetFName(), local_130.GetActorLocation(), 0.0f, 725871);
            if (local_35)
            {
                ImGui::Text(FString().Append("Trace Time: ").Append(FString::ApplyFormat(local_130.GroundTraceResult.TraceTimeInMS, ".4f")).Append(" ms"));
                for (auto& local_160 : local_130.GroundTraceResult.HitActors)
                {
                    local_160;
                    AActor local_34;
                    ImGui::Text(FString().Append("-").Append(local_34.GetName()));
                }
            }
            Handle.EndPanel();
        }
        return;
    }
}

struct FMainPlayerSceneQuerySetting
{
    UPROPERTY()
    float32 TraceLength = 300.0f;
    UPROPERTY()
    float CenterOffsetZ = 0.0;
    UPROPERTY()
    float HalfHorizonAngle = 60.0;
    UPROPERTY()
    float TraceLineAngleStep = 15.0;


}

struct FColliderInfo
{
    UPROPERTY()
    FName ActorName;
    UPROPERTY()
    FName CompName;
    UPROPERTY()
    FString ObjectResponseStr;

    FColliderInfo()
    {
        return;
    }
}

class UMainPlayerSceneQueryDrawer : UGameDebugImGuiGlobalDrawer
{
    FMainPlayerSceneQuerySetting Setting;

    UMainPlayerSceneQueryDrawer()
    {
        return;
    }
    UFUNCTION()
    void WhenDraw_Implementation(const FGameDebugDrawHandle &inout Handle, const FGameDebugGlobalDrawerContext &inout Context)
    {
        APlayerController local_38;
        AECSPlayerController local_42;
        UPrimitiveComponent local_266;
        TArray<APlayerController> local_6 = Context.DrawerWorld.GetActorsInWorld(APlayerController);
        FString local_14 = "None";
        TMap<FString, FColliderInfo> local_34;
        FName local_272;
        if (!(local_6.IsEmpty()))
        {
            float local_130;
            float local_128;
            float local_110;
            local_38 = local_6[0];
            local_42 = (Cast<AECSPlayerController>(local_38));
            if (local_42 != nullptr && ECS::GetECSWorld().IsValid())
            {
                local_14 = local_42.GetName();
                const AActor local_56 = local_42.GetPlayerPawnActor();
                if (local_56 != nullptr)
                {
                    FTransform local_80 = local_56.GetActorTransform();
                    FVector local_86(local_80.GetRotation().GetAxisX());
                    FVector local_126 = (local_80.GetLocation() + FVector(0.0, 0.0, this.Setting.CenterOffsetZ));
                    local_128 = this.Setting.HalfHorizonAngle;
                    local_130 = this.Setting.TraceLineAngleStep;
                    local_110 = local_128 / local_130;
                    int local_36 = FMath::FloorToInt(local_110);
                    FCollisionQueryParams local_170 = FCollisionQueryParams(n"MainPlayerSceneQuery", true, local_56);
                    FCollisionObjectQueryParams local_172;
                    local_172.AddObjectTypesToQuery(ECollisionChannel(0));
                    local_172.AddObjectTypesToQuery(ECollisionChannel(1));
                    int local_131 = -local_36;
                    for (; local_131 <= local_36; ++local_131)
                    {
                        float local_114 = local_130 * local_131;
                        FRotator local_180 = FRotator(0.0, local_114, 0.0);
                        FVector local_102 = local_180.RotateVector(local_86);
                        FHitResult local_252;
                        bool local_35 = System::LineTraceSingleByObjectType(local_252, local_126, (local_126 + (local_102 * this.Setting.TraceLength)), local_172, local_170);
                        if (local_35)
                        {
                            Handle.DrawLine(local_126, local_252.ImpactPoint, FLinearColor::Red, ESceneDepthPriorityGroup(0), 0.0f, 0.0f);
                            AActor local_262 = local_252.GetActor();
                            FName local_274;
                            if (local_262 != nullptr)
                            {
                                local_274 = local_262.GetFName();
                            }
                            else
                            {
                                local_274 = n"None";
                            }
                            if (local_266 != nullptr)
                            {
                                local_272 = local_266.GetFName();
                            }
                            else
                            {
                                local_272 = n"None";
                            }
                            FString local_52 = FString();
                            FString local_258 = local_52.Append(local_274).Append(" | ").Append(local_272);
                            if (!(local_34.Contains(local_258)))
                            {
                                FColliderInfo local_284;
                                local_284.ActorName = local_274;
                                local_284.CompName = local_272;
                                local_284.ObjectResponseStr = KLCollisionInfo::GetComponentObjectResponseString(local_266);
                                local_34.Add(local_258, local_284);
                            }
                        }
                    }
                }
            }
        }
        if (Handle.BeginFloatingPanel())
        {
            float local_130;
            float local_128;
            float local_110;
            FString local_52_2 = String::Conv_DoubleToString(this.Setting.TraceLength);
            ImGui::InputText(n"Trace Length (cm)", local_52_2, Handle.GetDefaultPanelFlags());
            float32 local_253 = float32(String::Conv_StringToDouble(local_52_2));
            if (local_253 > 0.0f)
            {
                this.Setting.TraceLength = local_253;
            }
            FString local_258_2 = String::Conv_DoubleToString(this.Setting.CenterOffsetZ);
            ImGui::InputText(n"Center OffsetZ (cm)", local_258_2, ImGuiInputTextFlags::CharsDecimal);
            local_110 = String::Conv_StringToDouble(local_258_2);
            this.Setting.CenterOffsetZ = local_110;
            FString local_52_3 = String::Conv_DoubleToString(this.Setting.HalfHorizonAngle);
            ImGui::InputText(n"Half Horizon Angle (degree)", local_52_3, ImGuiInputTextFlags::CharsDecimal);
            local_130 = String::Conv_StringToDouble(local_52_3);
            if (local_130 > 0.0)
            {
                local_110 = local_130;
            }
            else
            {
                local_110 = this.Setting.HalfHorizonAngle;
            }
            this.Setting.HalfHorizonAngle = local_110;
            FString local_258_3 = String::Conv_DoubleToString(this.Setting.TraceLineAngleStep);
            ImGui::InputText(n"TraceLine Angle Step (degree)", local_258_3, ImGuiInputTextFlags::CharsDecimal);
            local_110 = String::Conv_StringToDouble(local_258_3);
            if (local_110 > 0.0)
            {
                local_128 = local_110;
            }
            else
            {
                local_128 = this.Setting.TraceLineAngleStep;
            }
            this.Setting.TraceLineAngleStep = local_128;
            FString local_52_4 = FString();
            ImGui::Text(local_52_4.Append("CurrentPlayerActor ").Append(local_14));
            if (!(local_34.IsEmpty()))
            {
                TArray<FString> local_290;
                local_34.GetKeys(local_290);
                ImGui::Text("Collides with:");
                for (auto& local_304 : local_290)
                {
                    local_304;
                    FColliderInfo local_284;
                    FString local_52_5 = FString();
                    ImGui::Text(local_52_5.Append(local_284.ActorName).Append(" | ").Append(local_284.CompName).Append(" = ").Append(local_284.ObjectResponseStr));
                }
            }
        }
        Handle.EndFloatingPanel();
        return;
    }
}



const int PERF_ACTION_DEVICE_INFO = 100001;
const int PERF_ACTION_HEARTBEAT = 100002;
const int PERF_ACTION_SHADER_COMPILE = 100003;
const int PERF_ACTION_PSO_HITCH = 100004;
const int PERF_ACTION_LEVEL_LOADING = 100005;
const int PERF_ACTION_STREAM_1S = 100006;
const int PERF_ACTION_RUNTIME_5S = 100007;
const FString PERF_NAME_DEVICE_INFO = FString();
const FString PERF_NAME_HEARTBEAT = FString();
const FString PERF_NAME_SHADER_COMPILE = FString();
const FString PERF_NAME_PSO_HITCH = FString();
const FString PERF_NAME_LEVEL_LOADING = FString();
const FString PERF_NAME_STREAM_1S = FString();
const FString PERF_NAME_RUNTIME_5S = FString();
const FConsoleVariable CVar_PerfReport_TestSdkError = FConsoleVariable();
const FConsoleVariable CVar_PerfReport_TestSdkFatal = FConsoleVariable();

// NOTE: class defaults are not authored in this module: US_ClientPerfReportSystem (default scalar field UECSSystem.SystemNetMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FPerfHeartbeatBody
{
    UPROPERTY()
    float32 fps = 0.0f;
    UPROPERTY()
    float32 frame_time = 0.0f;
    UPROPERTY()
    float32 game_frame_time = 0.0f;
    UPROPERTY()
    float32 render_frame_time = 0.0f;
    UPROPERTY()
    float32 rhi_frame_time = 0.0f;
    UPROPERTY()
    int64 ram = 0;
    UPROPERTY()
    int64 ram_remain = 0;
    UPROPERTY()
    int64 vram = 0;
    UPROPERTY()
    int64 vram_capacity = 0;
    UPROPERTY()
    float32 cpu_usage = 0.0f;
    UPROPERTY()
    float32 cpu_core1_usage = 0.0f;
    UPROPERTY()
    float32 gpu_usage = 0.0f;
    UPROPERTY()
    int streaming_progress = 0;
    UPROPERTY()
    bool is_recommended_quality = false;
    UPROPERTY()
    FString country_code;
    UPROPERTY()
    FString ip_d;
    UPROPERTY()
    FString time;
    UPROPERTY()
    FString session_id;
    UPROPERTY()
    FString client_version;
    UPROPERTY()
    FString game_version;
    UPROPERTY()
    FString uid;
    UPROPERTY()
    FString region;
    UPROPERTY()
    FString ds_id;
    UPROPERTY()
    FString game_mode;
    UPROPERTY()
    int scene_id = 0;
    UPROPERTY()
    int region_id = 0;
    UPROPERTY()
    float32 x_coordinate = 0.0f;
    UPROPERTY()
    float32 y_coordinate = 0.0f;
    UPROPERTY()
    float32 z_coordinate = 0.0f;
    UPROPERTY()
    FString camera_position;
    UPROPERTY()
    FString weather;
    UPROPERTY()
    FString avatar_id;
    UPROPERTY()
    FString boss_id;
    UPROPERTY()
    FString control_type;
    UPROPERTY()
    int dpi = 0;
    UPROPERTY()
    int ecs_frame_time = 0;
    UPROPERTY()
    FString graphics_quality;
    UPROPERTY()
    int rtt_ds = 0;
    UPROPERTY()
    int rtt_gs = 0;
    UPROPERTY()
    int jitter_ms = 0;
    UPROPERTY()
    int send_packets = 0;
    UPROPERTY()
    int loss_packets = 0;
    UPROPERTY()
    int input_delay_ms = 0;


}

struct FPerfShaderCompileBody
{
    UPROPERTY()
    FString time;
    UPROPERTY()
    FString uid;
    UPROPERTY()
    FString region;
    UPROPERTY()
    FString client_version;
    UPROPERTY()
    FString game_version;
    UPROPERTY()
    int pso_count = 0;
    UPROPERTY()
    int elapsed_ms = 0;
    UPROPERTY()
    int precache_hit = 0;
    UPROPERTY()
    int precache_total = 0;
    UPROPERTY()
    bool from_cache = false;


}

struct FPerfLevelLoadingBody
{
    UPROPERTY()
    FString time;
    UPROPERTY()
    FString ds_id;
    UPROPERTY()
    FString loading_type;
    UPROPERTY()
    int from_scene_id = 0;
    UPROPERTY()
    int to_scene_id = 0;
    UPROPERTY()
    int region_id = 0;
    UPROPERTY()
    bool is_first_load = false;
    UPROPERTY()
    int loading_ms = 0;
    UPROPERTY()
    int ds_load_ms = 0;


}

struct FPerfPSOHitchItem
{
    UPROPERTY()
    int compile_us = 0;
    UPROPERTY()
    int first_ms = 0;
    UPROPERTY()
    int count = 0;
    UPROPERTY()
    FString runtime_hash;
    UPROPERTY()
    FString filecache_hash;
    UPROPERTY()
    FString precache_hash;
    UPROPERTY()
    FString shader_hash;
    UPROPERTY()
    bool precache = false;
    UPROPERTY()
    FString type;
    UPROPERTY()
    FString source;


}

struct FPerfPSOHitchBody
{
    UPROPERTY()
    FString time;
    UPROPERTY()
    FString uid;
    UPROPERTY()
    FString region;
    UPROPERTY()
    FString client_version;
    UPROPERTY()
    FString game_version;
    UPROPERTY()
    TArray<FPerfPSOHitchItem> pso_hitches;

    FPerfPSOHitchBody()
    {
        return;
    }
}

class US_ClientPerfReportSystem : UECSScriptSystem
{
    US_ClientPerfReportSystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return (int(this.GetWorld().GetNetMode()) == 1);
    }
    UFUNCTION()
    void ClientJob_ReportDeviceInfo() const
    {
        this.ReportDeviceInfo();
        return;
    }
    UFUNCTION()
    void ClientJob_PerfHeartbeat() const
    {
        if (!(::UGameClientConnectionSubsystem::Get().IsConnectedToGameServer()))
        {
            return;
        }
        this.ReportHeartbeat();
        return;
    }
    UFUNCTION()
    void ClientJob_PerfSample() const
    {
        if (!(::UGameClientConnectionSubsystem::Get().IsConnectedToGameServer()))
        {
            return;
        }
        KLPerfReport::SampleRuntimeStats();
        KLPerfReport::SampleStreamingStats();
        KLPerfReport::SampleVTStats();
        return;
    }
    UFUNCTION()
    void ClientJob_PerfStream1s() const
    {
        if (!(::UGameClientConnectionSubsystem::Get().IsConnectedToGameServer()))
        {
            return;
        }
        this.ReportStream1s();
        return;
    }
    UFUNCTION()
    void ClientJob_PerfRuntime5s() const
    {
        if (!(::UGameClientConnectionSubsystem::Get().IsConnectedToGameServer()))
        {
            return;
        }
        this.ReportRuntime5s();
        return;
    }
    UFUNCTION()
    void ClientJob_TestSdkErrorCapture() const
    {
        if (!(CVar_PerfReport_TestSdkError.GetBool()))
        {
            return;
        }
        this.RunSdkErrorCaptureTest();
        return;
    }
    UFUNCTION()
    void ClientJob_TestSdkFatalCapture() const
    {
        if (!(CVar_PerfReport_TestSdkFatal.GetBool()))
        {
            return;
        }
        this.RunSdkFatalCaptureTest();
        return;
    }
    void SendReport(const int ActionId, const FString &inout ActionName, const FString &inout Json, const bool bImportant = false) const
    {
        if (Json.IsEmpty())
        {
            return;
        }
        UMiHoYoSDKHelper::EnqueueReportAction(ActionId, ActionName, Json, this.GetLocalPlayerLevelStr(), bImportant);
        return;
    }
    FString GetLocalPlayerLevelStr() const
    {
        ::FASCommonUtils::GetLocalPlayerProxy();
        Get local_14;
        const FC_PlayerInGameState& local_10 = local_14.opCall();
        if (local_10)
        {
            return FString().Append(local_10.GetCurLevel());
        }
        return "0";
    }
    void WriteGameplayFields(FPerfHeartbeatBody &inout Body) const
    {
        int local_121 = 0;
        UEnum local_172;
        FECSEntity local_8 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        if (local_8.IsValid())
        {
            if (::GetAvatarConfig(local_8))
            {
                FString local_62 = FString();
            }
            Get local_68;
            const FC_Transform& local_64 = local_68.opCall();
            if (local_64)
            {
                Body.x_coordinate = float32(local_64.GetPosition().X);
                Body.y_coordinate = float32(local_64.GetPosition().Y);
                Body.z_coordinate = float32(local_64.GetPosition().Z);
            }
        }
        if (::FLevelUtils::GetCurrentLevelInfoConfig(nullptr))
        {
            Body.scene_id = local_121;
        }
        ::FASCommonUtils::GetLocalPlayerProxy();
        Get local_132;
        const FC_PlayerControllerWeatherEntity& local_128 = local_132.opCall();
        if (local_128)
        {
            Body.weather = local_128.GetWeatherName().ToString();
        }
        Get local_140;
        if (local_140.opCall())
        {
            Get local_146;
            const FC_RegionWorldAreaConfig& local_142 = local_146.opCall();
            if (local_142)
            {
                if (local_142.GetWorldAreaConfig())
                {
                    Body.region_id = local_121;
                }
            }
        }
        APlayerCameraManager local_148 = Gameplay::GetPlayerCameraManager(__GetWorldContext(), 0);
        if (IsValid(local_148))
        {
            Body.camera_position = local_148.GetCameraLocation().ToString();
        }
        APlayerController local_162 = Gameplay::GetPlayerController(__GetWorldContext(), 0);
        if (IsValid(local_162))
        {
            UEUIInputSubsystem local_166 = UEUIInputSubsystem::Get(local_162.GetLocalPlayer());
            if (IsValid(local_166))
            {
                local_172 = EnumType();
                if (IsValid(local_172))
                {
                    Body.control_type = local_172.GetNameByValue(int(local_166.GetCurrentInputType())).ToString();
                }
            }
        }
        Body.graphics_quality = FString().Append(UPerformanceUtils::GetOverallGraphicsQuality());
        FECSWorldPtr local_184 = ECS::GetECSWorld();
        Get local_188;
        const FCS_GameMode& local_182 = local_188.opCall();
        if (local_182)
        {
            local_172 = EnumType();
            if (IsValid(local_172))
            {
                Body.game_mode = local_172.GetNameByValue(int(local_182.GetGameModeType())).ToString();
            }
        }
        FECSWorldPtr local_184_2 = ECS::GetECSWorld();
        FCS_FixedTime local_194;
        Body.ecs_frame_time = int(local_194.Frame);
        return;
    }
    void ReportDeviceInfo() const
    {
        FString local_14 = ::UGameClientConnectionSubsystem::Get().CachedLoginUserName;
        UMiHoYoSDKHelper::EnqueueDeviceInfoReport(100001, PERF_NAME_DEVICE_INFO, ::UGameClientConnectionSubsystem::Get().GetCachedSDKDeviceId(), local_14, this.GetLocalPlayerLevelStr());
        return;
    }
    void ReportStream1s() const
    {
        UMiHoYoSDKHelper::EnqueueStream1sReport(100006, PERF_NAME_STREAM_1S, FDateTime::Now().ToString("%Y-%m-%d %H:%M:%S"), ::UGameClientConnectionSubsystem::Get().CachedLoginUserId, FString().Append(::UGameClientConnectionSubsystem::Get().GetKCPSessionId()), this.GetLocalPlayerLevelStr());
        return;
    }
    void ReportRuntime5s() const
    {
        UMiHoYoSDKHelper::EnqueueRuntime5sReport(100007, PERF_NAME_RUNTIME_5S, FDateTime::Now().ToString("%Y-%m-%d %H:%M:%S"), ::UGameClientConnectionSubsystem::Get().CachedLoginUserId, FString().Append(::UGameClientConnectionSubsystem::Get().GetKCPSessionId()), ::UGameClientConnectionSubsystem::Get().GetClientVersion(), ::UGameClientConnectionSubsystem::Get().GetCachedGateAddress(), this.GetLocalPlayerLevelStr());
        return;
    }
    void ReportHeartbeat() const
    {
        FPerfHeartbeatBody local_98;
        int local_110 = 0;
        local_98.time = FDateTime::Now().ToString("%Y-%m-%d %H:%M:%S");
        local_98.client_version = ::UGameClientConnectionSubsystem::Get().GetClientVersion();
        local_98.game_version = ::UGameClientConnectionSubsystem::Get().GetClientVersion();
        local_98.uid = ::UGameClientConnectionSubsystem::Get().CachedLoginUserId;
        local_98.session_id = FString().Append(::UGameClientConnectionSubsystem::Get().GetKCPSessionId());
        local_98.region = ::UGameClientConnectionSubsystem::Get().GetCachedGateAddress();
        this.WriteGameplayFields(local_98);
        FECSWorldPtr local_112 = ECS::GetECSWorld();
        local_98.rtt_ds = UMiscBPExport::GetNetStatRTTMs(local_110);
        local_98.rtt_gs = UMiscBPExport::GetNetStatRTTMs(local_110);
        local_98.loss_packets = UMiscBPExport::GetNetStatMissCount(local_110);
        UGameDSConnectionSubsystem local_120 = ::UGameDSConnectionSubsystem::Get();
        if (local_120 != nullptr)
        {
            local_98.jitter_ms = local_120.GetKCPJitterMs();
            local_98.send_packets = local_120.GetKCPSendPackets();
        }
        UMiHoYoSDKHelper::EnqueueStructReport(100002, PERF_NAME_HEARTBEAT, FInstancedStruct::Make(local_98), this.GetLocalPlayerLevelStr());
        return;
    }
    void ReportShaderCompile() const
    {
        FPerfShaderCompileBody local_26;
        local_26.time = FDateTime::Now().ToString("%Y-%m-%d %H:%M:%S");
        local_26.uid = ::UGameClientConnectionSubsystem::Get().CachedLoginUserId;
        local_26.region = ::UGameClientConnectionSubsystem::Get().GetCachedGateAddress();
        local_26.client_version = ::UGameClientConnectionSubsystem::Get().GetClientVersion();
        local_26.game_version = ::UGameClientConnectionSubsystem::Get().GetClientVersion();
        FString local_38;
        if (FJsonObjectConverter::UStructToJsonObjectString(local_26, local_38, 0, 0, 0, false))
        {
            this.SendReport(100003, PERF_NAME_SHADER_COMPILE, local_38, true);
        }
        return;
    }
    void ReportLevelLoading() const
    {
        FPerfLevelLoadingBody local_18;
        local_18.time = FDateTime::Now().ToString("%Y-%m-%d %H:%M:%S");
        FString local_28;
        if (FJsonObjectConverter::UStructToJsonObjectString(local_18, local_28, 0, 0, 0, false))
        {
            this.SendReport(100005, PERF_NAME_LEVEL_LOADING, local_28, true);
        }
        return;
    }
    void ReportPSOHitch() const
    {
        FPerfPSOHitchBody local_24;
        local_24.time = FDateTime::Now().ToString("%Y-%m-%d %H:%M:%S");
        local_24.uid = ::UGameClientConnectionSubsystem::Get().CachedLoginUserId;
        local_24.region = ::UGameClientConnectionSubsystem::Get().GetCachedGateAddress();
        local_24.client_version = ::UGameClientConnectionSubsystem::Get().GetClientVersion();
        local_24.game_version = ::UGameClientConnectionSubsystem::Get().GetClientVersion();
        FString local_36;
        if (FJsonObjectConverter::UStructToJsonObjectString(local_24, local_36, 0, 0, 0, false))
        {
            this.SendReport(100004, PERF_NAME_PSO_HITCH, local_36, true);
        }
        return;
    }
    void RunSdkErrorCaptureTest() const
    {
        FString local_10 = FDateTime::Now().ToString("%Y-%m-%d %H:%M:%S");
        XLog(ELog(45), FString().Append("[SdkErrorTest] fire a batch of non-fatal errors at ").Append(local_10));
        XError(ELog(45), FString().Append("[SdkErrorTest] #1 XError fired at ").Append(local_10));
        XErrorTrace(ELog(45), FString().Append("[SdkErrorTest] #2 XErrorTrace fired at ").Append(local_10));
        return;
    }
    void RunSdkFatalCaptureTest() const
    {
        XError(ELog(45), FString().Append("[SdkFatalTest] triggering XCheck(false) fatal assert for SDK capture at ").Append(FDateTime::Now().ToString("%Y-%m-%d %H:%M:%S")));
        CVar_PerfReport_TestSdkFatal.SetInt(0);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_ReportDeviceInfo() const
    {
        ECS::GetContextJob();
        this.ClientJob_ReportDeviceInfo();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PerfHeartbeat() const
    {
        ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(15.0))))
        {
            return;
        }
        this.ClientJob_PerfHeartbeat();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PerfSample() const
    {
        ECS::GetContextJob();
        this.ClientJob_PerfSample();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PerfStream1s() const
    {
        ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(1.0))))
        {
            return;
        }
        this.ClientJob_PerfStream1s();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_PerfRuntime5s() const
    {
        ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(5.0))))
        {
            return;
        }
        this.ClientJob_PerfRuntime5s();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestSdkErrorCapture() const
    {
        ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(10.0))))
        {
            return;
        }
        this.ClientJob_TestSdkErrorCapture();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestSdkFatalCapture() const
    {
        ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(10.0))))
        {
            return;
        }
        this.ClientJob_TestSdkFatalCapture();
        return;
    }
}


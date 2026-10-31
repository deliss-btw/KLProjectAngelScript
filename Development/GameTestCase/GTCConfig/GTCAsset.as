struct FGTCImportRangeInfo
{
    UPROPERTY()
    float32 StartTimeOffset;
    UPROPERTY()
    float32 EndTimeOffset;

}

struct FFloatArray
{
    UPROPERTY()
    TArray<float32> Values;

    FFloatArray()
    {
        return;
    }
}

struct FGTCImportActionItem
{
    UPROPERTY()
    FGTCImportRangeInfo RangeInfo;
    UPROPERTY()
    TMap<FString, FFloatArray> Actions;

    FGTCImportActionItem()
    {
        return;
    }
}

struct FGTCImportActionDocument
{
    UPROPERTY()
    TArray<FGTCImportActionItem> Items;

    FGTCImportActionDocument()
    {
        return;
    }
}

struct FGTCAICommandInstanceJson
{
    UPROPERTY()
    int InstanceId;
    UPROPERTY()
    int Status;
    UPROPERTY()
    int CommandNodeId;
    UPROPERTY()
    float32 StartTime;
    UPROPERTY()
    float32 StopTime;
    UPROPERTY()
    bool bInstant;
    UPROPERTY()
    bool bManagedByService;
    UPROPERTY()
    FString CommandSource;
    UPROPERTY()
    FString InstanceDataType;
    UPROPERTY()
    FString InstanceText;

}

struct FGTCAICommandSnapshotJson
{
    UPROPERTY()
    float32 Time;
    UPROPERTY()
    int NextInstanceId;
    UPROPERTY()
    TArray<FGTCAICommandInstanceJson> InstanceList;

}

struct FGTCAICommandSnapshotDocument
{
    UPROPERTY()
    TArray<FGTCAICommandSnapshotJson> Snapshots;

    FGTCAICommandSnapshotDocument()
    {
        return;
    }
}

struct FGTCMonsterDataConfig
{
    UPROPERTY()
    FName TargetUniqueName;
    UPROPERTY()
    FName MonsterName;

    FGTCMonsterDataConfig()
    {
        return;
    }
}

struct FGTCCheckpointFrame
{
    UPROPERTY()
    FFPTime FrameTime;
    UPROPERTY()
    FVector Position;
    UPROPERTY()
    FRotator Rotation;
    UPROPERTY()
    FVector Velocity;
    UPROPERTY()
    FRotator AngularVelocity;
    UPROPERTY()
    TArray<FVector> ESMStates;
    UPROPERTY()
    FRotator DesiredRotation;
    UPROPERTY()
    float32 RelativeYaw = 0.0f;
    UPROPERTY()
    float32 SpeedScale = 1.0f;

}

struct FGTCSourceData
{
    UPROPERTY()
    FString Description;
    UPROPERTY()
    FString MapName;
    UPROPERTY()
    int LevelKey = 0;
    UPROPERTY()
    float32 CaseDuration = 2.0f;
    UPROPERTY()
    int GlobalRandomSeed = 0;
    UPROPERTY()
    int64 RecordWorldTimeTicks = 0;
    UPROPERTY()
    TArray<FGTCEntityConfig> EntityConfigs;
    UPROPERTY()
    TArray<FInstancedStruct> ActionConfigs;
    UPROPERTY()
    TArray<FInstancedStruct> ServerFixedInputConfigs;
    UPROPERTY()
    TArray<FInstancedStruct> ClientFixedInputConfigs;
    UPROPERTY()
    TArray<FInstancedStruct> SamplerConfigs;
    UPROPERTY()
    TArray<FGTCInitConfig> InitConfigs;
    UPROPERTY()
    TArray<FGTCCameraViewConfig> CameraViewConfigs;
    UPROPERTY()
    FName PlayerPawnUniqueName;
    UPROPERTY()
    FName SelectedRecordDataFolder;
    UPROPERTY()
    EGTCInputImportMode InputImportMode = EGTCInputImportMode(0);
    UPROPERTY()
    TArray<FGTCMonsterDataConfig> MonsterDataConfigEntries;
    UPROPERTY()
    TArray<FGTCCheckpointFrame> CheckpointFrames;
    UPROPERTY()
    TArray<FGTCCheckpointFrame> AutoCheckpointFrames;
    UPROPERTY()
    TArray<FDetailedData> DetailedDataLists;

    TArray<FName> GetRecordDataFolderOptions()
    {
        TArray<FName> local_4;
        TArray<FString> local_24 = KLAutomation::GetSubdirectoryNames(FPaths::CombinePaths(FPaths::ProjectContentDir(), "MoleRes/Test/TestCase/RecordData"));
        for (auto& local_40 : local_24)
        {
            local_4.Add(FName(local_40));
        }
        return local_4;
    }
    void ApplyInitTransform(const FString &inout SourceFullPath, const FString &inout JsonKey, const FName &inout EntityUniqueName)
    {
        FString local_4 = SourceFullPath;
        if (local_4.Contains("_client_input_raw_data.json", ESearchCase(1), ESearchDir(0)))
        {
            local_4 = local_4.Replace("_client_input_raw_data.json", "_init_transform_info.json", ESearchCase(1));
        }
        else
        {
            if (local_4.Contains("_raw_client_data.json", ESearchCase(1), ESearchDir(0)))
            {
                local_4 = local_4.Replace("_raw_client_data.json", "_init_transform_info.json", ESearchCase(1));
            }
            else
            {
                if (local_4.Contains("_Monster_AI_Server.json", ESearchCase(1), ESearchDir(0)))
                {
                    local_4 = local_4.Replace("_Monster_AI_Server.json", "_init_transform_info.json", ESearchCase(1));
                }
                else
                {
                    return;
                }
            }
        }
        if (!(FPaths::FileExists(local_4)))
        {
            return;
        }
        FString local_16;
        if (!(FFileHelper::LoadFileToString(local_16, local_4, FFileHelper::EHashOptions(0), 0)))
        {
            return;
        }
        FJsonObject local_22;
        if (!(local_22.LoadFromString(local_16)))
        {
            return;
        }
        FJsonObject local_26;
        if (!(local_22.TryGetObjectField(JsonKey, local_26)))
        {
            return;
        }
        int local_27 = 0;
        for (; local_27 < this.EntityConfigs.Num(); ++local_27)
        {
            if ((FName(this.EntityConfigs[local_27].UniqueName) == EntityUniqueName))
            {
                FJsonObject local_36;
                if (local_26.TryGetObjectField("Position", local_36))
                {
                    float local_38 = 0.0;
                    float local_42 = 0.0;
                    float local_44 = 0.0;
                    local_36.TryGetNumberField("X", local_38);
                    local_36.TryGetNumberField("Y", local_42);
                    local_36.TryGetNumberField("Z", local_44);
                    this.EntityConfigs[local_27].InitTransform.SetLocation(FVector(local_38, local_42, local_44));
                }
                FJsonObject local_54;
                if (local_26.TryGetObjectField("Rotation", local_54))
                {
                    float local_38_2 = 0.0;
                    float local_42_2 = 0.0;
                    float local_44_2 = 0.0;
                    float local_56 = 1.0;
                    local_54.TryGetNumberField("X", local_38_2);
                    local_54.TryGetNumberField("Y", local_42_2);
                    local_54.TryGetNumberField("Z", local_44_2);
                    local_54.TryGetNumberField("W", local_56);
                    this.EntityConfigs[local_27].InitTransform.SetRotation(FQuat(local_38_2, local_42_2, local_44_2, local_56));
                }
                break;
            }
        }
        return;
    }
    FString TryResolveMonsterPrefabPath(const FName &inout MonsterName)
    {
        FString local_8 = MonsterName.ToString();
        int local_13 = local_8.Find("Prefab_Monster_", ESearchCase(1), ESearchDir(0), -1);
        if (local_13 == INDEX_NONE)
        {
            return "";
        }
        int local_9 = local_8.Find("_C", ESearchCase(0), ESearchDir(0), local_13);
        FString local_28 = local_9 != INDEX_NONE ? local_8.Mid(local_13, local_9 - local_13) : local_8.Mid(local_13, 2147483647);
        return ((((FString("/Game/MoleRes/Dev/Prefab/Monster/") + local_28) + ".") + local_28) + "_C");
    }
    void PopulateMonsterDataConfigFromInitTransform(const FString &inout SourceFullPath)
    {
        FString local_4 = SourceFullPath;
        if (local_4.Contains("_client_input_raw_data.json", ESearchCase(1), ESearchDir(0)))
        {
            local_4 = local_4.Replace("_client_input_raw_data.json", "_init_transform_info.json", ESearchCase(1));
        }
        else
        {
            if (local_4.Contains("_raw_client_data.json", ESearchCase(1), ESearchDir(0)))
            {
                local_4 = local_4.Replace("_raw_client_data.json", "_init_transform_info.json", ESearchCase(1));
            }
            else
            {
                if (local_4.Contains("_Monster_AI_Server.json", ESearchCase(1), ESearchDir(0)))
                {
                    local_4 = local_4.Replace("_Monster_AI_Server.json", "_init_transform_info.json", ESearchCase(1));
                }
                else
                {
                    return;
                }
            }
        }
        if (!(FPaths::FileExists(local_4)))
        {
            return;
        }
        FString local_16;
        if (!(FFileHelper::LoadFileToString(local_16, local_4, FFileHelper::EHashOptions(0), 0)))
        {
            return;
        }
        this.MonsterDataConfigEntries.Empty(0);
        int local_20 = 0;
        int local_21 = 0;
        while (local_21 < local_16.Len())
        {
            FString local_12 = local_16.Mid(local_21, 1);
            if ((local_12 == "{"))
            {
                ++local_20;
            }
            else
            {
                if ((local_12 == "}"))
                {
                    --local_20;
                }
                else
                {
                    if (local_20 == 1 && (local_12 == "\""))
                    {
                        int local_29 = local_16.Find("\"", ESearchCase(0), ESearchDir(0), local_21 + 1);
                        if (local_29 == INDEX_NONE)
                        {
                            break;
                        }
                        FString local_26 = local_16.Mid(local_21 + 1, ((local_29 - local_21) - 1));
                        int local_28 = local_29 + 1;
                        while (local_28 < local_16.Len() && (local_16.Mid(local_28, 1) == " "))
                        {
                            ++local_28;
                        }
                        if (local_28 < local_16.Len() && (local_16.Mid(local_28, 1) == ":"))
                        {
                            if (!((local_26 == "PawnPlayer")))
                            {
                                FGTCMonsterDataConfig local_40;
                                FName local_42;
                                local_40.TargetUniqueName = local_42;
                                local_42 = FName(local_26);
                                local_40.MonsterName = local_42;
                                this.MonsterDataConfigEntries.Add(local_40);
                            }
                        }
                        local_21 = local_29;
                    }
                }
            }
            ++local_21;
        }
        return;
    }
    void ImportMonsterAICommands()
    {
        return;
    }
    FName GetPlayerPawnUniqueName() const
    {
        for (auto& local_16 : this.EntityConfigs)
        {
            if (local_16.bUsePlayerPawn)
            {
                return local_16.UniqueName;
            }
        }
        return FName();
    }
    void ImportCaseConfig()
    {
        int local_30;
        this.EnsurePawnPlayerEntityAndSampler();
        if (this.SelectedRecordDataFolder.IsNone())
        {
            XError(ELog(40), FString().Append("请先在「原始数据选择」中选择 RecordData 下的 Case 目录"));
            return;
        }
        FString local_12 = FPaths::CombinePaths(FPaths::CombinePaths(FPaths::ProjectContentDir(), "MoleRes/Test/TestCase/RecordData"), this.SelectedRecordDataFolder.ToString());
        if (!(FPaths::DirectoryExists(local_12)))
        {
            XError(ELog(40), FString().Append("目录不存在: ").Append(local_12));
            return;
        }
        FString local_20 = (this.SelectedRecordDataFolder.ToString() + "_client_input_raw_data.json");
        FString local_6 = FPaths::CombinePaths(local_12, local_20);
        if (!(FPaths::FileExists(local_6)))
        {
            XError(ELog(40), FString().Append("目录下未找到 ").Append(local_20).Append(" 文件: ").Append(local_12));
            return;
        }
        if (int(this.InputImportMode) == 0)
        {
            this.ImportPlayerPawnActionFromPath(local_6);
        }
        else
        {
            FString local_28 = (this.SelectedRecordDataFolder.ToString() + "_Server_fixed_input_data.json");
            FString local_24 = FPaths::CombinePaths(local_12, local_28);
            FString local_40 = (this.SelectedRecordDataFolder.ToString() + "_Client_fixed_input_data.json");
            FString local_36 = FPaths::CombinePaths(local_12, local_40);
            if (!(FPaths::FileExists(local_24)))
            {
                XError(ELog(40), FString().Append("FixedInput file not found: ").Append(local_28));
                return;
            }
            if (!(FPaths::FileExists(local_36)))
            {
                XError(ELog(40), FString().Append("FixedInput file not found: ").Append(local_40));
                return;
            }
            this.ImportFixedInputData(local_24, local_36, local_6);
        }
        FString local_48 = (this.SelectedRecordDataFolder.ToString() + "_sampler_camera_data.json");
        FString local_36_2 = FPaths::CombinePaths(local_12, local_48);
        if (FPaths::FileExists(local_36_2))
        {
            this.ImportCameraData(local_36_2, local_6);
        }
        FString local_44 = (this.SelectedRecordDataFolder.ToString() + "_sampler_server_data.json");
        FString local_40_2 = FPaths::CombinePaths(local_12, local_44);
        if (FPaths::FileExists(local_40_2))
        {
            FString local_52;
            if (FFileHelper::LoadFileToString(local_52, local_40_2, FFileHelper::EHashOptions(0), 0))
            {
                FJsonObject local_58;
                if (local_58.LoadFromString(local_52))
                {
                    FString local_62;
                    int local_63 = 0;
                    int local_64 = 0;
                    while (local_64 < local_52.Len())
                    {
                        FString local_24_2 = local_52.Mid(local_64, 1);
                        if ((local_24_2 == "\""))
                        {
                            local_30 = 1;
                            int local_31 = local_64 + local_30;
                            local_30 = local_52.Find("\"", ESearchCase(0), ESearchDir(0), local_31);
                            local_31 = INDEX_NONE;
                            while (local_30 != local_31 && (local_52.Mid((local_30 - 1), 1) == "\\"))
                            {
                                local_30 = local_52.Find("\"", ESearchCase(0), ESearchDir(0), local_30 + 1);
                            }
                            if (local_30 != INDEX_NONE)
                            {
                                if (local_63 == 1)
                                {
                                    FString local_28_2 = local_52.Mid(local_64 + 1, (local_30 - local_64) - 1);
                                    if (local_28_2.StartsWith("Pawn_", ESearchCase(1)))
                                    {
                                        local_62 = local_28_2;
                                        break;
                                    }
                                }
                                local_64 = local_30;
                            }
                        }
                        else
                        {
                            if ((local_24_2 == "{") || (local_24_2 == "["))
                            {
                                ++local_63;
                            }
                            else
                            {
                                if ((local_24_2 == "}") || (local_24_2 == "]"))
                                {
                                    --local_63;
                                }
                            }
                        }
                        ++local_64;
                    }
                    FJsonArray local_82;
                    if (!(local_62.IsEmpty()) && local_58.TryGetArrayField(local_62, local_82) && (local_82.Num() > 0))
                    {
                        FJsonValue local_90 = local_82.GetValueAt(0);
                        FJsonObject local_94;
                        if (local_90.TryGetObject(local_94))
                        {
                            FGTCStateRecord local_120;
                            if (FJsonObjectConverter::JsonObjectStringToUStruct(local_94.SaveToString(false), local_120, 0, 0) && (local_120.EsmStateRecords.Num() > 0))
                            {
                                FName local_124 = this.GetPlayerPawnUniqueName();
                                local_30 = 0;
                                for (; local_30 < this.EntityConfigs.Num(); ++local_30)
                                {
                                    if ((FName(this.EntityConfigs[local_30].UniqueName) == local_124))
                                    {
                                        this.EntityConfigs[local_30].InitState = FName(local_120.EsmStateRecords[0].StateName);
                                        this.EntityConfigs[local_30].InitStateTime = int(local_120.EsmStateRecords[0].StateTime);
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return;
    }
    void ResetConfig()
    {
        this.CaseDuration = 0.0f;
        this.EntityConfigs.Empty(0);
        this.ActionConfigs.Empty(0);
        this.ServerFixedInputConfigs.Empty(0);
        this.ClientFixedInputConfigs.Empty(0);
        this.SamplerConfigs.Empty(0);
        this.InitConfigs.Empty(0);
        this.CameraViewConfigs.Empty(0);
        this.MonsterDataConfigEntries.Empty(0);
        this.CheckpointFrames.Empty(0);
        this.DetailedDataLists.Empty(0);
        return;
    }
    void EnsurePawnPlayerEntityAndSampler()
    {
        FName local_2(n"PawnPlayer");
        FString local_8 = "/Game/MoleRes/Dev/Prefab/Avatar/Prefab_Avatar_Player.Prefab_Avatar_Player_C";
        bool local_9 = false;
        for (auto& local_24 : this.EntityConfigs)
        {
            if ((local_24.UniqueName == local_2))
            {
                local_9 = true;
                break;
            }
        }
        if (!(local_9))
        {
            FGTCEntityConfig local_84;
            local_84.UniqueName = local_2;
            local_84.bUsePlayerPawn = true;
            local_84.PrefabToSpawn = TSoftClassPtr<AECSPrefab>(FSoftClassPath(local_8));
            this.EntityConfigs.Add(local_84);
        }
        this.EnsureSamplerConfigsByEntityConfigs();
        return;
    }
    void ImportPlayerPawnActionFromPath(const FString &inout InputFullPath)
    {
        float32 local_60;
        float32 local_131;
        float32 local_133;
        this.PlayerPawnUniqueName = this.GetPlayerPawnUniqueName();
        if (this.PlayerPawnUniqueName.IsNone())
        {
            XError(ELog(40), FString().Append("PlayerPawnUniqueName is none, please set bUsePlayerPawn=true for at least one entity in EntityConfigs"));
            return;
        }
        this.ApplyInitTransform(InputFullPath, "PawnPlayer", this.PlayerPawnUniqueName);
        this.PopulateMonsterDataConfigFromInitTransform(InputFullPath);
        FString local_8 = InputFullPath.Replace("_client_input_raw_data.json", "_client_input_std_data.json", ESearchCase(1));
        if ((local_8 == InputFullPath))
        {
            FString local_14 = FString();
            XError(ELog(40), local_14.Append("Failed to generate OutputPath. Input file must end with '_client_input_raw_data.json': ").Append(InputFullPath));
            return;
        }
        FString local_24 = FPaths::CombinePaths(FPaths::ProjectContentDir(), "MoleRes/Test/TestCase/RecordData");
        FString local_14_2 = FPaths::CombinePaths(local_24, "GTCRecordDataConverter.py");
        FString local_32 = FString().Append("py \"").Append(local_14_2).Append("\" \"").Append(InputFullPath).Append("\" \"").Append(local_8).Append("\"");
        System::ExecuteConsoleCommand(__GetWorldContext(), local_32, nullptr);
        FString local_38;
        if (!(FFileHelper::LoadFileToString(local_38, local_8, FFileHelper::EHashOptions(0), 0)))
        {
            XLog(ELog(40), FString().Append("Failed to load file: ").Append(local_8));
            return;
        }
        bool local_41 = false;
        int local_45 = local_38.Find("[", ESearchCase(1), ESearchDir(0), -1);
        int local_42 = local_38.Find("{", ESearchCase(1), ESearchDir(0), -1);
        if (local_45 != INDEX_NONE)
        {
            if (local_42 == INDEX_NONE || (local_45 < local_42))
            {
                local_41 = true;
            }
        }
        FGTCImportActionDocument local_52;
        bool local_53 = false;
        if (local_41)
        {
            FString local_28 = ((FString("{\"Items\": ") + local_38) + "}");
            local_53 = FJsonObjectConverter::JsonObjectStringToUStruct(local_28, local_52, 0, 0);
        }
        else
        {
            local_53 = FJsonObjectConverter::JsonObjectStringToUStruct(local_38, local_52, 0, 0);
        }
        if (!(local_53) || (local_52.Items.Num() == 0))
        {
            XLog(ELog(40), FString().Append("Failed to parse JSON content from: ").Append(local_8));
            return;
        }
        this.ActionConfigs.Empty(0);
        float32 local_59 = 0.0f;
        for (auto& local_74 : local_52.Items)
        {
            TArray<FString> local_78;
            local_74.Actions.GetKeys(local_78);
            local_60 = local_74.RangeInfo.EndTimeOffset;
            if (local_60 > local_59)
            {
                local_59 = local_74.RangeInfo.EndTimeOffset;
            }
            for (auto& local_92 : local_78)
            {
                if (local_92.StartsWith("CharacterMove", ESearchCase(1)) && !((local_92 == "CharacterMove")))
                {
                    continue;
                }
                FGTCInputAction local_110;
                local_110.StartTime = FFPTime(local_74.RangeInfo.StartTimeOffset);
                local_60 = local_74.RangeInfo.EndTimeOffset;
                local_110.EndTime = FFPTime(local_60);
                local_110.bIsLocalInput = true;
                local_110.TargetUniqueName = this.PlayerPawnUniqueName;
                FSimulatedInput local_126;
                local_126.Name = FName(local_92);
                TArray<float32> local_130 = local_74.Actions[local_92].Values;
                if (local_130.Num() > 0)
                {
                    local_60 = local_130[0];
                }
                else
                {
                    local_60 = 0.0f;
                }
                if (local_130.Num() > 1)
                {
                    local_131 = local_130[1];
                }
                else
                {
                    local_131 = 0.0f;
                }
                if (local_130.Num() > 2)
                {
                    local_133 = local_130[2];
                }
                else
                {
                    local_133 = 0.0f;
                }
                local_126.Value = FVector(local_60, local_131, local_133);
                local_110.InputGroup.Add(local_126);
                this.ActionConfigs.Add(FInstancedStruct::Make(local_110));
            }
        }
        this.CaseDuration = local_59 + 5.0f;
        this.EnsureSamplerConfigsByEntityConfigs();
        int local_149 = 0;
        for (; local_149 < this.SamplerConfigs.Num(); ++local_149)
        {
            if (!((FInstancedStruct::GetMutablePtr(this.SamplerConfigs[local_149]).opCall() == nullptr)))
            {
                FFPTime local_114 = FFPTime(this.CaseDuration);
            }
        }
        return;
    }
    bool ParseFixedInputJson(const FString &inout FilePath, TArray<FInstancedStruct> &inout OutActions, float32 &inout OutMaxTime, const bool bExtractCheckpoints = false)
    {
        bool local_103;
        FString local_4;
        if (!(FFileHelper::LoadFileToString(local_4, FilePath, FFileHelper::EHashOptions(0), 0)))
        {
            XError(ELog(40), FString().Append("Failed to load: ").Append(FilePath));
            return false;
        }
        FString local_12 = ((FString("{\"Frames\": ") + local_4) + "}");
        FJsonObject local_26;
        if (!(local_26.LoadFromString(local_12)))
        {
            XError(ELog(40), FString().Append("Failed to parse JSON: ").Append(FilePath));
            return false;
        }
        FJsonArray local_30;
        if (!(local_26.TryGetArrayField("Frames", local_30)) || (local_30.Num() == 0))
        {
            XError(ELog(40), FString().Append("Empty or missing frames array: ").Append(FilePath));
            return false;
        }
        float32 local_34 = 0.0f;
        FJsonValue local_44 = local_30.GetValueAt(0);
        FJsonObject local_48;
        if (local_44.TryGetObject(local_48))
        {
            float local_50 = 0.0;
            local_48.TryGetNumberField("FrameTime", local_50);
            local_34 = float32(local_50);
        }
        OutActions.Empty(0);
        OutMaxTime = 0.0f;
        int local_53 = 0;
        if (bExtractCheckpoints)
        {
            this.CheckpointFrames.Empty(0);
        }
        int local_54 = 0;
        for (; local_54 < local_30.Num(); ++local_54)
        {
            FJsonValue local_40 = local_30.GetValueAt(local_54);
            if (!(local_40.TryGetObject(local_48)))
            {
                continue;
            }
            float local_50_2 = 0.0;
            local_48.TryGetNumberField("FrameTime", local_50_2);
            float32 local_35_2 = float32(local_50_2);
            float32 local_55 = local_35_2 - local_34;
            ++local_53;
            FJsonArray local_60;
            if (!(local_48.TryGetArrayField("InputDatas", local_60)))
            {
                continue;
            }
            TArray<FSimulatedInput> local_64;
            FGTCCheckpointFrame local_102;
            local_103 = false;
            int local_104 = 0;
            for (; local_104 < local_60.Num(); ++local_104)
            {
                FJsonValue local_44_2 = local_60.GetValueAt(local_104);
                FJsonObject local_114;
                if (!(local_44_2.TryGetObject(local_114)))
                {
                    continue;
                }
                FString local_118;
                if (!(local_114.TryGetStringField("Name", local_118)))
                {
                    continue;
                }
                if (local_118.StartsWith("CharacterMove", ESearchCase(1)) && !((local_118 == "CharacterMove")))
                {
                    continue;
                }
                float local_122 = 0.0;
                local_114.TryGetNumberField("Time", local_122);
                FJsonArray local_126;
                float32 local_127 = 0.0f;
                float32 local_128 = 0.0f;
                float32 local_129 = 0.0f;
                if (local_114.TryGetArrayField("Value", local_126))
                {
                    float local_132 = 0.0;
                    if (local_126.Num() > 0)
                    {
                        local_126.GetValueAt(0).TryGetNumber(local_132);
                        local_127 = float32(local_132);
                    }
                    if (local_126.Num() > 1)
                    {
                        local_126.GetValueAt(1).TryGetNumber(local_132);
                        local_128 = float32(local_132);
                    }
                    if (local_126.Num() > 2)
                    {
                        local_126.GetValueAt(2).TryGetNumber(local_132);
                        local_129 = float32(local_132);
                    }
                }
                if (bExtractCheckpoints && local_118.StartsWith("__GTC_CP_", ESearchCase(1)))
                {
                    if ((local_118 == "__GTC_CP_POS__"))
                    {
                        local_102.Position = FVector(local_127, local_128, local_129);
                        local_103 = true;
                    }
                    else
                    {
                        if ((local_118 == "__GTC_CP_ROT__"))
                        {
                            local_102.Rotation = FRotator(local_127, local_128, local_129);
                        }
                        else
                        {
                            if ((local_118 == "__GTC_CP_VEL__"))
                            {
                                local_102.Velocity = FVector(local_127, local_128, local_129);
                            }
                            else
                            {
                                if ((local_118 == "__GTC_CP_ANGVEL__"))
                                {
                                    local_102.AngularVelocity = FRotator(local_127, local_128, local_129);
                                }
                                else
                                {
                                    if ((local_118 == "__GTC_CP_DESROT__"))
                                    {
                                        local_102.DesiredRotation = FRotator(local_127, local_128, local_129);
                                    }
                                    else
                                    {
                                        if ((local_118 == "__GTC_CP_MOVCTRL__"))
                                        {
                                            local_102.RelativeYaw = local_127;
                                            local_102.SpeedScale = local_128;
                                        }
                                        else
                                        {
                                            if (local_118.StartsWith("__GTC_CP_ESM_", ESearchCase(1)))
                                            {
                                                local_102.ESMStates.Add(FVector(local_127, local_128, local_129));
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    continue;
                }
                if (local_118.StartsWith("__GTC_ESM_", ESearchCase(1)) || local_118.StartsWith("__GTC_CP_", ESearchCase(1)))
                {
                    continue;
                }
                FSimulatedInput local_160;
                local_160.Name = FName(local_118);
                local_160.Value = FVector(local_127, local_128, local_129);
                local_160.TimeOffset = (float32(local_122) - local_35_2);
                local_64.Add(local_160);
            }
            if (bExtractCheckpoints && local_103)
            {
                local_102.FrameTime = FFPTime(local_55);
                this.CheckpointFrames.Add(local_102);
            }
            if (local_64.Num() == 0)
            {
                continue;
            }
            FGTCFixedInputAction local_180;
            local_180.InputGroup = local_64;
            local_180.StartTime = FFPTime(local_55);
            local_180.EndTime = FFPTime(local_55);
            local_180.TargetUniqueName = this.PlayerPawnUniqueName;
            OutActions.Add(FInstancedStruct::Make(local_180));
            if (local_55 > OutMaxTime)
            {
                OutMaxTime = local_55;
            }
        }
        return true;
    }
    void ImportFixedInputData(const FString &inout ServerFixedPath, const FString &inout ClientFixedPath, const FString &inout RawDataPath)
    {
        this.PlayerPawnUniqueName = this.GetPlayerPawnUniqueName();
        if (this.PlayerPawnUniqueName.IsNone())
        {
            XError(ELog(40), FString().Append("PlayerPawnUniqueName is none"));
            return;
        }
        this.ApplyInitTransform(RawDataPath, "PawnPlayer", this.PlayerPawnUniqueName);
        this.PopulateMonsterDataConfigFromInitTransform(RawDataPath);
        float32 local_10 = 0.0f;
        float32 local_12 = 0.0f;
        if (!(this.ParseFixedInputJson(ServerFixedPath, this.ServerFixedInputConfigs, local_10, true)))
        {
            return;
        }
        if (!(this.ParseFixedInputJson(ClientFixedPath, this.ClientFixedInputConfigs, local_12, false)))
        {
            return;
        }
        this.CaseDuration = ((FMath::Max(local_10, local_12)) + 5.0f);
        this.EnsureSamplerConfigsByEntityConfigs();
        int local_15 = 0;
        for (; local_15 < this.SamplerConfigs.Num(); ++local_15)
        {
            if ((!((FInstancedStruct::GetMutablePtr(this.SamplerConfigs[local_15]).opCall() == nullptr))))
            {
                FFPTime local_28 = FFPTime(this.CaseDuration);
            }
        }
        return;
    }
    void ImportCameraData(const FString &inout CameraDataPath, const FString &inout RawDataPath)
    {
        bool local_77;
        TArray<float32> local_4;
        TArray<bool> local_8;
        FString local_36;
        if (FPaths::FileExists(RawDataPath))
        {
            FString local_14;
            if (FFileHelper::LoadFileToString(local_14, RawDataPath, FFileHelper::EHashOptions(0), 0))
            {
                FJsonObject local_20;
                if (local_20.LoadFromString(local_14))
                {
                    TArray<FString> local_24;
                    int local_25 = 0;
                    int local_27 = 0;
                    while (local_27 < local_14.Len())
                    {
                        local_36 = local_14.Mid(local_27, 1);
                        if ((local_36 == "{") || (local_36 == "["))
                        {
                            ++local_25;
                        }
                        else
                        {
                            if ((local_36 == "}") || (local_36 == "]"))
                            {
                                --local_25;
                            }
                            else
                            {
                                if (local_25 == 1 && (local_36 == "\""))
                                {
                                    int local_41 = local_14.Find("\"", ESearchCase(0), ESearchDir(0), local_27 + 1);
                                    if (local_41 != INDEX_NONE)
                                    {
                                        local_24.Add(local_14.Mid(local_27 + 1, ((local_41 - local_27) - 1)));
                                        local_27 = local_41;
                                    }
                                }
                            }
                        }
                        ++local_27;
                    }
                    for (auto& local_56 : local_24)
                    {
                        FJsonArray local_60;
                        if (!(local_20.TryGetArrayField(local_56, local_60)))
                        {
                            continue;
                        }
                        int local_41_2 = 0;
                        for (; local_41_2 < local_60.Num(); ++local_41_2)
                        {
                            FJsonValue local_68 = local_60.GetValueAt(local_41_2);
                            FJsonObject local_72;
                            if (!(local_68.TryGetObject(local_72)))
                            {
                                continue;
                            }
                            float local_74 = 0.0;
                            if (local_72.HasField("TimeOffset"))
                            {
                                local_72.TryGetNumberField("TimeOffset", local_74);
                            }
                            local_77 = true;
                            local_72.TryGetBoolField("ForceUpdateView", local_77);
                            local_4.Add(float32(local_74));
                            local_8.Add(local_77);
                        }
                    }
                    int local_41_3 = 0;
                    for (; local_41_3 < (local_4.Num() - 1); ++local_41_3)
                    {
                        int local_26_2 = local_41_3 + 1;
                        for (; local_26_2 < local_4.Num(); ++local_26_2)
                        {
                            float32 local_78 = local_4[local_26_2];
                            float32 local_81 = local_4[local_41_3];
                            if (local_78 < local_81)
                            {
                                local_81 = local_4[local_41_3];
                                local_4[local_41_3] = local_4[local_26_2];
                                local_4[local_26_2] = local_81;
                                local_77 = local_8[local_41_3];
                                local_8[local_41_3] = local_8[local_26_2];
                                local_8[local_26_2] = local_77;
                            }
                        }
                    }
                }
            }
        }
        if (!(FFileHelper::LoadFileToString(local_36, CameraDataPath, FFileHelper::EHashOptions(0), 0)))
        {
            return;
        }
        FString local_32 = ((FString("{\"Items\": ") + local_36) + "}");
        FJsonObject local_20;
        if (!(local_20.LoadFromString(local_32)))
        {
            return;
        }
        FJsonArray local_60;
        if (!(local_20.TryGetArrayField("Items", local_60)) || (local_60.Num() == 0))
        {
            return;
        }
        int64 local_88 = 0;
        int local_25_2 = 0;
        for (; local_25_2 < local_60.Num(); ++local_25_2)
        {
            FJsonValue local_64 = local_60.GetValueAt(local_25_2);
            FJsonObject local_72;
            if (!(local_64.TryGetObject(local_72)))
            {
                continue;
            }
            FVector local_100;
            FJsonObject local_94;
            if (!(local_72.TryGetObjectField("TimeStamp", local_94)))
            {
                continue;
            }
            float local_74_2 = 0.0;
            local_94.TryGetNumberField("TimeTicks", local_74_2);
            if (local_25_2 == 0 || (int64(local_74_2) < local_88))
            {
                local_88 = int64(local_74_2);
            }
        }
        int local_26_3 = 0;
        for (; local_26_3 < local_60.Num(); ++local_26_3)
        {
            FJsonValue local_68_2 = local_60.GetValueAt(local_26_3);
            FJsonObject local_72;
            if (!(local_68_2.TryGetObject(local_72)))
            {
                continue;
            }
            FJsonObject local_94;
            if (local_72.TryGetObjectField("CamPosition", local_94))
            {
                float local_74_3 = 0.0;
                float local_102 = 0.0;
                float local_104 = 0.0;
                local_94.TryGetNumberField("X", local_74_3);
                local_94.TryGetNumberField("Y", local_102);
                local_94.TryGetNumberField("Z", local_104);
                local_100 = FVector(local_74_3, local_102, local_104);
            }
            FRotator local_116;
            FJsonObject local_120;
            if (local_72.TryGetObjectField("CamRotation", local_120))
            {
                float local_74_4 = 0.0;
                float local_102_2 = 0.0;
                float local_104_2 = 0.0;
                local_120.TryGetNumberField("X", local_74_4);
                local_120.TryGetNumberField("Y", local_102_2);
                local_120.TryGetNumberField("Z", local_104_2);
                local_116 = FRotator(local_74_4, local_102_2, local_104_2);
            }
            FGTCCameraInitTransformConfig local_138;
            local_138.Position = local_100;
            local_138.Rotation = local_116;
            FGTCInitConfig local_204;
            local_204.CameraInitTransform = local_138;
            this.InitConfigs.Add(local_204);
            break;
        }
        this.CameraViewConfigs.Empty(0);
        local_25_2 = 0;
        local_26_3 = 0;
        for (; local_26_3 < local_60.Num(); ++local_26_3)
        {
            FJsonValue local_64_2 = local_60.GetValueAt(local_26_3);
            FJsonObject local_72;
            if (!(local_64_2.TryGetObject(local_72)))
            {
                continue;
            }
            float local_74_5 = 0.0;
            FJsonObject local_94;
            if (local_72.TryGetObjectField("TimeStamp", local_94))
            {
                local_94.TryGetNumberField("TimeTicks", local_74_5);
            }
            float32 local_81_2 = (int64(local_74_5) - local_88) / 10000000.0f;
            if (local_4.Num() > 0)
            {
                while (local_25_2 < (local_4.Num() - 1) && (local_4[(local_25_2 + 1)] <= local_81_2))
                {
                    ++local_25_2;
                }
                if (local_25_2 < local_8.Num() && !(local_8[local_25_2]))
                {
                    continue;
                }
            }
            FVector local_100;
            FJsonObject local_120;
            if (local_72.TryGetObjectField("CamPosition", local_120))
            {
                float local_104_3 = 0.0;
                float local_102_3 = 0.0;
                float local_206 = 0.0;
                local_120.TryGetNumberField("X", local_104_3);
                local_120.TryGetNumberField("Y", local_102_3);
                local_120.TryGetNumberField("Z", local_206);
                local_100 = FVector(local_104_3, local_102_3, local_206);
            }
            FRotator local_116;
            FJsonObject local_210;
            if (local_72.TryGetObjectField("CamRotation", local_210))
            {
                float local_102_4 = 0.0;
                float local_206_2 = 0.0;
                float local_104_4 = 0.0;
                local_210.TryGetNumberField("X", local_102_4);
                local_210.TryGetNumberField("Y", local_206_2);
                local_210.TryGetNumberField("Z", local_104_4);
                local_116 = FRotator(local_102_4, local_206_2, local_104_4);
            }
            float local_104_5 = 75.0;
            local_72.TryGetNumberField("CamFov", local_104_5);
            if (this.CameraViewConfigs.Num() > 0)
            {
                FGTCCameraViewConfig& local_212 = this.CameraViewConfigs.Last(0);
                if (local_212.Position.Equals(local_100, 9.999999747378752e-5) && local_212.Rotation.Equals(local_116, 9.999999747378752e-5) && FMath::IsNearlyEqual(local_212.FOV, float32(local_104_5), 1e-8f))
                {
                    continue;
                }
            }
            FGTCCameraViewConfig local_230;
            local_230.Time = local_81_2;
            local_230.Position = local_100;
            local_230.Rotation = local_116;
            local_230.FOV = float32(local_104_5);
            this.CameraViewConfigs.Add(local_230);
        }
        return;
    }
    void EnsureSamplerConfigsByEntityConfigs()
    {
        bool local_3 = false;
        if (this.EntityConfigs.Num() == 0)
        {
            return;
        }
        while (this.SamplerConfigs.Num() < this.EntityConfigs.Num())
        {
            FGTCESMStateSampler local_66;
            local_66.TargetUniqueName = this.EntityConfigs[this.SamplerConfigs.Num()].UniqueName;
            local_66.StartTime = FFPTime(0);
            local_66.EndTime = FFPTime(this.CaseDuration);
            local_66.TargetAnimLayer = "MainLayer";
            local_3 = false;
            local_66.bNeedValidation = local_3;
            this.SamplerConfigs.Add(FInstancedStruct::Make(local_66));
        }
        int local_2 = 0;
        while (local_3)
        {
            if ((!((FInstancedStruct::GetMutablePtr(this.SamplerConfigs[local_2]).opCall() == nullptr))))
            {
                int local_67 = local_2 + 1;
            }
            ++local_2;
            if (local_2 >= this.SamplerConfigs.Num())
            {
                local_3 = false;
                continue;
            }
            local_3 = (local_2 < this.EntityConfigs.Num());
        }
        if (this.SamplerConfigs.Num() > this.EntityConfigs.Num())
        {
            this.SamplerConfigs.SetNum(this.EntityConfigs.Num());
        }
        return;
    }
    bool LoadFromJsonFile(const FString &inout JsonPath)
    {
        FString local_4;
        if (!(FFileHelper::LoadFileToString(local_4, JsonPath, FFileHelper::EHashOptions(0), 0)))
        {
            PrintError(FString().Append("[FGTCSourceData] Failed to load JSON: ").Append(JsonPath), 8.0f, FLinearColor::Red);
            return false;
        }
        float32 local_15 = FBlueprintDebugFunctions::ExchangeMaxScriptExecutionTime(60.0f);
        FJsonObjectConverter::JsonObjectStringToUStruct(local_4, this, 0, 0);
        this.ActionConfigs.Empty(0);
        this.ServerFixedInputConfigs.Empty(0);
        this.ClientFixedInputConfigs.Empty(0);
        this.SamplerConfigs.Empty(0);
        FJsonObject local_22;
        if (local_22.LoadFromString(local_4))
        {
            this.ParseActionArrayFromJson(local_22, "ActionConfigs", this.ActionConfigs);
            this.ParseActionArrayFromJson(local_22, "ServerFixedInputConfigs", this.ServerFixedInputConfigs);
            this.ParseActionArrayFromJson(local_22, "ClientFixedInputConfigs", this.ClientFixedInputConfigs);
            this.ParseActionArrayFromJson(local_22, "SamplerConfigs", this.SamplerConfigs);
            FJsonArray local_26;
            if (local_22.TryGetArrayField("EntityConfigs", local_26))
            {
                this.EntityConfigs.Empty(0);
                int local_27 = 0;
                for (; local_27 < local_26.Num(); ++local_27)
                {
                    FJsonValue local_36 = local_26.GetValueAt(local_27);
                    FJsonObject local_40;
                    if (!(local_36.TryGetObject(local_40)))
                    {
                        continue;
                    }
                    FGTCEntityConfig local_96;
                    FJsonObjectConverter::JsonObjectStringToUStruct(local_40.SaveToString(false), local_96, 0, 0);
                    this.EntityConfigs.Add(local_96);
                }
            }
        }
        FBlueprintDebugFunctions::ExchangeMaxScriptExecutionTime(local_15);
        return true;
    }
    void ParseInputGroupFromJson(FJsonObject &inout ActObj, TArray<FSimulatedInput> &inout OutGroup)
    {
        FJsonArray local_4;
        if (!(ActObj.TryGetArrayField("InputGroup", local_4)))
        {
            return;
        }
        int local_6 = 0;
        for (; local_6 < local_4.Num(); ++local_6)
        {
            FJsonValue local_16 = local_4.GetValueAt(local_6);
            FJsonObject local_20;
            if (!(local_16.TryGetObject(local_20)))
            {
                continue;
            }
            FSimulatedInput local_30;
            FString local_34;
            if (local_20.TryGetStringField("Name", local_34))
            {
                local_30.Name = FName(local_34);
            }
            FJsonObject local_40;
            if (local_20.TryGetObjectField("Value", local_40))
            {
                float local_42 = 0.0;
                float local_46 = 0.0;
                float local_48 = 0.0;
                local_40.TryGetNumberField("X", local_42);
                local_40.TryGetNumberField("Y", local_46);
                local_40.TryGetNumberField("Z", local_48);
                local_30.Value = FVector(local_42, local_46, local_48);
            }
            float local_48_2 = 0.0;
            if (local_20.HasField("TimeOffset") && local_20.TryGetNumberField("TimeOffset", local_48_2))
            {
                local_30.TimeOffset = float32(local_48_2);
            }
            OutGroup.Add(local_30);
        }
        return;
    }
    void ParseActionArrayFromJson(FJsonObject &inout RootObj, const FString &inout FieldName, TArray<FInstancedStruct> &inout OutActions)
    {
        FJsonArray local_4;
        int local_23 = 0;
        if (!(RootObj.TryGetArrayField(FieldName, local_4)))
        {
            return;
        }
        int local_6 = 0;
        for (; local_6 < local_4.Num(); ++local_6)
        {
            FJsonValue local_16 = local_4.GetValueAt(local_6);
            FJsonObject local_20;
            if (!(local_16.TryGetObject(local_20)))
            {
                continue;
            }
            local_23 = 0;
            FFPTime local_26;
            FFPTime local_28;
            FName local_30;
            float local_32 = 0.0;
            if (local_20.TryGetNumberField("ActionID", local_32))
            {
                int local_8 = int(local_32);
            }
            FString local_38;
            if (local_20.TryGetStringField("ActionType", local_38))
            {
                if ((local_38 == "Span"))
                {
                    local_23 = 2;
                }
                else
                {
                    if ((local_38 == "Instant"))
                    {
                        local_23 = 1;
                    }
                }
            }
            FJsonObject local_42;
            if (local_20.TryGetObjectField("StartTime", local_42))
            {
                float local_44 = 0.0;
                local_42.TryGetNumberField("Ticks", local_44);
                local_26.SetTicks(int64(local_44));
            }
            FJsonObject local_50;
            if (local_20.TryGetObjectField("EndTime", local_50))
            {
                float local_44_2 = 0.0;
                local_50.TryGetNumberField("Ticks", local_44_2);
                local_28.SetTicks(int64(local_44_2));
            }
            FString local_54;
            if (local_20.TryGetStringField("TargetUniqueName", local_54))
            {
                local_30 = FName(local_54);
            }
            FString local_60;
            local_20.TryGetStringField("_subclass", local_60);
            if ((local_60 == "GTCInputAction"))
            {
                FGTCInputAction local_78;
                local_78.StartTime = local_26;
                local_78.EndTime = local_28;
                local_78.TargetUniqueName = local_30;
                local_20.TryGetBoolField("bIsLocalInput", local_78.TargetUniqueName);
                this.ParseInputGroupFromJson(local_20, local_78.InputGroup);
                OutActions.Add(FInstancedStruct::Make(local_78));
            }
            else
            {
                if ((local_60 == "GTCFixedInputAction"))
                {
                    FGTCFixedInputAction local_98;
                    local_98.StartTime = local_26;
                    local_98.EndTime = local_28;
                    local_98.TargetUniqueName = local_30;
                    this.ParseInputGroupFromJson(local_20, local_98.InputGroup);
                    OutActions.Add(FInstancedStruct::Make(local_98));
                }
                else
                {
                    if ((local_60 == "GTCTransitESMStateAction"))
                    {
                        FGTCTransitESMStateAction local_112;
                        local_112.StartTime = local_26;
                        local_112.EndTime = local_28;
                        local_112.TargetUniqueName = local_30;
                        FString local_116;
                        if (local_20.TryGetStringField("StateName", local_116))
                        {
                            local_112.StateName = FName(local_116);
                        }
                        OutActions.Add(FInstancedStruct::Make(local_112));
                    }
                    else
                    {
                        if ((local_60 == "GTCSetTransformAction"))
                        {
                            FGTCSetTransformAction local_144;
                            local_144.StartTime = local_26;
                            local_144.EndTime = local_28;
                            local_144.TargetUniqueName = local_30;
                            FJsonObject local_148;
                            if (local_20.TryGetObjectField("Position", local_148))
                            {
                                float local_44_3 = 0.0;
                                float local_150 = 0.0;
                                float local_152 = 0.0;
                                local_148.TryGetNumberField("X", local_44_3);
                                local_148.TryGetNumberField("Y", local_150);
                                local_148.TryGetNumberField("Z", local_152);
                                local_144.Position = FVector(local_44_3, local_150, local_152);
                            }
                            FJsonObject local_162;
                            if (local_20.TryGetObjectField("Rotation", local_162))
                            {
                                float local_44_4 = 0.0;
                                float local_150_2 = 0.0;
                                float local_152_2 = 0.0;
                                float local_164 = 1.0;
                                local_162.TryGetNumberField("X", local_44_4);
                                local_162.TryGetNumberField("Y", local_150_2);
                                local_162.TryGetNumberField("Z", local_152_2);
                                local_162.TryGetNumberField("W", local_164);
                                local_144.Rotation = FQuat(local_44_4, local_150_2, local_152_2, local_164);
                            }
                            OutActions.Add(FInstancedStruct::Make(local_144));
                        }
                        else
                        {
                            if ((local_60 == "GTCLockTargetAction"))
                            {
                                FGTCLockTargetAction local_190;
                                local_190.StartTime = local_26;
                                local_190.EndTime = local_28;
                                local_190.TargetUniqueName = local_30;
                                FString local_116;
                                if (local_20.TryGetStringField("LockTargetEntityName", local_116))
                                {
                                    local_190.LockTargetEntityName = FName(local_116);
                                }
                                OutActions.Add(FInstancedStruct::Make(local_190));
                            }
                            else
                            {
                                if ((local_60 == "GTCTriggerAction"))
                                {
                                    FGTCTriggerAction local_206;
                                    local_206.StartTime = local_26;
                                    local_206.EndTime = local_28;
                                    local_206.TargetUniqueName = local_30;
                                    OutActions.Add(FInstancedStruct::Make(local_206));
                                }
                                else
                                {
                                    if ((local_60 == "GTCAICommandAction"))
                                    {
                                        FGTCAICommandAction local_232;
                                        local_232.StartTime = local_26;
                                        local_232.EndTime = local_28;
                                        local_232.TargetUniqueName = local_30;
                                        float local_44_5 = 0.0;
                                        if (local_20.TryGetNumberField("Time", local_44_5))
                                        {
                                            local_232.Time = float32(local_44_5);
                                        }
                                        float local_150_3 = 0.0;
                                        if (local_20.TryGetNumberField("NextInstanceId", local_150_3))
                                        {
                                            local_232.NextInstanceId = int(local_150_3);
                                        }
                                        FString local_116;
                                        if (local_20.TryGetStringField("SnapshotJson", local_116))
                                        {
                                            local_232.SnapshotJson = local_116;
                                        }
                                        FString local_238;
                                        if (local_20.TryGetStringField("EntityIdRemap", local_238))
                                        {
                                            local_232.EntityIdRemap = local_238;
                                        }
                                        OutActions.Add(FInstancedStruct::Make(local_232));
                                    }
                                    else
                                    {
                                        if ((local_60 == "GTCTransformSampler"))
                                        {
                                            FGTCTransformSampler local_302;
                                            local_302.StartTime = local_26;
                                            local_302.EndTime = local_28;
                                            local_302.TargetUniqueName = local_30;
                                            local_20.TryGetBoolField("bSampleRotation", local_20.TryGetBoolField("bSamplePosition", local_20.TryGetBoolField("bIsRelative", local_20.TryGetBoolField("bNeedValidation", local_302.TargetUniqueName))));
                                            OutActions.Add(FInstancedStruct::Make(local_302));
                                        }
                                        else
                                        {
                                            if ((local_60 == "GTCESMStateSampler"))
                                            {
                                                FGTCESMStateSampler local_364;
                                                local_364.StartTime = local_26;
                                                local_364.EndTime = local_28;
                                                local_364.TargetUniqueName = local_30;
                                                local_20.TryGetBoolField("bNeedValidation", local_364.TargetUniqueName);
                                                FString local_238;
                                                if (local_20.TryGetStringField("TargetAnimLayer", local_238))
                                                {
                                                    local_364.TargetAnimLayer = local_238;
                                                }
                                                local_20.TryGetBoolField("bSampleClient", local_20.TryGetBoolField("bSampleServer", local_20.TryGetBoolField("bSampleClientTimeOffset", local_20.TryGetBoolField("bSampleTransform", local_20.TryGetBoolField("bSampleEsmStates", local_20.TryGetBoolField("bSampleViewState", local_364.bSampleViewState))))));
                                                OutActions.Add(FInstancedStruct::Make(local_364));
                                            }
                                            else
                                            {
                                                FGTCAction local_376;
                                                local_376.StartTime = local_26;
                                                local_376.EndTime = local_28;
                                                local_376.TargetUniqueName = local_30;
                                                OutActions.Add(FInstancedStruct::Make(local_376));
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return;
    }
}

struct FGTCTestCaseConfig
{
    UPROPERTY()
    bool bDisabled = false;
    UPROPERTY()
    int LoopRounds = 10;
    UPROPERTY()
    FString GTCJsonAssetPath;
    UPROPERTY()
    bool bEnableLatency = false;
    UPROPERTY()
    FNetworkLatencyPair BaseLatency = FNetworkLatencyPair(50.0f, 50.0f);
    UPROPERTY()
    bool bResetCaseEnvironment = false;
    UPROPERTY()
    TMap<FName, TSoftObjectPtr<AECSPrefab>> ManualPrefabs;
    UPROPERTY()
    TArray<FName> FilterRemoveEntityNames;
    UPROPERTY()
    bool bFilterClearCheckpoints = false;
    UPROPERTY()
    bool bFilterClearSamplers = false;
    UPROPERTY()
    TArray<FName> NoReuseEntityNames;

    void LoadGTCSourceData(FGTCSourceData &inout SourceData) const
    {
        SourceData.LoadFromJsonFile(this.GTCJsonAssetPath);
        return;
    }
}

struct FGTCTestCaseInputConfig
{
    UPROPERTY()
    FString TestCasePath;
    UPROPERTY()
    bool bEnableLatency = false;
    UPROPERTY()
    TArray<int> BaseLatency;

}


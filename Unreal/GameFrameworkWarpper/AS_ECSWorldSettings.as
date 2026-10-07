

struct FMsg_CurrentLevelInfoConfigChanged : FEUIMessage
{
    FMsg_CurrentLevelInfoConfigChanged()
    {
        return;
    }
}

class AAS_ECSWorldSettings : AECSGameWorldSettings
{
    UPROPERTY()
    float32 LogicStartTime = 12.0f;
    UPROPERTY()
    float32 LogicTimeSpeed = 36.0f;
    UPROPERTY()
    TDataObjectPtr<FWeatherGenerateTemplate> GlobalWeatherTemplate;
    UPROPERTY()
    TDataObjectPtr<FWorldAreaConfig> GlobalWeatherAreaConfig;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> LevelInfoConfig;
    UPROPERTY()
    TArray<ALevelRandomEventPoint> RandomEventPoints;
    UPROPERTY()
    TArray<ALevelPublicEventPoint> PublicEventPoints;
    UPROPERTY()
    TArray<AEcologySpawnerECSPrefab> EcologySpawners;
    UPROPERTY()
    TArray<AEcologyResourcePrefab> EcologyResources;


    void InitLevelInfo()
    {
        if (int(this.GetWorld().GetNetMode()) == 1)
        {
            int local_9 = 0;
            if (FParse::Value(FCommandLine::Get(), "-level_key=", local_9))
            {
                XLog(ELog(22), FString().Append("InitLevelInfo WorldSettings - LevelKeyFromCommandLine: ").Append(local_9));
            }
        }
        if (int(this.LevelKey) == 0)
        {
            FString local_14 = WorldUtils::GetWorldURLOption(this.GetWorld(), "level_key=");
            if (!(local_14.IsEmpty()))
            {
                XLog(ELog(22), FString().Append("InitLevelInfo WorldSettings - LevelKey: ").Append(local_14));
                if (String::Conv_StringToInt(local_14) > 0)
                {
                }
            }
        }
        if ((int(this.LevelKey)) > 0)
        {
            TDataObjectPtr<FLevelInfoConfig> local_44 = ::FLevelInfoConfig::GetByDataId(int(this.LevelKey));
            if (local_44)
            {
                FName local_70;
                this.LevelInfoConfig = local_44;
                XLog(ELog(22), FString().Append("InitLevelInfo WorldSettings - LevelKey: ").Append(local_70.GetDataName()).Append(", LevelInfoConfig: ").Append(local_70));
            }
            else
            {
                XLog(ELog(22), FString().Append("InitLevelInfo WorldSettings - LevelKey: ").Append(this.LevelKey).Append(", LevelInfoConfig: not found"));
            }
        }
        this.PublishCurrentLevelInfoConfigChanged();
        return;
    }
    void PublishCurrentLevelInfoConfigChanged()
    {
        if ((int(this.GetWorld().GetNetMode())) == 1)
        {
            return;
        }
        UEUIManagerSubsystem local_10 = EUIInternal::GetContextManager(this);
        if (local_10 == nullptr)
        {
            return;
        }
        FEUIMessageBus::PublishWithContextObject(EUIMessageBus).opCall(local_10);
        return;
    }
}


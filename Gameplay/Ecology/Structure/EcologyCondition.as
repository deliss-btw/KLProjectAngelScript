

struct FEcologyConditionWorldContext
{
    UPROPERTY()
    FECSWorldPtr WorldContext;
    UPROPERTY()
    int TimeSegments = 0;
    UPROPERTY()
    FName WeatherName;
    UPROPERTY()
    TDataObjectPtr<FWeatherConfig> WeatherConfig;

    FEcologyConditionWorldContext(const FECSEntity &inout Entity, const FCS_EcologyScriptGlobalContext &inout GlobalContext = FEcologyUtils::GetGlobalContext())
    {
        GetDefaulted local_4;
        FVector local_10 = local_4.opCall().GetPosition();
        this.Setup(local_10, Entity.GetWorld(), GlobalContext);
        return;
    }
    FEcologyConditionWorldContext(const FVector &inout Position, const FECSWorldPtr &inout InWorldContext = ECS::ECSWorld, const FCS_EcologyScriptGlobalContext &inout GlobalContext = FEcologyUtils::GetGlobalContext())
    {
        this.Setup(Position, InWorldContext, GlobalContext);
        return;
    }
    FEcologyConditionWorldContext(const int InTimeSegments, const FName &inout InWeatherName, const FECSWorldPtr &inout InWorldContext = ECS::ECSWorld)
    {
        this.WeatherName = InWeatherName;
        this.WeatherConfig = ::FWeatherUtils::GetWeatherConfig(this.WeatherName);
        this.TimeSegments = InTimeSegments;
        return;
    }
    void Setup(const FVector &inout Position, const FECSWorldPtr &inout InWorldContext = ECS::ECSWorld, const FCS_EcologyScriptGlobalContext &inout GlobalContext = FEcologyUtils::GetGlobalContext())
    {
        this.WeatherName = ::FEcologySceneInfoUtils::GetWeatherByPosition(GlobalContext, Position);
        this.WeatherConfig = ::FWeatherUtils::GetWeatherConfig(this.WeatherName);
        this.TimeSegments = ::FEcologySceneInfoUtils::GetCurrentTimeSegments(GlobalContext);
        return;
    }
}

class UEcologyConditionSchema : UWorldConditionScriptSchema
{
    FWorldConditionContextScriptDataRef WorldContextDataRef = this.ScriptAddContextDataDesc(n"WorldContext", FEcologyConditionWorldContext, EWorldConditionContextDataType(0));

    UEcologyConditionSchema()
    {
        return;
    }
    FWorldConditionContextScriptDataRef GetWorldContextDataRef() const
    {
        return this.WorldContextDataRef;
    }
}

class UResourceConditionSchema : UEcologyConditionSchema
{
    UResourceConditionSchema()
    {
        super();
        return;
    }
}


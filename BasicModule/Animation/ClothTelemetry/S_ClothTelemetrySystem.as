

class US_ClothTelemetrySystem : UECSScriptSystem
{
    US_ClothTelemetrySystem()
    {
        return;
    }
    UFUNCTION()
    bool IsDisabled_Implementation() const
    {
        return false;
    }
    UFUNCTION()
    void ClientJob_CollectClothTelemetry() const
    {
        KLClothTelemetry::CollectClothTelemetryFrame(::FASCommonUtils::GetLocalPlayerPawnEntity());
        return;
    }
    UFUNCTION()
    void Run_ClientJob_CollectClothTelemetry() const
    {
        ECS::GetContextJob();
        this.ClientJob_CollectClothTelemetry();
        return;
    }
}


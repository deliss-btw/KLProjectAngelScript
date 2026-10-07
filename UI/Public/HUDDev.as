
namespace HUD_Development
{
    const TMap<EDamageType, FLinearColor> DamageTypeColorTable = TMap<EDamageType, FLinearColor>();
    const TMap<EPlayerSignalType, FString> SignalHintMessageMap = TMap<EPlayerSignalType, FString>();

UFUNCTION()
void GetActor(const FECSEntity &inout Entity, AActor &out Actor)
{
    Actor = Entity.GetMutableActor();
    return;
}
UFUNCTION()
void ShowLevelHintPanel(const FECSEntity &inout TargetPawnEntity, const FName &inout HintName)
{
    int local_14 = 0;
    if (UEASAbility::GetContextRuntimeInfo().IsServer)
    {
        if ((!((TargetPawnEntity == ENTITY_NULL))))
        {
            FECSWorldPtr local_8 = TargetPawnEntity.GetWorld();
            local_14.HintName = HintName;
            local_14.SetbPredictable(false);
            return;
        }
        XError(ELog(0), "ShowLevelHintPanel TargetPawnEntity is NULL!");
    }
    return;
}
UFUNCTION()
void DebugSendCustomLevelEventFromClient(const FName &inout CustomEventName)
{
    int local_22 = 0;
    if (UEASAbility::GetContextRuntimeInfo().IsClient)
    {
        FECSEntity local_8 = FASCommonUtils::GetLocalPlayerPawnEntity();
        FFPTime local_18 = FFPTime(-1);
        local_22.CustomName = CustomEventName;
    }
    return;
}
FLinearColor GetPlayerSkillHintColor(const bool bGetBackground = false)
{
    FECSEntity local_4 = bGetBackground == false ? FASCommonUtils::GetLocalPlayerPawnEntity() : FASCommonUtils::GetLocalPlayerBackGroundPawnEntity();
    if (!(local_4.IsValid()))
    {
        return FLinearColor();
    }
    FLinearColor local_18;
    HUD_Development::DamageTypeColorTable.Find(FASCommonUtils::GetAvatarDamageType(local_4), local_18);
    return local_18;
}
}


namespace FAudioVoUtils
{
    const FConsoleVariable CVar_AudioVoDebugAbility = FConsoleVariable();
    const FConsoleVariable CVar_AudioVoEnable = FConsoleVariable();

}
struct __Lambda_BasicModule_Audio_AudioVo_AudioVoUtils_142
{
    __Lambda_BasicModule_Audio_AudioVo_AudioVoUtils_142()
    {
        return;
    }
    bool opCall(const FECSEntity &inout A, const FECSEntity &inout B)
    {
        return (A.GetIdValue() < B.GetIdValue());
    }
}

namespace FAudioVoUtils
{
UFUNCTION()
void SendAudioVoEventBySync(const FName &inout VoRowName, const FECSEntity &inout Entity, const FFPTime &inout Time = -1)
{
    int local_4 = 0;
    if (!(FAudioVoUtils::CVar_AudioVoEnable.GetBool()))
    {
        return;
    }
    if (Entity.IsValid())
    {
        local_4.AudioVoInfo.SetVoRowName(VoRowName);
        local_4.AudioVoInfo.SetEntity(Entity);
        return;
    }
    FECSWorldPtr local_10 = ECS::GetECSWorld();
    local_4.AudioVoInfo.SetVoRowName(VoRowName);
    local_4.AudioVoInfo.SetEntity(ENTITY_NULL);
    return;
}
UFUNCTION()
void SendAudioVoEventOnlyPresentation(const FName &inout VoRowName, const FECSEntity &inout Entity, const FFPTime &inout Time = -1)
{
    int local_4 = 0;
    if (!(FAudioVoUtils::CVar_AudioVoEnable.GetBool()))
    {
        return;
    }
    if (Entity.IsValid())
    {
        local_4.AudioVoInfo.SetVoRowName(VoRowName);
        local_4.AudioVoInfo.SetEntity(Entity);
        return;
    }
    FECSWorldPtr local_10 = ECS::GetECSWorld();
    local_4.AudioVoInfo.SetVoRowName(VoRowName);
    local_4.AudioVoInfo.SetEntity(ENTITY_NULL);
    return;
}
UFUNCTION()
void HandleAudioVoEvent(const FAudioVoInfo &inout AudioVoInfo, const bool bDebug, const bool bPrintOnScreen)
{
    UDataTable local_14;
    if (bDebug)
    {
        XLog(ELog(0), FString().Append("HandleAudioVoEvent Entity:").Append(AudioVoInfo.GetEntity().GetEntityName()).Append("  Audio Vo Path: ").Append(AudioVoInfo.GetVoRowName()));
    }
    if (local_14 == nullptr)
    {
        XWarning(ELog(0), "HandleAudioVoEvent can not find datatable: AudioVo Table");
        return;
    }
    FECSEntity local_20 = FECSEntity(AudioVoInfo.GetEntity());
    FName local_22(local_20.GetEntityName());
    FName local_24(AudioVoInfo.GetVoRowName());
    FAudioVoData local_104;
    bool local_15 = local_14.FindRow(local_24, local_104);
    if (local_15)
    {
        FGameAudioUtils::PlayVoByTableRow(local_24, local_20, GetPrefabAvatarName(local_20), FLoadEventCallback(), true);
        if (bDebug)
        {
        }
    }
    else
    {
        if (bDebug)
        {
            FString local_114 = FString().Append("Aduio Vo Data Sender:").Append(local_22).Append(": -> Audio Vo has no config in row name :").Append(local_24).Append("!");
            XLog(ELog(0), local_114);
            if (bPrintOnScreen)
            {
                Print(local_114, 5.0f, FLinearColor::LucBlue);
            }
        }
    }
    return;
}
UFUNCTION()
FECSEntity GetDeterministicRandomTeamate(const FECSEntity &inout Entity, const FFPTime &inout Time)
{
    FECSEntity local_4 = FECSEntity(ENTITY_NULL);
    TArray<FECSEntity> local_8;
    TArray<FECSEntity> local_16 = FTeamUtils::GetTeammates(Entity);
    for (auto& local_32 : local_16)
    {
        Get local_36;
        const FC_PlayerController& local_38 = local_36.opCall();
        if (local_38)
        {
            if (!((Entity == local_38.GetPlayerPawnEntity())))
            {
                local_8.Add(local_32);
            }
        }
    }
    if (local_8.Num() > 0)
    {
        int64 local_46 = Time.GetTicks();
        int64 local_48 = (Entity.GetIdValue() + local_46) % local_8.Num();
        int local_40 = local_48;
        GetDefaulted local_54;
        local_4 = local_54.opCall().GetPlayerPawnEntity();
    }
    return local_4;
}
}

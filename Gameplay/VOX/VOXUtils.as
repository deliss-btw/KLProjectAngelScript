
namespace VOXUtils
{
void SetMicMode(const EVOXVoiceMode NewMode)
{
    FCS_ClientVOXState local_8;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (int(local_8.MicMode) == int(NewMode))
    {
        return;
    }
    local_8.MicMode = NewMode;
    XLog(ELog(1), FString().Append("[VOX] Mic mode changed to: ").Append(int(NewMode)));
    VOXUtils::PersistModes(EVOXVoiceMode(local_8.MicMode), EVOXVoiceMode(local_8.SpeakerMode));
    VOXUtils::ApplyAllRooms(local_8);
    return;
}
void SetSpeakerMode(const EVOXVoiceMode NewMode)
{
    FCS_ClientVOXState local_8;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (int(local_8.SpeakerMode) == int(NewMode))
    {
        return;
    }
    local_8.SpeakerMode = NewMode;
    XLog(ELog(1), FString().Append("[VOX] Speaker mode changed to: ").Append(int(NewMode)));
    VOXUtils::PersistModes(EVOXVoiceMode(local_8.MicMode), EVOXVoiceMode(local_8.SpeakerMode));
    VOXUtils::ApplyAllRooms(local_8);
    return;
}
EVOXVoiceMode GetMicMode()
{
    if (!(ECS::GetECSWorld().IsValid()))
    {
        return EVOXVoiceMode(2);
    }
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_8;
    const FCS_ClientVOXState& local_10 = local_8.opCall();
    if (local_10)
    {
        return local_10.MicMode;
    }
    return EVOXVoiceMode(2);
}
EVOXVoiceMode GetSpeakerMode()
{
    if (!(ECS::GetECSWorld().IsValid()))
    {
        return EVOXVoiceMode(2);
    }
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_8;
    const FCS_ClientVOXState& local_10 = local_8.opCall();
    if (local_10)
    {
        return local_10.SpeakerMode;
    }
    return EVOXVoiceMode(2);
}
void ApplyModeToRoom(const FString &inout RoomId, const EVOXChannelType ChannelType, const EVOXVoiceMode MicMode, const EVOXVoiceMode SpeakerMode)
{
    bool local_2 = VOXUtils::ShouldDeviceOn(EVOXVoiceMode(MicMode), EVOXChannelType(ChannelType));
    bool local_1 = VOXUtils::ShouldDeviceOn(EVOXVoiceMode(SpeakerMode), EVOXChannelType(ChannelType));
    UKLVOXBridge::SetMicEnabled(RoomId, local_2);
    UKLVOXBridge::SetSpeakerEnabled(RoomId, local_1);
    FString local_14;
    if (int(ChannelType) == 0)
    {
        local_14 = "Social";
    }
    else
    {
        local_14 = "Battle";
    }
    XLog(ELog(1), FString().Append("[VOX] ApplyMode ").Append(local_14).Append(" room=").Append(RoomId).Append(" mic=").Append(local_2).Append(" speaker=").Append(local_1));
    return;
}
EVOXVoiceMode LoadPersistedMicMode()
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    EVOXVoiceMode __r; return __r;
}
EVOXVoiceMode LoadPersistedSpeakerMode()
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    EVOXVoiceMode __r; return __r;
}
void RestoreModesForCurrentContext()
{
    FCS_ClientVOXState local_12;
    EVOXVoiceMode local_2 = VOXUtils::LoadPersistedMicMode();
    EVOXVoiceMode local_1 = VOXUtils::LoadPersistedSpeakerMode();
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    bool local_16 = (int(local_12.MicMode) != int(local_2)) || (int(local_12.SpeakerMode) != int(local_1));
    local_12.MicMode = EVOXVoiceMode(local_2);
    local_12.SpeakerMode = EVOXVoiceMode(local_1);
    XLog(ELog(1), FString().Append("[VOX] RestoreModesForContext slot=").Append(int(VOXUtils::GetCurrentContextSlot())).Append(" mic=").Append(int(local_2)).Append(" speaker=").Append(int(local_1)).Append(" changed=").Append(local_16));
    if (local_16)
    {
        VOXUtils::ApplyAllRooms(local_12);
    }
    return;
}
EVOXContextSlot GetCurrentContextSlot()
{
    if (FTeamUtils::GetIsInCityTeamState())
    {
        return EVOXContextSlot(0);
    }
    if (FSocialTeamUtils::ClientGetSocialTeamInfo().TeamID > 0)
    {
        return EVOXContextSlot(2);
    }
    return EVOXContextSlot(1);
}
bool ShouldDeviceOn(const EVOXVoiceMode Mode, const EVOXChannelType ChannelType)
{
    if (int(Mode) == 2)
    {
        return false;
    }
    if (int(Mode) == 0 && (int(ChannelType) == 0))
    {
        return true;
    }
    if (int(Mode) == 1 && (int(ChannelType) == 1))
    {
        return true;
    }
    return false;
}
void PersistModes(const EVOXVoiceMode MicMode, const EVOXVoiceMode SpeakerMode)
{
    EVOXContextSlot local_2 = VOXUtils::GetCurrentContextSlot();
    UVOXSettingsSave local_10 = Cast<UVOXSettingsSave>(KLSaveGame::GetOrLoadSaveGame(__GetWorldContext(), UVOXSettingsSave, NAME_None));
    if (local_10 == nullptr)
    {
        return;
    }
    switch (int(local_2))
    {
    case 0:
    {
        local_10.CityMicMode = MicMode;
        local_10.CitySpeakerMode = SpeakerMode;
        break;
    }
    case 1:
    {
        local_10.NonCityNoSocialMicMode = MicMode;
        local_10.NonCityNoSocialSpeakerMode = SpeakerMode;
        break;
    }
    case 2:
    {
        local_10.NonCitySocialMicMode = MicMode;
        local_10.NonCitySocialSpeakerMode = SpeakerMode;
        break;
    }
    }
    local_10.MarkDirty();
    XLog(ELog(1), FString().Append("[VOX] PersistModes slot=").Append(int(local_2)).Append(" mic=").Append(int(MicMode)).Append(" speaker=").Append(int(SpeakerMode)));
    return;
}
EVOXVoiceMode GetDefaultMicMode(const EVOXContextSlot Slot)
{
    return EVOXVoiceMode(2);
}
EVOXVoiceMode GetDefaultSpeakerMode(const EVOXContextSlot Slot)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    EVOXVoiceMode __r; return __r;
}
bool IsPlayerMuted(const uint PlayerUid)
{
    if (!(ECS::GetECSWorld().IsValid()))
    {
        return false;
    }
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_8;
    const FCS_ClientVOXState& local_10 = local_8.opCall();
    if (local_10)
    {
        return local_10.MutedPlayerUids.Contains(PlayerUid);
    }
    return false;
}
void MutePlayer(const uint PlayerUid)
{
    int local_8 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (local_8.MutedPlayerUids.Contains(PlayerUid))
    {
        return;
    }
    local_8.MutedPlayerUids.Add(PlayerUid);
    FString local_14 = FString().Append(PlayerUid);
    if (!(local_8.LocalSocialRoomId.IsEmpty()))
    {
        UKLVOXBridge::AddUserToBlockList(local_8.LocalSocialRoomId, local_14);
    }
    if (!(local_8.LocalBattleRoomId.IsEmpty()))
    {
        UKLVOXBridge::AddUserToBlockList(local_8.LocalBattleRoomId, local_14);
    }
    XLog(ELog(1), FString().Append("[VOX] MutePlayer uid=").Append(PlayerUid));
    return;
}
void UnmutePlayer(const uint PlayerUid)
{
    int local_8 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_8.MutedPlayerUids.Contains(PlayerUid)))
    {
        return;
    }
    FString local_14 = FString().Append(PlayerUid);
    if (!(local_8.LocalSocialRoomId.IsEmpty()))
    {
        UKLVOXBridge::RemoveUserFromBlockList(local_8.LocalSocialRoomId, local_14);
    }
    if (!(local_8.LocalBattleRoomId.IsEmpty()))
    {
        UKLVOXBridge::RemoveUserFromBlockList(local_8.LocalBattleRoomId, local_14);
    }
    XLog(ELog(1), FString().Append("[VOX] UnmutePlayer uid=").Append(PlayerUid));
    return;
}
void ApplyAllRooms(const FCS_ClientVOXState &inout ClientState)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
bool IsPlayerSpeaking(const uint PlayerUid)
{
    int local_10 = 0;
    int local_19 = 0;
    if (!(UKLVOXBridge::IsVOXInitialized()))
    {
        return false;
    }
    if (!(ECS::GetECSWorld().IsValid()))
    {
        return false;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    if (!(local_10))
    {
        return false;
    }
    FString local_14 = FString().Append(PlayerUid);
    if (!(local_10.LocalSocialRoomId.IsEmpty()))
    {
        local_19 = FMath::Max(0, UKLVOXBridge::GetRecvStreamLevel(local_10.LocalSocialRoomId, local_14));
    }
    if (!(local_10.LocalBattleRoomId.IsEmpty()))
    {
        local_19 = FMath::Max(local_19, UKLVOXBridge::GetRecvStreamLevel(local_10.LocalBattleRoomId, local_14));
    }
    return (local_19 > 3);
}
}


namespace ChatRecentHistorySaveGame
{
    const uint FileVersion = 0;

}
struct FChatMessagePersistRecord
{
    UPROPERTY()
    uint ChannelType = 0;
    UPROPERTY()
    uint TargetUid = 0;
    UPROPERTY()
    uint SenderType = 0;
    UPROPERTY()
    uint SenderUid = 0;
    UPROPERTY()
    FString SenderNickname = "";
    UPROPERTY()
    int SenderLevel = 0;
    UPROPERTY()
    uint SenderCurAvatarId = 0;
    UPROPERTY()
    FString BodyTextStr = "";
    UPROPERTY()
    uint64 SendTimeMs = 0;
    UPROPERTY()
    uint ContentType = 0;
    UPROPERTY()
    uint SystemContentDataId = 0;
    UPROPERTY()
    TArray<FString> SystemContentArgStrings;
    UPROPERTY()
    TArray<FChatSystemSerializedArg> SystemContentArgs;


}

struct FChatStrangerPeerBriefRecord
{
    UPROPERTY()
    uint PeerUid = 0;
    UPROPERTY()
    FString Nickname = "";
    UPROPERTY()
    int Level = 0;
    UPROPERTY()
    uint CurAvatarId = 0;


}

class UChatRecentHistorySaveGame : USaveGame
{
    UPROPERTY()
    uint Version = 0;
    UPROPERTY()
    uint OwnerPlayerUid = 0;
    UPROPERTY()
    TArray<FChatMessagePersistRecord> Messages;
    UPROPERTY()
    TArray<uint> PrivatePeerOrderUids;
    UPROPERTY()
    TArray<FChatStrangerPeerBriefRecord> StrangerPeerBriefs;


}

namespace ChatRecentHistorySaveGame
{
UChatRecentHistorySaveGame Get(const uint PlayerUid)
{
    UChatRecentHistorySaveGame local_16;
    FString local_8 = ChatRecentHistorySaveGame::GetSaveGameName(PlayerUid);
    if (Gameplay::DoesSaveGameExist(local_8, 0))
    {
        local_16 = (Cast<UChatRecentHistorySaveGame>(Gameplay::LoadGameFromSlot(local_8, 0)));
        if (local_16 != nullptr)
        {
            return local_16;
        }
    }
    local_16 = Cast<UChatRecentHistorySaveGame>(Gameplay::CreateSaveGameObject(UChatRecentHistorySaveGame));
    Gameplay::SaveGameToSlot(local_16, local_8, 0);
    return local_16;
}
void Save(const uint PlayerUid, const UChatRecentHistorySaveGame SaveGame, const bool bFlush = false)
{
    FString local_8 = ChatRecentHistorySaveGame::GetSaveGameName(PlayerUid);
    if (bFlush)
    {
        Gameplay::SaveGameToSlot(SaveGame, local_8, 0);
    }
    else
    {
        Gameplay::AsyncSaveGameToSlot(SaveGame, local_8, 0, FAsyncSaveGameToSlotDynamicDelegate());
    }
    return;
}
FString GetSaveGameName(const uint PlayerUid)
{
    return FString().Append("ChatHistorySync_").Append(PlayerUid);
}
}

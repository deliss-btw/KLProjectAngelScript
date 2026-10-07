

struct FVOXRoomIdInfo
{
    UPROPERTY()
    EVOXChannelType ChannelType;
    UPROPERTY()
    uint64 SocialTeamId = 0;
    UPROPERTY()
    uint64 DsID = 0;
    UPROPERTY()
    int TeamIndex = -1;
    UPROPERTY()
    bool bValid = false;


}

namespace VOXRoomId
{
FString MakeSocialRoomId(const uint64 SocialTeamId)
{
    return FString().Append("1").Append(SocialTeamId);
}
FString MakeBattleRoomId(const uint64 DsID, const int TeamIndex)
{
    return FString().Append("0").Append(DsID).Append("_").Append(TeamIndex);
}
bool IsSocialRoom(const FString &inout RoomId)
{
    return RoomId.Len() > 1 && RoomId.StartsWith("1", ESearchCase(1));
}
bool IsBattleRoom(const FString &inout RoomId)
{
    return RoomId.Len() > 1 && RoomId.StartsWith("0", ESearchCase(1));
}
EVOXChannelType GetChannelType(const FString &inout RoomId)
{
    if (RoomId.StartsWith("1", ESearchCase(1)))
    {
        return EVOXChannelType(0);
    }
    return EVOXChannelType(1);
}
FVOXRoomIdInfo ParseRoomId(const FString &inout RoomId)
{
    FVOXRoomIdInfo local_8;
    if (RoomId.Len() < 2)
    {
        return local_8;
    }
    FString local_20 = RoomId.Mid(1, 2147483647);
    if (RoomId.StartsWith("1", ESearchCase(1)))
    {
        local_8.ChannelType = EVOXChannelType(0);
        local_8.SocialTeamId = String::Conv_StringToInt64(local_20);
        local_8.bValid = (local_8.SocialTeamId > 0);
    }
    else
    {
        if (RoomId.StartsWith("0", ESearchCase(1)))
        {
            int local_10 = local_20.Find("_", ESearchCase(1), ESearchDir(0), -1);
            if (local_10 < 0)
            {
                return local_8;
            }
            FString local_16 = local_20.Left(local_10);
            FString local_34 = local_20.Mid(local_10 + 1, 2147483647);
            local_8.ChannelType = EVOXChannelType(1);
            local_8.DsID = String::Conv_StringToInt64(local_16);
            local_8.TeamIndex = String::Conv_StringToInt(local_34);
            local_8.bValid = (local_8.DsID > 0 && (int(local_8.TeamIndex) >= 0));
        }
    }
    return local_8;
}
bool ValidateLength(const FString &inout RoomId)
{
    return RoomId.Len() > 0 && (RoomId.Len() <= 32);
}
}

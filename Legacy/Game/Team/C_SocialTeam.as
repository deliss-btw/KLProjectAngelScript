
namespace __INTENRAL_FCS_DSSocialTeamInfoPendingUpdateTag_NS
{
    const TECSComponentDerivedPtr<FCS_DSSocialTeamInfoPendingUpdateTag> DerivedPtr = TECSComponentDerivedPtr<FCS_DSSocialTeamInfoPendingUpdateTag>();
    const FCS_DSSocialTeamInfoPendingUpdateTag DefaultValue = FCS_DSSocialTeamInfoPendingUpdateTag();

}
struct FSocialTeamMember
{
    UPROPERTY()
    uint MemberID;
    UPROPERTY()
    FString MemberName;
    UPROPERTY()
    bool bOffline;
    UPROPERTY()
    uint CharacterKey;
    UPROPERTY()
    FDivineSkillData DivineSkillData;


}

struct FClientSocialTeamInfo
{
    UPROPERTY()
    uint64 TeamID;
    UPROPERTY()
    TArray<FSocialTeamMember> Members;
    UPROPERTY()
    uint LeaderID;


    FString GetMemberNameByUid(const uint MemberID) const
    {
        for (auto& local_16 : this.Members)
        {
            if (int(local_16.MemberID) == MemberID)
            {
                return local_16.MemberName;
            }
        }
        return "";
    }
    bool FindMemberByUid(const uint MemberID, FSocialTeamMember &out OutMember) const
    {
        for (auto& local_48 : this.Members)
        {
            if (int(local_48.MemberID) == MemberID)
            {
                return true;
            }
        }
        return false;
    }
    bool IsPlayerInSameSocialTeam(const uint PlayerID) const
    {
        if (PlayerID == 0)
        {
            return false;
        }
        for (auto& local_16 : this.Members)
        {
            if (int(local_16.MemberID) == PlayerID)
            {
                return true;
            }
        }
        return false;
    }
}

struct FTeamEntityList
{
    UPROPERTY()
    TArray<FECSEntity> Entities;

    FTeamEntityList()
    {
        return;
    }
}

struct FCS_DSSocialTeamInfoPendingUpdateTag : FECSSingleton
{
    FCS_DSSocialTeamInfoPendingUpdateTag()
    {
        return;
    }
}

namespace ECSFunc_FCS_DSSocialTeamInfoPendingUpdateTag
{
UFUNCTION()
bool HasDSSocialTeamInfoPendingUpdateTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_DSSocialTeamInfoPendingUpdateTag);
}
FCS_DSSocialTeamInfoPendingUpdateTag& AssignDSSocialTeamInfoPendingUpdateTag(const FECSWorldPtr &inout World, const FCS_DSSocialTeamInfoPendingUpdateTag &inout DefaultValue = FCS_DSSocialTeamInfoPendingUpdateTag())
{
    UScriptStruct local_6 = FCS_DSSocialTeamInfoPendingUpdateTag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignDSSocialTeamInfoPendingUpdateTag_BP(const FECSWorldPtr &inout World, const FCS_DSSocialTeamInfoPendingUpdateTag &inout DefaultValue = FCS_DSSocialTeamInfoPendingUpdateTag())
{
    ECSFunc_FCS_DSSocialTeamInfoPendingUpdateTag::AssignDSSocialTeamInfoPendingUpdateTag(World, DefaultValue);
    return;
}
FCS_DSSocialTeamInfoPendingUpdateTag& ModifyDSSocialTeamInfoPendingUpdateTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DSSocialTeamInfoPendingUpdateTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_DSSocialTeamInfoPendingUpdateTag& ModifyOrAddDSSocialTeamInfoPendingUpdateTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DSSocialTeamInfoPendingUpdateTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_DSSocialTeamInfoPendingUpdateTag& GetDSSocialTeamInfoPendingUpdateTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DSSocialTeamInfoPendingUpdateTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_DSSocialTeamInfoPendingUpdateTag GetDSSocialTeamInfoPendingUpdateTag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_DSSocialTeamInfoPendingUpdateTag& local_4 = ECSFunc_FCS_DSSocialTeamInfoPendingUpdateTag::GetDSSocialTeamInfoPendingUpdateTag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_DSSocialTeamInfoPendingUpdateTag();
}
const FCS_DSSocialTeamInfoPendingUpdateTag GetDefaultedDSSocialTeamInfoPendingUpdateTag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_DSSocialTeamInfoPendingUpdateTag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_DSSocialTeamInfoPendingUpdateTag);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_DSSocialTeamInfoPendingUpdateTag GetDefaultedDSSocialTeamInfoPendingUpdateTag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_DSSocialTeamInfoPendingUpdateTag::GetDefaultedDSSocialTeamInfoPendingUpdateTag(World);
}
UFUNCTION()
bool RemoveDSSocialTeamInfoPendingUpdateTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_DSSocialTeamInfoPendingUpdateTag);
}
}
void __MonitorDSSocialTeamInfoPendingUpdateTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_DSSocialTeamInfoPendingUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDSSocialTeamInfoPendingUpdateTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_DSSocialTeamInfoPendingUpdateTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDSSocialTeamInfoPendingUpdateTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_DSSocialTeamInfoPendingUpdateTag, bFixedFrame, Details);
    return;
}

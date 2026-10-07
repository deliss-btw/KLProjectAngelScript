
namespace __INTENRAL_FCS_GameModeDataTrack_NS
{
    const TECSComponentDerivedPtr<FCS_GameModeDataTrack> DerivedPtr = TECSComponentDerivedPtr<FCS_GameModeDataTrack>();
    const FCS_GameModeDataTrack DefaultValue = FCS_GameModeDataTrack();

}
struct FCS_GameModeDataTrack : FECSSingleton
{
    UPROPERTY()
    int PlayerNumWhenGameModeStart = 0;


}

namespace ECSFunc_FCS_GameModeDataTrack
{
UFUNCTION()
bool HasGameModeDataTrack(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GameModeDataTrack);
}
FCS_GameModeDataTrack& AssignGameModeDataTrack(const FECSWorldPtr &inout World, const FCS_GameModeDataTrack &inout DefaultValue = FCS_GameModeDataTrack())
{
    UScriptStruct local_6 = FCS_GameModeDataTrack;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGameModeDataTrack_BP(const FECSWorldPtr &inout World, const FCS_GameModeDataTrack &inout DefaultValue = FCS_GameModeDataTrack())
{
    ECSFunc_FCS_GameModeDataTrack::AssignGameModeDataTrack(World, DefaultValue);
    return;
}
FCS_GameModeDataTrack& ModifyGameModeDataTrack(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeDataTrack;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GameModeDataTrack& ModifyOrAddGameModeDataTrack(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeDataTrack;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GameModeDataTrack& GetGameModeDataTrack(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeDataTrack;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GameModeDataTrack GetGameModeDataTrack_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_GameModeDataTrack& local_4 = ECSFunc_FCS_GameModeDataTrack::GetGameModeDataTrack(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_GameModeDataTrack();
}
const FCS_GameModeDataTrack GetDefaultedGameModeDataTrack(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GameModeDataTrack __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GameModeDataTrack);
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
FCS_GameModeDataTrack GetDefaultedGameModeDataTrack_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_GameModeDataTrack::GetDefaultedGameModeDataTrack(World);
}
UFUNCTION()
bool RemoveGameModeDataTrack(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GameModeDataTrack);
}
}
void __MonitorGameModeDataTrackLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GameModeDataTrack, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeDataTrackActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GameModeDataTrack, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeDataTrackModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GameModeDataTrack, bFixedFrame, Details);
    return;
}

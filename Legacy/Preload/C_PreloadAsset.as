
enum EGameAudioType
{
    Bank,
    Event,
    Rtpc,
    Switch,
    State,
    Other,
}

enum EGameAudioUseType
{
    UI,
    PostAtLocation,
    PostAtSocket,
    PostAtEmitter,
    Other,
}

namespace __INTENRAL_FCS_AudioBankPreloadRequest_NS
{
    const TECSComponentDerivedPtr<FCS_AudioBankPreloadRequest> DerivedPtr = TECSComponentDerivedPtr<FCS_AudioBankPreloadRequest>();
    const FCS_AudioBankPreloadRequest DefaultValue = FCS_AudioBankPreloadRequest();
}
namespace __INTENRAL_FCS_AssetPreloadRequest_NS
{
    const TECSComponentDerivedPtr<FCS_AssetPreloadRequest> DerivedPtr = TECSComponentDerivedPtr<FCS_AssetPreloadRequest>();
    const FCS_AssetPreloadRequest DefaultValue = FCS_AssetPreloadRequest();
}
namespace __INTENRAL_FCS_AssetPreloadManagerTag_NS
{
    const TECSComponentDerivedPtr<FCS_AssetPreloadManagerTag> DerivedPtr = TECSComponentDerivedPtr<FCS_AssetPreloadManagerTag>();
    const FCS_AssetPreloadManagerTag DefaultValue = FCS_AssetPreloadManagerTag();
}
namespace __INTENRAL_FC_MonsterESMAssetPreloadPendingTag_NS
{
    const TECSComponentDerivedPtr<FC_MonsterESMAssetPreloadPendingTag> DerivedPtr = TECSComponentDerivedPtr<FC_MonsterESMAssetPreloadPendingTag>();
    const FC_MonsterESMAssetPreloadPendingTag DefaultValue = FC_MonsterESMAssetPreloadPendingTag();

}
struct FAudioPreloadSet
{
    UPROPERTY()
    TSet<TSoftObjectPtr<UAkAudioEvent>> PreloadEvents;
    UPROPERTY()
    TSet<TSoftObjectPtr<UAkSwitchValue>> PreloadSwitches;
    UPROPERTY()
    TSet<TSoftObjectPtr<UAkRtpc>> PreloadRtpcs;

    FAudioPreloadSet()
    {
        return;
    }
}

struct FAudioSimpleLoadingContext
{
    UPROPERTY()
    EGameAudioUseType AudioUse;
    UPROPERTY()
    EGameAudioType AudioType;
    UPROPERTY()
    FSoftObjectPath AudioPath;
    UPROPERTY()
    FOnSoftObjectLoaded LoadedCallBack;
    UPROPERTY()
    FECSEntity PawnEntity;
    UPROPERTY()
    FVector Location;
    UPROPERTY()
    FQuat4f Rotation;
    UPROPERTY()
    bool bLocalSpace;
    UPROPERTY()
    FName SocketName;
    UPROPERTY()
    FGameAudioEventFollowOption FollowOption;
    UPROPERTY()
    EGameAudioEmitterPartType Part;


}

struct FAudioPreloadContext
{
    UPROPERTY()
    FSoftObjectPath Path;
    UPROPERTY()
    FOnSoftObjectLoaded LoadedCallBack;
    UPROPERTY()
    EGameAudioType AudioType;


}

struct FFXPreloadContext
{
    UPROPERTY()
    FSoftObjectPath Path;
    UPROPERTY()
    FOnSoftObjectLoaded LoadedCallBack;
    UPROPERTY()
    UClass LoadedClass = nullptr;
    UPROPERTY()
    TArray<FSoftObjectPath> PendingAudioPaths;

    FFXPreloadContext()
    {
        return;
    }
}

struct FCS_AudioBankPreloadRequest : FECSSingleton
{
    UPROPERTY()
    TSet<TSoftObjectPtr<UAkAudioBank>> RequestBanks;
    UPROPERTY()
    TSet<FName> RequestBankNames;

    FCS_AudioBankPreloadRequest()
    {
        return;
    }
    void AddToRequestBanks(TArray<TSoftObjectPtr<UAkAudioBank>> &inout List)
    {
        this.Append(List);
        return;
    }
    void AddToRequestBanks(TArray<FName> &inout List)
    {
        this.RequestBankNames.Append(List);
        return;
    }
}

struct FCS_AssetPreloadRequest : FECSSingleton
{
    UPROPERTY()
    TSet<TSoftObjectPtr<UAkAudioEvent>> RequestEvents;
    UPROPERTY()
    TSet<TSoftObjectPtr<UAkStateValue>> RequestStates;
    UPROPERTY()
    TSet<TSoftObjectPtr<UAkSwitchValue>> RequestSwitches;
    UPROPERTY()
    TSet<TSoftObjectPtr<UAkRtpc>> RequestRtpcs;
    UPROPERTY()
    TSet<TSoftClassPtr<AFXActor>> RequestFxActors;

    FCS_AssetPreloadRequest()
    {
        return;
    }
    void AddToRequestEvents(TArray<TSoftObjectPtr<UAkAudioEvent>> &inout List)
    {
        this.Append(List);
        return;
    }
    void AddToRequestStates(TArray<TSoftObjectPtr<UAkStateValue>> &inout List)
    {
        this.RequestStates.Append(List);
        return;
    }
    void AddToRequestSwitches(TArray<TSoftObjectPtr<UAkSwitchValue>> &inout List)
    {
        this.RequestSwitches.Append(List);
        return;
    }
    void AddToRequestRtpcs(TArray<TSoftObjectPtr<UAkRtpc>> &inout List)
    {
        this.RequestRtpcs.Append(List);
        return;
    }
    void AddToRequestFxActors(TArray<TSoftClassPtr<AFXActor>> &inout List)
    {
        this.RequestFxActors.Append(List);
        return;
    }
}

struct FCS_AssetPreloadManagerTag : FECSSingleton
{
    FCS_AssetPreloadManagerTag()
    {
        return;
    }
    void Initialize()
    {
        return;
    }
    void Deinitialize()
    {
        return;
    }
}

struct FC_MonsterESMAssetPreloadPendingTag : FECSComponent
{
    FC_MonsterESMAssetPreloadPendingTag()
    {
        return;
    }
}

namespace ECSFunc_FCS_AudioBankPreloadRequest
{
UFUNCTION()
bool HasAudioBankPreloadRequest(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_AudioBankPreloadRequest);
}
FCS_AudioBankPreloadRequest& AssignAudioBankPreloadRequest(const FECSWorldPtr &inout World, const FCS_AudioBankPreloadRequest &inout DefaultValue = FCS_AudioBankPreloadRequest())
{
    UScriptStruct local_6 = FCS_AudioBankPreloadRequest;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignAudioBankPreloadRequest_BP(const FECSWorldPtr &inout World, const FCS_AudioBankPreloadRequest &inout DefaultValue = FCS_AudioBankPreloadRequest())
{
    ECSFunc_FCS_AudioBankPreloadRequest::AssignAudioBankPreloadRequest(World, DefaultValue);
    return;
}
FCS_AudioBankPreloadRequest& ModifyAudioBankPreloadRequest(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AudioBankPreloadRequest;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_AudioBankPreloadRequest& ModifyOrAddAudioBankPreloadRequest(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AudioBankPreloadRequest;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_AudioBankPreloadRequest& GetAudioBankPreloadRequest(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AudioBankPreloadRequest;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_AudioBankPreloadRequest GetAudioBankPreloadRequest_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_AudioBankPreloadRequest __r;
    bValid = false;
    bValid = ECSFunc_FCS_AudioBankPreloadRequest::GetAudioBankPreloadRequest(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_AudioBankPreloadRequest GetDefaultedAudioBankPreloadRequest(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_AudioBankPreloadRequest __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_AudioBankPreloadRequest);
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
FCS_AudioBankPreloadRequest GetDefaultedAudioBankPreloadRequest_BP(const FECSWorldPtr &inout World)
{
    FCS_AudioBankPreloadRequest __r;
    return __r;
}
UFUNCTION()
bool RemoveAudioBankPreloadRequest(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_AudioBankPreloadRequest);
}
}
void __MonitorAudioBankPreloadRequestLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_AudioBankPreloadRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAudioBankPreloadRequestActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_AudioBankPreloadRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAudioBankPreloadRequestModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_AudioBankPreloadRequest, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_AssetPreloadRequest
{
UFUNCTION()
bool HasAssetPreloadRequest(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_AssetPreloadRequest);
}
FCS_AssetPreloadRequest& AssignAssetPreloadRequest(const FECSWorldPtr &inout World, const FCS_AssetPreloadRequest &inout DefaultValue = FCS_AssetPreloadRequest())
{
    UScriptStruct local_6 = FCS_AssetPreloadRequest;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignAssetPreloadRequest_BP(const FECSWorldPtr &inout World, const FCS_AssetPreloadRequest &inout DefaultValue = FCS_AssetPreloadRequest())
{
    ECSFunc_FCS_AssetPreloadRequest::AssignAssetPreloadRequest(World, DefaultValue);
    return;
}
FCS_AssetPreloadRequest& ModifyAssetPreloadRequest(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AssetPreloadRequest;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_AssetPreloadRequest& ModifyOrAddAssetPreloadRequest(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AssetPreloadRequest;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_AssetPreloadRequest& GetAssetPreloadRequest(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AssetPreloadRequest;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_AssetPreloadRequest GetAssetPreloadRequest_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_AssetPreloadRequest __r;
    bValid = false;
    bValid = ECSFunc_FCS_AssetPreloadRequest::GetAssetPreloadRequest(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_AssetPreloadRequest GetDefaultedAssetPreloadRequest(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_AssetPreloadRequest __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_AssetPreloadRequest);
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
FCS_AssetPreloadRequest GetDefaultedAssetPreloadRequest_BP(const FECSWorldPtr &inout World)
{
    FCS_AssetPreloadRequest __r;
    return __r;
}
UFUNCTION()
bool RemoveAssetPreloadRequest(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_AssetPreloadRequest);
}
}
void __MonitorAssetPreloadRequestLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_AssetPreloadRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAssetPreloadRequestActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_AssetPreloadRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAssetPreloadRequestModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_AssetPreloadRequest, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_AssetPreloadManagerTag
{
UFUNCTION()
bool HasAssetPreloadManagerTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_AssetPreloadManagerTag);
}
FCS_AssetPreloadManagerTag& AssignAssetPreloadManagerTag(const FECSWorldPtr &inout World, const FCS_AssetPreloadManagerTag &inout DefaultValue = FCS_AssetPreloadManagerTag())
{
    UScriptStruct local_6 = FCS_AssetPreloadManagerTag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignAssetPreloadManagerTag_BP(const FECSWorldPtr &inout World, const FCS_AssetPreloadManagerTag &inout DefaultValue = FCS_AssetPreloadManagerTag())
{
    ECSFunc_FCS_AssetPreloadManagerTag::AssignAssetPreloadManagerTag(World, DefaultValue);
    return;
}
FCS_AssetPreloadManagerTag& ModifyAssetPreloadManagerTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AssetPreloadManagerTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_AssetPreloadManagerTag& ModifyOrAddAssetPreloadManagerTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AssetPreloadManagerTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_AssetPreloadManagerTag& GetAssetPreloadManagerTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AssetPreloadManagerTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_AssetPreloadManagerTag GetAssetPreloadManagerTag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_AssetPreloadManagerTag& local_4 = ECSFunc_FCS_AssetPreloadManagerTag::GetAssetPreloadManagerTag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_AssetPreloadManagerTag();
}
const FCS_AssetPreloadManagerTag GetDefaultedAssetPreloadManagerTag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_AssetPreloadManagerTag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_AssetPreloadManagerTag);
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
FCS_AssetPreloadManagerTag GetDefaultedAssetPreloadManagerTag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_AssetPreloadManagerTag::GetDefaultedAssetPreloadManagerTag(World);
}
UFUNCTION()
bool RemoveAssetPreloadManagerTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_AssetPreloadManagerTag);
}
}
void __MonitorAssetPreloadManagerTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_AssetPreloadManagerTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAssetPreloadManagerTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_AssetPreloadManagerTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAssetPreloadManagerTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_AssetPreloadManagerTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MonsterESMAssetPreloadPendingTag
{
UFUNCTION()
bool HasMonsterESMAssetPreloadPendingTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MonsterESMAssetPreloadPendingTag);
}
FC_MonsterESMAssetPreloadPendingTag& AssignMonsterESMAssetPreloadPendingTag(const FECSEntity &inout Entity, const FC_MonsterESMAssetPreloadPendingTag &inout DefaultValue = FC_MonsterESMAssetPreloadPendingTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MonsterESMAssetPreloadPendingTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMonsterESMAssetPreloadPendingTag_BP(const FECSEntity &inout Entity, const FC_MonsterESMAssetPreloadPendingTag &inout DefaultValue = FC_MonsterESMAssetPreloadPendingTag())
{
    ECSFunc_FC_MonsterESMAssetPreloadPendingTag::AssignMonsterESMAssetPreloadPendingTag(Entity, DefaultValue);
    return;
}
FC_MonsterESMAssetPreloadPendingTag& ModifyMonsterESMAssetPreloadPendingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MonsterESMAssetPreloadPendingTag));
    return local_12.GetComp();
}
FC_MonsterESMAssetPreloadPendingTag& ModifyOrAddMonsterESMAssetPreloadPendingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MonsterESMAssetPreloadPendingTag));
    return local_12.GetComp();
}
const FC_MonsterESMAssetPreloadPendingTag& GetMonsterESMAssetPreloadPendingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MonsterESMAssetPreloadPendingTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_MonsterESMAssetPreloadPendingTag GetMonsterESMAssetPreloadPendingTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MonsterESMAssetPreloadPendingTag& local_4 = ECSFunc_FC_MonsterESMAssetPreloadPendingTag::GetMonsterESMAssetPreloadPendingTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MonsterESMAssetPreloadPendingTag();
}
const FC_MonsterESMAssetPreloadPendingTag GetDefaultedMonsterESMAssetPreloadPendingTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MonsterESMAssetPreloadPendingTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MonsterESMAssetPreloadPendingTag);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_MonsterESMAssetPreloadPendingTag GetDefaultedMonsterESMAssetPreloadPendingTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MonsterESMAssetPreloadPendingTag::GetDefaultedMonsterESMAssetPreloadPendingTag(Entity);
}
UFUNCTION()
bool RemoveMonsterESMAssetPreloadPendingTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MonsterESMAssetPreloadPendingTag);
}
}
FECSMonitorRuntimeView __GetMonitorMonsterESMAssetPreloadPendingTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MonsterESMAssetPreloadPendingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterESMAssetPreloadPendingTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MonsterESMAssetPreloadPendingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterESMAssetPreloadPendingTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MonsterESMAssetPreloadPendingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterESMAssetPreloadPendingTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MonsterESMAssetPreloadPendingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterESMAssetPreloadPendingTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MonsterESMAssetPreloadPendingTag, bFixedFrame, bMustHandleAll);
}
void __MonitorMonsterESMAssetPreloadPendingTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MonsterESMAssetPreloadPendingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMonsterESMAssetPreloadPendingTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MonsterESMAssetPreloadPendingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMonsterESMAssetPreloadPendingTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MonsterESMAssetPreloadPendingTag, bFixedFrame, Details);
    return;
}


enum EEcosimAIV2NumberComparison
{
    GreaterThan,
    GreaterThanOrEqual,
    LessThan,
    LessThanOrEqual,
    Equals,
    NotEqual,
}

namespace __INTENRAL_FC_EcosimAIV2InteractSpeak_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2InteractSpeak> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2InteractSpeak>();
    const FC_EcosimAIV2InteractSpeak DefaultValue = FC_EcosimAIV2InteractSpeak();
}
namespace __INTENRAL_FC_EcosimAIV2InteractOption_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2InteractOption> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2InteractOption>();
    const FC_EcosimAIV2InteractOption DefaultValue = FC_EcosimAIV2InteractOption();
}
namespace __INTENRAL_FC_EcosimAIV2DialogueMemory_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2DialogueMemory> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2DialogueMemory>();
    const FC_EcosimAIV2DialogueMemory DefaultValue = FC_EcosimAIV2DialogueMemory();
}
namespace __INTENRAL_FC_EcosimAIV2InteractSimpleSpeakToAndOption_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2InteractSimpleSpeakToAndOption> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2InteractSimpleSpeakToAndOption>();
    const FC_EcosimAIV2InteractSimpleSpeakToAndOption DefaultValue = FC_EcosimAIV2InteractSimpleSpeakToAndOption();
}
namespace __INTENRAL_FC_EcosimAIV2SyncSpeakToAndOptionInfo_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2SyncSpeakToAndOptionInfo> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2SyncSpeakToAndOptionInfo>();
    const FC_EcosimAIV2SyncSpeakToAndOptionInfo DefaultValue = FC_EcosimAIV2SyncSpeakToAndOptionInfo();
}
namespace __INTENRAL_FC_EcosimAIV2PlayerDiagueInfo_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2PlayerDiagueInfo> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2PlayerDiagueInfo>();
    const FC_EcosimAIV2PlayerDiagueInfo DefaultValue = FC_EcosimAIV2PlayerDiagueInfo();
}
namespace __INTENRAL_FC_EcosimAIV2InteractingDialogueContext_NS
{
    const TECSComponentDerivedPtr<FC_EcosimAIV2InteractingDialogueContext> DerivedPtr = TECSComponentDerivedPtr<FC_EcosimAIV2InteractingDialogueContext>();
    const FC_EcosimAIV2InteractingDialogueContext DefaultValue = FC_EcosimAIV2InteractingDialogueContext();
}
namespace __INTENRAL_FCS_EcosimAIV2CareAboutPlayerController_NS
{
    const TECSComponentDerivedPtr<FCS_EcosimAIV2CareAboutPlayerController> DerivedPtr = TECSComponentDerivedPtr<FCS_EcosimAIV2CareAboutPlayerController>();
    const FCS_EcosimAIV2CareAboutPlayerController DefaultValue = FCS_EcosimAIV2CareAboutPlayerController();

}
struct FC_EcosimAIV2InteractSpeak : FECSComponent
{
    UPROPERTY()
    TArray<FString> SpeakList;

    FC_EcosimAIV2InteractSpeak()
    {
        return;
    }
}

struct FC_EcosimAIV2InteractOption : FECSComponent
{
    UPROPERTY()
    TArray<FString> OptionList;

    FC_EcosimAIV2InteractOption()
    {
        return;
    }
}

struct FInteractSimpleSpeakToAndOptionConditionBase
{
    FInteractSimpleSpeakToAndOptionConditionBase()
    {
        return;
    }
}

struct FInteractSimpleSpeakToAndOptionCondition_SpeakNumOfTime : FInteractSimpleSpeakToAndOptionConditionBase
{
    FInteractSimpleSpeakToAndOptionConditionBase _base_FInteractSimpleSpeakToAndOptionConditionBase;
    UPROPERTY()
    TArray<FName> CareAboutSpeakToContentKeyList;
    UPROPERTY()
    int SpeakNumOfTime;
    UPROPERTY()
    bool bOnlyCountCurrentTarget;
    UPROPERTY()
    EEcosimAIV2NumberComparison EcosimAIV2NumberComparison;


}

struct FInteractSimpleSpeakToAndOptionCondition_NotSpokenTo : FInteractSimpleSpeakToAndOptionConditionBase
{
    FInteractSimpleSpeakToAndOptionConditionBase _base_FInteractSimpleSpeakToAndOptionConditionBase;

    FInteractSimpleSpeakToAndOptionCondition_NotSpokenTo()
    {
        super();
        return;
    }
}

struct FInteractSimpleSpeakToAndOptionCondition_HaventSpokenToTarget : FInteractSimpleSpeakToAndOptionConditionBase
{
    FInteractSimpleSpeakToAndOptionConditionBase _base_FInteractSimpleSpeakToAndOptionConditionBase;

    FInteractSimpleSpeakToAndOptionCondition_HaventSpokenToTarget()
    {
        super();
        return;
    }
}

struct FEcosimAIV2DialogueOptionConditionBase
{
    FEcosimAIV2DialogueOptionConditionBase()
    {
        return;
    }
}

struct FEcosimAIV2DialogueOptionCondition_ConsumeItem : FEcosimAIV2DialogueOptionConditionBase
{
    FEcosimAIV2DialogueOptionConditionBase _base_FEcosimAIV2DialogueOptionConditionBase;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> ConsumeItem;

    FEcosimAIV2DialogueOptionCondition_ConsumeItem()
    {
        super();
        return;
    }
    FString ToString() const
    {
        if (!(this) || !(this.IsSet()))
        {
            return "";
        }
        return FString();
    }
}

struct FEcosimAIV2SpeakToMemory
{
    UPROPERTY()
    TArray<FName> SpokenToNameKeyList;

    FEcosimAIV2SpeakToMemory()
    {
        return;
    }
}

struct FC_EcosimAIV2DialogueMemory : FECSComponent
{
    UPROPERTY()
    TMap<FECSEntity, FEcosimAIV2SpeakToMemory> SpeakToMemoryMap;
    UPROPERTY()
    TDataObjectPtr<FInteractSimpleSpeakToAndOption> CurrentSpeakToAndOption;

    FC_EcosimAIV2DialogueMemory()
    {
        return;
    }
}

struct FC_EcosimAIV2InteractSimpleSpeakToAndOption : FECSComponent
{
    UPROPERTY()
    TArray<TDataObjectPtr<FInteractSimpleSpeakToAndOption>> SpeakToAndOptionList;

    FC_EcosimAIV2InteractSimpleSpeakToAndOption()
    {
        return;
    }
}

struct FC_EcosimAIV2SyncSpeakToAndOptionInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FECSEntity> m_HasSpeakToAndOptionPlayerEntityList;
    UPROPERTY()
    FTargetEntity m_CurrentSpeakToEntity;

    FC_EcosimAIV2SyncSpeakToAndOptionInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_EcosimAIV2SyncSpeakToAndOptionInfo(const FC_EcosimAIV2SyncSpeakToAndOptionInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_HasSpeakToAndOptionPlayerEntityList = Other.m_HasSpeakToAndOptionPlayerEntityList;
        this.m_CurrentSpeakToEntity = Other.m_CurrentSpeakToEntity;
        return;
    }
    FC_EcosimAIV2SyncSpeakToAndOptionInfo opAssign(const FC_EcosimAIV2SyncSpeakToAndOptionInfo &inout Other)
    {
        FC_EcosimAIV2SyncSpeakToAndOptionInfo __r;
        this.SetHasSpeakToAndOptionPlayerEntityList(Other.GetHasSpeakToAndOptionPlayerEntityList());
        this.SetCurrentSpeakToEntity(Other.GetCurrentSpeakToEntity());
        return __r;
    }
    const TArray<FECSEntity> GetHasSpeakToAndOptionPlayerEntityList() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetModify_HasSpeakToAndOptionPlayerEntityList() property
    {
        TArray<FECSEntity> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetHasSpeakToAndOptionPlayerEntityList(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_HasSpeakToAndOptionPlayerEntityList = __Value;
        return;
    }
    const FTargetEntity GetCurrentSpeakToEntity() const property
    {
        const FTargetEntity __r;
        return __r;
    }
    FTargetEntity GetModify_CurrentSpeakToEntity() property
    {
        FTargetEntity __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetCurrentSpeakToEntity(const FTargetEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CurrentSpeakToEntity = __Value;
        return;
    }
}

struct FC_EcosimAIV2PlayerDiagueInfo : FECSComponent
{
    UPROPERTY()
    FTargetEntity CurrentSpeakToEntity;

    FC_EcosimAIV2PlayerDiagueInfo()
    {
        return;
    }
}

struct FC_EcosimAIV2InteractingDialogueContext : FECSComponent
{
    UPROPERTY()
    TArray<FString> OptionList;

    FC_EcosimAIV2InteractingDialogueContext()
    {
        return;
    }
}

struct FCS_EcosimAIV2CareAboutPlayerController : FECSSingleton
{
    UPROPERTY()
    TArray<FECSEntity> CareAboutPlayerControllerEntityList;

    FCS_EcosimAIV2CareAboutPlayerController()
    {
        return;
    }
}

namespace ECSFunc_FC_EcosimAIV2InteractSpeak
{
UFUNCTION()
bool HasEcosimAIV2InteractSpeak(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractSpeak);
}
FC_EcosimAIV2InteractSpeak& AssignEcosimAIV2InteractSpeak(const FECSEntity &inout Entity, const FC_EcosimAIV2InteractSpeak &inout DefaultValue = FC_EcosimAIV2InteractSpeak())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractSpeak, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2InteractSpeak_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2InteractSpeak &inout DefaultValue = FC_EcosimAIV2InteractSpeak())
{
    ECSFunc_FC_EcosimAIV2InteractSpeak::AssignEcosimAIV2InteractSpeak(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2InteractSpeak& ModifyEcosimAIV2InteractSpeak(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractSpeak));
    return local_12.GetComp();
}
FC_EcosimAIV2InteractSpeak& ModifyOrAddEcosimAIV2InteractSpeak(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractSpeak));
    return local_12.GetComp();
}
const FC_EcosimAIV2InteractSpeak& GetEcosimAIV2InteractSpeak(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractSpeak));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2InteractSpeak GetEcosimAIV2InteractSpeak_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2InteractSpeak __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2InteractSpeak::GetEcosimAIV2InteractSpeak(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2InteractSpeak GetDefaultedEcosimAIV2InteractSpeak(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2InteractSpeak __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractSpeak);
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
FC_EcosimAIV2InteractSpeak GetDefaultedEcosimAIV2InteractSpeak_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2InteractSpeak __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2InteractSpeak(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractSpeak);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractSpeakOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2InteractSpeak, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractSpeakOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2InteractSpeak, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractSpeakOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2InteractSpeak, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractSpeakOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2InteractSpeak, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractSpeakOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2InteractSpeak, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2InteractSpeakLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2InteractSpeak, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2InteractSpeakActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2InteractSpeak, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2InteractSpeakModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2InteractSpeak, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2InteractOption
{
UFUNCTION()
bool HasEcosimAIV2InteractOption(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractOption);
}
FC_EcosimAIV2InteractOption& AssignEcosimAIV2InteractOption(const FECSEntity &inout Entity, const FC_EcosimAIV2InteractOption &inout DefaultValue = FC_EcosimAIV2InteractOption())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractOption, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2InteractOption_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2InteractOption &inout DefaultValue = FC_EcosimAIV2InteractOption())
{
    ECSFunc_FC_EcosimAIV2InteractOption::AssignEcosimAIV2InteractOption(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2InteractOption& ModifyEcosimAIV2InteractOption(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractOption));
    return local_12.GetComp();
}
FC_EcosimAIV2InteractOption& ModifyOrAddEcosimAIV2InteractOption(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractOption));
    return local_12.GetComp();
}
const FC_EcosimAIV2InteractOption& GetEcosimAIV2InteractOption(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractOption));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2InteractOption GetEcosimAIV2InteractOption_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2InteractOption __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2InteractOption::GetEcosimAIV2InteractOption(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2InteractOption GetDefaultedEcosimAIV2InteractOption(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2InteractOption __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractOption);
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
FC_EcosimAIV2InteractOption GetDefaultedEcosimAIV2InteractOption_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2InteractOption __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2InteractOption(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractOption);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractOptionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2InteractOption, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractOptionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2InteractOption, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractOptionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2InteractOption, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractOptionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2InteractOption, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractOptionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2InteractOption, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2InteractOptionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2InteractOption, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2InteractOptionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2InteractOption, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2InteractOptionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2InteractOption, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2DialogueMemory
{
UFUNCTION()
bool HasEcosimAIV2DialogueMemory(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2DialogueMemory);
}
FC_EcosimAIV2DialogueMemory& AssignEcosimAIV2DialogueMemory(const FECSEntity &inout Entity, const FC_EcosimAIV2DialogueMemory &inout DefaultValue = FC_EcosimAIV2DialogueMemory())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2DialogueMemory, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2DialogueMemory_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2DialogueMemory &inout DefaultValue = FC_EcosimAIV2DialogueMemory())
{
    ECSFunc_FC_EcosimAIV2DialogueMemory::AssignEcosimAIV2DialogueMemory(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2DialogueMemory& ModifyEcosimAIV2DialogueMemory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2DialogueMemory));
    return local_12.GetComp();
}
FC_EcosimAIV2DialogueMemory& ModifyOrAddEcosimAIV2DialogueMemory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2DialogueMemory));
    return local_12.GetComp();
}
const FC_EcosimAIV2DialogueMemory& GetEcosimAIV2DialogueMemory(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2DialogueMemory));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2DialogueMemory GetEcosimAIV2DialogueMemory_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2DialogueMemory __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2DialogueMemory::GetEcosimAIV2DialogueMemory(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2DialogueMemory GetDefaultedEcosimAIV2DialogueMemory(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2DialogueMemory __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2DialogueMemory);
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
FC_EcosimAIV2DialogueMemory GetDefaultedEcosimAIV2DialogueMemory_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2DialogueMemory __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2DialogueMemory(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2DialogueMemory);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2DialogueMemoryOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2DialogueMemory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2DialogueMemoryOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2DialogueMemory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2DialogueMemoryOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2DialogueMemory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2DialogueMemoryOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2DialogueMemory, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2DialogueMemoryOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2DialogueMemory, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2DialogueMemoryLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2DialogueMemory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2DialogueMemoryActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2DialogueMemory, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2DialogueMemoryModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2DialogueMemory, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2InteractSimpleSpeakToAndOption
{
UFUNCTION()
bool HasEcosimAIV2InteractSimpleSpeakToAndOption(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractSimpleSpeakToAndOption);
}
FC_EcosimAIV2InteractSimpleSpeakToAndOption& AssignEcosimAIV2InteractSimpleSpeakToAndOption(const FECSEntity &inout Entity, const FC_EcosimAIV2InteractSimpleSpeakToAndOption &inout DefaultValue = FC_EcosimAIV2InteractSimpleSpeakToAndOption())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractSimpleSpeakToAndOption, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2InteractSimpleSpeakToAndOption_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2InteractSimpleSpeakToAndOption &inout DefaultValue = FC_EcosimAIV2InteractSimpleSpeakToAndOption())
{
    ECSFunc_FC_EcosimAIV2InteractSimpleSpeakToAndOption::AssignEcosimAIV2InteractSimpleSpeakToAndOption(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2InteractSimpleSpeakToAndOption& ModifyEcosimAIV2InteractSimpleSpeakToAndOption(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractSimpleSpeakToAndOption));
    return local_12.GetComp();
}
FC_EcosimAIV2InteractSimpleSpeakToAndOption& ModifyOrAddEcosimAIV2InteractSimpleSpeakToAndOption(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractSimpleSpeakToAndOption));
    return local_12.GetComp();
}
const FC_EcosimAIV2InteractSimpleSpeakToAndOption& GetEcosimAIV2InteractSimpleSpeakToAndOption(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractSimpleSpeakToAndOption));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2InteractSimpleSpeakToAndOption GetEcosimAIV2InteractSimpleSpeakToAndOption_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2InteractSimpleSpeakToAndOption __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2InteractSimpleSpeakToAndOption::GetEcosimAIV2InteractSimpleSpeakToAndOption(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2InteractSimpleSpeakToAndOption GetDefaultedEcosimAIV2InteractSimpleSpeakToAndOption(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2InteractSimpleSpeakToAndOption __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractSimpleSpeakToAndOption);
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
FC_EcosimAIV2InteractSimpleSpeakToAndOption GetDefaultedEcosimAIV2InteractSimpleSpeakToAndOption_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2InteractSimpleSpeakToAndOption __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2InteractSimpleSpeakToAndOption(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractSimpleSpeakToAndOption);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractSimpleSpeakToAndOptionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2InteractSimpleSpeakToAndOption, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractSimpleSpeakToAndOptionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2InteractSimpleSpeakToAndOption, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractSimpleSpeakToAndOptionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2InteractSimpleSpeakToAndOption, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractSimpleSpeakToAndOptionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2InteractSimpleSpeakToAndOption, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractSimpleSpeakToAndOptionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2InteractSimpleSpeakToAndOption, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2InteractSimpleSpeakToAndOptionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2InteractSimpleSpeakToAndOption, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2InteractSimpleSpeakToAndOptionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2InteractSimpleSpeakToAndOption, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2InteractSimpleSpeakToAndOptionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2InteractSimpleSpeakToAndOption, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2SyncSpeakToAndOptionInfo
{
UFUNCTION()
bool HasEcosimAIV2SyncSpeakToAndOptionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2SyncSpeakToAndOptionInfo);
}
FC_EcosimAIV2SyncSpeakToAndOptionInfo& AssignEcosimAIV2SyncSpeakToAndOptionInfo(const FECSEntity &inout Entity, const FC_EcosimAIV2SyncSpeakToAndOptionInfo &inout DefaultValue = FC_EcosimAIV2SyncSpeakToAndOptionInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2SyncSpeakToAndOptionInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2SyncSpeakToAndOptionInfo_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2SyncSpeakToAndOptionInfo &inout DefaultValue = FC_EcosimAIV2SyncSpeakToAndOptionInfo())
{
    ECSFunc_FC_EcosimAIV2SyncSpeakToAndOptionInfo::AssignEcosimAIV2SyncSpeakToAndOptionInfo(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2SyncSpeakToAndOptionInfo& ModifyEcosimAIV2SyncSpeakToAndOptionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2SyncSpeakToAndOptionInfo));
    return local_12.GetComp();
}
FC_EcosimAIV2SyncSpeakToAndOptionInfo& ModifyOrAddEcosimAIV2SyncSpeakToAndOptionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2SyncSpeakToAndOptionInfo));
    return local_12.GetComp();
}
const FC_EcosimAIV2SyncSpeakToAndOptionInfo& GetEcosimAIV2SyncSpeakToAndOptionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2SyncSpeakToAndOptionInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2SyncSpeakToAndOptionInfo GetEcosimAIV2SyncSpeakToAndOptionInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EcosimAIV2SyncSpeakToAndOptionInfo& local_4 = ECSFunc_FC_EcosimAIV2SyncSpeakToAndOptionInfo::GetEcosimAIV2SyncSpeakToAndOptionInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EcosimAIV2SyncSpeakToAndOptionInfo();
}
const FC_EcosimAIV2SyncSpeakToAndOptionInfo GetDefaultedEcosimAIV2SyncSpeakToAndOptionInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2SyncSpeakToAndOptionInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2SyncSpeakToAndOptionInfo);
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
FC_EcosimAIV2SyncSpeakToAndOptionInfo GetDefaultedEcosimAIV2SyncSpeakToAndOptionInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EcosimAIV2SyncSpeakToAndOptionInfo::GetDefaultedEcosimAIV2SyncSpeakToAndOptionInfo(Entity);
}
UFUNCTION()
bool RemoveEcosimAIV2SyncSpeakToAndOptionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2SyncSpeakToAndOptionInfo);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2SyncSpeakToAndOptionInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2SyncSpeakToAndOptionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2SyncSpeakToAndOptionInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2SyncSpeakToAndOptionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2SyncSpeakToAndOptionInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2SyncSpeakToAndOptionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2SyncSpeakToAndOptionInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2SyncSpeakToAndOptionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2SyncSpeakToAndOptionInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2SyncSpeakToAndOptionInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2SyncSpeakToAndOptionInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2SyncSpeakToAndOptionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2SyncSpeakToAndOptionInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2SyncSpeakToAndOptionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2SyncSpeakToAndOptionInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2SyncSpeakToAndOptionInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2PlayerDiagueInfo
{
UFUNCTION()
bool HasEcosimAIV2PlayerDiagueInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2PlayerDiagueInfo);
}
FC_EcosimAIV2PlayerDiagueInfo& AssignEcosimAIV2PlayerDiagueInfo(const FECSEntity &inout Entity, const FC_EcosimAIV2PlayerDiagueInfo &inout DefaultValue = FC_EcosimAIV2PlayerDiagueInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2PlayerDiagueInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2PlayerDiagueInfo_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2PlayerDiagueInfo &inout DefaultValue = FC_EcosimAIV2PlayerDiagueInfo())
{
    ECSFunc_FC_EcosimAIV2PlayerDiagueInfo::AssignEcosimAIV2PlayerDiagueInfo(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2PlayerDiagueInfo& ModifyEcosimAIV2PlayerDiagueInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2PlayerDiagueInfo));
    return local_12.GetComp();
}
FC_EcosimAIV2PlayerDiagueInfo& ModifyOrAddEcosimAIV2PlayerDiagueInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2PlayerDiagueInfo));
    return local_12.GetComp();
}
const FC_EcosimAIV2PlayerDiagueInfo& GetEcosimAIV2PlayerDiagueInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2PlayerDiagueInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2PlayerDiagueInfo GetEcosimAIV2PlayerDiagueInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2PlayerDiagueInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2PlayerDiagueInfo::GetEcosimAIV2PlayerDiagueInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2PlayerDiagueInfo GetDefaultedEcosimAIV2PlayerDiagueInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2PlayerDiagueInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2PlayerDiagueInfo);
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
FC_EcosimAIV2PlayerDiagueInfo GetDefaultedEcosimAIV2PlayerDiagueInfo_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2PlayerDiagueInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2PlayerDiagueInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2PlayerDiagueInfo);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2PlayerDiagueInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2PlayerDiagueInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2PlayerDiagueInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2PlayerDiagueInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2PlayerDiagueInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2PlayerDiagueInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2PlayerDiagueInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2PlayerDiagueInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2PlayerDiagueInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2PlayerDiagueInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2PlayerDiagueInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2PlayerDiagueInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2PlayerDiagueInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2PlayerDiagueInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2PlayerDiagueInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2PlayerDiagueInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EcosimAIV2InteractingDialogueContext
{
UFUNCTION()
bool HasEcosimAIV2InteractingDialogueContext(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractingDialogueContext);
}
FC_EcosimAIV2InteractingDialogueContext& AssignEcosimAIV2InteractingDialogueContext(const FECSEntity &inout Entity, const FC_EcosimAIV2InteractingDialogueContext &inout DefaultValue = FC_EcosimAIV2InteractingDialogueContext())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractingDialogueContext, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2InteractingDialogueContext_BP(const FECSEntity &inout Entity, const FC_EcosimAIV2InteractingDialogueContext &inout DefaultValue = FC_EcosimAIV2InteractingDialogueContext())
{
    ECSFunc_FC_EcosimAIV2InteractingDialogueContext::AssignEcosimAIV2InteractingDialogueContext(Entity, DefaultValue);
    return;
}
FC_EcosimAIV2InteractingDialogueContext& ModifyEcosimAIV2InteractingDialogueContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractingDialogueContext));
    return local_12.GetComp();
}
FC_EcosimAIV2InteractingDialogueContext& ModifyOrAddEcosimAIV2InteractingDialogueContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractingDialogueContext));
    return local_12.GetComp();
}
const FC_EcosimAIV2InteractingDialogueContext& GetEcosimAIV2InteractingDialogueContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractingDialogueContext));
    return local_12.GetComp();
}
UFUNCTION()
FC_EcosimAIV2InteractingDialogueContext GetEcosimAIV2InteractingDialogueContext_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EcosimAIV2InteractingDialogueContext __r;
    bValid = false;
    bValid = ECSFunc_FC_EcosimAIV2InteractingDialogueContext::GetEcosimAIV2InteractingDialogueContext(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EcosimAIV2InteractingDialogueContext GetDefaultedEcosimAIV2InteractingDialogueContext(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EcosimAIV2InteractingDialogueContext __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractingDialogueContext);
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
FC_EcosimAIV2InteractingDialogueContext GetDefaultedEcosimAIV2InteractingDialogueContext_BP(const FECSEntity &inout Entity)
{
    FC_EcosimAIV2InteractingDialogueContext __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2InteractingDialogueContext(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EcosimAIV2InteractingDialogueContext);
}
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractingDialogueContextOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EcosimAIV2InteractingDialogueContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractingDialogueContextOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EcosimAIV2InteractingDialogueContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractingDialogueContextOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EcosimAIV2InteractingDialogueContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractingDialogueContextOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EcosimAIV2InteractingDialogueContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEcosimAIV2InteractingDialogueContextOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EcosimAIV2InteractingDialogueContext, bFixedFrame, bMustHandleAll);
}
void __MonitorEcosimAIV2InteractingDialogueContextLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EcosimAIV2InteractingDialogueContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2InteractingDialogueContextActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EcosimAIV2InteractingDialogueContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2InteractingDialogueContextModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EcosimAIV2InteractingDialogueContext, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_EcosimAIV2CareAboutPlayerController
{
UFUNCTION()
bool HasEcosimAIV2CareAboutPlayerController(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EcosimAIV2CareAboutPlayerController);
}
FCS_EcosimAIV2CareAboutPlayerController& AssignEcosimAIV2CareAboutPlayerController(const FECSWorldPtr &inout World, const FCS_EcosimAIV2CareAboutPlayerController &inout DefaultValue = FCS_EcosimAIV2CareAboutPlayerController())
{
    UScriptStruct local_6 = FCS_EcosimAIV2CareAboutPlayerController;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEcosimAIV2CareAboutPlayerController_BP(const FECSWorldPtr &inout World, const FCS_EcosimAIV2CareAboutPlayerController &inout DefaultValue = FCS_EcosimAIV2CareAboutPlayerController())
{
    ECSFunc_FCS_EcosimAIV2CareAboutPlayerController::AssignEcosimAIV2CareAboutPlayerController(World, DefaultValue);
    return;
}
FCS_EcosimAIV2CareAboutPlayerController& ModifyEcosimAIV2CareAboutPlayerController(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2CareAboutPlayerController;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EcosimAIV2CareAboutPlayerController& ModifyOrAddEcosimAIV2CareAboutPlayerController(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2CareAboutPlayerController;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EcosimAIV2CareAboutPlayerController& GetEcosimAIV2CareAboutPlayerController(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EcosimAIV2CareAboutPlayerController;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EcosimAIV2CareAboutPlayerController GetEcosimAIV2CareAboutPlayerController_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_EcosimAIV2CareAboutPlayerController __r;
    bValid = false;
    bValid = ECSFunc_FCS_EcosimAIV2CareAboutPlayerController::GetEcosimAIV2CareAboutPlayerController(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_EcosimAIV2CareAboutPlayerController GetDefaultedEcosimAIV2CareAboutPlayerController(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EcosimAIV2CareAboutPlayerController __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EcosimAIV2CareAboutPlayerController);
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
FCS_EcosimAIV2CareAboutPlayerController GetDefaultedEcosimAIV2CareAboutPlayerController_BP(const FECSWorldPtr &inout World)
{
    FCS_EcosimAIV2CareAboutPlayerController __r;
    return __r;
}
UFUNCTION()
bool RemoveEcosimAIV2CareAboutPlayerController(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EcosimAIV2CareAboutPlayerController);
}
}
void __MonitorEcosimAIV2CareAboutPlayerControllerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EcosimAIV2CareAboutPlayerController, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2CareAboutPlayerControllerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EcosimAIV2CareAboutPlayerController, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEcosimAIV2CareAboutPlayerControllerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EcosimAIV2CareAboutPlayerController, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_EcosimAIV2SyncSpeakToAndOptionInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_EcosimAIV2SyncSpeakToAndOptionInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_EcosimAIV2SyncSpeakToAndOptionInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_EcosimAIV2SyncSpeakToAndOptionInfo
{
int __IndexOf_HasSpeakToAndOptionPlayerEntityList()
{
    return 0;
}
int __IndexOf_CurrentSpeakToEntity()
{
    return 1;
}
}

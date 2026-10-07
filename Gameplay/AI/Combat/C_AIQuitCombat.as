
namespace __INTENRAL_FC_AIQuitCombatCheck_NS
{
    const TECSComponentDerivedPtr<FC_AIQuitCombatCheck> DerivedPtr = TECSComponentDerivedPtr<FC_AIQuitCombatCheck>();
    const FC_AIQuitCombatCheck DefaultValue = FC_AIQuitCombatCheck();
}
namespace __INTENRAL_FC_AIReturnToHomeTag_NS
{
    const TECSComponentDerivedPtr<FC_AIReturnToHomeTag> DerivedPtr = TECSComponentDerivedPtr<FC_AIReturnToHomeTag>();
    const FC_AIReturnToHomeTag DefaultValue = FC_AIReturnToHomeTag();
}
namespace __INTENRAL_FC_AIMuteCombat_NS
{
    const TECSComponentDerivedPtr<FC_AIMuteCombat> DerivedPtr = TECSComponentDerivedPtr<FC_AIMuteCombat>();
    const FC_AIMuteCombat DefaultValue = FC_AIMuteCombat();
}
namespace __INTENRAL_FC_AIMuteCombatPendingTag_NS
{
    const TECSComponentDerivedPtr<FC_AIMuteCombatPendingTag> DerivedPtr = TECSComponentDerivedPtr<FC_AIMuteCombatPendingTag>();
    const FC_AIMuteCombatPendingTag DefaultValue = FC_AIMuteCombatPendingTag();
}
namespace __INTENRAL_FC_AIMuteBeAITarget_NS
{
    const TECSComponentDerivedPtr<FC_AIMuteBeAITarget> DerivedPtr = TECSComponentDerivedPtr<FC_AIMuteBeAITarget>();
    const FC_AIMuteBeAITarget DefaultValue = FC_AIMuteBeAITarget();
}
namespace __INTENRAL_FC_AIResumeCombatTimer_NS
{
    const TECSComponentDerivedPtr<FC_AIResumeCombatTimer> DerivedPtr = TECSComponentDerivedPtr<FC_AIResumeCombatTimer>();
    const FC_AIResumeCombatTimer DefaultValue = FC_AIResumeCombatTimer();
}
namespace __INTENRAL_FC_AIQuitCombatClearDeferTag_NS
{
    const TECSComponentDerivedPtr<FC_AIQuitCombatClearDeferTag> DerivedPtr = TECSComponentDerivedPtr<FC_AIQuitCombatClearDeferTag>();
    const FC_AIQuitCombatClearDeferTag DefaultValue = FC_AIQuitCombatClearDeferTag();
}
namespace __INTENRAL_FC_AIQuitCombatFixedFlockAnchor_NS
{
    const TECSComponentDerivedPtr<FC_AIQuitCombatFixedFlockAnchor> DerivedPtr = TECSComponentDerivedPtr<FC_AIQuitCombatFixedFlockAnchor>();
    const FC_AIQuitCombatFixedFlockAnchor DefaultValue = FC_AIQuitCombatFixedFlockAnchor();
}
namespace __INTENRAL_FC_AIQuitCombatRuleOverride_NS
{
    const TECSComponentDerivedPtr<FC_AIQuitCombatRuleOverride> DerivedPtr = TECSComponentDerivedPtr<FC_AIQuitCombatRuleOverride>();
    const FC_AIQuitCombatRuleOverride DefaultValue = FC_AIQuitCombatRuleOverride();
}
namespace __INTENRAL_FC_AIQuitCombatInfo_NS
{
    const TECSComponentDerivedPtr<FC_AIQuitCombatInfo> DerivedPtr = TECSComponentDerivedPtr<FC_AIQuitCombatInfo>();
    const FC_AIQuitCombatInfo DefaultValue = FC_AIQuitCombatInfo();
}
namespace __INTENRAL_FCE_AIEnterCombatArea_NS
{
    const TECSEventDerivedPtr<FCE_AIEnterCombatArea> DerivedPtr = TECSEventDerivedPtr<FCE_AIEnterCombatArea>();
}
namespace __INTENRAL_FCE_AIExitCombatArea_NS
{
    const TECSEventDerivedPtr<FCE_AIExitCombatArea> DerivedPtr = TECSEventDerivedPtr<FCE_AIExitCombatArea>();

}
struct FC_AIQuitCombatCheck : FECSComponent
{
    UPROPERTY()
    FFPTime CheckStartTime;

    FC_AIQuitCombatCheck()
    {
        return;
    }
}

struct FC_AIReturnToHomeTag : FECSComponent
{
    FC_AIReturnToHomeTag()
    {
        return;
    }
}

struct FCE_AIEnterCombatArea : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity CombatAreaEntity;

    FCE_AIEnterCombatArea()
    {
        return;
    }
}

struct FCE_AIExitCombatArea : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity CombatAreaEntity;

    FCE_AIExitCombatArea()
    {
        return;
    }
}

struct FC_AIMuteCombat : FECSComponent
{
    UPROPERTY()
    TSet<FName> MuteSource;

    FC_AIMuteCombat()
    {
        return;
    }
}

struct FC_AIMuteCombatPendingTag : FECSComponent
{
    FC_AIMuteCombatPendingTag()
    {
        return;
    }
}

struct FC_AIMuteBeAITarget : FECSComponent
{
    UPROPERTY()
    TSet<FName> MuteSource;

    FC_AIMuteBeAITarget()
    {
        return;
    }
}

struct FC_AIResumeCombatTimer : FECSComponent
{
    UPROPERTY()
    FFPTime ResumeCombatTime;

    FC_AIResumeCombatTimer()
    {
        return;
    }
}

struct FC_AIQuitCombatClearDeferTag : FECSComponent
{
    FC_AIQuitCombatClearDeferTag()
    {
        return;
    }
}

struct FC_AIQuitCombatFixedFlockAnchor : FECSComponent
{
    UPROPERTY()
    FVector Position;

    FC_AIQuitCombatFixedFlockAnchor()
    {
        return;
    }
}

struct FC_AIQuitCombatRuleOverride : FECSComponent
{
    UPROPERTY()
    EAIQuitCombatRule OverrideRule = EAIQuitCombatRule(0);


}

struct FC_AIQuitCombatInfo : FECSComponent
{
    UPROPERTY()
    bool bNeedReturnToHome = false;
    UPROPERTY()
    bool bHasAnchorPosition = false;
    UPROPERTY()
    bool bHasHomeLocation = false;
    UPROPERTY()
    FVector HomeLocation = FVector::ZeroVector;
    UPROPERTY()
    FECSEntity HomeResource;
    UPROPERTY()
    FECSEntity TargetCombatArea;
    UPROPERTY()
    FVector AnchorPosition = FVector::ZeroVector;


    void Reset()
    {
        this.bNeedReturnToHome = false;
        this.bHasAnchorPosition = false;
        this.bHasHomeLocation = false;
        this.HomeResource = FECSEntity();
        this.HomeLocation = FVector::ZeroVector;
        this.TargetCombatArea = FECSEntity();
        this.AnchorPosition = FVector::ZeroVector;
        return;
    }
}

namespace ECSFunc_FC_AIQuitCombatCheck
{
UFUNCTION()
bool HasAIQuitCombatCheck(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatCheck);
}
FC_AIQuitCombatCheck& AssignAIQuitCombatCheck(const FECSEntity &inout Entity, const FC_AIQuitCombatCheck &inout DefaultValue = FC_AIQuitCombatCheck())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatCheck, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIQuitCombatCheck_BP(const FECSEntity &inout Entity, const FC_AIQuitCombatCheck &inout DefaultValue = FC_AIQuitCombatCheck())
{
    ECSFunc_FC_AIQuitCombatCheck::AssignAIQuitCombatCheck(Entity, DefaultValue);
    return;
}
FC_AIQuitCombatCheck& ModifyAIQuitCombatCheck(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatCheck));
    return local_12.GetComp();
}
FC_AIQuitCombatCheck& ModifyOrAddAIQuitCombatCheck(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatCheck));
    return local_12.GetComp();
}
const FC_AIQuitCombatCheck& GetAIQuitCombatCheck(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatCheck));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIQuitCombatCheck GetAIQuitCombatCheck_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AIQuitCombatCheck __r;
    bValid = false;
    bValid = ECSFunc_FC_AIQuitCombatCheck::GetAIQuitCombatCheck(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AIQuitCombatCheck GetDefaultedAIQuitCombatCheck(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIQuitCombatCheck __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatCheck);
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
FC_AIQuitCombatCheck GetDefaultedAIQuitCombatCheck_BP(const FECSEntity &inout Entity)
{
    FC_AIQuitCombatCheck __r;
    return __r;
}
UFUNCTION()
bool RemoveAIQuitCombatCheck(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatCheck);
}
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatCheckOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIQuitCombatCheck, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatCheckOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIQuitCombatCheck, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatCheckOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIQuitCombatCheck, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatCheckOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIQuitCombatCheck, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatCheckOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIQuitCombatCheck, bFixedFrame, bMustHandleAll);
}
void __MonitorAIQuitCombatCheckLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIQuitCombatCheck, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIQuitCombatCheckActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIQuitCombatCheck, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIQuitCombatCheckModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIQuitCombatCheck, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIReturnToHomeTag
{
UFUNCTION()
bool HasAIReturnToHomeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIReturnToHomeTag);
}
FC_AIReturnToHomeTag& AssignAIReturnToHomeTag(const FECSEntity &inout Entity, const FC_AIReturnToHomeTag &inout DefaultValue = FC_AIReturnToHomeTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIReturnToHomeTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIReturnToHomeTag_BP(const FECSEntity &inout Entity, const FC_AIReturnToHomeTag &inout DefaultValue = FC_AIReturnToHomeTag())
{
    ECSFunc_FC_AIReturnToHomeTag::AssignAIReturnToHomeTag(Entity, DefaultValue);
    return;
}
FC_AIReturnToHomeTag& ModifyAIReturnToHomeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIReturnToHomeTag));
    return local_12.GetComp();
}
FC_AIReturnToHomeTag& ModifyOrAddAIReturnToHomeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIReturnToHomeTag));
    return local_12.GetComp();
}
const FC_AIReturnToHomeTag& GetAIReturnToHomeTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIReturnToHomeTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIReturnToHomeTag GetAIReturnToHomeTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIReturnToHomeTag& local_4 = ECSFunc_FC_AIReturnToHomeTag::GetAIReturnToHomeTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIReturnToHomeTag();
}
const FC_AIReturnToHomeTag GetDefaultedAIReturnToHomeTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIReturnToHomeTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIReturnToHomeTag);
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
FC_AIReturnToHomeTag GetDefaultedAIReturnToHomeTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIReturnToHomeTag::GetDefaultedAIReturnToHomeTag(Entity);
}
UFUNCTION()
bool RemoveAIReturnToHomeTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIReturnToHomeTag);
}
}
FECSMonitorRuntimeView __GetMonitorAIReturnToHomeTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIReturnToHomeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIReturnToHomeTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIReturnToHomeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIReturnToHomeTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIReturnToHomeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIReturnToHomeTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIReturnToHomeTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIReturnToHomeTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIReturnToHomeTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAIReturnToHomeTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIReturnToHomeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIReturnToHomeTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIReturnToHomeTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIReturnToHomeTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIReturnToHomeTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIMuteCombat
{
UFUNCTION()
bool HasAIMuteCombat(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIMuteCombat);
}
FC_AIMuteCombat& AssignAIMuteCombat(const FECSEntity &inout Entity, const FC_AIMuteCombat &inout DefaultValue = FC_AIMuteCombat())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIMuteCombat, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIMuteCombat_BP(const FECSEntity &inout Entity, const FC_AIMuteCombat &inout DefaultValue = FC_AIMuteCombat())
{
    ECSFunc_FC_AIMuteCombat::AssignAIMuteCombat(Entity, DefaultValue);
    return;
}
FC_AIMuteCombat& ModifyAIMuteCombat(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIMuteCombat));
    return local_12.GetComp();
}
FC_AIMuteCombat& ModifyOrAddAIMuteCombat(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIMuteCombat));
    return local_12.GetComp();
}
const FC_AIMuteCombat& GetAIMuteCombat(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIMuteCombat));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIMuteCombat GetAIMuteCombat_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AIMuteCombat __r;
    bValid = false;
    bValid = ECSFunc_FC_AIMuteCombat::GetAIMuteCombat(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AIMuteCombat GetDefaultedAIMuteCombat(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIMuteCombat __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIMuteCombat);
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
FC_AIMuteCombat GetDefaultedAIMuteCombat_BP(const FECSEntity &inout Entity)
{
    FC_AIMuteCombat __r;
    return __r;
}
UFUNCTION()
bool RemoveAIMuteCombat(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIMuteCombat);
}
}
FECSMonitorRuntimeView __GetMonitorAIMuteCombatOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIMuteCombat, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIMuteCombatOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIMuteCombat, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIMuteCombatOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIMuteCombat, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIMuteCombatOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIMuteCombat, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIMuteCombatOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIMuteCombat, bFixedFrame, bMustHandleAll);
}
void __MonitorAIMuteCombatLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIMuteCombat, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIMuteCombatActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIMuteCombat, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIMuteCombatModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIMuteCombat, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIMuteCombatPendingTag
{
UFUNCTION()
bool HasAIMuteCombatPendingTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIMuteCombatPendingTag);
}
FC_AIMuteCombatPendingTag& AssignAIMuteCombatPendingTag(const FECSEntity &inout Entity, const FC_AIMuteCombatPendingTag &inout DefaultValue = FC_AIMuteCombatPendingTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIMuteCombatPendingTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIMuteCombatPendingTag_BP(const FECSEntity &inout Entity, const FC_AIMuteCombatPendingTag &inout DefaultValue = FC_AIMuteCombatPendingTag())
{
    ECSFunc_FC_AIMuteCombatPendingTag::AssignAIMuteCombatPendingTag(Entity, DefaultValue);
    return;
}
FC_AIMuteCombatPendingTag& ModifyAIMuteCombatPendingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIMuteCombatPendingTag));
    return local_12.GetComp();
}
FC_AIMuteCombatPendingTag& ModifyOrAddAIMuteCombatPendingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIMuteCombatPendingTag));
    return local_12.GetComp();
}
const FC_AIMuteCombatPendingTag& GetAIMuteCombatPendingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIMuteCombatPendingTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIMuteCombatPendingTag GetAIMuteCombatPendingTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIMuteCombatPendingTag& local_4 = ECSFunc_FC_AIMuteCombatPendingTag::GetAIMuteCombatPendingTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIMuteCombatPendingTag();
}
const FC_AIMuteCombatPendingTag GetDefaultedAIMuteCombatPendingTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIMuteCombatPendingTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIMuteCombatPendingTag);
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
FC_AIMuteCombatPendingTag GetDefaultedAIMuteCombatPendingTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIMuteCombatPendingTag::GetDefaultedAIMuteCombatPendingTag(Entity);
}
UFUNCTION()
bool RemoveAIMuteCombatPendingTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIMuteCombatPendingTag);
}
}
FECSMonitorRuntimeView __GetMonitorAIMuteCombatPendingTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIMuteCombatPendingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIMuteCombatPendingTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIMuteCombatPendingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIMuteCombatPendingTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIMuteCombatPendingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIMuteCombatPendingTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIMuteCombatPendingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIMuteCombatPendingTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIMuteCombatPendingTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAIMuteCombatPendingTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIMuteCombatPendingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIMuteCombatPendingTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIMuteCombatPendingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIMuteCombatPendingTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIMuteCombatPendingTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIMuteBeAITarget
{
UFUNCTION()
bool HasAIMuteBeAITarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIMuteBeAITarget);
}
FC_AIMuteBeAITarget& AssignAIMuteBeAITarget(const FECSEntity &inout Entity, const FC_AIMuteBeAITarget &inout DefaultValue = FC_AIMuteBeAITarget())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIMuteBeAITarget, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIMuteBeAITarget_BP(const FECSEntity &inout Entity, const FC_AIMuteBeAITarget &inout DefaultValue = FC_AIMuteBeAITarget())
{
    ECSFunc_FC_AIMuteBeAITarget::AssignAIMuteBeAITarget(Entity, DefaultValue);
    return;
}
FC_AIMuteBeAITarget& ModifyAIMuteBeAITarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIMuteBeAITarget));
    return local_12.GetComp();
}
FC_AIMuteBeAITarget& ModifyOrAddAIMuteBeAITarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIMuteBeAITarget));
    return local_12.GetComp();
}
const FC_AIMuteBeAITarget& GetAIMuteBeAITarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIMuteBeAITarget));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIMuteBeAITarget GetAIMuteBeAITarget_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AIMuteBeAITarget __r;
    bValid = false;
    bValid = ECSFunc_FC_AIMuteBeAITarget::GetAIMuteBeAITarget(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AIMuteBeAITarget GetDefaultedAIMuteBeAITarget(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIMuteBeAITarget __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIMuteBeAITarget);
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
FC_AIMuteBeAITarget GetDefaultedAIMuteBeAITarget_BP(const FECSEntity &inout Entity)
{
    FC_AIMuteBeAITarget __r;
    return __r;
}
UFUNCTION()
bool RemoveAIMuteBeAITarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIMuteBeAITarget);
}
}
FECSMonitorRuntimeView __GetMonitorAIMuteBeAITargetOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIMuteBeAITarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIMuteBeAITargetOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIMuteBeAITarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIMuteBeAITargetOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIMuteBeAITarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIMuteBeAITargetOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIMuteBeAITarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIMuteBeAITargetOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIMuteBeAITarget, bFixedFrame, bMustHandleAll);
}
void __MonitorAIMuteBeAITargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIMuteBeAITarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIMuteBeAITargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIMuteBeAITarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIMuteBeAITargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIMuteBeAITarget, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIResumeCombatTimer
{
UFUNCTION()
bool HasAIResumeCombatTimer(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIResumeCombatTimer);
}
FC_AIResumeCombatTimer& AssignAIResumeCombatTimer(const FECSEntity &inout Entity, const FC_AIResumeCombatTimer &inout DefaultValue = FC_AIResumeCombatTimer())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIResumeCombatTimer, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIResumeCombatTimer_BP(const FECSEntity &inout Entity, const FC_AIResumeCombatTimer &inout DefaultValue = FC_AIResumeCombatTimer())
{
    ECSFunc_FC_AIResumeCombatTimer::AssignAIResumeCombatTimer(Entity, DefaultValue);
    return;
}
FC_AIResumeCombatTimer& ModifyAIResumeCombatTimer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIResumeCombatTimer));
    return local_12.GetComp();
}
FC_AIResumeCombatTimer& ModifyOrAddAIResumeCombatTimer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIResumeCombatTimer));
    return local_12.GetComp();
}
const FC_AIResumeCombatTimer& GetAIResumeCombatTimer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIResumeCombatTimer));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIResumeCombatTimer GetAIResumeCombatTimer_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AIResumeCombatTimer __r;
    bValid = false;
    bValid = ECSFunc_FC_AIResumeCombatTimer::GetAIResumeCombatTimer(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AIResumeCombatTimer GetDefaultedAIResumeCombatTimer(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIResumeCombatTimer __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIResumeCombatTimer);
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
FC_AIResumeCombatTimer GetDefaultedAIResumeCombatTimer_BP(const FECSEntity &inout Entity)
{
    FC_AIResumeCombatTimer __r;
    return __r;
}
UFUNCTION()
bool RemoveAIResumeCombatTimer(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIResumeCombatTimer);
}
}
FECSMonitorRuntimeView __GetMonitorAIResumeCombatTimerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIResumeCombatTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIResumeCombatTimerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIResumeCombatTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIResumeCombatTimerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIResumeCombatTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIResumeCombatTimerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIResumeCombatTimer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIResumeCombatTimerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIResumeCombatTimer, bFixedFrame, bMustHandleAll);
}
void __MonitorAIResumeCombatTimerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIResumeCombatTimer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIResumeCombatTimerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIResumeCombatTimer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIResumeCombatTimerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIResumeCombatTimer, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIQuitCombatClearDeferTag
{
UFUNCTION()
bool HasAIQuitCombatClearDeferTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatClearDeferTag);
}
FC_AIQuitCombatClearDeferTag& AssignAIQuitCombatClearDeferTag(const FECSEntity &inout Entity, const FC_AIQuitCombatClearDeferTag &inout DefaultValue = FC_AIQuitCombatClearDeferTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatClearDeferTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIQuitCombatClearDeferTag_BP(const FECSEntity &inout Entity, const FC_AIQuitCombatClearDeferTag &inout DefaultValue = FC_AIQuitCombatClearDeferTag())
{
    ECSFunc_FC_AIQuitCombatClearDeferTag::AssignAIQuitCombatClearDeferTag(Entity, DefaultValue);
    return;
}
FC_AIQuitCombatClearDeferTag& ModifyAIQuitCombatClearDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatClearDeferTag));
    return local_12.GetComp();
}
FC_AIQuitCombatClearDeferTag& ModifyOrAddAIQuitCombatClearDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatClearDeferTag));
    return local_12.GetComp();
}
const FC_AIQuitCombatClearDeferTag& GetAIQuitCombatClearDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatClearDeferTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIQuitCombatClearDeferTag GetAIQuitCombatClearDeferTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIQuitCombatClearDeferTag& local_4 = ECSFunc_FC_AIQuitCombatClearDeferTag::GetAIQuitCombatClearDeferTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIQuitCombatClearDeferTag();
}
const FC_AIQuitCombatClearDeferTag GetDefaultedAIQuitCombatClearDeferTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIQuitCombatClearDeferTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatClearDeferTag);
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
FC_AIQuitCombatClearDeferTag GetDefaultedAIQuitCombatClearDeferTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIQuitCombatClearDeferTag::GetDefaultedAIQuitCombatClearDeferTag(Entity);
}
UFUNCTION()
bool RemoveAIQuitCombatClearDeferTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatClearDeferTag);
}
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatClearDeferTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIQuitCombatClearDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatClearDeferTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIQuitCombatClearDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatClearDeferTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIQuitCombatClearDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatClearDeferTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIQuitCombatClearDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatClearDeferTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIQuitCombatClearDeferTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAIQuitCombatClearDeferTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIQuitCombatClearDeferTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIQuitCombatClearDeferTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIQuitCombatClearDeferTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIQuitCombatClearDeferTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIQuitCombatClearDeferTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIQuitCombatFixedFlockAnchor
{
UFUNCTION()
bool HasAIQuitCombatFixedFlockAnchor(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatFixedFlockAnchor);
}
FC_AIQuitCombatFixedFlockAnchor& AssignAIQuitCombatFixedFlockAnchor(const FECSEntity &inout Entity, const FC_AIQuitCombatFixedFlockAnchor &inout DefaultValue = FC_AIQuitCombatFixedFlockAnchor())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatFixedFlockAnchor, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIQuitCombatFixedFlockAnchor_BP(const FECSEntity &inout Entity, const FC_AIQuitCombatFixedFlockAnchor &inout DefaultValue = FC_AIQuitCombatFixedFlockAnchor())
{
    ECSFunc_FC_AIQuitCombatFixedFlockAnchor::AssignAIQuitCombatFixedFlockAnchor(Entity, DefaultValue);
    return;
}
FC_AIQuitCombatFixedFlockAnchor& ModifyAIQuitCombatFixedFlockAnchor(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatFixedFlockAnchor));
    return local_12.GetComp();
}
FC_AIQuitCombatFixedFlockAnchor& ModifyOrAddAIQuitCombatFixedFlockAnchor(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatFixedFlockAnchor));
    return local_12.GetComp();
}
const FC_AIQuitCombatFixedFlockAnchor& GetAIQuitCombatFixedFlockAnchor(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatFixedFlockAnchor));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIQuitCombatFixedFlockAnchor GetAIQuitCombatFixedFlockAnchor_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIQuitCombatFixedFlockAnchor& local_4 = ECSFunc_FC_AIQuitCombatFixedFlockAnchor::GetAIQuitCombatFixedFlockAnchor(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIQuitCombatFixedFlockAnchor();
}
const FC_AIQuitCombatFixedFlockAnchor GetDefaultedAIQuitCombatFixedFlockAnchor(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIQuitCombatFixedFlockAnchor __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatFixedFlockAnchor);
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
FC_AIQuitCombatFixedFlockAnchor GetDefaultedAIQuitCombatFixedFlockAnchor_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIQuitCombatFixedFlockAnchor::GetDefaultedAIQuitCombatFixedFlockAnchor(Entity);
}
UFUNCTION()
bool RemoveAIQuitCombatFixedFlockAnchor(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatFixedFlockAnchor);
}
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatFixedFlockAnchorOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIQuitCombatFixedFlockAnchor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatFixedFlockAnchorOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIQuitCombatFixedFlockAnchor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatFixedFlockAnchorOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIQuitCombatFixedFlockAnchor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatFixedFlockAnchorOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIQuitCombatFixedFlockAnchor, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatFixedFlockAnchorOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIQuitCombatFixedFlockAnchor, bFixedFrame, bMustHandleAll);
}
void __MonitorAIQuitCombatFixedFlockAnchorLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIQuitCombatFixedFlockAnchor, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIQuitCombatFixedFlockAnchorActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIQuitCombatFixedFlockAnchor, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIQuitCombatFixedFlockAnchorModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIQuitCombatFixedFlockAnchor, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIQuitCombatRuleOverride
{
UFUNCTION()
bool HasAIQuitCombatRuleOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatRuleOverride);
}
FC_AIQuitCombatRuleOverride& AssignAIQuitCombatRuleOverride(const FECSEntity &inout Entity, const FC_AIQuitCombatRuleOverride &inout DefaultValue = FC_AIQuitCombatRuleOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatRuleOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIQuitCombatRuleOverride_BP(const FECSEntity &inout Entity, const FC_AIQuitCombatRuleOverride &inout DefaultValue = FC_AIQuitCombatRuleOverride())
{
    ECSFunc_FC_AIQuitCombatRuleOverride::AssignAIQuitCombatRuleOverride(Entity, DefaultValue);
    return;
}
FC_AIQuitCombatRuleOverride& ModifyAIQuitCombatRuleOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatRuleOverride));
    return local_12.GetComp();
}
FC_AIQuitCombatRuleOverride& ModifyOrAddAIQuitCombatRuleOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatRuleOverride));
    return local_12.GetComp();
}
const FC_AIQuitCombatRuleOverride& GetAIQuitCombatRuleOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatRuleOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIQuitCombatRuleOverride GetAIQuitCombatRuleOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIQuitCombatRuleOverride& local_4 = ECSFunc_FC_AIQuitCombatRuleOverride::GetAIQuitCombatRuleOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIQuitCombatRuleOverride();
}
const FC_AIQuitCombatRuleOverride GetDefaultedAIQuitCombatRuleOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIQuitCombatRuleOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatRuleOverride);
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
FC_AIQuitCombatRuleOverride GetDefaultedAIQuitCombatRuleOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIQuitCombatRuleOverride::GetDefaultedAIQuitCombatRuleOverride(Entity);
}
UFUNCTION()
bool RemoveAIQuitCombatRuleOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatRuleOverride);
}
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatRuleOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIQuitCombatRuleOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatRuleOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIQuitCombatRuleOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatRuleOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIQuitCombatRuleOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatRuleOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIQuitCombatRuleOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatRuleOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIQuitCombatRuleOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorAIQuitCombatRuleOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIQuitCombatRuleOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIQuitCombatRuleOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIQuitCombatRuleOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIQuitCombatRuleOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIQuitCombatRuleOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIQuitCombatInfo
{
UFUNCTION()
bool HasAIQuitCombatInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatInfo);
}
FC_AIQuitCombatInfo& AssignAIQuitCombatInfo(const FECSEntity &inout Entity, const FC_AIQuitCombatInfo &inout DefaultValue = FC_AIQuitCombatInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIQuitCombatInfo_BP(const FECSEntity &inout Entity, const FC_AIQuitCombatInfo &inout DefaultValue = FC_AIQuitCombatInfo())
{
    ECSFunc_FC_AIQuitCombatInfo::AssignAIQuitCombatInfo(Entity, DefaultValue);
    return;
}
FC_AIQuitCombatInfo& ModifyAIQuitCombatInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatInfo));
    return local_12.GetComp();
}
FC_AIQuitCombatInfo& ModifyOrAddAIQuitCombatInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatInfo));
    return local_12.GetComp();
}
const FC_AIQuitCombatInfo& GetAIQuitCombatInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIQuitCombatInfo GetAIQuitCombatInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AIQuitCombatInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_AIQuitCombatInfo::GetAIQuitCombatInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AIQuitCombatInfo GetDefaultedAIQuitCombatInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIQuitCombatInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatInfo);
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
FC_AIQuitCombatInfo GetDefaultedAIQuitCombatInfo_BP(const FECSEntity &inout Entity)
{
    FC_AIQuitCombatInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveAIQuitCombatInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIQuitCombatInfo);
}
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIQuitCombatInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIQuitCombatInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIQuitCombatInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIQuitCombatInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIQuitCombatInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIQuitCombatInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorAIQuitCombatInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIQuitCombatInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIQuitCombatInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIQuitCombatInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIQuitCombatInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIQuitCombatInfo, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_AIQuitCombatInfo_bNeedReturnToHome(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().bNeedReturnToHome;
    return;
}
void GetEntityBBVar_AIQuitCombatInfo_HomeLocation(const FECSEntity &inout Entity, FVector &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FVector(local_4.opCall().HomeLocation);
    return;
}
void GetEntityBBVar_AIQuitCombatInfo_HomeResource(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().HomeResource);
    return;
}
}

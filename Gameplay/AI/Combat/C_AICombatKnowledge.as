
namespace __INTENRAL_FC_AICombatKnowledge_NS
{
    const TECSComponentDerivedPtr<FC_AICombatKnowledge> DerivedPtr = TECSComponentDerivedPtr<FC_AICombatKnowledge>();
    const FC_AICombatKnowledge DefaultValue = FC_AICombatKnowledge();
}
namespace __INTENRAL_FC_AISpecialCombatTokenReceiver_NS
{
    const TECSComponentDerivedPtr<FC_AISpecialCombatTokenReceiver> DerivedPtr = TECSComponentDerivedPtr<FC_AISpecialCombatTokenReceiver>();
    const FC_AISpecialCombatTokenReceiver DefaultValue = FC_AISpecialCombatTokenReceiver();
}
namespace __INTENRAL_FCE_AISpecialCombatTokenGenerate_NS
{
    const TECSEventDerivedPtr<FCE_AISpecialCombatTokenGenerate> DerivedPtr = TECSEventDerivedPtr<FCE_AISpecialCombatTokenGenerate>();

}
struct FAISpecialCombatTokenHandle
{
    UPROPERTY()
    bool bIsInUsing;
    UPROPERTY()
    uint64 TokenUid;
    UPROPERTY()
    FFPTime TokenExpirationTime;

    FAISpecialCombatTokenHandle()
    {
        this.bIsInUsing = false;
        this.TokenUid = 0;
        return;
    }
    FAISpecialCombatTokenHandle(const TDataObjectPtr<FAISpecialCombatTokenConfig> &inout Config, const FFPTime &inout TimeNow)
    {
        this.TokenUid = Config.GetUniqueID();
        FFPTime local_6 = FFPTime(Config.opArrow().ValidDuration);
        FFPTime local_14;
        if (local_6.opCmp(0.0) >= 0)
        {
            local_14 = (local_6 + TimeNow);
        }
        else
        {
            local_14 = FFPTime(-1);
        }
        this.TokenExpirationTime = local_14;
        return;
    }
    bool IsToken(const TDataObjectPtr<FAISpecialCombatTokenConfig> &inout TokenConfg) const
    {
        return (this.TokenUid == TokenConfg.GetUniqueID());
    }
    bool IsExpired(const FFPTime &inout TimeNow) const
    {
        int local_12;
        bool local_13;
        if (this.TokenUid == 0)
        {
            local_13 = true;
        }
        else
        {
            if (this.TokenExpirationTime.opCmp(0.0) < 0)
            {
                local_12 = 0;
            }
            else
            {
                local_13 = (this.TokenExpirationTime.opCmp(TimeNow) < 0);
                local_12 = local_13;
            }
            local_13 = (local_12 != 0);
        }
        return local_13;
    }
    bool HasToken(const TDataObjectPtr<FAISpecialCombatTokenConfig> &inout TokenConfg, const FFPTime &inout TimeNow) const
    {
        return this.IsToken(TokenConfg) && (this.bIsInUsing || !(this.IsExpired(TimeNow)));
    }
}

struct FC_AICombatKnowledge : FECSComponent
{
    UPROPERTY()
    FAISpecialCombatTokenHandle SpecialToken;
    UPROPERTY()
    TArray<FAISmart_AnyValue> ParamValues;
    UPROPERTY()
    FECSEntityId SpecialTokenSource;

    FC_AICombatKnowledge()
    {
        return;
    }
}

struct FC_AISpecialCombatTokenReceiver : FECSComponent
{
    UPROPERTY()
    TArray<TDataObjectPtr<FAISpecialCombatTokenConfig>> AcceptTokens;

    FC_AISpecialCombatTokenReceiver()
    {
        return;
    }
}

struct FCE_AISpecialCombatTokenGenerate : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<FAISmart_AnyValue> ParamValues;
    UPROPERTY()
    TDataObjectPtr<FAISpecialCombatTokenConfig> TokenConfg;
    UPROPERTY()
    EAISpecialTokenDispatchMode DispatchMode;
    UPROPERTY()
    TArray<FECSEntityId> TargetEntities;


}

namespace ECSFunc_FC_AICombatKnowledge
{
UFUNCTION()
bool HasAICombatKnowledge(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AICombatKnowledge);
}
FC_AICombatKnowledge& AssignAICombatKnowledge(const FECSEntity &inout Entity, const FC_AICombatKnowledge &inout DefaultValue = FC_AICombatKnowledge())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AICombatKnowledge, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAICombatKnowledge_BP(const FECSEntity &inout Entity, const FC_AICombatKnowledge &inout DefaultValue = FC_AICombatKnowledge())
{
    ECSFunc_FC_AICombatKnowledge::AssignAICombatKnowledge(Entity, DefaultValue);
    return;
}
FC_AICombatKnowledge& ModifyAICombatKnowledge(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AICombatKnowledge));
    return local_12.GetComp();
}
FC_AICombatKnowledge& ModifyOrAddAICombatKnowledge(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AICombatKnowledge));
    return local_12.GetComp();
}
const FC_AICombatKnowledge& GetAICombatKnowledge(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AICombatKnowledge));
    return local_12.GetComp();
}
UFUNCTION()
FC_AICombatKnowledge GetAICombatKnowledge_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AICombatKnowledge __r;
    bValid = false;
    bValid = ECSFunc_FC_AICombatKnowledge::GetAICombatKnowledge(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AICombatKnowledge GetDefaultedAICombatKnowledge(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AICombatKnowledge __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AICombatKnowledge);
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
FC_AICombatKnowledge GetDefaultedAICombatKnowledge_BP(const FECSEntity &inout Entity)
{
    FC_AICombatKnowledge __r;
    return __r;
}
UFUNCTION()
bool RemoveAICombatKnowledge(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AICombatKnowledge);
}
}
FECSMonitorRuntimeView __GetMonitorAICombatKnowledgeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AICombatKnowledge, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAICombatKnowledgeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AICombatKnowledge, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAICombatKnowledgeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AICombatKnowledge, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAICombatKnowledgeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AICombatKnowledge, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAICombatKnowledgeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AICombatKnowledge, bFixedFrame, bMustHandleAll);
}
void __MonitorAICombatKnowledgeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AICombatKnowledge, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAICombatKnowledgeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AICombatKnowledge, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAICombatKnowledgeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AICombatKnowledge, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AISpecialCombatTokenReceiver
{
UFUNCTION()
bool HasAISpecialCombatTokenReceiver(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AISpecialCombatTokenReceiver);
}
FC_AISpecialCombatTokenReceiver& AssignAISpecialCombatTokenReceiver(const FECSEntity &inout Entity, const FC_AISpecialCombatTokenReceiver &inout DefaultValue = FC_AISpecialCombatTokenReceiver())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AISpecialCombatTokenReceiver, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAISpecialCombatTokenReceiver_BP(const FECSEntity &inout Entity, const FC_AISpecialCombatTokenReceiver &inout DefaultValue = FC_AISpecialCombatTokenReceiver())
{
    ECSFunc_FC_AISpecialCombatTokenReceiver::AssignAISpecialCombatTokenReceiver(Entity, DefaultValue);
    return;
}
FC_AISpecialCombatTokenReceiver& ModifyAISpecialCombatTokenReceiver(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AISpecialCombatTokenReceiver));
    return local_12.GetComp();
}
FC_AISpecialCombatTokenReceiver& ModifyOrAddAISpecialCombatTokenReceiver(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AISpecialCombatTokenReceiver));
    return local_12.GetComp();
}
const FC_AISpecialCombatTokenReceiver& GetAISpecialCombatTokenReceiver(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AISpecialCombatTokenReceiver));
    return local_12.GetComp();
}
UFUNCTION()
FC_AISpecialCombatTokenReceiver GetAISpecialCombatTokenReceiver_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AISpecialCombatTokenReceiver __r;
    bValid = false;
    bValid = ECSFunc_FC_AISpecialCombatTokenReceiver::GetAISpecialCombatTokenReceiver(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AISpecialCombatTokenReceiver GetDefaultedAISpecialCombatTokenReceiver(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AISpecialCombatTokenReceiver __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AISpecialCombatTokenReceiver);
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
FC_AISpecialCombatTokenReceiver GetDefaultedAISpecialCombatTokenReceiver_BP(const FECSEntity &inout Entity)
{
    FC_AISpecialCombatTokenReceiver __r;
    return __r;
}
UFUNCTION()
bool RemoveAISpecialCombatTokenReceiver(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AISpecialCombatTokenReceiver);
}
}
FECSMonitorRuntimeView __GetMonitorAISpecialCombatTokenReceiverOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AISpecialCombatTokenReceiver, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAISpecialCombatTokenReceiverOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AISpecialCombatTokenReceiver, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAISpecialCombatTokenReceiverOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AISpecialCombatTokenReceiver, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAISpecialCombatTokenReceiverOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AISpecialCombatTokenReceiver, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAISpecialCombatTokenReceiverOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AISpecialCombatTokenReceiver, bFixedFrame, bMustHandleAll);
}
void __MonitorAISpecialCombatTokenReceiverLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AISpecialCombatTokenReceiver, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAISpecialCombatTokenReceiverActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AISpecialCombatTokenReceiver, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAISpecialCombatTokenReceiverModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AISpecialCombatTokenReceiver, bFixedFrame, Details);
    return;
}

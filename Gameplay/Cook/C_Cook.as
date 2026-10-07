
enum ECookState
{
    Idle,
    Ready,
    Cooking,
}

namespace Cook
{
    const int MaxFoodCostCount = 4;
    const int MaxCookderCount = 4;
}
namespace __INTENRAL_FC_CookConfig_NS
{
    const TECSComponentDerivedPtr<FC_CookConfig> DerivedPtr = TECSComponentDerivedPtr<FC_CookConfig>();
    const FC_CookConfig DefaultValue = FC_CookConfig();
}
namespace __INTENRAL_FC_CookPropAutoReady_NS
{
    const TECSComponentDerivedPtr<FC_CookPropAutoReady> DerivedPtr = TECSComponentDerivedPtr<FC_CookPropAutoReady>();
    const FC_CookPropAutoReady DefaultValue = FC_CookPropAutoReady();
}
namespace __INTENRAL_FC_CookPropForPresentation_NS
{
    const TECSComponentDerivedPtr<FC_CookPropForPresentation> DerivedPtr = TECSComponentDerivedPtr<FC_CookPropForPresentation>();
    const FC_CookPropForPresentation DefaultValue = FC_CookPropForPresentation();
}
namespace __INTENRAL_FC_CookProp_NS
{
    const TECSComponentDerivedPtr<FC_CookProp> DerivedPtr = TECSComponentDerivedPtr<FC_CookProp>();
    const FC_CookProp DefaultValue = FC_CookProp();
}
namespace __INTENRAL_FCE_PushCostFood_NS
{
    const TECSEventDerivedPtr<FCE_PushCostFood> DerivedPtr = TECSEventDerivedPtr<FCE_PushCostFood>();
}
namespace __INTENRAL_FCE_PopCostFood_NS
{
    const TECSEventDerivedPtr<FCE_PopCostFood> DerivedPtr = TECSEventDerivedPtr<FCE_PopCostFood>();
}
namespace __INTENRAL_FCE_PlayerCookReady_NS
{
    const TECSEventDerivedPtr<FCE_PlayerCookReady> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerCookReady>();
}
namespace __INTENRAL_FCE_ExitCook_NS
{
    const TECSEventDerivedPtr<FCE_ExitCook> DerivedPtr = TECSEventDerivedPtr<FCE_ExitCook>();
}
namespace __INTENRAL_FCE_CookConfirmMetaBuff_NS
{
    const TECSEventDerivedPtr<FCE_CookConfirmMetaBuff> DerivedPtr = TECSEventDerivedPtr<FCE_CookConfirmMetaBuff>();
}
namespace __INTENRAL_FCE_CookCancelMetaBuff_NS
{
    const TECSEventDerivedPtr<FCE_CookCancelMetaBuff> DerivedPtr = TECSEventDerivedPtr<FCE_CookCancelMetaBuff>();
}
namespace __INTENRAL_FCE_CookReset_NS
{
    const TECSEventDerivedPtr<FCE_CookReset> DerivedPtr = TECSEventDerivedPtr<FCE_CookReset>();
}
namespace __INTENRAL_FCE_CookAutoReadyTip_NS
{
    const TECSEventDerivedPtr<FCE_CookAutoReadyTip> DerivedPtr = TECSEventDerivedPtr<FCE_CookAutoReadyTip>();
}
namespace __INTENRAL_FCE_CookAllReady_NS
{
    const TECSEventDerivedPtr<FCE_CookAllReady> DerivedPtr = TECSEventDerivedPtr<FCE_CookAllReady>();
}
namespace __INTENRAL_FCE_CookFinisehd_NS
{
    const TECSEventDerivedPtr<FCE_CookFinisehd> DerivedPtr = TECSEventDerivedPtr<FCE_CookFinisehd>();
}
namespace __INTENRAL_FCE_CookEventForPresentation_NS
{
    const TECSEventDerivedPtr<FCE_CookEventForPresentation> DerivedPtr = TECSEventDerivedPtr<FCE_CookEventForPresentation>();

}
struct FC_CookConfig : FECSComponent
{
    UPROPERTY()
    int MaxCookerCount = 4;
    UPROPERTY()
    TSoftClassPtr<AFXActor> CookStartFX;
    UPROPERTY()
    FVector CookStartFXLOcationOffset = FVector::ZeroVector;


}

struct FCookPlayerCostItem
{
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_CookCostItem;
    UPROPERTY()
    FFPTime m_PushTime;

    FCookPlayerCostItem()
    {
        return;
    }
    const TDataObjectPtr<FItemConfig> GetCookCostItem() const property
    {
        const TDataObjectPtr<FItemConfig> __r;
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetCookCostItem() property
    {
        TDataObjectPtr<FItemConfig> __r;
        return __r;
    }
    void SetCookCostItem(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    const FFPTime GetPushTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetPushTime() property
    {
        FFPTime __r;
        return __r;
    }
    void SetPushTime(const FFPTime &inout __Value) property
    {
        this.m_PushTime = __Value;
        return;
    }
}

struct FCookPlayerData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_PlayerEntity;
    UPROPERTY()
    bool m_bPlayerReady;
    UPROPERTY()
    TArray<FCookPlayerCostItem> m_CookCostItems;
    UPROPERTY()
    bool m_bCancelMetaBuff;

    FCookPlayerData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCookPlayerData(const FCookPlayerData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCookPlayerData opAssign(const FCookPlayerData &inout Other)
    {
        FCookPlayerData __r;
        this.SetPlayerEntity(Other.GetPlayerEntity());
        this.SetbPlayerReady(Other.GetbPlayerReady());
        this.SetCookCostItems(Other.GetCookCostItems());
        this.SetbCancelMetaBuff(Other.GetbCancelMetaBuff());
        return __r;
    }
    FECSEntity GetPlayerEntity() const property
    {
        FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_PlayerEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPlayerEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PlayerEntity = __Value;
        return;
    }
    bool GetbPlayerReady() const property
    {
        return this.m_bPlayerReady;
    }
    void SetbPlayerReady(const bool __Value) property
    {
        if (!(this.m_bPlayerReady) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bPlayerReady = __Value;
        return;
    }
    const TArray<FCookPlayerCostItem> GetCookCostItems() const property
    {
        const TArray<FCookPlayerCostItem> __r;
        return __r;
    }
    TArray<FCookPlayerCostItem> GetModify_CookCostItems() property
    {
        TArray<FCookPlayerCostItem> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetCookCostItems(const TArray<FCookPlayerCostItem> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_CookCostItems = __Value;
        return;
    }
    bool GetbCancelMetaBuff() const property
    {
        return this.m_bCancelMetaBuff;
    }
    void SetbCancelMetaBuff(const bool __Value) property
    {
        if (!(this.m_bCancelMetaBuff) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bCancelMetaBuff = __Value;
        return;
    }
}

struct FC_CookPropAutoReady : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_AutoReadyTime;

    FC_CookPropAutoReady()
    {
        this.m_AutoReadyTime = -1;
        this.__InitDirtyFlags();
        return;
    }
    FC_CookPropAutoReady(const FC_CookPropAutoReady &inout Other)
    {
        this.m_AutoReadyTime = -1;
        this.__InitDirtyFlags();
        this.m_AutoReadyTime = Other.m_AutoReadyTime;
        return;
    }
    FC_CookPropAutoReady opAssign(const FC_CookPropAutoReady &inout Other)
    {
        FC_CookPropAutoReady __r;
        this.SetAutoReadyTime(Other.GetAutoReadyTime());
        return __r;
    }
    const FFPTime GetAutoReadyTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_AutoReadyTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAutoReadyTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AutoReadyTime = __Value;
        return;
    }
}

struct FC_CookPropForPresentation : FECSComponent
{
    UPROPERTY()
    FECSEntity StartCookFX;

    FC_CookPropForPresentation()
    {
        return;
    }
}

struct FC_CookProp : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    ECookState m_CookState;
    UPROPERTY()
    TArray<FCookPlayerData> m_CookPlayerDatas;
    UPROPERTY()
    int m_PendingConfirmCount;
    UPROPERTY()
    int m_ConfirmedSuccessCount;
    UPROPERTY()
    int m_ConfirmedFailCount;
    UPROPERTY()
    TDataObjectPtr<FFoodProductConfig> m_PendingProductFood;
    UPROPERTY()
    TArray<TDataObjectPtr<FGameplayModifierConfig>> m_PendingModifiers;
    UPROPERTY()
    uint m_CurrentSessionId;

    FC_CookProp()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CookProp(const FC_CookProp &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CookProp opAssign(const FC_CookProp &inout Other)
    {
        FC_CookProp __r;
        this.SetCookState(Other.GetCookState());
        this.SetCookPlayerDatas(Other.GetCookPlayerDatas());
        this.SetPendingConfirmCount(Other.GetPendingConfirmCount());
        this.SetConfirmedSuccessCount(Other.GetConfirmedSuccessCount());
        this.SetConfirmedFailCount(Other.GetConfirmedFailCount());
        this.SetPendingProductFood(Other.GetPendingProductFood());
        this.SetPendingModifiers(Other.GetPendingModifiers());
        this.SetCurrentSessionId(Other.GetCurrentSessionId());
        return __r;
    }
    void ResizeCookPlayerDatas(const int MaxSize)
    {
        while (this.GetCookPlayerDatas().Num() < MaxSize)
        {
            FCookPlayerData local_16;
            this.GetModify_CookPlayerDatas().Add(local_16);
        }
        return;
    }
    bool PushFoodCostItem(const int PlayerIndex, const TDataObjectPtr<FItemConfig> &inout CostItem, const FFPTime &inout CurTime, const int ClientItemNum)
    {
        if (!(CostItem))
        {
            XError(ELog(46), "[PushFoodCostItem]: CostItem is null");
            return false;
        }
        int local_3 = 0;
        for (auto& local_18 : this.GetCookPlayerDatas())
        {
            local_3 = local_3 + local_18.GetCookCostItems().Num();
        }
        if (local_3 < 4)
        {
            bool local_37;
            int local_19 = 1;
            for (auto& local_34 : this.GetCookPlayerDatas()[PlayerIndex].GetCookCostItems())
            {
                if (!(local_34.GetCookCostItem()))
                {
                    continue;
                }
                if (0 == 0)
                {
                    local_19 = local_19 + 1;
                }
            }
            local_37 = false;
            if (::ItemConfigUtils::IsGSItem(CostItem))
            {
                local_37 = (ClientItemNum >= local_19);
            }
            else
            {
                FECSEntity local_46 = ::FASCommonUtils::GetUniquePlayerEntity(this.GetCookPlayerDatas()[PlayerIndex].GetPlayerEntity());
                local_37 = (::GameplayInventoryUtils::GetInventoryItemNum(local_46, CostItem) >= local_19);
            }
            if (local_37)
            {
                FCookPlayerCostItem local_72;
                local_72.SetCookCostItem(CostItem);
                local_72.SetPushTime(CurTime);
                this.GetModify_CookPlayerDatas()[PlayerIndex].GetModify_CookCostItems().Add(local_72);
                return true;
            }
        }
        return false;
    }
    bool FoodCostFull()
    {
        int local_1 = 0;
        for (auto& local_18 : this.GetCookPlayerDatas())
        {
            local_1 = local_1 + local_18.GetCookCostItems().Num();
        }
        return (local_1 >= 4);
    }
    int GetFoodCostCount() const
    {
        int local_1 = 0;
        for (auto& local_18 : this.GetCookPlayerDatas())
        {
            local_1 = local_1 + local_18.GetCookCostItems().Num();
        }
        return local_1;
    }
    bool FoodCostReadyToCook() const
    {
        return (this.GetFoodCostCount() == 4);
    }
    bool AllBeReady() const
    {
        bool local_1 = true;
        int local_3 = 0;
        for (; local_3 < this.GetCookPlayerDatas().Num(); ++local_3)
        {
            if (this.GetCookPlayerDatas()[local_3].GetPlayerEntity().IsValid() && !(this.GetCookPlayerDatas()[local_3].GetbPlayerReady()))
            {
                local_1 = false;
            }
        }
        return local_1;
    }
    void Reset()
    {
        this.SetCookState(ECookState(0));
        this.GetModify_CookPlayerDatas().Empty(0);
        this.SetPendingConfirmCount(0);
        this.SetConfirmedSuccessCount(0);
        this.SetConfirmedFailCount(0);
        TDataObjectPtr<FFoodProductConfig> local_26;
        this.SetPendingProductFood(local_26);
        this.SetPendingModifiers(TArray<TDataObjectPtr<FGameplayModifierConfig>>());
        return;
    }
    ECookState GetCookState() const property
    {
        return this.m_CookState;
    }
    void SetCookState(const ECookState __Value) property
    {
        if (int(this.m_CookState) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_CookState = __Value;
        return;
    }
    const TArray<FCookPlayerData> GetCookPlayerDatas() const property
    {
        const TArray<FCookPlayerData> __r;
        return __r;
    }
    TArray<FCookPlayerData> GetModify_CookPlayerDatas() property
    {
        TArray<FCookPlayerData> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetCookPlayerDatas(const TArray<FCookPlayerData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CookPlayerDatas = __Value;
        return;
    }
    int GetPendingConfirmCount() const property
    {
        return this.m_PendingConfirmCount;
    }
    void SetPendingConfirmCount(const int __Value) property
    {
        if (this.m_PendingConfirmCount == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_PendingConfirmCount = __Value;
        return;
    }
    int GetConfirmedSuccessCount() const property
    {
        return this.m_ConfirmedSuccessCount;
    }
    void SetConfirmedSuccessCount(const int __Value) property
    {
        if (this.m_ConfirmedSuccessCount == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ConfirmedSuccessCount = __Value;
        return;
    }
    int GetConfirmedFailCount() const property
    {
        return this.m_ConfirmedFailCount;
    }
    void SetConfirmedFailCount(const int __Value) property
    {
        if (this.m_ConfirmedFailCount == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_ConfirmedFailCount = __Value;
        return;
    }
    const TDataObjectPtr<FFoodProductConfig> GetPendingProductFood() const property
    {
        const TDataObjectPtr<FFoodProductConfig> __r;
        return __r;
    }
    TDataObjectPtr<FFoodProductConfig> GetModify_PendingProductFood() property
    {
        TDataObjectPtr<FFoodProductConfig> __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetPendingProductFood(const TDataObjectPtr<FFoodProductConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_PendingProductFood = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FGameplayModifierConfig>> GetPendingModifiers() const property
    {
        const TArray<TDataObjectPtr<FGameplayModifierConfig>> __r;
        return __r;
    }
    TArray<TDataObjectPtr<FGameplayModifierConfig>> GetModify_PendingModifiers() property
    {
        TArray<TDataObjectPtr<FGameplayModifierConfig>> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetPendingModifiers(const TArray<TDataObjectPtr<FGameplayModifierConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_PendingModifiers = __Value;
        return;
    }
    uint GetCurrentSessionId() const property
    {
        return this.m_CurrentSessionId;
    }
    void SetCurrentSessionId(const uint __Value) property
    {
        if (this.m_CurrentSessionId == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_CurrentSessionId = __Value;
        return;
    }
}

struct FCE_PushCostFood : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity CookPropEntity;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> FoodItem;
    UPROPERTY()
    int ClientItemNum = 0;


}

struct FCE_PopCostFood : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity CookPropEntity;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> FoodItem;

    FCE_PopCostFood()
    {
        return;
    }
}

struct FCE_PlayerCookReady : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity CookPropEntity;

    FCE_PlayerCookReady()
    {
        return;
    }
}

struct FCE_ExitCook : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity CookPropEntity;

    FCE_ExitCook()
    {
        return;
    }
}

struct FCE_CookConfirmMetaBuff : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity CookPropEntity;
    UPROPERTY()
    TDataObjectPtr<FFoodProductConfig> GetProductFood;

    FCE_CookConfirmMetaBuff()
    {
        return;
    }
}

struct FCE_CookCancelMetaBuff : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity CookPropEntity;

    FCE_CookCancelMetaBuff()
    {
        return;
    }
}

struct FCE_CookReset : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_CookReset()
    {
        return;
    }
}

struct FCE_CookAutoReadyTip : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_CookAutoReadyTip()
    {
        return;
    }
}

struct FCE_CookAllReady : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity CookPropEntity;

    FCE_CookAllReady()
    {
        return;
    }
}

struct FCE_CookFinisehd : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bSuccess = true;
    UPROPERTY()
    TDataObjectPtr<FFoodProductConfig> FinishedFoodProduct;
    UPROPERTY()
    TArray<TDataObjectPtr<FGameplayModifierConfig>> FinishedModifiers;
    UPROPERTY()
    FECSEntity CookPropEntity;


}

struct FCE_CookEventForPresentation : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bStart = false;


}

namespace ECSFunc_FC_CookConfig
{
UFUNCTION()
bool HasCookConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CookConfig);
}
FC_CookConfig& AssignCookConfig(const FECSEntity &inout Entity, const FC_CookConfig &inout DefaultValue = FC_CookConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CookConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCookConfig_BP(const FECSEntity &inout Entity, const FC_CookConfig &inout DefaultValue = FC_CookConfig())
{
    ECSFunc_FC_CookConfig::AssignCookConfig(Entity, DefaultValue);
    return;
}
FC_CookConfig& ModifyCookConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CookConfig));
    return local_12.GetComp();
}
FC_CookConfig& ModifyOrAddCookConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CookConfig));
    return local_12.GetComp();
}
const FC_CookConfig& GetCookConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CookConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_CookConfig GetCookConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CookConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_CookConfig::GetCookConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CookConfig GetDefaultedCookConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CookConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CookConfig);
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
FC_CookConfig GetDefaultedCookConfig_BP(const FECSEntity &inout Entity)
{
    FC_CookConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveCookConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CookConfig);
}
}
FECSMonitorRuntimeView __GetMonitorCookConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CookConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CookConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CookConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CookConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CookConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorCookConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CookConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCookConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CookConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCookConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CookConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CookPropAutoReady
{
UFUNCTION()
bool HasCookPropAutoReady(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CookPropAutoReady);
}
FC_CookPropAutoReady& AssignCookPropAutoReady(const FECSEntity &inout Entity, const FC_CookPropAutoReady &inout DefaultValue = FC_CookPropAutoReady())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CookPropAutoReady, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCookPropAutoReady_BP(const FECSEntity &inout Entity, const FC_CookPropAutoReady &inout DefaultValue = FC_CookPropAutoReady())
{
    ECSFunc_FC_CookPropAutoReady::AssignCookPropAutoReady(Entity, DefaultValue);
    return;
}
FC_CookPropAutoReady& ModifyCookPropAutoReady(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CookPropAutoReady));
    return local_12.GetComp();
}
FC_CookPropAutoReady& ModifyOrAddCookPropAutoReady(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CookPropAutoReady));
    return local_12.GetComp();
}
const FC_CookPropAutoReady& GetCookPropAutoReady(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CookPropAutoReady));
    return local_12.GetComp();
}
UFUNCTION()
FC_CookPropAutoReady GetCookPropAutoReady_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CookPropAutoReady& local_4 = ECSFunc_FC_CookPropAutoReady::GetCookPropAutoReady(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CookPropAutoReady();
}
const FC_CookPropAutoReady GetDefaultedCookPropAutoReady(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CookPropAutoReady __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CookPropAutoReady);
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
FC_CookPropAutoReady GetDefaultedCookPropAutoReady_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CookPropAutoReady::GetDefaultedCookPropAutoReady(Entity);
}
UFUNCTION()
bool RemoveCookPropAutoReady(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CookPropAutoReady);
}
}
FECSMonitorRuntimeView __GetMonitorCookPropAutoReadyOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CookPropAutoReady, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookPropAutoReadyOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CookPropAutoReady, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookPropAutoReadyOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CookPropAutoReady, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookPropAutoReadyOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CookPropAutoReady, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookPropAutoReadyOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CookPropAutoReady, bFixedFrame, bMustHandleAll);
}
void __MonitorCookPropAutoReadyLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CookPropAutoReady, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCookPropAutoReadyActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CookPropAutoReady, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCookPropAutoReadyModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CookPropAutoReady, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CookPropForPresentation
{
UFUNCTION()
bool HasCookPropForPresentation(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CookPropForPresentation);
}
FC_CookPropForPresentation& AssignCookPropForPresentation(const FECSEntity &inout Entity, const FC_CookPropForPresentation &inout DefaultValue = FC_CookPropForPresentation())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CookPropForPresentation, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCookPropForPresentation_BP(const FECSEntity &inout Entity, const FC_CookPropForPresentation &inout DefaultValue = FC_CookPropForPresentation())
{
    ECSFunc_FC_CookPropForPresentation::AssignCookPropForPresentation(Entity, DefaultValue);
    return;
}
FC_CookPropForPresentation& ModifyCookPropForPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CookPropForPresentation));
    return local_12.GetComp();
}
FC_CookPropForPresentation& ModifyOrAddCookPropForPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CookPropForPresentation));
    return local_12.GetComp();
}
const FC_CookPropForPresentation& GetCookPropForPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CookPropForPresentation));
    return local_12.GetComp();
}
UFUNCTION()
FC_CookPropForPresentation GetCookPropForPresentation_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CookPropForPresentation __r;
    bValid = false;
    bValid = ECSFunc_FC_CookPropForPresentation::GetCookPropForPresentation(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CookPropForPresentation GetDefaultedCookPropForPresentation(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CookPropForPresentation __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CookPropForPresentation);
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
FC_CookPropForPresentation GetDefaultedCookPropForPresentation_BP(const FECSEntity &inout Entity)
{
    FC_CookPropForPresentation __r;
    return __r;
}
UFUNCTION()
bool RemoveCookPropForPresentation(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CookPropForPresentation);
}
}
FECSMonitorRuntimeView __GetMonitorCookPropForPresentationOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CookPropForPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookPropForPresentationOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CookPropForPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookPropForPresentationOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CookPropForPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookPropForPresentationOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CookPropForPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookPropForPresentationOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CookPropForPresentation, bFixedFrame, bMustHandleAll);
}
void __MonitorCookPropForPresentationLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CookPropForPresentation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCookPropForPresentationActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CookPropForPresentation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCookPropForPresentationModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CookPropForPresentation, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CookProp
{
UFUNCTION()
bool HasCookProp(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CookProp);
}
FC_CookProp& AssignCookProp(const FECSEntity &inout Entity, const FC_CookProp &inout DefaultValue = FC_CookProp())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CookProp, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCookProp_BP(const FECSEntity &inout Entity, const FC_CookProp &inout DefaultValue = FC_CookProp())
{
    ECSFunc_FC_CookProp::AssignCookProp(Entity, DefaultValue);
    return;
}
FC_CookProp& ModifyCookProp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CookProp));
    return local_12.GetComp();
}
FC_CookProp& ModifyOrAddCookProp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CookProp));
    return local_12.GetComp();
}
const FC_CookProp& GetCookProp(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CookProp));
    return local_12.GetComp();
}
UFUNCTION()
FC_CookProp GetCookProp_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CookProp& local_4 = ECSFunc_FC_CookProp::GetCookProp(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CookProp();
}
const FC_CookProp GetDefaultedCookProp(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CookProp __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CookProp);
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
FC_CookProp GetDefaultedCookProp_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CookProp::GetDefaultedCookProp(Entity);
}
UFUNCTION()
bool RemoveCookProp(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CookProp);
}
}
FECSMonitorRuntimeView __GetMonitorCookPropOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CookProp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookPropOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CookProp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookPropOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CookProp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookPropOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CookProp, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCookPropOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CookProp, bFixedFrame, bMustHandleAll);
}
void __MonitorCookPropLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CookProp, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCookPropActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CookProp, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCookPropModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CookProp, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FCookPlayerData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FCookPlayerData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCookPlayerData
{
int __IndexOf_PlayerEntity()
{
    return 0;
}
int __IndexOf_bPlayerReady()
{
    return 1;
}
int __IndexOf_CookCostItems()
{
    return 2;
}
int __IndexOf_bCancelMetaBuff()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CookPropAutoReady &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CookPropAutoReady &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CookPropAutoReady &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CookPropAutoReady
{
int __IndexOf_AutoReadyTime()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_CookProp &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_CookProp &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CookProp &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CookProp
{
int __IndexOf_CookState()
{
    return 0;
}
int __IndexOf_CookPlayerDatas()
{
    return 1;
}
int __IndexOf_PendingConfirmCount()
{
    return 2;
}
int __IndexOf_ConfirmedSuccessCount()
{
    return 3;
}
int __IndexOf_ConfirmedFailCount()
{
    return 4;
}
int __IndexOf_PendingProductFood()
{
    return 5;
}
int __IndexOf_PendingModifiers()
{
    return 6;
}
int __IndexOf_CurrentSessionId()
{
    return 7;
}
}

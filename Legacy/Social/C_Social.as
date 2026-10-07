
enum ESocialViewPageOpenType
{
    Default,
    MainCitySceneInteract,
    WorldSceneInteract,
    CommissionSceneInteract,
    TeamPanel,
    TeamLobbyPanel,
    ChatPanel,
    FriendPanel,
    RankPanel,
}

namespace __INTENRAL_FC_SpawnEntityRecord_NS
{
    const TECSComponentDerivedPtr<FC_SpawnEntityRecord> DerivedPtr = TECSComponentDerivedPtr<FC_SpawnEntityRecord>();
    const FC_SpawnEntityRecord DefaultValue = FC_SpawnEntityRecord();
}
namespace __INTENRAL_FC_SocialInteractionConfig_NS
{
    const TECSComponentDerivedPtr<FC_SocialInteractionConfig> DerivedPtr = TECSComponentDerivedPtr<FC_SocialInteractionConfig>();
    const FC_SocialInteractionConfig DefaultValue = FC_SocialInteractionConfig();
}
namespace __INTENRAL_FC_SocialInteractionConfigLoadedTag_NS
{
    const TECSComponentDerivedPtr<FC_SocialInteractionConfigLoadedTag> DerivedPtr = TECSComponentDerivedPtr<FC_SocialInteractionConfigLoadedTag>();
    const FC_SocialInteractionConfigLoadedTag DefaultValue = FC_SocialInteractionConfigLoadedTag();
}
namespace __INTENRAL_FC_SocialInteractionInfo_NS
{
    const TECSComponentDerivedPtr<FC_SocialInteractionInfo> DerivedPtr = TECSComponentDerivedPtr<FC_SocialInteractionInfo>();
    const FC_SocialInteractionInfo DefaultValue = FC_SocialInteractionInfo();
}
namespace __INTENRAL_FC_SelectSocialInteractionInfo_NS
{
    const TECSComponentDerivedPtr<FC_SelectSocialInteractionInfo> DerivedPtr = TECSComponentDerivedPtr<FC_SelectSocialInteractionInfo>();
    const FC_SelectSocialInteractionInfo DefaultValue = FC_SelectSocialInteractionInfo();
}
namespace __INTENRAL_FC_SelectSocialViewPageInteractionInfo_NS
{
    const TECSComponentDerivedPtr<FC_SelectSocialViewPageInteractionInfo> DerivedPtr = TECSComponentDerivedPtr<FC_SelectSocialViewPageInteractionInfo>();
    const FC_SelectSocialViewPageInteractionInfo DefaultValue = FC_SelectSocialViewPageInteractionInfo();
}
namespace __INTENRAL_FC_SocialInteractionPresentationInfo_NS
{
    const TECSComponentDerivedPtr<FC_SocialInteractionPresentationInfo> DerivedPtr = TECSComponentDerivedPtr<FC_SocialInteractionPresentationInfo>();
    const FC_SocialInteractionPresentationInfo DefaultValue = FC_SocialInteractionPresentationInfo();
}
namespace __INTENRAL_FC_SocialExpressionInfo_NS
{
    const TECSComponentDerivedPtr<FC_SocialExpressionInfo> DerivedPtr = TECSComponentDerivedPtr<FC_SocialExpressionInfo>();
    const FC_SocialExpressionInfo DefaultValue = FC_SocialExpressionInfo();
}
namespace __INTENRAL_FC_SocialOverrideMaterialTag_NS
{
    const TECSComponentDerivedPtr<FC_SocialOverrideMaterialTag> DerivedPtr = TECSComponentDerivedPtr<FC_SocialOverrideMaterialTag>();
    const FC_SocialOverrideMaterialTag DefaultValue = FC_SocialOverrideMaterialTag();
}
namespace __INTENRAL_FCE_SelectSocialViewPageInteraction_NS
{
    const TECSEventDerivedPtr<FCE_SelectSocialViewPageInteraction> DerivedPtr = TECSEventDerivedPtr<FCE_SelectSocialViewPageInteraction>();
}
namespace __INTENRAL_FCE_SocialActionAnimEvent_NS
{
    const TECSEventDerivedPtr<FCE_SocialActionAnimEvent> DerivedPtr = TECSEventDerivedPtr<FCE_SocialActionAnimEvent>();
}
namespace __INTENRAL_FCE_SpawnPropEvent_NS
{
    const TECSEventDerivedPtr<FCE_SpawnPropEvent> DerivedPtr = TECSEventDerivedPtr<FCE_SpawnPropEvent>();
}
namespace __INTENRAL_FCE_ShowWrestleResultEvent_NS
{
    const TECSEventDerivedPtr<FCE_ShowWrestleResultEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ShowWrestleResultEvent>();
}
namespace __INTENRAL_FCE_BeginWrestleEvent_NS
{
    const TECSEventDerivedPtr<FCE_BeginWrestleEvent> DerivedPtr = TECSEventDerivedPtr<FCE_BeginWrestleEvent>();
}
namespace __INTENRAL_FCE_SocialRequestInteractActionEvent_NS
{
    const TECSEventDerivedPtr<FCE_SocialRequestInteractActionEvent> DerivedPtr = TECSEventDerivedPtr<FCE_SocialRequestInteractActionEvent>();
}
namespace __INTENRAL_FCE_AcceptSocialInteractAction_NS
{
    const TECSEventDerivedPtr<FCE_AcceptSocialInteractAction> DerivedPtr = TECSEventDerivedPtr<FCE_AcceptSocialInteractAction>();
}
namespace __INTENRAL_FCE_SocialActionRejected_NS
{
    const TECSEventDerivedPtr<FCE_SocialActionRejected> DerivedPtr = TECSEventDerivedPtr<FCE_SocialActionRejected>();
}
namespace __INTENRAL_FCE_TryTriggerESM_NS
{
    const TECSEventDerivedPtr<FCE_TryTriggerESM> DerivedPtr = TECSEventDerivedPtr<FCE_TryTriggerESM>();
}
namespace __INTENRAL_FCE_SocialSpawnProp_NS
{
    const TECSEventDerivedPtr<FCE_SocialSpawnProp> DerivedPtr = TECSEventDerivedPtr<FCE_SocialSpawnProp>();
}
namespace __INTENRAL_FCE_SetSocialExpressionContent_NS
{
    const TECSEventDerivedPtr<FCE_SetSocialExpressionContent> DerivedPtr = TECSEventDerivedPtr<FCE_SetSocialExpressionContent>();
}
namespace __INTENRAL_FCE_ClearSocialExpressionContent_NS
{
    const TECSEventDerivedPtr<FCE_ClearSocialExpressionContent> DerivedPtr = TECSEventDerivedPtr<FCE_ClearSocialExpressionContent>();

}
struct FC_SpawnEntityRecord : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FSkillTargetPositionSelectParams> m_SelectParams;
    UPROPERTY()
    TSoftClassPtr<APropPrefabScriptBase> m_Prefab;
    UPROPERTY()
    TArray<FECSEntity> m_Entities;
    UPROPERTY()
    FNameHandle_EntityBBVarInt m_PropNum;

    FC_SpawnEntityRecord()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_SpawnEntityRecord(const FC_SpawnEntityRecord &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_SelectParams = Other.m_SelectParams;
        this.m_Prefab = Other.m_Prefab;
        this.m_Entities = Other.m_Entities;
        this.m_PropNum = Other.m_PropNum;
        return;
    }
    FC_SpawnEntityRecord opAssign(const FC_SpawnEntityRecord &inout Other)
    {
        FC_SpawnEntityRecord __r;
        this.SetSelectParams(Other.GetSelectParams());
        this.SetPrefab(Other.GetPrefab());
        this.SetEntities(Other.GetEntities());
        this.SetPropNum(Other.GetPropNum());
        return __r;
    }
    const TDataObjectPtr<FSkillTargetPositionSelectParams> GetSelectParams() const property
    {
        const TDataObjectPtr<FSkillTargetPositionSelectParams> __r;
        return __r;
    }
    TDataObjectPtr<FSkillTargetPositionSelectParams> GetModify_SelectParams() property
    {
        TDataObjectPtr<FSkillTargetPositionSelectParams> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetSelectParams(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SelectParams = __Value;
        return;
    }
    const TSoftClassPtr<APropPrefabScriptBase> GetPrefab() const property
    {
        const TSoftClassPtr<APropPrefabScriptBase> __r;
        return __r;
    }
    TSoftClassPtr<APropPrefabScriptBase> GetModify_Prefab() property
    {
        TSoftClassPtr<APropPrefabScriptBase> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetPrefab(const TSoftClassPtr<APropPrefabScriptBase> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Prefab = __Value;
        return;
    }
    const TArray<FECSEntity> GetEntities() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetModify_Entities() property
    {
        TArray<FECSEntity> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetEntities(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Entities = __Value;
        return;
    }
    const FNameHandle_EntityBBVarInt GetPropNum() const property
    {
        const FNameHandle_EntityBBVarInt __r;
        return __r;
    }
    FNameHandle_EntityBBVarInt GetModify_PropNum() property
    {
        FNameHandle_EntityBBVarInt __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetPropNum(const FNameHandle_EntityBBVarInt &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_PropNum = __Value;
        return;
    }
}

struct FSocialSpawnPropItemConfig
{
    UPROPERTY()
    FString ShowName;
    UPROPERTY()
    TSubclassOf<AECSPrefab> Prefab;

    FSocialSpawnPropItemConfig()
    {
        return;
    }
}

struct FSocialSpawnPropConfig
{
    UPROPERTY()
    TMap<FString, FSocialSpawnPropItemConfig> SocialSpawnPropItems;

    FSocialSpawnPropConfig()
    {
        return;
    }
}

struct FC_SocialInteractionConfig : FECSComponent
{
    UPROPERTY()
    FSocialSpawnPropConfig SocialSpawnPropConfig;

    FC_SocialInteractionConfig()
    {
        return;
    }
}

struct FC_SocialInteractionConfigLoadedTag : FECSComponent
{
    FC_SocialInteractionConfigLoadedTag()
    {
        return;
    }
}

struct FC_SocialInteractionInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_RequestInteractActionTargetPlayerEntity;
    UPROPERTY()
    bool m_bHasTargetPlayerEntity;
    UPROPERTY()
    int m_RequestInteractActionIndex;
    UPROPERTY()
    EInteractionSocialTypeForESM m_SocialAnimName;
    UPROPERTY()
    bool m_IsInteractMaster;

    FC_SocialInteractionInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_SocialInteractionInfo(const FC_SocialInteractionInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_SocialInteractionInfo opAssign(const FC_SocialInteractionInfo &inout Other)
    {
        FC_SocialInteractionInfo __r;
        this.SetRequestInteractActionTargetPlayerEntity(Other.GetRequestInteractActionTargetPlayerEntity());
        this.SetbHasTargetPlayerEntity(Other.GetbHasTargetPlayerEntity());
        this.SetRequestInteractActionIndex(Other.GetRequestInteractActionIndex());
        this.SetSocialAnimName(Other.GetSocialAnimName());
        this.SetIsInteractMaster(Other.GetIsInteractMaster());
        return __r;
    }
    const FECSEntity GetRequestInteractActionTargetPlayerEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_RequestInteractActionTargetPlayerEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRequestInteractActionTargetPlayerEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RequestInteractActionTargetPlayerEntity = __Value;
        return;
    }
    bool GetbHasTargetPlayerEntity() const property
    {
        return this.m_bHasTargetPlayerEntity;
    }
    void SetbHasTargetPlayerEntity(const bool __Value) property
    {
        if (!(this.m_bHasTargetPlayerEntity) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bHasTargetPlayerEntity = __Value;
        return;
    }
    int GetRequestInteractActionIndex() const property
    {
        return this.m_RequestInteractActionIndex;
    }
    void SetRequestInteractActionIndex(const int __Value) property
    {
        if (this.m_RequestInteractActionIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_RequestInteractActionIndex = __Value;
        return;
    }
    EInteractionSocialTypeForESM GetSocialAnimName() const property
    {
        return this.m_SocialAnimName;
    }
    void SetSocialAnimName(const EInteractionSocialTypeForESM __Value) property
    {
        if (int(this.m_SocialAnimName) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_SocialAnimName = __Value;
        return;
    }
    bool GetIsInteractMaster() const property
    {
        return this.m_IsInteractMaster;
    }
    void SetIsInteractMaster(const bool __Value) property
    {
        if (!(this.m_IsInteractMaster) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_IsInteractMaster = __Value;
        return;
    }
}

struct FC_SelectSocialInteractionInfo : FECSComponent
{
    UPROPERTY()
    FECSEntity InteractTarget;

    FC_SelectSocialInteractionInfo()
    {
        return;
    }
}

struct FC_SelectSocialViewPageInteractionInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_InteractTarget;
    UPROPERTY()
    ESocialViewPageOpenType m_OpenType;

    FC_SelectSocialViewPageInteractionInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_SelectSocialViewPageInteractionInfo(const FC_SelectSocialViewPageInteractionInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_SelectSocialViewPageInteractionInfo opAssign(const FC_SelectSocialViewPageInteractionInfo &inout Other)
    {
        FC_SelectSocialViewPageInteractionInfo __r;
        this.SetInteractTarget(Other.GetInteractTarget());
        this.SetOpenType(Other.GetOpenType());
        return __r;
    }
    const FECSEntity GetInteractTarget() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_InteractTarget() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetInteractTarget(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_InteractTarget = __Value;
        return;
    }
    ESocialViewPageOpenType GetOpenType() const property
    {
        return this.m_OpenType;
    }
    void SetOpenType(const ESocialViewPageOpenType __Value) property
    {
        if (int(this.m_OpenType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_OpenType = __Value;
        return;
    }
}

struct FCE_SelectSocialViewPageInteraction : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bInInteract = false;
    UPROPERTY()
    FECSEntity InteractTarget;
    UPROPERTY()
    ESocialViewPageOpenType OpenType = ESocialViewPageOpenType(0);


}

class UWidget_SocialHeadInfo : UASUserWidget
{
    UPROPERTY()
    UTextBlock AS_HeadInfoContent;
    UPROPERTY()
    UImage AS_TeamMasterMask;
    UPROPERTY()
    UBorder AS_TextBorder;
    UPROPERTY()
    UTextBlock AS_TextBlock_UserName;

    UWidget_SocialHeadInfo()
    {
        return;
    }
}

struct FC_SocialInteractionPresentationInfo : FECSComponent
{
    UPROPERTY()
    bool bIsLocalPlayer = false;
    UPROPERTY()
    TWeakObjectPtr<UWidget_SocialHeadInfo> SocialHeadInfoWidget;


}

struct FC_SocialExpressionInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FString m_ExpressionContent;
    UPROPERTY()
    FFPTime m_CreateTime;

    FC_SocialExpressionInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_SocialExpressionInfo(const FC_SocialExpressionInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_ExpressionContent = Other.m_ExpressionContent;
        this.m_CreateTime = Other.m_CreateTime;
        return;
    }
    FC_SocialExpressionInfo opAssign(const FC_SocialExpressionInfo &inout Other)
    {
        FC_SocialExpressionInfo __r;
        this.SetExpressionContent(Other.GetExpressionContent());
        this.SetCreateTime(Other.GetCreateTime());
        return __r;
    }
    FString GetExpressionContent() const property
    {
        return this.m_ExpressionContent;
    }
    void SetExpressionContent(const FString &inout __Value) property
    {
        if ((this.m_ExpressionContent == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ExpressionContent = __Value;
        return;
    }
    FFPTime GetCreateTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetModify_CreateTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetCreateTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CreateTime = __Value;
        return;
    }
}

struct FC_SocialOverrideMaterialTag : FECSComponent
{
    FC_SocialOverrideMaterialTag()
    {
        return;
    }
}

struct FCE_SocialActionAnimEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int ActionAnimIndex;
    UPROPERTY()
    TDataObjectPtr<FMotionData> MotionData;


    bool Validate() const
    {
        return this.ActionAnimIndex >= 0 && this.MotionData.IsSet();
    }
}

struct FCE_SpawnPropEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TSoftClassPtr<APropPrefabScriptBase> Prefab;
    UPROPERTY()
    float32 DistanceOffset;
    UPROPERTY()
    FNameHandle_EntityBBVarInt PropNum;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity PropEntity;
    UPROPERTY()
    TDataObjectPtr<FSkillTargetPositionSelectParams> SelectParams;


}

struct FCE_ShowWrestleResultEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int ResultIndex = 0;


}

struct FCE_BeginWrestleEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_BeginWrestleEvent()
    {
        return;
    }
}

struct FCE_SocialRequestInteractActionEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity RequestInteractAnimSourceEntity;
    UPROPERTY()
    FECSEntity RequestInteractAnimTargetEntity;
    UPROPERTY()
    TDataObjectPtr<FMotionData> MotionData;

    FCE_SocialRequestInteractActionEvent()
    {
        return;
    }
}

struct FCE_AcceptSocialInteractAction : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity ActionSourceEntity;

    FCE_AcceptSocialInteractAction()
    {
        return;
    }
}

struct FCE_SocialActionRejected : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    EMotionType MotionType = EMotionType(0);
    UPROPERTY()
    bool bSourceConditionFailed = false;
    UPROPERTY()
    bool bTargetConditionFailed = false;


}

struct FCE_TryTriggerESM : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Entity;
    UPROPERTY()
    FName TriggerName = NAME_None;

    FCE_TryTriggerESM()
    {
        return;
    }
    bool Validate() const
    {
        return this.Entity.IsValid() && !((this.TriggerName == NAME_None));
    }
}

struct FCE_SocialSpawnProp : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity PlayerEntity;
    UPROPERTY()
    FString SpawnPropKey;
    UPROPERTY()
    FVector Location;
    UPROPERTY()
    FRotator3f Rotator;

    FCE_SocialSpawnProp()
    {
        return;
    }
}

struct FCE_SetSocialExpressionContent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FString ExpressionContent;

    FCE_SetSocialExpressionContent()
    {
        return;
    }
}

struct FCE_ClearSocialExpressionContent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_ClearSocialExpressionContent()
    {
        return;
    }
}

namespace ECSFunc_FC_SpawnEntityRecord
{
UFUNCTION()
bool HasSpawnEntityRecord(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SpawnEntityRecord);
}
FC_SpawnEntityRecord& AssignSpawnEntityRecord(const FECSEntity &inout Entity, const FC_SpawnEntityRecord &inout DefaultValue = FC_SpawnEntityRecord())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SpawnEntityRecord, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSpawnEntityRecord_BP(const FECSEntity &inout Entity, const FC_SpawnEntityRecord &inout DefaultValue = FC_SpawnEntityRecord())
{
    ECSFunc_FC_SpawnEntityRecord::AssignSpawnEntityRecord(Entity, DefaultValue);
    return;
}
FC_SpawnEntityRecord& ModifySpawnEntityRecord(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SpawnEntityRecord));
    return local_12.GetComp();
}
FC_SpawnEntityRecord& ModifyOrAddSpawnEntityRecord(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SpawnEntityRecord));
    return local_12.GetComp();
}
const FC_SpawnEntityRecord& GetSpawnEntityRecord(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SpawnEntityRecord));
    return local_12.GetComp();
}
UFUNCTION()
FC_SpawnEntityRecord GetSpawnEntityRecord_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SpawnEntityRecord& local_4 = ECSFunc_FC_SpawnEntityRecord::GetSpawnEntityRecord(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SpawnEntityRecord();
}
const FC_SpawnEntityRecord GetDefaultedSpawnEntityRecord(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SpawnEntityRecord __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SpawnEntityRecord);
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
FC_SpawnEntityRecord GetDefaultedSpawnEntityRecord_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SpawnEntityRecord::GetDefaultedSpawnEntityRecord(Entity);
}
UFUNCTION()
bool RemoveSpawnEntityRecord(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SpawnEntityRecord);
}
}
FECSMonitorRuntimeView __GetMonitorSpawnEntityRecordOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SpawnEntityRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnEntityRecordOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SpawnEntityRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnEntityRecordOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SpawnEntityRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnEntityRecordOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SpawnEntityRecord, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSpawnEntityRecordOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SpawnEntityRecord, bFixedFrame, bMustHandleAll);
}
void __MonitorSpawnEntityRecordLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SpawnEntityRecord, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnEntityRecordActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SpawnEntityRecord, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSpawnEntityRecordModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SpawnEntityRecord, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SocialInteractionConfig
{
UFUNCTION()
bool HasSocialInteractionConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionConfig);
}
FC_SocialInteractionConfig& AssignSocialInteractionConfig(const FECSEntity &inout Entity, const FC_SocialInteractionConfig &inout DefaultValue = FC_SocialInteractionConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSocialInteractionConfig_BP(const FECSEntity &inout Entity, const FC_SocialInteractionConfig &inout DefaultValue = FC_SocialInteractionConfig())
{
    ECSFunc_FC_SocialInteractionConfig::AssignSocialInteractionConfig(Entity, DefaultValue);
    return;
}
FC_SocialInteractionConfig& ModifySocialInteractionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionConfig));
    return local_12.GetComp();
}
FC_SocialInteractionConfig& ModifyOrAddSocialInteractionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionConfig));
    return local_12.GetComp();
}
const FC_SocialInteractionConfig& GetSocialInteractionConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_SocialInteractionConfig GetSocialInteractionConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SocialInteractionConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_SocialInteractionConfig::GetSocialInteractionConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SocialInteractionConfig GetDefaultedSocialInteractionConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SocialInteractionConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionConfig);
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
FC_SocialInteractionConfig GetDefaultedSocialInteractionConfig_BP(const FECSEntity &inout Entity)
{
    FC_SocialInteractionConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveSocialInteractionConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionConfig);
}
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SocialInteractionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SocialInteractionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SocialInteractionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SocialInteractionConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SocialInteractionConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorSocialInteractionConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SocialInteractionConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSocialInteractionConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SocialInteractionConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSocialInteractionConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SocialInteractionConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SocialInteractionConfigLoadedTag
{
UFUNCTION()
bool HasSocialInteractionConfigLoadedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionConfigLoadedTag);
}
FC_SocialInteractionConfigLoadedTag& AssignSocialInteractionConfigLoadedTag(const FECSEntity &inout Entity, const FC_SocialInteractionConfigLoadedTag &inout DefaultValue = FC_SocialInteractionConfigLoadedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionConfigLoadedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSocialInteractionConfigLoadedTag_BP(const FECSEntity &inout Entity, const FC_SocialInteractionConfigLoadedTag &inout DefaultValue = FC_SocialInteractionConfigLoadedTag())
{
    ECSFunc_FC_SocialInteractionConfigLoadedTag::AssignSocialInteractionConfigLoadedTag(Entity, DefaultValue);
    return;
}
FC_SocialInteractionConfigLoadedTag& ModifySocialInteractionConfigLoadedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionConfigLoadedTag));
    return local_12.GetComp();
}
FC_SocialInteractionConfigLoadedTag& ModifyOrAddSocialInteractionConfigLoadedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionConfigLoadedTag));
    return local_12.GetComp();
}
const FC_SocialInteractionConfigLoadedTag& GetSocialInteractionConfigLoadedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionConfigLoadedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_SocialInteractionConfigLoadedTag GetSocialInteractionConfigLoadedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SocialInteractionConfigLoadedTag& local_4 = ECSFunc_FC_SocialInteractionConfigLoadedTag::GetSocialInteractionConfigLoadedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SocialInteractionConfigLoadedTag();
}
const FC_SocialInteractionConfigLoadedTag GetDefaultedSocialInteractionConfigLoadedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SocialInteractionConfigLoadedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionConfigLoadedTag);
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
FC_SocialInteractionConfigLoadedTag GetDefaultedSocialInteractionConfigLoadedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SocialInteractionConfigLoadedTag::GetDefaultedSocialInteractionConfigLoadedTag(Entity);
}
UFUNCTION()
bool RemoveSocialInteractionConfigLoadedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionConfigLoadedTag);
}
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionConfigLoadedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SocialInteractionConfigLoadedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionConfigLoadedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SocialInteractionConfigLoadedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionConfigLoadedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SocialInteractionConfigLoadedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionConfigLoadedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SocialInteractionConfigLoadedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionConfigLoadedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SocialInteractionConfigLoadedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorSocialInteractionConfigLoadedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SocialInteractionConfigLoadedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSocialInteractionConfigLoadedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SocialInteractionConfigLoadedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSocialInteractionConfigLoadedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SocialInteractionConfigLoadedTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SocialInteractionInfo
{
UFUNCTION()
bool HasSocialInteractionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionInfo);
}
FC_SocialInteractionInfo& AssignSocialInteractionInfo(const FECSEntity &inout Entity, const FC_SocialInteractionInfo &inout DefaultValue = FC_SocialInteractionInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSocialInteractionInfo_BP(const FECSEntity &inout Entity, const FC_SocialInteractionInfo &inout DefaultValue = FC_SocialInteractionInfo())
{
    ECSFunc_FC_SocialInteractionInfo::AssignSocialInteractionInfo(Entity, DefaultValue);
    return;
}
FC_SocialInteractionInfo& ModifySocialInteractionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionInfo));
    return local_12.GetComp();
}
FC_SocialInteractionInfo& ModifyOrAddSocialInteractionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionInfo));
    return local_12.GetComp();
}
const FC_SocialInteractionInfo& GetSocialInteractionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_SocialInteractionInfo GetSocialInteractionInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SocialInteractionInfo& local_4 = ECSFunc_FC_SocialInteractionInfo::GetSocialInteractionInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SocialInteractionInfo();
}
const FC_SocialInteractionInfo GetDefaultedSocialInteractionInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SocialInteractionInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionInfo);
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
FC_SocialInteractionInfo GetDefaultedSocialInteractionInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SocialInteractionInfo::GetDefaultedSocialInteractionInfo(Entity);
}
UFUNCTION()
bool RemoveSocialInteractionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionInfo);
}
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SocialInteractionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SocialInteractionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SocialInteractionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SocialInteractionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SocialInteractionInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorSocialInteractionInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SocialInteractionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSocialInteractionInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SocialInteractionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSocialInteractionInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SocialInteractionInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SelectSocialInteractionInfo
{
UFUNCTION()
bool HasSelectSocialInteractionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SelectSocialInteractionInfo);
}
FC_SelectSocialInteractionInfo& AssignSelectSocialInteractionInfo(const FECSEntity &inout Entity, const FC_SelectSocialInteractionInfo &inout DefaultValue = FC_SelectSocialInteractionInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SelectSocialInteractionInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSelectSocialInteractionInfo_BP(const FECSEntity &inout Entity, const FC_SelectSocialInteractionInfo &inout DefaultValue = FC_SelectSocialInteractionInfo())
{
    ECSFunc_FC_SelectSocialInteractionInfo::AssignSelectSocialInteractionInfo(Entity, DefaultValue);
    return;
}
FC_SelectSocialInteractionInfo& ModifySelectSocialInteractionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SelectSocialInteractionInfo));
    return local_12.GetComp();
}
FC_SelectSocialInteractionInfo& ModifyOrAddSelectSocialInteractionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SelectSocialInteractionInfo));
    return local_12.GetComp();
}
const FC_SelectSocialInteractionInfo& GetSelectSocialInteractionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SelectSocialInteractionInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_SelectSocialInteractionInfo GetSelectSocialInteractionInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SelectSocialInteractionInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_SelectSocialInteractionInfo::GetSelectSocialInteractionInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SelectSocialInteractionInfo GetDefaultedSelectSocialInteractionInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SelectSocialInteractionInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SelectSocialInteractionInfo);
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
FC_SelectSocialInteractionInfo GetDefaultedSelectSocialInteractionInfo_BP(const FECSEntity &inout Entity)
{
    FC_SelectSocialInteractionInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveSelectSocialInteractionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SelectSocialInteractionInfo);
}
}
FECSMonitorRuntimeView __GetMonitorSelectSocialInteractionInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SelectSocialInteractionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectSocialInteractionInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SelectSocialInteractionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectSocialInteractionInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SelectSocialInteractionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectSocialInteractionInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SelectSocialInteractionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectSocialInteractionInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SelectSocialInteractionInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorSelectSocialInteractionInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SelectSocialInteractionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSelectSocialInteractionInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SelectSocialInteractionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSelectSocialInteractionInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SelectSocialInteractionInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SelectSocialViewPageInteractionInfo
{
UFUNCTION()
bool HasSelectSocialViewPageInteractionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SelectSocialViewPageInteractionInfo);
}
FC_SelectSocialViewPageInteractionInfo& AssignSelectSocialViewPageInteractionInfo(const FECSEntity &inout Entity, const FC_SelectSocialViewPageInteractionInfo &inout DefaultValue = FC_SelectSocialViewPageInteractionInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SelectSocialViewPageInteractionInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSelectSocialViewPageInteractionInfo_BP(const FECSEntity &inout Entity, const FC_SelectSocialViewPageInteractionInfo &inout DefaultValue = FC_SelectSocialViewPageInteractionInfo())
{
    ECSFunc_FC_SelectSocialViewPageInteractionInfo::AssignSelectSocialViewPageInteractionInfo(Entity, DefaultValue);
    return;
}
FC_SelectSocialViewPageInteractionInfo& ModifySelectSocialViewPageInteractionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SelectSocialViewPageInteractionInfo));
    return local_12.GetComp();
}
FC_SelectSocialViewPageInteractionInfo& ModifyOrAddSelectSocialViewPageInteractionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SelectSocialViewPageInteractionInfo));
    return local_12.GetComp();
}
const FC_SelectSocialViewPageInteractionInfo& GetSelectSocialViewPageInteractionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SelectSocialViewPageInteractionInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_SelectSocialViewPageInteractionInfo GetSelectSocialViewPageInteractionInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SelectSocialViewPageInteractionInfo& local_4 = ECSFunc_FC_SelectSocialViewPageInteractionInfo::GetSelectSocialViewPageInteractionInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SelectSocialViewPageInteractionInfo();
}
const FC_SelectSocialViewPageInteractionInfo GetDefaultedSelectSocialViewPageInteractionInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SelectSocialViewPageInteractionInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SelectSocialViewPageInteractionInfo);
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
FC_SelectSocialViewPageInteractionInfo GetDefaultedSelectSocialViewPageInteractionInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SelectSocialViewPageInteractionInfo::GetDefaultedSelectSocialViewPageInteractionInfo(Entity);
}
UFUNCTION()
bool RemoveSelectSocialViewPageInteractionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SelectSocialViewPageInteractionInfo);
}
}
FECSMonitorRuntimeView __GetMonitorSelectSocialViewPageInteractionInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SelectSocialViewPageInteractionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectSocialViewPageInteractionInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SelectSocialViewPageInteractionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectSocialViewPageInteractionInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SelectSocialViewPageInteractionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectSocialViewPageInteractionInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SelectSocialViewPageInteractionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectSocialViewPageInteractionInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SelectSocialViewPageInteractionInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorSelectSocialViewPageInteractionInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SelectSocialViewPageInteractionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSelectSocialViewPageInteractionInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SelectSocialViewPageInteractionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSelectSocialViewPageInteractionInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SelectSocialViewPageInteractionInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SocialInteractionPresentationInfo
{
UFUNCTION()
bool HasSocialInteractionPresentationInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionPresentationInfo);
}
FC_SocialInteractionPresentationInfo& AssignSocialInteractionPresentationInfo(const FECSEntity &inout Entity, const FC_SocialInteractionPresentationInfo &inout DefaultValue = FC_SocialInteractionPresentationInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionPresentationInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSocialInteractionPresentationInfo_BP(const FECSEntity &inout Entity, const FC_SocialInteractionPresentationInfo &inout DefaultValue = FC_SocialInteractionPresentationInfo())
{
    ECSFunc_FC_SocialInteractionPresentationInfo::AssignSocialInteractionPresentationInfo(Entity, DefaultValue);
    return;
}
FC_SocialInteractionPresentationInfo& ModifySocialInteractionPresentationInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionPresentationInfo));
    return local_12.GetComp();
}
FC_SocialInteractionPresentationInfo& ModifyOrAddSocialInteractionPresentationInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionPresentationInfo));
    return local_12.GetComp();
}
const FC_SocialInteractionPresentationInfo& GetSocialInteractionPresentationInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionPresentationInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_SocialInteractionPresentationInfo GetSocialInteractionPresentationInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SocialInteractionPresentationInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_SocialInteractionPresentationInfo::GetSocialInteractionPresentationInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SocialInteractionPresentationInfo GetDefaultedSocialInteractionPresentationInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SocialInteractionPresentationInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionPresentationInfo);
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
FC_SocialInteractionPresentationInfo GetDefaultedSocialInteractionPresentationInfo_BP(const FECSEntity &inout Entity)
{
    FC_SocialInteractionPresentationInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveSocialInteractionPresentationInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SocialInteractionPresentationInfo);
}
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionPresentationInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SocialInteractionPresentationInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionPresentationInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SocialInteractionPresentationInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionPresentationInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SocialInteractionPresentationInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionPresentationInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SocialInteractionPresentationInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialInteractionPresentationInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SocialInteractionPresentationInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorSocialInteractionPresentationInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SocialInteractionPresentationInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSocialInteractionPresentationInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SocialInteractionPresentationInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSocialInteractionPresentationInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SocialInteractionPresentationInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SocialExpressionInfo
{
UFUNCTION()
bool HasSocialExpressionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SocialExpressionInfo);
}
FC_SocialExpressionInfo& AssignSocialExpressionInfo(const FECSEntity &inout Entity, const FC_SocialExpressionInfo &inout DefaultValue = FC_SocialExpressionInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SocialExpressionInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSocialExpressionInfo_BP(const FECSEntity &inout Entity, const FC_SocialExpressionInfo &inout DefaultValue = FC_SocialExpressionInfo())
{
    ECSFunc_FC_SocialExpressionInfo::AssignSocialExpressionInfo(Entity, DefaultValue);
    return;
}
FC_SocialExpressionInfo& ModifySocialExpressionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SocialExpressionInfo));
    return local_12.GetComp();
}
FC_SocialExpressionInfo& ModifyOrAddSocialExpressionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SocialExpressionInfo));
    return local_12.GetComp();
}
const FC_SocialExpressionInfo& GetSocialExpressionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SocialExpressionInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_SocialExpressionInfo GetSocialExpressionInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SocialExpressionInfo& local_4 = ECSFunc_FC_SocialExpressionInfo::GetSocialExpressionInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SocialExpressionInfo();
}
const FC_SocialExpressionInfo GetDefaultedSocialExpressionInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SocialExpressionInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SocialExpressionInfo);
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
FC_SocialExpressionInfo GetDefaultedSocialExpressionInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SocialExpressionInfo::GetDefaultedSocialExpressionInfo(Entity);
}
UFUNCTION()
bool RemoveSocialExpressionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SocialExpressionInfo);
}
}
FECSMonitorRuntimeView __GetMonitorSocialExpressionInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SocialExpressionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialExpressionInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SocialExpressionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialExpressionInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SocialExpressionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialExpressionInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SocialExpressionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialExpressionInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SocialExpressionInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorSocialExpressionInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SocialExpressionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSocialExpressionInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SocialExpressionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSocialExpressionInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SocialExpressionInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SocialOverrideMaterialTag
{
UFUNCTION()
bool HasSocialOverrideMaterialTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SocialOverrideMaterialTag);
}
FC_SocialOverrideMaterialTag& AssignSocialOverrideMaterialTag(const FECSEntity &inout Entity, const FC_SocialOverrideMaterialTag &inout DefaultValue = FC_SocialOverrideMaterialTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SocialOverrideMaterialTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSocialOverrideMaterialTag_BP(const FECSEntity &inout Entity, const FC_SocialOverrideMaterialTag &inout DefaultValue = FC_SocialOverrideMaterialTag())
{
    ECSFunc_FC_SocialOverrideMaterialTag::AssignSocialOverrideMaterialTag(Entity, DefaultValue);
    return;
}
FC_SocialOverrideMaterialTag& ModifySocialOverrideMaterialTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SocialOverrideMaterialTag));
    return local_12.GetComp();
}
FC_SocialOverrideMaterialTag& ModifyOrAddSocialOverrideMaterialTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SocialOverrideMaterialTag));
    return local_12.GetComp();
}
const FC_SocialOverrideMaterialTag& GetSocialOverrideMaterialTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SocialOverrideMaterialTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_SocialOverrideMaterialTag GetSocialOverrideMaterialTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SocialOverrideMaterialTag& local_4 = ECSFunc_FC_SocialOverrideMaterialTag::GetSocialOverrideMaterialTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SocialOverrideMaterialTag();
}
const FC_SocialOverrideMaterialTag GetDefaultedSocialOverrideMaterialTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SocialOverrideMaterialTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SocialOverrideMaterialTag);
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
FC_SocialOverrideMaterialTag GetDefaultedSocialOverrideMaterialTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SocialOverrideMaterialTag::GetDefaultedSocialOverrideMaterialTag(Entity);
}
UFUNCTION()
bool RemoveSocialOverrideMaterialTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SocialOverrideMaterialTag);
}
}
FECSMonitorRuntimeView __GetMonitorSocialOverrideMaterialTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SocialOverrideMaterialTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialOverrideMaterialTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SocialOverrideMaterialTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialOverrideMaterialTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SocialOverrideMaterialTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialOverrideMaterialTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SocialOverrideMaterialTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSocialOverrideMaterialTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SocialOverrideMaterialTag, bFixedFrame, bMustHandleAll);
}
void __MonitorSocialOverrideMaterialTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SocialOverrideMaterialTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSocialOverrideMaterialTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SocialOverrideMaterialTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSocialOverrideMaterialTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SocialOverrideMaterialTag, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_SocialInteractionInfo_bHasTargetPlayerEntity(const FECSEntity &inout Entity, bool &inout OutRetValue)
{
    GetDefaulted local_4;
    FECSEntity local_10 = local_4.opCall().GetOwnerEntityWithWorld(Entity.GetWorld());
    GetDefaulted local_18;
    OutRetValue = local_18.opCall().GetbHasTargetPlayerEntity();
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SpawnEntityRecord &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SpawnEntityRecord &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SpawnEntityRecord &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SpawnEntityRecord
{
int __IndexOf_SelectParams()
{
    return 0;
}
int __IndexOf_Prefab()
{
    return 1;
}
int __IndexOf_Entities()
{
    return 2;
}
int __IndexOf_PropNum()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SocialInteractionInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SocialInteractionInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SocialInteractionInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SocialInteractionInfo
{
int __IndexOf_RequestInteractActionTargetPlayerEntity()
{
    return 0;
}
int __IndexOf_bHasTargetPlayerEntity()
{
    return 1;
}
int __IndexOf_RequestInteractActionIndex()
{
    return 2;
}
int __IndexOf_SocialAnimName()
{
    return 3;
}
int __IndexOf_IsInteractMaster()
{
    return 4;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SelectSocialViewPageInteractionInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SelectSocialViewPageInteractionInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SelectSocialViewPageInteractionInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SelectSocialViewPageInteractionInfo
{
int __IndexOf_InteractTarget()
{
    return 0;
}
int __IndexOf_OpenType()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SocialExpressionInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SocialExpressionInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SocialExpressionInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SocialExpressionInfo
{
int __IndexOf_ExpressionContent()
{
    return 0;
}
int __IndexOf_CreateTime()
{
    return 1;
}
}

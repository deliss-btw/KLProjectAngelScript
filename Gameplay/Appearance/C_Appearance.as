
namespace __INTENRAL_FC_FashionState_NS
{
    const TECSComponentDerivedPtr<FC_FashionState> DerivedPtr = TECSComponentDerivedPtr<FC_FashionState>();
    const FC_FashionState DefaultValue = FC_FashionState();
}
namespace __INTENRAL_FC_PlayerFashionState_NS
{
    const TECSComponentDerivedPtr<FC_PlayerFashionState> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerFashionState>();
    const FC_PlayerFashionState DefaultValue = FC_PlayerFashionState();
}
namespace __INTENRAL_FC_FacePresetState_NS
{
    const TECSComponentDerivedPtr<FC_FacePresetState> DerivedPtr = TECSComponentDerivedPtr<FC_FacePresetState>();
    const FC_FacePresetState DefaultValue = FC_FacePresetState();
}
namespace __INTENRAL_FC_ViewEntityAppearance_NS
{
    const TECSComponentDerivedPtr<FC_ViewEntityAppearance> DerivedPtr = TECSComponentDerivedPtr<FC_ViewEntityAppearance>();
    const FC_ViewEntityAppearance DefaultValue = FC_ViewEntityAppearance();
}
namespace __INTENRAL_FCE_PlayerFashionChangedFromDS_NS
{
    const TECSEventDerivedPtr<FCE_PlayerFashionChangedFromDS> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerFashionChangedFromDS>();
}
namespace __INTENRAL_FCE_PlayerFashionSnapshotSyncedToClient_NS
{
    const TECSEventDerivedPtr<FCE_PlayerFashionSnapshotSyncedToClient> DerivedPtr = TECSEventDerivedPtr<FCE_PlayerFashionSnapshotSyncedToClient>();
}
namespace __INTENRAL_FCE_OnReceivePlayerFashionSnapshot_NS
{
    const TECSEventDerivedPtr<FCE_OnReceivePlayerFashionSnapshot> DerivedPtr = TECSEventDerivedPtr<FCE_OnReceivePlayerFashionSnapshot>();

}
struct FRuntimeFashionInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<uint> m_FashionIds;
    UPROPERTY()
    bool m_bUseBathrobe;
    UPROPERTY()
    TMap<uint, FDecoAttachOffset> m_DecoAttachOffsets;

    FRuntimeFashionInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FRuntimeFashionInfo(const FRuntimeFashionInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FRuntimeFashionInfo opAssign(const FRuntimeFashionInfo &inout Other)
    {
        FRuntimeFashionInfo __r;
        this.SetFashionIds(Other.GetFashionIds());
        this.SetbUseBathrobe(Other.GetbUseBathrobe());
        this.SetDecoAttachOffsets(Other.GetDecoAttachOffsets());
        return __r;
    }
    const TArray<uint> GetFashionIds() const property
    {
        const TArray<uint> __r;
        return __r;
    }
    TArray<uint> GetModify_FashionIds() property
    {
        TArray<uint> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetFashionIds(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FashionIds = __Value;
        return;
    }
    bool GetbUseBathrobe() const property
    {
        return this.m_bUseBathrobe;
    }
    void SetbUseBathrobe(const bool __Value) property
    {
        if (!(this.m_bUseBathrobe) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bUseBathrobe = __Value;
        return;
    }
    const TMap<uint, FDecoAttachOffset> GetDecoAttachOffsets() const property
    {
        const TMap<uint, FDecoAttachOffset> __r;
        return __r;
    }
    TMap<uint, FDecoAttachOffset> GetModify_DecoAttachOffsets() property
    {
        TMap<uint, FDecoAttachOffset> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetDecoAttachOffsets(const TMap<uint, FDecoAttachOffset> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_DecoAttachOffsets = __Value;
        return;
    }
}

struct FC_FashionState : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FRuntimeFashionInfo m_FashionInfo;

    FC_FashionState()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_FashionState(const FC_FashionState &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_FashionInfo = Other.m_FashionInfo;
        return;
    }
    FC_FashionState opAssign(const FC_FashionState &inout Other)
    {
        FC_FashionState __r;
        this.SetFashionInfo(Other.GetFashionInfo());
        return __r;
    }
    void SetUseBathrobe(const bool bEnable)
    {
        this.GetFashionInfo().SetbUseBathrobe(bEnable);
        return;
    }
    void AddFashion(const uint DataId)
    {
        int local_50 = 0;
        if (!(::FFashionConfig::GetByDataId(DataId)))
        {
            return;
        }
        bool local_49 = !(::FFashionConfig::IsPlayerFashionSlot(EFashionSlotType(local_50)));
        this.GetFashionInfo().GetModify_FashionIds().AddUnique(DataId);
        return;
    }
    void RemoveFashion(const uint DataId)
    {
        return;
    }
    void AddDeco(const uint DataId, const FVector3f &inout Location, const FRotator3f &inout Rotation, const float32 Scale)
    {
        int local_50 = 0;
        if (!(::FFashionConfig::GetByDataId(DataId)))
        {
            return;
        }
        bool local_49 = !(::FFashionConfig::IsPlayerFashionSlot(EFashionSlotType(local_50)));
        this.GetFashionInfo().GetModify_FashionIds().AddUnique(DataId);
        FDecoAttachOffset local_58;
        local_58.SetLocation(Location);
        local_58.SetRotation(Rotation);
        local_58.SetScale(Scale);
        this.GetFashionInfo().GetModify_DecoAttachOffsets().Add(DataId, local_58);
        return;
    }
    FRuntimeFashionInfo GetFashionInfo() const property
    {
        FRuntimeFashionInfo __r;
        return __r;
    }
    FRuntimeFashionInfo GetFashionInfo() property
    {
        FRuntimeFashionInfo __r;
        return __r;
    }
    void SetFashionInfo(const FRuntimeFashionInfo &inout __Value) property
    {
        this.m_FashionInfo = __Value;
        return;
    }
}

struct FC_PlayerFashionState : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<uint> m_FashionIds;

    FC_PlayerFashionState()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PlayerFashionState(const FC_PlayerFashionState &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_FashionIds = Other.m_FashionIds;
        return;
    }
    FC_PlayerFashionState opAssign(const FC_PlayerFashionState &inout Other)
    {
        FC_PlayerFashionState __r;
        this.SetFashionIds(Other.GetFashionIds());
        return __r;
    }
    void AddFashion(const uint DataId)
    {
        int local_50 = 0;
        if (!(::FFashionConfig::GetByDataId(DataId)))
        {
            return;
        }
        ::FFashionConfig::IsPlayerFashionSlot(EFashionSlotType(local_50));
        this.GetModify_FashionIds().AddUnique(DataId);
        return;
    }
    void RemoveFashion(const uint DataId)
    {
        return;
    }
    const TArray<uint> GetFashionIds() const property
    {
        const TArray<uint> __r;
        return __r;
    }
    TArray<uint> GetModify_FashionIds() property
    {
        TArray<uint> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetFashionIds(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FashionIds = __Value;
        return;
    }
}

struct FAvatarFashionDecoNotifyData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_SlotType;
    UPROPERTY()
    uint m_FashionId;
    UPROPERTY()
    FVector3f m_AttachOffset;
    UPROPERTY()
    FRotator3f m_AttachRotation;
    UPROPERTY()
    float32 m_AttachScale;

    FAvatarFashionDecoNotifyData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAvatarFashionDecoNotifyData(const FAvatarFashionDecoNotifyData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAvatarFashionDecoNotifyData opAssign(const FAvatarFashionDecoNotifyData &inout Other)
    {
        FAvatarFashionDecoNotifyData __r;
        this.SetSlotType(Other.GetSlotType());
        this.SetFashionId(Other.GetFashionId());
        this.SetAttachOffset(Other.GetAttachOffset());
        this.SetAttachRotation(Other.GetAttachRotation());
        this.SetAttachScale(Other.GetAttachScale());
        return __r;
    }
    uint GetSlotType() const property
    {
        return this.m_SlotType;
    }
    void SetSlotType(const uint __Value) property
    {
        if (this.m_SlotType == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SlotType = __Value;
        return;
    }
    uint GetFashionId() const property
    {
        return this.m_FashionId;
    }
    void SetFashionId(const uint __Value) property
    {
        if (this.m_FashionId == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_FashionId = __Value;
        return;
    }
    FVector3f GetAttachOffset() const property
    {
        FVector3f __r;
        return __r;
    }
    FVector3f GetModify_AttachOffset() property
    {
        FVector3f __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetAttachOffset(const FVector3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_AttachOffset = __Value;
        return;
    }
    FRotator3f GetAttachRotation() const property
    {
        FRotator3f __r;
        return __r;
    }
    FRotator3f GetModify_AttachRotation() property
    {
        FRotator3f __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetAttachRotation(const FRotator3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_AttachRotation = __Value;
        return;
    }
    float32 GetAttachScale() const property
    {
        return this.m_AttachScale;
    }
    void SetAttachScale(const float32 __Value) property
    {
        if (this.m_AttachScale == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_AttachScale = __Value;
        return;
    }
}

struct FAvatarFashionNotifyData
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    uint m_AvatarId;
    UPROPERTY()
    uint m_HairId;
    UPROPERTY()
    uint m_TopId;
    UPROPERTY()
    uint m_BottomId;
    UPROPERTY()
    uint m_SuitId;
    UPROPERTY()
    uint m_BathrobeTopId;
    UPROPERTY()
    uint m_BathrobeBottomId;
    UPROPERTY()
    TArray<FAvatarFashionDecoNotifyData> m_Decos;

    FAvatarFashionNotifyData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAvatarFashionNotifyData(const FAvatarFashionNotifyData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAvatarFashionNotifyData opAssign(const FAvatarFashionNotifyData &inout Other)
    {
        FAvatarFashionNotifyData __r;
        this.SetAvatarId(Other.GetAvatarId());
        this.SetHairId(Other.GetHairId());
        this.SetTopId(Other.GetTopId());
        this.SetBottomId(Other.GetBottomId());
        this.SetSuitId(Other.GetSuitId());
        this.SetBathrobeTopId(Other.GetBathrobeTopId());
        this.SetBathrobeBottomId(Other.GetBathrobeBottomId());
        this.SetDecos(Other.GetDecos());
        return __r;
    }
    uint GetAvatarId() const property
    {
        return this.m_AvatarId;
    }
    void SetAvatarId(const uint __Value) property
    {
        if (this.m_AvatarId == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AvatarId = __Value;
        return;
    }
    uint GetHairId() const property
    {
        return this.m_HairId;
    }
    void SetHairId(const uint __Value) property
    {
        if (this.m_HairId == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_HairId = __Value;
        return;
    }
    uint GetTopId() const property
    {
        return this.m_TopId;
    }
    void SetTopId(const uint __Value) property
    {
        if (this.m_TopId == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_TopId = __Value;
        return;
    }
    uint GetBottomId() const property
    {
        return this.m_BottomId;
    }
    void SetBottomId(const uint __Value) property
    {
        if (this.m_BottomId == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_BottomId = __Value;
        return;
    }
    uint GetSuitId() const property
    {
        return this.m_SuitId;
    }
    void SetSuitId(const uint __Value) property
    {
        if (this.m_SuitId == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_SuitId = __Value;
        return;
    }
    uint GetBathrobeTopId() const property
    {
        return this.m_BathrobeTopId;
    }
    void SetBathrobeTopId(const uint __Value) property
    {
        if (this.m_BathrobeTopId == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_BathrobeTopId = __Value;
        return;
    }
    uint GetBathrobeBottomId() const property
    {
        return this.m_BathrobeBottomId;
    }
    void SetBathrobeBottomId(const uint __Value) property
    {
        if (this.m_BathrobeBottomId == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_BathrobeBottomId = __Value;
        return;
    }
    TArray<FAvatarFashionDecoNotifyData> GetDecos() const property
    {
        TArray<FAvatarFashionDecoNotifyData> __r;
        return __r;
    }
    TArray<FAvatarFashionDecoNotifyData> GetModify_Decos() property
    {
        TArray<FAvatarFashionDecoNotifyData> __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetDecos(const TArray<FAvatarFashionDecoNotifyData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_Decos = __Value;
        return;
    }
}

struct FPlayerFashionNotifySnapshot
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FAvatarFashionNotifyData> m_AvatarFashions;
    UPROPERTY()
    uint m_MountId;
    UPROPERTY()
    uint m_MountDecoId;
    UPROPERTY()
    uint m_FacePresetId;

    FPlayerFashionNotifySnapshot()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPlayerFashionNotifySnapshot(const FPlayerFashionNotifySnapshot &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPlayerFashionNotifySnapshot opAssign(const FPlayerFashionNotifySnapshot &inout Other)
    {
        FPlayerFashionNotifySnapshot __r;
        this.SetAvatarFashions(Other.GetAvatarFashions());
        this.SetMountId(Other.GetMountId());
        this.SetMountDecoId(Other.GetMountDecoId());
        this.SetFacePresetId(Other.GetFacePresetId());
        return __r;
    }
    const TArray<FAvatarFashionNotifyData> GetAvatarFashions() const property
    {
        const TArray<FAvatarFashionNotifyData> __r;
        return __r;
    }
    TArray<FAvatarFashionNotifyData> GetModify_AvatarFashions() property
    {
        TArray<FAvatarFashionNotifyData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAvatarFashions(const TArray<FAvatarFashionNotifyData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AvatarFashions = __Value;
        return;
    }
    uint GetMountId() const property
    {
        return this.m_MountId;
    }
    void SetMountId(const uint __Value) property
    {
        if (this.m_MountId == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_MountId = __Value;
        return;
    }
    uint GetMountDecoId() const property
    {
        return this.m_MountDecoId;
    }
    void SetMountDecoId(const uint __Value) property
    {
        if (this.m_MountDecoId == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_MountDecoId = __Value;
        return;
    }
    uint GetFacePresetId() const property
    {
        return this.m_FacePresetId;
    }
    void SetFacePresetId(const uint __Value) property
    {
        if (this.m_FacePresetId == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_FacePresetId = __Value;
        return;
    }
}

struct FCE_PlayerFashionChangedFromDS : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FPlayerFashionNotifySnapshot Snapshot;

    FCE_PlayerFashionChangedFromDS()
    {
        return;
    }
}

struct FCE_PlayerFashionSnapshotSyncedToClient : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FPlayerFashionNotifySnapshot Snapshot;

    FCE_PlayerFashionSnapshotSyncedToClient()
    {
        return;
    }
}

struct FCE_OnReceivePlayerFashionSnapshot : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FPlayerFashionNotifySnapshot Snapshot;

    FCE_OnReceivePlayerFashionSnapshot()
    {
        return;
    }
}

struct FC_FacePresetState : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint m_FacePresetId;

    FC_FacePresetState()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_FacePresetState(const FC_FacePresetState &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_FacePresetState opAssign(const FC_FacePresetState &inout Other)
    {
        FC_FacePresetState __r;
        this.SetFacePresetId(Other.GetFacePresetId());
        return __r;
    }
    void SetFacePreset(const uint DataId)
    {
        if (DataId == 0)
        {
            this.SetFacePresetId(0);
            return;
        }
        if (!(::FFacePresetConfig::GetByDataId(DataId)))
        {
            return;
        }
        this.SetFacePresetId(DataId);
        return;
    }
    uint GetFacePresetId() const property
    {
        return this.m_FacePresetId;
    }
    void SetFacePresetId(const uint __Value) property
    {
        if (this.m_FacePresetId == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FacePresetId = __Value;
        return;
    }
}

struct FC_ViewEntityAppearance : FECSComponent
{
    UPROPERTY()
    uint FacePresetId = 0;
    UPROPERTY()
    uint AvatarId = 0;
    UPROPERTY()
    FRuntimeFashionInfo FashionInfo;


}

namespace ECSFunc_FC_FashionState
{
UFUNCTION()
bool HasFashionState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FashionState);
}
FC_FashionState& AssignFashionState(const FECSEntity &inout Entity, const FC_FashionState &inout DefaultValue = FC_FashionState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FashionState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFashionState_BP(const FECSEntity &inout Entity, const FC_FashionState &inout DefaultValue = FC_FashionState())
{
    ECSFunc_FC_FashionState::AssignFashionState(Entity, DefaultValue);
    return;
}
FC_FashionState& ModifyFashionState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FashionState));
    return local_12.GetComp();
}
FC_FashionState& ModifyOrAddFashionState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FashionState));
    return local_12.GetComp();
}
const FC_FashionState& GetFashionState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FashionState));
    return local_12.GetComp();
}
UFUNCTION()
FC_FashionState GetFashionState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_FashionState& local_4 = ECSFunc_FC_FashionState::GetFashionState(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_FashionState();
}
const FC_FashionState GetDefaultedFashionState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FashionState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FashionState);
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
FC_FashionState GetDefaultedFashionState_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_FashionState::GetDefaultedFashionState(Entity);
}
UFUNCTION()
bool RemoveFashionState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FashionState);
}
}
FECSMonitorRuntimeView __GetMonitorFashionStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FashionState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFashionStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FashionState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFashionStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FashionState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFashionStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FashionState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFashionStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FashionState, bFixedFrame, bMustHandleAll);
}
void __MonitorFashionStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FashionState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFashionStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FashionState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFashionStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FashionState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerFashionState
{
UFUNCTION()
bool HasPlayerFashionState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerFashionState);
}
FC_PlayerFashionState& AssignPlayerFashionState(const FECSEntity &inout Entity, const FC_PlayerFashionState &inout DefaultValue = FC_PlayerFashionState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerFashionState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerFashionState_BP(const FECSEntity &inout Entity, const FC_PlayerFashionState &inout DefaultValue = FC_PlayerFashionState())
{
    ECSFunc_FC_PlayerFashionState::AssignPlayerFashionState(Entity, DefaultValue);
    return;
}
FC_PlayerFashionState& ModifyPlayerFashionState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerFashionState));
    return local_12.GetComp();
}
FC_PlayerFashionState& ModifyOrAddPlayerFashionState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerFashionState));
    return local_12.GetComp();
}
const FC_PlayerFashionState& GetPlayerFashionState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerFashionState));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerFashionState GetPlayerFashionState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerFashionState& local_4 = ECSFunc_FC_PlayerFashionState::GetPlayerFashionState(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerFashionState();
}
const FC_PlayerFashionState GetDefaultedPlayerFashionState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerFashionState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerFashionState);
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
FC_PlayerFashionState GetDefaultedPlayerFashionState_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerFashionState::GetDefaultedPlayerFashionState(Entity);
}
UFUNCTION()
bool RemovePlayerFashionState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerFashionState);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerFashionStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerFashionState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerFashionStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerFashionState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerFashionStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerFashionState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerFashionStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerFashionState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerFashionStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerFashionState, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerFashionStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerFashionState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerFashionStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerFashionState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerFashionStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerFashionState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_FacePresetState
{
UFUNCTION()
bool HasFacePresetState(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FacePresetState);
}
FC_FacePresetState& AssignFacePresetState(const FECSEntity &inout Entity, const FC_FacePresetState &inout DefaultValue = FC_FacePresetState())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FacePresetState, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFacePresetState_BP(const FECSEntity &inout Entity, const FC_FacePresetState &inout DefaultValue = FC_FacePresetState())
{
    ECSFunc_FC_FacePresetState::AssignFacePresetState(Entity, DefaultValue);
    return;
}
FC_FacePresetState& ModifyFacePresetState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FacePresetState));
    return local_12.GetComp();
}
FC_FacePresetState& ModifyOrAddFacePresetState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FacePresetState));
    return local_12.GetComp();
}
const FC_FacePresetState& GetFacePresetState(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FacePresetState));
    return local_12.GetComp();
}
UFUNCTION()
FC_FacePresetState GetFacePresetState_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_FacePresetState& local_4 = ECSFunc_FC_FacePresetState::GetFacePresetState(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_FacePresetState();
}
const FC_FacePresetState GetDefaultedFacePresetState(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FacePresetState __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FacePresetState);
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
FC_FacePresetState GetDefaultedFacePresetState_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_FacePresetState::GetDefaultedFacePresetState(Entity);
}
UFUNCTION()
bool RemoveFacePresetState(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FacePresetState);
}
}
FECSMonitorRuntimeView __GetMonitorFacePresetStateOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FacePresetState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFacePresetStateOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FacePresetState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFacePresetStateOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FacePresetState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFacePresetStateOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FacePresetState, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFacePresetStateOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FacePresetState, bFixedFrame, bMustHandleAll);
}
void __MonitorFacePresetStateLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FacePresetState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFacePresetStateActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FacePresetState, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFacePresetStateModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FacePresetState, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ViewEntityAppearance
{
UFUNCTION()
bool HasViewEntityAppearance(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ViewEntityAppearance);
}
FC_ViewEntityAppearance& AssignViewEntityAppearance(const FECSEntity &inout Entity, const FC_ViewEntityAppearance &inout DefaultValue = FC_ViewEntityAppearance())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ViewEntityAppearance, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignViewEntityAppearance_BP(const FECSEntity &inout Entity, const FC_ViewEntityAppearance &inout DefaultValue = FC_ViewEntityAppearance())
{
    ECSFunc_FC_ViewEntityAppearance::AssignViewEntityAppearance(Entity, DefaultValue);
    return;
}
FC_ViewEntityAppearance& ModifyViewEntityAppearance(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ViewEntityAppearance));
    return local_12.GetComp();
}
FC_ViewEntityAppearance& ModifyOrAddViewEntityAppearance(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ViewEntityAppearance));
    return local_12.GetComp();
}
const FC_ViewEntityAppearance& GetViewEntityAppearance(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ViewEntityAppearance));
    return local_12.GetComp();
}
UFUNCTION()
FC_ViewEntityAppearance GetViewEntityAppearance_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ViewEntityAppearance __r;
    bValid = false;
    bValid = ECSFunc_FC_ViewEntityAppearance::GetViewEntityAppearance(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ViewEntityAppearance GetDefaultedViewEntityAppearance(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ViewEntityAppearance __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ViewEntityAppearance);
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
FC_ViewEntityAppearance GetDefaultedViewEntityAppearance_BP(const FECSEntity &inout Entity)
{
    FC_ViewEntityAppearance __r;
    return __r;
}
UFUNCTION()
bool RemoveViewEntityAppearance(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ViewEntityAppearance);
}
}
FECSMonitorRuntimeView __GetMonitorViewEntityAppearanceOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ViewEntityAppearance, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewEntityAppearanceOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ViewEntityAppearance, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewEntityAppearanceOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ViewEntityAppearance, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewEntityAppearanceOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ViewEntityAppearance, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewEntityAppearanceOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ViewEntityAppearance, bFixedFrame, bMustHandleAll);
}
void __MonitorViewEntityAppearanceLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ViewEntityAppearance, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorViewEntityAppearanceActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ViewEntityAppearance, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorViewEntityAppearanceModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ViewEntityAppearance, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FRuntimeFashionInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FRuntimeFashionInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FRuntimeFashionInfo
{
int __IndexOf_FashionIds()
{
    return 0;
}
int __IndexOf_bUseBathrobe()
{
    return 1;
}
int __IndexOf_DecoAttachOffsets()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_FashionState &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_FashionState &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_FashionState &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_FashionState
{
int __IndexOf_FashionInfo()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerFashionState &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerFashionState &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerFashionState &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerFashionState
{
int __IndexOf_FashionIds()
{
    return 0;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FAvatarFashionDecoNotifyData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FAvatarFashionDecoNotifyData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAvatarFashionDecoNotifyData
{
int __IndexOf_SlotType()
{
    return 0;
}
int __IndexOf_FashionId()
{
    return 1;
}
int __IndexOf_AttachOffset()
{
    return 2;
}
int __IndexOf_AttachRotation()
{
    return 3;
}
int __IndexOf_AttachScale()
{
    return 4;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FAvatarFashionNotifyData &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FAvatarFashionNotifyData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAvatarFashionNotifyData
{
int __IndexOf_AvatarId()
{
    return 0;
}
int __IndexOf_HairId()
{
    return 1;
}
int __IndexOf_TopId()
{
    return 2;
}
int __IndexOf_BottomId()
{
    return 3;
}
int __IndexOf_SuitId()
{
    return 4;
}
int __IndexOf_BathrobeTopId()
{
    return 5;
}
int __IndexOf_BathrobeBottomId()
{
    return 6;
}
int __IndexOf_Decos()
{
    return 7;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FPlayerFashionNotifySnapshot &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FPlayerFashionNotifySnapshot &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPlayerFashionNotifySnapshot
{
int __IndexOf_AvatarFashions()
{
    return 0;
}
int __IndexOf_MountId()
{
    return 1;
}
int __IndexOf_MountDecoId()
{
    return 2;
}
int __IndexOf_FacePresetId()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_FacePresetState &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_FacePresetState &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_FacePresetState &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_FacePresetState
{
int __IndexOf_FacePresetId()
{
    return 0;
}
}


enum EZeroOutRotationAxisWhenDetach
{
    Pitch,
    Yaw,
    Roll,
}

enum ETransformAttachmentLogicMode
{
    SocketName,
    TransformCompnent,
    BoneIndex,
}

namespace __INTENRAL_FC_AttachmentChildren_NS
{
    const TECSComponentDerivedPtr<FC_AttachmentChildren> DerivedPtr = TECSComponentDerivedPtr<FC_AttachmentChildren>();
    const FC_AttachmentChildren DefaultValue = FC_AttachmentChildren();
}
namespace __INTENRAL_FC_AttachmentParent_NS
{
    const TECSComponentDerivedPtr<FC_AttachmentParent> DerivedPtr = TECSComponentDerivedPtr<FC_AttachmentParent>();
    const FC_AttachmentParent DefaultValue = FC_AttachmentParent();
}
namespace __INTENRAL_FC_AttachmentAnimationData_NS
{
    const TECSComponentDerivedPtr<FC_AttachmentAnimationData> DerivedPtr = TECSComponentDerivedPtr<FC_AttachmentAnimationData>();
    const FC_AttachmentAnimationData DefaultValue = FC_AttachmentAnimationData();
}
namespace __INTENRAL_FC_TransformAttachmentLogic_NS
{
    const TECSComponentDerivedPtr<FC_TransformAttachmentLogic> DerivedPtr = TECSComponentDerivedPtr<FC_TransformAttachmentLogic>();
    const FC_TransformAttachmentLogic DefaultValue = FC_TransformAttachmentLogic();
}
namespace __INTENRAL_FC_SyncTransformAttachmentPresentation_NS
{
    const TECSComponentDerivedPtr<FC_SyncTransformAttachmentPresentation> DerivedPtr = TECSComponentDerivedPtr<FC_SyncTransformAttachmentPresentation>();
    const FC_SyncTransformAttachmentPresentation DefaultValue = FC_SyncTransformAttachmentPresentation();
}
namespace __INTENRAL_FC_ViewTransformAttachmentPresentation_NS
{
    const TECSComponentDerivedPtr<FC_ViewTransformAttachmentPresentation> DerivedPtr = TECSComponentDerivedPtr<FC_ViewTransformAttachmentPresentation>();
    const FC_ViewTransformAttachmentPresentation DefaultValue = FC_ViewTransformAttachmentPresentation();
}
namespace __INTENRAL_FC_ViewDetachBlend_NS
{
    const TECSComponentDerivedPtr<FC_ViewDetachBlend> DerivedPtr = TECSComponentDerivedPtr<FC_ViewDetachBlend>();
    const FC_ViewDetachBlend DefaultValue = FC_ViewDetachBlend();
}
namespace __INTENRAL_FC_ViewDetachTeleportHold_NS
{
    const TECSComponentDerivedPtr<FC_ViewDetachTeleportHold> DerivedPtr = TECSComponentDerivedPtr<FC_ViewDetachTeleportHold>();
    const FC_ViewDetachTeleportHold DefaultValue = FC_ViewDetachTeleportHold();
}
namespace __INTENRAL_FC_AttachChildrenChangedTag_NS
{
    const TECSComponentDerivedPtr<FC_AttachChildrenChangedTag> DerivedPtr = TECSComponentDerivedPtr<FC_AttachChildrenChangedTag>();
    const FC_AttachChildrenChangedTag DefaultValue = FC_AttachChildrenChangedTag();
}
namespace __INTENRAL_FCE_EntityAttachmentOperation_NS
{
    const TECSEventDerivedPtr<FCE_EntityAttachmentOperation> DerivedPtr = TECSEventDerivedPtr<FCE_EntityAttachmentOperation>();

}
struct FAttachmentInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_SocketName = NAME_None;
    UPROPERTY()
    bool m_bAttachOffsetBaseOnRootTransform = false;
    UPROPERTY()
    FVector m_LocationOffset = FVector::ZeroVector;
    UPROPERTY()
    FRotator m_RotationOffset = FRotator::ZeroRotator;
    UPROPERTY()
    bool m_bRestoreAlignedStaticSocketOnDetach = false;

    FAttachmentInfo(const FAttachmentInfo &inout Other)
    {
        this.m_SocketName = Other.m_SocketName;
        this.m_bAttachOffsetBaseOnRootTransform = Other.m_bAttachOffsetBaseOnRootTransform;
        this.m_LocationOffset = Other.m_LocationOffset;
        this.m_RotationOffset = Other.m_RotationOffset;
        this.m_bRestoreAlignedStaticSocketOnDetach = Other.m_bRestoreAlignedStaticSocketOnDetach;
        return;
    }
    FAttachmentInfo opAssign(const FAttachmentInfo &inout Other)
    {
        FAttachmentInfo __r;
        this.SetSocketName(Other.GetSocketName());
        this.SetbAttachOffsetBaseOnRootTransform(Other.GetbAttachOffsetBaseOnRootTransform());
        this.SetLocationOffset(Other.GetLocationOffset());
        this.SetRotationOffset(Other.GetRotationOffset());
        this.SetbRestoreAlignedStaticSocketOnDetach(Other.GetbRestoreAlignedStaticSocketOnDetach());
        return __r;
    }
    FName GetSocketName() const property
    {
        return this.m_SocketName;
    }
    void SetSocketName(const FName &inout __Value) property
    {
        if ((this.m_SocketName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SocketName = __Value;
        return;
    }
    bool GetbAttachOffsetBaseOnRootTransform() const property
    {
        return this.m_bAttachOffsetBaseOnRootTransform;
    }
    void SetbAttachOffsetBaseOnRootTransform(const bool __Value) property
    {
        if (!(this.m_bAttachOffsetBaseOnRootTransform) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bAttachOffsetBaseOnRootTransform = __Value;
        return;
    }
    const FVector GetLocationOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LocationOffset() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetLocationOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LocationOffset = __Value;
        return;
    }
    const FRotator GetRotationOffset() const property
    {
        const FRotator __r;
        return __r;
    }
    FRotator GetModify_RotationOffset() property
    {
        FRotator __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetRotationOffset(const FRotator &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_RotationOffset = __Value;
        return;
    }
    bool GetbRestoreAlignedStaticSocketOnDetach() const property
    {
        return this.m_bRestoreAlignedStaticSocketOnDetach;
    }
    void SetbRestoreAlignedStaticSocketOnDetach(const bool __Value) property
    {
        if (!(this.m_bRestoreAlignedStaticSocketOnDetach) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bRestoreAlignedStaticSocketOnDetach = __Value;
        return;
    }
}

struct FAttachmentRequestParam
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_SocketName = NAME_None;
    UPROPERTY()
    FVector m_LocationOffset;
    UPROPERTY()
    FRotator m_RotationOffset;
    UPROPERTY()
    bool m_bUseDetachOffset = true;
    UPROPERTY()
    FVector m_DetachLocationOffset;
    UPROPERTY()
    FRotator m_DetachRotationOffset;

    FAttachmentRequestParam(const FAttachmentRequestParam &inout Other)
    {
        this.m_SocketName = Other.m_SocketName;
        this.m_LocationOffset = Other.m_LocationOffset;
        this.m_RotationOffset = Other.m_RotationOffset;
        this.m_bUseDetachOffset = Other.m_bUseDetachOffset;
        this.m_DetachLocationOffset = Other.m_DetachLocationOffset;
        this.m_DetachRotationOffset = Other.m_DetachRotationOffset;
        return;
    }
    FAttachmentRequestParam opAssign(const FAttachmentRequestParam &inout Other)
    {
        FAttachmentRequestParam __r;
        this.SetSocketName(Other.GetSocketName());
        this.SetLocationOffset(Other.GetLocationOffset());
        this.SetRotationOffset(Other.GetRotationOffset());
        this.SetbUseDetachOffset(Other.GetbUseDetachOffset());
        this.SetDetachLocationOffset(Other.GetDetachLocationOffset());
        this.SetDetachRotationOffset(Other.GetDetachRotationOffset());
        return __r;
    }
    FName GetSocketName() const property
    {
        return this.m_SocketName;
    }
    void SetSocketName(const FName &inout __Value) property
    {
        if ((this.m_SocketName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SocketName = __Value;
        return;
    }
    const FVector GetLocationOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LocationOffset() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetLocationOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_LocationOffset = __Value;
        return;
    }
    const FRotator GetRotationOffset() const property
    {
        const FRotator __r;
        return __r;
    }
    FRotator GetModify_RotationOffset() property
    {
        FRotator __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetRotationOffset(const FRotator &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_RotationOffset = __Value;
        return;
    }
    bool GetbUseDetachOffset() const property
    {
        return this.m_bUseDetachOffset;
    }
    void SetbUseDetachOffset(const bool __Value) property
    {
        if (!(this.m_bUseDetachOffset) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bUseDetachOffset = __Value;
        return;
    }
    const FVector GetDetachLocationOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_DetachLocationOffset() property
    {
        FVector __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetDetachLocationOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_DetachLocationOffset = __Value;
        return;
    }
    const FRotator GetDetachRotationOffset() const property
    {
        const FRotator __r;
        return __r;
    }
    FRotator GetModify_DetachRotationOffset() property
    {
        FRotator __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetDetachRotationOffset(const FRotator &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_DetachRotationOffset = __Value;
        return;
    }
}

struct FC_AttachmentChildren : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FECSEntity> m_Children;

    FC_AttachmentChildren()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_AttachmentChildren(const FC_AttachmentChildren &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Children = Other.m_Children;
        return;
    }
    FC_AttachmentChildren opAssign(const FC_AttachmentChildren &inout Other)
    {
        FC_AttachmentChildren __r;
        this.SetChildren(Other.GetChildren());
        return __r;
    }
    const TArray<FECSEntity> GetChildren() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetModify_Children() property
    {
        TArray<FECSEntity> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetChildren(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Children = __Value;
        return;
    }
}

struct FC_AttachmentParent : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_Parent;

    FC_AttachmentParent()
    {
        this.m_Parent = ENTITY_NULL;
        this.__InitDirtyFlags();
        return;
    }
    FC_AttachmentParent(const FC_AttachmentParent &inout Other)
    {
        this.m_Parent = ENTITY_NULL;
        this.__InitDirtyFlags();
        this.m_Parent = Other.m_Parent;
        return;
    }
    FC_AttachmentParent opAssign(const FC_AttachmentParent &inout Other)
    {
        FC_AttachmentParent __r;
        this.SetParent(Other.GetParent());
        return __r;
    }
    FECSEntity GetParent() const property
    {
        FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_Parent() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetParent(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Parent = __Value;
        return;
    }
}

struct FEventAttachToEntity
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_Parent = ENTITY_NULL;
    UPROPERTY()
    FAttachmentInfo m_AttachmentInfo;
    UPROPERTY()
    float32 m_AttachBlendInDuration = 0.0f;
    UPROPERTY()
    float32 m_AttachBlendKeepDuration = 0.0f;
    UPROPERTY()
    float32 m_DetachBlendOutDuration = 0.0f;
    UPROPERTY()
    int m_AttachSocketUpdatePeriod = 0;
    UPROPERTY()
    FVector m_LogicLocationOffsetExtra = FVector::ZeroVector;

    FEventAttachToEntity(const FEventAttachToEntity &inout Other)
    {
        this.m_Parent = Other.m_Parent;
        this.m_AttachmentInfo = Other.m_AttachmentInfo;
        this.m_AttachBlendInDuration = Other.m_AttachBlendInDuration;
        this.m_AttachBlendKeepDuration = Other.m_AttachBlendKeepDuration;
        this.m_DetachBlendOutDuration = Other.m_DetachBlendOutDuration;
        this.m_AttachSocketUpdatePeriod = int(Other.m_AttachSocketUpdatePeriod);
        this.m_LogicLocationOffsetExtra = Other.m_LogicLocationOffsetExtra;
        return;
    }
    FEventAttachToEntity opAssign(const FEventAttachToEntity &inout Other)
    {
        FEventAttachToEntity __r;
        this.SetParent(Other.GetParent());
        this.SetAttachmentInfo(Other.GetAttachmentInfo());
        this.SetAttachBlendInDuration(Other.GetAttachBlendInDuration());
        this.SetAttachBlendKeepDuration(Other.GetAttachBlendKeepDuration());
        this.SetDetachBlendOutDuration(Other.GetDetachBlendOutDuration());
        this.SetAttachSocketUpdatePeriod(Other.GetAttachSocketUpdatePeriod());
        this.SetLogicLocationOffsetExtra(Other.GetLogicLocationOffsetExtra());
        return __r;
    }
    FECSEntity GetParent() const property
    {
        FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_Parent() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetParent(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Parent = __Value;
        return;
    }
    const FAttachmentInfo GetAttachmentInfo() const property
    {
        const FAttachmentInfo __r;
        return __r;
    }
    FAttachmentInfo GetAttachmentInfo() property
    {
        FAttachmentInfo __r;
        return __r;
    }
    void SetAttachmentInfo(const FAttachmentInfo &inout __Value) property
    {
        this.m_AttachmentInfo = __Value;
        return;
    }
    float32 GetAttachBlendInDuration() const property
    {
        return this.m_AttachBlendInDuration;
    }
    void SetAttachBlendInDuration(const float32 __Value) property
    {
        if (this.m_AttachBlendInDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_AttachBlendInDuration = __Value;
        return;
    }
    float32 GetAttachBlendKeepDuration() const property
    {
        return this.m_AttachBlendKeepDuration;
    }
    void SetAttachBlendKeepDuration(const float32 __Value) property
    {
        if (this.m_AttachBlendKeepDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_AttachBlendKeepDuration = __Value;
        return;
    }
    float32 GetDetachBlendOutDuration() const property
    {
        return this.m_DetachBlendOutDuration;
    }
    void SetDetachBlendOutDuration(const float32 __Value) property
    {
        if (this.m_DetachBlendOutDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_DetachBlendOutDuration = __Value;
        return;
    }
    int GetAttachSocketUpdatePeriod() const property
    {
        return this.m_AttachSocketUpdatePeriod;
    }
    void SetAttachSocketUpdatePeriod(const int __Value) property
    {
        if (this.m_AttachSocketUpdatePeriod == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_AttachSocketUpdatePeriod = __Value;
        return;
    }
    const FVector GetLogicLocationOffsetExtra() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LogicLocationOffsetExtra() property
    {
        FVector __r;
        this.__MarkDirty(10);
        return __r;
    }
    void SetLogicLocationOffsetExtra(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_LogicLocationOffsetExtra = __Value;
        return;
    }
}

struct FEventDetachFromEntity
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bUseDetachLocationOffset;
    UPROPERTY()
    bool m_bUseDetachRotationOffset;
    UPROPERTY()
    FVector m_LocationOffset;
    UPROPERTY()
    FRotator m_RotationOffset;
    UPROPERTY()
    bool m_bOffsetBaseOnRootTransform;
    UPROPERTY()
    uint8 m_ZeroOutRotationAxisWhenDetach;
    UPROPERTY()
    bool m_bAvoidPenetrationFromParentPos;

    FEventDetachFromEntity()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FEventDetachFromEntity(const FEventDetachFromEntity &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FEventDetachFromEntity opAssign(const FEventDetachFromEntity &inout Other)
    {
        FEventDetachFromEntity __r;
        this.SetbUseDetachLocationOffset(Other.GetbUseDetachLocationOffset());
        this.SetbUseDetachRotationOffset(Other.GetbUseDetachRotationOffset());
        this.SetLocationOffset(Other.GetLocationOffset());
        this.SetRotationOffset(Other.GetRotationOffset());
        this.SetbOffsetBaseOnRootTransform(Other.GetbOffsetBaseOnRootTransform());
        this.SetZeroOutRotationAxisWhenDetach(uint8(Other.GetZeroOutRotationAxisWhenDetach()));
        this.SetbAvoidPenetrationFromParentPos(Other.GetbAvoidPenetrationFromParentPos());
        return __r;
    }
    bool GetbUseDetachLocationOffset() const property
    {
        return this.m_bUseDetachLocationOffset;
    }
    void SetbUseDetachLocationOffset(const bool __Value) property
    {
        if (!(this.m_bUseDetachLocationOffset) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bUseDetachLocationOffset = __Value;
        return;
    }
    bool GetbUseDetachRotationOffset() const property
    {
        return this.m_bUseDetachRotationOffset;
    }
    void SetbUseDetachRotationOffset(const bool __Value) property
    {
        if (!(this.m_bUseDetachRotationOffset) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bUseDetachRotationOffset = __Value;
        return;
    }
    const FVector GetLocationOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LocationOffset() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetLocationOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LocationOffset = __Value;
        return;
    }
    const FRotator GetRotationOffset() const property
    {
        const FRotator __r;
        return __r;
    }
    FRotator GetModify_RotationOffset() property
    {
        FRotator __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetRotationOffset(const FRotator &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_RotationOffset = __Value;
        return;
    }
    bool GetbOffsetBaseOnRootTransform() const property
    {
        return this.m_bOffsetBaseOnRootTransform;
    }
    void SetbOffsetBaseOnRootTransform(const bool __Value) property
    {
        if (!(this.m_bOffsetBaseOnRootTransform) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bOffsetBaseOnRootTransform = __Value;
        return;
    }
    uint8 GetZeroOutRotationAxisWhenDetach() const property
    {
        return this.m_ZeroOutRotationAxisWhenDetach;
    }
    void SetZeroOutRotationAxisWhenDetach(const uint8 __Value) property
    {
        if (this.m_ZeroOutRotationAxisWhenDetach == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_ZeroOutRotationAxisWhenDetach = (__Value != 0);
        return;
    }
    bool GetbAvoidPenetrationFromParentPos() const property
    {
        return this.m_bAvoidPenetrationFromParentPos;
    }
    void SetbAvoidPenetrationFromParentPos(const bool __Value) property
    {
        if (!(this.m_bAvoidPenetrationFromParentPos) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_bAvoidPenetrationFromParentPos = __Value;
        return;
    }
}

struct FCE_EntityAttachmentOperation : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bIsAttach = true;
    UPROPERTY()
    FEventAttachToEntity AttachEvent;
    UPROPERTY()
    FEventDetachFromEntity DetachEvent;


}

struct FC_AttachmentAnimationData : FECSComponent
{
    UPROPERTY()
    FVector Location;
    UPROPERTY()
    float32 AttachMoveGait = 0.0f;


}

struct FC_TransformAttachmentLogic : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    ETransformAttachmentLogicMode m_AttachmentMode;
    UPROPERTY()
    bool m_bWorldSpaceLocationOffset;
    UPROPERTY()
    FECSEntity m_AttachToEntity;
    UPROPERTY()
    FName m_SocketName;
    UPROPERTY()
    int m_BoneIndex;
    UPROPERTY()
    FVector m_LocationOffset;
    UPROPERTY()
    FQuat m_RotationOffset;
    UPROPERTY()
    int m_AttachSocketUpdatePeriod;
    UPROPERTY()
    bool m_bRestoreAlignedStaticSocketOnDetach;
    UPROPERTY()
    FVector m_AlignedStaticSocketInverseLocationOffset;
    UPROPERTY()
    FQuat m_AlignedStaticSocketInverseRotationOffset;

    FC_TransformAttachmentLogic()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_TransformAttachmentLogic(const FC_TransformAttachmentLogic &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_TransformAttachmentLogic opAssign(const FC_TransformAttachmentLogic &inout Other)
    {
        FC_TransformAttachmentLogic __r;
        this.SetAttachmentMode(Other.GetAttachmentMode());
        this.SetbWorldSpaceLocationOffset(Other.GetbWorldSpaceLocationOffset());
        this.SetAttachToEntity(Other.GetAttachToEntity());
        this.SetSocketName(Other.GetSocketName());
        this.SetBoneIndex(Other.GetBoneIndex());
        this.SetLocationOffset(Other.GetLocationOffset());
        this.SetRotationOffset(Other.GetRotationOffset());
        this.SetAttachSocketUpdatePeriod(Other.GetAttachSocketUpdatePeriod());
        this.SetbRestoreAlignedStaticSocketOnDetach(Other.GetbRestoreAlignedStaticSocketOnDetach());
        this.SetAlignedStaticSocketInverseLocationOffset(Other.GetAlignedStaticSocketInverseLocationOffset());
        this.SetAlignedStaticSocketInverseRotationOffset(Other.GetAlignedStaticSocketInverseRotationOffset());
        return __r;
    }
    ETransformAttachmentLogicMode GetAttachmentMode() const property
    {
        return this.m_AttachmentMode;
    }
    void SetAttachmentMode(const ETransformAttachmentLogicMode __Value) property
    {
        if (int(this.m_AttachmentMode) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AttachmentMode = __Value;
        return;
    }
    bool GetbWorldSpaceLocationOffset() const property
    {
        return this.m_bWorldSpaceLocationOffset;
    }
    void SetbWorldSpaceLocationOffset(const bool __Value) property
    {
        if (!(this.m_bWorldSpaceLocationOffset) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bWorldSpaceLocationOffset = __Value;
        return;
    }
    const FECSEntity GetAttachToEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_AttachToEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetAttachToEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_AttachToEntity = __Value;
        return;
    }
    FName GetSocketName() const property
    {
        return this.m_SocketName;
    }
    void SetSocketName(const FName &inout __Value) property
    {
        if ((this.m_SocketName == __Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_SocketName = __Value;
        return;
    }
    int GetBoneIndex() const property
    {
        return this.m_BoneIndex;
    }
    void SetBoneIndex(const int __Value) property
    {
        if (this.m_BoneIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_BoneIndex = __Value;
        return;
    }
    const FVector GetLocationOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LocationOffset() property
    {
        FVector __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetLocationOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_LocationOffset = __Value;
        return;
    }
    const FQuat GetRotationOffset() const property
    {
        const FQuat __r;
        return __r;
    }
    FQuat GetModify_RotationOffset() property
    {
        FQuat __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetRotationOffset(const FQuat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_RotationOffset = __Value;
        return;
    }
    int GetAttachSocketUpdatePeriod() const property
    {
        return this.m_AttachSocketUpdatePeriod;
    }
    void SetAttachSocketUpdatePeriod(const int __Value) property
    {
        if (this.m_AttachSocketUpdatePeriod == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_AttachSocketUpdatePeriod = __Value;
        return;
    }
    bool GetbRestoreAlignedStaticSocketOnDetach() const property
    {
        return this.m_bRestoreAlignedStaticSocketOnDetach;
    }
    void SetbRestoreAlignedStaticSocketOnDetach(const bool __Value) property
    {
        if (!(this.m_bRestoreAlignedStaticSocketOnDetach) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_bRestoreAlignedStaticSocketOnDetach = __Value;
        return;
    }
    const FVector GetAlignedStaticSocketInverseLocationOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_AlignedStaticSocketInverseLocationOffset() property
    {
        FVector __r;
        this.__MarkDirty(9);
        return __r;
    }
    void SetAlignedStaticSocketInverseLocationOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_AlignedStaticSocketInverseLocationOffset = __Value;
        return;
    }
    const FQuat GetAlignedStaticSocketInverseRotationOffset() const property
    {
        const FQuat __r;
        return __r;
    }
    FQuat GetModify_AlignedStaticSocketInverseRotationOffset() property
    {
        FQuat __r;
        this.__MarkDirty(10);
        return __r;
    }
    void SetAlignedStaticSocketInverseRotationOffset(const FQuat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_AlignedStaticSocketInverseRotationOffset = __Value;
        return;
    }
}

struct FC_SyncTransformAttachmentPresentation : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_AttachToEntity;
    UPROPERTY()
    FName m_SocketName;
    UPROPERTY()
    bool m_bNeedBlendInView;
    UPROPERTY()
    FVector m_LocationOffset;
    UPROPERTY()
    FQuat m_RotationOffset;
    UPROPERTY()
    float32 m_BlendKeepDuration;
    UPROPERTY()
    float32 m_BlendInDuration;
    UPROPERTY()
    float32 m_BlendOutDuration;
    UPROPERTY()
    FFPTime m_AttachTime;

    FC_SyncTransformAttachmentPresentation()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_SyncTransformAttachmentPresentation(const FC_SyncTransformAttachmentPresentation &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_SyncTransformAttachmentPresentation opAssign(const FC_SyncTransformAttachmentPresentation &inout Other)
    {
        FC_SyncTransformAttachmentPresentation __r;
        this.SetAttachToEntity(Other.GetAttachToEntity());
        this.SetSocketName(Other.GetSocketName());
        this.SetbNeedBlendInView(Other.GetbNeedBlendInView());
        this.SetLocationOffset(Other.GetLocationOffset());
        this.SetRotationOffset(Other.GetRotationOffset());
        this.SetBlendKeepDuration(Other.GetBlendKeepDuration());
        this.SetBlendInDuration(Other.GetBlendInDuration());
        this.SetBlendOutDuration(Other.GetBlendOutDuration());
        this.SetAttachTime(Other.GetAttachTime());
        return __r;
    }
    const FECSEntity GetAttachToEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_AttachToEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAttachToEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AttachToEntity = __Value;
        return;
    }
    FName GetSocketName() const property
    {
        return this.m_SocketName;
    }
    void SetSocketName(const FName &inout __Value) property
    {
        if ((this.m_SocketName == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SocketName = __Value;
        return;
    }
    bool GetbNeedBlendInView() const property
    {
        return this.m_bNeedBlendInView;
    }
    void SetbNeedBlendInView(const bool __Value) property
    {
        if (!(this.m_bNeedBlendInView) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bNeedBlendInView = __Value;
        return;
    }
    const FVector GetLocationOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LocationOffset() property
    {
        FVector __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetLocationOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_LocationOffset = __Value;
        return;
    }
    const FQuat GetRotationOffset() const property
    {
        const FQuat __r;
        return __r;
    }
    FQuat GetModify_RotationOffset() property
    {
        FQuat __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetRotationOffset(const FQuat &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_RotationOffset = __Value;
        return;
    }
    float32 GetBlendKeepDuration() const property
    {
        return this.m_BlendKeepDuration;
    }
    void SetBlendKeepDuration(const float32 __Value) property
    {
        if (this.m_BlendKeepDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_BlendKeepDuration = __Value;
        return;
    }
    float32 GetBlendInDuration() const property
    {
        return this.m_BlendInDuration;
    }
    void SetBlendInDuration(const float32 __Value) property
    {
        if (this.m_BlendInDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_BlendInDuration = __Value;
        return;
    }
    float32 GetBlendOutDuration() const property
    {
        return this.m_BlendOutDuration;
    }
    void SetBlendOutDuration(const float32 __Value) property
    {
        if (this.m_BlendOutDuration == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_BlendOutDuration = __Value;
        return;
    }
    const FFPTime GetAttachTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_AttachTime() property
    {
        FFPTime __r;
        this.__MarkDirty(8);
        return __r;
    }
    void SetAttachTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_AttachTime = __Value;
        return;
    }
}

struct FC_ViewTransformAttachmentPresentation : FECSComponent
{
    UPROPERTY()
    FFPTime StartWorldTime;
    UPROPERTY()
    FVector InitialLocationOffset = FVector::ZeroVector;
    UPROPERTY()
    FQuat InitialRotationOffset = FQuat::Identity;
    UPROPERTY()
    float32 BlendDuration = 0.0f;


}

struct FC_ViewDetachBlend : FECSComponent
{
    UPROPERTY()
    FFPTime StartWorldTime;
    UPROPERTY()
    FVector InitialLocationOffset = FVector::ZeroVector;
    UPROPERTY()
    FQuat InitialRotationOffset = FQuat::Identity;
    UPROPERTY()
    bool bInitialized = false;
    UPROPERTY()
    float32 BlendDuration = 0.0f;


}

struct FC_ViewDetachTeleportHold : FECSComponent
{
    UPROPERTY()
    FVector TargetLocation;
    UPROPERTY()
    FQuat TargetRotation = FQuat::Identity;
    UPROPERTY()
    FFPTime StartWorldTime;

    FC_ViewDetachTeleportHold()
    {
        return;
    }
}

struct FC_AttachChildrenChangedTag : FECSComponent
{
    FC_AttachChildrenChangedTag()
    {
        return;
    }
}

namespace ECSFunc_FC_AttachmentChildren
{
UFUNCTION()
bool HasAttachmentChildren(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AttachmentChildren);
}
FC_AttachmentChildren& AssignAttachmentChildren(const FECSEntity &inout Entity, const FC_AttachmentChildren &inout DefaultValue = FC_AttachmentChildren())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AttachmentChildren, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAttachmentChildren_BP(const FECSEntity &inout Entity, const FC_AttachmentChildren &inout DefaultValue = FC_AttachmentChildren())
{
    ECSFunc_FC_AttachmentChildren::AssignAttachmentChildren(Entity, DefaultValue);
    return;
}
FC_AttachmentChildren& ModifyAttachmentChildren(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AttachmentChildren));
    return local_12.GetComp();
}
FC_AttachmentChildren& ModifyOrAddAttachmentChildren(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AttachmentChildren));
    return local_12.GetComp();
}
const FC_AttachmentChildren& GetAttachmentChildren(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AttachmentChildren));
    return local_12.GetComp();
}
UFUNCTION()
FC_AttachmentChildren GetAttachmentChildren_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AttachmentChildren& local_4 = ECSFunc_FC_AttachmentChildren::GetAttachmentChildren(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AttachmentChildren();
}
const FC_AttachmentChildren GetDefaultedAttachmentChildren(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AttachmentChildren __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AttachmentChildren);
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
FC_AttachmentChildren GetDefaultedAttachmentChildren_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AttachmentChildren::GetDefaultedAttachmentChildren(Entity);
}
UFUNCTION()
bool RemoveAttachmentChildren(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AttachmentChildren);
}
}
FECSMonitorRuntimeView __GetMonitorAttachmentChildrenOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AttachmentChildren, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachmentChildrenOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AttachmentChildren, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachmentChildrenOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AttachmentChildren, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachmentChildrenOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AttachmentChildren, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachmentChildrenOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AttachmentChildren, bFixedFrame, bMustHandleAll);
}
void __MonitorAttachmentChildrenLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AttachmentChildren, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttachmentChildrenActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AttachmentChildren, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttachmentChildrenModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AttachmentChildren, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AttachmentParent
{
UFUNCTION()
bool HasAttachmentParent(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AttachmentParent);
}
FC_AttachmentParent& AssignAttachmentParent(const FECSEntity &inout Entity, const FC_AttachmentParent &inout DefaultValue = FC_AttachmentParent())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AttachmentParent, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAttachmentParent_BP(const FECSEntity &inout Entity, const FC_AttachmentParent &inout DefaultValue = FC_AttachmentParent())
{
    ECSFunc_FC_AttachmentParent::AssignAttachmentParent(Entity, DefaultValue);
    return;
}
FC_AttachmentParent& ModifyAttachmentParent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AttachmentParent));
    return local_12.GetComp();
}
FC_AttachmentParent& ModifyOrAddAttachmentParent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AttachmentParent));
    return local_12.GetComp();
}
const FC_AttachmentParent& GetAttachmentParent(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AttachmentParent));
    return local_12.GetComp();
}
UFUNCTION()
FC_AttachmentParent GetAttachmentParent_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AttachmentParent& local_4 = ECSFunc_FC_AttachmentParent::GetAttachmentParent(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AttachmentParent();
}
const FC_AttachmentParent GetDefaultedAttachmentParent(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AttachmentParent __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AttachmentParent);
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
FC_AttachmentParent GetDefaultedAttachmentParent_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AttachmentParent::GetDefaultedAttachmentParent(Entity);
}
UFUNCTION()
bool RemoveAttachmentParent(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AttachmentParent);
}
}
FECSMonitorRuntimeView __GetMonitorAttachmentParentOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AttachmentParent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachmentParentOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AttachmentParent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachmentParentOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AttachmentParent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachmentParentOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AttachmentParent, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachmentParentOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AttachmentParent, bFixedFrame, bMustHandleAll);
}
void __MonitorAttachmentParentLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AttachmentParent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttachmentParentActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AttachmentParent, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttachmentParentModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AttachmentParent, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AttachmentAnimationData
{
UFUNCTION()
bool HasAttachmentAnimationData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AttachmentAnimationData);
}
FC_AttachmentAnimationData& AssignAttachmentAnimationData(const FECSEntity &inout Entity, const FC_AttachmentAnimationData &inout DefaultValue = FC_AttachmentAnimationData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AttachmentAnimationData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAttachmentAnimationData_BP(const FECSEntity &inout Entity, const FC_AttachmentAnimationData &inout DefaultValue = FC_AttachmentAnimationData())
{
    ECSFunc_FC_AttachmentAnimationData::AssignAttachmentAnimationData(Entity, DefaultValue);
    return;
}
FC_AttachmentAnimationData& ModifyAttachmentAnimationData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AttachmentAnimationData));
    return local_12.GetComp();
}
FC_AttachmentAnimationData& ModifyOrAddAttachmentAnimationData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AttachmentAnimationData));
    return local_12.GetComp();
}
const FC_AttachmentAnimationData& GetAttachmentAnimationData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AttachmentAnimationData));
    return local_12.GetComp();
}
UFUNCTION()
FC_AttachmentAnimationData GetAttachmentAnimationData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AttachmentAnimationData& local_4 = ECSFunc_FC_AttachmentAnimationData::GetAttachmentAnimationData(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AttachmentAnimationData();
}
const FC_AttachmentAnimationData GetDefaultedAttachmentAnimationData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AttachmentAnimationData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AttachmentAnimationData);
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
FC_AttachmentAnimationData GetDefaultedAttachmentAnimationData_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AttachmentAnimationData::GetDefaultedAttachmentAnimationData(Entity);
}
UFUNCTION()
bool RemoveAttachmentAnimationData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AttachmentAnimationData);
}
}
FECSMonitorRuntimeView __GetMonitorAttachmentAnimationDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AttachmentAnimationData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachmentAnimationDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AttachmentAnimationData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachmentAnimationDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AttachmentAnimationData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachmentAnimationDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AttachmentAnimationData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachmentAnimationDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AttachmentAnimationData, bFixedFrame, bMustHandleAll);
}
void __MonitorAttachmentAnimationDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AttachmentAnimationData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttachmentAnimationDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AttachmentAnimationData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttachmentAnimationDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AttachmentAnimationData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TransformAttachmentLogic
{
UFUNCTION()
bool HasTransformAttachmentLogic(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TransformAttachmentLogic);
}
FC_TransformAttachmentLogic& AssignTransformAttachmentLogic(const FECSEntity &inout Entity, const FC_TransformAttachmentLogic &inout DefaultValue = FC_TransformAttachmentLogic())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TransformAttachmentLogic, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTransformAttachmentLogic_BP(const FECSEntity &inout Entity, const FC_TransformAttachmentLogic &inout DefaultValue = FC_TransformAttachmentLogic())
{
    ECSFunc_FC_TransformAttachmentLogic::AssignTransformAttachmentLogic(Entity, DefaultValue);
    return;
}
FC_TransformAttachmentLogic& ModifyTransformAttachmentLogic(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TransformAttachmentLogic));
    return local_12.GetComp();
}
FC_TransformAttachmentLogic& ModifyOrAddTransformAttachmentLogic(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TransformAttachmentLogic));
    return local_12.GetComp();
}
const FC_TransformAttachmentLogic& GetTransformAttachmentLogic(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TransformAttachmentLogic));
    return local_12.GetComp();
}
UFUNCTION()
FC_TransformAttachmentLogic GetTransformAttachmentLogic_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TransformAttachmentLogic& local_4 = ECSFunc_FC_TransformAttachmentLogic::GetTransformAttachmentLogic(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TransformAttachmentLogic();
}
const FC_TransformAttachmentLogic GetDefaultedTransformAttachmentLogic(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TransformAttachmentLogic __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TransformAttachmentLogic);
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
FC_TransformAttachmentLogic GetDefaultedTransformAttachmentLogic_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TransformAttachmentLogic::GetDefaultedTransformAttachmentLogic(Entity);
}
UFUNCTION()
bool RemoveTransformAttachmentLogic(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TransformAttachmentLogic);
}
}
FECSMonitorRuntimeView __GetMonitorTransformAttachmentLogicOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TransformAttachmentLogic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTransformAttachmentLogicOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TransformAttachmentLogic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTransformAttachmentLogicOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TransformAttachmentLogic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTransformAttachmentLogicOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TransformAttachmentLogic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTransformAttachmentLogicOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TransformAttachmentLogic, bFixedFrame, bMustHandleAll);
}
void __MonitorTransformAttachmentLogicLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TransformAttachmentLogic, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTransformAttachmentLogicActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TransformAttachmentLogic, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTransformAttachmentLogicModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TransformAttachmentLogic, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SyncTransformAttachmentPresentation
{
UFUNCTION()
bool HasSyncTransformAttachmentPresentation(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SyncTransformAttachmentPresentation);
}
FC_SyncTransformAttachmentPresentation& AssignSyncTransformAttachmentPresentation(const FECSEntity &inout Entity, const FC_SyncTransformAttachmentPresentation &inout DefaultValue = FC_SyncTransformAttachmentPresentation())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SyncTransformAttachmentPresentation, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSyncTransformAttachmentPresentation_BP(const FECSEntity &inout Entity, const FC_SyncTransformAttachmentPresentation &inout DefaultValue = FC_SyncTransformAttachmentPresentation())
{
    ECSFunc_FC_SyncTransformAttachmentPresentation::AssignSyncTransformAttachmentPresentation(Entity, DefaultValue);
    return;
}
FC_SyncTransformAttachmentPresentation& ModifySyncTransformAttachmentPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SyncTransformAttachmentPresentation));
    return local_12.GetComp();
}
FC_SyncTransformAttachmentPresentation& ModifyOrAddSyncTransformAttachmentPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SyncTransformAttachmentPresentation));
    return local_12.GetComp();
}
const FC_SyncTransformAttachmentPresentation& GetSyncTransformAttachmentPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SyncTransformAttachmentPresentation));
    return local_12.GetComp();
}
UFUNCTION()
FC_SyncTransformAttachmentPresentation GetSyncTransformAttachmentPresentation_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SyncTransformAttachmentPresentation& local_4 = ECSFunc_FC_SyncTransformAttachmentPresentation::GetSyncTransformAttachmentPresentation(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SyncTransformAttachmentPresentation();
}
const FC_SyncTransformAttachmentPresentation GetDefaultedSyncTransformAttachmentPresentation(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SyncTransformAttachmentPresentation __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SyncTransformAttachmentPresentation);
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
FC_SyncTransformAttachmentPresentation GetDefaultedSyncTransformAttachmentPresentation_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SyncTransformAttachmentPresentation::GetDefaultedSyncTransformAttachmentPresentation(Entity);
}
UFUNCTION()
bool RemoveSyncTransformAttachmentPresentation(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SyncTransformAttachmentPresentation);
}
}
FECSMonitorRuntimeView __GetMonitorSyncTransformAttachmentPresentationOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SyncTransformAttachmentPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncTransformAttachmentPresentationOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SyncTransformAttachmentPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncTransformAttachmentPresentationOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SyncTransformAttachmentPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncTransformAttachmentPresentationOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SyncTransformAttachmentPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSyncTransformAttachmentPresentationOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SyncTransformAttachmentPresentation, bFixedFrame, bMustHandleAll);
}
void __MonitorSyncTransformAttachmentPresentationLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SyncTransformAttachmentPresentation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncTransformAttachmentPresentationActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SyncTransformAttachmentPresentation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSyncTransformAttachmentPresentationModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SyncTransformAttachmentPresentation, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ViewTransformAttachmentPresentation
{
UFUNCTION()
bool HasViewTransformAttachmentPresentation(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ViewTransformAttachmentPresentation);
}
FC_ViewTransformAttachmentPresentation& AssignViewTransformAttachmentPresentation(const FECSEntity &inout Entity, const FC_ViewTransformAttachmentPresentation &inout DefaultValue = FC_ViewTransformAttachmentPresentation())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ViewTransformAttachmentPresentation, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignViewTransformAttachmentPresentation_BP(const FECSEntity &inout Entity, const FC_ViewTransformAttachmentPresentation &inout DefaultValue = FC_ViewTransformAttachmentPresentation())
{
    ECSFunc_FC_ViewTransformAttachmentPresentation::AssignViewTransformAttachmentPresentation(Entity, DefaultValue);
    return;
}
FC_ViewTransformAttachmentPresentation& ModifyViewTransformAttachmentPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ViewTransformAttachmentPresentation));
    return local_12.GetComp();
}
FC_ViewTransformAttachmentPresentation& ModifyOrAddViewTransformAttachmentPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ViewTransformAttachmentPresentation));
    return local_12.GetComp();
}
const FC_ViewTransformAttachmentPresentation& GetViewTransformAttachmentPresentation(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ViewTransformAttachmentPresentation));
    return local_12.GetComp();
}
UFUNCTION()
FC_ViewTransformAttachmentPresentation GetViewTransformAttachmentPresentation_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ViewTransformAttachmentPresentation __r;
    bValid = false;
    bValid = ECSFunc_FC_ViewTransformAttachmentPresentation::GetViewTransformAttachmentPresentation(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ViewTransformAttachmentPresentation GetDefaultedViewTransformAttachmentPresentation(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ViewTransformAttachmentPresentation __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ViewTransformAttachmentPresentation);
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
FC_ViewTransformAttachmentPresentation GetDefaultedViewTransformAttachmentPresentation_BP(const FECSEntity &inout Entity)
{
    FC_ViewTransformAttachmentPresentation __r;
    return __r;
}
UFUNCTION()
bool RemoveViewTransformAttachmentPresentation(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ViewTransformAttachmentPresentation);
}
}
FECSMonitorRuntimeView __GetMonitorViewTransformAttachmentPresentationOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ViewTransformAttachmentPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewTransformAttachmentPresentationOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ViewTransformAttachmentPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewTransformAttachmentPresentationOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ViewTransformAttachmentPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewTransformAttachmentPresentationOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ViewTransformAttachmentPresentation, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewTransformAttachmentPresentationOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ViewTransformAttachmentPresentation, bFixedFrame, bMustHandleAll);
}
void __MonitorViewTransformAttachmentPresentationLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ViewTransformAttachmentPresentation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorViewTransformAttachmentPresentationActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ViewTransformAttachmentPresentation, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorViewTransformAttachmentPresentationModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ViewTransformAttachmentPresentation, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ViewDetachBlend
{
UFUNCTION()
bool HasViewDetachBlend(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ViewDetachBlend);
}
FC_ViewDetachBlend& AssignViewDetachBlend(const FECSEntity &inout Entity, const FC_ViewDetachBlend &inout DefaultValue = FC_ViewDetachBlend())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ViewDetachBlend, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignViewDetachBlend_BP(const FECSEntity &inout Entity, const FC_ViewDetachBlend &inout DefaultValue = FC_ViewDetachBlend())
{
    ECSFunc_FC_ViewDetachBlend::AssignViewDetachBlend(Entity, DefaultValue);
    return;
}
FC_ViewDetachBlend& ModifyViewDetachBlend(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ViewDetachBlend));
    return local_12.GetComp();
}
FC_ViewDetachBlend& ModifyOrAddViewDetachBlend(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ViewDetachBlend));
    return local_12.GetComp();
}
const FC_ViewDetachBlend& GetViewDetachBlend(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ViewDetachBlend));
    return local_12.GetComp();
}
UFUNCTION()
FC_ViewDetachBlend GetViewDetachBlend_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ViewDetachBlend __r;
    bValid = false;
    bValid = ECSFunc_FC_ViewDetachBlend::GetViewDetachBlend(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ViewDetachBlend GetDefaultedViewDetachBlend(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ViewDetachBlend __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ViewDetachBlend);
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
FC_ViewDetachBlend GetDefaultedViewDetachBlend_BP(const FECSEntity &inout Entity)
{
    FC_ViewDetachBlend __r;
    return __r;
}
UFUNCTION()
bool RemoveViewDetachBlend(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ViewDetachBlend);
}
}
FECSMonitorRuntimeView __GetMonitorViewDetachBlendOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ViewDetachBlend, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewDetachBlendOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ViewDetachBlend, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewDetachBlendOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ViewDetachBlend, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewDetachBlendOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ViewDetachBlend, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewDetachBlendOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ViewDetachBlend, bFixedFrame, bMustHandleAll);
}
void __MonitorViewDetachBlendLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ViewDetachBlend, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorViewDetachBlendActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ViewDetachBlend, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorViewDetachBlendModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ViewDetachBlend, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ViewDetachTeleportHold
{
UFUNCTION()
bool HasViewDetachTeleportHold(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ViewDetachTeleportHold);
}
FC_ViewDetachTeleportHold& AssignViewDetachTeleportHold(const FECSEntity &inout Entity, const FC_ViewDetachTeleportHold &inout DefaultValue = FC_ViewDetachTeleportHold())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ViewDetachTeleportHold, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignViewDetachTeleportHold_BP(const FECSEntity &inout Entity, const FC_ViewDetachTeleportHold &inout DefaultValue = FC_ViewDetachTeleportHold())
{
    ECSFunc_FC_ViewDetachTeleportHold::AssignViewDetachTeleportHold(Entity, DefaultValue);
    return;
}
FC_ViewDetachTeleportHold& ModifyViewDetachTeleportHold(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ViewDetachTeleportHold));
    return local_12.GetComp();
}
FC_ViewDetachTeleportHold& ModifyOrAddViewDetachTeleportHold(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ViewDetachTeleportHold));
    return local_12.GetComp();
}
const FC_ViewDetachTeleportHold& GetViewDetachTeleportHold(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ViewDetachTeleportHold));
    return local_12.GetComp();
}
UFUNCTION()
FC_ViewDetachTeleportHold GetViewDetachTeleportHold_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ViewDetachTeleportHold __r;
    bValid = false;
    bValid = ECSFunc_FC_ViewDetachTeleportHold::GetViewDetachTeleportHold(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ViewDetachTeleportHold GetDefaultedViewDetachTeleportHold(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ViewDetachTeleportHold __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ViewDetachTeleportHold);
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
FC_ViewDetachTeleportHold GetDefaultedViewDetachTeleportHold_BP(const FECSEntity &inout Entity)
{
    FC_ViewDetachTeleportHold __r;
    return __r;
}
UFUNCTION()
bool RemoveViewDetachTeleportHold(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ViewDetachTeleportHold);
}
}
FECSMonitorRuntimeView __GetMonitorViewDetachTeleportHoldOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ViewDetachTeleportHold, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewDetachTeleportHoldOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ViewDetachTeleportHold, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewDetachTeleportHoldOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ViewDetachTeleportHold, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewDetachTeleportHoldOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ViewDetachTeleportHold, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewDetachTeleportHoldOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ViewDetachTeleportHold, bFixedFrame, bMustHandleAll);
}
void __MonitorViewDetachTeleportHoldLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ViewDetachTeleportHold, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorViewDetachTeleportHoldActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ViewDetachTeleportHold, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorViewDetachTeleportHoldModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ViewDetachTeleportHold, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AttachChildrenChangedTag
{
UFUNCTION()
bool HasAttachChildrenChangedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AttachChildrenChangedTag);
}
FC_AttachChildrenChangedTag& AssignAttachChildrenChangedTag(const FECSEntity &inout Entity, const FC_AttachChildrenChangedTag &inout DefaultValue = FC_AttachChildrenChangedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AttachChildrenChangedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAttachChildrenChangedTag_BP(const FECSEntity &inout Entity, const FC_AttachChildrenChangedTag &inout DefaultValue = FC_AttachChildrenChangedTag())
{
    ECSFunc_FC_AttachChildrenChangedTag::AssignAttachChildrenChangedTag(Entity, DefaultValue);
    return;
}
FC_AttachChildrenChangedTag& ModifyAttachChildrenChangedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AttachChildrenChangedTag));
    return local_12.GetComp();
}
FC_AttachChildrenChangedTag& ModifyOrAddAttachChildrenChangedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AttachChildrenChangedTag));
    return local_12.GetComp();
}
const FC_AttachChildrenChangedTag& GetAttachChildrenChangedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AttachChildrenChangedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AttachChildrenChangedTag GetAttachChildrenChangedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AttachChildrenChangedTag& local_4 = ECSFunc_FC_AttachChildrenChangedTag::GetAttachChildrenChangedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AttachChildrenChangedTag();
}
const FC_AttachChildrenChangedTag GetDefaultedAttachChildrenChangedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AttachChildrenChangedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AttachChildrenChangedTag);
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
FC_AttachChildrenChangedTag GetDefaultedAttachChildrenChangedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AttachChildrenChangedTag::GetDefaultedAttachChildrenChangedTag(Entity);
}
UFUNCTION()
bool RemoveAttachChildrenChangedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AttachChildrenChangedTag);
}
}
FECSMonitorRuntimeView __GetMonitorAttachChildrenChangedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AttachChildrenChangedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachChildrenChangedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AttachChildrenChangedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachChildrenChangedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AttachChildrenChangedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachChildrenChangedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AttachChildrenChangedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttachChildrenChangedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AttachChildrenChangedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAttachChildrenChangedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AttachChildrenChangedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttachChildrenChangedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AttachChildrenChangedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttachChildrenChangedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AttachChildrenChangedTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FAttachmentInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FAttachmentInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAttachmentInfo
{
int __IndexOf_SocketName()
{
    return 0;
}
int __IndexOf_bAttachOffsetBaseOnRootTransform()
{
    return 1;
}
int __IndexOf_LocationOffset()
{
    return 2;
}
int __IndexOf_RotationOffset()
{
    return 3;
}
int __IndexOf_bRestoreAlignedStaticSocketOnDetach()
{
    return 4;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FAttachmentRequestParam &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FAttachmentRequestParam &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAttachmentRequestParam
{
int __IndexOf_SocketName()
{
    return 0;
}
int __IndexOf_LocationOffset()
{
    return 1;
}
int __IndexOf_RotationOffset()
{
    return 2;
}
int __IndexOf_bUseDetachOffset()
{
    return 3;
}
int __IndexOf_DetachLocationOffset()
{
    return 4;
}
int __IndexOf_DetachRotationOffset()
{
    return 5;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AttachmentChildren &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AttachmentChildren &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AttachmentChildren &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AttachmentChildren
{
int __IndexOf_Children()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AttachmentParent &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AttachmentParent &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AttachmentParent &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AttachmentParent
{
int __IndexOf_Parent()
{
    return 0;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FEventAttachToEntity &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FEventAttachToEntity &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FEventAttachToEntity
{
int __IndexOf_Parent()
{
    return 0;
}
int __IndexOf_AttachmentInfo()
{
    return 1;
}
int __IndexOf_AttachBlendInDuration()
{
    return 6;
}
int __IndexOf_AttachBlendKeepDuration()
{
    return 7;
}
int __IndexOf_DetachBlendOutDuration()
{
    return 8;
}
int __IndexOf_AttachSocketUpdatePeriod()
{
    return 9;
}
int __IndexOf_LogicLocationOffsetExtra()
{
    return 10;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FEventDetachFromEntity &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FEventDetachFromEntity &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FEventDetachFromEntity
{
int __IndexOf_bUseDetachLocationOffset()
{
    return 0;
}
int __IndexOf_bUseDetachRotationOffset()
{
    return 1;
}
int __IndexOf_LocationOffset()
{
    return 2;
}
int __IndexOf_RotationOffset()
{
    return 3;
}
int __IndexOf_bOffsetBaseOnRootTransform()
{
    return 4;
}
int __IndexOf_ZeroOutRotationAxisWhenDetach()
{
    return 5;
}
int __IndexOf_bAvoidPenetrationFromParentPos()
{
    return 6;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_TransformAttachmentLogic &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_TransformAttachmentLogic &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_TransformAttachmentLogic &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_TransformAttachmentLogic
{
int __IndexOf_AttachmentMode()
{
    return 0;
}
int __IndexOf_bWorldSpaceLocationOffset()
{
    return 1;
}
int __IndexOf_AttachToEntity()
{
    return 2;
}
int __IndexOf_SocketName()
{
    return 3;
}
int __IndexOf_BoneIndex()
{
    return 4;
}
int __IndexOf_LocationOffset()
{
    return 5;
}
int __IndexOf_RotationOffset()
{
    return 6;
}
int __IndexOf_AttachSocketUpdatePeriod()
{
    return 7;
}
int __IndexOf_bRestoreAlignedStaticSocketOnDetach()
{
    return 8;
}
int __IndexOf_AlignedStaticSocketInverseLocationOffset()
{
    return 9;
}
int __IndexOf_AlignedStaticSocketInverseRotationOffset()
{
    return 10;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_SyncTransformAttachmentPresentation &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_SyncTransformAttachmentPresentation &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SyncTransformAttachmentPresentation &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SyncTransformAttachmentPresentation
{
int __IndexOf_AttachToEntity()
{
    return 0;
}
int __IndexOf_SocketName()
{
    return 1;
}
int __IndexOf_bNeedBlendInView()
{
    return 2;
}
int __IndexOf_LocationOffset()
{
    return 3;
}
int __IndexOf_RotationOffset()
{
    return 4;
}
int __IndexOf_BlendKeepDuration()
{
    return 5;
}
int __IndexOf_BlendInDuration()
{
    return 6;
}
int __IndexOf_BlendOutDuration()
{
    return 7;
}
int __IndexOf_AttachTime()
{
    return 8;
}
}


enum EJointTransformParamType
{
    None,
    SocketName,
    BoneIndex,
}

enum EJointParamSpace
{
    Entity,
    World,
    Local,
}

enum EJointRotationFreedom
{
    Free,
    ByAxis,
    Locked,
}

namespace __INTENRAL_FC_ChainSmoothInfo_NS
{
    const TECSComponentDerivedPtr<FC_ChainSmoothInfo> DerivedPtr = TECSComponentDerivedPtr<FC_ChainSmoothInfo>();
    const FC_ChainSmoothInfo DefaultValue = FC_ChainSmoothInfo();
}
namespace __INTENRAL_FC_ChainParentInfo_NS
{
    const TECSComponentDerivedPtr<FC_ChainParentInfo> DerivedPtr = TECSComponentDerivedPtr<FC_ChainParentInfo>();
    const FC_ChainParentInfo DefaultValue = FC_ChainParentInfo();
}
namespace __INTENRAL_FC_ChainChildrenInfo_NS
{
    const TECSComponentDerivedPtr<FC_ChainChildrenInfo> DerivedPtr = TECSComponentDerivedPtr<FC_ChainChildrenInfo>();
    const FC_ChainChildrenInfo DefaultValue = FC_ChainChildrenInfo();
}
namespace __INTENRAL_FCE_ChainToEntity_NS
{
    const TECSEventDerivedPtr<FCE_ChainToEntity> DerivedPtr = TECSEventDerivedPtr<FCE_ChainToEntity>();
}
namespace __INTENRAL_FCE_UnchainFromParent_NS
{
    const TECSEventDerivedPtr<FCE_UnchainFromParent> DerivedPtr = TECSEventDerivedPtr<FCE_UnchainFromParent>();
}
namespace __INTENRAL_FCE_UnchainAllChildren_NS
{
    const TECSEventDerivedPtr<FCE_UnchainAllChildren> DerivedPtr = TECSEventDerivedPtr<FCE_UnchainAllChildren>();

}
struct FChainJointInfo
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FName m_SocketName = NAME_None;
    UPROPERTY()
    int m_BoneIndex = -1;
    UPROPERTY()
    FVector3f m_LocationOffset = FVector3f::ZeroVector;
    UPROPERTY()
    FQuat m_RotationOffset = FQuat::Identity;
    UPROPERTY()
    EJointTransformParamType m_TransformType = EJointTransformParamType(0);
    UPROPERTY()
    EJointParamSpace m_LocationSpace = EJointParamSpace(0);
    UPROPERTY()
    EJointParamSpace m_RotationSpace = EJointParamSpace(0);
    UPROPERTY()
    EJointRotationFreedom m_RotationFreedom = EJointRotationFreedom(0);
    UPROPERTY()
    float32 m_DeflectionAngleLimit = -1.0f;

    FChainJointInfo(const FChainJointInfo &inout Other)
    {
        this.m_SocketName = Other.m_SocketName;
        this.m_BoneIndex = int(Other.m_BoneIndex);
        this.m_LocationOffset = Other.m_LocationOffset;
        this.m_RotationOffset = Other.m_RotationOffset;
        this.m_TransformType = Other.m_TransformType;
        this.m_LocationSpace = Other.m_LocationSpace;
        this.m_RotationSpace = Other.m_RotationSpace;
        this.m_RotationFreedom = Other.m_RotationFreedom;
        this.m_DeflectionAngleLimit = Other.m_DeflectionAngleLimit;
        return;
    }
    FChainJointInfo opAssign(const FChainJointInfo &inout Other)
    {
        FChainJointInfo __r;
        this.SetSocketName(Other.GetSocketName());
        this.SetBoneIndex(Other.GetBoneIndex());
        this.SetLocationOffset(Other.GetLocationOffset());
        this.SetRotationOffset(Other.GetRotationOffset());
        this.SetTransformType(Other.GetTransformType());
        this.SetLocationSpace(Other.GetLocationSpace());
        this.SetRotationSpace(Other.GetRotationSpace());
        this.SetRotationFreedom(Other.GetRotationFreedom());
        this.SetDeflectionAngleLimit(Other.GetDeflectionAngleLimit());
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
        this.__MarkDirty(1);
        this.m_BoneIndex = __Value;
        return;
    }
    const FVector3f GetLocationOffset() const property
    {
        const FVector3f __r;
        return __r;
    }
    FVector3f GetModify_LocationOffset() property
    {
        FVector3f __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetLocationOffset(const FVector3f &inout __Value) property
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
    const FQuat GetRotationOffset() const property
    {
        const FQuat __r;
        return __r;
    }
    FQuat GetModify_RotationOffset() property
    {
        FQuat __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetRotationOffset(const FQuat &inout __Value) property
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
    EJointTransformParamType GetTransformType() const property
    {
        return this.m_TransformType;
    }
    void SetTransformType(const EJointTransformParamType __Value) property
    {
        if (int(this.m_TransformType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_TransformType = __Value;
        return;
    }
    EJointParamSpace GetLocationSpace() const property
    {
        return this.m_LocationSpace;
    }
    void SetLocationSpace(const EJointParamSpace __Value) property
    {
        if (int(this.m_LocationSpace) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_LocationSpace = __Value;
        return;
    }
    EJointParamSpace GetRotationSpace() const property
    {
        return this.m_RotationSpace;
    }
    void SetRotationSpace(const EJointParamSpace __Value) property
    {
        if (int(this.m_RotationSpace) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_RotationSpace = __Value;
        return;
    }
    EJointRotationFreedom GetRotationFreedom() const property
    {
        return this.m_RotationFreedom;
    }
    void SetRotationFreedom(const EJointRotationFreedom __Value) property
    {
        if (int(this.m_RotationFreedom) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_RotationFreedom = __Value;
        return;
    }
    float32 GetDeflectionAngleLimit() const property
    {
        return this.m_DeflectionAngleLimit;
    }
    void SetDeflectionAngleLimit(const float32 __Value) property
    {
        if (this.m_DeflectionAngleLimit == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_DeflectionAngleLimit = __Value;
        return;
    }
}

struct FChainChildCenterInfo
{
    UPROPERTY()
    FVector3f m_LocationOffset;

    FChainChildCenterInfo()
    {
        return;
    }
    const FVector3f GetLocationOffset() const property
    {
        const FVector3f __r;
        return __r;
    }
    FVector3f GetLocationOffset() property
    {
        FVector3f __r;
        return __r;
    }
    void SetLocationOffset(const FVector3f &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FChainLinkInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_Length;
    UPROPERTY()
    bool m_bRigid;
    UPROPERTY()
    bool m_bEnableSmoothing;

    FChainLinkInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FChainLinkInfo(const FChainLinkInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FChainLinkInfo opAssign(const FChainLinkInfo &inout Other)
    {
        FChainLinkInfo __r;
        this.SetLength(Other.GetLength());
        this.SetbRigid(Other.GetbRigid());
        this.SetbEnableSmoothing(Other.GetbEnableSmoothing());
        return __r;
    }
    float32 GetLength() const property
    {
        return this.m_Length;
    }
    void SetLength(const float32 __Value) property
    {
        if (this.m_Length == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Length = __Value;
        return;
    }
    bool GetbRigid() const property
    {
        return this.m_bRigid;
    }
    void SetbRigid(const bool __Value) property
    {
        if (!(this.m_bRigid) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bRigid = __Value;
        return;
    }
    bool GetbEnableSmoothing() const property
    {
        return this.m_bEnableSmoothing;
    }
    void SetbEnableSmoothing(const bool __Value) property
    {
        if (!(this.m_bEnableSmoothing) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bEnableSmoothing = __Value;
        return;
    }
}

struct FChainParam
{
    FSubDirtyFlags32 __DirtyFlags;
    UPROPERTY()
    FChainJointInfo m_ParentJointInfo;
    UPROPERTY()
    FChainJointInfo m_ChildJointInfo;
    UPROPERTY()
    FChainChildCenterInfo m_ChildCenterInfo;
    UPROPERTY()
    FChainLinkInfo m_LinkInfo;

    FChainParam()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FChainParam(const FChainParam &inout Other)
    {
        this.m_ParentJointInfo = Other.m_ParentJointInfo;
        this.m_ChildJointInfo = Other.m_ChildJointInfo;
        this.m_ChildCenterInfo = Other.m_ChildCenterInfo;
        this.m_LinkInfo = Other.m_LinkInfo;
        return;
    }
    FChainParam opAssign(const FChainParam &inout Other)
    {
        FChainParam __r;
        this.SetParentJointInfo(Other.GetParentJointInfo());
        this.SetChildJointInfo(Other.GetChildJointInfo());
        this.SetChildCenterInfo(Other.GetChildCenterInfo());
        this.SetLinkInfo(Other.GetLinkInfo());
        return __r;
    }
    const FChainJointInfo GetParentJointInfo() const property
    {
        const FChainJointInfo __r;
        return __r;
    }
    FChainJointInfo GetParentJointInfo() property
    {
        FChainJointInfo __r;
        return __r;
    }
    void SetParentJointInfo(const FChainJointInfo &inout __Value) property
    {
        this.m_ParentJointInfo = __Value;
        return;
    }
    const FChainJointInfo GetChildJointInfo() const property
    {
        const FChainJointInfo __r;
        return __r;
    }
    FChainJointInfo GetChildJointInfo() property
    {
        FChainJointInfo __r;
        return __r;
    }
    void SetChildJointInfo(const FChainJointInfo &inout __Value) property
    {
        this.m_ChildJointInfo = __Value;
        return;
    }
    const FChainChildCenterInfo GetChildCenterInfo() const property
    {
        const FChainChildCenterInfo __r;
        return __r;
    }
    FChainChildCenterInfo GetModify_ChildCenterInfo() property
    {
        FChainChildCenterInfo __r;
        this.__MarkDirty(18);
        return __r;
    }
    void SetChildCenterInfo(const FChainChildCenterInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(18);
        this.m_ChildCenterInfo = __Value;
        return;
    }
    const FChainLinkInfo GetLinkInfo() const property
    {
        const FChainLinkInfo __r;
        return __r;
    }
    FChainLinkInfo GetLinkInfo() property
    {
        FChainLinkInfo __r;
        return __r;
    }
    void SetLinkInfo(const FChainLinkInfo &inout __Value) property
    {
        this.m_LinkInfo = __Value;
        return;
    }
}

struct FC_ChainSmoothInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bParentJointLocationInited;
    UPROPERTY()
    FVector3f m_SmoothedParentJointLocation;
    UPROPERTY()
    FVector3f m_PrevVelocity;
    UPROPERTY()
    FVector3f m_PrevDiff;

    FC_ChainSmoothInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ChainSmoothInfo(const FC_ChainSmoothInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_ChainSmoothInfo opAssign(const FC_ChainSmoothInfo &inout Other)
    {
        FC_ChainSmoothInfo __r;
        this.SetbParentJointLocationInited(Other.GetbParentJointLocationInited());
        this.SetSmoothedParentJointLocation(Other.GetSmoothedParentJointLocation());
        this.SetPrevVelocity(Other.GetPrevVelocity());
        this.SetPrevDiff(Other.GetPrevDiff());
        return __r;
    }
    bool GetbParentJointLocationInited() const property
    {
        return this.m_bParentJointLocationInited;
    }
    void SetbParentJointLocationInited(const bool __Value) property
    {
        if (!(this.m_bParentJointLocationInited) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bParentJointLocationInited = __Value;
        return;
    }
    const FVector3f GetSmoothedParentJointLocation() const property
    {
        const FVector3f __r;
        return __r;
    }
    FVector3f GetModify_SmoothedParentJointLocation() property
    {
        FVector3f __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetSmoothedParentJointLocation(const FVector3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SmoothedParentJointLocation = __Value;
        return;
    }
    const FVector3f GetPrevVelocity() const property
    {
        const FVector3f __r;
        return __r;
    }
    FVector3f GetModify_PrevVelocity() property
    {
        FVector3f __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetPrevVelocity(const FVector3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_PrevVelocity = __Value;
        return;
    }
    const FVector3f GetPrevDiff() const property
    {
        const FVector3f __r;
        return __r;
    }
    FVector3f GetModify_PrevDiff() property
    {
        FVector3f __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetPrevDiff(const FVector3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_PrevDiff = __Value;
        return;
    }
}

struct FC_ChainParentInfo : FECSComponent
{
    FRootDirtyFlags32 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_Parent;
    UPROPERTY()
    FChainParam m_ChainParam;

    FC_ChainParentInfo()
    {
        this.m_Parent = ENTITY_NULL;
        this.__InitDirtyFlags();
        return;
    }
    FC_ChainParentInfo(const FC_ChainParentInfo &inout Other)
    {
        this.m_Parent = ENTITY_NULL;
        this.__InitDirtyFlags();
        this.m_Parent = Other.m_Parent;
        this.m_ChainParam = Other.m_ChainParam;
        return;
    }
    FC_ChainParentInfo opAssign(const FC_ChainParentInfo &inout Other)
    {
        FC_ChainParentInfo __r;
        this.SetParent(Other.GetParent());
        this.SetChainParam(Other.GetChainParam());
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
    const FChainParam GetChainParam() const property
    {
        const FChainParam __r;
        return __r;
    }
    FChainParam GetChainParam() property
    {
        FChainParam __r;
        return __r;
    }
    void SetChainParam(const FChainParam &inout __Value) property
    {
        this.m_ChainParam = __Value;
        return;
    }
}

struct FC_ChainChildrenInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FECSEntity> m_Children;

    FC_ChainChildrenInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ChainChildrenInfo(const FC_ChainChildrenInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Children = Other.m_Children;
        return;
    }
    FC_ChainChildrenInfo opAssign(const FC_ChainChildrenInfo &inout Other)
    {
        FC_ChainChildrenInfo __r;
        this.SetChildren(Other.GetChildren());
        return __r;
    }
    int Num() const
    {
        return this.GetChildren().Num();
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

struct FCE_ChainToEntity : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Parent = ENTITY_NULL;
    UPROPERTY()
    FChainParam ChainParam;

    FCE_ChainToEntity()
    {
        return;
    }
}

struct FCE_UnchainFromParent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_UnchainFromParent()
    {
        return;
    }
}

struct FCE_UnchainAllChildren : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_UnchainAllChildren()
    {
        return;
    }
}

namespace ECSFunc_FC_ChainSmoothInfo
{
UFUNCTION()
bool HasChainSmoothInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ChainSmoothInfo);
}
FC_ChainSmoothInfo& AssignChainSmoothInfo(const FECSEntity &inout Entity, const FC_ChainSmoothInfo &inout DefaultValue = FC_ChainSmoothInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ChainSmoothInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignChainSmoothInfo_BP(const FECSEntity &inout Entity, const FC_ChainSmoothInfo &inout DefaultValue = FC_ChainSmoothInfo())
{
    ECSFunc_FC_ChainSmoothInfo::AssignChainSmoothInfo(Entity, DefaultValue);
    return;
}
FC_ChainSmoothInfo& ModifyChainSmoothInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ChainSmoothInfo));
    return local_12.GetComp();
}
FC_ChainSmoothInfo& ModifyOrAddChainSmoothInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ChainSmoothInfo));
    return local_12.GetComp();
}
const FC_ChainSmoothInfo& GetChainSmoothInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ChainSmoothInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_ChainSmoothInfo GetChainSmoothInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ChainSmoothInfo& local_4 = ECSFunc_FC_ChainSmoothInfo::GetChainSmoothInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ChainSmoothInfo();
}
const FC_ChainSmoothInfo GetDefaultedChainSmoothInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ChainSmoothInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ChainSmoothInfo);
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
FC_ChainSmoothInfo GetDefaultedChainSmoothInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ChainSmoothInfo::GetDefaultedChainSmoothInfo(Entity);
}
UFUNCTION()
bool RemoveChainSmoothInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ChainSmoothInfo);
}
}
FECSMonitorRuntimeView __GetMonitorChainSmoothInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ChainSmoothInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChainSmoothInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ChainSmoothInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChainSmoothInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ChainSmoothInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChainSmoothInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ChainSmoothInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChainSmoothInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ChainSmoothInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorChainSmoothInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ChainSmoothInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorChainSmoothInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ChainSmoothInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorChainSmoothInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ChainSmoothInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ChainParentInfo
{
UFUNCTION()
bool HasChainParentInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ChainParentInfo);
}
FC_ChainParentInfo& AssignChainParentInfo(const FECSEntity &inout Entity, const FC_ChainParentInfo &inout DefaultValue = FC_ChainParentInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ChainParentInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignChainParentInfo_BP(const FECSEntity &inout Entity, const FC_ChainParentInfo &inout DefaultValue = FC_ChainParentInfo())
{
    ECSFunc_FC_ChainParentInfo::AssignChainParentInfo(Entity, DefaultValue);
    return;
}
FC_ChainParentInfo& ModifyChainParentInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ChainParentInfo));
    return local_12.GetComp();
}
FC_ChainParentInfo& ModifyOrAddChainParentInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ChainParentInfo));
    return local_12.GetComp();
}
const FC_ChainParentInfo& GetChainParentInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ChainParentInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_ChainParentInfo GetChainParentInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ChainParentInfo& local_4 = ECSFunc_FC_ChainParentInfo::GetChainParentInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ChainParentInfo();
}
const FC_ChainParentInfo GetDefaultedChainParentInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ChainParentInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ChainParentInfo);
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
FC_ChainParentInfo GetDefaultedChainParentInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ChainParentInfo::GetDefaultedChainParentInfo(Entity);
}
UFUNCTION()
bool RemoveChainParentInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ChainParentInfo);
}
}
FECSMonitorRuntimeView __GetMonitorChainParentInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ChainParentInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChainParentInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ChainParentInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChainParentInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ChainParentInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChainParentInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ChainParentInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChainParentInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ChainParentInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorChainParentInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ChainParentInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorChainParentInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ChainParentInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorChainParentInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ChainParentInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ChainChildrenInfo
{
UFUNCTION()
bool HasChainChildrenInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ChainChildrenInfo);
}
FC_ChainChildrenInfo& AssignChainChildrenInfo(const FECSEntity &inout Entity, const FC_ChainChildrenInfo &inout DefaultValue = FC_ChainChildrenInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ChainChildrenInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignChainChildrenInfo_BP(const FECSEntity &inout Entity, const FC_ChainChildrenInfo &inout DefaultValue = FC_ChainChildrenInfo())
{
    ECSFunc_FC_ChainChildrenInfo::AssignChainChildrenInfo(Entity, DefaultValue);
    return;
}
FC_ChainChildrenInfo& ModifyChainChildrenInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ChainChildrenInfo));
    return local_12.GetComp();
}
FC_ChainChildrenInfo& ModifyOrAddChainChildrenInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ChainChildrenInfo));
    return local_12.GetComp();
}
const FC_ChainChildrenInfo& GetChainChildrenInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ChainChildrenInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_ChainChildrenInfo GetChainChildrenInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ChainChildrenInfo& local_4 = ECSFunc_FC_ChainChildrenInfo::GetChainChildrenInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ChainChildrenInfo();
}
const FC_ChainChildrenInfo GetDefaultedChainChildrenInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ChainChildrenInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ChainChildrenInfo);
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
FC_ChainChildrenInfo GetDefaultedChainChildrenInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ChainChildrenInfo::GetDefaultedChainChildrenInfo(Entity);
}
UFUNCTION()
bool RemoveChainChildrenInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ChainChildrenInfo);
}
}
FECSMonitorRuntimeView __GetMonitorChainChildrenInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ChainChildrenInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChainChildrenInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ChainChildrenInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChainChildrenInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ChainChildrenInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChainChildrenInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ChainChildrenInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorChainChildrenInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ChainChildrenInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorChainChildrenInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ChainChildrenInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorChainChildrenInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ChainChildrenInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorChainChildrenInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ChainChildrenInfo, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_ChainParentInfo_Parent(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetParent());
    return;
}
void GetEntityBBVar_ChainChildrenInfo_Num(const FECSEntity &inout Entity, int &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = local_4.opCall().Num();
    return;
}
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FChainJointInfo &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FChainJointInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FChainJointInfo
{
int __IndexOf_SocketName()
{
    return 0;
}
int __IndexOf_BoneIndex()
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
int __IndexOf_TransformType()
{
    return 4;
}
int __IndexOf_LocationSpace()
{
    return 5;
}
int __IndexOf_RotationSpace()
{
    return 6;
}
int __IndexOf_RotationFreedom()
{
    return 7;
}
int __IndexOf_DeflectionAngleLimit()
{
    return 8;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FChainLinkInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FChainLinkInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FChainLinkInfo
{
int __IndexOf_Length()
{
    return 0;
}
int __IndexOf_bRigid()
{
    return 1;
}
int __IndexOf_bEnableSmoothing()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags32 GetDirtyFlags(FChainParam &inout Data)
{
    FSubDirtyFlags32 __r;
    return __r;
}
void ClearDirtyFlags(FChainParam &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FChainParam
{
int __IndexOf_ParentJointInfo()
{
    return 0;
}
int __IndexOf_ChildJointInfo()
{
    return 9;
}
int __IndexOf_ChildCenterInfo()
{
    return 18;
}
int __IndexOf_LinkInfo()
{
    return 19;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ChainSmoothInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ChainSmoothInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ChainSmoothInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ChainSmoothInfo
{
int __IndexOf_bParentJointLocationInited()
{
    return 0;
}
int __IndexOf_SmoothedParentJointLocation()
{
    return 1;
}
int __IndexOf_PrevVelocity()
{
    return 2;
}
int __IndexOf_PrevDiff()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags32 GetDirtyFlags(FC_ChainParentInfo &inout Data)
{
    FRootDirtyFlags32 __r;
    return __r;
}
void InitDirtyFlags(FC_ChainParentInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ChainParentInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ChainParentInfo
{
int __IndexOf_Parent()
{
    return 0;
}
int __IndexOf_ChainParam()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ChainChildrenInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ChainChildrenInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ChainChildrenInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ChainChildrenInfo
{
int __IndexOf_Children()
{
    return 0;
}
}

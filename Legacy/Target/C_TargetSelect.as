
enum ESelectTargetMethod
{
    Viewport,
}

enum ESelectTargetRequestType
{
    GenericTargetEntity,
    SkillTargetEntity,
}

namespace __INTENRAL_FC_SelectTargetRequestLogic_NS
{
    const TECSComponentDerivedPtr<FC_SelectTargetRequestLogic> DerivedPtr = TECSComponentDerivedPtr<FC_SelectTargetRequestLogic>();
    const FC_SelectTargetRequestLogic DefaultValue = FC_SelectTargetRequestLogic();
}
namespace __INTENRAL_FC_SelectTargetRequestView_NS
{
    const TECSComponentDerivedPtr<FC_SelectTargetRequestView> DerivedPtr = TECSComponentDerivedPtr<FC_SelectTargetRequestView>();
    const FC_SelectTargetRequestView DefaultValue = FC_SelectTargetRequestView();
}
namespace __INTENRAL_FC_SelectTargetResult_NS
{
    const TECSComponentDerivedPtr<FC_SelectTargetResult> DerivedPtr = TECSComponentDerivedPtr<FC_SelectTargetResult>();
    const FC_SelectTargetResult DefaultValue = FC_SelectTargetResult();
}
namespace __INTENRAL_FC_ViewportSelectTarget_NS
{
    const TECSComponentDerivedPtr<FC_ViewportSelectTarget> DerivedPtr = TECSComponentDerivedPtr<FC_ViewportSelectTarget>();
    const FC_ViewportSelectTarget DefaultValue = FC_ViewportSelectTarget();
}
namespace __INTENRAL_FC_SkillTarget_NS
{
    const TECSComponentDerivedPtr<FC_SkillTarget> DerivedPtr = TECSComponentDerivedPtr<FC_SkillTarget>();
    const FC_SkillTarget DefaultValue = FC_SkillTarget();
}
namespace __INTENRAL_FC_SkillTargetEntitySelectRequest_NS
{
    const TECSComponentDerivedPtr<FC_SkillTargetEntitySelectRequest> DerivedPtr = TECSComponentDerivedPtr<FC_SkillTargetEntitySelectRequest>();
    const FC_SkillTargetEntitySelectRequest DefaultValue = FC_SkillTargetEntitySelectRequest();
}
namespace __INTENRAL_FC_SkillTargetEntitySelectRequestHandle_NS
{
    const TECSComponentDerivedPtr<FC_SkillTargetEntitySelectRequestHandle> DerivedPtr = TECSComponentDerivedPtr<FC_SkillTargetEntitySelectRequestHandle>();
    const FC_SkillTargetEntitySelectRequestHandle DefaultValue = FC_SkillTargetEntitySelectRequestHandle();
}
namespace __INTENRAL_FC_SkillTargetPositionSelectRequest_NS
{
    const TECSComponentDerivedPtr<FC_SkillTargetPositionSelectRequest> DerivedPtr = TECSComponentDerivedPtr<FC_SkillTargetPositionSelectRequest>();
    const FC_SkillTargetPositionSelectRequest DefaultValue = FC_SkillTargetPositionSelectRequest();
}
namespace __INTENRAL_FC_SkillTargetPosition_NS
{
    const TECSComponentDerivedPtr<FC_SkillTargetPosition> DerivedPtr = TECSComponentDerivedPtr<FC_SkillTargetPosition>();
    const FC_SkillTargetPosition DefaultValue = FC_SkillTargetPosition();
}
namespace __INTENRAL_FC_SkillTargetPositionView_NS
{
    const TECSComponentDerivedPtr<FC_SkillTargetPositionView> DerivedPtr = TECSComponentDerivedPtr<FC_SkillTargetPositionView>();
    const FC_SkillTargetPositionView DefaultValue = FC_SkillTargetPositionView();
}
namespace __INTENRAL_FCE_SkillTargetEntitySelectStopEvent_NS
{
    const TECSEventDerivedPtr<FCE_SkillTargetEntitySelectStopEvent> DerivedPtr = TECSEventDerivedPtr<FCE_SkillTargetEntitySelectStopEvent>();
}
namespace __INTENRAL_FCE_SelectTargetEntityUpLoadEvent_NS
{
    const TECSEventDerivedPtr<FCE_SelectTargetEntityUpLoadEvent> DerivedPtr = TECSEventDerivedPtr<FCE_SelectTargetEntityUpLoadEvent>();

}
struct FSelectTargetRuntimeData
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bConfirmed;
    UPROPERTY()
    ESelectTargetMethod m_Method;
    UPROPERTY()
    ESelectTargetRequestType m_RequestType;
    UPROPERTY()
    TDataObjectPtr<FEnhancedInputContextConfig> m_ConfirmInputContextConfig;
    UPROPERTY()
    TDataObjectPtr<FViewportSelectTargetParams> m_ViewportSelectTargetParams;

    FSelectTargetRuntimeData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSelectTargetRuntimeData(const FSelectTargetRuntimeData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSelectTargetRuntimeData opAssign(const FSelectTargetRuntimeData &inout Other)
    {
        FSelectTargetRuntimeData __r;
        this.SetbConfirmed(Other.GetbConfirmed());
        this.SetMethod(Other.GetMethod());
        this.SetRequestType(Other.GetRequestType());
        this.SetConfirmInputContextConfig(Other.GetConfirmInputContextConfig());
        this.SetViewportSelectTargetParams(Other.GetViewportSelectTargetParams());
        return __r;
    }
    bool GetbConfirmed() const property
    {
        return this.m_bConfirmed;
    }
    void SetbConfirmed(const bool __Value) property
    {
        if (!(this.m_bConfirmed) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bConfirmed = __Value;
        return;
    }
    ESelectTargetMethod GetMethod() const property
    {
        return this.m_Method;
    }
    void SetMethod(const ESelectTargetMethod __Value) property
    {
        if (int(this.m_Method) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Method = __Value;
        return;
    }
    ESelectTargetRequestType GetRequestType() const property
    {
        return this.m_RequestType;
    }
    void SetRequestType(const ESelectTargetRequestType __Value) property
    {
        if (int(this.m_RequestType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_RequestType = __Value;
        return;
    }
    const TDataObjectPtr<FEnhancedInputContextConfig> GetConfirmInputContextConfig() const property
    {
        const TDataObjectPtr<FEnhancedInputContextConfig> __r;
        return __r;
    }
    TDataObjectPtr<FEnhancedInputContextConfig> GetModify_ConfirmInputContextConfig() property
    {
        TDataObjectPtr<FEnhancedInputContextConfig> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetConfirmInputContextConfig(const TDataObjectPtr<FEnhancedInputContextConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ConfirmInputContextConfig = __Value;
        return;
    }
    const TDataObjectPtr<FViewportSelectTargetParams> GetViewportSelectTargetParams() const property
    {
        const TDataObjectPtr<FViewportSelectTargetParams> __r;
        return __r;
    }
    TDataObjectPtr<FViewportSelectTargetParams> GetModify_ViewportSelectTargetParams() property
    {
        TDataObjectPtr<FViewportSelectTargetParams> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetViewportSelectTargetParams(const TDataObjectPtr<FViewportSelectTargetParams> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_ViewportSelectTargetParams = __Value;
        return;
    }
}

struct FC_SelectTargetRequestLogic : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FName, FSelectTargetRuntimeData> m_DataByRequestName;

    FC_SelectTargetRequestLogic()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_SelectTargetRequestLogic(const FC_SelectTargetRequestLogic &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DataByRequestName = Other.m_DataByRequestName;
        return;
    }
    FC_SelectTargetRequestLogic opAssign(const FC_SelectTargetRequestLogic &inout Other)
    {
        FC_SelectTargetRequestLogic __r;
        this.SetDataByRequestName(Other.GetDataByRequestName());
        return __r;
    }
    const TMap<FName, FSelectTargetRuntimeData> GetDataByRequestName() const property
    {
        const TMap<FName, FSelectTargetRuntimeData> __r;
        return __r;
    }
    TMap<FName, FSelectTargetRuntimeData> GetModify_DataByRequestName() property
    {
        TMap<FName, FSelectTargetRuntimeData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDataByRequestName(const TMap<FName, FSelectTargetRuntimeData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DataByRequestName = __Value;
        return;
    }
}

struct FC_SelectTargetRequestView : FECSComponent
{
    UPROPERTY()
    TMap<FName, FSelectTargetRuntimeData> DataByRequestName;

    FC_SelectTargetRequestView()
    {
        return;
    }
}

struct FSelectTargetResult
{
    UPROPERTY()
    FFPTime m_ExpireTime;
    UPROPERTY()
    TArray<FECSEntity> m_Entities;

    FSelectTargetResult()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FFPTime GetExpireTime() const property
    {
        FFPTime __r;
        return __r;
    }
    FFPTime GetExpireTime() property
    {
        FFPTime __r;
        return __r;
    }
    void SetExpireTime(const FFPTime &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    const TArray<FECSEntity> GetEntities() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetEntities() property
    {
        TArray<FECSEntity> __r;
        return __r;
    }
    void SetEntities(const TArray<FECSEntity> &inout __Value) property
    {
        this.m_Entities = __Value;
        return;
    }
}

struct FC_SelectTargetResult : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_NextExpireTime;
    UPROPERTY()
    TMap<FName, FSelectTargetResult> m_TargetEntitiesByRequestName;

    FC_SelectTargetResult()
    {
        this.m_NextExpireTime = -1;
        this.__InitDirtyFlags();
        return;
    }
    FC_SelectTargetResult(const FC_SelectTargetResult &inout Other)
    {
        this.m_NextExpireTime = -1;
        this.__InitDirtyFlags();
        this.m_NextExpireTime = Other.m_NextExpireTime;
        this.m_TargetEntitiesByRequestName = Other.m_TargetEntitiesByRequestName;
        return;
    }
    FC_SelectTargetResult opAssign(const FC_SelectTargetResult &inout Other)
    {
        FC_SelectTargetResult __r;
        this.SetNextExpireTime(Other.GetNextExpireTime());
        this.SetTargetEntitiesByRequestName(Other.GetTargetEntitiesByRequestName());
        return __r;
    }
    const FFPTime GetNextExpireTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_NextExpireTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetNextExpireTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_NextExpireTime = __Value;
        return;
    }
    const TMap<FName, FSelectTargetResult> GetTargetEntitiesByRequestName() const property
    {
        const TMap<FName, FSelectTargetResult> __r;
        return __r;
    }
    TMap<FName, FSelectTargetResult> GetModify_TargetEntitiesByRequestName() property
    {
        TMap<FName, FSelectTargetResult> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetTargetEntitiesByRequestName(const TMap<FName, FSelectTargetResult> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TargetEntitiesByRequestName = __Value;
        return;
    }
}

struct FSelectTargetIdentifier
{
    UPROPERTY()
    ESelectTargetRequestType Type;
    UPROPERTY()
    FName Name;


}

struct FViewportSelectTargetData
{
    UPROPERTY()
    FSelectTargetIdentifier Identifier;
    UPROPERTY()
    TDataObjectPtr<FViewportSelectTargetParams> Params;

    FViewportSelectTargetData()
    {
        return;
    }
}

struct FViewportSelectTargetEntityData
{
    UPROPERTY()
    bool bTargetUpdated = false;
    UPROPERTY()
    TArray<FECSEntity> Entities;


}

struct FC_ViewportSelectTarget : FECSComponent
{
    UPROPERTY()
    TArray<FViewportSelectTargetData> SelectDatas;
    UPROPERTY()
    TArray<FViewportSelectTargetEntityData> TargetDatas;
    UPROPERTY()
    FVector ChachedCameraPos;
    UPROPERTY()
    FRotator ChachedCameraRot;
    UPROPERTY()
    float32 ChachedCameraFOV = 0.0f;


}

struct FC_SkillTarget : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FECSEntity> m_TargetEntities;
    UPROPERTY()
    TArray<FVector> m_TargetPosition;

    FC_SkillTarget()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_SkillTarget(const FC_SkillTarget &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_TargetEntities = Other.m_TargetEntities;
        this.m_TargetPosition = Other.m_TargetPosition;
        return;
    }
    FC_SkillTarget opAssign(const FC_SkillTarget &inout Other)
    {
        FC_SkillTarget __r;
        this.SetTargetEntities(Other.GetTargetEntities());
        this.SetTargetPosition(Other.GetTargetPosition());
        return __r;
    }
    const TArray<FECSEntity> GetTargetEntities() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetModify_TargetEntities() property
    {
        TArray<FECSEntity> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTargetEntities(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TargetEntities = __Value;
        return;
    }
    TArray<FVector> GetTargetPosition() const property
    {
        TArray<FVector> __r;
        return __r;
    }
    TArray<FVector> GetModify_TargetPosition() property
    {
        TArray<FVector> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetTargetPosition(const TArray<FVector> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TargetPosition = __Value;
        return;
    }
}

struct FSkillTargetEntitySelectRequest
{
    UPROPERTY()
    FName m_SkillName;
    UPROPERTY()
    TDataObjectPtr<FViewportSelectTargetParams> m_Params;

    FSkillTargetEntitySelectRequest()
    {
        return;
    }
    FName GetSkillName() const property
    {
        return this;
    }
    void SetSkillName(const FName &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    TDataObjectPtr<FViewportSelectTargetParams> GetParams() const property
    {
        TDataObjectPtr<FViewportSelectTargetParams> __r;
        return __r;
    }
    TDataObjectPtr<FViewportSelectTargetParams> GetParams() property
    {
        TDataObjectPtr<FViewportSelectTargetParams> __r;
        return __r;
    }
    void SetParams(const TDataObjectPtr<FViewportSelectTargetParams> &inout __Value) property
    {
        this.m_Params = __Value;
        return;
    }
}

struct FSkillTargetEntityStopRequest
{
    UPROPERTY()
    FName m_SkillName;
    UPROPERTY()
    bool m_bClearCurTarget = true;


    FName GetSkillName() const property
    {
        return this;
    }
    void SetSkillName(const FName &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    bool GetbClearCurTarget() const property
    {
        return this.m_bClearCurTarget;
    }
    void SetbClearCurTarget(const bool __Value) property
    {
        this.m_bClearCurTarget = __Value;
        return;
    }
}

struct FC_SkillTargetEntitySelectRequest : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FSkillTargetEntitySelectRequest> m_StartRequsets;
    UPROPERTY()
    TArray<FSkillTargetEntityStopRequest> m_StopRequests;
    UPROPERTY()
    int m_NewlyRequestFrame;

    FC_SkillTargetEntitySelectRequest()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_SkillTargetEntitySelectRequest(const FC_SkillTargetEntitySelectRequest &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_SkillTargetEntitySelectRequest opAssign(const FC_SkillTargetEntitySelectRequest &inout Other)
    {
        FC_SkillTargetEntitySelectRequest __r;
        this.SetStartRequsets(Other.GetStartRequsets());
        this.SetStopRequests(Other.GetStopRequests());
        this.SetNewlyRequestFrame(Other.GetNewlyRequestFrame());
        return __r;
    }
    const TArray<FSkillTargetEntitySelectRequest> GetStartRequsets() const property
    {
        const TArray<FSkillTargetEntitySelectRequest> __r;
        return __r;
    }
    TArray<FSkillTargetEntitySelectRequest> GetModify_StartRequsets() property
    {
        TArray<FSkillTargetEntitySelectRequest> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetStartRequsets(const TArray<FSkillTargetEntitySelectRequest> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_StartRequsets = __Value;
        return;
    }
    const TArray<FSkillTargetEntityStopRequest> GetStopRequests() const property
    {
        const TArray<FSkillTargetEntityStopRequest> __r;
        return __r;
    }
    TArray<FSkillTargetEntityStopRequest> GetModify_StopRequests() property
    {
        TArray<FSkillTargetEntityStopRequest> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetStopRequests(const TArray<FSkillTargetEntityStopRequest> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_StopRequests = __Value;
        return;
    }
    int GetNewlyRequestFrame() const property
    {
        return this.m_NewlyRequestFrame;
    }
    void SetNewlyRequestFrame(const int __Value) property
    {
        if (this.m_NewlyRequestFrame == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_NewlyRequestFrame = __Value;
        return;
    }
}

struct FC_SkillTargetEntitySelectRequestHandle : FECSComponent
{
    UPROPERTY()
    int HandleFrame = 0;


}

struct FCE_SkillTargetEntitySelectStopEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName SkillName;
    UPROPERTY()
    bool bClearCurTarget = true;


}

struct FCE_SelectTargetEntityUpLoadEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    ESelectTargetRequestType RequestType = ESelectTargetRequestType(0);
    UPROPERTY()
    FName RequestName;
    UPROPERTY()
    TArray<FECSEntity> TargetEntityIds;


}

struct FC_SkillTargetPositionSelectRequest : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FSkillTargetPositionSelectParams> m_Params;

    FC_SkillTargetPositionSelectRequest()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_SkillTargetPositionSelectRequest(const FC_SkillTargetPositionSelectRequest &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Params = Other.m_Params;
        return;
    }
    FC_SkillTargetPositionSelectRequest opAssign(const FC_SkillTargetPositionSelectRequest &inout Other)
    {
        FC_SkillTargetPositionSelectRequest __r;
        this.SetParams(Other.GetParams());
        return __r;
    }
    TDataObjectPtr<FSkillTargetPositionSelectParams> GetParams() const property
    {
        TDataObjectPtr<FSkillTargetPositionSelectParams> __r;
        return __r;
    }
    TDataObjectPtr<FSkillTargetPositionSelectParams> GetModify_Params() property
    {
        TDataObjectPtr<FSkillTargetPositionSelectParams> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetParams(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Params = __Value;
        return;
    }
}

struct FC_SkillTargetPosition : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    float32 m_Distance;
    UPROPERTY()
    float32 m_Angle;
    UPROPERTY()
    FVector m_LastTargetPosition;
    UPROPERTY()
    FVector m_TargetPosition;
    UPROPERTY()
    FVector m_DeterminedPosition;

    FC_SkillTargetPosition()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_SkillTargetPosition(const FC_SkillTargetPosition &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_SkillTargetPosition opAssign(const FC_SkillTargetPosition &inout Other)
    {
        FC_SkillTargetPosition __r;
        this.SetDistance(Other.GetDistance());
        this.SetAngle(Other.GetAngle());
        this.SetLastTargetPosition(Other.GetLastTargetPosition());
        this.SetTargetPosition(Other.GetTargetPosition());
        this.SetDeterminedPosition(Other.GetDeterminedPosition());
        return __r;
    }
    float32 GetDistance() const property
    {
        return this.m_Distance;
    }
    void SetDistance(const float32 __Value) property
    {
        if (this.m_Distance == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Distance = __Value;
        return;
    }
    float32 GetAngle() const property
    {
        return this.m_Angle;
    }
    void SetAngle(const float32 __Value) property
    {
        if (this.m_Angle == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Angle = __Value;
        return;
    }
    const FVector GetLastTargetPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LastTargetPosition() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetLastTargetPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LastTargetPosition = __Value;
        return;
    }
    FVector GetTargetPosition() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_TargetPosition() property
    {
        FVector __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetTargetPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_TargetPosition = __Value;
        return;
    }
    const FVector GetDeterminedPosition() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_DeterminedPosition() property
    {
        FVector __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetDeterminedPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_DeterminedPosition = __Value;
        return;
    }
}

struct FC_SkillTargetPositionView : FECSComponent
{
    UPROPERTY()
    FECSEntity FXEntity;
    UPROPERTY()
    TDataObjectPtr<FSkillTargetPositionSelectParams> CurParams;

    FC_SkillTargetPositionView()
    {
        return;
    }
}

namespace ECSFunc_FC_SelectTargetRequestLogic
{
UFUNCTION()
bool HasSelectTargetRequestLogic(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetRequestLogic);
}
FC_SelectTargetRequestLogic& AssignSelectTargetRequestLogic(const FECSEntity &inout Entity, const FC_SelectTargetRequestLogic &inout DefaultValue = FC_SelectTargetRequestLogic())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetRequestLogic, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSelectTargetRequestLogic_BP(const FECSEntity &inout Entity, const FC_SelectTargetRequestLogic &inout DefaultValue = FC_SelectTargetRequestLogic())
{
    ECSFunc_FC_SelectTargetRequestLogic::AssignSelectTargetRequestLogic(Entity, DefaultValue);
    return;
}
FC_SelectTargetRequestLogic& ModifySelectTargetRequestLogic(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetRequestLogic));
    return local_12.GetComp();
}
FC_SelectTargetRequestLogic& ModifyOrAddSelectTargetRequestLogic(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetRequestLogic));
    return local_12.GetComp();
}
const FC_SelectTargetRequestLogic& GetSelectTargetRequestLogic(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetRequestLogic));
    return local_12.GetComp();
}
UFUNCTION()
FC_SelectTargetRequestLogic GetSelectTargetRequestLogic_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SelectTargetRequestLogic& local_4 = ECSFunc_FC_SelectTargetRequestLogic::GetSelectTargetRequestLogic(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SelectTargetRequestLogic();
}
const FC_SelectTargetRequestLogic GetDefaultedSelectTargetRequestLogic(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SelectTargetRequestLogic __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetRequestLogic);
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
FC_SelectTargetRequestLogic GetDefaultedSelectTargetRequestLogic_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SelectTargetRequestLogic::GetDefaultedSelectTargetRequestLogic(Entity);
}
UFUNCTION()
bool RemoveSelectTargetRequestLogic(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetRequestLogic);
}
}
FECSMonitorRuntimeView __GetMonitorSelectTargetRequestLogicOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SelectTargetRequestLogic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectTargetRequestLogicOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SelectTargetRequestLogic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectTargetRequestLogicOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SelectTargetRequestLogic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectTargetRequestLogicOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SelectTargetRequestLogic, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectTargetRequestLogicOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SelectTargetRequestLogic, bFixedFrame, bMustHandleAll);
}
void __MonitorSelectTargetRequestLogicLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SelectTargetRequestLogic, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSelectTargetRequestLogicActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SelectTargetRequestLogic, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSelectTargetRequestLogicModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SelectTargetRequestLogic, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SelectTargetRequestView
{
UFUNCTION()
bool HasSelectTargetRequestView(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetRequestView);
}
FC_SelectTargetRequestView& AssignSelectTargetRequestView(const FECSEntity &inout Entity, const FC_SelectTargetRequestView &inout DefaultValue = FC_SelectTargetRequestView())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetRequestView, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSelectTargetRequestView_BP(const FECSEntity &inout Entity, const FC_SelectTargetRequestView &inout DefaultValue = FC_SelectTargetRequestView())
{
    ECSFunc_FC_SelectTargetRequestView::AssignSelectTargetRequestView(Entity, DefaultValue);
    return;
}
FC_SelectTargetRequestView& ModifySelectTargetRequestView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetRequestView));
    return local_12.GetComp();
}
FC_SelectTargetRequestView& ModifyOrAddSelectTargetRequestView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetRequestView));
    return local_12.GetComp();
}
const FC_SelectTargetRequestView& GetSelectTargetRequestView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetRequestView));
    return local_12.GetComp();
}
UFUNCTION()
FC_SelectTargetRequestView GetSelectTargetRequestView_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SelectTargetRequestView __r;
    bValid = false;
    bValid = ECSFunc_FC_SelectTargetRequestView::GetSelectTargetRequestView(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SelectTargetRequestView GetDefaultedSelectTargetRequestView(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SelectTargetRequestView __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetRequestView);
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
FC_SelectTargetRequestView GetDefaultedSelectTargetRequestView_BP(const FECSEntity &inout Entity)
{
    FC_SelectTargetRequestView __r;
    return __r;
}
UFUNCTION()
bool RemoveSelectTargetRequestView(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetRequestView);
}
}
FECSMonitorRuntimeView __GetMonitorSelectTargetRequestViewOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SelectTargetRequestView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectTargetRequestViewOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SelectTargetRequestView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectTargetRequestViewOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SelectTargetRequestView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectTargetRequestViewOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SelectTargetRequestView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectTargetRequestViewOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SelectTargetRequestView, bFixedFrame, bMustHandleAll);
}
void __MonitorSelectTargetRequestViewLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SelectTargetRequestView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSelectTargetRequestViewActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SelectTargetRequestView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSelectTargetRequestViewModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SelectTargetRequestView, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SelectTargetResult
{
UFUNCTION()
bool HasSelectTargetResult(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetResult);
}
FC_SelectTargetResult& AssignSelectTargetResult(const FECSEntity &inout Entity, const FC_SelectTargetResult &inout DefaultValue = FC_SelectTargetResult())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetResult, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSelectTargetResult_BP(const FECSEntity &inout Entity, const FC_SelectTargetResult &inout DefaultValue = FC_SelectTargetResult())
{
    ECSFunc_FC_SelectTargetResult::AssignSelectTargetResult(Entity, DefaultValue);
    return;
}
FC_SelectTargetResult& ModifySelectTargetResult(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetResult));
    return local_12.GetComp();
}
FC_SelectTargetResult& ModifyOrAddSelectTargetResult(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetResult));
    return local_12.GetComp();
}
const FC_SelectTargetResult& GetSelectTargetResult(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetResult));
    return local_12.GetComp();
}
UFUNCTION()
FC_SelectTargetResult GetSelectTargetResult_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SelectTargetResult& local_4 = ECSFunc_FC_SelectTargetResult::GetSelectTargetResult(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SelectTargetResult();
}
const FC_SelectTargetResult GetDefaultedSelectTargetResult(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SelectTargetResult __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetResult);
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
FC_SelectTargetResult GetDefaultedSelectTargetResult_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SelectTargetResult::GetDefaultedSelectTargetResult(Entity);
}
UFUNCTION()
bool RemoveSelectTargetResult(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SelectTargetResult);
}
}
FECSMonitorRuntimeView __GetMonitorSelectTargetResultOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SelectTargetResult, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectTargetResultOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SelectTargetResult, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectTargetResultOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SelectTargetResult, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectTargetResultOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SelectTargetResult, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSelectTargetResultOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SelectTargetResult, bFixedFrame, bMustHandleAll);
}
void __MonitorSelectTargetResultLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SelectTargetResult, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSelectTargetResultActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SelectTargetResult, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSelectTargetResultModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SelectTargetResult, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ViewportSelectTarget
{
UFUNCTION()
bool HasViewportSelectTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ViewportSelectTarget);
}
FC_ViewportSelectTarget& AssignViewportSelectTarget(const FECSEntity &inout Entity, const FC_ViewportSelectTarget &inout DefaultValue = FC_ViewportSelectTarget())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ViewportSelectTarget, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignViewportSelectTarget_BP(const FECSEntity &inout Entity, const FC_ViewportSelectTarget &inout DefaultValue = FC_ViewportSelectTarget())
{
    ECSFunc_FC_ViewportSelectTarget::AssignViewportSelectTarget(Entity, DefaultValue);
    return;
}
FC_ViewportSelectTarget& ModifyViewportSelectTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ViewportSelectTarget));
    return local_12.GetComp();
}
FC_ViewportSelectTarget& ModifyOrAddViewportSelectTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ViewportSelectTarget));
    return local_12.GetComp();
}
const FC_ViewportSelectTarget& GetViewportSelectTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ViewportSelectTarget));
    return local_12.GetComp();
}
UFUNCTION()
FC_ViewportSelectTarget GetViewportSelectTarget_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_ViewportSelectTarget __r;
    bValid = false;
    bValid = ECSFunc_FC_ViewportSelectTarget::GetViewportSelectTarget(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_ViewportSelectTarget GetDefaultedViewportSelectTarget(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ViewportSelectTarget __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ViewportSelectTarget);
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
FC_ViewportSelectTarget GetDefaultedViewportSelectTarget_BP(const FECSEntity &inout Entity)
{
    FC_ViewportSelectTarget __r;
    return __r;
}
UFUNCTION()
bool RemoveViewportSelectTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ViewportSelectTarget);
}
}
FECSMonitorRuntimeView __GetMonitorViewportSelectTargetOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ViewportSelectTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewportSelectTargetOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ViewportSelectTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewportSelectTargetOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ViewportSelectTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewportSelectTargetOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ViewportSelectTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorViewportSelectTargetOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ViewportSelectTarget, bFixedFrame, bMustHandleAll);
}
void __MonitorViewportSelectTargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ViewportSelectTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorViewportSelectTargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ViewportSelectTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorViewportSelectTargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ViewportSelectTarget, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SkillTarget
{
UFUNCTION()
bool HasSkillTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SkillTarget);
}
FC_SkillTarget& AssignSkillTarget(const FECSEntity &inout Entity, const FC_SkillTarget &inout DefaultValue = FC_SkillTarget())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SkillTarget, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSkillTarget_BP(const FECSEntity &inout Entity, const FC_SkillTarget &inout DefaultValue = FC_SkillTarget())
{
    ECSFunc_FC_SkillTarget::AssignSkillTarget(Entity, DefaultValue);
    return;
}
FC_SkillTarget& ModifySkillTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SkillTarget));
    return local_12.GetComp();
}
FC_SkillTarget& ModifyOrAddSkillTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SkillTarget));
    return local_12.GetComp();
}
const FC_SkillTarget& GetSkillTarget(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SkillTarget));
    return local_12.GetComp();
}
UFUNCTION()
FC_SkillTarget GetSkillTarget_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SkillTarget& local_4 = ECSFunc_FC_SkillTarget::GetSkillTarget(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SkillTarget();
}
const FC_SkillTarget GetDefaultedSkillTarget(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SkillTarget __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SkillTarget);
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
FC_SkillTarget GetDefaultedSkillTarget_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SkillTarget::GetDefaultedSkillTarget(Entity);
}
UFUNCTION()
bool RemoveSkillTarget(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SkillTarget);
}
}
FECSMonitorRuntimeView __GetMonitorSkillTargetOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SkillTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SkillTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SkillTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SkillTarget, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SkillTarget, bFixedFrame, bMustHandleAll);
}
void __MonitorSkillTargetLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SkillTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillTargetActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SkillTarget, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillTargetModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SkillTarget, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SkillTargetEntitySelectRequest
{
UFUNCTION()
bool HasSkillTargetEntitySelectRequest(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetEntitySelectRequest);
}
FC_SkillTargetEntitySelectRequest& AssignSkillTargetEntitySelectRequest(const FECSEntity &inout Entity, const FC_SkillTargetEntitySelectRequest &inout DefaultValue = FC_SkillTargetEntitySelectRequest())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetEntitySelectRequest, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSkillTargetEntitySelectRequest_BP(const FECSEntity &inout Entity, const FC_SkillTargetEntitySelectRequest &inout DefaultValue = FC_SkillTargetEntitySelectRequest())
{
    ECSFunc_FC_SkillTargetEntitySelectRequest::AssignSkillTargetEntitySelectRequest(Entity, DefaultValue);
    return;
}
FC_SkillTargetEntitySelectRequest& ModifySkillTargetEntitySelectRequest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetEntitySelectRequest));
    return local_12.GetComp();
}
FC_SkillTargetEntitySelectRequest& ModifyOrAddSkillTargetEntitySelectRequest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetEntitySelectRequest));
    return local_12.GetComp();
}
const FC_SkillTargetEntitySelectRequest& GetSkillTargetEntitySelectRequest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetEntitySelectRequest));
    return local_12.GetComp();
}
UFUNCTION()
FC_SkillTargetEntitySelectRequest GetSkillTargetEntitySelectRequest_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SkillTargetEntitySelectRequest& local_4 = ECSFunc_FC_SkillTargetEntitySelectRequest::GetSkillTargetEntitySelectRequest(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SkillTargetEntitySelectRequest();
}
const FC_SkillTargetEntitySelectRequest GetDefaultedSkillTargetEntitySelectRequest(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SkillTargetEntitySelectRequest __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetEntitySelectRequest);
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
FC_SkillTargetEntitySelectRequest GetDefaultedSkillTargetEntitySelectRequest_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SkillTargetEntitySelectRequest::GetDefaultedSkillTargetEntitySelectRequest(Entity);
}
UFUNCTION()
bool RemoveSkillTargetEntitySelectRequest(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetEntitySelectRequest);
}
}
FECSMonitorRuntimeView __GetMonitorSkillTargetEntitySelectRequestOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SkillTargetEntitySelectRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetEntitySelectRequestOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SkillTargetEntitySelectRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetEntitySelectRequestOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SkillTargetEntitySelectRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetEntitySelectRequestOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SkillTargetEntitySelectRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetEntitySelectRequestOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SkillTargetEntitySelectRequest, bFixedFrame, bMustHandleAll);
}
void __MonitorSkillTargetEntitySelectRequestLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SkillTargetEntitySelectRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillTargetEntitySelectRequestActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SkillTargetEntitySelectRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillTargetEntitySelectRequestModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SkillTargetEntitySelectRequest, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SkillTargetEntitySelectRequestHandle
{
UFUNCTION()
bool HasSkillTargetEntitySelectRequestHandle(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetEntitySelectRequestHandle);
}
FC_SkillTargetEntitySelectRequestHandle& AssignSkillTargetEntitySelectRequestHandle(const FECSEntity &inout Entity, const FC_SkillTargetEntitySelectRequestHandle &inout DefaultValue = FC_SkillTargetEntitySelectRequestHandle())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetEntitySelectRequestHandle, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSkillTargetEntitySelectRequestHandle_BP(const FECSEntity &inout Entity, const FC_SkillTargetEntitySelectRequestHandle &inout DefaultValue = FC_SkillTargetEntitySelectRequestHandle())
{
    ECSFunc_FC_SkillTargetEntitySelectRequestHandle::AssignSkillTargetEntitySelectRequestHandle(Entity, DefaultValue);
    return;
}
FC_SkillTargetEntitySelectRequestHandle& ModifySkillTargetEntitySelectRequestHandle(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetEntitySelectRequestHandle));
    return local_12.GetComp();
}
FC_SkillTargetEntitySelectRequestHandle& ModifyOrAddSkillTargetEntitySelectRequestHandle(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetEntitySelectRequestHandle));
    return local_12.GetComp();
}
const FC_SkillTargetEntitySelectRequestHandle& GetSkillTargetEntitySelectRequestHandle(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetEntitySelectRequestHandle));
    return local_12.GetComp();
}
UFUNCTION()
FC_SkillTargetEntitySelectRequestHandle GetSkillTargetEntitySelectRequestHandle_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SkillTargetEntitySelectRequestHandle& local_4 = ECSFunc_FC_SkillTargetEntitySelectRequestHandle::GetSkillTargetEntitySelectRequestHandle(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SkillTargetEntitySelectRequestHandle();
}
const FC_SkillTargetEntitySelectRequestHandle GetDefaultedSkillTargetEntitySelectRequestHandle(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SkillTargetEntitySelectRequestHandle __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetEntitySelectRequestHandle);
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
FC_SkillTargetEntitySelectRequestHandle GetDefaultedSkillTargetEntitySelectRequestHandle_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SkillTargetEntitySelectRequestHandle::GetDefaultedSkillTargetEntitySelectRequestHandle(Entity);
}
UFUNCTION()
bool RemoveSkillTargetEntitySelectRequestHandle(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetEntitySelectRequestHandle);
}
}
FECSMonitorRuntimeView __GetMonitorSkillTargetEntitySelectRequestHandleOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SkillTargetEntitySelectRequestHandle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetEntitySelectRequestHandleOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SkillTargetEntitySelectRequestHandle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetEntitySelectRequestHandleOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SkillTargetEntitySelectRequestHandle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetEntitySelectRequestHandleOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SkillTargetEntitySelectRequestHandle, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetEntitySelectRequestHandleOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SkillTargetEntitySelectRequestHandle, bFixedFrame, bMustHandleAll);
}
void __MonitorSkillTargetEntitySelectRequestHandleLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SkillTargetEntitySelectRequestHandle, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillTargetEntitySelectRequestHandleActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SkillTargetEntitySelectRequestHandle, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillTargetEntitySelectRequestHandleModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SkillTargetEntitySelectRequestHandle, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SkillTargetPositionSelectRequest
{
UFUNCTION()
bool HasSkillTargetPositionSelectRequest(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPositionSelectRequest);
}
FC_SkillTargetPositionSelectRequest& AssignSkillTargetPositionSelectRequest(const FECSEntity &inout Entity, const FC_SkillTargetPositionSelectRequest &inout DefaultValue = FC_SkillTargetPositionSelectRequest())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPositionSelectRequest, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSkillTargetPositionSelectRequest_BP(const FECSEntity &inout Entity, const FC_SkillTargetPositionSelectRequest &inout DefaultValue = FC_SkillTargetPositionSelectRequest())
{
    ECSFunc_FC_SkillTargetPositionSelectRequest::AssignSkillTargetPositionSelectRequest(Entity, DefaultValue);
    return;
}
FC_SkillTargetPositionSelectRequest& ModifySkillTargetPositionSelectRequest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPositionSelectRequest));
    return local_12.GetComp();
}
FC_SkillTargetPositionSelectRequest& ModifyOrAddSkillTargetPositionSelectRequest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPositionSelectRequest));
    return local_12.GetComp();
}
const FC_SkillTargetPositionSelectRequest& GetSkillTargetPositionSelectRequest(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPositionSelectRequest));
    return local_12.GetComp();
}
UFUNCTION()
FC_SkillTargetPositionSelectRequest GetSkillTargetPositionSelectRequest_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SkillTargetPositionSelectRequest& local_4 = ECSFunc_FC_SkillTargetPositionSelectRequest::GetSkillTargetPositionSelectRequest(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SkillTargetPositionSelectRequest();
}
const FC_SkillTargetPositionSelectRequest GetDefaultedSkillTargetPositionSelectRequest(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SkillTargetPositionSelectRequest __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPositionSelectRequest);
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
FC_SkillTargetPositionSelectRequest GetDefaultedSkillTargetPositionSelectRequest_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SkillTargetPositionSelectRequest::GetDefaultedSkillTargetPositionSelectRequest(Entity);
}
UFUNCTION()
bool RemoveSkillTargetPositionSelectRequest(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPositionSelectRequest);
}
}
FECSMonitorRuntimeView __GetMonitorSkillTargetPositionSelectRequestOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SkillTargetPositionSelectRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetPositionSelectRequestOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SkillTargetPositionSelectRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetPositionSelectRequestOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SkillTargetPositionSelectRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetPositionSelectRequestOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SkillTargetPositionSelectRequest, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetPositionSelectRequestOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SkillTargetPositionSelectRequest, bFixedFrame, bMustHandleAll);
}
void __MonitorSkillTargetPositionSelectRequestLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SkillTargetPositionSelectRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillTargetPositionSelectRequestActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SkillTargetPositionSelectRequest, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillTargetPositionSelectRequestModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SkillTargetPositionSelectRequest, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SkillTargetPosition
{
UFUNCTION()
bool HasSkillTargetPosition(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPosition);
}
FC_SkillTargetPosition& AssignSkillTargetPosition(const FECSEntity &inout Entity, const FC_SkillTargetPosition &inout DefaultValue = FC_SkillTargetPosition())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPosition, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSkillTargetPosition_BP(const FECSEntity &inout Entity, const FC_SkillTargetPosition &inout DefaultValue = FC_SkillTargetPosition())
{
    ECSFunc_FC_SkillTargetPosition::AssignSkillTargetPosition(Entity, DefaultValue);
    return;
}
FC_SkillTargetPosition& ModifySkillTargetPosition(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPosition));
    return local_12.GetComp();
}
FC_SkillTargetPosition& ModifyOrAddSkillTargetPosition(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPosition));
    return local_12.GetComp();
}
const FC_SkillTargetPosition& GetSkillTargetPosition(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPosition));
    return local_12.GetComp();
}
UFUNCTION()
FC_SkillTargetPosition GetSkillTargetPosition_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_SkillTargetPosition& local_4 = ECSFunc_FC_SkillTargetPosition::GetSkillTargetPosition(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_SkillTargetPosition();
}
const FC_SkillTargetPosition GetDefaultedSkillTargetPosition(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SkillTargetPosition __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPosition);
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
FC_SkillTargetPosition GetDefaultedSkillTargetPosition_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_SkillTargetPosition::GetDefaultedSkillTargetPosition(Entity);
}
UFUNCTION()
bool RemoveSkillTargetPosition(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPosition);
}
}
FECSMonitorRuntimeView __GetMonitorSkillTargetPositionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SkillTargetPosition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetPositionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SkillTargetPosition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetPositionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SkillTargetPosition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetPositionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SkillTargetPosition, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetPositionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SkillTargetPosition, bFixedFrame, bMustHandleAll);
}
void __MonitorSkillTargetPositionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SkillTargetPosition, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillTargetPositionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SkillTargetPosition, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillTargetPositionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SkillTargetPosition, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_SkillTargetPositionView
{
UFUNCTION()
bool HasSkillTargetPositionView(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPositionView);
}
FC_SkillTargetPositionView& AssignSkillTargetPositionView(const FECSEntity &inout Entity, const FC_SkillTargetPositionView &inout DefaultValue = FC_SkillTargetPositionView())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPositionView, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSkillTargetPositionView_BP(const FECSEntity &inout Entity, const FC_SkillTargetPositionView &inout DefaultValue = FC_SkillTargetPositionView())
{
    ECSFunc_FC_SkillTargetPositionView::AssignSkillTargetPositionView(Entity, DefaultValue);
    return;
}
FC_SkillTargetPositionView& ModifySkillTargetPositionView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPositionView));
    return local_12.GetComp();
}
FC_SkillTargetPositionView& ModifyOrAddSkillTargetPositionView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPositionView));
    return local_12.GetComp();
}
const FC_SkillTargetPositionView& GetSkillTargetPositionView(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPositionView));
    return local_12.GetComp();
}
UFUNCTION()
FC_SkillTargetPositionView GetSkillTargetPositionView_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SkillTargetPositionView __r;
    bValid = false;
    bValid = ECSFunc_FC_SkillTargetPositionView::GetSkillTargetPositionView(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SkillTargetPositionView GetDefaultedSkillTargetPositionView(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SkillTargetPositionView __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPositionView);
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
FC_SkillTargetPositionView GetDefaultedSkillTargetPositionView_BP(const FECSEntity &inout Entity)
{
    FC_SkillTargetPositionView __r;
    return __r;
}
UFUNCTION()
bool RemoveSkillTargetPositionView(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SkillTargetPositionView);
}
}
FECSMonitorRuntimeView __GetMonitorSkillTargetPositionViewOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SkillTargetPositionView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetPositionViewOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SkillTargetPositionView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetPositionViewOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SkillTargetPositionView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetPositionViewOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SkillTargetPositionView, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSkillTargetPositionViewOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SkillTargetPositionView, bFixedFrame, bMustHandleAll);
}
void __MonitorSkillTargetPositionViewLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SkillTargetPositionView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillTargetPositionViewActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SkillTargetPositionView, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSkillTargetPositionViewModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SkillTargetPositionView, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FSelectTargetRuntimeData &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FSelectTargetRuntimeData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FSelectTargetRuntimeData
{
int __IndexOf_bConfirmed()
{
    return 0;
}
int __IndexOf_Method()
{
    return 1;
}
int __IndexOf_RequestType()
{
    return 2;
}
int __IndexOf_ConfirmInputContextConfig()
{
    return 3;
}
int __IndexOf_ViewportSelectTargetParams()
{
    return 4;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SelectTargetRequestLogic &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SelectTargetRequestLogic &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SelectTargetRequestLogic &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SelectTargetRequestLogic
{
int __IndexOf_DataByRequestName()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SelectTargetResult &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SelectTargetResult &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SelectTargetResult &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SelectTargetResult
{
int __IndexOf_NextExpireTime()
{
    return 0;
}
int __IndexOf_TargetEntitiesByRequestName()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SkillTarget &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SkillTarget &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SkillTarget &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SkillTarget
{
int __IndexOf_TargetEntities()
{
    return 0;
}
int __IndexOf_TargetPosition()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SkillTargetEntitySelectRequest &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SkillTargetEntitySelectRequest &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SkillTargetEntitySelectRequest &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SkillTargetEntitySelectRequest
{
int __IndexOf_StartRequsets()
{
    return 0;
}
int __IndexOf_StopRequests()
{
    return 1;
}
int __IndexOf_NewlyRequestFrame()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SkillTargetPositionSelectRequest &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SkillTargetPositionSelectRequest &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SkillTargetPositionSelectRequest &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SkillTargetPositionSelectRequest
{
int __IndexOf_Params()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_SkillTargetPosition &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_SkillTargetPosition &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_SkillTargetPosition &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_SkillTargetPosition
{
int __IndexOf_Distance()
{
    return 0;
}
int __IndexOf_Angle()
{
    return 1;
}
int __IndexOf_LastTargetPosition()
{
    return 2;
}
int __IndexOf_TargetPosition()
{
    return 3;
}
int __IndexOf_DeterminedPosition()
{
    return 4;
}
}

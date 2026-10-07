
namespace __INTENRAL_FCE_PendingConfirmHint_NS
{
    const TECSEventDerivedPtr<FCE_PendingConfirmHint> DerivedPtr = TECSEventDerivedPtr<FCE_PendingConfirmHint>();
}
namespace __INTENRAL_FCE_DebugPendingConfirmHint_NS
{
    const TECSEventDerivedPtr<FCE_DebugPendingConfirmHint> DerivedPtr = TECSEventDerivedPtr<FCE_DebugPendingConfirmHint>();
}
namespace __INTENRAL_FCE_PendingConfirmResult_NS
{
    const TECSEventDerivedPtr<FCE_PendingConfirmResult> DerivedPtr = TECSEventDerivedPtr<FCE_PendingConfirmResult>();
}
namespace __INTENRAL_FCE_PendingTimeoutResult_NS
{
    const TECSEventDerivedPtr<FCE_PendingTimeoutResult> DerivedPtr = TECSEventDerivedPtr<FCE_PendingTimeoutResult>();

}
struct FPendingConfirmHintData
{
    FSubDirtyFlags32 __DirtyFlags;
    UPROPERTY()
    int64 m_MessageId;
    UPROPERTY()
    EPendingConfirmFeature m_Feature;
    UPROPERTY()
    FPlayerBriefInfo m_SenderPlayerInfo;
    UPROPERTY()
    TArray<FTextArgument> m_DynamicArguments;

    FPendingConfirmHintData()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPendingConfirmHintData(const FPendingConfirmHintData &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FPendingConfirmHintData opAssign(const FPendingConfirmHintData &inout Other)
    {
        FPendingConfirmHintData __r;
        this.SetMessageId(Other.GetMessageId());
        this.SetFeature(Other.GetFeature());
        this.SetSenderPlayerInfo(Other.GetSenderPlayerInfo());
        this.SetDynamicArguments(Other.GetDynamicArguments());
        return __r;
    }
    int64 GetMessageId() const property
    {
        return this.m_MessageId;
    }
    void SetMessageId(const int64 __Value) property
    {
        if (this.m_MessageId == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_MessageId = __Value;
        return;
    }
    EPendingConfirmFeature GetFeature() const property
    {
        return this.m_Feature;
    }
    void SetFeature(const EPendingConfirmFeature __Value) property
    {
        if (int(this.m_Feature) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Feature = __Value;
        return;
    }
    const FPlayerBriefInfo GetSenderPlayerInfo() const property
    {
        const FPlayerBriefInfo __r;
        return __r;
    }
    FPlayerBriefInfo GetSenderPlayerInfo() property
    {
        FPlayerBriefInfo __r;
        return __r;
    }
    void SetSenderPlayerInfo(const FPlayerBriefInfo &inout __Value) property
    {
        this.m_SenderPlayerInfo = __Value;
        return;
    }
    const TArray<FTextArgument> GetDynamicArguments() const property
    {
        const TArray<FTextArgument> __r;
        return __r;
    }
    TArray<FTextArgument> GetModify_DynamicArguments() property
    {
        TArray<FTextArgument> __r;
        this.__MarkDirty(15);
        return __r;
    }
    void SetDynamicArguments(const TArray<FTextArgument> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(15);
        this.m_DynamicArguments = __Value;
        return;
    }
}

struct FMsg_PendingConfirmHintFormMessage : FEUIMessage
{
    UPROPERTY()
    FPendingConfirmHintData Data;

    FMsg_PendingConfirmHintFormMessage()
    {
        return;
    }
}

struct FCE_PendingConfirmHint : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FPendingConfirmHintData Data;

    FCE_PendingConfirmHint()
    {
        return;
    }
}

struct FCE_DebugPendingConfirmHint : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FPendingConfirmHintData Data;

    FCE_DebugPendingConfirmHint()
    {
        return;
    }
}

struct FCE_PendingConfirmResult : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int64 MessageId;
    UPROPERTY()
    EPendingConfirmAction Result;


}

struct FCE_PendingTimeoutResult : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int64 MessageId;
    UPROPERTY()
    EPendingConfirmAction Result;


    bool Validate() const
    {
        return (this.MessageId > 0);
    }
}

namespace AutoDelta
{
FSubDirtyFlags32 GetDirtyFlags(FPendingConfirmHintData &inout Data)
{
    FSubDirtyFlags32 __r;
    return __r;
}
void ClearDirtyFlags(FPendingConfirmHintData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FPendingConfirmHintData
{
int __IndexOf_MessageId()
{
    return 0;
}
int __IndexOf_Feature()
{
    return 1;
}
int __IndexOf_SenderPlayerInfo()
{
    return 2;
}
int __IndexOf_DynamicArguments()
{
    return 15;
}
}

namespace CommonNewsTickerPendingConsts
{
    const int MaxPendingNewsTickers = 32;
}
namespace FMS_CommonNewsTickerPending
{
    const int ModelId = 0;

}
struct FPendingNewsTickerRequest
{
    UPROPERTY()
    FText Content;
    UPROPERTY()
    int Priority = 0;
    UPROPERTY()
    int RepeatCount = 1;

}

struct FMS_CommonNewsTickerPending : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TArray<FPendingNewsTickerRequest> m_PendingNewsTickers;

    FMS_CommonNewsTickerPending()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_CommonNewsTickerPending(const FMS_CommonNewsTickerPending &inout Other)
    {
        this.m_PendingNewsTickers = Other.m_PendingNewsTickers;
        return;
    }
    FMS_CommonNewsTickerPending& opAssign(const FMS_CommonNewsTickerPending &inout Other)
    {
        return Other.m_PendingNewsTickers;
    }
    void GS_OnMessageHintNewsTickerNotify(const FPbMessageHintNewsTickerNotify &inout Notify)
    {
        FText local_12 = FText::FromString(Notify.GetMsg());
        if (!(ECS::GetECSWorld().IsValid()))
        {
            this.CachePendingNewsTicker(local_12, 0, Notify.GetRepeatCount());
            return;
        }
        FCommonHintParam local_20;
        ::CommonPopup::NewsTicker(local_12, local_20, 0, Notify.GetRepeatCount(), nullptr);
        return;
    }
    void CachePendingNewsTicker(const FText &inout Content, const int Priority, const int RepeatCount)
    {
        while (this.GetPendingNewsTickers().Num() >= 32)
        {
            this.GetModify_PendingNewsTickers().RemoveAt(0);
            XWarning(ELog(16), FString().Append("[NewsTickerPending] Pending overflow (>").Append(32).Append("), dropped oldest"));
        }
        FPendingNewsTickerRequest local_16;
        local_16.Content = Content;
        local_16.Priority = Priority;
        local_16.RepeatCount = FMath::Max(RepeatCount, 1);
        XLog(ELog(16), FString().Append("[NewsTickerPending] Cached while ECSWorld invalid. Pending=").Append(this.GetPendingNewsTickers().Num()).Append(" Repeat=").Append(this.GetModify_PendingNewsTickers().Add(local_16)));
        return;
    }
    void OnECSWorldBegin(const FMsg_ECSWorldBegin &inout Msg)
    {
        this.FlushPendingNewsTickers();
        return;
    }
    void InvalidateEntityCache()
    {
        this.ClearPendingNewsTickers("InvalidateEntityCache");
        return;
    }
    void FlushPendingNewsTickers()
    {
        if (this.GetPendingNewsTickers().IsEmpty())
        {
            return;
        }
        if (!(ECS::GetECSWorld().IsValid()))
        {
            XWarning(ELog(16), FString().Append("[NewsTickerPending] Flush deferred: ECSWorld still invalid. Pending=").Append(this.GetPendingNewsTickers().Num()));
            return;
        }
        TArray<FPendingNewsTickerRequest> local_14 = this.GetPendingNewsTickers();
        this.GetModify_PendingNewsTickers().Reset(0);
        XLog(ELog(16), FString().Append("[NewsTickerPending] Flushing ").Append(local_14.Num()).Append(" pending NewsTicker(s)"));
        for (auto& local_28 : local_14)
        {
            FCommonHintParam local_30;
            ::CommonPopup::NewsTicker(local_28.Content, local_30, int(local_28.Priority), int(local_28.RepeatCount), nullptr);
        }
        return;
    }
    void ClearPendingNewsTickers(const FString &inout Reason)
    {
        if (this.GetPendingNewsTickers().IsEmpty())
        {
            return;
        }
        XLog(ELog(16), FString().Append("[NewsTickerPending] Clear ").Append(this.GetPendingNewsTickers().Num()).Append(" pending on ").Append(Reason));
        this.GetModify_PendingNewsTickers().Reset(0);
        return;
    }
    const TArray<FPendingNewsTickerRequest> GetPendingNewsTickers() const property
    {
        const TArray<FPendingNewsTickerRequest> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FPendingNewsTickerRequest> GetModify_PendingNewsTickers() property
    {
        TArray<FPendingNewsTickerRequest> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPendingNewsTickers(const TArray<FPendingNewsTickerRequest> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PendingNewsTickers = __Value;
        return;
    }
}

namespace FMS_CommonNewsTickerPending
{
FMS_CommonNewsTickerPending& Get(const UObject ContextObject)
{
    return FMS_CommonNewsTickerPending::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_CommonNewsTickerPending& GetByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FMS_CommonNewsTickerPending>(EUIInternal::MakeModelWithManager(Manager, FMS_CommonNewsTickerPending::ModelId)).Get();
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasInvalidateEntityCache(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnMessageHintNewsTickerNotify";
    local_10.ProtoCmdId = uint16(214);
    Result.ProtoRspDefines.Add(local_10);
    FEUIModelMsgHandleDefine local_22;
    local_22.FunctionName = "__OnECSWorldBegin";
    local_22.MessageTypeName = "Msg_ECSWorldBegin";
    local_22.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_22);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_CommonNewsTickerPending;
}
void __GS_OnMessageHintNewsTickerNotify(FMS_CommonNewsTickerPending &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnMessageHintNewsTickerNotify(FPbMessageHintNewsTickerNotify::FromWrapper(ProtoWrapper));
    return;
}
void __OnECSWorldBegin(FMS_CommonNewsTickerPending &inout Model, const FMsg_ECSWorldBegin &inout Message)
{
    Model.OnECSWorldBegin(Message);
    return;
}
int __IndexOf_PendingNewsTickers()
{
    return 0;
}
}

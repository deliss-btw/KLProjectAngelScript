
namespace FMS_MotionUnlock
{
    const int ModelId = 0;

}
struct FMsg_MotionUnlockChanged : FEUIMessage
{
    FMsg_MotionUnlockChanged()
    {
        return;
    }
}

struct FMS_MotionUnlock : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TArray<uint> m_UnlockedMotionIds;

    FMS_MotionUnlock()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_MotionUnlock(const FMS_MotionUnlock &inout Other)
    {
        this.m_UnlockedMotionIds = Other.m_UnlockedMotionIds;
        return;
    }
    FMS_MotionUnlock& opAssign(const FMS_MotionUnlock &inout Other)
    {
        return Other.m_UnlockedMotionIds;
    }
    void GS_OnMotionListNotify(const FPbMotionListNotify &inout Notify)
    {
        TArray<uint> local_4;
        Notify.GetMotionIdList(local_4);
        this.ReplaceMotionList(local_4);
        return;
    }
    void GS_OnMotionUnlockNotify(const FPbMotionUnlockNotify &inout Notify)
    {
        if (this.GetUnlockedMotionIds().Contains(Notify.GetMotionId()))
        {
            XLog(ELog(59), FString().Append("[FMS_MotionUnlock] MotionUnlockNotify ignored, already unlocked. MotionId=").Append(Notify.GetMotionId()));
            return;
        }
        this.GetModify_UnlockedMotionIds().Add(Notify.GetMotionId());
        XLog(ELog(59), FString().Append("[FMS_MotionUnlock] MotionUnlockNotify applied. MotionId=").Append(Notify.GetMotionId()).Append(", Count=").Append(this.GetUnlockedMotionIds().Num()));
        this.NotifyMotionUnlockChanged();
        return;
    }
    bool IsMotionLocked(const FMotionData &inout MotionData) const
    {
        if (!(MotionData.IsLock))
        {
            return false;
        }
        return !(this.GetUnlockedMotionIds().Contains(MotionData.DataId));
    }
    void ReplaceMotionList(const TArray<uint> &inout MotionIdList)
    {
        this.GetModify_UnlockedMotionIds().Empty(0);
        for (auto local_16 : MotionIdList)
        {
            this.GetModify_UnlockedMotionIds().AddUnique(local_16);
        }
        XLog(ELog(59), FString().Append("[FMS_MotionUnlock] MotionListNotify applied. NotifyCount=").Append(MotionIdList.Num()).Append(", AppliedCount=").Append(this.GetUnlockedMotionIds().Num()));
        this.NotifyMotionUnlockChanged();
        return;
    }
    void NotifyMotionUnlockChanged()
    {
        FEUIModelRef local_6 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_6);
        return;
    }
    const TArray<uint> GetUnlockedMotionIds() const property
    {
        const TArray<uint> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<uint> GetModify_UnlockedMotionIds() property
    {
        TArray<uint> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetUnlockedMotionIds(const TArray<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_UnlockedMotionIds = __Value;
        return;
    }
}

namespace FMS_MotionUnlock
{
FMS_MotionUnlock& Get(const UObject ContextObject)
{
    return FMS_MotionUnlock::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_MotionUnlock GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_MotionUnlock __r;
    TEUIModelRef<FMS_MotionUnlock> local_6 = TEUIModelRef<FMS_MotionUnlock>(EUIInternal::MakeModelWithManager(Manager, FMS_MotionUnlock::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnMotionListNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnMotionUnlockNotify";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_MotionUnlock;
}
void __GS_OnMotionListNotify(FMS_MotionUnlock &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnMotionListNotify(FPbMotionListNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnMotionUnlockNotify(FMS_MotionUnlock &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnMotionUnlockNotify(FPbMotionUnlockNotify::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_UnlockedMotionIds()
{
    return 0;
}
}

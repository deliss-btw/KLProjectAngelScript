
namespace FVM_FriendNumInfo
{
    const int ModelId = 0;

}
struct FVM_FriendNumInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_FriendNumMax;
    UPROPERTY()
    int m_FriendNum;
    UPROPERTY()
    FText m_ShowFriendNumText;

    FVM_FriendNumInfo()
    {
        this.m_FriendNumMax = 200;
        this.m_FriendNum = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_FriendNumInfo(const FVM_FriendNumInfo &inout Other)
    {
        this.m_FriendNumMax = 200;
        this.m_FriendNum = 0;
        this.m_FriendNumMax = int(Other.m_FriendNumMax);
        this.m_FriendNum = int(Other.m_FriendNum);
        this.m_ShowFriendNumText = Other.m_ShowFriendNumText;
        return;
    }
    FVM_FriendNumInfo& opAssign(const FVM_FriendNumInfo &inout Other)
    {
        this.m_FriendNumMax = int(Other.m_FriendNumMax);
        this.m_FriendNum = int(Other.m_FriendNum);
        return Other.m_ShowFriendNumText;
    }
    void PostConstruct()
    {
        this.RefreshInfo();
        return;
    }
    void RefreshInfoByMsg(const FMsg_FriendDataUpdated &inout Msg)
    {
        this.RefreshInfo();
        return;
    }
    void RefreshInfo()
    {
        this.SetFriendNumMax(::FriendUtil::GetFriendNumMax());
        this.SetFriendNum(::FriendUtil::GetFriendNum());
        this.SetShowFriendNumText(::FriendUtil::GetFriendNumTips());
        return;
    }
    int GetFriendNumMax() const property
    {
        this.TrackPropertyRead(0);
        return this.m_FriendNumMax;
    }
    void SetFriendNumMax(const int __Value) property
    {
        if (this.m_FriendNumMax == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_FriendNumMax = __Value;
        return;
    }
    int GetFriendNum() const property
    {
        this.TrackPropertyRead(1);
        return this.m_FriendNum;
    }
    void SetFriendNum(const int __Value) property
    {
        if (this.m_FriendNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_FriendNum = __Value;
        return;
    }
    const FText GetShowFriendNumText() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_ShowFriendNumText() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetShowFriendNumText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ShowFriendNumText = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_FriendNumInfo
{
    UPROPERTY()
    TEUIModelRef<FVM_FriendNumInfo> Self;

    __GeneratedProperties_FVM_FriendNumInfo()
    {
        return;
    }
}

namespace FVM_FriendNumInfo
{
FVM_FriendNumInfo& Create(const UObject ContextObject)
{
    return FVM_FriendNumInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_FriendNumInfo CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_FriendNumInfo __r;
    TEUIModelRef<FVM_FriendNumInfo> local_6 = TEUIModelRef<FVM_FriendNumInfo>(EUIInternal::MakeModelWithManager(Manager, FVM_FriendNumInfo::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "FriendNumMax";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FriendNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowFriendNumText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_FriendNumInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_FriendNumInfo;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__RefreshInfoByMsg";
    local_26.MessageTypeName = "Msg_FriendDataUpdated";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_FriendNumInfo;
}
void __RefreshInfoByMsg(FVM_FriendNumInfo &inout Model, const FMsg_FriendDataUpdated &inout Message)
{
    Model.RefreshInfoByMsg(Message);
    return;
}
int __UIGetter_FriendNumMax(const FVM_FriendNumInfo &inout Model)
{
    return Model.GetFriendNumMax();
}
int __UIGetter_FriendNum(const FVM_FriendNumInfo &inout Model)
{
    return Model.GetFriendNum();
}
FText __UIGetter_ShowFriendNumText(const FVM_FriendNumInfo &inout Model)
{
    return Model.GetShowFriendNumText();
}
TEUIModelRef<FVM_FriendNumInfo> __UIGetter_Self(const FVM_FriendNumInfo &inout Model)
{
    return TEUIModelRef<FVM_FriendNumInfo>(Model);
}
int __IndexOf_FriendNumMax()
{
    return 0;
}
int __IndexOf_FriendNum()
{
    return 1;
}
int __IndexOf_ShowFriendNumText()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_FriendNumInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

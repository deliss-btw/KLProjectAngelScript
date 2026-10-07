
namespace FVM_LoginServer
{
    const int ModelId = 0;

}
struct FVM_LoginServer : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_RegionInfo>> m_RegionVMList;
    UPROPERTY()
    int m_SelectedRegionIndex;
    UPROPERTY()
    bool m_bNeedClose;

    FVM_LoginServer()
    {
        this.m_SelectedRegionIndex = 0;
        this.m_bNeedClose = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_LoginServer(const FVM_LoginServer &inout Other)
    {
        this.m_SelectedRegionIndex = 0;
        this.m_bNeedClose = false;
        this.m_RegionVMList = Other.m_RegionVMList;
        this.m_SelectedRegionIndex = int(Other.m_SelectedRegionIndex);
        this.m_bNeedClose = Other.m_bNeedClose;
        return;
    }
    FVM_LoginServer opAssign(const FVM_LoginServer &inout Other)
    {
        FVM_LoginServer __r;
        this.m_RegionVMList = Other.m_RegionVMList;
        this.m_SelectedRegionIndex = int(Other.m_SelectedRegionIndex);
        this.m_bNeedClose = Other.m_bNeedClose;
        return __r;
    }
    void HandleLoginServerSelect(const FMsg_LoginServerSelect &inout Msg)
    {
        this.SetbNeedClose(false);
        FString local_6 = Msg.ServerName;
        int local_7 = 0;
        for (; local_7 < this.GetRegionVMList().Num(); ++local_7)
        {
            if ((FString(GetName()) == local_6))
            {
                this.SetbNeedClose(true);
                this.SetSelectedRegionIndex(local_7);
                break;
            }
        }
        return;
    }
    const TArray<TEUIModelRef<FVM_RegionInfo>> GetRegionVMList() const property
    {
        const TArray<TEUIModelRef<FVM_RegionInfo>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<TEUIModelRef<FVM_RegionInfo>> GetModify_RegionVMList() property
    {
        TArray<TEUIModelRef<FVM_RegionInfo>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetRegionVMList(const TArray<TEUIModelRef<FVM_RegionInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_RegionVMList = __Value;
        return;
    }
    int GetSelectedRegionIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SelectedRegionIndex;
    }
    void SetSelectedRegionIndex(const int __Value) property
    {
        if (this.m_SelectedRegionIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SelectedRegionIndex = __Value;
        return;
    }
    bool GetbNeedClose() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bNeedClose;
    }
    void SetbNeedClose(const bool __Value) property
    {
        if (!(this.m_bNeedClose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bNeedClose = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_LoginServer
{
    UPROPERTY()
    TEUIModelRef<FVM_LoginServer> Self;

    __GeneratedProperties_FVM_LoginServer()
    {
        return;
    }
}

namespace FVM_LoginServer
{
FVM_LoginServer& Create(const UObject ContextObject)
{
    return FVM_LoginServer::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_LoginServer CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_LoginServer __r;
    TEUIModelRef<FVM_LoginServer> local_6 = TEUIModelRef<FVM_LoginServer>(EUIInternal::MakeModelWithManager(Manager, FVM_LoginServer::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RegionVMList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_RegionInfo>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_LoginServer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_LoginServer;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__HandleLoginServerSelect";
    local_26.MessageTypeName = "Msg_LoginServerSelect";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_LoginServer;
}
void __HandleLoginServerSelect(FVM_LoginServer &inout Model, const FMsg_LoginServerSelect &inout Message)
{
    Model.HandleLoginServerSelect(Message);
    return;
}
TArray<TEUIModelRef<FVM_RegionInfo>> __UIGetter_RegionVMList(const FVM_LoginServer &inout Model)
{
    return Model.GetRegionVMList();
}
TEUIModelRef<FVM_LoginServer> __UIGetter_Self(const FVM_LoginServer &inout Model)
{
    return TEUIModelRef<FVM_LoginServer>(Model);
}
int __IndexOf_RegionVMList()
{
    return 0;
}
int __IndexOf_SelectedRegionIndex()
{
    return 1;
}
int __IndexOf_bNeedClose()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_LoginServer
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

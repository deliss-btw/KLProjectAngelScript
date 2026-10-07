
namespace FVM_RedDot
{
    const int ModelId = 0;

}
struct FVM_RedDot : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FRedDotNodeData m_NodeData;
    UPROPERTY()
    int m_LimitDisplayCount;
    UPROPERTY()
    TEUIModelWeakRef<FM_RedDotNode> m_WeakRedDotNodeModel;
    UPROPERTY()
    bool m_bDisplayHasRedDot;
    UPROPERTY()
    int m_DisplayRedDotNumSwitchIndex;
    UPROPERTY()
    int m_DisplayRedDotNum;

    FVM_RedDot()
    {
        this.m_LimitDisplayCount = 99;
        this.m_bDisplayHasRedDot = false;
        this.m_DisplayRedDotNumSwitchIndex = 0;
        this.m_DisplayRedDotNum = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_RedDot' by default constructor.");
        return;
    }
    FVM_RedDot(const FVM_RedDot &inout Other)
    {
        this.m_LimitDisplayCount = 99;
        this.m_bDisplayHasRedDot = false;
        this.m_DisplayRedDotNumSwitchIndex = 0;
        this.m_DisplayRedDotNum = 0;
        this.m_LimitDisplayCount = int(Other.m_LimitDisplayCount);
        this.m_WeakRedDotNodeModel = Other.m_WeakRedDotNodeModel;
        this.m_bDisplayHasRedDot = Other.m_bDisplayHasRedDot;
        this.m_DisplayRedDotNumSwitchIndex = int(Other.m_DisplayRedDotNumSwitchIndex);
        this.m_DisplayRedDotNum = int(Other.m_DisplayRedDotNum);
        return;
    }
    FVM_RedDot(const FRedDotNodeData &inout InNodeData)
    {
        this.m_LimitDisplayCount = 99;
        this.m_bDisplayHasRedDot = false;
        this.m_DisplayRedDotNumSwitchIndex = 0;
        this.m_DisplayRedDotNum = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetNodeData(InNodeData);
        return;
    }
    FVM_RedDot opAssign(const FVM_RedDot &inout Other)
    {
        FVM_RedDot __r;
        this.m_LimitDisplayCount = int(Other.m_LimitDisplayCount);
        this.m_WeakRedDotNodeModel = Other.m_WeakRedDotNodeModel;
        this.m_bDisplayHasRedDot = Other.m_bDisplayHasRedDot;
        this.m_DisplayRedDotNumSwitchIndex = int(Other.m_DisplayRedDotNumSwitchIndex);
        this.m_DisplayRedDotNum = int(Other.m_DisplayRedDotNum);
        return __r;
    }
    void LoadConfig(const FConfigVM_RedDot &inout InConfig)
    {
        this.SetLimitDisplayCount(int(InConfig.LimitDisplayCount));
        return;
    }
    void PostConstruct()
    {
        if (this.GetNodeData().NodeTag.IsValid())
        {
            this.SetWeakRedDotNodeModel(::FMS_RedDotSystem::Get(this.GetContext().Manager).TryGetRedDotNodeModel(this.GetNodeData()));
            if (!(this.GetWeakRedDotNodeModel().IsValid()))
            {
                this.SetWeakRedDotNodeModel(::FMS_RedDotSystem::Get(this.GetContext().Manager).TryFindOrAddRedDotNode(this.GetNodeData()));
            }
        }
        return;
    }
    bool HasRedDot() const
    {
        return this.GetbDisplayHasRedDot();
    }
    int GetRedDotNumSwitchIndex() const
    {
        return this.GetDisplayRedDotNumSwitchIndex();
    }
    int GetRedDotDisplayNum() const
    {
        return this.GetDisplayRedDotNum();
    }
    void RefreshRedDotDisplayState()
    {
        if (!((this.GetWeakRedDotNodeModel().IsValid() ? this.GetWeakRedDotNodeModel() : ::FMS_RedDotSystem::Get(this.GetContext().Manager).TryGetRedDotNodeModel(this.GetNodeData())).IsValid()))
        {
            this.SetbDisplayHasRedDot(false);
            this.SetDisplayRedDotNumSwitchIndex(0);
            this.SetDisplayRedDotNum(0);
            return;
        }
        int local_11 = GetCount();
        this.SetbDisplayHasRedDot((local_11 > 0));
        this.SetDisplayRedDotNum(local_11);
        if (int(GetDisplayType()) == 0)
        {
            this.SetDisplayRedDotNumSwitchIndex(0);
        }
        else
        {
            if (int(GetDisplayType()) == 1)
            {
                int local_14 = local_11 <= this.GetLimitDisplayCount() ? 1 : 2;
                this.SetDisplayRedDotNumSwitchIndex(local_14);
            }
            else
            {
                if (int(GetDisplayType()) == 2)
                {
                    this.SetDisplayRedDotNumSwitchIndex(3);
                }
                else
                {
                    this.SetDisplayRedDotNumSwitchIndex(0);
                }
            }
        }
        return;
    }
    const FRedDotNodeData GetNodeData() const property
    {
        const FRedDotNodeData __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FRedDotNodeData GetModify_NodeData() property
    {
        FRedDotNodeData __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetNodeData(const FRedDotNodeData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    int GetLimitDisplayCount() const property
    {
        this.TrackPropertyRead(1);
        return this.m_LimitDisplayCount;
    }
    void SetLimitDisplayCount(const int __Value) property
    {
        if (this.m_LimitDisplayCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_LimitDisplayCount = __Value;
        return;
    }
    TEUIModelWeakRef<FM_RedDotNode> GetWeakRedDotNodeModel() const property
    {
        this.TrackPropertyRead(2);
        return this.m_WeakRedDotNodeModel;
    }
    void SetWeakRedDotNodeModel(const TEUIModelWeakRef<FM_RedDotNode> &inout __Value) property
    {
        TEUIModelWeakRef<FM_RedDotNode> local_2;
        local_2 = this.m_WeakRedDotNodeModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_WeakRedDotNodeModel = __Value;
        return;
    }
    bool GetbDisplayHasRedDot() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bDisplayHasRedDot;
    }
    void SetbDisplayHasRedDot(const bool __Value) property
    {
        if (!(this.m_bDisplayHasRedDot) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bDisplayHasRedDot = __Value;
        return;
    }
    int GetDisplayRedDotNumSwitchIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_DisplayRedDotNumSwitchIndex;
    }
    void SetDisplayRedDotNumSwitchIndex(const int __Value) property
    {
        if (this.m_DisplayRedDotNumSwitchIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DisplayRedDotNumSwitchIndex = __Value;
        return;
    }
    int GetDisplayRedDotNum() const property
    {
        this.TrackPropertyRead(5);
        return this.m_DisplayRedDotNum;
    }
    void SetDisplayRedDotNum(const int __Value) property
    {
        if (this.m_DisplayRedDotNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_DisplayRedDotNum = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_RedDot
{
    UPROPERTY()
    bool HasRedDot;
    UPROPERTY()
    int RedDotNumSwitchIndex;
    UPROPERTY()
    int RedDotDisplayNum;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> Self;


}

namespace FVM_RedDot
{
FVM_RedDot& Create(const UObject ContextObject, const FRedDotNodeData &inout NodeData)
{
    return FVM_RedDot::CreateByManager(EUIInternal::GetContextManager(ContextObject), NodeData);
}
FVM_RedDot CreateByManager(const UEUIManagerSubsystem Manager, const FRedDotNodeData &inout NodeData)
{
    FVM_RedDot __r;
    TEUIModelRef<FVM_RedDot> local_6 = TEUIModelRef<FVM_RedDot>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_RedDot::ModelId, 0, NodeData));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "HasRedDot";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RedDotNumSwitchIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RedDotDisplayNum";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_RedDot;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshRedDotDisplayState";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_RedDot;
}
bool __UIGetter_HasRedDot(const FVM_RedDot &inout Model)
{
    return Model.HasRedDot();
}
int __UIGetter_RedDotNumSwitchIndex(const FVM_RedDot &inout Model)
{
    return Model.GetRedDotNumSwitchIndex();
}
int __UIGetter_RedDotDisplayNum(const FVM_RedDot &inout Model)
{
    return Model.GetRedDotDisplayNum();
}
TEUIModelRef<FVM_RedDot> __UIGetter_Self(const FVM_RedDot &inout Model)
{
    return TEUIModelRef<FVM_RedDot>(Model);
}
int __IndexOf_NodeData()
{
    return 0;
}
int __IndexOf_LimitDisplayCount()
{
    return 1;
}
int __IndexOf_WeakRedDotNodeModel()
{
    return 2;
}
int __IndexOf_bDisplayHasRedDot()
{
    return 3;
}
int __IndexOf_DisplayRedDotNumSwitchIndex()
{
    return 4;
}
int __IndexOf_DisplayRedDotNum()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_RedDot
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

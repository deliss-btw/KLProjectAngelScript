
const uint RedDotManualSource = 0;
const float32 ReddotRequestStoreCountDown = 5f;
namespace FM_RedDotNode
{
    const int ModelId = 0;
}
namespace FMS_RedDotSystem
{
    const int ModelId = 0;

}
struct FM_RedDotNode : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    FRedDotNodeData m_NodeData;
    UPROPERTY()
    ERedDotType m_DisplayType;
    UPROPERTY()
    TArray<ERedPointEvent> m_ResponseEventList;
    UPROPERTY()
    TMap<uint, int> m_SourceCounts;
    UPROPERTY()
    TSet<FRedDotNodeData> m_ChildNodeDataSet;
    UPROPERTY()
    int m_ChildCount;
    UPROPERTY()
    bool m_bHasGhostChild;

    FM_RedDotNode()
    {
        this.m_DisplayType = ERedDotType(0);
        this.m_ChildCount = 0;
        this.m_bHasGhostChild = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_RedDotNode' by default constructor.");
        return;
    }
    FM_RedDotNode(const FM_RedDotNode &inout Other)
    {
        this.m_DisplayType = ERedDotType(0);
        this.m_ChildCount = 0;
        this.m_bHasGhostChild = false;
        this.m_DisplayType = Other.m_DisplayType;
        this.m_ResponseEventList = Other.m_ResponseEventList;
        this.m_SourceCounts = Other.m_SourceCounts;
        this.m_ChildNodeDataSet = Other.m_ChildNodeDataSet;
        this.m_ChildCount = int(Other.m_ChildCount);
        this.m_bHasGhostChild = Other.m_bHasGhostChild;
        return;
    }
    FM_RedDotNode(const FRedDotNodeData &inout InNodeData)
    {
        this.m_DisplayType = ERedDotType(0);
        this.m_ChildCount = 0;
        this.m_bHasGhostChild = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetNodeData(InNodeData);
        return;
    }
    FM_RedDotNode opAssign(const FM_RedDotNode &inout Other)
    {
        FM_RedDotNode __r;
        this.m_DisplayType = Other.m_DisplayType;
        this.m_ResponseEventList = Other.m_ResponseEventList;
        this.m_SourceCounts = Other.m_SourceCounts;
        this.m_ChildNodeDataSet = Other.m_ChildNodeDataSet;
        this.m_ChildCount = int(Other.m_ChildCount);
        this.m_bHasGhostChild = Other.m_bHasGhostChild;
        return __r;
    }
    void PostConstruct()
    {
        return;
    }
    int GetCount() const
    {
        int local_1 = 0;
        for (auto& local_22 : this.GetSourceCounts())
        {
            local_22;
            local_1 = local_1 + 0;
        }
        return local_1;
    }
    int GetSourceCount(const uint InSource)
    {
        int local_1 = 0;
        this.GetSourceCounts().Find(InSource, local_1);
        return local_1;
    }
    void GetSourceKeys(TArray<uint> &inout OutSourceKeys)
    {
        for (auto& local_20 : this.GetSourceCounts())
        {
            OutSourceKeys.Add(local_20.GetKey());
        }
        return;
    }
    void IncreaseCount(const int InCount = 1)
    {
        this.IncreaseSourceCount(0, InCount);
        return;
    }
    void DecreaseCount(const int InCount = 1)
    {
        this.IncreaseSourceCount(0, -InCount);
        return;
    }
    void IncreaseSourceCount(const uint InSource, const int InCount = 1)
    {
        int local_4 = FMath::Max((this.GetSourceCount(InSource) + InCount), 0);
        if (local_4 > 0)
        {
            this.GetModify_SourceCounts().Add(InSource, local_4);
            return;
        }
        return;
    }
    void DecreaseSourceCount(const uint InSource, const int InCount = 1)
    {
        this.IncreaseSourceCount(InSource, -InCount);
        return;
    }
    void AddChildNodeData(const FRedDotNodeData &inout InNodeData)
    {
        if (!(this.GetChildNodeDataSet().Contains(InNodeData)))
        {
            this.GetModify_ChildNodeDataSet().Add(InNodeData);
            this.IncreaseChildCount(1);
        }
        return;
    }
    void RemoveChildNodeData(const FRedDotNodeData &inout InNodeData)
    {
        // body not fully recovered вЂ” stub [unresolved-operand]
    }
    void RemoveAllChildNodeData()
    {
        this.GetModify_ChildNodeDataSet().Reset();
        this.DecreaseChildCount(this.GetChildCount());
        return;
    }
    void IncreaseChildCount(const int InCount = 1)
    {
        this.SetChildCount(FMath::Max((this.GetChildCount() + InCount), 0));
        return;
    }
    void DecreaseChildCount(const int InCount = 1)
    {
        this.SetChildCount(FMath::Max((this.GetChildCount() - InCount), 0));
        return;
    }
    bool HasChildActivation()
    {
        return (this.GetChildCount() > 0);
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
    ERedDotType GetDisplayType() const property
    {
        this.TrackPropertyRead(1);
        return this.m_DisplayType;
    }
    void SetDisplayType(const ERedDotType __Value) property
    {
        if (int(this.m_DisplayType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DisplayType = __Value;
        return;
    }
    const TArray<ERedPointEvent> GetResponseEventList() const property
    {
        const TArray<ERedPointEvent> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<ERedPointEvent> GetModify_ResponseEventList() property
    {
        TArray<ERedPointEvent> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetResponseEventList(const TArray<ERedPointEvent> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ResponseEventList = __Value;
        return;
    }
    const TMap<uint, int> GetSourceCounts() const property
    {
        const TMap<uint, int> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<uint, int> GetModify_SourceCounts() property
    {
        TMap<uint, int> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetSourceCounts(const TMap<uint, int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SourceCounts = __Value;
        return;
    }
    const TSet<FRedDotNodeData> GetChildNodeDataSet() const property
    {
        const TSet<FRedDotNodeData> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TSet<FRedDotNodeData> GetModify_ChildNodeDataSet() property
    {
        TSet<FRedDotNodeData> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetChildNodeDataSet(const TSet<FRedDotNodeData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ChildNodeDataSet = __Value;
        return;
    }
    int GetChildCount() const property
    {
        this.TrackPropertyRead(5);
        return this.m_ChildCount;
    }
    void SetChildCount(const int __Value) property
    {
        if (this.m_ChildCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ChildCount = __Value;
        return;
    }
    bool GetbHasGhostChild() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bHasGhostChild;
    }
    void SetbHasGhostChild(const bool __Value) property
    {
        if (!(this.m_bHasGhostChild) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bHasGhostChild = __Value;
        return;
    }
}

struct FRedDotEventConfigData
{
    UPROPERTY()
    TSet<uint> EventDataIdSet;

    FRedDotEventConfigData()
    {
        return;
    }
}

struct FMsg_RedPointDataRestored : FEUIMessage
{
    FMsg_RedPointDataRestored()
    {
        return;
    }
}

struct FMS_RedDotSystem : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<FGameplayTag, FRedPointNodeConfig> m_RedPointNodeConfigMap;
    UPROPERTY()
    TMap<ERedPointEvent, FRedDotEventConfigData> m_RedPointEventConfigMap;
    UPROPERTY()
    TMap<FRedDotNodeData, TEUIModelRef<FM_RedDotNode>> m_RedDotNodeDataMap;
    UPROPERTY()
    TMap<uint, FPbRedPointEventData> m_PbRedDotEventDataMap;
    UPROPERTY()
    bool m_bCanRequestStore;
    UPROPERTY()
    bool m_bRequestStoreDataDirty;
    UPROPERTY()
    FFPTime m_CurRequestStoreCountDown;

    FMS_RedDotSystem()
    {
        this.m_bCanRequestStore = false;
        this.m_bRequestStoreDataDirty = false;
        this.m_CurRequestStoreCountDown = 5.0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_RedDotSystem(const FMS_RedDotSystem &inout Other)
    {
        this.m_bCanRequestStore = false;
        this.m_bRequestStoreDataDirty = false;
        this.m_CurRequestStoreCountDown = 5.0;
        this.m_RedPointNodeConfigMap = Other.m_RedPointNodeConfigMap;
        this.m_RedPointEventConfigMap = Other.m_RedPointEventConfigMap;
        this.m_RedDotNodeDataMap = Other.m_RedDotNodeDataMap;
        this.m_PbRedDotEventDataMap = Other.m_PbRedDotEventDataMap;
        this.m_bCanRequestStore = Other.m_bCanRequestStore;
        this.m_bRequestStoreDataDirty = Other.m_bRequestStoreDataDirty;
        this.m_CurRequestStoreCountDown = Other.m_CurRequestStoreCountDown;
        return;
    }
    FMS_RedDotSystem& opAssign(const FMS_RedDotSystem &inout Other)
    {
        this.m_RedPointNodeConfigMap = Other.m_RedPointNodeConfigMap;
        this.m_RedPointEventConfigMap = Other.m_RedPointEventConfigMap;
        this.m_RedDotNodeDataMap = Other.m_RedDotNodeDataMap;
        this.m_PbRedDotEventDataMap = Other.m_PbRedDotEventDataMap;
        this.m_bCanRequestStore = Other.m_bCanRequestStore;
        this.m_bRequestStoreDataDirty = Other.m_bRequestStoreDataDirty;
        return Other.m_CurRequestStoreCountDown;
    }
    void PostConstruct()
    {
        TDataObjectIterator<FRedPointNodeConfig> local_16;
        for (; local_16; )
        {
            const FRedPointNodeConfig& local_20 = local_16.GetData();
            this.GetModify_RedPointNodeConfigMap().Add(local_20.NodeTag, local_20);
            local_16.Next();
        }
        TDataObjectIterator<FRedPointConfig> local_36;
        for (; local_36; )
        {
            const FRedPointConfig& local_38 = local_36.GetData();
            if (int(local_38.EventType) != 0)
            {
                this.GetModify_RedPointEventConfigMap().FindOrAdd(local_38.EventType).EventDataIdSet.Add(local_38.DataId);
            }
            local_36.Next();
        }
        return;
    }
    void Tick()
    {
        if (!(this.GetbCanRequestStore()))
        {
            return;
        }
        FFPTime local_4 = (this.GetCurRequestStoreCountDown() - this.GetContext().DeltaTime);
        this.SetCurRequestStoreCountDown(local_4);
        if (FFPTime(this.GetCurRequestStoreCountDown()).opCmp(0.0) < 0)
        {
            this.SetCurRequestStoreCountDown(FFPTime(5.0));
            if (this.GetbRequestStoreDataDirty())
            {
                this.SetbRequestStoreDataDirty(false);
                this.GS_RequestStoreRedPoint();
            }
        }
        return;
    }
    TEUIModelWeakRef<FM_RedDotNode> TryGetRedDotNodeModel(const FRedDotNodeData &inout InNodeData) const
    {
        TEUIModelRef<FM_RedDotNode> local_2;
        if (this.GetRedDotNodeDataMap().Find(InNodeData, local_2))
        {
            if (local_2.IsValid())
            {
                return TEUIModelWeakRef<FM_RedDotNode>();
            }
        }
        return (TEUIModelWeakRef<FM_RedDotNode>(nullptr));
    }
    ERedDotType GetRedDotDisplayType(const FRedDotNodeData &inout InNodeData) const
    {
        TEUIModelRef<FM_RedDotNode> local_2;
        if (this.GetRedDotNodeDataMap().Find(InNodeData, local_2))
        {
            if (local_2.IsValid())
            {
                return GetDisplayType();
            }
        }
        return ERedDotType(0);
    }
    int GetRedDotCount(const FRedDotNodeData &inout InNodeData) const
    {
        TEUIModelRef<FM_RedDotNode> local_2;
        if (this.GetRedDotNodeDataMap().Find(InNodeData, local_2))
        {
            if (local_2.IsValid())
            {
                return GetCount();
            }
        }
        return 0;
    }
    bool HasRedDot(const FRedDotNodeData &inout InNodeData) const
    {
        return (this.GetRedDotCount(InNodeData) > 0);
    }
    bool HasRedDot(const FGameplayTag &inout InNodeTag, const uint64 InExtraDataId = 0)
    {
        return this.HasRedDot(FRedDotNodeData(InNodeTag, InExtraDataId));
    }
    bool HasRedDotByEvent(const ERedPointEvent InEventType, const uint64 InExtraDataId = 0)
    {
        FRedDotEventConfigData local_24;
        bool local_141 = false;
        if (int(InEventType) == 0)
        {
            return false;
        }
        if (!(this.GetRedPointEventConfigMap().Find(InEventType, local_24)))
        {
            return false;
        }
        for (auto local_42 : local_24.EventDataIdSet)
        {
            GetDataObjectByGSDataId<FRedPointConfig> local_90;
            if (local_90.opImplConv().IsSet() && GetNodeConfig().IsSet() && local_141)
            {
                return true;
            }
        }
        return false;
    }
    bool HasRedDotFromEvent(const ERedPointEvent InEventType, const FGameplayTag &inout InNodeTag, const uint64 InExtraDataId = 0)
    {
        FRedDotEventConfigData local_24;
        if (int(InEventType) == 0)
        {
            return false;
        }
        if (!(this.GetRedPointEventConfigMap().Find(InEventType, local_24)))
        {
            return false;
        }
        FRedDotNodeData local_28 = FRedDotNodeData(InNodeTag, InExtraDataId);
        TEUIModelRef<FM_RedDotNode> local_30;
        if (!(this.GetRedDotNodeDataMap().Find(local_28, local_30)) || !(local_30.IsValid()))
        {
            return false;
        }
        for (auto local_50 : local_24.EventDataIdSet)
        {
            if (int(local_50).GetSourceCount() > 0)
            {
                return true;
            }
        }
        return false;
    }
    bool InternalConsumeRedDot(const TDataObjectPtr<FRedPointNodeConfig> &inout InNodeCfg, const uint64 InExtraDataId, const uint InSource, const TEUIModelRef<FM_RedDotNode> &inout InChildNodeModel, const int InConsumeCount, TSet<FRedDotNodeData> &inout VisitedNodes)
    {
        bool local_1;
        FRedDotNodeData local_6;
        local_1 = false;
        if (!(InNodeCfg.IsSet()))
        {
            return local_1;
        }
        if (VisitedNodes.Contains(local_6))
        {
            return local_1;
        }
        VisitedNodes.Add(local_6);
        TEUIModelRef<FM_RedDotNode> local_8;
        if (!(this.GetRedDotNodeDataMap().Find(local_6, local_8)) || !(local_8.IsValid()))
        {
            return local_1;
        }
        bool local_10 = false;
        if (InChildNodeModel.IsValid())
        {
            int local_12 = GetCount();
            InSource.DecreaseSourceCount(InConsumeCount);
            FRedDotNodeData local_16 = FRedDotNodeData(GetNodeData().NodeTag, 0);
            TEUIModelRef<FM_RedDotNode> local_20;
            if (!(this.GetRedDotNodeDataMap().Find(local_16, local_20)) || (GetCount() <= 0))
            {
                local_16.RemoveChildNodeData();
            }
            local_10 = (local_12 != GetCount());
        }
        bool local_9 = local_10 || (!(HasChildActivation()) && (GetCount() > 0));
        if (local_9)
        {
            if (!(GetbHasGhostChild()) && !(HasChildActivation()))
            {
                InSource.DecreaseSourceCount(InSource.GetSourceCount());
                TEUIModelRef<FM_RedDotNode> local_20;
                if (local_6.ExtraDataId <= 0)
                {
                    local_9 = false;
                }
                else
                {
                    local_9 = this.GetRedDotNodeDataMap().Find(FRedDotNodeData(local_6.NodeTag, 0), local_20);
                }
                if (local_9)
                {
                    InSource.DecreaseSourceCount(InConsumeCount);
                    if (GetCount() <= 0)
                    {
                        GetNodeData().RemoveChildNodeData();
                    }
                }
                FPbRedPointEventData local_38;
                if (this.GetPbRedDotEventDataMap().Find(InSource, local_38))
                {
                    TArray<uint64> local_42;
                    local_38.GetParams(local_42);
                    int local_43 = local_42.Num() - 1;
                    for (; local_43 >= 0; --local_43)
                    {
                        if (local_42[local_43] == local_6.ExtraDataId)
                        {
                            local_38.RemoveParams_Index(local_43);
                        }
                    }
                    if (local_38.GetParams_Num() <= 0)
                    {
                        local_1 = true;
                    }
                }
                if (GetCount() <= 0)
                {
                    GetModify_ResponseEventList().Reset(0);
                }
            }
            for (auto& local_60 : GetParentNodeList())
            {
                if (local_60.IsSet())
                {
                    local_1 = this.InternalConsumeRedDot(local_60, 0, InSource, local_8, InConsumeCount, VisitedNodes) || local_1;
                }
            }
        }
        return local_1;
    }
    TDataObjectPtr<FRedPointNodeConfig> FindSourceNodeConfig(const uint InSource, const FGameplayTag &inout InNodeTag)
    {
        TDataObjectPtr<FRedPointNodeConfig> local_24;
        GetDataObjectByGSDataId<FRedPointConfig> local_72;
        bool local_121 = !(local_72.opImplConv().IsSet()) || !(GetNodeConfig().IsSet());
        if (local_121)
        {
            return local_24;
        }
        TArray<TDataObjectPtr<FRedPointNodeConfig>> local_170;
        local_170.Add(GetNodeConfig());
        while (!(local_170.IsEmpty()))
        {
            TDataObjectPtr<FRedPointNodeConfig> local_196 = local_170.Last(0);
            local_170.RemoveAt((local_170.Num() - 1));
            if (!(local_196.IsSet()) || local_121)
            {
                continue;
            }
            FGameplayTag local_199;
            local_121 = (local_199 == InNodeTag);
            if (local_121)
            {
                return local_196;
            }
            local_170.Append(GetParentNodeList());
        }
        return local_24;
    }
    void ConsumeSourceNode(const uint InSource, const TDataObjectPtr<FRedPointNodeConfig> &inout InNodeCfg, const uint64 InExtraDataId)
    {
        FRedDotNodeData local_6;
        if (!(InNodeCfg.IsSet()))
        {
            return;
        }
        TEUIModelRef<FM_RedDotNode> local_8;
        if (!(this.GetRedDotNodeDataMap().Find(local_6, local_8)) || !(local_8.IsValid()))
        {
            return;
        }
        TSet<FRedDotNodeData> local_30;
        int local_32 = InSource.GetSourceCount();
        this.SetbRequestStoreDataDirty(this.InternalConsumeRedDot(InNodeCfg, InExtraDataId, InSource, TEUIModelRef<FM_RedDotNode>(nullptr), local_32, local_30) || this.GetbRequestStoreDataDirty());
        return;
    }
    void ConsumeRedDot(const FRedDotNodeData &inout InNodeData)
    {
        XLog(ELog(72), FString().Append("[M_RedDotSystem]ConsumeRedDot. InNodeTag=[").Append(InNodeData.NodeTag).Append("], InExtraDataId=[").Append(InNodeData.ExtraDataId).Append("]"));
        TEUIModelRef<FM_RedDotNode> local_8;
        if (!(this.GetRedDotNodeDataMap().Find(InNodeData, local_8)) || !(local_8.IsValid()))
        {
            return;
        }
        TArray<uint> local_14;
        local_14.GetSourceKeys();
        for (auto local_27 : local_14)
        {
            if (local_27 == 0)
            {
                int local_29 = 0.GetSourceCount();
                0.DecreaseSourceCount(local_29);
                continue;
            }
            TDataObjectPtr<FRedPointNodeConfig> local_78 = this.FindSourceNodeConfig(local_27, InNodeData.NodeTag);
            if (!(local_78.IsSet()))
            {
                continue;
            }
            TSet<FRedDotNodeData> local_98;
            int local_29_2 = local_27.GetSourceCount();
            this.SetbRequestStoreDataDirty(this.InternalConsumeRedDot(local_78, InNodeData.ExtraDataId, local_27, TEUIModelRef<FM_RedDotNode>(nullptr), local_29_2, local_98) || this.GetbRequestStoreDataDirty());
        }
        return;
    }
    void ConsumeRedDot(const FGameplayTag &inout InNodeTag, const uint64 InExtraDataId = 0)
    {
        this.ConsumeRedDot(FRedDotNodeData(InNodeTag, InExtraDataId));
        return;
    }
    TEUIModelWeakRef<FM_RedDotNode> TryFindOrAddRedDotNode(const FRedDotNodeData &inout InNodeData)
    {
        this.FindOrAddRedDotNode(InNodeData);
        return TEUIModelWeakRef<FM_RedDotNode>();
    }
    TEUIModelRef<FM_RedDotNode> FindOrAddRedDotNode(const FRedDotNodeData &inout InRedDotNodeData)
    {
        if (!(this.GetRedDotNodeDataMap().Contains(InRedDotNodeData)))
        {
            this.GetModify_RedDotNodeDataMap().Add(InRedDotNodeData, TEUIModelRef<FM_RedDotNode>(::FM_RedDotNode::Create(this.GetContext().Manager, InRedDotNodeData)));
        }
        return this.GetRedDotNodeDataMap()[InRedDotNodeData];
    }
    void InternalGenerateRedDot(const ERedPointEvent InEventType, const TArray<uint64> &inout InExtraParamList)
    {
        FRedDotEventConfigData local_24;
        bool local_141 = false;
        FRedDotNodeData local_164;
        FRedDotNodeData local_208;
        if (int(InEventType) == 0)
        {
            return;
        }
        if (!(this.GetRedPointEventConfigMap().Find(InEventType, local_24)))
        {
            return;
        }
        for (auto local_42 : local_24.EventDataIdSet)
        {
            int local_91 = int(local_42);
            GetDataObjectByGSDataId<FRedPointConfig> local_90;
            if (local_90.opImplConv().IsSet() && GetNodeConfig().IsSet())
            {
                const FRedPointNodeConfig& local_144;
                FRedDotNodeData local_148 = FRedDotNodeData(local_144.NodeTag, 0);
                this.FindOrAddRedDotNode(local_148);
                int local_155 = int(local_144.NodeDisplayType);
                local_155.SetDisplayType();
                GetModify_ResponseEventList().AddUnique(InEventType);
                int local_1 = InExtraParamList.Num();
                int local_156 = FMath::Max(local_1, 1);
                local_91 = int(local_42);
                local_91.IncreaseSourceCount(local_156);
                int local_158 = 0;
                for (; local_158 < local_1; )
                {
                    local_164 = FRedDotNodeData(local_144.NodeTag, InExtraParamList[local_158]);
                    this.FindOrAddRedDotNode(local_164);
                    local_155 = int(local_144.NodeDisplayType);
                    local_155.SetDisplayType();
                    GetModify_ResponseEventList().AddUnique(InEventType);
                    int(local_42).IncreaseSourceCount(1);
                    local_164.AddChildNodeData();
                    ++local_158;
                }
                TArray<TDataObjectPtr<FRedPointNodeConfig>> local_190;
                for (auto& local_204 : local_144.GetParentNodeList())
                {
                    if (local_204.IsSet())
                    {
                        this.FindOrAddRedDotNode(local_208);
                        local_155.SetDisplayType();
                        local_148.AddChildNodeData();
                    }
                }
                local_190.Append(local_144.GetParentNodeList());
                while (!(local_190.IsEmpty()))
                {
                    TDataObjectPtr<FRedPointNodeConfig> local_232 = local_190.Last(0);
                    local_190.RemoveAt((local_190.Num() - 1));
                    if (!(local_232.IsSet()) || local_141)
                    {
                        continue;
                    }
                    this.FindOrAddRedDotNode(local_164);
                    local_155.SetDisplayType();
                    int(local_42).IncreaseSourceCount(local_156);
                    for (auto& local_204 : GetParentNodeList())
                    {
                        if (local_204.IsSet())
                        {
                            this.FindOrAddRedDotNode(local_208);
                            local_155.SetDisplayType();
                            local_164.AddChildNodeData();
                        }
                    }
                    local_190.Append(GetParentNodeList());
                }
                FPbRedPointEventData& local_260 = this.GetModify_PbRedDotEventDataMap().FindOrAdd(local_42);
                local_260.SetEventId(int(local_42));
                for (auto local_160 : InExtraParamList)
                {
                    local_260.AddParams(local_160);
                }
                this.SetbRequestStoreDataDirty(true);
            }
        }
        return;
    }
    void GenerateRedDot(const ERedPointEvent InEventType, const TArray<uint64> &inout InExtraParamList = TArray<uint64>())
    {
        XLog(ELog(72), FString().Append("[M_RedDotSystem]GenerateRedDot. InEventType=[").Append(InEventType).Append("]"));
        if (int(InEventType) != 0)
        {
            this.InternalGenerateRedDot(ERedPointEvent(InEventType), InExtraParamList);
        }
        return;
    }
    void GenerateSpecificRedDot(const FRedDotNodeData &inout InNodeData, const int InNewIncreaseCount = 1, const bool InHasGhostChild = false)
    {
        XLog(ELog(72), FString().Append("[M_RedDotSystem]GenerateSpecificRedDot. InNodeTag=[").Append(InNodeData.NodeTag).Append("], InExtraDataId=[").Append(InNodeData.ExtraDataId).Append("], InNewIncreaseCount=[").Append(InNewIncreaseCount).Append("]"));
        FRedPointNodeConfig local_26;
        if (!(!(InNodeData.NodeTag.IsValid())) && this.GetRedPointNodeConfigMap().Find(InNodeData.NodeTag, local_26))
        {
            this.FindOrAddRedDotNode(InNodeData);
            int(local_26.NodeDisplayType).SetDisplayType();
            InNewIncreaseCount.IncreaseCount();
            InHasGhostChild.SetbHasGhostChild();
        }
        return;
    }
    void GenerateSpecificRedDot(const FGameplayTag &inout InNodeTag, const uint64 InExtraDataId = 0, const int InNewIncreaseCount = 1, const bool InHasGhostChild = false)
    {
        this.GenerateSpecificRedDot(FRedDotNodeData(InNodeTag, InExtraDataId), InNewIncreaseCount, InHasGhostChild);
        return;
    }
    void ConsumeRedDotByEvent(const ERedPointEvent InEventType, const uint64 InExtraDataId)
    {
        FRedDotEventConfigData local_24;
        if (int(InEventType) == 0)
        {
            return;
        }
        if (!(this.GetRedPointEventConfigMap().Find(InEventType, local_24)))
        {
            return;
        }
        for (auto local_42 : local_24.EventDataIdSet)
        {
            int local_91 = int(local_42);
            GetDataObjectByGSDataId<FRedPointConfig> local_90;
            if (local_90.opImplConv().IsSet() && GetNodeConfig().IsSet())
            {
                this.ConsumeSourceNode(int(local_42), GetNodeConfig(), InExtraDataId);
            }
        }
        return;
    }
    void ConsumeRedDotByEvent(const ERedPointEvent InEventType)
    {
        FRedDotEventConfigData local_28;
        XLog(ELog(72), FString().Append("[M_RedDotSystem]ConsumeRedDotByEvent. InEventType=[").Append(InEventType).Append("]"));
        if (int(InEventType) == 0)
        {
            return;
        }
        if (!(this.GetRedPointEventConfigMap().Find(InEventType, local_28)))
        {
            return;
        }
        for (auto local_46 : local_28.EventDataIdSet)
        {
            int local_95 = int(local_46);
            GetDataObjectByGSDataId<FRedPointConfig> local_94;
            if (!(local_94.opImplConv().IsSet()) || !(GetNodeConfig().IsSet()))
            {
                continue;
            }
            FPbRedPointEventData local_156;
            if (this.GetPbRedDotEventDataMap().Find(local_46, local_156))
            {
                TArray<uint64> local_160;
                local_156.GetParams(local_160);
                for (auto local_174 : local_160)
                {
                    this.ConsumeSourceNode(int(local_46), GetNodeConfig(), local_174);
                }
            }
            this.ConsumeSourceNode(int(local_46), GetNodeConfig(), 0);
            if (this.GetPbRedDotEventDataMap().Contains(local_46))
            {
                this.SetbRequestStoreDataDirty(true);
            }
        }
        return;
    }
    void GS_OnRedPointNotify(const FPbRedPointNotify &inout Notify)
    {
        XLog(ELog(72), FString().Append("[M_RedDotSystem]GS_OnRedPointNotify. module_type=[").Append(Notify.GetModuleType()).Append("]"));
        this.GS_RequestRedPoint();
        return;
    }
    void GS_RequestRedPoint() const
    {
        XLog(ELog(72), FString().Append("[M_RedDotSystem]GS_RequestRedPoint."));
        FPbRedPointReq local_10;
        this.SendProto(local_10.ToWrapper());
        return;
    }
    void GS_OnRedPointRsp(const FPbRedPointRsp &inout RedPointRsp)
    {
        int local_131 = 0;
        XLog(ELog(72), FString().Append("[M_RedDotSystem]GS_OnRedPointRsp. Retcode:[").Append(RedPointRsp.GetRetcode()).Append("]"));
        if (RedPointRsp.GetRetcode() == 0)
        {
            TArray<FPbRedPointEventData> local_12;
            RedPointRsp.GetDataList(local_12);
            XLog(ELog(72), FString().Append("[M_RedDotSystem]GS_OnRedPointRsp. EventDataList.Num:[").Append(local_12.Num()).Append("]"));
            for (auto& local_26 : local_12)
            {
                int local_51 = local_26.GetEventId();
                GetDataObjectByGSDataId<FRedPointConfig> local_76;
                if (local_76.opImplConv().IsSet() && GetNodeConfig().IsSet())
                {
                    TArray<uint64> local_130;
                    local_26.GetParams(local_130);
                    this.InternalGenerateRedDot(ERedPointEvent(local_131), local_130);
                }
            }
            XLog(ELog(72), FString().Append("[M_RedDotSystem]GS_OnRedPointRsp restore done, broadcast FMsg_RedPointDataRestored. EventDataList.Num:[").Append(local_12.Num()).Append("]"));
            FEUIModelRef local_138 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus).opCall(local_138);
        }
        return;
    }
    void GS_RequestStoreRedPoint() const
    {
        XLog(ELog(72), FString().Append("[M_RedDotSystem]GS_RequestStoreRedPoint."));
        FPbStoreRedPointReq local_10;
        auto local_18 = this.GetPbRedDotEventDataMap().Iterator();
        for (; local_18.CanProceed;)
        {
            FPbRedPointEventData local_50 = local_10.AddDataList();
            local_50.SetEventId(local_18.Proceed().GetKey());
            TArray<uint64> local_56;
            local_56.GetParams();
            for (auto local_70 : local_56)
            {
                local_50.AddParams(local_70);
            }
        }
        this.SendProto(local_10.ToWrapper());
        return;
    }
    void GS_OnStoreRedPointRsp(const FPbStoreRedPointRsp &inout StoreRedPointRsp)
    {
        XLog(ELog(72), FString().Append("[M_RedDotSystem]GS_OnStoreRedPointRsp. Retcode:[").Append(StoreRedPointRsp.GetRetcode()).Append("]"));
        if (StoreRedPointRsp.GetRetcode() == 0)
        {
        }
        return;
    }
    void GS_OnPlayerLoginRsp(const FPbPlayerLoginRsp &inout Rsp)
    {
        XLog(ELog(72), FString().Append("[M_RedDotSystem]GS_OnPlayerLoginRsp."));
        if (Rsp.GetRetcode() == 0)
        {
            this.GS_RequestRedPoint();
            this.SetbCanRequestStore(true);
            this.SetCurRequestStoreCountDown(FFPTime(5.0));
        }
        return;
    }
    const TMap<FGameplayTag, FRedPointNodeConfig> GetRedPointNodeConfigMap() const property
    {
        const TMap<FGameplayTag, FRedPointNodeConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<FGameplayTag, FRedPointNodeConfig> GetModify_RedPointNodeConfigMap() property
    {
        TMap<FGameplayTag, FRedPointNodeConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetRedPointNodeConfigMap(const TMap<FGameplayTag, FRedPointNodeConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_RedPointNodeConfigMap = __Value;
        return;
    }
    const TMap<ERedPointEvent, FRedDotEventConfigData> GetRedPointEventConfigMap() const property
    {
        const TMap<ERedPointEvent, FRedDotEventConfigData> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<ERedPointEvent, FRedDotEventConfigData> GetModify_RedPointEventConfigMap() property
    {
        TMap<ERedPointEvent, FRedDotEventConfigData> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetRedPointEventConfigMap(const TMap<ERedPointEvent, FRedDotEventConfigData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RedPointEventConfigMap = __Value;
        return;
    }
    const TMap<FRedDotNodeData, TEUIModelRef<FM_RedDotNode>> GetRedDotNodeDataMap() const property
    {
        const TMap<FRedDotNodeData, TEUIModelRef<FM_RedDotNode>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TMap<FRedDotNodeData, TEUIModelRef<FM_RedDotNode>> GetModify_RedDotNodeDataMap() property
    {
        TMap<FRedDotNodeData, TEUIModelRef<FM_RedDotNode>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetRedDotNodeDataMap(const TMap<FRedDotNodeData, TEUIModelRef<FM_RedDotNode>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RedDotNodeDataMap = __Value;
        return;
    }
    const TMap<uint, FPbRedPointEventData> GetPbRedDotEventDataMap() const property
    {
        const TMap<uint, FPbRedPointEventData> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<uint, FPbRedPointEventData> GetModify_PbRedDotEventDataMap() property
    {
        TMap<uint, FPbRedPointEventData> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetPbRedDotEventDataMap(const TMap<uint, FPbRedPointEventData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PbRedDotEventDataMap = __Value;
        return;
    }
    bool GetbCanRequestStore() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bCanRequestStore;
    }
    void SetbCanRequestStore(const bool __Value) property
    {
        if (!(this.m_bCanRequestStore) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bCanRequestStore = __Value;
        return;
    }
    bool GetbRequestStoreDataDirty() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bRequestStoreDataDirty;
    }
    void SetbRequestStoreDataDirty(const bool __Value) property
    {
        if (!(this.m_bRequestStoreDataDirty) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bRequestStoreDataDirty = __Value;
        return;
    }
    const FFPTime GetCurRequestStoreCountDown() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FFPTime GetModify_CurRequestStoreCountDown() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetCurRequestStoreCountDown(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_CurRequestStoreCountDown = __Value;
        return;
    }
}

namespace FM_RedDotNode
{
FM_RedDotNode& Create(const UObject ContextObject, const FRedDotNodeData &inout NodeData)
{
    return FM_RedDotNode::CreateByManager(EUIInternal::GetContextManager(ContextObject), NodeData);
}
FM_RedDotNode CreateByManager(const UEUIManagerSubsystem Manager, const FRedDotNodeData &inout NodeData)
{
    FM_RedDotNode __r;
    TEUIModelRef<FM_RedDotNode> local_6 = TEUIModelRef<FM_RedDotNode>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_RedDotNode::ModelId, 0, NodeData));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_RedDotNode;
}
int __IndexOf_NodeData()
{
    return 0;
}
int __IndexOf_DisplayType()
{
    return 1;
}
int __IndexOf_ResponseEventList()
{
    return 2;
}
int __IndexOf_SourceCounts()
{
    return 3;
}
int __IndexOf_ChildNodeDataSet()
{
    return 4;
}
int __IndexOf_ChildCount()
{
    return 5;
}
int __IndexOf_bHasGhostChild()
{
    return 6;
}
}
namespace FMS_RedDotSystem
{
FMS_RedDotSystem& Get(const UObject ContextObject)
{
    return FMS_RedDotSystem::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_RedDotSystem GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_RedDotSystem __r;
    TEUIModelRef<FMS_RedDotSystem> local_6 = TEUIModelRef<FMS_RedDotSystem>(EUIInternal::MakeModelWithManager(Manager, FMS_RedDotSystem::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnRedPointNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnRedPointRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnStoreRedPointRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnPlayerLoginRsp";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_RedDotSystem;
}
void __Tick(FMS_RedDotSystem &inout Model)
{
    Model.Tick();
    return;
}
void __GS_OnRedPointNotify(FMS_RedDotSystem &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnRedPointNotify(FPbRedPointNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnRedPointRsp(FMS_RedDotSystem &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnRedPointRsp(FPbRedPointRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnStoreRedPointRsp(FMS_RedDotSystem &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnStoreRedPointRsp(FPbStoreRedPointRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnPlayerLoginRsp(FMS_RedDotSystem &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnPlayerLoginRsp(FPbPlayerLoginRsp::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_RedPointNodeConfigMap()
{
    return 0;
}
int __IndexOf_RedPointEventConfigMap()
{
    return 1;
}
int __IndexOf_RedDotNodeDataMap()
{
    return 2;
}
int __IndexOf_PbRedDotEventDataMap()
{
    return 3;
}
int __IndexOf_bCanRequestStore()
{
    return 4;
}
int __IndexOf_bRequestStoreDataDirty()
{
    return 5;
}
int __IndexOf_CurRequestStoreCountDown()
{
    return 6;
}
}

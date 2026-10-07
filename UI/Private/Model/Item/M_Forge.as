
enum EForgeNodeStateType
{
    Normal,
    Unlock,
    Lock,
    Hide,
}

enum EForgeTreeBranchType
{
    Main = 1,
    Right,
    Left,
}

namespace FM_ForgeNode
{
    const int ModelId = 0;
}
namespace FM_ForgeTree
{
    const int ModelId = 0;
}
namespace FMS_Forge
{
    const int ModelId = 0;

}
struct FM_ForgeNode : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    uint m_DataId;
    UPROPERTY()
    uint m_TreeId;
    UPROPERTY()
    uint m_ParentDataId;
    UPROPERTY()
    FForgeNodeConfig m_Config;
    UPROPERTY()
    EForgeTreeBranchType m_BranchType;
    UPROPERTY()
    EForgeNodeStateType m_StateType;
    UPROPERTY()
    bool m_bValid;
    UPROPERTY()
    bool m_bHasMainChild;
    UPROPERTY()
    TEUIModelRef<FVM_EquipmentInfo> m_CurEquipmentInfo;

    FM_ForgeNode()
    {
        this.m_DataId = 0;
        this.m_TreeId = 0;
        this.m_ParentDataId = 0;
        this.m_BranchType = EForgeTreeBranchType(1);
        this.m_StateType = EForgeNodeStateType(3);
        this.m_bValid = false;
        this.m_bHasMainChild = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_ForgeNode' by default constructor.");
        return;
    }
    FM_ForgeNode(const FM_ForgeNode &inout Other)
    {
        this.m_DataId = 0;
        this.m_TreeId = 0;
        this.m_ParentDataId = 0;
        this.m_BranchType = EForgeTreeBranchType(1);
        this.m_StateType = EForgeNodeStateType(3);
        this.m_bValid = false;
        this.m_bHasMainChild = false;
        this.m_DataId = int(Other.m_DataId);
        this.m_TreeId = int(Other.m_TreeId);
        this.m_ParentDataId = int(Other.m_ParentDataId);
        this.m_BranchType = Other.m_BranchType;
        this.m_StateType = Other.m_StateType;
        this.m_bValid = Other.m_bValid;
        this.m_bHasMainChild = Other.m_bHasMainChild;
        this.m_CurEquipmentInfo = Other.m_CurEquipmentInfo;
        return;
    }
    FM_ForgeNode(const uint InTreeId, const uint InParentDataId, const FForgeNodeConfig &inout InConfig, const EForgeTreeBranchType InBranchType, const EForgeNodeStateType InStateType)
    {
        this.m_DataId = 0;
        this.m_TreeId = 0;
        this.m_ParentDataId = 0;
        this.m_BranchType = EForgeTreeBranchType(1);
        this.m_StateType = EForgeNodeStateType(3);
        this.m_bValid = false;
        this.m_bHasMainChild = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTreeId(InTreeId);
        this.SetParentDataId(InParentDataId);
        this.SetConfig(InConfig);
        this.SetBranchType(EForgeTreeBranchType(InBranchType));
        this.SetStateType(EForgeNodeStateType(InStateType));
        return;
    }
    FM_ForgeNode& opAssign(const FM_ForgeNode &inout Other)
    {
        this.m_DataId = int(Other.m_DataId);
        this.m_TreeId = int(Other.m_TreeId);
        this.m_ParentDataId = int(Other.m_ParentDataId);
        this.m_BranchType = Other.m_BranchType;
        this.m_StateType = Other.m_StateType;
        this.m_bValid = Other.m_bValid;
        this.m_bHasMainChild = Other.m_bHasMainChild;
        return Other.m_CurEquipmentInfo;
    }
    void PostConstruct()
    {
        this.SetDataId(this.GetConfig().DataId);
        this.UpdateValid(::FMS_Forge::Get(this.GetContext().Manager).GetGlobalShowLevel());
        return;
    }
    bool CheckValid() const
    {
        return this.GetbValid();
    }
    void UpdateValid(const int ShowLevel)
    {
        this.SetbValid((this.GetConfig().ForgeLv <= ShowLevel));
        if ((this.GetParentDataId()) != 0)
        {
            if (::FMS_Forge::Get(this.GetContext().Manager).GetNode(this.GetParentDataId()).IsValid() && (GetConfig().ForgeLv <= ShowLevel) && (int(this.GetBranchType()) == int(GetBranchType())))
            {
                bool local_9 = this.GetbValid();
                local_9.SetbHasMainChild();
            }
        }
        return;
    }
    TEUIModelRef<FVM_EquipmentInfo> GetEquipmentInfo()
    {
        int local_60 = 0;
        if (!(this.GetCurEquipmentInfo().IsValid()) && this.GetConfig().GetCraft().IsSet())
        {
            CastTo local_32;
            TDataObjectPtr<FEquipmentConfig> local_56 = local_32.opCall();
            if (local_56)
            {
                ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).CreateFromConfig(local_56);
                local_60.SetPreviewMaxRandomTraitNum(local_56.opArrow().GetMaxRandomTrait());
                this.SetCurEquipmentInfo(TEUIModelRef<FVM_EquipmentInfo>(local_60));
            }
        }
        return this.GetCurEquipmentInfo();
    }
    uint GetDataId() const property
    {
        this.TrackPropertyRead(0);
        return this.m_DataId;
    }
    void SetDataId(const uint __Value) property
    {
        if (this.m_DataId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DataId = __Value;
        return;
    }
    uint GetTreeId() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TreeId;
    }
    void SetTreeId(const uint __Value) property
    {
        if (this.m_TreeId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TreeId = __Value;
        return;
    }
    uint GetParentDataId() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ParentDataId;
    }
    void SetParentDataId(const uint __Value) property
    {
        if (this.m_ParentDataId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ParentDataId = __Value;
        return;
    }
    FForgeNodeConfig GetConfig() const property
    {
        FForgeNodeConfig __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FForgeNodeConfig GetModify_Config() property
    {
        FForgeNodeConfig __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetConfig(const FForgeNodeConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        return;
    }
    EForgeTreeBranchType GetBranchType() const property
    {
        this.TrackPropertyRead(4);
        return this.m_BranchType;
    }
    void SetBranchType(const EForgeTreeBranchType __Value) property
    {
        if (int(this.m_BranchType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_BranchType = __Value;
        return;
    }
    EForgeNodeStateType GetStateType() const property
    {
        this.TrackPropertyRead(5);
        return this.m_StateType;
    }
    void SetStateType(const EForgeNodeStateType __Value) property
    {
        if (int(this.m_StateType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_StateType = __Value;
        return;
    }
    bool GetbValid() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bValid;
    }
    void SetbValid(const bool __Value) property
    {
        if (!(this.m_bValid) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bValid = __Value;
        return;
    }
    bool GetbHasMainChild() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bHasMainChild;
    }
    void SetbHasMainChild(const bool __Value) property
    {
        if (!(this.m_bHasMainChild) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bHasMainChild = __Value;
        return;
    }
    TEUIModelRef<FVM_EquipmentInfo> GetCurEquipmentInfo() const property
    {
        this.TrackPropertyRead(8);
        return this.m_CurEquipmentInfo;
    }
    void SetCurEquipmentInfo(const TEUIModelRef<FVM_EquipmentInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipmentInfo> local_2;
        local_2 = this.m_CurEquipmentInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CurEquipmentInfo = __Value;
        return;
    }
}

struct FM_ForgeTree : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    uint m_TreeId;
    UPROPERTY()
    bool m_bValid;
    UPROPERTY()
    FForgeTreeConfig m_Config;
    UPROPERTY()
    TArray<TEUIModelWeakRef<FM_ForgeNode>> m_NodeList;
    UPROPERTY()
    EForgeTreeBranchType m_BranchType;

    FM_ForgeTree()
    {
        this.m_TreeId = 0;
        this.m_BranchType = EForgeTreeBranchType(0);
        this.m_bValid = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_ForgeTree' by default constructor.");
        return;
    }
    FM_ForgeTree(const FM_ForgeTree &inout Other)
    {
        this.m_TreeId = 0;
        this.m_BranchType = EForgeTreeBranchType(0);
        this.m_bValid = false;
        this.m_TreeId = int(Other.m_TreeId);
        this.m_bValid = Other.m_bValid;
        this.m_NodeList = Other.m_NodeList;
        this.m_BranchType = Other.m_BranchType;
        return;
    }
    FM_ForgeTree(const uint InTreeId)
    {
        this.m_TreeId = 0;
        this.m_BranchType = EForgeTreeBranchType(0);
        this.m_bValid = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTreeId(InTreeId);
        return;
    }
    FM_ForgeTree opAssign(const FM_ForgeTree &inout Other)
    {
        FM_ForgeTree __r;
        this.m_TreeId = int(Other.m_TreeId);
        this.m_bValid = Other.m_bValid;
        this.m_NodeList = Other.m_NodeList;
        this.m_BranchType = Other.m_BranchType;
        return __r;
    }
    void PostConstruct()
    {
        return;
    }
    bool CheckValid() const
    {
        return this.GetbValid();
    }
    void UpdateValid(const bool bTreeUnlock)
    {
        this.SetbValid(bTreeUnlock);
        return;
    }
    uint GetTreeId() const property
    {
        this.TrackPropertyRead(0);
        return this.m_TreeId;
    }
    void SetTreeId(const uint __Value) property
    {
        if (this.m_TreeId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TreeId = __Value;
        return;
    }
    bool GetbValid() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bValid;
    }
    void SetbValid(const bool __Value) property
    {
        if (!(this.m_bValid) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bValid = __Value;
        return;
    }
    FForgeTreeConfig GetConfig() const property
    {
        FForgeTreeConfig __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FForgeTreeConfig GetModify_Config() property
    {
        FForgeTreeConfig __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetConfig(const FForgeTreeConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
    const TArray<TEUIModelWeakRef<FM_ForgeNode>> GetNodeList() const property
    {
        const TArray<TEUIModelWeakRef<FM_ForgeNode>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelWeakRef<FM_ForgeNode>> GetModify_NodeList() property
    {
        TArray<TEUIModelWeakRef<FM_ForgeNode>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetNodeList(const TArray<TEUIModelWeakRef<FM_ForgeNode>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_NodeList = __Value;
        return;
    }
    EForgeTreeBranchType GetBranchType() const property
    {
        this.TrackPropertyRead(4);
        return this.m_BranchType;
    }
    void SetBranchType(const EForgeTreeBranchType __Value) property
    {
        if (int(this.m_BranchType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_BranchType = __Value;
        return;
    }
}

struct FMS_Forge : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    int m_GlobalShowLevel;
    UPROPERTY()
    int m_LastSelectedCategoryIndex;
    UPROPERTY()
    TMap<uint, TEUIModelRef<FM_ForgeNode>> m_ForgeNodeMap;
    UPROPERTY()
    TMap<uint, TEUIModelRef<FM_ForgeTree>> m_ForgeTreeMap;

    FMS_Forge()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FMS_Forge(const FMS_Forge &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FMS_Forge& opAssign(const FMS_Forge &inout Other)
    {
        this.m_GlobalShowLevel = int(Other.m_GlobalShowLevel);
        this.m_LastSelectedCategoryIndex = int(Other.m_LastSelectedCategoryIndex);
        this.m_ForgeNodeMap = Other.m_ForgeNodeMap;
        return Other.m_ForgeTreeMap;
    }
    void PostConstruct()
    {
        return;
    }
    void CreateAndAddNode(FM_ForgeTree &inout TreeM, const TArray<FForgeTreeData> &inout BranchArray, const EForgeTreeBranchType BranchType, const EForgeNodeStateType StateType)
    {
        int local_4 = 0;
        int local_1 = 0;
        int local_3 = 0;
        if (int(BranchType) == 1)
        {
            local_1 = 0;
            local_3 = 0;
        }
        else
        {
            local_1 = 1;
            if (!(!(BranchArray.IsValidIndex(0))) && BranchArray[0].NodeConfig)
            {
                local_3 = local_4;
            }
        }
        for (; local_1 < BranchArray.Num(); ++local_1)
        {
            TDataObjectPtr<FForgeNodeConfig> local_32 = BranchArray[local_1].NodeConfig;
            if (local_32)
            {
                local_4 = TreeM.GetTreeId();
                FM_ForgeNode& local_58 = ::FM_ForgeNode::Create(this.GetContext().Manager, local_4, local_3);
                TEUIModelRef<FM_ForgeNode> local_60 = TEUIModelRef<FM_ForgeNode>(local_58);
                TreeM.GetModify_NodeList().Add(TEUIModelWeakRef<FM_ForgeNode>(local_58));
                local_3 = local_4;
                if (local_58.CheckValid() && (int(BranchType) > int(TreeM.GetBranchType())))
                {
                    TreeM.SetBranchType(EForgeTreeBranchType(BranchType));
                }
            }
        }
        return;
    }
    void RefreshNode(const uint NodeId, const EForgeNodeStateType StateType)
    {
        if (this.GetForgeNodeMap().Contains(NodeId))
        {
            SetStateType();
        }
        return;
    }
    TArray<TEUIModelWeakRef<FM_ForgeTree>> GetForgeTreeListByWeaponType(const EWeaponType Type)
    {
        FM_ForgeTree& local_26;
        TArray<TEUIModelWeakRef<FM_ForgeTree>> local_4;
        for (auto& local_24 : this.GetForgeTreeMap())
        {
            local_24;
            if (local_26)
            {
                if (int(local_26.GetConfig().WeaponType) == int(Type))
                {
                    local_4.Add(TEUIModelWeakRef<FM_ForgeTree>(local_26));
                }
            }
        }
        return local_4;
    }
    TEUIModelWeakRef<FM_ForgeTree> GetTree(const uint TreeId)
    {
        if (this.GetForgeTreeMap().Contains(TreeId))
        {
            return TEUIModelWeakRef<FM_ForgeTree>();
        }
        return TEUIModelWeakRef<FM_ForgeTree>();
    }
    TEUIModelWeakRef<FM_ForgeNode> GetNode(const uint NodeId)
    {
        if (this.GetForgeNodeMap().Contains(NodeId))
        {
            return TEUIModelWeakRef<FM_ForgeNode>();
        }
        return TEUIModelWeakRef<FM_ForgeNode>();
    }
    void GS_OnPlayerForgeDataNotify(const FPbPlayerForgeDataNotify &inout Notify)
    {
        this.GetModify_ForgeNodeMap().Reset();
        this.GetModify_ForgeTreeMap().Reset();
        this.SetLastSelectedCategoryIndex(INDEX_NONE);
        this.SetGlobalShowLevel(Notify.GetForgeShowLv());
        XLog(ELog(67), FString().Append("[M_Forge]GS_OnPlayerForgeDataNotify: GlobalShowLevel:[").Append(this.GetGlobalShowLevel()).Append("]"));
        int local_8 = 0;
        for (; local_8 < Notify.GetForgeList_Num(); ++local_8)
        {
            FPbForgeNodeDatas local_30 = Notify.GetForgeList_Index(local_8);
            bool local_10 = local_30.GetTreeUnlock();
            FM_ForgeTree& local_34 = ::FM_ForgeTree::Create(this.GetContext().Manager, local_30.GetTreeId());
            local_34.UpdateValid(local_10);
            int local_9 = local_30.GetTreeId();
            GetDataObjectByGSDataId<FForgeTreeConfig> local_82;
            TDataObjectPtr<FForgeTreeConfig> local_58 = local_82.opImplConv();
            if (local_58)
            {
                local_34.SetConfig();
                if (local_10)
                {
                }
                else
                {
                }
                this.GetModify_ForgeTreeMap().Add(local_30.GetTreeId(), TEUIModelRef<FM_ForgeTree>(local_34));
            }
            if (local_10)
            {
                if (local_30.GetUnlockAll())
                {
                    for (auto& local_152 : local_34.GetNodeList())
                    {
                        if (local_152.IsValid())
                        {
                            this.RefreshNode(GetDataId(), EForgeNodeStateType(1));
                        }
                    }
                }
                else
                {
                    int local_153 = 0;
                    for (; local_153 < local_30.GetUnlockIndexList_Num(); )
                    {
                        this.RefreshNode(local_30.GetUnlockIndexList_Index(local_153), EForgeNodeStateType(1));
                        ++local_153;
                    }
                }
                if (local_30.GetForgeAll())
                {
                    for (auto& local_152 : local_34.GetNodeList())
                    {
                        if (local_152.IsValid())
                        {
                            this.RefreshNode(GetDataId(), EForgeNodeStateType(0));
                        }
                    }
                    continue;
                }
                int local_153_2 = 0;
                for (; local_153_2 < local_30.GetCurrForgeNodeIndexList_Num(); )
                {
                    this.RefreshNode(local_30.GetCurrForgeNodeIndexList_Index(local_153_2), EForgeNodeStateType(0));
                    ++local_153_2;
                }
            }
        }
        FEUIModelRef local_160 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_160);
        return;
    }
    void GS_OnForgeUnlockNotify(const FPbForgeUnlockNotify &inout Notify)
    {
        int local_1;
        bool local_4;
        int local_82 = 0;
        local_1 = Notify.GetForgeShowLv();
        if (this.GetGlobalShowLevel() != local_1)
        {
            for (auto& local_22 : this.GetForgeTreeMap())
            {
                local_22;
                if (IsValid())
                {
                    EForgeTreeBranchType(1).SetBranchType();
                }
            }
            for (auto& local_42 : this.GetForgeNodeMap())
            {
                local_42;
                if (IsValid())
                {
                    local_1.UpdateValid();
                    if (CheckValid())
                    {
                        if (this.GetTree(GetTreeId()).IsValid() && (int(GetBranchType()) > int(GetBranchType())))
                        {
                            EForgeTreeBranchType local_23_2 = GetBranchType();
                            int local_2 = GetTreeId();
                            SetBranchType();
                        }
                    }
                }
            }
            this.SetGlobalShowLevel(local_1);
        }
        XLog(ELog(67), FString().Append("[M_Forge]GS_OnForgeUnlockNotify: GlobalShowLevel:[").Append(this.GetGlobalShowLevel()).Append("]"));
        int local_56 = 0;
        for (; local_56 < Notify.GetUnlockInfoList_Num(); ++local_56)
        {
            FPbForgeUnlockInfo local_78 = Notify.GetUnlockInfoList_Index(local_56);
            local_4 = local_78.GetTreeUnlock();
            if (local_4)
            {
                local_82 = 2;
            }
            else
            {
                local_82 = 3;
            }
            if (this.GetForgeTreeMap().Contains(local_78.GetTreeId()))
            {
                int local_57 = local_78.GetTreeId();
                if (!(CheckValid()) != (!(local_4)))
                {
                    local_57 = local_78.GetTreeId();
                    local_4.UpdateValid();
                    local_57 = local_78.GetTreeId();
                    for (auto& local_96 : GetNodeList())
                    {
                        if (local_96.IsValid())
                        {
                            this.RefreshNode(GetDataId());
                        }
                    }
                }
            }
            else
            {
                FM_ForgeTree& local_100 = ::FM_ForgeTree::Create(this.GetContext().Manager, local_78.GetTreeId());
                local_100.UpdateValid(local_4);
                int local_57_2 = local_78.GetTreeId();
                GetDataObjectByGSDataId<FForgeTreeConfig> local_148;
                TDataObjectPtr<FForgeTreeConfig> local_124 = local_148.opImplConv();
                if (local_124)
                {
                    local_100.SetConfig();
                    EForgeTreeBranchType local_47 = EForgeTreeBranchType(1);
                    EForgeTreeBranchType local_23_3 = EForgeTreeBranchType(2);
                    EForgeTreeBranchType local_47_2 = EForgeTreeBranchType(3);
                    this.GetModify_ForgeTreeMap().Add(local_78.GetTreeId(), TEUIModelRef<FM_ForgeTree>(local_100));
                }
            }
            if (local_4)
            {
                int local_199 = 0;
                for (; local_199 < local_78.GetUnlockIndexList_Num(); )
                {
                    this.RefreshNode(local_78.GetUnlockIndexList_Index(local_199), EForgeNodeStateType(1));
                    ++local_199;
                }
                int local_57_3 = 0;
                for (; local_57_3 < local_78.GetNoneCostNodeIndexList_Num(); )
                {
                    this.RefreshNode(local_78.GetNoneCostNodeIndexList_Index(local_57_3), EForgeNodeStateType(0));
                    ++local_57_3;
                }
            }
        }
        FEUIModelRef local_206 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus).opCall(local_206);
        return;
    }
    void GS_RequestForge(const uint TreeId, const uint NodeIndex) const
    {
        XLog(ELog(67), FString().Append("[M_Forge]GS_RequestForge: TreeId:[").Append(TreeId).Append("], NodeIndex:[").Append(NodeIndex).Append("]"));
        if ((TreeId > 0 && (NodeIndex > 0)))
        {
            FPbDoForgeReq local_12;
            local_12.SetForgeTreeId(TreeId);
            local_12.SetForgeNodeIndex(NodeIndex);
            this.SendProto(local_12.ToWrapper());
        }
        return;
    }
    void GS_OnDoForgeRsp(const FPbDoForgeRsp &inout ForgeRsp)
    {
        int local_16 = 0;
        int local_1 = ForgeRsp.GetForgeNodeIndex();
        XLog(ELog(67), FString().Append("[M_Forge]GS_OnDoForgeRsp: Retcode:[").Append(ForgeRsp.GetRetcode()).Append("], TreeId:[").Append(ForgeRsp.GetForgeTreeId()).Append("], NodeId:[").Append(local_1).Append("]"));
        if (ForgeRsp.GetRetcode() == 0)
        {
            this.RefreshNode(local_1, EForgeNodeStateType(0));
            FEUIModelRef local_22 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_16.NodeM = this.GetNode(local_1);
        }
        return;
    }
    int GetGlobalShowLevel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_GlobalShowLevel;
    }
    void SetGlobalShowLevel(const int __Value) property
    {
        if (this.m_GlobalShowLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_GlobalShowLevel = __Value;
        return;
    }
    int GetLastSelectedCategoryIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_LastSelectedCategoryIndex;
    }
    void SetLastSelectedCategoryIndex(const int __Value) property
    {
        if (this.m_LastSelectedCategoryIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_LastSelectedCategoryIndex = __Value;
        return;
    }
    const TMap<uint, TEUIModelRef<FM_ForgeNode>> GetForgeNodeMap() const property
    {
        const TMap<uint, TEUIModelRef<FM_ForgeNode>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TMap<uint, TEUIModelRef<FM_ForgeNode>> GetModify_ForgeNodeMap() property
    {
        TMap<uint, TEUIModelRef<FM_ForgeNode>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetForgeNodeMap(const TMap<uint, TEUIModelRef<FM_ForgeNode>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ForgeNodeMap = __Value;
        return;
    }
    const TMap<uint, TEUIModelRef<FM_ForgeTree>> GetForgeTreeMap() const property
    {
        const TMap<uint, TEUIModelRef<FM_ForgeTree>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<uint, TEUIModelRef<FM_ForgeTree>> GetModify_ForgeTreeMap() property
    {
        TMap<uint, TEUIModelRef<FM_ForgeTree>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetForgeTreeMap(const TMap<uint, TEUIModelRef<FM_ForgeTree>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ForgeTreeMap = __Value;
        return;
    }
}

struct FMsg_ForgeNodeItemClick : FEUIMessage
{
    UPROPERTY()
    TEUIModelWeakRef<FM_ForgeNode> ItemNodeM;

    FMsg_ForgeNodeItemClick()
    {
        return;
    }
}

struct FMsg_ForgeTreeUpdateFinish : FEUIMessage
{
    UPROPERTY()
    int TreeIndex;
    UPROPERTY()
    TEUIModelWeakRef<FM_ForgeNode> FirstItemNodeM;
    UPROPERTY()
    TEUIModelWeakRef<FVM_ForgeWeaponFormulaTree> FormulaTreeVM;


}

struct FMsg_ForgeNodeDataUpdate : FEUIMessage
{
    UPROPERTY()
    TEUIModelWeakRef<FM_ForgeNode> NodeM;

    FMsg_ForgeNodeDataUpdate()
    {
        return;
    }
}

struct FMsg_ForgeTreeDataUpdate : FEUIMessage
{
    FMsg_ForgeTreeDataUpdate()
    {
        return;
    }
}

namespace ForgeCommonUtil
{
TArray<EWeaponType> GetWeaponTypeForgePriorityList()
{
    TArray<EWeaponType> local_4;
    local_4.AddUnique(EWeaponType(1));
    local_4.AddUnique(EWeaponType(2));
    local_4.AddUnique(EWeaponType(3));
    local_4.AddUnique(EWeaponType(4));
    return local_4;
}
int ConvertForgeNodeLevel2Row(const int NodeLevel)
{
    return NodeLevel - 1;
}
int ConvertForgeTreeBranchType2Column(const EForgeTreeBranchType TreeBranchType, const EForgeTreeBranchType NodeBranchType)
{
    int local_1 = 0;
    if (int(TreeBranchType) == 1)
    {
        if (int(NodeBranchType) == 1)
        {
            local_1 = 0;
        }
    }
    else
    {
        if (int(TreeBranchType) == 2)
        {
            if (int(NodeBranchType) == 1)
            {
                local_1 = 0;
            }
            else
            {
                if (int(NodeBranchType) == 2)
                {
                    local_1 = 1;
                }
            }
        }
        else
        {
            if (int(TreeBranchType) == 3)
            {
                if (int(NodeBranchType) == 1)
                {
                    local_1 = 1;
                }
                else
                {
                    if (int(NodeBranchType) == 2)
                    {
                        local_1 = 2;
                    }
                    else
                    {
                        if (int(NodeBranchType) == 3)
                        {
                            local_1 = 0;
                        }
                    }
                }
            }
        }
    }
    return local_1;
}
float32 GetForgeTreeBranchWidth(const EForgeTreeBranchType BranchType)
{
    if (int(BranchType) == 1)
    {
        return 224.0f;
    }
    if (int(BranchType) == 2)
    {
        return 348.0f;
    }
    if (int(BranchType) == 3)
    {
        return 480.0f;
    }
    return 0.0f;
}
}
namespace FM_ForgeNode
{
FM_ForgeNode& Create(const UObject ContextObject, const uint TreeId, const uint ParentDataId, const FForgeNodeConfig &inout Config, const EForgeTreeBranchType BranchType, const EForgeNodeStateType StateType)
{
    return FM_ForgeNode::CreateByManager(EUIInternal::GetContextManager(ContextObject), TreeId, ParentDataId, Config);
}
FM_ForgeNode CreateByManager(const UEUIManagerSubsystem Manager, const uint TreeId, const uint ParentDataId, const FForgeNodeConfig &inout Config, const EForgeTreeBranchType BranchType, const EForgeNodeStateType StateType)
{
    FM_ForgeNode __r;
    TEUIModelRef<FM_ForgeNode> local_6 = TEUIModelRef<FM_ForgeNode>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_ForgeNode::ModelId, 0, TreeId, ParentDataId, Config, BranchType, StateType));
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
    return FM_ForgeNode;
}
int __IndexOf_DataId()
{
    return 0;
}
int __IndexOf_TreeId()
{
    return 1;
}
int __IndexOf_ParentDataId()
{
    return 2;
}
int __IndexOf_Config()
{
    return 3;
}
int __IndexOf_BranchType()
{
    return 4;
}
int __IndexOf_StateType()
{
    return 5;
}
int __IndexOf_bValid()
{
    return 6;
}
int __IndexOf_bHasMainChild()
{
    return 7;
}
int __IndexOf_CurEquipmentInfo()
{
    return 8;
}
}
namespace FM_ForgeTree
{
FM_ForgeTree& Create(const UObject ContextObject, const uint TreeId)
{
    return FM_ForgeTree::CreateByManager(EUIInternal::GetContextManager(ContextObject), TreeId);
}
FM_ForgeTree CreateByManager(const UEUIManagerSubsystem Manager, const uint TreeId)
{
    FM_ForgeTree __r;
    TEUIModelRef<FM_ForgeTree> local_6 = TEUIModelRef<FM_ForgeTree>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_ForgeTree::ModelId, 0, TreeId));
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
    return FM_ForgeTree;
}
int __IndexOf_TreeId()
{
    return 0;
}
int __IndexOf_bValid()
{
    return 1;
}
int __IndexOf_Config()
{
    return 2;
}
int __IndexOf_NodeList()
{
    return 3;
}
int __IndexOf_BranchType()
{
    return 4;
}
}
namespace FMS_Forge
{
FMS_Forge& Get(const UObject ContextObject)
{
    return FMS_Forge::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_Forge GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_Forge __r;
    TEUIModelRef<FMS_Forge> local_6 = TEUIModelRef<FMS_Forge>(EUIInternal::MakeModelWithManager(Manager, FMS_Forge::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnPlayerForgeDataNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnForgeUnlockNotify";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__GS_OnDoForgeRsp";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_Forge;
}
void __GS_OnPlayerForgeDataNotify(FMS_Forge &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnPlayerForgeDataNotify(FPbPlayerForgeDataNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnForgeUnlockNotify(FMS_Forge &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnForgeUnlockNotify(FPbForgeUnlockNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnDoForgeRsp(FMS_Forge &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnDoForgeRsp(FPbDoForgeRsp::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_GlobalShowLevel()
{
    return 0;
}
int __IndexOf_LastSelectedCategoryIndex()
{
    return 1;
}
int __IndexOf_ForgeNodeMap()
{
    return 2;
}
int __IndexOf_ForgeTreeMap()
{
    return 3;
}
}

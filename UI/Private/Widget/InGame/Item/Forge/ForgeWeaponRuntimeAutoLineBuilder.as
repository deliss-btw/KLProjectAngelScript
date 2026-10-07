
namespace ForgeWeaponRuntimeAutoLineBuilder
{
bool IsNodeNormal(const FM_ForgeNode &inout Node)
{
    return (int(Node.GetStateType()) == 0);
}
FName ResolveNodeStyleState(const FM_ForgeNode &inout Node)
{
    FName __r;
    if (ForgeWeaponRuntimeAutoLineBuilder::IsNodeNormal(Node))
    {
    }
    else
    {
    }
    return __r;
}
bool ShouldDrawNodeLine(const FM_ForgeNode &inout Node)
{
    return (int(Node.GetStateType()) != 3);
}
FName MakeNodeId(const FM_ForgeNode &inout Node)
{
    return ForgeWeaponAutoLineAdapter::MakeNodeId(Node);
}
FName MakeLineId(const FM_ForgeNode &inout ParentNode, const FM_ForgeNode &inout ChildNode)
{
    return ForgeWeaponAutoLineAdapter::MakeNodeId(ChildNode);
}
EEUIAutoLinePort GetParentOutPort(const FM_ForgeNode &inout ParentNode, const FM_ForgeNode &inout ChildNode)
{
    return ForgeWeaponAutoLineAdapter::GetParentOutPort(ParentNode, ChildNode);
}
EEUIAutoLinePort GetChildInPort(const FM_ForgeNode &inout ParentNode, const FM_ForgeNode &inout ChildNode)
{
    return EEUIAutoLinePort(0);
}
EEUIAutoLinePort GetSameBranchFromPort(const FM_ForgeNode &inout ParentNode, const FM_ForgeNode &inout ChildNode)
{
    int local_4;
    if (ParentNode.GetConfig().ForgeLv <= ChildNode.GetConfig().ForgeLv)
    {
        local_4 = 1;
    }
    else
    {
        local_4 = 0;
    }
    return EEUIAutoLinePort(local_4);
}
EEUIAutoLinePort GetSameBranchToPort(const FM_ForgeNode &inout ParentNode, const FM_ForgeNode &inout ChildNode)
{
    int local_4;
    if (ParentNode.GetConfig().ForgeLv <= ChildNode.GetConfig().ForgeLv)
    {
        local_4 = 0;
    }
    else
    {
        local_4 = 1;
    }
    return EEUIAutoLinePort(local_4);
}
bool FindVisibleNodeByDataId(const TArray<TEUIModelWeakRef<FM_ForgeNode>> &inout NodeList, const uint DataId, TEUIModelWeakRef<FM_ForgeNode> &inout OutNode)
{
    for (auto& local_16 : NodeList)
    {
        if (local_16.IsValid() && ForgeWeaponRuntimeAutoLineBuilder::ShouldDrawNodeLine() && (GetDataId() == DataId))
        {
            OutNode = local_16;
            return true;
        }
    }
    return false;
}
bool FindVisibleLineParent(const UObject ContextObject, const TArray<TEUIModelWeakRef<FM_ForgeNode>> &inout NodeList, const FM_ForgeNode &inout ChildNode, TEUIModelWeakRef<FM_ForgeNode> &inout OutParentNode)
{
    int local_1 = ChildNode.GetParentDataId();
    int local_3 = 0;
    while ((uint(local_1) != uint(0)) && (int(local_3) < 32))
    {
        TEUIModelWeakRef<FM_ForgeNode> local_8;
        if (ForgeWeaponRuntimeAutoLineBuilder::FindVisibleNodeByDataId(NodeList, local_1, local_8))
        {
            OutParentNode = local_8;
            return true;
        }
        TEUIModelWeakRef<FM_ForgeNode> local_10 = FMS_Forge::Get(ContextObject).GetNode(local_1);
        if (!(local_10.IsValid()))
        {
            return false;
        }
        local_1 = GetParentDataId();
        ++local_3;
        continue;
    }
    return false;
}
bool IsOverrideDataIdMatch(const int OverrideDataId, const uint NodeDataId)
{
    int local_3;
    bool local_4;
    if (OverrideDataId == 0)
    {
        local_4 = true;
    }
    else
    {
        if (OverrideDataId <= 0)
        {
            local_3 = 0;
        }
        else
        {
            local_4 = (OverrideDataId == NodeDataId);
            local_3 = local_4;
        }
        local_4 = (local_3 != 0);
    }
    return local_4;
}
bool ApplyRouteOverride(const FM_ForgeNode &inout ParentNode, const FM_ForgeNode &inout ChildNode, const TArray<FForgeWeaponAutoLineRouteOverride> &inout RouteOverrides, FEUIAutoLineConnection &inout Connection)
{
    for (auto& local_16 : RouteOverrides)
    {
        bool local_13 = ForgeWeaponRuntimeAutoLineBuilder::IsOverrideDataIdMatch(int(local_16.ParentDataId), ParentNode.GetDataId());
        bool local_17 = ForgeWeaponRuntimeAutoLineBuilder::IsOverrideDataIdMatch(int(local_16.ChildDataId), ChildNode.GetDataId());
        if ((!(local_13) || !(local_17)))
        {
            continue;
        }
        return true;
    }
    return false;
}
void BuildGraphNodes(const UEUIAutoLineCanvas AutoLineCanvas, const TArray<TEUIModelWeakRef<FM_ForgeNode>> &inout NodeList, const TMap<uint, UWidget_ForgeWeaponItem> &inout NodeWidgetMap, TArray<FEUIAutoLineNode> &inout OutNodes)
{
    UWidget_ForgeWeaponItem local_34;
    OutNodes.Reset(0);
    for (auto& local_18 : NodeList)
    {
        if (!(local_18.IsValid()) || !(ForgeWeaponRuntimeAutoLineBuilder::ShouldDrawNodeLine()))
        {
            continue;
        }
        FEUIAutoLineNode local_30;
        local_30.NodeId = ForgeWeaponRuntimeAutoLineBuilder::MakeNodeId();
        local_30.StyleState = ForgeWeaponRuntimeAutoLineBuilder::ResolveNodeStyleState();
        if (NodeWidgetMap.Find(GetDataId(), local_34) && (local_34 != nullptr))
        {
            local_30.Widget = local_34;
            local_30.AnchorWidget = local_34.GetAutoLineAnchorWidget();
        }
        OutNodes.Add(local_30);
    }
    return;
}
void BuildGraphConnections(const UObject ContextObject, const TArray<TEUIModelWeakRef<FM_ForgeNode>> &inout NodeList, const float32 BranchFromExtend, const float32 BranchToExtend, const float32 SameBranchFromExtend, const float32 SameBranchToExtend, const TArray<FForgeWeaponAutoLineRouteOverride> &inout RouteOverrides, TArray<FEUIAutoLineConnection> &inout OutConnections)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void BuildAndApplyGraph(const UObject ContextObject, const UEUIAutoLineCanvas AutoLineCanvas, const TArray<TEUIModelWeakRef<FM_ForgeNode>> &inout NodeList, const TMap<uint, UWidget_ForgeWeaponItem> &inout NodeWidgetMap, const float32 BranchFromExtend, const float32 BranchToExtend, const float32 SameBranchFromExtend, const float32 SameBranchToExtend, const TArray<FForgeWeaponAutoLineRouteOverride> &inout RouteOverrides)
{
    if (AutoLineCanvas == nullptr)
    {
        return;
    }
    TArray<FEUIAutoLineNode> local_6;
    ForgeWeaponRuntimeAutoLineBuilder::BuildGraphNodes(AutoLineCanvas, NodeList, NodeWidgetMap, local_6);
    TArray<FEUIAutoLineConnection> local_10;
    ForgeWeaponRuntimeAutoLineBuilder::BuildGraphConnections(ContextObject, NodeList, BranchFromExtend, BranchToExtend, SameBranchFromExtend, SameBranchToExtend, RouteOverrides, local_10);
    AutoLineCanvas.SetAutoLineGraph(local_6, local_10);
    return;
}
}


namespace TalentUpgradeRuntimeAutoLineBuilder
{
bool IsNodeNormal(const FM_TalentNode &inout Node)
{
    return (int(Node.GetStateType()) == 3);
}
FName ResolveNodeStyleState(const FM_TalentNode &inout Node)
{
    FName __r;
    if (TalentUpgradeRuntimeAutoLineBuilder::IsNodeNormal(Node))
    {
    }
    else
    {
    }
    return __r;
}
bool ShouldDrawNodeLine(const FM_TalentNode &inout Node)
{
    return (int(Node.GetStateType()) != 0);
}
FName MakeNodeId(const FM_TalentNode &inout Node)
{
    return TalentUpgradeAutoLineAdapter::MakeNodeId(Node);
}
FName MakeLineId(const FM_TalentNode &inout ParentNode, const FM_TalentNode &inout ChildNode)
{
    int local_6 = ChildNode.GetDataId();
    int local_5 = ParentNode.GetDataId();
    return FName(FString().Append("TalentLine_").Append(local_5).Append("_").Append(local_6));
}
FName MakeChoiceHubNodeId(const FM_TalentNode &inout Node)
{
    int local_5 = Node.GetDataId();
    return FName(FString().Append("TalentNode_").Append(local_5).Append("_ChoiceHub"));
}
FName MakeChoiceNodeId(const FM_TalentNode &inout Node, const int ChoiceIndex)
{
    int local_5 = Node.GetDataId();
    return FName(FString().Append("TalentNode_").Append(local_5).Append("_Choice_").Append(ChoiceIndex));
}
FString MakePortSuffix(const EEUIAutoLinePort Port)
{
    if (int(Port) == 0)
    {
        return "Up";
    }
    if (int(Port) == 1)
    {
        return "Down";
    }
    if (int(Port) == 2)
    {
        return "Left";
    }
    return "Right";
}
FName MakeNodePortId(const FM_TalentNode &inout Node, const EEUIAutoLinePort Port)
{
    int local_5 = Node.GetDataId();
    return FName(FString().Append("TalentNode_").Append(local_5).Append("_").Append(TalentUpgradeRuntimeAutoLineBuilder::MakePortSuffix(EEUIAutoLinePort(Port))));
}
FName MakeChoiceHubPortId(const FM_TalentNode &inout Node, const EEUIAutoLinePort Port)
{
    int local_5 = Node.GetDataId();
    return FName(FString().Append("TalentNode_").Append(local_5).Append("_ChoiceHub_").Append(TalentUpgradeRuntimeAutoLineBuilder::MakePortSuffix(EEUIAutoLinePort(Port))));
}
FName MakeChoiceNodePortId(const FM_TalentNode &inout Node, const int ChoiceIndex, const EEUIAutoLinePort Port)
{
    int local_5 = Node.GetDataId();
    return FName(FString().Append("TalentNode_").Append(local_5).Append("_Choice_").Append(ChoiceIndex).Append("_").Append(TalentUpgradeRuntimeAutoLineBuilder::MakePortSuffix(EEUIAutoLinePort(Port))));
}
uint GetChoiceBaseId(const FM_TalentNode &inout Node, const int ChoiceIndex)
{
    int local_3;
    if (Node.GetChoiceBaseIds().IsValidIndex(ChoiceIndex))
    {
        local_3 = Node.GetChoiceBaseIds()[ChoiceIndex];
    }
    else
    {
        local_3 = Node.GetDataId();
    }
    return local_3;
}
FName MakeChoiceLineId(const FM_TalentNode &inout Node, const int ChoiceIndex)
{
    int local_6 = TalentUpgradeRuntimeAutoLineBuilder::GetChoiceBaseId(Node, ChoiceIndex);
    int local_5 = Node.GetDataId();
    return FName(FString().Append("TalentLine_").Append(local_5).Append("_Choice_").Append(local_6));
}
FName ResolveConnectionNodeId(const FM_TalentNode &inout Node, const EEUIAutoLinePort Port)
{
    FName local_7 = Node.HasChoice() ? TalentUpgradeRuntimeAutoLineBuilder::MakeChoiceHubPortId(Node, EEUIAutoLinePort(Port)) : TalentUpgradeRuntimeAutoLineBuilder::MakeNodePortId(Node, EEUIAutoLinePort(Port));
    return local_7;
}
FName ResolveChoiceStyleState(const FM_TalentNode &inout Node, const int ChoiceIndex)
{
    if (Node.IsUnequippedChoice(ChoiceIndex))
    {
        return n"Locked";
    }
    return TalentUpgradeRuntimeAutoLineBuilder::ResolveNodeStyleState(Node);
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
bool ApplyRouteOverride(const FM_TalentNode &inout ParentNode, const FM_TalentNode &inout ChildNode, const TArray<FTalentUpgradeAutoLineRouteOverride> &inout RouteOverrides, FEUIAutoLineConnection &inout Connection)
{
    for (auto& local_16 : RouteOverrides)
    {
        bool local_13 = TalentUpgradeRuntimeAutoLineBuilder::IsOverrideDataIdMatch(int(local_16.ParentDataId), ParentNode.GetDataId());
        bool local_17 = TalentUpgradeRuntimeAutoLineBuilder::IsOverrideDataIdMatch(int(local_16.ChildDataId), ChildNode.GetDataId());
        if ((!(local_13) || !(local_17)))
        {
            continue;
        }
        return true;
    }
    return false;
}
void AddGraphNode(const FName &inout NodeId, const FName &inout StyleState, const UWidget Widget, const UWidget AnchorWidget, const bool bAttachLinesAtCenter, TArray<FEUIAutoLineNode> &inout OutNodes)
{
    if (Widget == nullptr)
    {
        return;
    }
    FEUIAutoLineNode local_12;
    local_12.NodeId = NodeId;
    local_12.StyleState = StyleState;
    if (AnchorWidget != nullptr)
    {
    }
    else
    {
    }
    UWidget local_14;
    local_12.AnchorWidget = local_14;
    local_12.bAttachLinesAtCenter = bAttachLinesAtCenter;
    OutNodes.Add(local_12);
    return;
}
UWidget FindChildWidgetByName(const UWidget SourceRootWidget, const FString &inout WidgetName)
{
    return TalentUpgradeRuntimeAutoLineBuilder::FindChildWidgetByNameFiltered(SourceRootWidget, WidgetName, 0);
}
UWidget FindTalentItemWidgetByName(const UWidget_TalentUpgradeItem ItemWidget, const FString &inout WidgetName)
{
    UWidget local_10;
    if (ItemWidget != nullptr)
    {
        local_10 = TalentUpgradeRuntimeAutoLineBuilder::FindChildWidgetByName(ItemWidget.GetRootWidget(), WidgetName);
    }
    else
    {
    }
    return local_10;
}
bool IsAutoLineVisibleWidget(const UWidget Widget)
{
    int local_3;
    if (Widget == nullptr)
    {
        return false;
    }
    ESlateVisibility local_5 = Widget.GetVisibility();
    if ((int(local_5)) == 1)
    {
        local_3 = 0;
    }
    else
    {
        local_3 = (int(local_5) != 2);
    }
    return (local_3 != 0);
}
bool IsAutoLineLaidOutWidget(const UWidget Widget)
{
    if (Widget == nullptr)
    {
        return false;
    }
    return (int(Widget.GetVisibility()) != 1);
}
UWidget FindChildWidgetByNameFiltered(const UWidget SourceRootWidget, const FString &inout WidgetName, const int VisibilityFilter)
{
    UWidget local_6;
    UWidget local_12;
    bool local_18;
    UPanelWidget local_24;
    TArray<UWidget> local_4;
    if (SourceRootWidget != nullptr)
    {
        local_4.Add(SourceRootWidget);
    }
    while (local_4.Num() > 0)
    {
        local_12 = local_4.Last(0);
        local_4.RemoveAt((local_4.Num() - 1));
        if (local_12 == nullptr)
        {
            continue;
        }
        if ((local_12 != SourceRootWidget && (VisibilityFilter != 0)))
        {
            if (VisibilityFilter == 1)
            {
                local_18 = TalentUpgradeRuntimeAutoLineBuilder::IsAutoLineVisibleWidget(local_12);
            }
            else
            {
                local_18 = TalentUpgradeRuntimeAutoLineBuilder::IsAutoLineLaidOutWidget(local_12);
            }
            if (!(local_18))
            {
                continue;
            }
        }
        if ((local_12.GetName() == WidgetName))
        {
            return local_12;
        }
        local_24 = Cast<UPanelWidget>(local_12);
        if (local_24 == nullptr)
        {
            continue;
        }
        int local_27 = 0;
        for (; local_27 < local_24.GetChildrenCount(); )
        {
            local_6 = local_24.GetChildAt(local_27);
            local_4.Add(local_6);
            ++local_27;
        }
    }
    return local_6;
}
UWidget FindVisibleChildWidgetByName(const UWidget SourceRootWidget, const FString &inout WidgetName)
{
    return TalentUpgradeRuntimeAutoLineBuilder::FindChildWidgetByNameFiltered(SourceRootWidget, WidgetName, 1);
}
UWidget FindLaidOutChildWidgetByName(const UWidget SourceRootWidget, const FString &inout WidgetName)
{
    return TalentUpgradeRuntimeAutoLineBuilder::FindChildWidgetByNameFiltered(SourceRootWidget, WidgetName, 2);
}
UWidget FindVisibleTalentItemWidgetByName(const UWidget_TalentUpgradeItem ItemWidget, const FString &inout WidgetName)
{
    UWidget local_10;
    if (ItemWidget != nullptr)
    {
        local_10 = TalentUpgradeRuntimeAutoLineBuilder::FindVisibleChildWidgetByName(ItemWidget.GetRootWidget(), WidgetName);
    }
    else
    {
    }
    return local_10;
}
UWidget FindLaidOutTalentItemWidgetByName(const UWidget_TalentUpgradeItem ItemWidget, const FString &inout WidgetName)
{
    UWidget local_10;
    if (ItemWidget != nullptr)
    {
        local_10 = TalentUpgradeRuntimeAutoLineBuilder::FindLaidOutChildWidgetByName(ItemWidget.GetRootWidget(), WidgetName);
    }
    else
    {
    }
    return local_10;
}
UWidget FindVisibleTalentItemStateWidgetByName(const UWidget_TalentUpgradeItem ItemWidget, const FString &inout WidgetName)
{
    UWidget local_10;
    if (ItemWidget != nullptr)
    {
        local_10 = ItemWidget.GetAutoLineStateWidget();
    }
    else
    {
    }
    UWidget local_2 = local_10;
    if (local_2 != nullptr)
    {
        return TalentUpgradeRuntimeAutoLineBuilder::FindVisibleChildWidgetByName(local_2, WidgetName);
    }
    return TalentUpgradeRuntimeAutoLineBuilder::FindVisibleTalentItemWidgetByName(ItemWidget, WidgetName);
}
UWidget FindLaidOutTalentItemStateWidgetByName(const UWidget_TalentUpgradeItem ItemWidget, const FString &inout WidgetName)
{
    UWidget local_10;
    UWidget local_12;
    if (ItemWidget != nullptr)
    {
        local_10 = ItemWidget.GetAutoLineStateWidget();
    }
    else
    {
    }
    UWidget local_2 = local_10;
    if (local_2 != nullptr)
    {
        return TalentUpgradeRuntimeAutoLineBuilder::FindLaidOutChildWidgetByName(local_2, WidgetName);
    }
    if (ItemWidget != nullptr)
    {
        local_12 = TalentUpgradeRuntimeAutoLineBuilder::FindLaidOutChildWidgetByName(ItemWidget.GetRootWidget(), WidgetName);
    }
    else
    {
    }
    return local_12;
}
UWidget ResolveTalentItemActiveIconWidget(const UWidget_TalentUpgradeItem ItemWidget)
{
    UWidget local_10;
    if (ItemWidget != nullptr)
    {
        local_10 = ItemWidget.GetAutoLineStateWidget();
    }
    else
    {
    }
    UWidget local_2 = local_10;
    UWidget local_12 = TalentUpgradeRuntimeAutoLineBuilder::FindVisibleChildWidgetByName(local_2, "w_img_Icon");
    if (local_12 != nullptr)
    {
        return local_12;
    }
    UWidget local_12_2 = TalentUpgradeRuntimeAutoLineBuilder::FindVisibleTalentItemWidgetByName(ItemWidget, "w_img_Icon");
    if (local_12_2 != nullptr)
    {
        return local_12_2;
    }
    UWidget local_12_3 = TalentUpgradeRuntimeAutoLineBuilder::FindChildWidgetByName(local_2, "w_img_Icon");
    if (local_12_3 != nullptr)
    {
        return local_12_3;
    }
    return TalentUpgradeRuntimeAutoLineBuilder::FindTalentItemWidgetByName(ItemWidget, "w_img_Icon");
}
UWidget ResolveTalentItemFallbackIconWidget(const UWidget_TalentUpgradeItem ItemWidget)
{
    UWidget local_12;
    UWidget local_16;
    UWidget local_2 = TalentUpgradeRuntimeAutoLineBuilder::ResolveTalentItemActiveIconWidget(ItemWidget);
    if (local_2 != nullptr)
    {
        return local_2;
    }
    UWidget local_2_2 = TalentUpgradeRuntimeAutoLineBuilder::FindVisibleTalentItemWidgetByName(ItemWidget, "w_img_IconActivated");
    if (local_2_2 != nullptr)
    {
        return local_2_2;
    }
    UWidget local_2_3 = TalentUpgradeRuntimeAutoLineBuilder::FindVisibleTalentItemWidgetByName(ItemWidget, "w_img_Icon_CanActived");
    if (local_2_3 != nullptr)
    {
        return local_2_3;
    }
    UWidget local_2_4 = TalentUpgradeRuntimeAutoLineBuilder::FindVisibleTalentItemWidgetByName(ItemWidget, "w_img_IconGray");
    if (local_2_4 != nullptr)
    {
        return local_2_4;
    }
    if (ItemWidget != nullptr)
    {
        local_12 = ItemWidget.GetAutoLineNodeWidget();
    }
    else
    {
    }
    UWidget local_8 = local_12;
    if (local_8 != nullptr)
    {
        local_16 = local_8;
    }
    else
    {
        if (ItemWidget != nullptr)
        {
            local_12 = ItemWidget.GetAutoLineAnchorWidget();
        }
        else
        {
        }
        local_16 = local_12;
    }
    return local_16;
}
UWidget ResolveTalentItemIconWidget(const FM_TalentNode &inout Node, const int ChoiceIndex, const UWidget_TalentUpgradeItem ItemWidget)
{
    UWidget local_12;
    UWidget local_2 = TalentUpgradeRuntimeAutoLineBuilder::ResolveTalentItemActiveIconWidget(ItemWidget);
    if (local_2 != nullptr)
    {
        return local_2;
    }
    if ((Node.HasChoice() && Node.IsUnequippedChoice(ChoiceIndex)) || (int(Node.GetStateType()) == 1))
    {
        local_2 = TalentUpgradeRuntimeAutoLineBuilder::FindTalentItemWidgetByName(ItemWidget, "w_img_IconGray");
    }
    else
    {
        if ((int(Node.GetStateType())) == 2)
        {
            local_2 = TalentUpgradeRuntimeAutoLineBuilder::FindTalentItemWidgetByName(ItemWidget, "w_img_Icon_CanActived");
        }
        else
        {
            if (int(Node.GetStateType()) == 3)
            {
                local_2 = TalentUpgradeRuntimeAutoLineBuilder::FindTalentItemWidgetByName(ItemWidget, "w_img_IconActivated");
            }
        }
    }
    if (local_2 != nullptr)
    {
        local_12 = local_2;
    }
    else
    {
        local_12 = TalentUpgradeRuntimeAutoLineBuilder::ResolveTalentItemFallbackIconWidget(ItemWidget);
    }
    return local_12;
}
UWidget ResolveTalentItemPlateWidget(const UWidget_TalentUpgradeItem ItemWidget)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    return nullptr;
}
UWidget ResolveTalentChoiceBranchPlateWidget(const UWidget_TalentUpgradeItem ItemWidget)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    return nullptr;
}
UWidget ResolveTalentChoiceBranchStablePortWidget(const UWidget_TalentUpgradeItem ItemWidget)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    return nullptr;
}
UWidget ResolveTalentItemPortWidget(const FM_TalentNode &inout Node, const int ChoiceIndex, const UWidget_TalentUpgradeItem ItemWidget)
{
    UWidget local_2 = TalentUpgradeRuntimeAutoLineBuilder::ResolveTalentItemPlateWidget(ItemWidget);
    if (local_2 != nullptr)
    {
        return local_2;
    }
    return TalentUpgradeRuntimeAutoLineBuilder::ResolveTalentItemIconWidget(Node, ChoiceIndex, ItemWidget);
}
UWidget ResolveTalentChoiceBranchPortWidget(const UWidget_TalentUpgradeItem ItemWidget)
{
    UWidget local_16;
    UWidget local_2 = TalentUpgradeRuntimeAutoLineBuilder::ResolveTalentChoiceBranchStablePortWidget(ItemWidget);
    if (local_2 != nullptr)
    {
        return local_2;
    }
    UWidget local_8 = TalentUpgradeRuntimeAutoLineBuilder::ResolveTalentChoiceBranchPlateWidget(ItemWidget);
    if (local_8 != nullptr)
    {
        return local_8;
    }
    UWidget local_10 = TalentUpgradeRuntimeAutoLineBuilder::ResolveTalentItemActiveIconWidget(ItemWidget);
    if (local_10 != nullptr)
    {
        return local_10;
    }
    if (ItemWidget != nullptr)
    {
        local_16 = ItemWidget.GetAutoLineNodeWidget();
    }
    else
    {
    }
    UWidget local_12 = local_16;
    if (local_12 != nullptr)
    {
        return local_12;
    }
    return TalentUpgradeRuntimeAutoLineBuilder::ResolveTalentItemFallbackIconWidget(ItemWidget);
}
void AddTalentItemPortGraphNodes(const FM_TalentNode &inout Node, const UWidget_TalentUpgradeItem ItemWidget, const FName &inout StyleState, const bool bAttachLinesAtCenter, TArray<FEUIAutoLineNode> &inout OutNodes)
{
    if (ItemWidget == nullptr)
    {
        return;
    }
    UWidget local_4 = TalentUpgradeRuntimeAutoLineBuilder::ResolveTalentItemPortWidget(Node, 0, ItemWidget);
    UWidget local_10 = ItemWidget.GetAutoLineStablePortWidget();
    if (local_10 == nullptr)
    {
        local_10 = local_4;
    }
    TalentUpgradeRuntimeAutoLineBuilder::AddGraphNode(TalentUpgradeRuntimeAutoLineBuilder::MakeNodePortId(Node, EEUIAutoLinePort(0)), StyleState, local_4, local_10, bAttachLinesAtCenter, OutNodes);
    TalentUpgradeRuntimeAutoLineBuilder::AddGraphNode(TalentUpgradeRuntimeAutoLineBuilder::MakeNodePortId(Node, EEUIAutoLinePort(1)), StyleState, local_4, local_10, bAttachLinesAtCenter, OutNodes);
    TalentUpgradeRuntimeAutoLineBuilder::AddGraphNode(TalentUpgradeRuntimeAutoLineBuilder::MakeNodePortId(Node, EEUIAutoLinePort(2)), StyleState, local_4, local_10, bAttachLinesAtCenter, OutNodes);
    TalentUpgradeRuntimeAutoLineBuilder::AddGraphNode(TalentUpgradeRuntimeAutoLineBuilder::MakeNodePortId(Node, EEUIAutoLinePort(3)), StyleState, local_4, local_10, bAttachLinesAtCenter, OutNodes);
    return;
}
void AddNodeFallbackPortGraphNodes(const FM_TalentNode &inout Node, const UWidget_TalentSkillUpgradeNode NodeWidget, const FName &inout StyleState, const bool bAttachLinesAtCenter, TArray<FEUIAutoLineNode> &inout OutNodes)
{
    if (NodeWidget == nullptr)
    {
        return;
    }
    UWidget local_4 = NodeWidget.GetAutoLineAnchorWidget();
    TalentUpgradeRuntimeAutoLineBuilder::AddGraphNode(TalentUpgradeRuntimeAutoLineBuilder::MakeNodePortId(Node, EEUIAutoLinePort(0)), StyleState, NodeWidget, local_4, bAttachLinesAtCenter, OutNodes);
    TalentUpgradeRuntimeAutoLineBuilder::AddGraphNode(TalentUpgradeRuntimeAutoLineBuilder::MakeNodePortId(Node, EEUIAutoLinePort(1)), StyleState, NodeWidget, local_4, bAttachLinesAtCenter, OutNodes);
    TalentUpgradeRuntimeAutoLineBuilder::AddGraphNode(TalentUpgradeRuntimeAutoLineBuilder::MakeNodePortId(Node, EEUIAutoLinePort(2)), StyleState, NodeWidget, local_4, bAttachLinesAtCenter, OutNodes);
    TalentUpgradeRuntimeAutoLineBuilder::AddGraphNode(TalentUpgradeRuntimeAutoLineBuilder::MakeNodePortId(Node, EEUIAutoLinePort(3)), StyleState, NodeWidget, local_4, bAttachLinesAtCenter, OutNodes);
    return;
}
void AddChoiceHubPortGraphNode(const FM_TalentNode &inout Node, const UWidget_TalentSkillUpgradeNode ItemWidget, const EEUIAutoLinePort Port, const bool bAttachLinesAtCenter, TArray<FEUIAutoLineNode> &inout OutNodes)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void AddChoiceItemPortGraphNode(const FM_TalentNode &inout Node, const int ChoiceIndex, const UWidget_TalentUpgradeItem ChoiceWidget, const EEUIAutoLinePort Port, const bool bAttachLinesAtCenter, TArray<FEUIAutoLineNode> &inout OutNodes)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void BuildLegacyGraphNodes(const TArray<TEUIModelWeakRef<FM_TalentNode>> &inout NodeList, const TMap<uint, UWidget_TalentSkillUpgradeNode> &inout NodeWidgetMap, TArray<FEUIAutoLineNode> &inout OutNodes)
{
    UWidget_TalentSkillUpgradeNode local_22;
    OutNodes.Reset(0);
    for (auto& local_18 : NodeList)
    {
        if (!(local_18.IsValid()) || !(TalentUpgradeRuntimeAutoLineBuilder::ShouldDrawNodeLine()))
        {
            continue;
        }
        if (!(NodeWidgetMap.Find(GetDataId(), local_22)) || (local_22 == nullptr))
        {
            continue;
        }
        FEUIAutoLineNode local_34;
        local_34.NodeId = TalentUpgradeRuntimeAutoLineBuilder::MakeNodeId();
        local_34.StyleState = TalentUpgradeRuntimeAutoLineBuilder::ResolveNodeStyleState();
        local_34.Widget = local_22;
        local_34.AnchorWidget = local_22.GetAutoLineAnchorWidget();
        OutNodes.Add(local_34);
    }
    return;
}
void BuildGraphNodes(const TArray<TEUIModelWeakRef<FM_TalentNode>> &inout NodeList, const TMap<uint, UWidget_TalentSkillUpgradeNode> &inout NodeWidgetMap, const bool bAttachLinesAtCenter, TArray<FEUIAutoLineNode> &inout OutNodes)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
FName ResolveChoiceBranchLineId(const TEUIModelWeakRef<FM_TalentNode> &inout Node, const int ChoiceIndex)
{
    if (!(Node.IsValid()))
    {
        return n"None";
    }
    return FName();
}
bool TryGetWidgetCenterX(const UWidget Widget, float &out OutCenterX)
{
    OutCenterX = 0.0;
    if (Widget == nullptr)
    {
        return false;
    }
    FGeometry local_19 = Widget.GetTickSpaceGeometry();
    FVector2D local_28 = local_19.GetLocalSize();
    if ((local_28.X <= 1.0 || (local_28.Y <= 1.0)))
    {
        return false;
    }
    OutCenterX = (local_19.LocalToAbsolute((local_28 * 0.5))).X;
    return true;
}
bool IsChoiceWidgetOnLeft(const UWidget_TalentSkillUpgradeNode ItemWidget, const UWidget_TalentUpgradeItem ChoiceWidget, const int ChoiceIndex)
{
    UWidget local_10;
    if (ItemWidget != nullptr)
    {
        local_10 = ItemWidget.GetAutoLineChoiceHubCenterMarkerWidget();
    }
    else
    {
    }
    UWidget local_12 = TalentUpgradeRuntimeAutoLineBuilder::ResolveTalentChoiceBranchPortWidget(ChoiceWidget);
    float local_14 = 0.0;
    float local_18 = 0.0;
    if (TalentUpgradeRuntimeAutoLineBuilder::TryGetWidgetCenterX(local_10, local_14) && TalentUpgradeRuntimeAutoLineBuilder::TryGetWidgetCenterX(local_12, local_18))
    {
        if ((local_18 + 1.0) < local_14)
        {
            return true;
        }
        if (local_18 > (local_14 + 1.0))
        {
            return false;
        }
    }
    return (ChoiceIndex == 0);
}
void AddChoiceBranchConnection(const FM_TalentNode &inout Node, const int ChoiceIndex, const bool bLeftChoice, const FName &inout LineId, FEUIAutoLineConnection &inout OutConnection)
{
    int local_3 = 0;
    if (bLeftChoice)
    {
        local_3 = 2;
    }
    else
    {
        local_3 = 3;
    }
    if (bLeftChoice)
    {
        local_3 = 3;
    }
    else
    {
        local_3 = 2;
    }
    OutConnection.LineId = LineId;
    OutConnection.FromNodeId = TalentUpgradeRuntimeAutoLineBuilder::MakeChoiceHubPortId(Node, OutConnection.FromPort);
    OutConnection.ToNodeId = TalentUpgradeRuntimeAutoLineBuilder::MakeChoiceNodePortId(Node, ChoiceIndex, OutConnection.ToPort);
    OutConnection.bPreservePathDirection = true;
    return;
}
void BuildChoiceBranchConnections(const TArray<TEUIModelWeakRef<FM_TalentNode>> &inout NodeList, const TMap<uint, UWidget_TalentSkillUpgradeNode> &inout NodeWidgetMap, TArray<FEUIAutoLineConnection> &inout OutConnections)
{
    // body not fully recovered вЂ” stub [argmismatch:argint]
}
void BuildGraphConnections(const UObject ContextObject, const TArray<TEUIModelWeakRef<FM_TalentNode>> &inout NodeList, const TMap<uint, UWidget_TalentSkillUpgradeNode> &inout NodeWidgetMap, const float32 FromExtend, const float32 ToExtend, const TArray<FTalentUpgradeAutoLineRouteOverride> &inout RouteOverrides, const bool bUsePortChoiceGraph, TArray<FEUIAutoLineConnection> &inout OutConnections)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
void BuildAndApplyGraph(const UObject ContextObject, const UEUIAutoLineCanvas AutoLineCanvas, const TArray<TEUIModelWeakRef<FM_TalentNode>> &inout NodeList, const TMap<uint, UWidget_TalentSkillUpgradeNode> &inout NodeWidgetMap, const float32 FromExtend, const float32 ToExtend, const TArray<FTalentUpgradeAutoLineRouteOverride> &inout RouteOverrides, const bool bUsePortChoiceGraph, const bool bAttachLinesAtCenter)
{
    if (AutoLineCanvas == nullptr)
    {
        return;
    }
    TArray<FEUIAutoLineNode> local_6;
    if (bUsePortChoiceGraph)
    {
        TalentUpgradeRuntimeAutoLineBuilder::BuildGraphNodes(NodeList, NodeWidgetMap, bAttachLinesAtCenter, local_6);
    }
    else
    {
        TalentUpgradeRuntimeAutoLineBuilder::BuildLegacyGraphNodes(NodeList, NodeWidgetMap, local_6);
    }
    TArray<FEUIAutoLineConnection> local_10;
    TalentUpgradeRuntimeAutoLineBuilder::BuildGraphConnections(ContextObject, NodeList, NodeWidgetMap, FromExtend, ToExtend, RouteOverrides, bUsePortChoiceGraph, local_10);
    AutoLineCanvas.SetAutoLineGraph(local_6, local_10);
    return;
}
}

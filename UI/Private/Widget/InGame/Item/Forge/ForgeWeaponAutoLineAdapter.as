

struct FForgeWeaponAutoLineRouteOverride
{
    UPROPERTY()
    int ParentDataId = 0;
    UPROPERTY()
    int ChildDataId = 0;
    UPROPERTY()
    EEUIAutoLinePort FromPort = EEUIAutoLinePort(1);
    UPROPERTY()
    EEUIAutoLinePort ToPort = EEUIAutoLinePort(0);
    UPROPERTY()
    float32 FromExtend = 1.0f;
    UPROPERTY()
    float32 ToExtend = 1.0f;
    UPROPERTY()
    EEUIAutoLineRouteMode RouteMode = EEUIAutoLineRouteMode(0);


}

namespace ForgeWeaponAutoLineAdapter
{
FName MakeNodeId(const FM_ForgeNode &inout Node)
{
    int local_5 = Node.GetDataId();
    return FName(FString().Append("ForgeNode_").Append(local_5));
}
EEUIAutoLinePort GetParentOutPort(const FM_ForgeNode &inout ParentNode, const FM_ForgeNode &inout ChildNode)
{
    if (int(ParentNode.GetBranchType()) == int(ChildNode.GetBranchType()))
    {
        return EEUIAutoLinePort(1);
    }
    if (int(ChildNode.GetBranchType()) == 2)
    {
        return EEUIAutoLinePort(3);
    }
    if (int(ChildNode.GetBranchType()) == 3)
    {
        return EEUIAutoLinePort(2);
    }
    return EEUIAutoLinePort(1);
}
}

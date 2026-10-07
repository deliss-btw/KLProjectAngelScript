

struct FTalentUpgradeAutoLineRouteOverride
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

namespace TalentUpgradeAutoLineAdapter
{
FName MakeNodeId(const FM_TalentNode &inout Node)
{
    int local_5 = Node.GetDataId();
    return FName(FString().Append("TalentNode_").Append(local_5));
}
void ResolvePorts(const FM_TalentNode &inout ParentNode, const FM_TalentNode &inout ChildNode, EEUIAutoLinePort &inout OutFromPort, EEUIAutoLinePort &inout OutToPort, EEUIAutoLineRouteMode &inout OutRouteMode)
{
    int local_2 = ParentNode.GetConfig().Row;
    int local_1 = local_2;
    int local_2_2 = ChildNode.GetConfig().Row;
    int local_3 = local_2_2;
    int local_2_3 = ParentNode.GetConfig().Column;
    int local_4 = local_2_3;
    int local_2_4 = ChildNode.GetConfig().Column;
    int local_5 = local_2_4;
    if (local_3 != local_1)
    {
        if (local_3 > local_1)
        {
            OutFromPort = EEUIAutoLinePort(1);
            OutToPort = EEUIAutoLinePort(0);
        }
        else
        {
            OutFromPort = EEUIAutoLinePort(0);
            OutToPort = EEUIAutoLinePort(1);
        }
        OutRouteMode = EEUIAutoLineRouteMode(2);
        return;
    }
    if (local_5 >= local_4)
    {
        OutFromPort = EEUIAutoLinePort(3);
        OutToPort = EEUIAutoLinePort(2);
    }
    else
    {
        OutFromPort = EEUIAutoLinePort(2);
        OutToPort = EEUIAutoLinePort(3);
    }
    OutRouteMode = EEUIAutoLineRouteMode(1);
    return;
}
}

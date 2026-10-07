
namespace FEcosimAIV2Utils
{
void DebugEntityRunHTNWithFile(const FECSEntity &inout Entity)
{
    int local_38 = 0;
    UObject local_4 = LoadObject(nullptr, "/Game/MoleRes/Dev/AI/HTN/EcosimAIV2/HTN_EcosimAIV2_Human.HTN_EcosimAIV2_Human");
    UObject local_6 = LoadObject(nullptr, "/Game/MoleRes/Dev/AI/HTN/EcosimAIV2/BB_HTN_EcosimAIV2_Human.BB_HTN_EcosimAIV2_Human");
    UHTN local_18 = Cast<UHTN>(local_4);
    TSoftObjectPtr<UHTN> local_16 = local_18;
    UBlackboardData local_30 = Cast<UBlackboardData>(local_6);
    TSoftObjectPtr<UBlackboardData> local_28 = local_30;
    if (local_16.IsNull() || local_28.IsNull())
    {
        return;
    }
    local_38.HTNAsset = local_16;
    local_38.BlackboardAsset = local_28;
    FC_HTNNeedRestartTag local_44;
    Assign local_42;
    local_42.opCall(local_44);
    return;
}
void EntityRunHTN(const FECSEntity &inout Entity)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        FC_HTNNeedRestartTag local_12;
        Assign local_10;
        local_10.opCall(local_12);
    }
    return;
}
void EntityStopHTN(const FECSEntity &inout Entity)
{
    Get local_4;
    if (local_4.opCall())
    {
        UECSHTNComponent local_10;
        local_10.StopHTN(false);
    }
    return;
}
void AppendContentToBB(const FHTNContext &inout Context, const FString &inout Content, const FBlackboardKeySelector &inout AppendToPrompt)
{
    if (!(Content.IsEmpty()))
    {
        FName local_5 = HTNNode::GetWorldStateValueAsName(Context, AppendToPrompt);
        FString local_18;
        if (local_5.IsNone())
        {
            local_18 = "";
        }
        else
        {
            local_18 = local_5.ToString();
        }
        local_18.Append(Content);
        HTNNode::SetWorldStateValueAsName(Context, AppendToPrompt, FName(local_18));
    }
    return;
}
}

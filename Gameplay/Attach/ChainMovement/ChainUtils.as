
namespace FChainUtils
{
void ChainToEntity(const FECSEntity &inout ChildEntity, const FECSEntity &inout ParentEntity, const FChainParam &inout ChainParam)
{
    int local_12 = 0;
    if (ChildEntity.IsValid() && ParentEntity.IsValid())
    {
        FFPTime local_8 = FFPTime(-1);
        local_12.Parent = ParentEntity;
        local_12.ChainParam = ChainParam;
    }
    return;
}
void UnchainFromParent(const FECSEntity &inout ChildEntity)
{
    if (ChildEntity.IsValid())
    {
        SendEvent local_6;
        local_6.opCall(FFPTime(-1));
    }
    return;
}
bool GetChainParent(const FECSEntity &inout ChildEntity, FECSEntity &out Parent)
{
    FECSEntity local_4;
    Parent = local_4;
    Get local_8;
    const FC_ChainParentInfo& local_10 = local_8.opCall();
    if (local_10)
    {
        Parent = local_10.GetParent();
        return true;
    }
    return false;
}
bool GetChainChildren(const FECSEntity &inout ParentEntity, TArray<FECSEntity> &out Children)
{
    TArray<FECSEntity> local_4;
    Children = local_4;
    Get local_8;
    const FC_ChainChildrenInfo& local_10 = local_8.opCall();
    if (local_10)
    {
        Children.Append(local_10.GetChildren());
        return true;
    }
    return false;
}
FChainJointInfo BuildChainJointInfo(const FName &inout SocketName, const FVector3f &inout LocationOffset, const EJointParamSpace LocationSpace, const FRotator &inout RotationOffset, const EJointParamSpace RotationSpace, const EJointRotationFreedom RotationFreedom)
{
    FChainJointInfo local_20;
    if ((!((SocketName == NAME_None))))
    {
        local_20.SetSocketName(SocketName);
        local_20.SetTransformType(EJointTransformParamType(1));
    }
    local_20.SetLocationOffset(LocationOffset);
    local_20.SetLocationSpace(EJointParamSpace(LocationSpace));
    local_20.SetRotationOffset(RotationOffset.Quaternion());
    local_20.SetRotationSpace(EJointParamSpace(RotationSpace));
    local_20.SetRotationFreedom(EJointRotationFreedom(RotationFreedom));
    return local_20;
}
FChainParam BuildSimpleChainParam(const FChainJointInfo &inout ParentJointInfo, const FChainJointInfo &inout ChildJointInfo, const FVector3f &inout ChildCenterOffset, const bool bRigid, const float32 Length, const bool bEnableSmoothing)
{
    FChainParam local_52;
    local_52.SetParentJointInfo(ParentJointInfo);
    local_52.SetChildJointInfo(ChildJointInfo);
    local_52.GetLinkInfo().SetbRigid(bRigid);
    local_52.GetLinkInfo().SetLength(Length);
    local_52.GetLinkInfo().SetbEnableSmoothing(bEnableSmoothing);
    local_52.GetModify_ChildCenterInfo().SetLocationOffset(ChildCenterOffset);
    return local_52;
}
}


namespace FTargetSelectUtils
{
void AddSelectTargetEntityByViewportRequest(const FECSEntity &inout Entity, const FName &inout RequestName, const ESelectTargetRequestType RequestType, const TDataObjectPtr<FViewportSelectTargetParams> &inout Params)
{
    int local_8 = 0;
    if (!(Params))
    {
        return;
    }
    FSelectTargetRuntimeData& local_10 = local_8.GetModify_DataByRequestName().FindOrAdd(RequestName);
    local_10.SetMethod(ESelectTargetMethod(0));
    local_10.SetRequestType(ESelectTargetRequestType(RequestType));
    local_10.SetConfirmInputContextConfig(GetConfirmInputContextConfig());
    local_10.SetViewportSelectTargetParams(Params);
    return;
}
void RemoveSelectTargetEntityByViewportRequest(const FECSEntity &inout Entity, const FName &inout RequestName, const bool bClearTarget, const FFPTime &inout ResultExpireTime)
{
    int local_6 = 0;
    int local_22 = 0;
    if (local_6)
    {
        if (bClearTarget)
        {
            if (local_6.GetDataByRequestName().Find(RequestName))
            {
                int local_14 = int(GetRequestType());
                if (local_14 <= 1)
                {
                    if (local_14 != 0)
                    {
                        if (local_14 != 1)
                        {
                        }
                    }
                    else
                    {
                        if (local_22)
                        {
                            FSelectTargetResult& local_24 = local_22.GetModify_TargetEntitiesByRequestName().FindOrAdd(RequestName);
                            local_24.SetExpireTime((FFPTime(Entity.GetWorld().GetFixedTime().Time) + ResultExpireTime));
                            FFPTime local_28 = FFPTime(local_22.GetNextExpireTime());
                            if (local_28.opCmp(0.0) < 0 || (FFPTime(local_22.GetNextExpireTime()).opCmp(local_24.GetExpireTime()) > 0))
                            {
                                local_22.SetNextExpireTime(local_24.GetExpireTime());
                            }
                        }
                        Get local_38;
                        const FC_Skill& local_40 = local_38.opCall();
                        if (local_40)
                        {
                            if (local_40.GetSkillInstanceEntity(FSkillUtils::GetSkillIndex(Entity, RequestName)))
                            {
                                Modify local_54;
                                FC_SkillTarget& local_56 = local_54.opCall();
                                if (local_56)
                                {
                                    local_56.GetModify_TargetEntities().Reset(0);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return;
}
TArray<FECSEntity> GetSelectTargetEntitiesByRequestType(const FECSEntity &inout Entity, const ESelectTargetRequestType RequestType, const FName &inout RequestName)
{
    if (int(RequestType) == 0)
    {
        Get local_8;
        const FC_SelectTargetResult& local_10 = local_8.opCall();
        if (local_10)
        {
            if (local_10.GetTargetEntitiesByRequestName().Find(RequestName))
            {
                return GetEntities();
            }
        }
    }
    else
    {
        if (int(RequestType) == 1)
        {
            Get local_18;
            const FC_Skill& local_20 = local_18.opCall();
            if (local_20)
            {
                if (local_20.GetSkillInstanceEntity(FSkillUtils::GetSkillIndex(Entity, RequestName)))
                {
                    Get local_34;
                    const FC_SkillTarget& local_36 = local_34.opCall();
                    if (local_36)
                    {
                        return local_36.GetTargetEntities();
                    }
                }
            }
        }
    }
    return TArray<FECSEntity>();
}
void SetSelectTargetResultByRequestType(const FECSEntity &inout Entity, const ESelectTargetRequestType RequestType, const FName &inout RequestName, const TArray<FECSEntity> &inout TargetEntities)
{
    int local_10 = 0;
    if (int(RequestType) == 0)
    {
        local_10.GetModify_TargetEntitiesByRequestName().FindOrAdd(RequestName).SetEntities(TargetEntities);
        return;
    }
    if (int(RequestType) == 1)
    {
        Get local_14;
        const FC_Skill& local_16 = local_14.opCall();
        if (local_16)
        {
            if (local_16.GetSkillInstanceEntity(FSkillUtils::GetSkillIndex(Entity, RequestName)))
            {
                ModifyOrAdd local_30;
                FC_SkillTarget& local_32 = local_30.opCall();
                if (local_32)
                {
                    local_32.SetTargetEntities(TargetEntities);
                }
            }
        }
    }
    return;
}
void ClearSkillTargetEntity(const FECSEntity &inout Entity, const FName &inout SkillName)
{
    Get local_4;
    const FC_Skill& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.GetSkillInstanceEntity(FSkillUtils::GetSkillIndex(Entity, SkillName)))
        {
            Modify local_22;
            FC_SkillTarget& local_24 = local_22.opCall();
            if (local_24)
            {
                local_24.GetModify_TargetEntities().Reset(0);
            }
        }
    }
    return;
}
TArray<FECSEntity> GetSelectTargetEntitiesForView(const FECSEntity &inout Entity, const FName &inout RequestName = NAME_None)
{
    const FC_ViewportSelectTarget& local_6 = FECSEntity::Get<FC_ViewportSelectTarget>(Entity).opCall();
    if (local_6)
    {
        int local_8 = 0;
        for (; local_8 < local_6.SelectDatas.Num(); ++local_8)
        {
            if (RequestName.IsNone() || (FName(local_6.SelectDatas[local_8].Identifier.Name) == RequestName))
            {
                return local_6.TargetDatas[local_8].Entities;
            }
        }
    }
    return TArray<FECSEntity>();
}
TArray<FECSEntity> GetSelectTargetEntitiesWithSelectParamsForView(const FECSEntity &inout Entity, const FName &inout RequestName, TDataObjectPtr<FViewportSelectTargetParams> &inout OutSelectParams)
{
    const FC_ViewportSelectTarget& local_6 = FECSEntity::Get<FC_ViewportSelectTarget>(Entity).opCall();
    if (local_6)
    {
        int local_8 = 0;
        for (; local_8 < local_6.SelectDatas.Num(); ++local_8)
        {
            if (RequestName.IsNone() || (FName(local_6.SelectDatas[local_8].Identifier.Name) == RequestName))
            {
                OutSelectParams = local_6.SelectDatas[local_8].Params;
                return local_6.TargetDatas[local_8].Entities;
            }
        }
    }
    OutSelectParams = TDataObjectPtr<FViewportSelectTargetParams>(nullptr);
    return TArray<FECSEntity>();
}
FVector GetSkillTargetPosition(const FECSEntity &inout Entity, bool &inout bHasTargetPosition)
{
    Get local_4;
    const FC_SkillTargetPosition& local_6 = local_4.opCall();
    if (local_6)
    {
        bHasTargetPosition = true;
        return local_6.GetTargetPosition();
    }
    return FVector::ZeroVector;
}
}

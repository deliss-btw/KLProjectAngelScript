
namespace ConditionGroupUtils
{
bool IsReached(const FConditionInstanceHandle &inout ConditionGroupInstance)
{
    TDataObjectPtr<FConditionConfigBase> local_66;
    if (!(ConditionGroupInstance.IsValid()))
    {
        return false;
    }
    if ((!((int(ConditionGroupInstance.GetLocalConditionType()) == 2))))
    {
        return false;
    }
    TArray<FConditionInstanceHandle> local_8;
    if (ConditionGroupUtils::GetInnerHandles(ConditionGroupInstance, local_8))
    {
        TMap<TDataObjectPtr<FLocalConditionConfigBase>, FConditionInstanceHandle> local_28;
        for (auto& local_42 : local_8)
        {
            local_66 = local_42.GetConditionConfig();
            CastTo local_70;
            local_28.Add(local_70.opCall(), local_42);
        }
        local_66 = ConditionGroupInstance.GetConditionConfig();
        CastTo local_98;
        return ConditionGroupUtils_Internal::RecursiveCheckConditionGroupReached(local_98.opCall(), local_28);
    }
    return false;
}
void ValidateConditionGroup(const TDataObjectPtr<FConditionGroupConfig> &inout ConditionGroupConfig, TArray<FString> &inout OutErrorMessages)
{
    TSet<TDataObjectPtr<FLocalConditionConfigBase>> local_20;
    FString local_24;
    if (!(ConditionGroupUtils_Internal::ValidateConditionGroupRecursive(ConditionGroupConfig, local_20, local_24)))
    {
        OutErrorMessages.Add(FString().Append("Validate condition group \"").Append(ConditionGroupConfig.GetDataName().ToString()).Append("\" failed: ").Append(local_24));
    }
    return;
}
FConditionInstanceHandle RegisterConditionGroupInstance(const FECSEntity &inout ContextEntity, const TDataObjectPtr<FConditionGroupConfig> &inout ConditionGroupConfig)
{
    FConditionInstanceHandle __r;
    if (!(ConditionGroupUtils::ValidateAndReportConditionGroupConfigError(ConditionGroupConfig)))
    {
    }
    else
    {
        TArray<FConditionInstanceHandle> local_32;
        FString local_36;
        if (!(ConditionGroupUtils_Internal::RecursiveRegisterConditionOrConditionGroupInstance(ContextEntity, ConditionGroupConfig, local_32, local_36)))
        {
            XError(ELog(58), FString().Append("Failed to register condition group \"").Append(ConditionGroupConfig.GetDataName().ToString()).Append("\": ").Append(local_36));
        }
        else
        {
            ConditionGroupUtils_Internal::RegisterConditionGroupInstanceHandle(ConditionGroupConfig, local_32);
        }
    }
    return __r;
}
void UnregisterConditionGroupInstance(const FConditionInstanceHandle &inout ConditionGroupInstance)
{
    if ((!((int(ConditionGroupInstance.GetLocalConditionType()) == 2))))
    {
        return;
    }
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    Modify local_10;
    FCS_LocalConditionGroupManager& local_12 = local_10.opCall();
    if (local_12)
    {
        TArray<FConditionInstanceHandle> local_16;
        if (ConditionGroupUtils::GetInnerHandles(ConditionGroupInstance, local_16))
        {
            for (auto& local_30 : local_16)
            {
                ConditionUtils_Internal::UnregisterLocalConditionInstance(local_30.GetLocalConditionInstanceID());
            }
        }
        local_12.RemoveConditionGroupInstance(ConditionGroupInstance.GetLocalConditionGroupInstanceID());
    }
    return;
}
bool GetInnerHandles(const FConditionInstanceHandle &inout ConditionGroupInstanceHandle, TArray<FConditionInstanceHandle> &inout OutInnerHandles)
{
    if ((!((int(ConditionGroupInstanceHandle.GetLocalConditionType()) == 2))))
    {
        return false;
    }
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return false;
    }
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    Get local_10;
    const FCS_LocalConditionGroupManager& local_12 = local_10.opCall();
    if (local_12)
    {
        TConstRawPtr<FLocalConditionGroupInstanceData> local_14 = local_12.ConditionGroupInstanceData.Find(ConditionGroupInstanceHandle.GetLocalConditionGroupInstanceID());
        if (local_14)
        {
            OutInnerHandles.Empty(local_14.opArrow().InnerConditionInstanceIds.Num());
            ConditionGroupUtils_Internal::RecursiveGetInnerHandles(local_14.opArrow().ConditionGroupConfig, local_14.opArrow().InnerConditionInstanceIds, OutInnerHandles);
            return true;
        }
    }
    return false;
}
bool ValidateAndReportConditionGroupConfigError(const TDataObjectPtr<FConditionGroupConfig> &inout ConditionGroupConfig)
{
    TArray<FString> local_4;
    ConditionGroupUtils::ValidateConditionGroup(ConditionGroupConfig, local_4);
    if (local_4.Num() > 0)
    {
        for (auto& local_22 : local_4)
        {
            XError(ELog(58), FString().Append("Condition group config \"").Append(ConditionGroupConfig.GetDataName().ToString()).Append("\" contains error: ").Append(local_22));
        }
        return false;
    }
    return true;
}
}
namespace ConditionGroupUtils_Internal
{
bool RecursiveCheckConditionGroupReached(const TDataObjectPtr<FConditionGroupConfig> &inout ConditionGroupConfig, const TMap<TDataObjectPtr<FLocalConditionConfigBase>, FConditionInstanceHandle> &inout ConditionInstanceSearchMap)
{
    bool local_1 = !(ConditionGroupConfig);
    if (local_1)
    {
        return false;
    }
    switch (int(ConditionGroupConfig.opArrow().Operator))
    {
    case 0:
    {
        return ConditionGroupUtils_Internal::RecursiveCheckConditionGroupReached_OpAnd(ConditionGroupConfig, ConditionInstanceSearchMap);
    }
    case 1:
    {
        return ConditionGroupUtils_Internal::RecursiveCheckConditionGroupReached_OpOr(ConditionGroupConfig, ConditionInstanceSearchMap);
    }
    case 2:
    {
        return !(ConditionGroupUtils_Internal::RecursiveCheckConditionGroupReached_OpAnd(ConditionGroupConfig, ConditionInstanceSearchMap));
    }
    case 3:
    {
        return !(ConditionGroupUtils_Internal::RecursiveCheckConditionGroupReached_OpOr(ConditionGroupConfig, ConditionInstanceSearchMap));
    }
    default:
    {
        local_1 = false;
    }
    }
    return local_1;
}
bool RecursiveCheckConditionGroupReached_OpAnd(const TDataObjectPtr<FConditionGroupConfig> &inout ConditionGroupConfig, const TMap<TDataObjectPtr<FLocalConditionConfigBase>, FConditionInstanceHandle> &inout ConditionInstanceSearchMap)
{
    for (auto& local_16 : ConditionGroupConfig.opArrow().ConditionSpecs)
    {
        if (!(ConditionGroupUtils_Internal::IsConditionReached(local_16.ConditionConfig, ConditionInstanceSearchMap)))
        {
            return false;
        }
    }
    return true;
}
bool RecursiveCheckConditionGroupReached_OpOr(const TDataObjectPtr<FConditionGroupConfig> &inout ConditionGroupConfig, const TMap<TDataObjectPtr<FLocalConditionConfigBase>, FConditionInstanceHandle> &inout ConditionInstanceSearchMap)
{
    for (auto& local_16 : ConditionGroupConfig.opArrow().ConditionSpecs)
    {
        if (ConditionGroupUtils_Internal::IsConditionReached(local_16.ConditionConfig, ConditionInstanceSearchMap))
        {
            return true;
        }
    }
    return false;
}
bool IsConditionReached(const TDataObjectPtr<FLocalConditionConfigBase> &inout ConditionConfig, const TMap<TDataObjectPtr<FLocalConditionConfigBase>, FConditionInstanceHandle> &inout ConditionInstanceSearchMap)
{
    if (int(ConditionConfig.opArrow().LocalConditionType) == 1)
    {
        FConditionInstanceHandle local_30;
        if (!(ConditionInstanceSearchMap.Find(ConditionConfig, local_30)))
        {
            return false;
        }
        return ConditionUtils::IsReached(local_30);
    }
    if (int(ConditionConfig.opArrow().LocalConditionType) == 2)
    {
        CastTo local_34;
        return ConditionGroupUtils_Internal::RecursiveCheckConditionGroupReached(local_34.opCall(), ConditionInstanceSearchMap);
    }
    return false;
}
bool ValidateConditionGroupRecursive(const TDataObjectPtr<FConditionGroupConfig> &inout ConditionGroupConfig, TSet<TDataObjectPtr<FLocalConditionConfigBase>> &inout VisitedConfigs, FString &inout OutErrorMessage)
{
    CastTo local_4;
    VisitedConfigs.Add(local_4.opCall());
    for (auto& local_44 : ConditionGroupConfig.opArrow().ConditionSpecs)
    {
        switch (int(local_44.ConditionConfig.opArrow().LocalConditionType))
        {
        case 0:
        {
            OutErrorMessage = FString().Append("Invalid condition config ").Append(local_44.ConditionConfig.GetDataName());
            return false;
        }
        case 1:
        {
            if (VisitedConfigs.Contains(local_44.ConditionConfig))
            {
                OutErrorMessage = FString().Append("Redundant condition detected in group: ").Append(local_44.ConditionConfig.GetDataName());
                return false;
            }
            break;
        }
        case 2:
        {
                CastTo local_58;
            if (VisitedConfigs.Contains(local_44.ConditionConfig))
            {
                OutErrorMessage = FString().Append("Recursive condition group detected: ").Append(local_44.ConditionConfig.GetDataName());
                return false;
            }
            if (!(ConditionGroupUtils_Internal::ValidateConditionGroupRecursive(local_58.opCall(), VisitedConfigs, OutErrorMessage)))
            {
                return false;
            }
            break;
        }
        }
    }
    return true;
}
bool FindPerConditionContextEntity(const FECSEntity &inout GroupContextEntity, const EConditionSpecContextType ContextType, FECSEntity &out OutContextEntity)
{
    FECSEntity local_4;
    OutContextEntity = local_4;
    switch (int(ContextType))
    {
    case 0:
    {
        OutContextEntity = GroupContextEntity;
        return true;
    }
    case 1:
    {
        Get local_12;
        const FC_PlayerInTeam& local_14 = local_12.opCall();
        if (local_14)
        {
            OutContextEntity = local_14.GetTeamEntity();
            return true;
        }
        break;
    }
    case 2:
    {
        Has local_18;
        bool local_7 = local_18.opCall();
        if (local_7)
        {
            OutContextEntity = GroupContextEntity;
            return true;
        }
        break;
    }
    case 3:
    {
        OutContextEntity = ENTITY_NULL;
        return true;
    }
    }
    return false;
}
bool RecursiveRegisterConditionOrConditionGroupInstance(const FECSEntity &inout ContextEntity, const TDataObjectPtr<FConditionGroupConfig> &inout ConditionGroupConfig, TArray<FConditionInstanceHandle> &inout OutConditionInstanceHandles, FString &inout OutErrorMessage)
{
    for (auto& local_16 : ConditionGroupConfig.opArrow().ConditionSpecs)
    {
        FECSEntity local_20;
        if (!(ConditionGroupUtils_Internal::FindPerConditionContextEntity(ContextEntity, EConditionSpecContextType(local_16.ContextType), local_20)))
        {
            OutErrorMessage = FString().Append("Failed to find proper context entity for condition \"").Append(local_16.ConditionConfig.GetDataName().ToString()).Append("\" in condition group \"").Append(ConditionGroupConfig.GetDataName().ToString()).Append("\" by group context entity \"").Append(ContextEntity.ToString()).Append("\" with context type ").Append(local_16.ContextType);
            return false;
        }
        int local_42 = int(local_16.ConditionConfig.opArrow().LocalConditionType);
        if (local_42 <= 2)
        {
            if (local_42 != 1)
            {
                if (local_42 != 2)
                {
                }
            }
            else
            {
                CastTo local_48;
                FConditionInstanceHandle local_98 = ConditionUtils_Internal::RegisterLocalConditionInstance(local_20, local_48.opCall());
                if (!(local_98.IsValid()))
                {
                    OutErrorMessage = FString().Append("Failed to register local condition instance for \"").Append(local_16.ConditionConfig.GetDataName().ToString()).Append("\"");
                    return false;
                }
                OutConditionInstanceHandles.Add(local_98);
                CastTo local_128;
                if (!(ConditionGroupUtils_Internal::RecursiveRegisterConditionOrConditionGroupInstance(local_20, local_128.opCall(), OutConditionInstanceHandles, OutErrorMessage)))
                {
                    return false;
                }
            }
        }
    }
    return true;
}
FConditionInstanceHandle RegisterConditionGroupInstanceHandle(const TDataObjectPtr<FConditionGroupConfig> &inout ConditionGroupConfig, const TArray<FConditionInstanceHandle> &inout ConditionInstanceHandles)
{
    FConditionInstanceHandle __r;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ModifyOrAdd local_6;
    FCS_LocalConditionGroupManager& local_8 = local_6.opCall();
    if (local_8)
    {
        TArray<int> local_14;
        for (auto& local_28 : ConditionInstanceHandles)
        {
            local_14.Add(local_28.GetLocalConditionInstanceID());
        }
        FConditionInstanceHandle local_58 = FConditionInstanceHandle(ConditionGroupConfig, local_8.AddConditionGroupInstance(ConditionGroupConfig, local_14));
    }
    else
    {
    }
    return __r;
}
void RecursiveGetInnerHandles(const TDataObjectPtr<FConditionGroupConfig> &inout ConditionGroupConfig, const TArray<int> &inout InnerConditionInstanceIds, TArray<FConditionInstanceHandle> &inout OutInnerHandles)
{
    for (auto& local_16 : ConditionGroupConfig.opArrow().ConditionSpecs)
    {
        local_16;
        CastTo local_20;
        TDataObjectPtr<FLocalConditionConfig> local_44 = local_20.opCall();
        if (local_44)
        {
            OutInnerHandles.Add(FConditionInstanceHandle(local_44, InnerConditionInstanceIds[OutInnerHandles.Num()]));
            continue;
        }
        CastTo local_102;
        TDataObjectPtr<FConditionGroupConfig> local_126 = local_102.opCall();
        if (local_126)
        {
            ConditionGroupUtils_Internal::RecursiveGetInnerHandles(local_126, InnerConditionInstanceIds, OutInnerHandles);
            continue;
        }
    }
    return;
}
}

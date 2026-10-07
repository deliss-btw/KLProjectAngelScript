
namespace ConditionUtils
{
int GetTargetValue(const TDataObjectPtr<FConditionConfigBase> &inout ConditionConfig)
{
    CastTo local_28;
    int local_107 = 0;
    if (local_28.opCall())
    {
        CastTo local_82;
        if (local_82.opCall())
        {
            return local_107;
        }
        CastTo local_112;
        if (local_112.opCall())
        {
            return 1;
        }
    }
    CastTo local_164;
    TDataObjectPtr<FLocalConditionConfigBase> local_188 = local_164.opCall();
    if (local_188)
    {
        local_107 = int(local_188.opArrow().LocalConditionType);
        if (local_107 <= 2)
        {
            if (local_107 != 1)
            {
                if (local_107 != 2)
                {
                }
            }
            else
            {
                CastTo local_194;
                return local_194.opCall().opArrow().TargetValue;
            }
        }
        return 0;
    }
    return 0;
}
int GetCurrentValue(const FConditionInstanceHandle &inout ConditionInstance)
{
    if (!(ConditionInstance.IsValid()))
    {
        return 0;
    }
    int local_2 = int(ConditionInstance.GetLocalConditionType());
    if (local_2 <= 2)
    {
        if (local_2 != 1)
        {
            if (local_2 != 2)
            {
            }
        }
        else
        {
            return ConditionUtils_Internal::GetLocalConditionCurrentProgress(ConditionInstance.GetLocalConditionInstanceID());
        }
    }
    return 0;
}
bool IsReached(const FConditionInstanceHandle &inout ConditionInstance)
{
    if (!(ConditionInstance.IsValid()))
    {
        return false;
    }
    TDataObjectPtr<FConditionConfigBase> local_26 = ConditionInstance.GetConditionConfig();
    CastTo local_30;
    return ConditionUtils_Internal::IsValueReached(ConditionUtils::GetCurrentValue(ConditionInstance), ConditionUtils::GetTargetValue(local_30.opCall()), ConditionUtils_Internal::GetCmpType(ConditionInstance.GetConditionConfig()));
}
FConditionInstanceHandle RegisterLocalConditionInstanceForEntity(const FECSEntity &inout ContextEntity, const TDataObjectPtr<FLocalConditionConfigBase> &inout ConditionConfig)
{
    FConditionInstanceHandle __r;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
    }
    else
    {
        if (!(ContextEntity.IsValid()))
        {
        }
        else
        {
            ConditionUtils_Internal::RegisterConditionOrConditionGroupInstance(ContextEntity, ConditionConfig);
        }
    }
    return __r;
}
FConditionInstanceHandle RegisterLocalConditionInstanceForServer(const TDataObjectPtr<FLocalConditionConfigBase> &inout ConditionConfig)
{
    FConditionInstanceHandle __r;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
    }
    else
    {
        ConditionUtils_Internal::RegisterConditionOrConditionGroupInstance(ENTITY_NULL, ConditionConfig);
    }
    return __r;
}
void UnregisterLocalConditionInstance(const FConditionInstanceHandle &inout ConditionInstance)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    else
    {
        int local_3 = int(ConditionInstance.GetLocalConditionType());
        if (local_3 <= 2)
        {
            if (local_3 != 1)
            {
                if (local_3 != 2)
                {
                    return;
                }
            }
            else
            {
                ConditionUtils_Internal::UnregisterLocalConditionInstance(ConditionInstance.GetLocalConditionInstanceID());
                return;
            }
        }
    }
}
void SetLocalConditionValueForEntity(const FECSEntity &inout ContextEntity, const TSubclassOf<ULocalConditionTypeDefineBase> &inout ConditionType, const int Value)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
void SetLocalConditionValueForServer(const TSubclassOf<ULocalConditionTypeDefineBase> &inout ConditionType, const int Value)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
void SetLocalConditionValueForInstance(const FConditionInstanceHandle &inout ConditionInstance, const int Value)
{
    if (!(ConditionInstance.IsValid()))
    {
        return;
    }
    ConditionUtils_Internal::SetLocalConditionValueForInstance(ConditionInstance.GetLocalConditionInstanceID(), Value);
    return;
}
const ULocalConditionTypeDefineBase GetConditionTypeDefine(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig)
{
    if (ConditionConfig)
    {
        TConstRawPtr<FLocalConditionTypeDefineConfigBase> local_8 = FInstancedStruct::GetPtr(ConditionConfig.opArrow().ConditionTypeDefineConfig).opCall();
        if (local_8)
        {
            return local_8.opArrow().ConditionType.GetDefaultObject();
        }
    }
    return nullptr;
}
}
namespace ConditionUtils_Internal
{
int GetLocalConditionCurrentProgress(const int LocalConditionInstanceID)
{
    const FLocalConditionInstanceData& local_2 = ConditionUtils_Internal::FindLocalConditionInstanceData(LocalConditionInstanceID);
    if (local_2.IsValid())
    {
        return local_2.GetCurrentValue();
    }
    return 0;
}
const FLocalConditionInstanceData& FindLocalConditionInstanceData(const int LocalConditionInstanceID)
{
    bool local_1 = ECS::GetRuntimeInfo().IsServer;
    if (local_1)
    {
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        Get local_8;
        if (local_8.opCall())
        {
        }
        else
        {
        }
    }
    else
    {
        FECSWorldPtr local_4_2 = ECS::GetECSWorld();
        Get local_14;
        FECSEntity local_18 = FECSEntity(local_14.opCall().PlayerEntity);
        if (local_18)
        {
            Get local_22;
            const FC_EntityLocalConditionView& local_24 = local_22.opCall();
            if (local_24)
            {
                if (local_24.GetInstanceDatas().Contains(LocalConditionInstanceID))
                {
                    return local_24.GetInstanceDatas()[LocalConditionInstanceID];
                }
            }
            if (FTeamUtils::GetTeamEntityForController(local_18))
            {
                const FC_EntityLocalConditionView& local_24_2 = local_22.opCall();
                if (local_24_2)
                {
                    if (local_24_2.GetInstanceDatas().Contains(LocalConditionInstanceID))
                    {
                        return local_24_2.GetInstanceDatas()[LocalConditionInstanceID];
                    }
                }
            }
        }
        FECSWorldPtr local_4_3 = ECS::GetECSWorld();
        Get local_36;
        const FCS_ServerLocalConditionView& local_38 = local_36.opCall();
        if (local_38)
        {
            if (local_38.GetInstanceDatas().Contains(LocalConditionInstanceID))
            {
                return local_38.GetInstanceDatas()[LocalConditionInstanceID];
            }
        }
    }
    return local_1;
}
void SetLocalConditionValue(const TSet<FECSEntity> &inout ContextEntities, const TSubclassOf<ULocalConditionTypeDefineBase> &inout ConditionType, const int Value)
{
    TSet<FECSEntity> local_20;
    FECSWorldPtr local_22 = ECS::GetECSWorld();
    Modify local_26;
    FCS_LocalConditionManager& local_28 = local_26.opCall();
    if (local_28)
    {
        const FLocalConditionInstanceContainer& local_32 = local_28.FindInstancesByType(ConditionType);
        for (auto local_45 : local_32.GetInstances())
        {
            FECSEntity local_50 = local_28.GetContextEntityByInstanceId(local_45);
            if (ContextEntities.Contains(local_50))
            {
                FLocalConditionInstanceData& local_56 = local_28.ModifyInstanceData(local_45);
                if (local_56.GetCurrentValue() != Value)
                {
                    local_56.SetCurrentValue(Value);
                    local_20.Add(local_50);
                }
            }
        }
        for (auto& local_74 : local_20)
        {
            ConditionUtils_Internal::AssignUpdateTag(local_74);
        }
    }
    return;
}
void SetLocalConditionValueForInstance(const int LocalConditionInstanceId, const int Value)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Modify local_6;
    FCS_LocalConditionManager& local_8 = local_6.opCall();
    if (local_8)
    {
        if (local_8.HasInstance(LocalConditionInstanceId))
        {
            FLocalConditionInstanceData& local_12 = local_8.ModifyInstanceData(LocalConditionInstanceId);
            if (local_12.GetCurrentValue() != Value)
            {
                local_12.SetCurrentValue(Value);
                ConditionUtils_Internal::AssignUpdateTag(local_8.GetContextEntityByInstanceId(LocalConditionInstanceId));
            }
        }
    }
    return;
}
FConditionInstanceHandle RegisterConditionOrConditionGroupInstance(const FECSEntity &inout ContextEntity, const TDataObjectPtr<FLocalConditionConfigBase> &inout ConditionConfig)
{
    FConditionInstanceHandle __r;
    int local_2 = int(ConditionConfig.opArrow().LocalConditionType);
    if (local_2 <= 2)
    {
        if (local_2 != 1)
        {
            if (local_2 != 2)
            {
            }
        }
        else
        {
            CastTo local_8;
            ConditionUtils_Internal::RegisterLocalConditionInstance(ContextEntity, local_8.opCall());
            CastTo local_62;
            ConditionGroupUtils::RegisterConditionGroupInstance(ContextEntity, local_62.opCall());
        }
    }
    XError(ELog(58), FString().Append("Invalid condition config type: ").Append(ConditionConfig.opArrow().ConfigType));
    return __r;
}
FConditionInstanceHandle RegisterLocalConditionInstance(const FECSEntity &inout ContextEntity, const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig)
{
    int local_76 = 0;
    FConditionInstanceHandle __r;
    const ULocalConditionTypeDefineBase local_2 = ConditionUtils::GetConditionTypeDefine(ConditionConfig);
    if (local_2 != nullptr)
    {
        TArray<FString> local_10;
        local_2.ValidateConditionConfig(ConditionConfig, local_10);
        for (auto& local_24 : local_10)
        {
            XError(ELog(58), FString().Append("Validate condition config failed for ").Append(local_2.GetName()).Append(" in table ").Append(ConditionConfig.GetRoot().GetName()).Append(" row \"").Append(ConditionConfig.GetDataName()).Append("\": ").Append(local_24));
        }
        if (!(local_10.IsEmpty()))
        {
        }
        else
        {
        }
    }
    else
    {
        XError(ELog(58), FString().Append("Condition type define not found for condition config \"").Append(ConditionConfig.GetDataName()).Append("\" in table \"").Append(ConditionConfig.GetRoot().GetName()).Append("\""));
    }
    FECSWorldPtr local_70 = ECS::GetECSWorld();
    int local_77 = local_76.CreateInstance(ContextEntity, ConditionConfig);
    FECSWorldPtr local_70_2 = ECS::GetECSWorld();
    ModifyOrAdd local_82;
    local_82.opCall().NewlyCreatedInstances.Add(local_77);
    ConditionUtils_Internal::AssignUpdateTag(ContextEntity);
    FConditionInstanceHandle local_68 = FConditionInstanceHandle(ConditionConfig, local_77);
    return __r;
}
void UnregisterLocalConditionInstance(const int LocalConditionInstanceID)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Modify local_6;
    FCS_LocalConditionManager& local_8 = local_6.opCall();
    if (local_8)
    {
        ConditionUtils_Internal::AssignUpdateTag(local_8.GetContextEntityByInstanceId(LocalConditionInstanceID));
        local_8.RemoveInstance(LocalConditionInstanceID);
        FECSWorldPtr local_50 = ECS::GetECSWorld();
        FLocalConditionInstance local_48;
        ModifyOrAdd local_54;
        local_54.opCall().RemovedInstances.Add(local_48);
    }
    return;
}
bool IsValueReached(const int CurrentValue, const int TargetValue, const ECondCmpType CmpType)
{
    bool local_3 = false;
    switch (int(CmpType))
    {
    case 1:
    {
        return (CurrentValue == TargetValue);
    }
    case 2:
    {
        return (CurrentValue != TargetValue);
    }
    case 3:
    {
        return (CurrentValue > TargetValue);
    }
    case 4:
    {
        return (CurrentValue >= TargetValue);
    }
    case 5:
    {
        return (CurrentValue < TargetValue);
    }
    case 6:
    {
        return (CurrentValue <= TargetValue);
    }
    case 7:
    {
        return (CurrentValue == TargetValue);
    }
    case 8:
    {
        return (CurrentValue != TargetValue);
    }
    default:
    {
        XError(ELog(58), FString().Append("Invalid cmp type: ").Append(CmpType));
        local_3 = false;
    }
    }
    return local_3;
}
ECondCmpType GetCmpType(const TDataObjectPtr<FConditionConfigBase> &inout ConditionConfig)
{
    int local_2 = int(ConditionConfig.opArrow().ConfigType);
    if (local_2 <= 2)
    {
        if (local_2 != 1)
        {
            if (local_2 != 2)
            {
            }
            else
            {
                CastTo local_8;
                return ConditionUtils_Internal::GetCmpType(local_8.opCall());
            }
        }
        else
        {
            CastTo local_38;
            return ConditionUtils_Internal::GetCmpType(local_38.opCall());
        }
    }
    return ECondCmpType(0);
}
ECondCmpType GetCmpType(const TDataObjectPtr<FLocalConditionConfigBase> &inout ConditionConfig)
{
    int local_2 = int(ConditionConfig.opArrow().LocalConditionType);
    if (local_2 <= 2)
    {
        if (local_2 != 1)
        {
            if (local_2 != 2)
            {
            }
        }
        else
        {
            CastTo local_8;
            return ECondCmpType(local_8.opCall().opArrow().CompareType);
        }
    }
    return ECondCmpType(0);
}
ECondCmpType GetCmpType(const TDataObjectPtr<FServerConditionConfigBase> &inout ConditionConfig)
{
    CastTo local_4;
    TDataObjectPtr<FConditionConfig> local_28 = local_4.opCall();
    if (local_28)
    {
        return local_28.opArrow().CmpType;
    }
    return ECondCmpType(0);
}
void AssignUpdateTag(const FECSEntity &inout ContextEntity)
{
    if ((ContextEntity == ENTITY_NULL))
    {
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        FCS_ServerLocalConditionUpdateTag local_10;
        Assign local_8;
        local_8.opCall(local_10);
        return;
    }
    FC_EntityLocalConditionUpdateTag local_16;
    Assign local_14;
    local_14.opCall(local_16);
    return;
}
}

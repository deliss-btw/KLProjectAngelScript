

// NOTE: class defaults are not authored in this module: FConditionTeleporterActivatedConfig (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

class UConditionTeleporterActivated : ULocalConditionTypeDefineBase
{
    UConditionTeleporterActivated()
    {
        super();
        return;
    }
    void OnConditionRegistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        if (::TeleporterActivatedConditionUtils::HasNoActivatableTeleporter(FECSEntity(GetContextEntity())))
        {
            FConditionInstanceHandle local_32;
            FConditionInstanceHandle local_58 = ConditionInstance.GetHandle();
            ::ConditionUtils::SetLocalConditionValueForInstance(local_32, ::ConditionUtils::GetTargetValue(local_32.GetConditionConfig()));
            return;
        }
        FConditionInstanceHandle local_58_2 = ConditionInstance.GetHandle();
        FECSWorldPtr local_86 = ECS::GetECSWorld();
        ModifyOrAdd local_90;
        local_90.opCall().ConditionInstances.Add(local_58_2);
        return;
    }
    void OnConditionUnregistered(const FLocalConditionInstance &inout ConditionInstance) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_TeleporterActivatedConditionManager& local_8 = local_6.opCall();
        if (local_8)
        {
            FConditionInstanceHandle local_36 = ConditionInstance.GetHandle();
            if (local_8.ConditionInstances.IsEmpty())
            {
                FECSWorldPtr local_40 = ECS::GetECSWorld();
                Remove local_44;
                local_44.opCall();
            }
        }
        return;
    }
    void ValidateConditionConfig(const TDataObjectPtr<FLocalConditionConfig> &inout ConditionConfig, TArray<FString> &inout OutErrorMessages) const
    {
        if (ConditionConfig.opArrow().TargetValue <= 0)
        {
            OutErrorMessages.Add("TargetValue must be greater than 0");
        }
        return;
    }
}

struct FConditionTeleporterActivatedConfig : FLocalConditionTypeDefineConfigBase
{
    FLocalConditionTypeDefineConfigBase _base_FLocalConditionTypeDefineConfigBase;

    FConditionTeleporterActivatedConfig()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

namespace TeleporterActivatedConditionUtils
{
bool IsActivatingPlayerInScope(const FECSEntity &inout ContextEntity, const FECSEntity &inout ActivatingPlayerEntity)
{
    if (!(ContextEntity.IsValid()))
    {
        return true;
    }
    Get local_6;
    const FC_TeamInfo& local_8 = local_6.opCall();
    if (local_8)
    {
        for (auto& local_22 : local_8.GetMembers())
        {
            if ((FASCommonUtils::GetUniquePlayerEntity(local_22.GetEntity()) == ActivatingPlayerEntity))
            {
                return true;
            }
        }
        return false;
    }
    return (FASCommonUtils::GetUniquePlayerEntity(ContextEntity) == ActivatingPlayerEntity);
}
bool HasNoActivatableTeleporter(const FECSEntity &inout ContextEntity)
{
    if (!(ContextEntity.IsValid()))
    {
        TArray<FECSEntity> local_6 = FGameUtils::GetAllPlayerControllerEntities(true);
        if (local_6.IsEmpty())
        {
            return false;
        }
        for (auto& local_24 : local_6)
        {
            if (!(TeleporterUtils::AreAllMapVisibleTeleportersActive(local_24)))
            {
                return false;
            }
        }
        return true;
    }
    Get local_28;
    const FC_TeamInfo& local_30 = local_28.opCall();
    if (local_30)
    {
        if (local_30.GetMembers().IsEmpty())
        {
            return false;
        }
        for (auto& local_44 : local_30.GetMembers())
        {
            if (!(TeleporterUtils::AreAllMapVisibleTeleportersActive(local_44.GetEntity())))
            {
                return false;
            }
        }
        return true;
    }
    return TeleporterUtils::AreAllMapVisibleTeleportersActive(ContextEntity);
}
}

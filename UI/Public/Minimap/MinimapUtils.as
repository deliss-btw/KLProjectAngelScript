
namespace MinimapUtils
{
TDataObjectPtr<FMinimapDisplayConfig> GetCurrentMinimapDisplayConfig()
{
    TDataObjectPtr<FLevelInfoConfig> local_26 = FLevelUtils::GetCurrentLevelInfoConfig(GetCurrentWorld());
    if (local_26)
    {
        if (local_26.opArrow().GetMinimapDisplayConfigOverride())
        {
            return local_26.opArrow().GetMinimapDisplayConfigOverride();
        }
        if (local_26.opArrow().GetMapConfig())
        {
            return local_26.opArrow().GetMapConfig().opArrow().GetMinimapDisplayConfig();
        }
    }
    else
    {
    }
    return TDataObjectPtr<FMinimapDisplayConfig>();
}
FVector2D GamePositionToMapPosition(const FVector &inout Vector)
{
    return FVector2D(Vector.X, Vector.Y);
}
bool GetEntityMapPosition(const FECSEntity &inout Entity, FVector2D &inout OutWorldPosition)
{
    if (!(FASCommonUtils::GetControlledPawnEntity(Entity)))
    {
        return false;
    }
    FVector local_16;
    Get local_20;
    const FC_Transform& local_22 = local_20.opCall();
    if (local_22)
    {
        local_16 = local_22.GetPosition();
    }
    else
    {
        Get local_26;
        const FC_PrefabPendingInit& local_28 = local_26.opCall();
        if (local_28)
        {
            local_16 = local_28.GetPosition();
        }
        else
        {
            return false;
        }
    }
    OutWorldPosition = MinimapUtils::GamePositionToMapPosition(local_16);
    return true;
}
bool IsValidHandle(const FMinimapIconHandle &inout Handle)
{
    UMinimapIconRegistry local_4;
    if (local_4 != nullptr)
    {
        return local_4.IconExists(Handle);
    }
    return false;
}
void UnregisterIcon(const FMinimapIconHandle &inout Handle)
{
    UMinimapIconRegistry local_4;
    if (local_4 != nullptr)
    {
        local_4.RemoveIcon(Handle);
    }
    return;
}
void UpdateIconPosition(const FMinimapIconHandle &inout Handle, const FVector2D &inout WorldPosition)
{
    UMinimapIconRegistry local_4;
    if (local_4 != nullptr)
    {
        if (!(local_4.IconExists(Handle)))
        {
            return;
        }
        FMinimapIconInfo local_48 = local_4.GetIconInfo(Handle);
        if ((FVector2D(local_48.WorldPosition) == WorldPosition))
        {
            return;
        }
        local_48.WorldPosition = WorldPosition;
        local_4.SetIconInfo(Handle, local_48);
    }
    return;
}
void UpdateIconInfo(const FMinimapIconHandle &inout Handle, const FMinimapIconInfo &inout IconInfo)
{
    UMinimapIconRegistry local_4;
    if (local_4 != nullptr)
    {
        local_4.SetIconInfo(Handle, IconInfo);
    }
    return;
}
FMinimapIconInfo GetIconInfo(const FMinimapIconHandle &inout Handle)
{
    UMinimapIconRegistry local_4;
    if (local_4 != nullptr)
    {
        return local_4.GetIconInfo(Handle);
    }
    return FMinimapIconInfo();
}
void SetIconNeverHide(const FMinimapIconHandle &inout Handle, const bool bNeverHide)
{
    UMinimapIconRegistry local_4;
    if (local_4 != nullptr)
    {
        if (!(local_4.IconExists(Handle)))
        {
            return;
        }
        FMinimapIconInfo local_48 = local_4.GetIconInfo(Handle);
        if (!(local_48.RuntimeInfo.bNeverHide) != !(bNeverHide))
        {
            local_48.RuntimeInfo.bNeverHide = bNeverHide;
            local_4.SetIconInfo(Handle, local_48);
        }
    }
    return;
}
bool IsEntityMinimapIconVisibleByPlayer(const FECSEntityId &inout EntityID, const FECSEntity &inout Player)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_LocalPlayer& local_8 = local_6.opCall();
    if (local_8)
    {
        if ((FECSEntity(local_8.PlayerEntity) == Player))
        {
            return MinimapUtils::IsEntityMinimapIconVisibleByLocalPlayer(EntityID);
        }
    }
    return false;
}
bool IsEntityMinimapIconVisibleByLocalPlayer(const FECSEntityId &inout EntityID)
{
    return UScriptAsToCppModelFunctionRouter::Get().OnIsEntityMinimapIconVisibleByLocalPlayer.Execute(EntityID);
}
FMinimapIconHandle AddSystemIcon(const FMinimapIconInfo &inout IconInfo)
{
    UMinimapGlobalConfig local_4 = MinimapUtils::GetMinimapGlobalConfig();
    if (local_4 != nullptr)
    {
        UMinimapIconRegistry local_10 = MinimapUtils::GetIconRegistry(local_4.SystemIconRegistry);
        if (local_10 != nullptr)
        {
            return local_10.AddIcon(IconInfo);
        }
    }
    return FMinimapIconHandle();
}
UMinimapGlobalConfig GetMinimapGlobalConfig()
{
    return GetGameplaySettings<UMinimapGlobalConfig>();
}
UMinimapIconRegistry GetIconRegistry(const TSubclassOf<UMinimapIconRegistryAsset> &inout IconRegistryAsset)
{
    if (IconRegistryAsset.IsValid())
    {
        return IconRegistryAsset.GetDefaultObject().GetIconRegistry(__GetWorldContext());
    }
    return nullptr;
}
TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> GetMinimapIconSimplifiedDisplayRule(const TDataObjectPtr<FMinimapIconConfig> &inout IconSettings)
{
    if (!(IconSettings) || !(IconSettings.opArrow().bEnableSimplifiedDisplay))
    {
        return TDataObjectPtr<FMinimapIconSimplifiedDisplayRule>();
    }
    if (IconSettings.opArrow().GetCustomSimplifiedDisplayRule())
    {
        return IconSettings.opArrow().GetCustomSimplifiedDisplayRule();
    }
    UMinimapGlobalConfig local_54 = MinimapUtils::GetMinimapGlobalConfig();
    if (local_54 != nullptr)
    {
        return local_54.DefaultMinimapIconSimplifiedDisplayRule;
    }
    return local_26;
}
FMinimapIconHandle FindRegisteredEntityMinimapIconHandle(const FECSEntityId &inout EntityID)
{
    return UScriptAsToCppModelFunctionRouter::Get().OnFindRegisteredEntityMinimapIconHandle.Execute(EntityID);
}
}

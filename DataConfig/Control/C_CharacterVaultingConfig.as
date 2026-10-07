
namespace __INTENRAL_FC_CharacterVaultingConfig_NS
{
    const TECSComponentDerivedPtr<FC_CharacterVaultingConfig> DerivedPtr = TECSComponentDerivedPtr<FC_CharacterVaultingConfig>();
    const FC_CharacterVaultingConfig DefaultValue = FC_CharacterVaultingConfig();

}
struct FCharacterVaultProbePerHeightLevelConfig
{
    UPROPERTY()
    bool bDisabled = false;
    UPROPERTY()
    float32 AuxHeightOffset = -1.0f;
    UPROPERTY()
    float32 MoveStopDistance = -1.0f;
    UPROPERTY()
    float32 ForwardCheckDistance = -1.0f;
    UPROPERTY()
    FFPTime KeepSteerTime = -1.0;


}

struct FCharacterVaultProbeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    float32 MinVaultHeight = 30.0f;
    UPROPERTY()
    float32 MaxUpstairsHeight = 200.0f;
    UPROPERTY()
    float32 MaxVaultHeight = 200.0f;
    UPROPERTY()
    float32 MaxDropAfterVault = -1.0f;
    UPROPERTY()
    float32 GapHeightForVault = 30.0f;
    UPROPERTY()
    float32 GapWidthForVault = 200.0f;
    UPROPERTY()
    float32 MaxVaultWidth = 150.0f;
    UPROPERTY()
    float32 MinStandableWidth = 30.0f;
    UPROPERTY()
    float32 ForwardCheckDistance = 100.0f;
    UPROPERTY()
    float32 ForwardRaycastInterval = 30.0f;
    UPROPERTY()
    float32 DownwardRaycastInterval = 15.0f;
    UPROPERTY()
    float32 ProbeInterval = 0.1f;
    UPROPERTY()
    float32 MinWallRunStartHeight = 130.0f;
    UPROPERTY()
    float32 MaxWallRunStartHeight = 180.0f;
    UPROPERTY()
    float32 WallRunAttemptHeight = 200.0f;
    UPROPERTY()
    float32 MaxAngleBetweenInputAndFacingDir = 30.0f;
    UPROPERTY()
    float32 MaxAngleToWallNormalForVault = 45.0f;
    UPROPERTY()
    FFPTime KeepSteerTimeForVault = 0.3;
    UPROPERTY()
    float32 MaxAngleToWallNormalForWallRun = 45.0f;
    UPROPERTY()
    FFPTime KeepSteerTimeForWallRun = 0.3;
    UPROPERTY()
    TArray<int> UpstairsLevelSeparationHeights;
    UPROPERTY()
    TArray<FCharacterVaultProbePerHeightLevelConfig> UpstairsPerHeightLevelConfigs;
    UPROPERTY()
    TArray<int> VaultLevelSeparationHeights;
    UPROPERTY()
    float32 LeapOffForwardCheckDistance = -1.0f;
    UPROPERTY()
    float32 LeapOffStartHeight = -1.0f;
    UPROPERTY()
    TArray<int> LeapOffLevelSeparationHeights;


    const TArray<int> GetLevelSeparationHeights(const EVaultActionType VaultActionType) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const TArray<int> __r; return __r;
    }
    float32 GetMaxReachUpHeight() const property
    {
        return FMath::Max(this.MaxUpstairsHeight, this.MaxVaultHeight);
    }
}

struct FC_CharacterVaultingConfig : FECSComponent
{
    UPROPERTY()
    bool bCanWallRun = true;
    UPROPERTY()
    bool bEnableWallRunByDefault = false;
    UPROPERTY()
    bool bCanMoveUpstairs = true;
    UPROPERTY()
    bool bEnableMoveUpstairsByDefaut = true;
    UPROPERTY()
    bool bCanVaultOver = true;
    UPROPERTY()
    bool bEnableVaultOverByDefault = true;
    UPROPERTY()
    FDataObjectPtr VaultProbeOnGround;
    UPROPERTY()
    FDataObjectPtr VaultProbeOnGroundSprint;
    UPROPERTY()
    FDataObjectPtr VaultProbeOnWall;
    UPROPERTY()
    FDataObjectPtr VaultProbeInAir;


    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        FC_CharacterVaulting local_76;
        Assign local_4;
        local_4.opCall(local_76);
        FC_CharacterVaultInfoCache local_94;
        Assign local_80;
        local_80.opCall(local_94);
        return;
    }
    bool GetVaultProbeConfig(const EVaultStartState VaultStartState, FCharacterVaultProbeConfig &inout VaultProbeConfig) const
    {
        if (this.GetVaultProbeConfig(EVaultStartState(VaultStartState)))
        {
            return true;
        }
        return false;
    }
    TDataObjectPtr<FCharacterVaultProbeConfig> GetVaultProbeConfig(const EVaultStartState VaultStartState) const
    {
        switch (int(VaultStartState))
        {
        case 0:
        {
            return TDataObjectPtr<FCharacterVaultProbeConfig>(this.VaultProbeOnGround);
        }
        case 1:
        {
            return TDataObjectPtr<FCharacterVaultProbeConfig>(this.VaultProbeOnGroundSprint);
        }
        case 2:
        {
            return TDataObjectPtr<FCharacterVaultProbeConfig>(this.VaultProbeOnWall);
        }
        case 3:
        {
            return TDataObjectPtr<FCharacterVaultProbeConfig>(this.VaultProbeInAir);
        }
        }
        return TDataObjectPtr<FCharacterVaultProbeConfig>(nullptr);
    }
    bool IsValidState(const EVaultStartState VaultStartState) const
    {
        return (int(VaultStartState) == 0 || (int(VaultStartState) == 1) || (int(VaultStartState) == 2) || (int(VaultStartState) == 3));
    }
}

namespace ECSFunc_FC_CharacterVaultingConfig
{
UFUNCTION()
bool HasCharacterVaultingConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaultingConfig);
}
FC_CharacterVaultingConfig& AssignCharacterVaultingConfig(const FECSEntity &inout Entity, const FC_CharacterVaultingConfig &inout DefaultValue = FC_CharacterVaultingConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaultingConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCharacterVaultingConfig_BP(const FECSEntity &inout Entity, const FC_CharacterVaultingConfig &inout DefaultValue = FC_CharacterVaultingConfig())
{
    ECSFunc_FC_CharacterVaultingConfig::AssignCharacterVaultingConfig(Entity, DefaultValue);
    return;
}
FC_CharacterVaultingConfig& ModifyCharacterVaultingConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaultingConfig));
    return local_12.GetComp();
}
FC_CharacterVaultingConfig& ModifyOrAddCharacterVaultingConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaultingConfig));
    return local_12.GetComp();
}
const FC_CharacterVaultingConfig& GetCharacterVaultingConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaultingConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_CharacterVaultingConfig GetCharacterVaultingConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CharacterVaultingConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_CharacterVaultingConfig::GetCharacterVaultingConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CharacterVaultingConfig GetDefaultedCharacterVaultingConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CharacterVaultingConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaultingConfig);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_CharacterVaultingConfig GetDefaultedCharacterVaultingConfig_BP(const FECSEntity &inout Entity)
{
    FC_CharacterVaultingConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveCharacterVaultingConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CharacterVaultingConfig);
}
}
FECSMonitorRuntimeView __GetMonitorCharacterVaultingConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CharacterVaultingConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterVaultingConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CharacterVaultingConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterVaultingConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CharacterVaultingConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterVaultingConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CharacterVaultingConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterVaultingConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CharacterVaultingConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorCharacterVaultingConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CharacterVaultingConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterVaultingConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CharacterVaultingConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterVaultingConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CharacterVaultingConfig, bFixedFrame, Details);
    return;
}

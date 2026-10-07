

class USFXSettings : UDataAsset
{
    UPROPERTY()
    bool bEnableNewFootStepSFX;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> LandedAudioEvent;
    UPROPERTY()
    TSoftObjectPtr<UAkAudioEvent> MountLandedAudioEvent;
    UPROPERTY()
    TSoftObjectPtr<UAkRtpc> PerspectiveRtpc;
    UPROPERTY()
    TMap<EPhysicalSurface, TSoftObjectPtr<UAkSwitchValue>> PhysMaterialSwitchMap;
    UPROPERTY()
    TSoftObjectPtr<UAkSwitchValue> DefaultPhysMaterialSwitch;
    UPROPERTY()
    TArray<TSoftObjectPtr<UAkSwitchValue>> BodySizeSwitch;
    UPROPERTY()
    TArray<TSoftObjectPtr<UAkSwitchValue>> LandedStrengthSwitch;

    USFXSettings()
    {
        this.bEnableNewFootStepSFX = false;
        this.BodySizeSwitch.SetNum(5);
        this.LandedStrengthSwitch.SetNum(5);
        return;
    }
}

namespace ImpactFXUtils
{
void HandleEntityLandedSound(const FECSEntity &inout EventSender, const FEntityLandedInfo &inout LandedInfo)
{
    USFXSettings local_4 = UCombatGlobalSettings::Get().SFXSettings;
    if (local_4 == nullptr)
    {
        return;
    }
    FVector local_12;
    FVector local_18;
    FQuat4f local_24;
    bool local_25 = false;
    FName local_90 = FSceneInteractUtils::GetLineTraceSurfaceName(local_25, local_12, local_18, local_24, EventSender, FImpactFXUtils::ConvertLandedInfo2SurfaceContanctInfo(LandedInfo));
    TSoftObjectPtr<UAkSwitchValue> local_100 = local_4.DefaultPhysMaterialSwitch;
    if (local_4.PhysMaterialSwitchMap.Find(FGamePhysicsUtils::GetPhysicalSurfaceType(local_90)))
    {
    }
    FGameAudioUtils::SetAudioSwitch(local_100, EventSender, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
    FGameAudioUtils::SetAudioSwitch(local_4.LandedStrengthSwitch[int(LandedInfo.GetLandedStrengthLevel())], EventSender, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
    FQuat4f local_120;
    FName local_124 = FImpactFXUtils::GetImpactRootBoneName(EventSender, LandedInfo.GetRootBoneName());
    if (int(LandedInfo.GetImpactRotationType()) == 0)
    {
        local_120 = FTransformUtils::GetSocketRotationInActor(EventSender, local_124);
    }
    else
    {
        local_120 = FQuat4f(local_18.ToOrientationQuat());
    }
    FRotator3f local_146 = local_120.Rotator();
    Has local_150;
    bool local_5 = local_150.opCall();
    if (local_5)
    {
    }
    else
    {
    }
    FGameAudioUtils::PlayEventAtLocation(TSoftObjectPtr<UAkAudioEvent>(), EventSender, FLoadEventCallback(), local_12, local_146.Quaternion(), FGameAudioUtils::GetCachedAudioWorld(), false, true);
    return;
}
void HandleAttackImpact(const FCE_ImpactFXEvent &inout Event)
{
    UGamePhysicalMaterial local_20;
    USFXSettings local_4 = UCombatGlobalSettings::Get().SFXSettings;
    if (local_4 == nullptr)
    {
        return;
    }
    TSoftObjectPtr<UAkSwitchValue> local_16 = local_4.DefaultPhysMaterialSwitch;
    if (local_20 != nullptr)
    {
        int local_21;
        local_21 = int(local_20.SurfaceType);
        if (local_4.PhysMaterialSwitchMap.Find(EPhysicalSurface(local_21)))
        {
        }
    }
    FGameAudioUtils::SetAudioSwitch(local_16, Event.Sender, FOnLoadEventCallbackWithEntity(), true, FGameAudioUtils::GetCachedAudioWorld());
    FGameAudioUtils::GetCachedAudioWorld();
    Event.ImpactRotation.Quaternion();
    FLoadEventCallback local_40 = FLoadEventCallback();
    return;
}
}


namespace SimpleDestructibleUtils
{
    const FConsoleVariable CVar_SimpleDestructible_UseManagerOnModify = FConsoleVariable();

}
struct FSimpleDestructibleBreakResult
{
    UPROPERTY()
    bool bIsSimpleDestructible = false;
    UPROPERTY()
    bool bWasAlreadyDestroyed = false;
    UPROPERTY()
    bool bBroken = false;
    UPROPERTY()
    FSimpleDestructibleCacheKey_FoliageISM FoliageISMKey;
    UPROPERTY()
    FSimpleDestructibleCacheKey_FoliageISkM FoliageISkMKey;
    UPROPERTY()
    FSimpleDestructibleCacheKey_StaticMesh StaticMeshKey;


}

namespace SimpleDestructibleUtils
{
bool IsDestroyed(const FCS_SimpleDestructibleManager &inout Manager, const FSimpleDestructibleCacheKey_FoliageISM &inout Key)
{
    return Manager.GetStateMap_FoliageISM().Contains(Key);
}
bool IsDestroyed(const FCS_SimpleDestructibleManager &inout Manager, const FSimpleDestructibleCacheKey_FoliageISkM &inout Key)
{
    return Manager.GetStateMap_FoliageISkM().Contains(Key);
}
bool IsDestroyed(const FCS_SimpleDestructibleManager &inout Manager, const FSimpleDestructibleCacheKey_StaticMesh &inout Key)
{
    return Manager.GetStateMap_StaticMesh().Contains(Key);
}
void ServerProcessSimpleDestructible_FoliageISM(const FSimpleDestructibleCacheKey_FoliageISM &inout Key, const FTransform &inout Transform, FCS_SimpleDestructibleManager &inout Manager, FCS_SimpleDestructibleServerCache &inout ServerCache, const USimpleDestructibleStaticMeshAssetUserData SimpleDestructibleAUD, const UHierarchicalInstancedStaticMeshComponent ISMPtr, const EImpactType ImpactType, const EImpactStrength ImpactStrength, const FVector &inout ForceDirection)
{
    bool local_1 = !(Manager.GetStateMap_FoliageISM().Contains(Key));
    FSimpleDestructibleCacheStateValue local_10;
    local_10.SetImpactType(EImpactType(ImpactType));
    local_10.SetImpactStrength(EImpactStrength(ImpactStrength));
    local_10.SetForceDirection(ForceDirection);
    Manager.GetModify_StateMap_FoliageISM().Add(Key, local_10);
    FTransform local_36;
    ISMPtr.GetInstanceTransform(Key.GetInstanceId(), local_36, true);
    FTransform local_64 = Transform;
    local_64.SetScale3D(FVector::ZeroVector);
    ISMPtr.UpdateInstanceTransform(Key.GetInstanceId(), local_64, true, true, true);
    UStaticMesh local_68 = SimpleDestructibleAUD.RemainStaticMeshObject;
    if (local_68 != nullptr)
    {
        bool local_66 = !(ServerCache.RemainISMIndexMap_FoliageISM.Contains(Key));
        FSimpleDestructibleCacheKey_FoliageISM local_71;
        FSimpleDestructibleUtils::CreateISM(local_71, local_68, ISMPtr.GetOwner(), local_36);
    }
    return;
}
void ServerProcessSimpleDestructible_FoliageISkM(const FSimpleDestructibleCacheKey_FoliageISkM &inout Key, const FTransform &inout Transform, FCS_SimpleDestructibleManager &inout Manager, FCS_SimpleDestructibleServerCache &inout ServerCache, const USimpleDestructibleStaticMeshAssetUserData SimpleDestructibleAUD, const UInstancedSkinnedMeshComponent ISkMPtr, const EImpactType ImpactType, const EImpactStrength ImpactStrength, const FVector &inout ForceDirection)
{
    bool local_1 = !(Manager.GetStateMap_FoliageISkM().Contains(Key));
    FSimpleDestructibleCacheStateValue local_10;
    local_10.SetImpactType(EImpactType(ImpactType));
    local_10.SetImpactStrength(EImpactStrength(ImpactStrength));
    local_10.SetForceDirection(ForceDirection);
    Manager.GetModify_StateMap_FoliageISkM().Add(Key, local_10);
    FTransform local_36;
    FSimpleDestructibleUtils::GetInstanceSkinnedMeshTransform(ISkMPtr, Key.GetInstanceId(), local_36, true);
    FTransform local_64 = Transform;
    local_64.SetScale3D(FVector::ZeroVector);
    FSimpleDestructibleUtils::UpdateInstanceSkinnedMeshTransform(ISkMPtr, Key.GetInstanceId(), local_64, true, true, true);
    UStaticMesh local_68 = SimpleDestructibleAUD.RemainStaticMeshObject;
    if (local_68 != nullptr)
    {
        bool local_66 = !(ServerCache.RemainISMIndexMap_FoliageISkM.Contains(Key));
        FSimpleDestructibleCacheKey_FoliageISkM local_71;
        FSimpleDestructibleUtils::CreateISM(local_71, local_68, ISkMPtr.GetOwner(), local_36);
    }
    return;
}
void ServerProcessSimpleDestructible_StaticMesh(const FSimpleDestructibleCacheKey_StaticMesh &inout Key, const FTransform &inout Transform, FCS_SimpleDestructibleManager &inout Manager, FCS_SimpleDestructibleServerCache &inout ServerCache, const USimpleDestructibleStaticMeshAssetUserData SimpleDestructibleAUD, const UStaticMeshComponent SMPtr, const EImpactType ImpactType, const EImpactStrength ImpactStrength, const FVector &inout ForceDirection)
{
    bool local_1 = !(Manager.GetStateMap_StaticMesh().Contains(Key));
    FSimpleDestructibleCacheStateValue local_10;
    local_10.SetImpactType(EImpactType(ImpactType));
    local_10.SetImpactStrength(EImpactStrength(ImpactStrength));
    local_10.SetForceDirection(ForceDirection);
    Manager.GetModify_StateMap_StaticMesh().Add(Key, local_10);
    FTransform local_60 = SMPtr.GetWorldTransform();
    SMPtr.SetCollisionEnabled(ECollisionEnabled(0));
    SMPtr.SetVisibility(false, false);
    UStaticMesh local_64 = SimpleDestructibleAUD.RemainStaticMeshObject;
    if (local_64 != nullptr)
    {
        bool local_62 = !(ServerCache.RemainISMIndexMap_StaticMesh.Contains(Key));
        FSimpleDestructibleCacheKey_StaticMesh local_67;
        FSimpleDestructibleUtils::CreateISM(local_67, local_64, SMPtr.GetOwner(), local_60);
    }
    return;
}
bool ServerTryBreakFromHitResult(const FECSEntity &inout EventSenderEntity, const UPrimitiveComponent HitComponent, const int HitItemIndex, const EDestructibleClassLevel DamageLevel, const bool bUseAttackDamageLevel, const EImpactType ImpactType, const EImpactStrength ImpactStrength, const FVector &inout ForceDirection, FSimpleDestructibleBreakResult &inout OutResult)
{
    UStaticMesh local_8;
    UClass local_12;
    USimpleDestructibleStaticMeshAssetUserData local_20;
    int local_55 = 0;
    int local_98 = 0;
    int local_104 = 0;
    ASimpleDestructibleStaticMeshActor local_150;
    OutResult.bIsSimpleDestructible = false;
    OutResult.bWasAlreadyDestroyed = false;
    OutResult.bBroken = false;
    UHierarchicalInstancedStaticMeshComponent local_6 = (Cast<UHierarchicalInstancedStaticMeshComponent>(HitComponent));
    if (local_6 != nullptr)
    {
        Get local_52;
        Has local_48;
        local_8 = local_6.GetStaticMesh();
        if (local_8 == nullptr)
        {
            return false;
        }
        local_20 = (Cast<USimpleDestructibleStaticMeshAssetUserData>(local_8.GetAssetUserData(TSubclassOf<UAssetUserData>(local_12), false)));
        if (local_20 == nullptr)
        {
            return false;
        }
        OutResult.bIsSimpleDestructible = true;
        FSimpleDestructibleCacheKey_FoliageISM local_32;
        local_32.SetISM(TSoftObjectPtr<UHierarchicalInstancedStaticMeshComponent>(local_6));
        local_32.SetInstanceId(HitItemIndex);
        OutResult.FoliageISMKey = local_32;
        FECSWorldPtr local_44 = ECS::GetECSWorld();
        bool local_1_3 = local_48.opCall();
        if (!(local_1_3))
        {
            local_1_3 = false;
        }
        else
        {
            FECSWorldPtr local_44_2 = ECS::GetECSWorld();
            local_1_3 = SimpleDestructibleUtils::IsDestroyed(local_52.opCall(), local_32);
        }
        if (local_1_3)
        {
            OutResult.bWasAlreadyDestroyed = true;
            return true;
        }
        if (bUseAttackDamageLevel)
        {
        }
        else
        {
        }
        if (int(DamageLevel) < local_55)
        {
            return true;
        }
        FFPTime local_64 = FFPTime(-1);
        FECSWorldPtr local_44_3 = EventSenderEntity.GetWorld();
        SendEvent local_62;
        FCE_SimpleDestructibleHitEvent_FoliageISM& local_66 = local_62.opCall(ENTITY_NULL, local_64);
        if (local_66)
        {
            local_66.ReceiverComponent = local_6;
            local_66.ItemIndex = HitItemIndex;
            local_66.ImpactType = ImpactType;
            local_66.ImpactStrength = ImpactStrength;
            local_66.ForceDirection = ForceDirection;
            local_66.DestructibleDamageLevel = DamageLevel;
        }
        FTransform local_92;
        local_6.GetInstanceTransform(HitItemIndex, local_92, true);
        FECSWorldPtr local_44_4 = ECS::GetECSWorld();
        FECSWorldPtr local_44_5 = ECS::GetECSWorld();
        SimpleDestructibleUtils::ServerProcessSimpleDestructible_FoliageISM(local_32, local_92, local_98, local_104, local_20, local_6, EImpactType(ImpactType), EImpactStrength(ImpactStrength), ForceDirection);
        OutResult.bBroken = true;
        return true;
    }
    UInstancedSkinnedMeshComponent local_108 = (Cast<UInstancedSkinnedMeshComponent>(HitComponent));
    if (local_108 != nullptr)
    {
        bool local_53;
        Get local_52;
        Has local_48;
        USkinnedAsset local_112 = local_108.GetSkinnedAsset();
        if (local_112 == nullptr)
        {
            return false;
        }
        local_20 = (Cast<USimpleDestructibleStaticMeshAssetUserData>(local_112.GetAssetUserData(TSubclassOf<UAssetUserData>(local_12), false)));
        if (local_20 == nullptr)
        {
            return false;
        }
        OutResult.bIsSimpleDestructible = true;
        FSimpleDestructibleCacheKey_FoliageISkM local_124;
        local_124.SetISkM(TSoftObjectPtr<UInstancedSkinnedMeshComponent>(local_108));
        local_124.SetInstanceId(HitItemIndex);
        OutResult.FoliageISkMKey = local_124;
        FECSWorldPtr local_44_6 = ECS::GetECSWorld();
        local_53 = local_48.opCall();
        if (!(local_53))
        {
            local_53 = false;
        }
        else
        {
            FECSWorldPtr local_44_7 = ECS::GetECSWorld();
            local_53 = SimpleDestructibleUtils::IsDestroyed(local_52.opCall(), local_124);
        }
        if (local_53)
        {
            OutResult.bWasAlreadyDestroyed = true;
            return true;
        }
        if (bUseAttackDamageLevel)
        {
        }
        else
        {
        }
        if (int(DamageLevel) < local_55)
        {
            return true;
        }
        FFPTime local_64_2 = FFPTime(-1);
        FECSWorldPtr local_44_8 = EventSenderEntity.GetWorld();
        SendEvent local_138;
        FCE_SimpleDestructibleHitEvent_FoliageISkM& local_140 = local_138.opCall(ENTITY_NULL, local_64_2);
        if (local_140)
        {
            local_140.ReceiverComponent = local_108;
            local_140.ItemIndex = HitItemIndex;
            local_140.ImpactType = ImpactType;
            local_140.ImpactStrength = ImpactStrength;
            local_140.ForceDirection = ForceDirection;
            local_140.DestructibleDamageLevel = DamageLevel;
        }
        FTransform local_92;
        FSimpleDestructibleUtils::GetInstanceSkinnedMeshTransform(local_108, HitItemIndex, local_92, true);
        FECSWorldPtr local_44_9 = ECS::GetECSWorld();
        FECSWorldPtr local_44_10 = ECS::GetECSWorld();
        SimpleDestructibleUtils::ServerProcessSimpleDestructible_FoliageISkM(local_124, local_92, local_98, local_104, local_20, local_108, EImpactType(ImpactType), EImpactStrength(ImpactStrength), ForceDirection);
        OutResult.bBroken = true;
        return true;
    }
    UStaticMeshComponent local_144 = (Cast<UStaticMeshComponent>(HitComponent));
    if (local_144 != nullptr)
    {
        bool local_53;
        Get local_52;
        Has local_48;
        local_150 = (Cast<ASimpleDestructibleStaticMeshActor>(local_144.GetOwner()));
        if (local_150 != nullptr && !(local_150.bEnableDestructible))
        {
            return false;
        }
        local_8 = local_144.GetStaticMesh();
        if (local_8 == nullptr)
        {
            return false;
        }
        local_20 = (Cast<USimpleDestructibleStaticMeshAssetUserData>(local_8.GetAssetUserData(TSubclassOf<UAssetUserData>(local_12), false)));
        if (local_20 == nullptr)
        {
            if (local_150 != nullptr)
            {
                XError(ELog(4), FString().Append("SimpleDestructibleStaticMeshActor '").Append(local_150.GetActorNameOrLabel()).Append("' has StaticMesh '").Append(local_8.GetPathName(nullptr)).Append("' without SimpleDestructibleAssetUserData"));
            }
            return false;
        }
        OutResult.bIsSimpleDestructible = true;
        FSimpleDestructibleCacheKey_StaticMesh local_174;
        local_174.SetSM(TSoftObjectPtr<UStaticMeshComponent>(local_144));
        OutResult.StaticMeshKey = local_174;
        FECSWorldPtr local_44_11 = ECS::GetECSWorld();
        bool local_1_8 = local_48.opCall();
        if (!(local_1_8))
        {
            local_1_8 = false;
        }
        else
        {
            FECSWorldPtr local_44_12 = ECS::GetECSWorld();
            local_1_8 = SimpleDestructibleUtils::IsDestroyed(local_52.opCall(), local_174);
        }
        if (local_1_8)
        {
            OutResult.bWasAlreadyDestroyed = true;
            return true;
        }
        if (bUseAttackDamageLevel)
        {
        }
        else
        {
        }
        if (int(DamageLevel) < local_55)
        {
            return true;
        }
        FFPTime local_64_3 = FFPTime(-1);
        FECSWorldPtr local_44_13 = EventSenderEntity.GetWorld();
        SendEvent local_188;
        FCE_SimpleDestructibleHitEvent_StaticMesh& local_190 = local_188.opCall(ENTITY_NULL, local_64_3);
        if (local_190)
        {
            local_190.ReceiverComponent = local_144;
            local_190.ImpactType = ImpactType;
            local_190.ImpactStrength = ImpactStrength;
            local_190.ForceDirection = ForceDirection;
            local_190.DestructibleDamageLevel = DamageLevel;
        }
        FTransform local_216 = local_144.GetWorldTransform();
        FECSWorldPtr local_44_14 = ECS::GetECSWorld();
        FECSWorldPtr local_44_15 = ECS::GetECSWorld();
        SimpleDestructibleUtils::ServerProcessSimpleDestructible_StaticMesh(local_174, local_216, local_98, local_104, local_20, local_144, EImpactType(ImpactType), EImpactStrength(ImpactStrength), ForceDirection);
        OutResult.bBroken = true;
        return true;
    }
    return false;
}
void PlayDestructibleInstantFX(const USimpleDestructibleStaticMeshAssetUserData SimpleDestructibleAUD, const FTransform &inout Transform, const EImpactType ImpactType, const EImpactStrength ImpactStrength, const FVector &inout ForceDirection)
{
    int local_206 = 0;
    for (auto& local_16 : SimpleDestructibleAUD.InstantFXConfigs)
    {
        FFXConfig local_132;
        local_132.SetAsset(System::GetSoftClassPath(local_16.FXActorClass));
        local_132.SetbDetach(true);
        FAttachRefName local_144 = local_132.GetAttachRefName();
        local_144.Name = NAME_None;
        local_132.SetAttachRefName(local_144);
        local_132.SetLocationOffset((Transform.GetLocation() + local_16.WorldSpaceLocationOffset));
        local_132.SetRotationOffset(FRotator((local_16.WorldSpaceRotationOffset.Quaternion() * Transform.GetRotation())));
        local_132.SetOverrideParams(local_16.OverrideParam);
        local_132.SetbUseWorldOriginAsBaseTransformSource(true);
        local_132.SetLocationOffsetSpace(EFXOffsetSpace(2));
        local_132.SetRotationOffsetSpace(EFXOffsetSpace(2));
        local_132.SetScale(Transform.GetScale3D());
        if (ECSFX::PlayFXInstantEx(ENTITY_NULL, local_132, ECS::GetContextTime(), 1.0f, false, false, ENTITY_NULL))
        {
            local_206.SetImpactType(EImpactType(ImpactType));
            local_206.SetImpactStrength(EImpactStrength(ImpactStrength));
            local_206.SetForceDirection(ForceDirection);
        }
    }
    return;
}
bool IsClientManagerOnModifyMode()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Has local_6;
    bool local_7 = local_6.opCall();
    if (local_7)
    {
        FECSWorldPtr local_2_2 = ECS::GetECSWorld();
        Get local_12;
        return local_12.opCall().ActiveUseManagerOnModify;
    }
    return SimpleDestructibleUtils::CVar_SimpleDestructible_UseManagerOnModify.GetBool();
}
void SeedObservedAuthorityKeys(const FCS_SimpleDestructibleManager &inout Manager, FCS_SimpleDestructibleClientCache &inout ClientCache)
{
    for (auto& local_20 : Manager.GetStateMap_FoliageISM())
    {
        ClientCache.ObservedAuthorityKeys_FoliageISM.Add(local_20.GetKey());
    }
    for (auto& local_38 : Manager.GetStateMap_FoliageISkM())
    {
        ClientCache.ObservedAuthorityKeys_FoliageISkM.Add(local_38.GetKey());
    }
    for (auto& local_56 : Manager.GetStateMap_StaticMesh())
    {
        ClientCache.ObservedAuthorityKeys_StaticMesh.Add(local_56.GetKey());
    }
    return;
}
ESimpleDestructibleApplyResult ClientApplySimpleDestructible_FoliageISM(const FSimpleDestructibleCacheKey_FoliageISM &inout Key, const int SourceUniqueId, const FTransform &inout Transform, FCS_SimpleDestructibleClientCache &inout ClientCache, const USimpleDestructibleStaticMeshAssetUserData SimpleDestructibleAUD, const UHierarchicalInstancedStaticMeshComponent ISMPtr)
{
    FSimpleDestructibleAppliedState local_44;
    if (ClientCache.AppliedStateMap_FoliageISM.Find(Key, local_44) && local_44.bApplied && (int(local_44.SourceUniqueId) == SourceUniqueId))
    {
        return ESimpleDestructibleApplyResult(1);
    }
    FTransform local_72;
    if (!(ISMPtr.GetInstanceTransform(Key.GetInstanceId(), local_72, true)))
    {
        return ESimpleDestructibleApplyResult(2);
    }
    FSimpleDestructibleAppliedState local_116;
    local_116.SourceUniqueId = SourceUniqueId;
    local_116.OriginalTransform = local_72;
    UStaticMesh local_118 = SimpleDestructibleAUD.RemainStaticMeshObject;
    if (local_118 != nullptr)
    {
        local_116.RemainInstanceId = FSimpleDestructibleUtils::CreateISM(local_118, ISMPtr.GetOwner(), local_72, true);
        local_116.bHasRemain = true;
        local_116.RemainStaticMesh = local_118;
    }
    FTransform local_148 = Transform;
    local_148.SetScale3D(FVector::ZeroVector);
    ISMPtr.UpdateInstanceTransform(Key.GetInstanceId(), local_148, true, true, true);
    local_116.bApplied = true;
    ClientCache.AppliedStateMap_FoliageISM.Add(Key, local_116);
    return ESimpleDestructibleApplyResult(0);
}
ESimpleDestructibleApplyResult ClientApplySimpleDestructible_FoliageISkM(const FSimpleDestructibleCacheKey_FoliageISkM &inout Key, const int SourceUniqueId, const FTransform &inout Transform, FCS_SimpleDestructibleClientCache &inout ClientCache, const USimpleDestructibleStaticMeshAssetUserData SimpleDestructibleAUD, const UInstancedSkinnedMeshComponent ISkMPtr)
{
    FSimpleDestructibleAppliedState local_44;
    if (ClientCache.AppliedStateMap_FoliageISkM.Find(Key, local_44) && local_44.bApplied && (int(local_44.SourceUniqueId) == SourceUniqueId))
    {
        return ESimpleDestructibleApplyResult(1);
    }
    FTransform local_72;
    if (!(FSimpleDestructibleUtils::GetInstanceSkinnedMeshTransform(ISkMPtr, Key.GetInstanceId(), local_72, true)))
    {
        return ESimpleDestructibleApplyResult(2);
    }
    FSimpleDestructibleAppliedState local_116;
    local_116.SourceUniqueId = SourceUniqueId;
    local_116.OriginalTransform = local_72;
    UStaticMesh local_118 = SimpleDestructibleAUD.RemainStaticMeshObject;
    if (local_118 != nullptr)
    {
        local_116.RemainInstanceId = FSimpleDestructibleUtils::CreateISM(local_118, ISkMPtr.GetOwner(), local_72, true);
        local_116.bHasRemain = true;
        local_116.RemainStaticMesh = local_118;
    }
    FTransform local_148 = Transform;
    local_148.SetScale3D(FVector::ZeroVector);
    FSimpleDestructibleUtils::UpdateInstanceSkinnedMeshTransform(ISkMPtr, Key.GetInstanceId(), local_148, true, true, true);
    local_116.bApplied = true;
    ClientCache.AppliedStateMap_FoliageISkM.Add(Key, local_116);
    return ESimpleDestructibleApplyResult(0);
}
ESimpleDestructibleApplyResult ClientApplySimpleDestructible_StaticMesh(const FSimpleDestructibleCacheKey_StaticMesh &inout Key, const int SourceUniqueId, FCS_SimpleDestructibleClientCache &inout ClientCache, const USimpleDestructibleStaticMeshAssetUserData SimpleDestructibleAUD, const UStaticMeshComponent SMPtr)
{
    FSimpleDestructibleAppliedState local_44;
    if (ClientCache.AppliedStateMap_StaticMesh.Find(Key, local_44) && local_44.bApplied && (int(local_44.SourceUniqueId) == SourceUniqueId))
    {
        return ESimpleDestructibleApplyResult(1);
    }
    FTransform local_96 = SMPtr.GetWorldTransform();
    FSimpleDestructibleAppliedState local_140;
    local_140.SourceUniqueId = SourceUniqueId;
    local_140.OriginalTransform = local_96;
    local_140.bOriginalVisible = SMPtr.IsVisible();
    local_140.OriginalCollisionEnabled = SMPtr.GetCollisionEnabled();
    UStaticMesh local_144 = SimpleDestructibleAUD.RemainStaticMeshObject;
    if (local_144 != nullptr)
    {
        local_140.RemainInstanceId = FSimpleDestructibleUtils::CreateISM(local_144, SMPtr.GetOwner(), local_96, true);
        local_140.bHasRemain = true;
        local_140.RemainStaticMesh = local_144;
    }
    SMPtr.SetCollisionEnabled(ECollisionEnabled(0));
    SMPtr.SetVisibility(false, false);
    local_140.bApplied = true;
    ClientCache.AppliedStateMap_StaticMesh.Add(Key, local_140);
    return ESimpleDestructibleApplyResult(0);
}
void ClientRestoreAllStates(const FCS_SimpleDestructibleManager &inout Manager, FCS_SimpleDestructibleClientCache &inout ClientCache)
{
    UHierarchicalInstancedStaticMeshComponent local_36;
    UStaticMesh local_38;
    UClass local_42;
    USimpleDestructibleStaticMeshAssetUserData local_50;
    int local_51;
    UInstancedSkinnedMeshComponent local_160;
    UStaticMeshComponent local_198;
    for (auto& local_20 : Manager.GetStateMap_FoliageISM())
    {
        const FSimpleDestructibleCacheKey_FoliageISM& local_22 = local_20.GetKey();
        TSoftObjectPtr<UHierarchicalInstancedStaticMeshComponent> local_32 = local_22.GetISM();
        UHierarchicalInstancedStaticMeshComponent local_34;
        local_36 = local_34;
        if (local_36 == nullptr)
        {
            continue;
        }
        local_38 = local_36.GetStaticMesh();
        if (local_38 == nullptr)
        {
            continue;
        }
        local_50 = Cast<USimpleDestructibleStaticMeshAssetUserData>(local_38.GetAssetUserData(TSubclassOf<UAssetUserData>(local_42), false));
        if (local_50 == nullptr)
        {
            continue;
        }
        local_51 = local_36.GetUniqueID();
        FSimpleDestructibleAppliedState local_96;
        if (ClientCache.AppliedStateMap_FoliageISM.Find(local_22, local_96))
        {
            if ((local_96.bApplied && (int(local_96.SourceUniqueId) == local_51)))
            {
                continue;
            }
            if (local_96.bHasRemain)
            {
                FSimpleDestructibleUtils::RemoveRemainInstance(local_36.GetOwner(), local_50.RemainStaticMeshObject, local_96.RemainInstanceId);
            }
        }
        FTransform local_124;
        if (!(local_36.GetInstanceTransform(local_22.GetInstanceId(), local_124, true)))
        {
            continue;
        }
        SimpleDestructibleUtils::ClientApplySimpleDestructible_FoliageISM(local_22, local_51, local_124, ClientCache, local_50, local_36);
    }
    for (auto& local_144 : Manager.GetStateMap_FoliageISkM())
    {
        const FSimpleDestructibleCacheKey_FoliageISkM& local_146 = local_144.GetKey();
        TSoftObjectPtr<UInstancedSkinnedMeshComponent> local_156 = local_146.GetISkM();
        UInstancedSkinnedMeshComponent local_158;
        local_160 = local_158;
        if (local_160 == nullptr)
        {
            continue;
        }
        USkinnedAsset local_164 = local_160.GetSkinnedAsset();
        if (local_164 == nullptr)
        {
            continue;
        }
        local_50 = Cast<USimpleDestructibleStaticMeshAssetUserData>(local_164.GetAssetUserData(TSubclassOf<UAssetUserData>(local_42), false));
        if (local_50 == nullptr)
        {
            continue;
        }
        local_51 = local_160.GetUniqueID();
        FSimpleDestructibleAppliedState local_96;
        if (ClientCache.AppliedStateMap_FoliageISkM.Find(local_146, local_96))
        {
            if ((local_96.bApplied && (int(local_96.SourceUniqueId) == local_51)))
            {
                continue;
            }
            if (local_96.bHasRemain)
            {
                FSimpleDestructibleUtils::RemoveRemainInstance(local_160.GetOwner(), local_50.RemainStaticMeshObject, local_96.RemainInstanceId);
            }
        }
        FTransform local_124;
        if (!(FSimpleDestructibleUtils::GetInstanceSkinnedMeshTransform(local_160, local_146.GetInstanceId(), local_124, true)))
        {
            continue;
        }
        SimpleDestructibleUtils::ClientApplySimpleDestructible_FoliageISkM(local_146, local_51, local_124, ClientCache, local_50, local_160);
    }
    for (auto& local_182 : Manager.GetStateMap_StaticMesh())
    {
        const FSimpleDestructibleCacheKey_StaticMesh& local_184 = local_182.GetKey();
        TSoftObjectPtr<UStaticMeshComponent> local_194 = local_184.GetSM();
        UStaticMeshComponent local_196;
        local_198 = local_196;
        if (local_198 == nullptr)
        {
            continue;
        }
        local_38 = local_198.GetStaticMesh();
        if (local_38 == nullptr)
        {
            continue;
        }
        local_50 = Cast<USimpleDestructibleStaticMeshAssetUserData>(local_38.GetAssetUserData(TSubclassOf<UAssetUserData>(local_42), false));
        if (local_50 == nullptr)
        {
            continue;
        }
        local_51 = local_198.GetUniqueID();
        FSimpleDestructibleAppliedState local_96;
        if (ClientCache.AppliedStateMap_StaticMesh.Find(local_184, local_96))
        {
            if ((local_96.bApplied && (int(local_96.SourceUniqueId) == local_51)))
            {
                continue;
            }
            if (local_96.bHasRemain)
            {
                FSimpleDestructibleUtils::RemoveRemainInstance(local_198.GetOwner(), local_50.RemainStaticMeshObject, local_96.RemainInstanceId);
            }
        }
        SimpleDestructibleUtils::ClientApplySimpleDestructible_StaticMesh(local_184, local_51, ClientCache, local_50, local_198);
    }
    return;
}
void ClientSyncNewDestructibleStates(const FCS_SimpleDestructibleManager &inout Manager, FCS_SimpleDestructibleClientCache &inout ClientCache)
{
    UHierarchicalInstancedStaticMeshComponent local_36;
    UStaticMesh local_38;
    UClass local_68;
    EImpactStrength local_74;
    FCE_SimpleDestructibleProcessView_FoliageISM local_88;
    UInstancedSkinnedMeshComponent local_124;
    FCE_SimpleDestructibleProcessView_FoliageISkM local_134;
    UStaticMeshComponent local_168;
    FCE_SimpleDestructibleProcessView_StaticMesh local_198;
    for (auto& local_20 : Manager.GetStateMap_FoliageISM())
    {
        const FSimpleDestructibleCacheKey_FoliageISM& local_22 = local_20.GetKey();
        if (ClientCache.ObservedAuthorityKeys_FoliageISM.Contains(local_22))
        {
            continue;
        }
        ClientCache.ObservedAuthorityKeys_FoliageISM.Add(local_22);
        TSoftObjectPtr<UHierarchicalInstancedStaticMeshComponent> local_32 = local_22.GetISM();
        UHierarchicalInstancedStaticMeshComponent local_34;
        local_36 = local_34;
        if (local_36 == nullptr)
        {
            continue;
        }
        local_38 = local_36.GetStaticMesh();
        if (local_38 == nullptr)
        {
            continue;
        }
        FTransform local_64;
        if (!(local_36.GetInstanceTransform(local_22.GetInstanceId(), local_64, true)))
        {
            continue;
        }
        local_74 = Cast<USimpleDestructibleStaticMeshAssetUserData>(local_38.GetAssetUserData(TSubclassOf<UAssetUserData>(local_68), false));
        if (local_74 == nullptr)
        {
            continue;
        }
        int local_77 = int(GetImpactStrength());
        int local_78 = int(GetImpactType());
        ECS::GetContextTime();
        FECSWorldPtr local_80 = ECS::GetECSWorld();
        local_88.ReceiverComponent = local_22.GetISM();
        local_88.ItemIndex = local_22.GetInstanceId();
        local_88.Transform = local_64;
        local_88.QueuedSourceUniqueId = local_36.GetUniqueID();
    }
    for (auto& local_108 : Manager.GetStateMap_FoliageISkM())
    {
        const FSimpleDestructibleCacheKey_FoliageISkM& local_110 = local_108.GetKey();
        if (ClientCache.ObservedAuthorityKeys_FoliageISkM.Contains(local_110))
        {
            continue;
        }
        ClientCache.ObservedAuthorityKeys_FoliageISkM.Add(local_110);
        TSoftObjectPtr<UInstancedSkinnedMeshComponent> local_120 = local_110.GetISkM();
        UInstancedSkinnedMeshComponent local_122;
        local_124 = local_122;
        if (local_124 == nullptr)
        {
            continue;
        }
        USkinnedAsset local_128 = local_124.GetSkinnedAsset();
        if (local_128 == nullptr)
        {
            continue;
        }
        FTransform local_64;
        if (!(FSimpleDestructibleUtils::GetInstanceSkinnedMeshTransform(local_124, local_110.GetInstanceId(), local_64, true)))
        {
            continue;
        }
        local_74 = Cast<USimpleDestructibleStaticMeshAssetUserData>(local_128.GetAssetUserData(TSubclassOf<UAssetUserData>(local_68), false));
        if (local_74 == nullptr)
        {
            continue;
        }
        int local_77_2 = int(GetImpactStrength());
        int local_78_2 = int(GetImpactType());
        ECS::GetContextTime();
        FECSWorldPtr local_80_2 = ECS::GetECSWorld();
        local_134.ReceiverComponent = local_110.GetISkM();
        local_134.ItemIndex = local_110.GetInstanceId();
        local_134.Transform = local_64;
        local_134.QueuedSourceUniqueId = local_124.GetUniqueID();
    }
    for (auto& local_152 : Manager.GetStateMap_StaticMesh())
    {
        const FSimpleDestructibleCacheKey_StaticMesh& local_154 = local_152.GetKey();
        if (ClientCache.ObservedAuthorityKeys_StaticMesh.Contains(local_154))
        {
            continue;
        }
        ClientCache.ObservedAuthorityKeys_StaticMesh.Add(local_154);
        TSoftObjectPtr<UStaticMeshComponent> local_164 = local_154.GetSM();
        UStaticMeshComponent local_166;
        local_168 = local_166;
        if (local_168 == nullptr)
        {
            continue;
        }
        local_38 = local_168.GetStaticMesh();
        if (local_38 == nullptr)
        {
            continue;
        }
        FTransform local_192 = local_168.GetWorldTransform();
        local_74 = Cast<USimpleDestructibleStaticMeshAssetUserData>(local_38.GetAssetUserData(TSubclassOf<UAssetUserData>(local_68), false));
        if (local_74 == nullptr)
        {
            continue;
        }
        int local_77_3 = int(GetImpactStrength());
        int local_78_3 = int(GetImpactType());
        ECS::GetContextTime();
        FECSWorldPtr local_80_3 = ECS::GetECSWorld();
        local_198.ReceiverComponent = local_154.GetSM();
        local_198.Transform = local_192;
        local_198.QueuedSourceUniqueId = local_168.GetUniqueID();
    }
    return;
}
void RemoveRemainInstanceForAppliedState(const FSimpleDestructibleAppliedState &inout State)
{
    UStaticMesh local_6;
    if (!(State.bHasRemain))
    {
        return;
    }
    if (local_6 != nullptr)
    {
        FSimpleDestructibleUtils::RemoveRemainInstanceByWorld(ECS::GetUEWorld(), local_6, State.RemainInstanceId);
    }
    return;
}
void ClientCleanupUnloadedStates(FCS_SimpleDestructibleClientCache &inout ClientCache)
{
    FSimpleDestructibleCacheKey_FoliageISM local_26;
    FSimpleDestructibleAppliedState& local_28;
    UHierarchicalInstancedStaticMeshComponent local_42;
    FSimpleDestructibleCacheKey_FoliageISkM local_82;
    UInstancedSkinnedMeshComponent local_96;
    FSimpleDestructibleCacheKey_StaticMesh local_132;
    UStaticMeshComponent local_146;
    TArray<FSimpleDestructibleCacheKey_FoliageISM> local_4;
    for (auto& local_24 : ClientCache.AppliedStateMap_FoliageISM)
    {
        local_26 = local_24.GetKey();
        TSoftObjectPtr<UHierarchicalInstancedStaticMeshComponent> local_38 = local_26.GetISM();
        UHierarchicalInstancedStaticMeshComponent local_40;
        local_42 = local_40;
        if (local_42 != nullptr && (local_42.GetUniqueID() == int(local_28.SourceUniqueId)))
        {
            continue;
        }
        SimpleDestructibleUtils::RemoveRemainInstanceForAppliedState(local_28);
        local_4.Add(local_26);
    }
    auto local_52 = local_4.Iterator();
    for (; local_52.CanProceed;)
    {
        local_26 = local_52.Proceed();
    }
    TArray<FSimpleDestructibleCacheKey_FoliageISkM> local_62;
    for (auto& local_80 : ClientCache.AppliedStateMap_FoliageISkM)
    {
        local_82 = local_80.GetKey();
        TSoftObjectPtr<UInstancedSkinnedMeshComponent> local_92 = local_82.GetISkM();
        UInstancedSkinnedMeshComponent local_94;
        local_96 = local_94;
        if (local_96 != nullptr && (local_96.GetUniqueID() == int(local_28.SourceUniqueId)))
        {
            continue;
        }
        SimpleDestructibleUtils::RemoveRemainInstanceForAppliedState(local_28);
        local_62.Add(local_82);
    }
    auto local_102 = local_62.Iterator();
    for (; local_102.CanProceed;)
    {
        local_82 = local_102.Proceed();
    }
    TArray<FSimpleDestructibleCacheKey_StaticMesh> local_112;
    for (auto& local_130 : ClientCache.AppliedStateMap_StaticMesh)
    {
        local_132 = local_130.GetKey();
        TSoftObjectPtr<UStaticMeshComponent> local_142 = local_132.GetSM();
        UStaticMeshComponent local_144;
        local_146 = local_144;
        if (local_146 != nullptr && (local_146.GetUniqueID() == int(local_28.SourceUniqueId)))
        {
            continue;
        }
        SimpleDestructibleUtils::RemoveRemainInstanceForAppliedState(local_28);
        local_112.Add(local_132);
    }
    auto local_152 = local_112.Iterator();
    for (; local_152.CanProceed;)
    {
        local_132 = local_152.Proceed();
    }
    return;
}
void ClientRevertAllAppliedStates(const FCS_SimpleDestructibleClientCache &inout ClientCache)
{
    const FSimpleDestructibleAppliedState& local_24;
    UHierarchicalInstancedStaticMeshComponent local_38;
    UInstancedSkinnedMeshComponent local_78;
    UStaticMeshComponent local_112;
    for (auto& local_20 : ClientCache.AppliedStateMap_FoliageISM)
    {
        const FSimpleDestructibleCacheKey_FoliageISM& local_22 = local_20.GetKey();
        TSoftObjectPtr<UHierarchicalInstancedStaticMeshComponent> local_34 = local_22.GetISM();
        UHierarchicalInstancedStaticMeshComponent local_36;
        local_38 = local_36;
        if (local_38 != nullptr && (local_38.GetUniqueID() == int(local_24.SourceUniqueId)))
        {
            local_38.UpdateInstanceTransform(local_22.GetInstanceId(), local_24.OriginalTransform, true, true, true);
        }
        SimpleDestructibleUtils::RemoveRemainInstanceForAppliedState(local_24);
    }
    for (auto& local_62 : ClientCache.AppliedStateMap_FoliageISkM)
    {
        const FSimpleDestructibleCacheKey_FoliageISkM& local_64 = local_62.GetKey();
        TSoftObjectPtr<UInstancedSkinnedMeshComponent> local_74 = local_64.GetISkM();
        UInstancedSkinnedMeshComponent local_76;
        local_78 = local_76;
        if (local_78 != nullptr && (local_78.GetUniqueID() == int(local_24.SourceUniqueId)))
        {
            FSimpleDestructibleUtils::UpdateInstanceSkinnedMeshTransform(local_78, local_64.GetInstanceId(), local_24.OriginalTransform, true, true, true);
        }
        SimpleDestructibleUtils::RemoveRemainInstanceForAppliedState(local_24);
    }
    for (auto& local_96 : ClientCache.AppliedStateMap_StaticMesh)
    {
        TSoftObjectPtr<UStaticMeshComponent> local_108 = local_96.GetKey().GetSM();
        UStaticMeshComponent local_110;
        local_112 = local_110;
        if (local_112 != nullptr && (local_112.GetUniqueID() == int(local_24.SourceUniqueId)))
        {
            local_112.SetCollisionEnabled(local_24.OriginalCollisionEnabled);
            local_112.SetVisibility(local_24.bOriginalVisible, false);
        }
        SimpleDestructibleUtils::RemoveRemainInstanceForAppliedState(local_24);
    }
    return;
}
}

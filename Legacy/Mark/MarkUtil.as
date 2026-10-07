
namespace MarkUtil
{
void RequestFastMarkFromUEPlayerController(const AECSPlayerController UEPlayerController)
{
    if (!(IsValid(UEPlayerController)))
    {
        return;
    }
    FECSEntity local_6 = UEPlayerController.GetPlayerEntity();
    FC_DispatchFastMarkRequestTag local_12;
    Assign local_10;
    local_10.opCall(local_12);
    return;
}
int GetUserSelectableMinimapMarkNum()
{
    UMarkSettings local_4 = MarkUtil_Internal::GetMinimapMarkIconsSetting();
    if (local_4 != nullptr)
    {
        return local_4.MinimapMarkIcons.Num();
    }
    return 0;
}
TDataObjectPtr<FMarkConfig> GetUserSelectableMinimapMarkAt(const int Index)
{
    UMarkSettings local_4 = MarkUtil_Internal::GetMinimapMarkIconsSetting();
    if (local_4 != nullptr)
    {
        if (local_4.MinimapMarkIcons.IsValidIndex(Index))
        {
            return local_4.MinimapMarkIcons[Index];
        }
    }
    XError(ELog(53), FString().Append("Failed to find mark config in MinimapMarkIconsSetting at index ").Append(Index));
    return TDataObjectPtr<FMarkConfig>();
}
UMarkSettings GetMarkConfigSetting()
{
    return MarkUtil_Internal::GetMinimapMarkIconsSetting();
}
void RequestRemoveMark(const FECSEntity &inout RequesterPlayer, const FECSEntityId &inout MarkOrMarkedEntityID)
{
    if (!(MarkUtil::CanManuallyRemoveMark(RequesterPlayer, MarkOrMarkedEntityID)))
    {
        FCommonTipsParam local_10;
        CommonPopup::WeakTips(NSLOCTEXT("Mark", "CannotManuallyRemoveMark", "з›®ж ‡е·Іжњ‰ж ‡и®°пјЊж— жі•ж‰‹еЉЁз§»й™¤"), local_10);
        return;
    }
    FFPTime local_16 = FFPTime(-1);
    SendEvent local_14;
    local_14.opCall(local_16).MarkOrMarkedEntityID = MarkOrMarkedEntityID;
    return;
}
void RequestFastMark(const FECSEntity &inout RequesterPlayer)
{
    int local_30 = 0;
    Has local_4;
    bool local_5 = local_4.opCall();
    if (local_5)
    {
        FECSEntity local_10;
        FVector local_16;
        if (MarkUtil_Internal::FastMarkLineTrace(RequesterPlayer, local_10, local_16))
        {
            if (!((local_10 == ENTITY_NULL)))
            {
                bool local_18;
                if (!(MarkUtil::CanMarkEntity(RequesterPlayer, local_10)))
                {
                    return;
                }
                if (MarkUtil::IsSelfCreateMark(RequesterPlayer, local_10.GetId()))
                {
                    MarkUtil::RequestRemoveMark(RequesterPlayer, local_10.GetId());
                    return;
                }
                local_18 = false;
                FECSEntityId local_19 = MarkUtil_Internal::FindMarkEntityIdByMarkedEntityId(RequesterPlayer, local_10.GetId());
                if (!((local_19 == ENTITY_ID_NULL)))
                {
                    local_18 = true;
                    MarkUtil::RequestRemoveMark(RequesterPlayer, local_19);
                }
                if ((FGuidingPathUtils::GetGuidingPathTargetEntityID(RequesterPlayer) == local_10.GetId()))
                {
                    local_18 = true;
                    FGuidingPathUtils::RequestGuidingPathCancel(RequesterPlayer);
                }
                if (local_18)
                {
                    return;
                }
                FFPTime local_26 = FFPTime(-1);
                local_30.EntityID = local_10.GetId();
                local_30.MarkConfig = MarkUtil_Internal::GetFastMarkConfigByEntity(local_10);
                FGuidingPathUtils::RequestGuidingPathToEntityID(local_10.GetId(), RequesterPlayer);
            }
            else
            {
                FCE_RequestMarkLocation local_84;
                FFPTime local_26_2 = FFPTime(-1);
                local_84.Location = local_16;
                local_84.MarkConfig = MarkUtil_Internal::GetFastMarkConfigByEntity(ENTITY_NULL);
                bool local_5_2 = true;
                local_84.bGuideToMark = local_5_2;
            }
        }
        return;
    }
    XError(ELog(53), FString().Append("Entity ").Append(RequesterPlayer).Append(" is not player entity"));
    return;
}
void RequestFastMarkEntityFromMinimap(const FECSEntity &inout RequesterPlayer, const FECSEntityId &inout EntityID)
{
    FFPTime local_6 = FFPTime(-1);
    0.EntityID = EntityID;
    return;
}
void RequestMarkPositionFromMinimap(const FECSEntity &inout RequesterPlayer, const FVector2D &inout MapPosition, const TDataObjectPtr<FMarkConfig> &inout MarkConfig, const bool bGuideToMark)
{
    if (!(!(!(MarkConfig))))
    {
        return;
    }
    if (bGuideToMark)
    {
        FC_GuidingPathRequestThrottle local_8;
        local_8.PendingKind = 4;
        local_8.PendingTargetLocation2D = MapPosition;
        local_8.PendingTargetLocation = FVector::ZeroVector;
        local_8.PendingMarkConfig = MarkConfig;
        local_8.bHasNewRequest = true;
        return;
    }
    MarkUtil::EmitMarkPosition(RequesterPlayer, MapPosition, MarkConfig, false);
    return;
}
void EmitMarkPosition(const FECSEntity &inout RequesterPlayer, const FVector2D &inout MapPosition, const TDataObjectPtr<FMarkConfig> &inout MarkConfig, const bool bGuideToMark)
{
    FCE_RequestMarkLocation local_18;
    FVector local_6;
    if (MarkUtil::FindMarkPositionByMapPosition(RequesterPlayer, MapPosition, local_6))
    {
        FFPTime local_14 = FFPTime(-1);
        local_18.Location = local_6;
        local_18.MarkConfig = MarkConfig;
        local_18.bGuideToMark = bGuideToMark;
        return;
    }
    FFPTime local_14_2 = FFPTime(-1);
    local_18.Location = FVector(MapPosition.X, MapPosition.Y, 0.0);
    local_18.MarkConfig = MarkConfig;
    local_18.bGuideToMark = bGuideToMark;
    local_18.bNeedRecalculateHeight = true;
    return;
}
void EmitMarkAndGuidePosition(const FECSEntity &inout RequesterPlayer, const FVector2D &inout MapPosition, const TDataObjectPtr<FMarkConfig> &inout MarkConfig)
{
    MarkUtil::EmitMarkPosition(RequesterPlayer, MapPosition, MarkConfig, true);
    return;
}
void RequestFastMarkPositionFromMinimap(const FECSEntity &inout RequesterPlayer, const FVector2D &inout MapPosition, const bool bGuideToMark)
{
    TDataObjectPtr<FMarkConfig> local_24 = MarkUtil_Internal::GetFastMarkConfigByEntity(ENTITY_NULL);
    MarkUtil::RequestMarkPositionFromMinimap(RequesterPlayer, MapPosition, local_24, bGuideToMark);
    return;
}
void RequestFastMarkWorldPositionFromMinimap(const FECSEntity &inout RequesterPlayer, const FVector &inout WorldPosition, const bool bGuideToMark)
{
    TDataObjectPtr<FMarkConfig> local_24 = MarkUtil_Internal::GetFastMarkConfigByEntity(ENTITY_NULL);
    if (!(!(!(local_24))))
    {
        return;
    }
    if (bGuideToMark)
    {
        FC_GuidingPathRequestThrottle local_56;
        local_56.PendingKind = 4;
        local_56.PendingTargetLocation2D = FVector2D(WorldPosition.X, WorldPosition.Y);
        local_56.PendingTargetLocation = WorldPosition;
        local_56.PendingMarkConfig = local_24;
        local_56.bHasNewRequest = true;
        return;
    }
    FFPTime local_72 = FFPTime(-1);
    FCE_RequestMarkLocation local_74;
    local_74.Location = WorldPosition;
    local_74.MarkConfig = local_24;
    local_74.bGuideToMark = false;
    local_74.bNeedRecalculateHeight = false;
    return;
}
void RequestMarkEntityFromMinimap(const FECSEntity &inout RequesterPlayer, const FECSEntityId &inout MarkEntityID, const TDataObjectPtr<FMarkConfig> &inout MarkConfig)
{
    int local_12 = 0;
    if (!(!(!(MarkConfig))))
    {
        return;
    }
    FFPTime local_8 = FFPTime(-1);
    local_12.EntityID = MarkEntityID;
    local_12.MarkConfig = MarkConfig;
    return;
}
void RequestChangeMarkConfig(const FECSEntity &inout RequesterPlayer, const FECSEntityId &inout MarkEntityID, const TDataObjectPtr<FMarkConfig> &inout MarkConfig)
{
    int local_66 = 0;
    if (!(!(!(MarkConfig))))
    {
        return;
    }
    if ((MarkConfig == MarkUtil::GetMarkConfigByEntityId(RequesterPlayer, MarkEntityID).opImplConv()))
    {
        XLog(ELog(53), FString().Append("Mark config is the same as the current mark config for entity ").Append(MarkEntityID.GetIdValue()).Append("."));
        return;
    }
    FFPTime local_62 = FFPTime(-1);
    local_66.MarkEntityID = MarkEntityID;
    local_66.MarkConfig = MarkConfig;
    return;
}
bool IsAimingAtSelfMarkOrMarkedEntity(const FECSEntity &inout ObserverPlayer)
{
    FECSEntity local_4;
    FVector local_10;
    if (MarkUtil_Internal::FastMarkLineTrace(ObserverPlayer, local_4, local_10))
    {
        if (MarkUtil::IsSelfCreateMark(ObserverPlayer, local_4.GetId()) || MarkUtil::IsEntityMarkedBySelf(ObserverPlayer, local_4.GetId()))
        {
            return true;
        }
    }
    return false;
}
bool IsAimingEntityOrPositionMarkable(const FECSEntity &inout ObserverPlayer, FECSEntity &out OutEntity)
{
    FECSEntity local_4;
    OutEntity = local_4;
    FVector local_10;
    OutEntity = ENTITY_NULL;
    if (MarkUtil_Internal::FastMarkLineTrace(ObserverPlayer, OutEntity, local_10))
    {
        return !(OutEntity) || MarkUtil::CanMarkEntity(ObserverPlayer, OutEntity);
    }
    return false;
}
FECSEntity MarkEntity(const FECSEntity &inout RequesterPlayer, const FECSEntity &inout TargetEntity, const TDataObjectPtr<FMarkConfig> &inout MarkConfig)
{
    int local_63 = 0;
    int local_66 = 0;
    if (!(MarkUtil::CanMarkEntity(RequesterPlayer, TargetEntity)))
    {
        return ENTITY_NULL;
    }
    if (MarkUtil::GetMarkPoolConfig(MarkConfig))
    {
        FMarkPool local_62 = FMarkPool(local_63);
        if (MarkUtil_Internal::PrepareSpaceInMarkPool(local_66))
        {
            FECSEntity local_70 = MarkUtil_Internal::AddMarkToEntity(TargetEntity, RequesterPlayer, MarkConfig);
            if (local_70)
            {
                local_66.Push(local_70);
                return local_70;
            }
        }
    }
    return ENTITY_NULL;
}
FECSEntity MarkPosition(const FECSEntity &inout RequesterPlayer, const FVector &inout TargetPosition, const TDataObjectPtr<FMarkConfig> &inout MarkConfig)
{
    int local_63 = 0;
    int local_66 = 0;
    if (MarkUtil::GetMarkPoolConfig(MarkConfig))
    {
        FMarkPool local_62 = FMarkPool(local_63);
        if (MarkUtil_Internal::PrepareSpaceInMarkPool(local_66))
        {
            FECSEntity local_70 = MarkUtil_Internal::AddMarkToPosition(TargetPosition, RequesterPlayer, MarkConfig);
            if (local_70)
            {
                local_66.Push(local_70);
                return local_70;
            }
        }
    }
    return ENTITY_NULL;
}
void RemoveMark(const FECSEntity &inout RequesterPlayer, const FECSEntity &inout MarkOrMarkedEntity)
{
    Get local_4;
    const FC_Mark& local_6 = local_4.opCall();
    if (local_6)
    {
        if ((FECSEntity(local_6.GetCreaterPlayer()) == RequesterPlayer))
        {
            MarkUtil_Internal::DestroyMarkEntity(MarkOrMarkedEntity);
            return;
        }
    }
    else
    {
        FECSEntityId local_14 = MarkUtil_Internal::FindMarkEntityIdByMarkedEntityId(RequesterPlayer, MarkOrMarkedEntity.GetId());
        if ((!((local_14 == ENTITY_ID_NULL))))
        {
            FECSEntity local_20 = FECSEntity(local_14);
            if (local_20)
            {
                MarkUtil_Internal::DestroyMarkEntity(local_20);
            }
            return;
        }
    }
    XError(ELog(53), FString().Append("Entity id ").Append(MarkOrMarkedEntity.GetId().GetIdValue()).Append(" is not a mark or entity marked by ").Append(RequesterPlayer).Append("."));
    return;
}
void ChangeMarkConfig(const FECSEntity &inout RequesterPlayer, const FECSEntity &inout MarkEntity, const TDataObjectPtr<FMarkConfig> &inout NewMarkConfig)
{
    Get local_4;
    const FC_Mark& local_6 = local_4.opCall();
    if (local_6)
    {
        if ((FECSEntity(local_6.GetCreaterPlayer()) == RequesterPlayer))
        {
            MarkUtil_Internal::ChangeMarkConfig(RequesterPlayer, MarkEntity.GetId(), NewMarkConfig);
            return;
        }
        XError(ELog(53), FString().Append("Requester player ").Append(RequesterPlayer).Append(" is not the creater of mark entity ").Append(MarkEntity).Append("."));
    }
    return;
}
TDataObjectPtr<FMarkConfig> GetMarkConfig(const FECSEntity &inout MarkEntity)
{
    int local_6 = 0;
    FMarkInfo local_92;
    if (!(local_6))
    {
        return TDataObjectPtr<FMarkConfig>();
    }
    if (MarkUtil_Internal::GetMarkInfo(local_6.GetCreaterPlayer(), MarkEntity.GetId(), local_92))
    {
        return local_92.GetMarkConfig();
    }
    XWarning(ELog(53), FString().Append("Failed to find mark config for entity ").Append(MarkEntity).Append("."));
    return TDataObjectPtr<FMarkConfig>();
}
TDataObjectPtr<FMarkConfig> GetMarkConfigByEntityId(const FECSEntity &inout ObserverPlayer, const FECSEntityId &inout MarkEntityID)
{
    FMarkInfo local_36;
    if (MarkUtil_Internal::FindPlayerVisibleMarkInfo(ObserverPlayer, MarkEntityID, local_36))
    {
        return local_36.GetMarkConfig();
    }
    return TDataObjectPtr<FMarkConfig>();
}
bool IsMarkVisible(const FECSEntity &inout ObserverPlayer, const FECSEntityId &inout MarkEntityID)
{
    FMarkInfo local_36;
    if (MarkUtil_Internal::FindPlayerVisibleMarkInfo(ObserverPlayer, MarkEntityID, local_36))
    {
        return true;
    }
    return false;
}
bool HasVisibleMark(const FECSEntity &inout ObserverPlayer, const FECSEntityId &inout MarkedEntityID)
{
    FECSEntity local_4;
    return (!((MarkUtil_Internal::FindPlayerVisibleMarkEntityIdByMarkedEntityId(ObserverPlayer, MarkedEntityID, local_4) == ENTITY_ID_NULL)));
}
TDataObjectPtr<FMarkConfig> GetVisibleMarkConfig(const FECSEntity &inout ObserverPlayer, const FECSEntityId &inout MarkedEntityID)
{
    FECSEntity local_4;
    FECSEntityId local_5 = MarkUtil_Internal::FindPlayerVisibleMarkEntityIdByMarkedEntityId(ObserverPlayer, MarkedEntityID, local_4);
    if ((!((local_5 == ENTITY_ID_NULL))))
    {
        FMarkInfo local_44;
        if (MarkUtil_Internal::GetMarkInfo(local_4, local_5, local_44))
        {
            return local_44.GetMarkConfig();
        }
    }
    return TDataObjectPtr<FMarkConfig>();
}
bool IsSelfCreateMark(const FECSEntity &inout ObserverPlayer, const FECSEntityId &inout MarkEntityID)
{
    return MarkUtil_Internal::IsMarkExist(ObserverPlayer, MarkEntityID);
}
bool IsEntityMarkedBySelf(const FECSEntity &inout ObserverPlayer, const FECSEntityId &inout MarkedEntityID)
{
    return (!((MarkUtil_Internal::FindMarkEntityIdByMarkedEntityId(ObserverPlayer, MarkedEntityID) == ENTITY_ID_NULL)));
}
FECSEntity GetMarkedEntity(const FECSEntity &inout MarkEntity)
{
    Get local_4;
    const FC_Mark& local_6 = local_4.opCall();
    if (local_6)
    {
        FMarkInfo local_44;
        MarkUtil_Internal::GetMarkInfo(local_6.GetCreaterPlayer(), MarkEntity.GetId(), local_44);
        if ((!((FECSEntityId(local_44.GetMarkedEntityID()) == ENTITY_ID_NULL))))
        {
            return FECSEntity(local_44.GetMarkedEntityID());
        }
    }
    else
    {
    }
    return ENTITY_NULL;
}
FECSEntityId GetMarkedEntityId(const FECSEntity &inout ObserverPlayer, const FECSEntityId &inout MarkEntityID)
{
    FMarkInfo local_36;
    if (MarkUtil_Internal::FindPlayerVisibleMarkInfo(ObserverPlayer, MarkEntityID, local_36))
    {
        return local_36.GetMarkedEntityID();
    }
    return ENTITY_ID_NULL;
}
TArray<FECSEntity> GetAllVisibleMarks(const FECSEntity &inout ObserverPlayer, const bool bIncludeTeammateMarks = true)
{
    TArray<FECSEntity> local_4;
    FECSRuntimeView local_26 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
    Include local_48;
    local_48.opCall();
    FECSRuntimeViewIterator local_82 = local_26.Iterator();
    for (; local_82.CanProceed;)
    {
        const FECSEntity& local_120 = local_82.Proceed();
        if ((bIncludeTeammateMarks && MarkUtil::IsMarkVisible(ObserverPlayer, local_120.GetId())) || MarkUtil::IsSelfCreateMark(ObserverPlayer, local_120.GetId()))
        {
            local_4.Add(local_120);
        }
    }
    return local_4;
}
bool CanMarkEntity(const FECSEntity &inout RequesterPlayer, const FECSEntity &inout TargetEntity)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return false;
    }
    Has local_10;
    bool local_5 = local_10.opCall();
    if (local_5)
    {
        return false;
    }
    bool local_5_2 = local_4.opCall();
    if (local_5_2)
    {
        local_5_2 = true;
    }
    else
    {
        Has local_14;
        local_5_2 = local_14.opCall();
    }
    if (local_5_2)
    {
        return false;
    }
    Has local_20;
    bool local_5_3 = local_20.opCall();
    if (local_5_3)
    {
        return true;
    }
    Get local_24;
    const FC_LevelSpot& local_26 = local_24.opCall();
    if (local_26)
    {
        FLevelSpotData local_156 = local_26.GetLevelSpotInfo().GetDataForAnyViewers(LevelSpotViewerUtils::GetPlayerViewerEntities(RequesterPlayer));
        TDataObjectPtr<FPresentationConfig> local_306 = local_156.GetPresentationConfig();
        if (local_306)
        {
            return local_306.opArrow().bSupportMark;
        }
    }
    TDataObjectPtr<FPresentationConfig> local_330 = EntityLevelSpotUtils::GetDefaultPresentationConfig(TargetEntity);
    if (local_330)
    {
        return local_330.opArrow().bSupportMark;
    }
    return false;
}
bool CanManuallyRemoveMark(const FECSEntity &inout RequesterPlayer, const FECSEntityId &inout MarkOrMarkedEntityID)
{
    bool local_41 = false;
    FECSEntityId local_2 = MarkUtil_Internal::FindMarkEntityIdByMarkedEntityId(RequesterPlayer, MarkOrMarkedEntityID);
    if ((local_2 == ENTITY_ID_NULL))
    {
        local_2 = MarkOrMarkedEntityID;
    }
    FMarkInfo local_40;
    if (MarkUtil_Internal::GetMarkInfo(RequesterPlayer, local_2, local_40) && local_40.GetMarkConfig().IsSet())
    {
        local_41 = !local_41;
        return local_41;
    }
    XWarning(ELog(53), FString().Append("CanManuallyRemoveMark: Mark config not found for entity ").Append(local_2.GetIdValue()).Append(". Preventing removal."));
    return false;
}
TDataObjectPtr<FMarkPoolConfig> GetMarkPoolConfig(const TDataObjectPtr<FMarkConfig> &inout MarkConfig)
{
    if (!(!(!(MarkConfig))))
    {
        return TDataObjectPtr<FMarkPoolConfig>();
    }
    return GetMarkPool();
}
TDataObjectPtr<FMarkPoolConfig> GetMarkPoolConfig(const FECSEntity &inout MarkEntity)
{
    TDataObjectPtr<FMarkConfig> local_24 = MarkUtil::GetMarkConfig(MarkEntity);
    if (local_24)
    {
        return MarkUtil::GetMarkPoolConfig(local_24);
    }
    return TDataObjectPtr<FMarkPoolConfig>();
}
bool FindMarkPositionByMapPosition(const FECSEntity &inout Entity, const FVector2D &inout MapPosition, FVector &inout OutMarkPosition)
{
    float32 local_1 = 1000000.0f;
    FVector local_14 = FVector(MapPosition.X, MapPosition.Y, local_1);
    float32 local_2 = -local_1;
    FVector local_8 = FVector(MapPosition.X, MapPosition.Y, local_2);
    FHitResult local_92;
    FCollisionQueryParams local_130;
    FCollisionResponseParams local_141;
    bool local_144 = FPhysicsUtils::LineTraceSingle(Entity, false, EPhysicsTraceTag(24), local_92, local_14, local_8, FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)), local_130, local_141);
    if (local_144)
    {
        OutMarkPosition = local_92.Location;
        return true;
    }
    return false;
}
bool IsMapPositionMarkable(const FECSEntity &inout Entity, const FVector2D &inout MapPosition)
{
    FVector local_6;
    return MarkUtil::FindMarkPositionByMapPosition(Entity, MapPosition, local_6);
}
bool ShouldNavigationBarShowTeammateMarks()
{
    UMarkSettings local_4 = MarkUtil_Internal::GetMinimapMarkIconsSetting();
    if (local_4 != nullptr)
    {
        return local_4.bShowTeammateMarkInNavigationBar;
    }
    return true;
}
FMinimapIconInfo BuildIconInfoFromMarkConfigForUIDisplay(const TDataObjectPtr<FMarkConfig> &inout MarkConfig, const TSoftClassPtr<UUserWidget> &inout IconWidget)
{
    const UMarkSettings local_46;
    bool local_2 = !(MarkConfig && !(IconWidget.IsNull()));
    if (local_2)
    {
        return FMinimapIconInfo();
    }
    GetGameplaySettings<UMarkSettings> local_48;
    local_46 = local_48;
    bool local_1 = !(local_46.PositionMarkPresentationRule);
    if (local_1)
    {
        local_1 = true;
    }
    else
    {
        local_2 = !local_2;
        local_1 = local_2;
    }
    if (local_1)
    {
        return FMinimapIconInfo();
    }
    TDataObjectPtr<FMinimapIconConfig> local_74 = local_46.PositionMarkPresentationRule.opArrow().GetMinimapIconSettings();
    FMinimapIconInfo local_140;
    local_140.DisplaySettings = local_74.opArrow().DisplaySettings;
    local_140.IconSize = local_74.opArrow().IconSize;
    local_140.IconWidget = IconWidget;
    FDataObjectPtr local_168 = MarkConfig.opImplConv();
    FInstancedStruct::InitializeAs(local_140.UserData).opCall(local_168);
    return local_140;
}
FSlateBrush GetMarkIconBrush(const TDataObjectPtr<FMarkIconConfig> &inout MarkIconConfig)
{
    if (!(MarkIconConfig))
    {
        return FSlateBrush();
    }
    else
    {
        const FMarkIconConfig& local_50;
        if (!(local_50.IconBrush.GetResourceObject().IsNull()))
        {
            return local_50.IconBrush.LoadBrush();
        }
        else
        {
            return FEUIUtils::ConvertTextureToBrush(Cast<UTexture2D>(System::LoadAsset_Blocking(local_50.IconTexture)), true);
        }
    }
}
}
namespace MarkUtil_Internal
{
bool PrepareSpaceInMarkPool(FMarkPool &inout MarkPool)
{
    if (MarkPool.IsFull() && !(MarkPool.IsEmpty()))
    {
        FECSEntity local_6 = MarkPool.Pop();
        if (local_6)
        {
            MarkUtil_Internal::DestroyMarkEntity(local_6);
        }
    }
    return !(MarkPool.IsFull());
}
void DestroyMarkEntity(const FECSEntity &inout MarkEntity)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return;
    }
    else
    {
        Modify local_10;
        if (local_10.opCall())
        {
            Modify local_16;
            FC_PlayerMarks& local_18 = local_16.opCall();
            if (local_18)
            {
                FMarkInfo local_54;
                if (local_18.GetModify_AllMarks().RemoveAndCopyValue(MarkEntity.GetId(), local_54))
                {
                    FECSEntity local_64 = FECSEntity(local_54.GetMarkedEntityID());
                    if (local_64)
                    {
                        Modify local_68;
                        FC_Marked& local_70 = local_68.opCall();
                        if (local_70)
                        {
                            if (local_70.MarkPlayers.IsEmpty())
                            {
                                FC_MarkedComponentPendingRemoveTag local_78;
                                Assign local_76;
                                local_76.opCall(local_78);
                            }
                        }
                    }
                    MarkUtil::GetMarkPoolConfig(local_54.GetMarkConfig());
                }
            }
            Modify local_106;
            FC_EntityPool& local_108 = local_106.opCall();
            if (local_108)
            {
                Modify local_112;
                FC_Owner& local_114 = local_112.opCall();
                if (local_114)
                {
                    GetDefaulted local_118;
                    local_114.SetOwnerEntity(local_118.opCall().GetPlayerPawnEntity());
                }
                local_108.Pools[3].PushInactive(MarkEntity, -1);
                return;
            }
        }
    }
}
void ApplyMarkTags(const FECSEntity &inout MarkEntity, const TDataObjectPtr<FMarkConfig> &inout MarkConfig)
{
    const FMarkConfig& local_2;
    if (local_2.bRemoveWhenNoLongerGuidingTarget)
    {
        FC_Mark_RemoveWhenNoLongerGuidingTargetTag local_10;
        Assign local_8;
        local_8.opCall(local_10);
    }
    else
    {
        Remove local_14;
        local_14.opCall();
    }
    if (local_2.RemoveWhenCreaterApproachDistance > 0.0f)
    {
        FC_Mark_RemoveWhenCreaterApproachDistanceTag local_22;
        Assign local_20;
        local_20.opCall(local_22);
        return;
    }
    Remove local_26;
    local_26.opCall();
    return;
}
FECSEntity CreateMarkEntityFromConfig(const FECSEntity &inout CreaterPlayer, const TDataObjectPtr<FMarkConfig> &inout MarkConfig, const FVector &inout Position)
{
    const UMarkSettings local_4;
    FECSEntity __return;
    if (!(!(!(MarkConfig))))
    {
        return ENTITY_NULL;
    }
    GetGameplaySettings<UMarkSettings> local_6;
    local_4 = local_6;
    TSubclassOf<AMarkPrefab> local_10 = local_4.MarkPrefab;
    if (!(local_10.IsValid()))
    {
        return ENTITY_NULL;
    }
    FECSEntity local_14 = FECSEntity(ENTITY_NULL);
    Modify local_18;
    FC_EntityPool& local_20 = local_18.opCall();
    if (local_20)
    {
        GetDefaulted local_24;
        FECSEntity local_28 = local_24.opCall().GetPlayerPawnEntity();
        if (local_28)
        {
            local_14 = local_20.Pools[3].PopActive(local_28, local_10.GetDefaultObject());
            local_14.InitTransform(Position, FQuat::Identity);
            ECS::MarkEntityPrefabPendingInit(local_14, local_10, Position, FQuat::Identity, EPrefabCollisionAlignment(2), false);
        }
    }
    else
    {
        __return = ENTITY_NULL;
    }
    if (local_14)
    {
        MarkUtil_Internal::ApplyMarkTags(local_14, MarkConfig);
    }
    __return = local_14;
    return __return;
}
FECSEntity AddMarkToEntity(const FECSEntity &inout MarkedEntity, const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMarkConfig> &inout MarkConfig)
{
    FVector local_6;
    int local_38 = 0;
    int local_82 = 0;
    int local_132 = 0;
    Get local_10;
    const FC_Transform& local_12 = local_10.opCall();
    if (local_12)
    {
        local_6 = local_12.GetPosition();
    }
    FECSEntity local_22 = MarkUtil_Internal::CreateMarkEntityFromConfig(PlayerEntity, MarkConfig, local_6);
    if ((local_22 == ENTITY_NULL))
    {
        return ENTITY_NULL;
    }
    FFPTime local_26 = FFPTime(PlayerEntity.GetWorld().GetFixedTime().Time);
    local_38.SetCreaterPlayer(PlayerEntity);
    FMarkInfo local_74;
    local_74.SetMarkConfig(MarkConfig);
    local_74.SetMarkTime(local_26);
    local_74.SetMarkedEntityID(MarkedEntity.GetId());
    local_82.GetModify_AllMarks().Add(local_22.GetId(), local_74);
    FVector local_88;
    Get local_92;
    const FC_Collision& local_94 = local_92.opCall();
    if (local_94)
    {
        local_88 = FVector(0.0, 0.0, local_94.GetScaledHeight());
    }
    FC_Owner local_113 = FC_Owner();
    Assign local_112;
    local_112.opCall(local_113).SetOwnerEntity(MarkedEntity);
    FC_NetRelevancePolicy local_119;
    Assign local_118;
    local_118.opCall(local_119).RelevancePolicyType = (3 != 0);
    FAttachmentUtils::EntityAttachToParent(local_22, MarkedEntity, local_26, n"None", false, local_88, FRotator::ZeroRotator, 0.0f, 0.0f, 0, FVector::ZeroVector, 0.0f, false);
    local_132.MarkPlayers.Add(PlayerEntity);
    return local_22;
}
FECSEntity AddMarkToPosition(const FVector &inout Position, const FECSEntity &inout PlayerEntity, const TDataObjectPtr<FMarkConfig> &inout MarkConfig)
{
    int local_22 = 0;
    int local_66 = 0;
    const UMarkSettings local_70;
    FECSEntity local_8 = MarkUtil_Internal::CreateMarkEntityFromConfig(PlayerEntity, MarkConfig, Position);
    if ((local_8 == ENTITY_NULL))
    {
        return ENTITY_NULL;
    }
    local_22.SetCreaterPlayer(PlayerEntity);
    FMarkInfo local_58;
    local_58.SetMarkConfig(MarkConfig);
    local_58.SetMarkTime(PlayerEntity.GetWorld().GetFixedTime().Time);
    local_58.SetMarkedEntityID(ENTITY_ID_NULL);
    local_58.SetMarkPosition(Position);
    local_66.GetModify_AllMarks().Add(local_8.GetId(), local_58);
    GetGameplaySettings<UMarkSettings> local_72;
    local_70 = local_72;
    return local_8;
}
void ChangeMarkConfig(const FECSEntity &inout PlayerEntity, const FECSEntityId &inout MarkEntityID, const TDataObjectPtr<FMarkConfig> &inout NewMarkConfig)
{
    int local_199 = 0;
    int local_202 = 0;
    const UMarkSettings local_212;
    Modify local_4;
    FC_PlayerMarks& local_6 = local_4.opCall();
    if (local_6)
    {
        FMarkInfo local_44;
        if (local_6.GetAllMarks().Find(MarkEntityID, local_44))
        {
            TDataObjectPtr<FMarkConfig> local_68;
            local_68 = local_44.GetMarkConfig();
            if ((!((local_68 == NewMarkConfig.opImplConv()))))
            {
                FECSEntity local_120 = FECSEntity(MarkEntityID);
                TDataObjectPtr<FMarkPoolConfig> local_168 = MarkUtil::GetMarkPoolConfig(NewMarkConfig);
                if ((!((MarkUtil::GetMarkPoolConfig(local_44.GetMarkConfig()) == local_168.opImplConv()))))
                {
                    FMarkPool local_198 = FMarkPool(local_199);
                    if (MarkUtil_Internal::PrepareSpaceInMarkPool(local_202))
                    {
                        local_202.Push(local_120);
                    }
                    else
                    {
                        XError(ELog(53), FString().Append("Failed to prepare space in new mark pool '").Append(local_168.GetDataName()).Append("' for ").Append(local_120).Append("."));
                        MarkUtil_Internal::DestroyMarkEntity(local_120);
                        return;
                    }
                }
                local_44.SetMarkConfig(NewMarkConfig);
                local_6.GetModify_AllMarks()[MarkEntityID] = local_44;
                GetGameplaySettings<UMarkSettings> local_214;
                local_212 = local_214;
                if (ECS::GetRuntimeInfo().IsServer)
                {
                    MarkUtil_Internal::ApplyMarkTags(local_120, NewMarkConfig);
                }
            }
        }
    }
    return;
}
bool FastMarkLineTrace(const FECSEntity &inout PlayerEntity, FECSEntity &out HitEntity, FVector &out HitLocation)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    bool __r; return __r;
}
UMarkSettings GetMinimapMarkIconsSetting()
{
    return GetGameplaySettings<UMarkSettings>();
}
bool CanVisitPlayerMark(const FECSEntity &inout ObserverPlayer, const FECSEntity &inout TargetPlayer, const bool bShareWithTeammates)
{
    if (bShareWithTeammates)
    {
        return FTeamUtils::IsInSameTeam(ObserverPlayer, TargetPlayer);
    }
    return (ObserverPlayer == TargetPlayer);
}
FECSEntityId FindMarkEntityIdByMarkedEntityId(const FECSEntity &inout CreaterPlayer, const FECSEntityId &inout MarkedEntityID)
{
    if ((MarkedEntityID == ENTITY_ID_NULL))
    {
        return ENTITY_ID_NULL;
    }
    Get local_6;
    const FC_PlayerMarks& local_8 = local_6.opCall();
    if (local_8)
    {
        for (auto& local_26 : local_8.GetAllMarks())
        {
            if ((FECSEntityId(GetMarkedEntityID()) == MarkedEntityID))
            {
                return local_26.GetKey();
            }
        }
    }
    return ENTITY_ID_NULL;
}
bool IsMarkExist(const FECSEntity &inout CreaterPlayer, const FECSEntityId &inout MarkEntityID)
{
    Get local_4;
    const FC_PlayerMarks& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.GetAllMarks().Contains(MarkEntityID);
    }
    return false;
}
bool GetMarkInfo(const FECSEntity &inout CreaterPlayer, const FECSEntityId &inout MarkEntityID, FMarkInfo &out MarkInfo)
{
    FMarkInfo local_36;
    MarkInfo = local_36;
    Get local_40;
    const FC_PlayerMarks& local_42 = local_40.opCall();
    if (local_42)
    {
        if (local_42.GetAllMarks().Find(MarkEntityID, MarkInfo))
        {
            return true;
        }
    }
    return false;
}
FECSEntityId FindPlayerVisibleMarkEntityIdByMarkedEntityId(const FECSEntity &inout ObserverPlayer, const FECSEntityId &inout MarkedEntityID, FECSEntity &out CreaterPlayer)
{
    FECSEntity local_4;
    CreaterPlayer = local_4;
    FECSEntityId local_5 = MarkUtil_Internal::FindMarkEntityIdByMarkedEntityId(ObserverPlayer, MarkedEntityID);
    if ((!((local_5 == ENTITY_ID_NULL))))
    {
        CreaterPlayer = ObserverPlayer;
        return local_5;
    }
    FFPTime local_10 = FFPTime(-1);
    for (auto& local_30 : FTeamUtils::GetTeammates(ObserverPlayer))
    {
        FECSEntityId local_6 = MarkUtil_Internal::FindMarkEntityIdByMarkedEntityId(local_30, MarkedEntityID);
        if ((local_6 == ENTITY_ID_NULL))
        {
            continue;
        }
        FMarkInfo local_68;
        if (MarkUtil_Internal::GetMarkInfo(local_30, local_6, local_68) && (FFPTime(local_68.GetMarkTime()).opCmp(local_10) > 0))
        {
            bool local_71 = local_68.GetMarkConfig().opArrow().bShareWithTeammates;
            if (!(MarkUtil_Internal::CanVisitPlayerMark(ObserverPlayer, local_30, local_71)))
            {
                continue;
            }
            local_10 = local_68.GetMarkTime();
            local_5 = local_6;
            CreaterPlayer = local_30;
        }
    }
    return local_5;
}
bool FindPlayerVisibleMarkInfo(const FECSEntity &inout ObserverPlayer, const FECSEntityId &inout MarkEntityID, FMarkInfo &out MarkInfo)
{
    FMarkInfo local_36;
    MarkInfo = local_36;
    TArray<FECSEntity> local_44 = FTeamUtils::GetTeammates(ObserverPlayer);
    if (local_44.IsEmpty())
    {
        local_44.Add(ObserverPlayer);
    }
    for (auto& local_60 : local_44)
    {
        if (MarkUtil_Internal::GetMarkInfo(local_60, MarkEntityID, MarkInfo))
        {
            if (!(MarkUtil_Internal::CanVisitPlayerMark(ObserverPlayer, local_60, MarkInfo.GetMarkConfig().opArrow().bShareWithTeammates)))
            {
                continue;
            }
            return true;
        }
    }
    return false;
}
TDataObjectPtr<FMarkConfig> GetFastMarkConfigByEntity(const FECSEntity &inout Entity)
{
    UMarkSettings local_4 = MarkUtil_Internal::GetMinimapMarkIconsSetting();
    if (local_4 == nullptr)
    {
        return TDataObjectPtr<FMarkConfig>(nullptr);
    }
    if (Entity)
    {
        TDataObjectPtr<FPresentationConfig> local_78 = EntityLevelSpotUtils::GetDefaultPresentationConfig(Entity);
        if (local_78)
        {
            TDataObjectPtr<FMarkConfig> local_126;
            if (local_4.FastMarkBySpotTypeOverrides.Find(local_78.opArrow().SpotType, local_126))
            {
                return local_126;
            }
        }
    }
    return local_4.FastMarkConfig;
}
FLevelSpotViewers GetCurrentViewers(const FECSEntity &inout Player)
{
    FLevelSpotViewers __r;
    FECSEntity local_4 = FTeamUtils::GetTeamEntityForController(Player);
    if (local_4)
    {
        FLevelSpotViewers local_32 = FLevelSpotViewers(local_4);
    }
    else
    {
        FLevelSpotViewers local_32_2 = FLevelSpotViewers(Player);
    }
    return __r;
}
}

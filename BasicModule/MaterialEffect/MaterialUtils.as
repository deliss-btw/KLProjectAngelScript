
namespace FMaterialUtils
{
void RequestOverrideMaterial(const FECSEntity &inout Entity, const FName &inout RequestName, const TArray<FMeshMaterialInfo> &inout MeshMaterialOverrides)
{
    int local_6 = 0;
    TArray<FSingleMaterialParamRequestData> local_10;
    for (auto& local_26 : MeshMaterialOverrides)
    {
        for (auto& local_40 : local_26.Materials)
        {
            FSingleMaterialParamRequestData local_72;
            local_72.SetMeshName(local_26.MeshName);
            local_72.SetbIsOverlayMaterial(local_40.bIsOverlayMaterial);
            local_72.SetbUseSlotName(local_40.bUseSlotName);
            local_72.SetMaterialIndex(int(local_40.MaterialIdx));
            local_72.SetMaterialSlotName(local_40.MaterialSlotName);
            local_72.SetOverrideMaterialPath(local_40.MaterialPath);
            local_10.Add(local_72);
        }
    }
    FMaterialUtils::RequestChangeMaterialParam(local_6.GetModify_Requests(), RequestName, local_10, ECS::GetContextTime());
    return;
}
void RemoveMaterialOverride(const FECSEntity &inout Entity, const FName &inout RequestName)
{
    FMaterialUtils::SyncRemoveChangeMaterialRequest(Entity, RequestName, 0.0f, FSoftObjectPath());
    return;
}
void LocalOnlyRequestChangeMaterialParam(const FECSEntity &inout Entity, const FName &inout RequestName, const TArray<FSingleMaterialParamRequestData> &inout InData)
{
    int local_6 = 0;
    int local_12 = 0;
    FFPTime local_18;
    if (local_12)
    {
        local_18 = local_12.Time;
    }
    else
    {
        local_18 = ECS::GetContextTime();
    }
    FMaterialUtils::RequestChangeMaterialParam(local_6.Requests, RequestName, InData, local_18);
    return;
}
void LocalOnlyRemoveChangeMaterialRequest(const FECSEntity &inout Entity, const FName &inout RequestName, const float32 BlendOutTime, const FSoftObjectPath &inout BlendCurvePath = FSoftObjectPath())
{
    Has local_4;
    int local_12 = 0;
    if (local_4.opCall() == false)
    {
        return;
    }
    int local_14 = FMaterialUtils::FindChangeMaterialRequest(local_12.Requests, RequestName);
    if (local_14 >= 0)
    {
        if (BlendOutTime > 0.0f)
        {
            FChangeMaterialParamRequest& local_18 = local_12.Requests[local_14];
            local_18.SetbIsBlendingOut(true);
            local_18.SetBlendOutTime(BlendOutTime);
            local_18.SetBlendOutStartTime(ECS::GetContextTime());
            local_18.SetStartTime(ECS::GetContextTime());
            local_18.SetBlendOutCurvePath(BlendCurvePath);
            FC_LocalBlendingOutChangeMaterialTag local_26;
            Assign local_24;
            local_24.opCall(local_26);
        }
        else
        {
            local_12.Requests.RemoveAt(local_14);
        }
    }
    if (local_12.Requests.Num() == 0)
    {
        Remove local_32;
        local_32.opCall();
    }
    return;
}
void SyncRequestChangeMaterialParam(const FECSEntity &inout Entity, const FName &inout RequestName, const TArray<FSingleMaterialParamRequestData> &inout InData)
{
    FMaterialUtils::RequestChangeMaterialParam(0.GetModify_Requests(), RequestName, InData, ECS::GetContextTime());
    return;
}
void SyncRemoveChangeMaterialRequest(const FECSEntity &inout Entity, const FName &inout RequestName, const float32 BlendOutTime, const FSoftObjectPath &inout BlendCurvePath = FSoftObjectPath())
{
    Has local_4;
    int local_12 = 0;
    if (local_4.opCall() == false)
    {
        return;
    }
    int local_14 = FMaterialUtils::FindChangeMaterialRequest(local_12.GetModify_Requests(), RequestName);
    if (local_14 >= 0)
    {
        if (BlendOutTime > 0.0f)
        {
            FChangeMaterialParamRequest& local_18 = local_12.GetModify_Requests()[local_14];
            local_18.SetbIsBlendingOut(true);
            local_18.SetBlendOutTime(BlendOutTime);
            local_18.SetBlendOutStartTime(ECS::GetContextTime());
            local_18.SetStartTime(ECS::GetContextTime());
            local_18.SetBlendOutCurvePath(BlendCurvePath);
            FC_SyncBlendingOutChangeMaterialTag local_26;
            Assign local_24;
            local_24.opCall(local_26);
        }
        else
        {
            local_12.GetModify_Requests().RemoveAt(local_14);
        }
    }
    if (local_12.GetRequests().Num() == 0)
    {
        Remove local_32;
        local_32.opCall();
    }
    return;
}
UFUNCTION()
void RequestShowMaterialSection(const FECSEntity &inout Entity, const FName &inout RequestName, const TArray<FShowMaterialSectionSingleRequest> &inout Sections)
{
    int local_6 = 0;
    FShowMaterialSectionRequest local_12;
    local_12.SetRequestName(RequestName);
    local_12.SetSections(Sections);
    local_6.GetModify_Requests().Add(local_12);
    return;
}
UFUNCTION()
void RemoveShowMaterialSectionRequest(const FECSEntity &inout Entity, const FName &inout RequestName)
{
    Has local_4;
    int local_12 = 0;
    if (!(local_4.opCall()) == !(false))
    {
        return;
    }
    int local_13 = 0;
    for (; local_13 < local_12.GetModify_Requests().Num(); ++local_13)
    {
        if ((local_12.GetModify_Requests()[local_13].GetRequestName() == RequestName))
        {
            local_12.GetModify_Requests().RemoveAt(local_13);
            break;
        }
    }
    if (local_12.GetModify_Requests().Num() == 0)
    {
        Remove local_22;
        local_22.opCall();
    }
    return;
}
FSoftObjectPath MakeSoftObjectPathForMaterial(const UMaterialInterface InMat)
{
    UMaterialInterface local_2;
    UMaterialInstanceDynamic local_6 = Cast<UMaterialInstanceDynamic>(InMat);
    while (local_6 != nullptr)
    {
        local_2 = local_6.Parent;
        local_6 = Cast<UMaterialInstanceDynamic>(local_2);
    }
    return FSoftObjectPath(local_2);
}
UMaterialInstanceDynamic CreateOverlayDynamicMaterialInstance(const UMeshComponent MeshComponent)
{
    UMaterialInterface local_2 = MeshComponent.GetOverlayMaterial();
    UMaterialInstanceDynamic local_6 = (Cast<UMaterialInstanceDynamic>(local_2));
    if ((local_2 != nullptr && !((local_6 != nullptr))))
    {
        local_6 = Material::CreateDynamicMaterialInstance(__GetWorldContext(), local_2, NAME_None, EMIDCreationFlags(0));
        MeshComponent.SetOverlayMaterial(local_6);
    }
    return local_6;
}
UFUNCTION()
void SetMeshDitherMaterialOverrideParam(const AGameActor GameActor, const FECSEntity &inout GameActorViewEntity)
{
    if ((!((GameActor != nullptr))))
    {
        return;
    }
    for (auto& local_16 : GameActor.NameToSceneComponentEntries)
    {
        if (!(local_16.VisualComponentToggleInitStateSettings.bActive))
        {
            continue;
        }
        if (!(local_16.VisualComponentToggleInitStateSettings.MeshDitherOverrideMaterialParamConfigs.IsEmpty()))
        {
            FName local_24 = FName(FString().Append("DitherMeshOfLogicName[").Append(local_16.LogicName).Append("]"));
            TArray<FSingleMaterialParamRequestData> local_28;
            for (auto& local_42 : local_16.VisualComponentToggleInitStateSettings.MeshDitherOverrideMaterialParamConfigs)
            {
                if (int(local_42.GetTrigger()) != 0)
                {
                    continue;
                }
                FSingleMaterialParamRequestData local_78;
                local_78.SetbUseLogicName(true);
                local_78.SetMeshName(local_16.LogicName);
                local_78.SetbIsOverlayMaterial(local_42.GetbIsOverlayMaterial());
                local_78.SetbApplyToAllSlot(local_42.GetbApplyToAllSlot());
                local_78.SetbUseSlotName(local_42.GetbUseSlotName());
                local_78.SetMaterialIndex(local_42.GetMaterialIndex());
                local_78.SetMaterialSlotName(local_42.GetMaterialSlotName());
                local_78.SetOverrideMaterialPath(local_42.GetOverrideMaterialPath());
                local_78.SetFloatParams(local_42.GetFloatParams());
                local_78.SetVectorParams(local_42.GetVectorParams());
                local_78.SetTextureParams(local_42.GetTextureParams());
                local_28.Add(local_78);
            }
            FName local_18 = FName(FString().Append("ShowMeshOfLogicName[").Append(local_16.LogicName).Append("]"));
            FMaterialUtils::LocalOnlyRemoveChangeMaterialRequest(GameActorViewEntity, local_18, 0.0f, FSoftObjectPath());
            FMaterialUtils::LocalOnlyRequestChangeMaterialParam(GameActorViewEntity, local_24, local_28);
        }
    }
    for (auto& local_102 : GameActor.NameToSceneComponentGroups)
    {
        if (!(local_102.VisualComponentToggleInitStateSettings.bActive))
        {
            continue;
        }
        if (!(local_102.VisualComponentToggleInitStateSettings.MeshDitherOverrideMaterialParamConfigs.IsEmpty()))
        {
            FName local_18_2 = FName(FString().Append("DitherMeshOfLogicName[").Append(local_102.LogicName).Append("]"));
            TArray<FSingleMaterialParamRequestData> local_28;
            for (auto& local_42 : local_102.VisualComponentToggleInitStateSettings.MeshDitherOverrideMaterialParamConfigs)
            {
                if (int(local_42.GetTrigger()) != 0)
                {
                    continue;
                }
                FSingleMaterialParamRequestData local_78;
                local_78.SetbUseLogicName(true);
                local_78.SetMeshName(local_102.LogicName);
                local_78.SetbIsOverlayMaterial(local_42.GetbIsOverlayMaterial());
                local_78.SetbApplyToAllSlot(local_42.GetbApplyToAllSlot());
                local_78.SetbUseSlotName(local_42.GetbUseSlotName());
                local_78.SetMaterialIndex(local_42.GetMaterialIndex());
                local_78.SetMaterialSlotName(local_42.GetMaterialSlotName());
                local_78.SetOverrideMaterialPath(local_42.GetOverrideMaterialPath());
                local_78.SetFloatParams(local_42.GetFloatParams());
                local_78.SetVectorParams(local_42.GetVectorParams());
                local_78.SetTextureParams(local_42.GetTextureParams());
                local_28.Add(local_78);
            }
            FName local_24_2 = FName(FString().Append("ShowMeshOfLogicName[").Append(local_102.LogicName).Append("]"));
            FMaterialUtils::LocalOnlyRemoveChangeMaterialRequest(GameActorViewEntity, local_24_2, 0.0f, FSoftObjectPath());
            FMaterialUtils::LocalOnlyRequestChangeMaterialParam(GameActorViewEntity, local_18_2, local_28);
        }
    }
    return;
}
UFUNCTION()
void SetMeshShowMaterialOverrideParam(const AGameActor GameActor, const FECSEntity &inout GameActorViewEntity)
{
    if ((!((GameActor != nullptr))))
    {
        return;
    }
    for (auto& local_16 : GameActor.NameToSceneComponentEntries)
    {
        if (!(local_16.VisualComponentToggleInitStateSettings.bActive))
        {
            continue;
        }
        if (!(local_16.VisualComponentToggleInitStateSettings.MeshDitherOverrideMaterialParamConfigs.IsEmpty()))
        {
            FName local_24 = FName(FString().Append("ShowMeshOfLogicName[").Append(local_16.LogicName).Append("]"));
            TArray<FSingleMaterialParamRequestData> local_28;
            for (auto& local_42 : local_16.VisualComponentToggleInitStateSettings.MeshDitherOverrideMaterialParamConfigs)
            {
                if (int(local_42.GetTrigger()) != 1)
                {
                    continue;
                }
                FSingleMaterialParamRequestData local_78;
                local_78.SetbUseLogicName(true);
                local_78.SetMeshName(local_16.LogicName);
                local_78.SetbIsOverlayMaterial(local_42.GetbIsOverlayMaterial());
                local_78.SetbApplyToAllSlot(local_42.GetbApplyToAllSlot());
                local_78.SetbUseSlotName(local_42.GetbUseSlotName());
                local_78.SetMaterialIndex(local_42.GetMaterialIndex());
                local_78.SetMaterialSlotName(local_42.GetMaterialSlotName());
                local_78.SetOverrideMaterialPath(local_42.GetOverrideMaterialPath());
                local_78.SetFloatParams(local_42.GetFloatParams());
                local_78.SetVectorParams(local_42.GetVectorParams());
                local_78.SetTextureParams(local_42.GetTextureParams());
                local_28.Add(local_78);
            }
            FName local_18 = FName(FString().Append("DitherMeshOfLogicName[").Append(local_16.LogicName).Append("]"));
            FMaterialUtils::LocalOnlyRemoveChangeMaterialRequest(GameActorViewEntity, local_18, 0.0f, FSoftObjectPath());
            FMaterialUtils::LocalOnlyRequestChangeMaterialParam(GameActorViewEntity, local_24, local_28);
        }
    }
    for (auto& local_102 : GameActor.NameToSceneComponentGroups)
    {
        if (!(local_102.VisualComponentToggleInitStateSettings.bActive))
        {
            continue;
        }
        if (!(local_102.VisualComponentToggleInitStateSettings.MeshDitherOverrideMaterialParamConfigs.IsEmpty()))
        {
            FName local_18_2 = FName(FString().Append("ShowMeshOfLogicName[").Append(local_102.LogicName).Append("]"));
            TArray<FSingleMaterialParamRequestData> local_28;
            for (auto& local_42 : local_102.VisualComponentToggleInitStateSettings.MeshDitherOverrideMaterialParamConfigs)
            {
                if (int(local_42.GetTrigger()) != 1)
                {
                    continue;
                }
                FSingleMaterialParamRequestData local_78;
                local_78.SetbUseLogicName(true);
                local_78.SetMeshName(local_102.LogicName);
                local_78.SetbIsOverlayMaterial(local_42.GetbIsOverlayMaterial());
                local_78.SetbApplyToAllSlot(local_42.GetbApplyToAllSlot());
                local_78.SetbUseSlotName(local_42.GetbUseSlotName());
                local_78.SetMaterialIndex(local_42.GetMaterialIndex());
                local_78.SetMaterialSlotName(local_42.GetMaterialSlotName());
                local_78.SetOverrideMaterialPath(local_42.GetOverrideMaterialPath());
                local_78.SetFloatParams(local_42.GetFloatParams());
                local_78.SetVectorParams(local_42.GetVectorParams());
                local_78.SetTextureParams(local_42.GetTextureParams());
                local_28.Add(local_78);
            }
            FName local_24_2 = FName(FString().Append("DitherMeshOfLogicName[").Append(local_102.LogicName).Append("]"));
            FMaterialUtils::LocalOnlyRemoveChangeMaterialRequest(GameActorViewEntity, local_24_2, 0.0f, FSoftObjectPath());
            FMaterialUtils::LocalOnlyRequestChangeMaterialParam(GameActorViewEntity, local_18_2, local_28);
        }
    }
    return;
}
void RequestChangeMaterialParam(TArray<FChangeMaterialParamRequest> &inout ChangeMaterialParamRequests, const FName &inout RequestName, const TArray<FSingleMaterialParamRequestData> &inout Data, const FFPTime &inout StartTime)
{
    int local_1 = 0;
    for (; local_1 < ChangeMaterialParamRequests.Num(); ++local_1)
    {
        FChangeMaterialParamRequest& local_6 = ChangeMaterialParamRequests[local_1];
        if ((local_6.GetRequestName() == RequestName))
        {
            if (local_6.GetbIsBlendingOut())
            {
                ChangeMaterialParamRequests.RemoveAt(local_1);
                break;
            }
            local_6.SetStartTime(StartTime);
            local_6.SetData(Data);
            return;
        }
    }
    FChangeMaterialParamRequest local_32;
    local_32.SetRequestName(RequestName);
    local_32.SetStartTime(StartTime);
    local_32.SetData(Data);
    ChangeMaterialParamRequests.Add(local_32);
    return;
}
int FindChangeMaterialRequest(TArray<FChangeMaterialParamRequest> &inout ChangeMaterialParamRequests, const FName &inout RequestName)
{
    int local_1 = 0;
    for (; local_1 < ChangeMaterialParamRequests.Num(); ++local_1)
    {
        if ((ChangeMaterialParamRequests[local_1].GetRequestName() == RequestName))
        {
            return local_1;
        }
    }
    return -1;
}
}


namespace CutSceneUtils
{
void PlayCutScene(const FECSEntity &inout PlayerPawnEntity, const FName &inout PlayerTag, const TDataObjectPtr<FCutSceneData> &inout CutSceneData, const TMap<FName, FECSEntity> &inout Entities, const FVector &inout OriginLocation, const FRotator &inout OriginRotation, const bool bCrossDS = false)
{
    int local_24 = 0;
    int local_34 = 0;
    FQuat local_120;
    FVector local_126;
    if (!(CutSceneData))
    {
        return;
    }
    FCutSceneData local_4;
    ULevelSequence local_18 = (Cast<ULevelSequence>(local_4.LevelSequence.ToSoftObjectPath().TryLoad()));
    if (local_18 == nullptr)
    {
        return;
    }
    if (!(local_24))
    {
        return;
    }
    Has local_28;
    bool local_1 = local_28.opCall();
    if (local_1)
    {
        return;
    }
    local_34.SetStartTime(ECS::GetContextTime());
    local_34.SetDuration(FFPTime(local_18.GetDuration()));
    local_34.SetLevelSequence(TSoftObjectPtr<ULevelSequence>(local_18));
    local_34.SetCutSceneData(CutSceneData);
    local_34.SetPlayerTag(PlayerTag);
    local_34.SetEntities(Entities);
    local_34.SetbCrossDS(bCrossDS);
    local_34.SetOriginLocation(OriginLocation);
    local_34.SetOriginRotation(OriginRotation);
    TConstRawPtr<FCutSceneEntityInfo> local_52 = local_4.EntityInfos.Find(PlayerTag);
    if (local_52)
    {
        if (UTagTargetPointManager::Get().GetTagTransform(local_52.opArrow().StartLocationTag).IsSet())
        {
            FFPTime local_36 = FFPTime(-1);
            local_120.GetRotation();
            local_126.GetLocation();
            PlayerPawnEntity.MoveTo(CutSceneUtils::GetOffsetFloorLocation(PlayerPawnEntity, local_126), local_120, local_36);
        }
    }
    FECSEntity local_156;
    for (auto& local_152 : Entities)
    {
        TConstRawPtr<FCutSceneEntityInfo> local_54 = local_4.EntityInfos.Find(local_152.GetKey());
        if (!(local_54))
        {
            local_1 = false;
        }
        else
        {
            local_1 = local_156;
        }
        if (local_1)
        {
            if (UTagTargetPointManager::Get().GetTagTransform(local_54.opArrow().StartLocationTag).IsSet())
            {
                FFPTime local_36_2 = FFPTime(-1);
                local_120.GetRotation();
                local_126.GetLocation();
                local_156.MoveTo(CutSceneUtils::GetOffsetFloorLocation(local_156, local_126), local_120, local_36_2);
            }
        }
    }
    return;
}
FVector GetOffsetFloorLocation(const FECSEntity &inout PawnEntity, const FVector &inout Position)
{
    int local_6 = 0;
    FVector local_12 = Position;
    local_12.Z += (local_6.GetScaledHeight() * 0.5f);
    return local_12;
}
void InvokeSkipCutScene()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    GetDefaulted local_6;
    if (FECSEntity(local_6.opCall().PlayerEntity))
    {
        Get local_16;
        const FC_CutSceneLogicData& local_18 = local_16.opCall();
        if (local_18)
        {
            if (local_18.GetbSupportSkip())
            {
                SendEvent local_22;
                local_22.opCall(FFPTime(-1));
            }
        }
    }
    return;
}
}

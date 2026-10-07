
namespace EcologyPropUtils
{
FName GetWeatherName(const FECSEntity &inout Entity)
{
    int local_6 = 0;
    if (!(local_6))
    {
        return NAME_None;
    }
    FECSEntity local_16 = FWeatherUtils::GetWeatherRegionEntityBySoftPtr(local_6.LayoutInfo.SpawnerBoundWeatherVolume);
    if (local_16.IsValid())
    {
        return FWeatherUtils::GetWeatherNameFromRegionEntity(local_16);
    }
    return NAME_None;
}
bool CalculateActivationState(const FECSEntity &inout Entity, bool &out bOutShow)
{
    TDataObjectPtr<FEcologyResourceDefinitionRow> local_6;
    int local_8;
    int local_9;
    int local_10;
    float32 local_40 = 0.0f;
    bOutShow = false;
    if ((local_6 == NAME_None))
    {
        return false;
    }
    int local_12 = FTimeOfDayUtils::GetCurrentTimeOfDayInSeconds();
    FTimeOfDayUtils::GetTimeOfDayHourAndMinute(local_12, local_8, local_9, local_10);
    int local_11 = FEcologySceneInfoUtils::CombineDayTime(local_9, local_10);
    Modify local_18;
    FC_EcologyPropLayoutInfo& local_20 = local_18.opCall();
    if (local_20)
    {
        bool local_7;
        if ((local_20.CachedSpawnerEntityId == ENTITY_ID_NULL))
        {
            local_20.CachedSpawnerEntityId = EcologyConfigUtils::FindConfigByUUID(local_20.LayoutInfo.SpawnerGUID, ECS::GetECSWorld());
        }
        local_7 = !((local_20.CachedSpawnerEntityId == ENTITY_ID_NULL));
        if (local_7)
        {
            FECSEntity local_32 = FECSEntity(local_20.CachedSpawnerEntityId);
            Get local_36;
            const FC_EcoCollectableSpawnerRuntime& local_38 = local_36.opCall();
            if (local_38)
            {
                if (local_20.LayoutInfo.EcologyPropDef.IsSet())
                {
                    TDataObjectPtr<FSpawnerCountRatioDefinitionRow> local_136;
                    float32 local_39;
                    local_39 = 1.0f;
                    TDataObjectPtr<FEcologyResourceDefinitionRow> local_112 = TDataObjectPtr<FEcologyResourceDefinitionRow>(nullptr);
                    FDataObjectPtr local_88;
                    local_88;
                    if (local_136.IsSet())
                    {
                        local_39 = local_40;
                    }
                    if (local_38.EcologyPropDefToCountMap.Contains(local_20.LayoutInfo.EcologyPropDef))
                    {
                        int local_161;
                        local_161 = local_38.EcologyPropDefToCountMap[local_20.LayoutInfo.EcologyPropDef];
                        if (local_20.LayoutInfo.BakedOrderIndex == -1)
                        {
                            local_7 = false;
                        }
                        else
                        {
                            local_40 = local_161;
                            local_40 = local_40 * local_39;
                            local_7 = (local_20.LayoutInfo.BakedOrderIndex >= local_40);
                        }
                        if (local_7)
                        {
                            bOutShow = false;
                            return true;
                        }
                        bOutShow = true;
                        return true;
                    }
                }
            }
            else
            {
            }
        }
        else
        {
        }
    }
    bOutShow = true;
    return false;
}
}

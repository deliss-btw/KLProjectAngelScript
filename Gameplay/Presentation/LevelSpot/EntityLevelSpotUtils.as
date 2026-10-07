
namespace EntityLevelSpotUtils
{
void AddSpotData(const FECSEntity &inout Entity, const ELevelSpotDataSource ConfigSource, const FLevelSpotData &inout Data)
{
    EntityLevelSpotUtils::AddSpotDataForViewers(Entity, ELevelSpotDataSource(ConfigSource), Data, FLevelSpotViewers::AllViewers);
    return;
}
void AddSpotDataForViewers(const FECSEntity &inout Entity, const ELevelSpotDataSource ConfigSource, const FLevelSpotData &inout Data, const FLevelSpotViewers &inout Viewers)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return;
    }
    ModifyOrAdd local_10;
    FC_LevelSpot& local_12 = local_10.opCall();
    if (local_12)
    {
        FLevelSpotOverrideInfo& local_14 = local_12.GetModify_LevelSpotInfo().ModifyOrAddOverride();
        local_14.SetData(Data);
        local_14.SetViewers(Viewers);
    }
    return;
}
FLevelSpotData GetSpotData(const FECSEntity &inout Entity, const ELevelSpotDataSource ConfigSource)
{
    Get local_4;
    FLevelSpotData __r;
    if (local_4.opCall())
    {
    }
    else
    {
    }
    return __r;
}
void ChangeSpotData(const FECSEntity &inout Entity, const ELevelSpotDataSource ConfigSource, const FLevelSpotData &inout Data)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return;
    }
    else
    {
        TRawPtr<FLevelSpotOverrideInfo> local_8 = EntityLevelSpotUtils_Internal::FindExistingConfigPtr(Entity, ELevelSpotDataSource(ConfigSource));
        if (local_8)
        {
            local_8.opArrow().SetData(Data);
            return;
        }
    }
}
void ChangeSpotDataViewers(const FECSEntity &inout Entity, const ELevelSpotDataSource ConfigSource, const FLevelSpotViewers &inout Viewers)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return;
    }
    else
    {
        TRawPtr<FLevelSpotOverrideInfo> local_8 = EntityLevelSpotUtils_Internal::FindExistingConfigPtr(Entity, ELevelSpotDataSource(ConfigSource));
        if (local_8)
        {
            local_8.opArrow().SetViewers(Viewers);
            return;
        }
    }
}
void SetSpotDataVisibilityForViewer(const FECSEntity &inout Entity, const ELevelSpotDataSource ConfigSource, const FECSEntity &inout Viewer, const bool bVisibleToViewer)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return;
    }
    else
    {
        TRawPtr<FLevelSpotOverrideInfo> local_8 = EntityLevelSpotUtils_Internal::FindExistingConfigPtr(Entity, ELevelSpotDataSource(ConfigSource));
        if (local_8)
        {
            if (bVisibleToViewer)
            {
                local_8.opArrow().GetModify_Viewers().AddViewer(Viewer);
            }
            else
            {
                local_8.opArrow().GetModify_Viewers().RemoveViewer(Viewer);
            }
            return;
        }
    }
}
void RemoveSpotData(const FECSEntity &inout Entity, const ELevelSpotDataSource ConfigSource)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return;
    }
    ModifyAndMarkDirtyManually local_10;
    FC_LevelSpot& local_12 = local_10.opCall();
    if (local_12)
    {
        if (local_12.GetModify_LevelSpotInfo().RemoveOverride())
        {
            MarkModifiedIfDirty local_16;
            local_16.opCall(local_12);
        }
    }
    return;
}
FLevelSpotId GetMainSpotId(const FECSEntity &inout Entity)
{
    FLevelSpotId __r;
    FLevelSpotId local_2 = FLevelSpotId(Entity.GetId());
    return __r;
}
FLevelSpotData GetSpotDataForPlayer(const FECSEntity &inout Entity, const FECSEntity &inout PlayerEntity)
{
    FLevelSpotData __r;
    Get local_4;
    const FC_LevelSpot& local_6 = local_4.opCall();
    if (local_6)
    {
        LevelSpotViewerUtils::GetLevelSpotDataFromSpotInfo(PlayerEntity, local_6.GetLevelSpotInfo());
    }
    else
    {
    }
    return __r;
}
TDataObjectPtr<FPresentationConfig> GetDefaultPresentationConfig(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_LevelSpotConfig& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.PresentationConfig;
    }
    Get local_36;
    if (local_36.opCall())
    {
        CastTo local_42;
        return local_42.opCall();
    }
    Get local_70;
    const FC_NPCInfo& local_72 = local_70.opCall();
    if (local_72)
    {
        if (local_72.GetMainConfig().IsSet())
        {
            CastTo local_76;
            return local_76.opCall();
        }
    }
    Get local_80;
    const FC_TreasureBoxConfig& local_82 = local_80.opCall();
    if (local_82)
    {
        TDataObjectPtr<FTreasureBoxStateConfig> local_106 = local_82.StateConfig;
        if (local_106)
        {
            return local_106.opArrow().Default.PresentationConfig;
        }
    }
    return TDataObjectPtr<FPresentationConfig>(nullptr);
}
}
namespace EntityLevelSpotUtils_Internal
{
TRawPtr<FLevelSpotOverrideInfo> FindExistingConfigPtr(const FECSEntity &inout Entity, const ELevelSpotDataSource ConfigSource)
{
    Modify local_4;
    FC_LevelSpot& local_6 = local_4.opCall();
    if (local_6)
    {
        if (!(local_6.GetLevelSpotInfo().HasOverride()))
        {
            return TRawPtr<FLevelSpotOverrideInfo>(nullptr);
        }
        return TRawPtr<FLevelSpotOverrideInfo>(local_6.GetModify_LevelSpotInfo().ModifyOrAddOverride());
    }
    return TRawPtr<FLevelSpotOverrideInfo>(nullptr);
}
}

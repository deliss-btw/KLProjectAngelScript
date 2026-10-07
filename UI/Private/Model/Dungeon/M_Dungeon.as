
namespace FM_Dungeon
{
    const int ModelId = 0;

}
struct FM_Dungeon : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TDataObjectPtr<FDungeonConfig> m_DungeonConfig;

    FM_Dungeon()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_Dungeon(const FM_Dungeon &inout Other)
    {
        this.m_DungeonConfig = Other.m_DungeonConfig;
        return;
    }
    FM_Dungeon& opAssign(const FM_Dungeon &inout Other)
    {
        return Other.m_DungeonConfig;
    }
    bool SetFromServerData(const FPbDungeonInfo &inout ServerInfo, const bool bIsInstancedCommission)
    {
        int local_25 = ServerInfo.GetDungeonId();
        GetDataObjectByGSDataId<FDungeonConfig> local_24;
        this.SetDungeonConfig(local_24.opImplConv());
        if (!(this.GetDungeonConfig()))
        {
            return false;
        }
        return true;
    }
    TDataObjectPtr<FDungeonConfig> GetDungeonConfig() const property
    {
        TDataObjectPtr<FDungeonConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FDungeonConfig> GetModify_DungeonConfig() property
    {
        TDataObjectPtr<FDungeonConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDungeonConfig(const TDataObjectPtr<FDungeonConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DungeonConfig = __Value;
        return;
    }
}

namespace FM_Dungeon
{
FM_Dungeon& Create(const UObject ContextObject)
{
    return FM_Dungeon::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_Dungeon CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_Dungeon __r;
    TEUIModelRef<FM_Dungeon> local_6 = TEUIModelRef<FM_Dungeon>(EUIInternal::MakeModelWithManager(Manager, FM_Dungeon::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_Dungeon;
}
int __IndexOf_DungeonConfig()
{
    return 0;
}
}

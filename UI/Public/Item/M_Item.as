
namespace FM_ItemData
{
    const int ModelId = 0;

}
struct FM_ItemData : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_Config;
    UPROPERTY()
    int m_Num;

    FM_ItemData()
    {
        this.m_Num = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_ItemData(const FM_ItemData &inout Other)
    {
        this.m_Num = 0;
        this.m_Config = Other.m_Config;
        this.m_Num = int(Other.m_Num);
        return;
    }
    FM_ItemData opAssign(const FM_ItemData &inout Other)
    {
        FM_ItemData __r;
        this.m_Config = Other.m_Config;
        this.m_Num = int(Other.m_Num);
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetConfig() const property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_Config() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Config = __Value;
        return;
    }
    int GetNum() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Num;
    }
    void SetNum(const int __Value) property
    {
        if (this.m_Num == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Num = __Value;
        return;
    }
}

namespace FM_ItemData
{
FM_ItemData& Create(const UObject ContextObject)
{
    return FM_ItemData::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_ItemData CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_ItemData __r;
    TEUIModelRef<FM_ItemData> local_6 = TEUIModelRef<FM_ItemData>(EUIInternal::MakeModelWithManager(Manager, FM_ItemData::ModelId));
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
    return FM_ItemData;
}
int __IndexOf_Config()
{
    return 0;
}
int __IndexOf_Num()
{
    return 1;
}
}

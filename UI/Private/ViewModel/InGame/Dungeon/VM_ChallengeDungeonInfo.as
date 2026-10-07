
namespace FVM_ChallengeDungeonInfo
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature StartDungeon = FEUIModelCallbackSignature();

}
struct FVM_ChallengeDungeonInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Dungeon> m_DungeonModel;

    FVM_ChallengeDungeonInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ChallengeDungeonInfo' by default constructor.");
        return;
    }
    FVM_ChallengeDungeonInfo(const FVM_ChallengeDungeonInfo &inout Other)
    {
        this.m_DungeonModel = Other.m_DungeonModel;
        return;
    }
    FVM_ChallengeDungeonInfo(const TEUIModelRef<FM_Dungeon> &inout InDungeonModel)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetDungeonModel(InDungeonModel);
        return;
    }
    FVM_ChallengeDungeonInfo& opAssign(const FVM_ChallengeDungeonInfo &inout Other)
    {
        return Other.m_DungeonModel;
    }
    void PostConstruct()
    {
        return;
    }
    TDataObjectPtr<FDungeonConfig> GetDungeonConfig() const property
    {
        return this.GetDungeonModel().opArrow().GetDungeonConfig();
    }
    FSoftBrush GetDungeonIcon() const
    {
        // body not fully recovered вЂ” stub [no-return]
        FSoftBrush __r; return __r;
    }
    void StartDungeon()
    {
        return;
    }
    TEUIModelRef<FM_Dungeon> GetDungeonModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_DungeonModel;
    }
    void SetDungeonModel(const TEUIModelRef<FM_Dungeon> &inout __Value) property
    {
        TEUIModelRef<FM_Dungeon> local_2;
        local_2 = this.m_DungeonModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DungeonModel = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ChallengeDungeonInfo
{
    UPROPERTY()
    TDataObjectPtr<FDungeonConfig> DungeonConfig;
    UPROPERTY()
    FSoftBrush DungeonIcon;
    UPROPERTY()
    TEUIModelRef<FVM_ChallengeDungeonInfo> Self;

    __GeneratedProperties_FVM_ChallengeDungeonInfo()
    {
        return;
    }
}

namespace FVM_ChallengeDungeonInfo
{
FVM_ChallengeDungeonInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_Dungeon> &inout DungeonModel)
{
    return FVM_ChallengeDungeonInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), DungeonModel);
}
FVM_ChallengeDungeonInfo CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Dungeon> &inout DungeonModel)
{
    FVM_ChallengeDungeonInfo __r;
    TEUIModelRef<FVM_ChallengeDungeonInfo> local_6 = TEUIModelRef<FVM_ChallengeDungeonInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ChallengeDungeonInfo::ModelId, 0, DungeonModel));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DungeonConfig";
    local_14.TypeName = "TDataObjectPtr<FDungeonConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DungeonIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ChallengeDungeonInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ChallengeDungeonInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ChallengeDungeonInfo;
}
TDataObjectPtr<FDungeonConfig> __UIGetter_DungeonConfig(const FVM_ChallengeDungeonInfo &inout Model)
{
    return Model.GetDungeonConfig();
}
FSoftBrush __UIGetter_DungeonIcon(const FVM_ChallengeDungeonInfo &inout Model)
{
    return Model.GetDungeonIcon();
}
TEUIModelRef<FVM_ChallengeDungeonInfo> __UIGetter_Self(const FVM_ChallengeDungeonInfo &inout Model)
{
    return TEUIModelRef<FVM_ChallengeDungeonInfo>(Model);
}
int __IndexOf_DungeonModel()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_ChallengeDungeonInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

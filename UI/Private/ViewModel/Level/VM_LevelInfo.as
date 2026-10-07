
namespace FVM_LevelInfo
{
    const int ModelId = 0;

}
struct FVM_LevelInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FLevelInfoConfig> m_LevelInfoConfig;

    FVM_LevelInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetLevelInfoConfig(::FLevelUtils::GetCurrentLevelInfoConfig(nullptr));
        return;
    }
    FVM_LevelInfo(const FVM_LevelInfo &inout Other)
    {
        this.m_LevelInfoConfig = Other.m_LevelInfoConfig;
        return;
    }
    FVM_LevelInfo(const TDataObjectPtr<FLevelInfoConfig> &inout InLevelInfoConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetLevelInfoConfig(InLevelInfoConfig);
        return;
    }
    FVM_LevelInfo& opAssign(const FVM_LevelInfo &inout Other)
    {
        return Other.m_LevelInfoConfig;
    }
    FText GetLevelTitleRichText() const
    {
        if (!(this.GetLevelInfoConfig()))
        {
            return FText();
        }
        TDataObjectPtr<FMapConfig> local_30 = this.GetLevelInfoConfig().opArrow().GetMapConfig();
        if (local_30 && !(local_30.opArrow().MapName.IsEmpty()))
        {
            return FText::Format(INVTEXT("{0} <Beige24>/ {1}</>"), local_30.opArrow().MapName, this.GetLevelInfoConfig().opArrow().LevelDisplayName);
        }
        return this.GetLevelInfoConfig().opArrow().LevelDisplayName;
    }
    const TDataObjectPtr<FLevelInfoConfig> GetLevelInfoConfig() const property
    {
        const TDataObjectPtr<FLevelInfoConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FLevelInfoConfig> GetModify_LevelInfoConfig() property
    {
        TDataObjectPtr<FLevelInfoConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetLevelInfoConfig(const TDataObjectPtr<FLevelInfoConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LevelInfoConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_LevelInfo
{
    UPROPERTY()
    FText LevelTitleRichText;
    UPROPERTY()
    TEUIModelRef<FVM_LevelInfo> Self;

    __GeneratedProperties_FVM_LevelInfo()
    {
        return;
    }
}

namespace FVM_LevelInfo
{
FVM_LevelInfo& Create(const UObject ContextObject)
{
    return FVM_LevelInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_LevelInfo CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_LevelInfo __r;
    TEUIModelRef<FVM_LevelInfo> local_6 = TEUIModelRef<FVM_LevelInfo>(EUIInternal::MakeModelWithManager(Manager, FVM_LevelInfo::ModelId));
    return __r;
}
FVM_LevelInfo& Create(const UObject ContextObject, const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfoConfig)
{
    return FVM_LevelInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), LevelInfoConfig);
}
FVM_LevelInfo CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FLevelInfoConfig> &inout LevelInfoConfig)
{
    FVM_LevelInfo __r;
    TEUIModelRef<FVM_LevelInfo> local_6 = TEUIModelRef<FVM_LevelInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_LevelInfo::ModelId, 0, LevelInfoConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "LevelInfoConfig";
    local_14.TypeName = "TDataObjectPtr<FLevelInfoConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LevelTitleRichText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_LevelInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_LevelInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_LevelInfo;
}
TDataObjectPtr<FLevelInfoConfig> __UIGetter_LevelInfoConfig(const FVM_LevelInfo &inout Model)
{
    return Model.GetLevelInfoConfig();
}
FText __UIGetter_LevelTitleRichText(const FVM_LevelInfo &inout Model)
{
    return Model.GetLevelTitleRichText();
}
TEUIModelRef<FVM_LevelInfo> __UIGetter_Self(const FVM_LevelInfo &inout Model)
{
    return TEUIModelRef<FVM_LevelInfo>(Model);
}
int __IndexOf_LevelInfoConfig()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_LevelInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}


namespace FVM_GuideMinimapIcon
{
    const int ModelId = 0;

}
struct FVM_GuideMinimapIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FGuidePresentationConfig> m_GuidePresentationConfig;

    FVM_GuideMinimapIcon()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_GuideMinimapIcon' by default constructor.");
        return;
    }
    FVM_GuideMinimapIcon(const FVM_GuideMinimapIcon &inout Other)
    {
        this.m_GuidePresentationConfig = Other.m_GuidePresentationConfig;
        return;
    }
    FVM_GuideMinimapIcon(const TDataObjectPtr<FGuidePresentationConfig> &inout InGuidePresentationConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetGuidePresentationConfig(InGuidePresentationConfig);
        return;
    }
    FVM_GuideMinimapIcon& opAssign(const FVM_GuideMinimapIcon &inout Other)
    {
        return Other.m_GuidePresentationConfig;
    }
    FLinearColor GetIconColor() const
    {
        if (this.GetGuidePresentationConfig().IsSet())
        {
            return this.GetGuidePresentationConfig().opArrow().GuideColor;
        }
        return FLinearColor::Red;
    }
    const TDataObjectPtr<FGuidePresentationConfig> GetGuidePresentationConfig() const property
    {
        const TDataObjectPtr<FGuidePresentationConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FGuidePresentationConfig> GetModify_GuidePresentationConfig() property
    {
        TDataObjectPtr<FGuidePresentationConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetGuidePresentationConfig(const TDataObjectPtr<FGuidePresentationConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_GuidePresentationConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_GuideMinimapIcon
{
    UPROPERTY()
    FLinearColor IconColor;
    UPROPERTY()
    TEUIModelRef<FVM_GuideMinimapIcon> Self;

    __GeneratedProperties_FVM_GuideMinimapIcon()
    {
        return;
    }
}

namespace FVM_GuideMinimapIcon
{
FVM_GuideMinimapIcon& Create(const UObject ContextObject, const TDataObjectPtr<FGuidePresentationConfig> &inout GuidePresentationConfig)
{
    return FVM_GuideMinimapIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), GuidePresentationConfig);
}
FVM_GuideMinimapIcon CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FGuidePresentationConfig> &inout GuidePresentationConfig)
{
    FVM_GuideMinimapIcon __r;
    TEUIModelRef<FVM_GuideMinimapIcon> local_6 = TEUIModelRef<FVM_GuideMinimapIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_GuideMinimapIcon::ModelId, 0, GuidePresentationConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "IconColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_GuideMinimapIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_GuideMinimapIcon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_GuideMinimapIcon;
}
FLinearColor __UIGetter_IconColor(const FVM_GuideMinimapIcon &inout Model)
{
    return Model.GetIconColor();
}
TEUIModelRef<FVM_GuideMinimapIcon> __UIGetter_Self(const FVM_GuideMinimapIcon &inout Model)
{
    return TEUIModelRef<FVM_GuideMinimapIcon>(Model);
}
int __IndexOf_GuidePresentationConfig()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_GuideMinimapIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}


namespace FVM_MarkIcon
{
    const int ModelId = 0;

}
struct FVM_MarkIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FPresentationConfig> m_PresentationConfig;
    UPROPERTY()
    bool m_bIsSelfCreate;
    UPROPERTY()
    FSlateBrush m_IconBrush;
    UPROPERTY()
    FLinearColor m_IconBackgroundColor;

    FVM_MarkIcon()
    {
        this.m_bIsSelfCreate = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MarkIcon' by default constructor.");
        return;
    }
    FVM_MarkIcon(const FVM_MarkIcon &inout Other)
    {
        this.m_bIsSelfCreate = false;
        this.m_PresentationConfig = Other.m_PresentationConfig;
        this.m_bIsSelfCreate = Other.m_bIsSelfCreate;
        this.m_IconBrush = Other.m_IconBrush;
        this.m_IconBackgroundColor = Other.m_IconBackgroundColor;
        return;
    }
    FVM_MarkIcon(const TDataObjectPtr<FPresentationConfig> &inout InPresentationConfig, const bool InbIsSelfCreate)
    {
        this.m_bIsSelfCreate = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetPresentationConfig(InPresentationConfig);
        this.SetbIsSelfCreate(InbIsSelfCreate);
        return;
    }
    FVM_MarkIcon& opAssign(const FVM_MarkIcon &inout Other)
    {
        this.m_PresentationConfig = Other.m_PresentationConfig;
        this.m_bIsSelfCreate = Other.m_bIsSelfCreate;
        this.m_IconBrush = Other.m_IconBrush;
        return Other.m_IconBackgroundColor;
    }
    void PostConstruct()
    {
        if (!(this.GetPresentationConfig()))
        {
            return;
        }
        this.SetIconBrush(this.GetPresentationConfig().opArrow().GetDefaultIcon().LoadBrush());
        if (this.GetbIsSelfCreate())
        {
            this.SetIconBackgroundColor(FLinearColor(1.0f, 0.931684f, 0.472851f, 1.0f));
            return;
        }
        this.SetIconBackgroundColor(FLinearColor(0.400286f, 0.852326f, 0.937255f, 1.0f));
        return;
    }
    TDataObjectPtr<FPresentationConfig> GetPresentationConfig() const property
    {
        TDataObjectPtr<FPresentationConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FPresentationConfig> GetModify_PresentationConfig() property
    {
        TDataObjectPtr<FPresentationConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPresentationConfig(const TDataObjectPtr<FPresentationConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PresentationConfig = __Value;
        return;
    }
    bool GetbIsSelfCreate() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsSelfCreate;
    }
    void SetbIsSelfCreate(const bool __Value) property
    {
        if (!(this.m_bIsSelfCreate) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsSelfCreate = __Value;
        return;
    }
    FSlateBrush GetIconBrush() const property
    {
        FSlateBrush __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSlateBrush GetModify_IconBrush() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetIconBrush(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_IconBrush = __Value;
        return;
    }
    const FLinearColor GetIconBackgroundColor() const property
    {
        const FLinearColor __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FLinearColor GetModify_IconBackgroundColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetIconBackgroundColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_IconBackgroundColor = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MarkIcon
{
    UPROPERTY()
    TEUIModelRef<FVM_MarkIcon> Self;

    __GeneratedProperties_FVM_MarkIcon()
    {
        return;
    }
}

namespace FVM_MarkIcon
{
FVM_MarkIcon& Create(const UObject ContextObject, const TDataObjectPtr<FPresentationConfig> &inout PresentationConfig, const bool bIsSelfCreate)
{
    return FVM_MarkIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), PresentationConfig, bIsSelfCreate);
}
FVM_MarkIcon CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FPresentationConfig> &inout PresentationConfig, const bool bIsSelfCreate)
{
    FVM_MarkIcon __r;
    TEUIModelRef<FVM_MarkIcon> local_6 = TEUIModelRef<FVM_MarkIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MarkIcon::ModelId, 0, PresentationConfig, bIsSelfCreate));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "IconBrush";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IconBackgroundColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MarkIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MarkIcon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MarkIcon;
}
FSlateBrush __UIGetter_IconBrush(const FVM_MarkIcon &inout Model)
{
    return Model.GetIconBrush();
}
FLinearColor __UIGetter_IconBackgroundColor(const FVM_MarkIcon &inout Model)
{
    return Model.GetIconBackgroundColor();
}
TEUIModelRef<FVM_MarkIcon> __UIGetter_Self(const FVM_MarkIcon &inout Model)
{
    return TEUIModelRef<FVM_MarkIcon>(Model);
}
int __IndexOf_PresentationConfig()
{
    return 0;
}
int __IndexOf_bIsSelfCreate()
{
    return 1;
}
int __IndexOf_IconBrush()
{
    return 2;
}
int __IndexOf_IconBackgroundColor()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_MarkIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}


namespace FVM_SystemControlEntrance
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OpenPage = FEUIModelCallbackSignature();

}
struct FVM_SystemControlEntrance : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FEUIWidgetTag m_PageTag;
    UPROPERTY()
    TDataObjectPtr<FSystemControlConfig> m_SystemControlConfig;
    UPROPERTY()
    FGameplayTag m_RedDotEntranceTag;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;
    UPROPERTY()
    TEUIModelRef<FVM_TitleAndDesc> m_TitleAndDescVM;

    FVM_SystemControlEntrance()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SystemControlEntrance(const FVM_SystemControlEntrance &inout Other)
    {
        this.m_PageTag = Other.m_PageTag;
        this.m_SystemControlConfig = Other.m_SystemControlConfig;
        this.m_RedDotEntranceTag = Other.m_RedDotEntranceTag;
        this.m_RedDotVM = Other.m_RedDotVM;
        this.m_TitleAndDescVM = Other.m_TitleAndDescVM;
        return;
    }
    FVM_SystemControlEntrance& opAssign(const FVM_SystemControlEntrance &inout Other)
    {
        this.m_PageTag = Other.m_PageTag;
        this.m_SystemControlConfig = Other.m_SystemControlConfig;
        this.m_RedDotEntranceTag = Other.m_RedDotEntranceTag;
        this.m_RedDotVM = Other.m_RedDotVM;
        return Other.m_TitleAndDescVM;
    }
    void LoadConfig(const FConfigVM_SystemControlEntrance &inout InConfig)
    {
        this.SetSystemControlConfig(InConfig.SystemControlConfig);
        this.SetRedDotEntranceTag(InConfig.RedDotEntranceTag);
        this.SetPageTag(InConfig.PageTag);
        return;
    }
    void PostLoad()
    {
        this.CheckMailEntranceRedDotExpiryIfNeeded();
        this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(this.GetRedDotEntranceTag(), 0))));
        FText local_22;
        if (this.GetSystemControlConfig().IsSet())
        {
        }
        else
        {
            local_22 = FText();
        }
        FText local_18;
        if (this.GetSystemControlConfig().IsSet())
        {
        }
        else
        {
            local_18 = FText();
        }
        this.SetTitleAndDescVM(TEUIModelRef<FVM_TitleAndDesc>(::FVM_TitleAndDesc::Create(this.GetContext().Manager, local_22, local_18)));
        return;
    }
    FText GetName() const
    {
        FText __return;
        if (this.GetSystemControlConfig().IsSet())
        {
        }
        else
        {
            __return = FText();
        }
        return __return;
    }
    FSoftBrush GetIcon() const
    {
        FSoftBrush __return;
        if (this.GetSystemControlConfig().IsSet())
        {
        }
        else
        {
            __return = FSoftBrush();
        }
        return __return;
    }
    bool IsUnlocked() const
    {
        return ::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(this.GetSystemControlConfig(), false);
    }
    void OpenPage()
    {
        if (!(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(this.GetSystemControlConfig(), true)))
        {
            return;
        }
        if (this.GetPageTag().IsValid())
        {
            FEUIWidgetRef local_4;
            if (local_4)
            {
                FEUIWidget::RemoveWidget(local_4);
            }
        }
        return;
    }
    void CheckMailEntranceRedDotExpiryIfNeeded() const
    {
        if ((FGameplayTag(this.GetRedDotEntranceTag()) == GameplayTags::RedDotSystem_Mail_Entrance))
        {
            ::FMS_MailModel::Get(this.GetContext().Manager).CheckAndClearExpiredUnreadRedDotIfNeeded(true);
        }
        return;
    }
    const FEUIWidgetTag GetPageTag() const property
    {
        const FEUIWidgetTag __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIWidgetTag GetModify_PageTag() property
    {
        FEUIWidgetTag __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPageTag(const FEUIWidgetTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PageTag = __Value;
        return;
    }
    const TDataObjectPtr<FSystemControlConfig> GetSystemControlConfig() const property
    {
        const TDataObjectPtr<FSystemControlConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FSystemControlConfig> GetModify_SystemControlConfig() property
    {
        TDataObjectPtr<FSystemControlConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSystemControlConfig(const TDataObjectPtr<FSystemControlConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SystemControlConfig = __Value;
        return;
    }
    const FGameplayTag GetRedDotEntranceTag() const property
    {
        const FGameplayTag __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FGameplayTag GetModify_RedDotEntranceTag() property
    {
        FGameplayTag __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetRedDotEntranceTag(const FGameplayTag &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RedDotEntranceTag = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(3);
        return this.m_RedDotVM;
    }
    void SetRedDotVM(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDotVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RedDotVM = __Value;
        return;
    }
    TEUIModelRef<FVM_TitleAndDesc> GetTitleAndDescVM() const property
    {
        this.TrackPropertyRead(4);
        return this.m_TitleAndDescVM;
    }
    void SetTitleAndDescVM(const TEUIModelRef<FVM_TitleAndDesc> &inout __Value) property
    {
        TEUIModelRef<FVM_TitleAndDesc> local_2;
        local_2 = this.m_TitleAndDescVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TitleAndDescVM = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SystemControlEntrance
{
    UPROPERTY()
    FText Name;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    bool IsUnlocked;
    UPROPERTY()
    TEUIModelRef<FVM_SystemControlEntrance> Self;


}

namespace FVM_SystemControlEntrance
{
FVM_SystemControlEntrance& Create(const UObject ContextObject)
{
    return FVM_SystemControlEntrance::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SystemControlEntrance CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SystemControlEntrance __r;
    TEUIModelRef<FVM_SystemControlEntrance> local_6 = TEUIModelRef<FVM_SystemControlEntrance>(EUIInternal::MakeModelWithManager(Manager, FVM_SystemControlEntrance::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RedDotVM";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TitleAndDescVM";
    local_14.TypeName = "TEUIModelRef<FVM_TitleAndDesc>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Name";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Icon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUnlocked";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SystemControlEntrance>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SystemControlEntrance;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SystemControlEntrance;
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_SystemControlEntrance &inout Model)
{
    return Model.GetRedDotVM();
}
TEUIModelRef<FVM_TitleAndDesc> __UIGetter_TitleAndDescVM(const FVM_SystemControlEntrance &inout Model)
{
    return Model.GetTitleAndDescVM();
}
FText __UIGetter_Name(const FVM_SystemControlEntrance &inout Model)
{
    return Model.GetName();
}
FSoftBrush __UIGetter_Icon(const FVM_SystemControlEntrance &inout Model)
{
    return Model.GetIcon();
}
bool __UIGetter_IsUnlocked(const FVM_SystemControlEntrance &inout Model)
{
    return Model.IsUnlocked();
}
TEUIModelRef<FVM_SystemControlEntrance> __UIGetter_Self(const FVM_SystemControlEntrance &inout Model)
{
    return TEUIModelRef<FVM_SystemControlEntrance>(Model);
}
int __IndexOf_PageTag()
{
    return 0;
}
int __IndexOf_SystemControlConfig()
{
    return 1;
}
int __IndexOf_RedDotEntranceTag()
{
    return 2;
}
int __IndexOf_RedDotVM()
{
    return 3;
}
int __IndexOf_TitleAndDescVM()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_SystemControlEntrance
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

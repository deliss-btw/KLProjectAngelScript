
namespace FVM_AvatarSelectBar
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectNextAvatar = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SelectPrevAvatar = FEUIModelCallbackSignature();

}
struct FVM_AvatarSelectBar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FMS_EditingAvatar> m_EditingAvatar;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarSelectBarItem>> m_AvatarList;
    UPROPERTY()
    TArray<FEUIModelWeakRef> m_OwnerModels;

    FVM_AvatarSelectBar()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_AvatarSelectBar(const FVM_AvatarSelectBar &inout Other)
    {
        this.m_EditingAvatar = Other.m_EditingAvatar;
        this.m_AvatarList = Other.m_AvatarList;
        this.m_OwnerModels = Other.m_OwnerModels;
        return;
    }
    FVM_AvatarSelectBar& opAssign(const FVM_AvatarSelectBar &inout Other)
    {
        this.m_EditingAvatar = Other.m_EditingAvatar;
        this.m_AvatarList = Other.m_AvatarList;
        return Other.m_OwnerModels;
    }
    void PostConstruct()
    {
        for (auto& local_22 : ::GameModeSettings::GetGameModeSettings(this.GetContext().Manager.GetWorld()).ChangeRoleDataObjects)
        {
            this.GetModify_AvatarList().Add(TEUIModelRef<FVM_AvatarSelectBarItem>(::FVM_AvatarSelectBarItem::Create(this.GetContext().Manager, local_22)));
        }
        return;
    }
    void SelectNextAvatar()
    {
        this.MoveSelectAvatar(1);
        return;
    }
    void SelectPrevAvatar()
    {
        this.MoveSelectAvatar(-1);
        return;
    }
    void MoveSelectAvatar(const int Offset)
    {
        int local_4 = 0;
        FDataObjectPtr local_80;
        this.SetEditingAvatar(TEUIModelRef<FMS_EditingAvatar>(::FMS_EditingAvatar::Get(this.GetContext().Manager)));
        TEUIModelRef<FMS_EditingAvatar> local_2 = this.GetEditingAvatar();
        int local_5 = 0;
        for (; local_5 < this.GetAvatarList().Num(); ++local_5)
        {
            TDataObjectPtr<FAvatarPrefabConfig> local_32;
            local_32 = local_4.GetAvatarConfig();
            local_80;
            if ((local_32 == local_80))
            {
                local_4.SetAvatarConfig(this.GetAvatarList()[FMath::WrapIndex((local_5 + Offset), 0, this.GetAvatarList().Num())].opArrow().GetAvatarConfig());
                break;
            }
        }
        return;
    }
    TEUIModelRef<FMS_EditingAvatar> GetEditingAvatar() const property
    {
        this.TrackPropertyRead(0);
        return this.m_EditingAvatar;
    }
    void SetEditingAvatar(const TEUIModelRef<FMS_EditingAvatar> &inout __Value) property
    {
        TEUIModelRef<FMS_EditingAvatar> local_2;
        local_2 = this.m_EditingAvatar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EditingAvatar = __Value;
        return;
    }
    TArray<TEUIModelRef<FVM_AvatarSelectBarItem>> GetAvatarList() const property
    {
        TArray<TEUIModelRef<FVM_AvatarSelectBarItem>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarSelectBarItem>> GetModify_AvatarList() property
    {
        TArray<TEUIModelRef<FVM_AvatarSelectBarItem>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAvatarList(const TArray<TEUIModelRef<FVM_AvatarSelectBarItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AvatarList = __Value;
        return;
    }
    const TArray<FEUIModelWeakRef> GetOwnerModels() const property
    {
        const TArray<FEUIModelWeakRef> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelWeakRef> GetModify_OwnerModels() property
    {
        TArray<FEUIModelWeakRef> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOwnerModels(const TArray<FEUIModelWeakRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_OwnerModels = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarSelectBar
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarSelectBar> Self;

    __GeneratedProperties_FVM_AvatarSelectBar()
    {
        return;
    }
}

namespace FVM_AvatarSelectBar
{
void RequireAvatarSelectBar(const FEUIModelRef &inout OwnerModel)
{
    const UAvatarBuildSettings local_2;
    GetGameplaySettings<UAvatarBuildSettings> local_4;
    local_2 = local_4;
    ULocalPlayer local_8;
    FEUIWidgetRef local_12 = FEUIWidget::FindWidgetByClass(local_8, local_2.AvatarSelectBarClass);
    if (!(local_12))
    {
        local_12 = FEUIWidget::AddWidgetByClass(local_8, local_2.AvatarSelectBarClass);
    }
    if (!(!(local_12)))
    {
        FEUIWidgetRef::GetViewModel local_18;
        local_18.opCall(NAME_None).GetModify_OwnerModels().Add(FEUIModelWeakRef(OwnerModel));
    }
    return;
}
void ReleaseAvatarSelectBar(const FEUIModelRef &inout OwnerModel)
{
    const UAvatarBuildSettings local_2;
    GetGameplaySettings<UAvatarBuildSettings> local_4;
    int local_20 = 0;
    local_2 = local_4;
    ULocalPlayer local_8;
    FEUIWidgetRef local_12 = FEUIWidget::FindWidgetByClass(local_8, local_2.AvatarSelectBarClass);
    if (local_12)
    {
        FEUIModelWeakRef local_22 = FEUIModelWeakRef(OwnerModel);
        if (local_20.GetOwnerModels().IsEmpty())
        {
            FEUIWidget::RemoveWidget(local_12);
        }
    }
    return;
}
FVM_AvatarSelectBar& Create(const UObject ContextObject)
{
    return FVM_AvatarSelectBar::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarSelectBar CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_AvatarSelectBar __r;
    TEUIModelRef<FVM_AvatarSelectBar> local_6 = TEUIModelRef<FVM_AvatarSelectBar>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarSelectBar::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AvatarList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_AvatarSelectBarItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarSelectBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarSelectBar;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarSelectBar;
}
TArray<TEUIModelRef<FVM_AvatarSelectBarItem>> __UIGetter_AvatarList(const FVM_AvatarSelectBar &inout Model)
{
    return Model.GetAvatarList();
}
TEUIModelRef<FVM_AvatarSelectBar> __UIGetter_Self(const FVM_AvatarSelectBar &inout Model)
{
    return TEUIModelRef<FVM_AvatarSelectBar>(Model);
}
int __IndexOf_EditingAvatar()
{
    return 0;
}
int __IndexOf_AvatarList()
{
    return 1;
}
int __IndexOf_OwnerModels()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_AvatarSelectBar
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

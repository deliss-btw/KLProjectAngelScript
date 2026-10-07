
namespace FVM_AvatarBuildBar
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature SelectNextAvatar = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SelectPrevAvatar = FEUIModelCallbackSignature();

}
struct FVM_AvatarBuildBar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FMS_EditingAvatar> m_EditingAvatar;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarBuildBarItem>> m_BuildList;
    UPROPERTY()
    TArray<FEUIModelWeakRef> m_OwnerModels;

    FVM_AvatarBuildBar()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_AvatarBuildBar(const FVM_AvatarBuildBar &inout Other)
    {
        this.m_EditingAvatar = Other.m_EditingAvatar;
        this.m_BuildList = Other.m_BuildList;
        this.m_OwnerModels = Other.m_OwnerModels;
        return;
    }
    FVM_AvatarBuildBar& opAssign(const FVM_AvatarBuildBar &inout Other)
    {
        this.m_EditingAvatar = Other.m_EditingAvatar;
        this.m_BuildList = Other.m_BuildList;
        return Other.m_OwnerModels;
    }
    void PostConstruct()
    {
        for (auto& local_22 : ::GameModeSettings::GetGameModeSettings(this.GetContext().Manager.GetWorld()).ChangeRoleDataObjects)
        {
            this.GetModify_BuildList().Add(TEUIModelRef<FVM_AvatarBuildBarItem>(::FVM_AvatarBuildBarItem::Create(this.GetContext().Manager, local_22)));
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
        for (; local_5 < this.GetBuildList().Num(); ++local_5)
        {
            TDataObjectPtr<FAvatarPrefabConfig> local_32;
            local_32 = local_4.GetAvatarConfig();
            local_80;
            if ((local_32 == local_80))
            {
                local_4.SetAvatarConfig(this.GetBuildList()[FMath::WrapIndex((local_5 + Offset), 0, this.GetBuildList().Num())].opArrow().GetAvatarConfig());
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
    const TArray<TEUIModelRef<FVM_AvatarBuildBarItem>> GetBuildList() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarBuildBarItem>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarBuildBarItem>> GetModify_BuildList() property
    {
        TArray<TEUIModelRef<FVM_AvatarBuildBarItem>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetBuildList(const TArray<TEUIModelRef<FVM_AvatarBuildBarItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_BuildList = __Value;
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

struct __GeneratedProperties_FVM_AvatarBuildBar
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarBuildBar> Self;

    __GeneratedProperties_FVM_AvatarBuildBar()
    {
        return;
    }
}

namespace FVM_AvatarBuildBar
{
FVM_AvatarBuildBar& Create(const UObject ContextObject)
{
    return FVM_AvatarBuildBar::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarBuildBar CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_AvatarBuildBar __r;
    TEUIModelRef<FVM_AvatarBuildBar> local_6 = TEUIModelRef<FVM_AvatarBuildBar>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarBuildBar::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "BuildList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_AvatarBuildBarItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarBuildBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarBuildBar;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarBuildBar;
}
TArray<TEUIModelRef<FVM_AvatarBuildBarItem>> __UIGetter_BuildList(const FVM_AvatarBuildBar &inout Model)
{
    return Model.GetBuildList();
}
TEUIModelRef<FVM_AvatarBuildBar> __UIGetter_Self(const FVM_AvatarBuildBar &inout Model)
{
    return TEUIModelRef<FVM_AvatarBuildBar>(Model);
}
int __IndexOf_EditingAvatar()
{
    return 0;
}
int __IndexOf_BuildList()
{
    return 1;
}
int __IndexOf_OwnerModels()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_AvatarBuildBar
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}


namespace FVM_AvatarBuildBackground
{
    const int ModelId = 0;

}
struct FVM_AvatarBuildBackground : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FMS_EditingAvatar> m_EditingAvatar;

    FVM_AvatarBuildBackground()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_AvatarBuildBackground(const FVM_AvatarBuildBackground &inout Other)
    {
        this.m_EditingAvatar = Other.m_EditingAvatar;
        return;
    }
    FVM_AvatarBuildBackground& opAssign(const FVM_AvatarBuildBackground &inout Other)
    {
        return Other.m_EditingAvatar;
    }
    void PostConstruct()
    {
        this.SetEditingAvatar(TEUIModelRef<FMS_EditingAvatar>(::FMS_EditingAvatar::Get(this.GetContext().Manager)));
        return;
    }
    FSoftBrush GetBackgroundImage() const
    {
        TEUIModelRef<FMS_EditingAvatar> local_2 = this.GetEditingAvatar();
        TDataObjectPtr<FAvatarPrefabConfig> local_26 = GetAvatarConfig();
        if (local_26)
        {
            return local_26.opArrow().PlayerTachie;
        }
        return FSoftBrush();
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
}

struct __GeneratedProperties_FVM_AvatarBuildBackground
{
    UPROPERTY()
    FSoftBrush BackgroundImage;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarBuildBackground> Self;

    __GeneratedProperties_FVM_AvatarBuildBackground()
    {
        return;
    }
}

namespace FVM_AvatarBuildBackground
{
FVM_AvatarBuildBackground& Create(const UObject ContextObject)
{
    return FVM_AvatarBuildBackground::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_AvatarBuildBackground CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_AvatarBuildBackground __r;
    TEUIModelRef<FVM_AvatarBuildBackground> local_6 = TEUIModelRef<FVM_AvatarBuildBackground>(EUIInternal::MakeModelWithManager(Manager, FVM_AvatarBuildBackground::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "BackgroundImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarBuildBackground>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarBuildBackground;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarBuildBackground;
}
FSoftBrush __UIGetter_BackgroundImage(const FVM_AvatarBuildBackground &inout Model)
{
    return Model.GetBackgroundImage();
}
TEUIModelRef<FVM_AvatarBuildBackground> __UIGetter_Self(const FVM_AvatarBuildBackground &inout Model)
{
    return TEUIModelRef<FVM_AvatarBuildBackground>(Model);
}
int __IndexOf_EditingAvatar()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_AvatarBuildBackground
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

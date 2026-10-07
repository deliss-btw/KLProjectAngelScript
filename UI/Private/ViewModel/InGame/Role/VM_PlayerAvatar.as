
namespace FVM_PlayerAvatar
{
    const int ModelId = 0;

}
struct FVM_PlayerAvatar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;

    FVM_PlayerAvatar()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PlayerAvatar' by default constructor.");
        return;
    }
    FVM_PlayerAvatar(const FVM_PlayerAvatar &inout Other)
    {
        this.m_AvatarConfig = Other.m_AvatarConfig;
        return;
    }
    FVM_PlayerAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatarConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAvatarConfig(InAvatarConfig);
        return;
    }
    FVM_PlayerAvatar& opAssign(const FVM_PlayerAvatar &inout Other)
    {
        return Other.m_AvatarConfig;
    }
    FText GetAvatarName() const
    {
        return this.GetAvatarConfig().opArrow().DisplayName;
    }
    FSoftBrush GetAvatarClassIcon() const
    {
        return this.GetAvatarConfig().opArrow().PlayerClassIcon;
    }
    FSoftBrush GetAvatarPowerIcon() const
    {
        return this.GetAvatarConfig().opArrow().PlayerPowerIcon;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetAvatarConfig() const property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_AvatarConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_AvatarConfig = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PlayerAvatar
{
    UPROPERTY()
    FText AvatarName;
    UPROPERTY()
    FSoftBrush AvatarClassIcon;
    UPROPERTY()
    FSoftBrush AvatarPowerIcon;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerAvatar> Self;

    __GeneratedProperties_FVM_PlayerAvatar()
    {
        return;
    }
}

namespace FVM_PlayerAvatar
{
FVM_PlayerAvatar& Create(const UObject ContextObject, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    return FVM_PlayerAvatar::CreateByManager(EUIInternal::GetContextManager(ContextObject), AvatarConfig);
}
FVM_PlayerAvatar CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    FVM_PlayerAvatar __r;
    TEUIModelRef<FVM_PlayerAvatar> local_6 = TEUIModelRef<FVM_PlayerAvatar>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PlayerAvatar::ModelId, 0, AvatarConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AvatarConfig";
    local_14.TypeName = "TDataObjectPtr<FAvatarPrefabConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarClassIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarPowerIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerAvatar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PlayerAvatar;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PlayerAvatar;
}
TDataObjectPtr<FAvatarPrefabConfig> __UIGetter_AvatarConfig(const FVM_PlayerAvatar &inout Model)
{
    return Model.GetAvatarConfig();
}
FText __UIGetter_AvatarName(const FVM_PlayerAvatar &inout Model)
{
    return Model.GetAvatarName();
}
FSoftBrush __UIGetter_AvatarClassIcon(const FVM_PlayerAvatar &inout Model)
{
    return Model.GetAvatarClassIcon();
}
FSoftBrush __UIGetter_AvatarPowerIcon(const FVM_PlayerAvatar &inout Model)
{
    return Model.GetAvatarPowerIcon();
}
TEUIModelRef<FVM_PlayerAvatar> __UIGetter_Self(const FVM_PlayerAvatar &inout Model)
{
    return TEUIModelRef<FVM_PlayerAvatar>(Model);
}
int __IndexOf_AvatarConfig()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_PlayerAvatar
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

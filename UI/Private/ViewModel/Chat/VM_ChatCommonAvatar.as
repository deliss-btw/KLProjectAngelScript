
namespace FVM_ChatCommonAvatar
{
    const int ModelId = 0;

}
struct FVM_ChatCommonAvatar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;
    UPROPERTY()
    FSoftBrush m_AvatarIcon;

    FVM_ChatCommonAvatar()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ChatCommonAvatar' by default constructor.");
        return;
    }
    FVM_ChatCommonAvatar(const FVM_ChatCommonAvatar &inout Other)
    {
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_AvatarIcon = Other.m_AvatarIcon;
        return;
    }
    FVM_ChatCommonAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatarConfig)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAvatarConfig(InAvatarConfig);
        return;
    }
    FVM_ChatCommonAvatar& opAssign(const FVM_ChatCommonAvatar &inout Other)
    {
        this.m_AvatarConfig = Other.m_AvatarConfig;
        return Other.m_AvatarIcon;
    }
    void PostConstruct()
    {
        if (this.GetAvatarConfig().IsSet())
        {
        }
        return;
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
    FSoftBrush GetAvatarIcon() const property
    {
        FSoftBrush __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSoftBrush GetModify_AvatarIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAvatarIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AvatarIcon = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ChatCommonAvatar
{
    UPROPERTY()
    TEUIModelRef<FVM_ChatCommonAvatar> Self;

    __GeneratedProperties_FVM_ChatCommonAvatar()
    {
        return;
    }
}

namespace FVM_ChatCommonAvatar
{
FVM_ChatCommonAvatar& Create(const UObject ContextObject, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    return FVM_ChatCommonAvatar::CreateByManager(EUIInternal::GetContextManager(ContextObject), AvatarConfig);
}
FVM_ChatCommonAvatar CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    FVM_ChatCommonAvatar __r;
    TEUIModelRef<FVM_ChatCommonAvatar> local_6 = TEUIModelRef<FVM_ChatCommonAvatar>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ChatCommonAvatar::ModelId, 0, AvatarConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AvatarIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ChatCommonAvatar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ChatCommonAvatar;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ChatCommonAvatar;
}
FSoftBrush __UIGetter_AvatarIcon(const FVM_ChatCommonAvatar &inout Model)
{
    return Model.GetAvatarIcon();
}
TEUIModelRef<FVM_ChatCommonAvatar> __UIGetter_Self(const FVM_ChatCommonAvatar &inout Model)
{
    return TEUIModelRef<FVM_ChatCommonAvatar>(Model);
}
int __IndexOf_AvatarConfig()
{
    return 0;
}
int __IndexOf_AvatarIcon()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_ChatCommonAvatar
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

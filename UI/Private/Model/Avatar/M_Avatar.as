
namespace FM_Avatar
{
    const int ModelId = 0;
}
namespace FMS_EditingAvatar
{
    const int ModelId = 0;
}
namespace FVM_EditAvatarScope
{
    const int ModelId = 0;

}
struct FM_Avatar : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;
    UPROPERTY()
    bool m_bIsUnlocked;

    FM_Avatar()
    {
        this.m_bIsUnlocked = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_Avatar' by default constructor.");
        return;
    }
    FM_Avatar(const FM_Avatar &inout Other)
    {
        this.m_bIsUnlocked = false;
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_bIsUnlocked = Other.m_bIsUnlocked;
        return;
    }
    FM_Avatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatarConfig)
    {
        this.m_bIsUnlocked = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAvatarConfig(InAvatarConfig);
        return;
    }
    FM_Avatar opAssign(const FM_Avatar &inout Other)
    {
        FM_Avatar __r;
        this.m_AvatarConfig = Other.m_AvatarConfig;
        this.m_bIsUnlocked = Other.m_bIsUnlocked;
        return __r;
    }
    bool IsAlwaysHidden()
    {
        bool local_1 = false;
        if (this.GetAvatarConfig())
        {
            return local_1;
        }
        return true;
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
    bool GetbIsUnlocked() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsUnlocked;
    }
    void SetbIsUnlocked(const bool __Value) property
    {
        if (!(this.m_bIsUnlocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsUnlocked = __Value;
        return;
    }
}

struct FMS_EditingAvatar : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;

    FMS_EditingAvatar()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_EditingAvatar(const FMS_EditingAvatar &inout Other)
    {
        this.m_AvatarConfig = Other.m_AvatarConfig;
        return;
    }
    FMS_EditingAvatar& opAssign(const FMS_EditingAvatar &inout Other)
    {
        return Other.m_AvatarConfig;
    }
    void ResetToDefault()
    {
        this.SetAvatarConfig(::GetAvatarConfig(this.GetContext().GetLocalPlayerPawn()));
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
}

struct FVM_EditAvatarScope : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_Nop;

    FVM_EditAvatarScope()
    {
        this.m_Nop = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_EditAvatarScope(const FVM_EditAvatarScope &inout Other)
    {
        this.m_Nop = 0;
        this.m_Nop = int(Other.m_Nop);
        return;
    }
    FVM_EditAvatarScope opAssign(const FVM_EditAvatarScope &inout Other)
    {
        FVM_EditAvatarScope __r;
        this.m_Nop = int(Other.m_Nop);
        return __r;
    }
    void PostConstruct()
    {
        ::FMS_EditingAvatar::Get(this.GetContext().Manager).ResetToDefault();
        return;
    }
    void BeginDestroy()
    {
        ::FMS_EditingAvatar::Get(this.GetContext().Manager).ResetToDefault();
        return;
    }
    int GetNop() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Nop;
    }
    void SetNop(const int __Value) property
    {
        if (this.m_Nop == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Nop = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_EditAvatarScope
{
    UPROPERTY()
    TEUIModelRef<FVM_EditAvatarScope> Self;

    __GeneratedProperties_FVM_EditAvatarScope()
    {
        return;
    }
}

namespace FM_Avatar
{
FM_Avatar& Create(const UObject ContextObject, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    return FM_Avatar::CreateByManager(EUIInternal::GetContextManager(ContextObject), AvatarConfig);
}
FM_Avatar CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    FM_Avatar __r;
    TEUIModelRef<FM_Avatar> local_6 = TEUIModelRef<FM_Avatar>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_Avatar::ModelId, 0, AvatarConfig));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_Avatar;
}
int __IndexOf_AvatarConfig()
{
    return 0;
}
int __IndexOf_bIsUnlocked()
{
    return 1;
}
}
namespace FMS_EditingAvatar
{
FMS_EditingAvatar& Get(const UObject ContextObject)
{
    return FMS_EditingAvatar::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_EditingAvatar GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_EditingAvatar __r;
    TEUIModelRef<FMS_EditingAvatar> local_6 = TEUIModelRef<FMS_EditingAvatar>(EUIInternal::MakeModelWithManager(Manager, FMS_EditingAvatar::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_EditingAvatar;
}
int __IndexOf_AvatarConfig()
{
    return 0;
}
}
namespace FVM_EditAvatarScope
{
FVM_EditAvatarScope& Create(const UObject ContextObject)
{
    return FVM_EditAvatarScope::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_EditAvatarScope CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_EditAvatarScope __r;
    TEUIModelRef<FVM_EditAvatarScope> local_6 = TEUIModelRef<FVM_EditAvatarScope>(EUIInternal::MakeModelWithManager(Manager, FVM_EditAvatarScope::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_EditAvatarScope>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_EditAvatarScope;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_EditAvatarScope;
}
TEUIModelRef<FVM_EditAvatarScope> __UIGetter_Self(const FVM_EditAvatarScope &inout Model)
{
    return TEUIModelRef<FVM_EditAvatarScope>(Model);
}
int __IndexOf_Nop()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_EditAvatarScope
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

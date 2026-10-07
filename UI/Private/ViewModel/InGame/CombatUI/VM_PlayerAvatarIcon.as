
namespace FVM_PlayerAvatarIcon
{
    const int ModelId = 0;

}
struct FVM_PlayerAvatarIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    FSlateBrush m_AvatarBrush;
    UPROPERTY()
    FSlateBrush m_AvatarDamageBrush;
    UPROPERTY()
    TMap<EDamageType, FSlateBrush> m_DamageTypeSlateBrush;

    FVM_PlayerAvatarIcon()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PlayerAvatarIcon' by default constructor.");
        return;
    }
    FVM_PlayerAvatarIcon(const FVM_PlayerAvatarIcon &inout Other)
    {
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_AvatarBrush = Other.m_AvatarBrush;
        this.m_AvatarDamageBrush = Other.m_AvatarDamageBrush;
        this.m_DamageTypeSlateBrush = Other.m_DamageTypeSlateBrush;
        return;
    }
    FVM_PlayerAvatarIcon(const FECSEntity &inout InTargetEntity)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTargetEntity(InTargetEntity);
        return;
    }
    FVM_PlayerAvatarIcon& opAssign(const FVM_PlayerAvatarIcon &inout Other)
    {
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_AvatarBrush = Other.m_AvatarBrush;
        this.m_AvatarDamageBrush = Other.m_AvatarDamageBrush;
        return Other.m_DamageTypeSlateBrush;
    }
    void LoadConfigDefault(const FVM_PlayerAvatarIconConfigDefault &inout InConfig)
    {
        this.SetDamageTypeSlateBrush(InConfig.DamageTypeSlateBrush);
        return;
    }
    void PostConstruct()
    {
        this.RefreshAvatarIconInfo();
        return;
    }
    void OnTargetEntityChanged()
    {
        this.RefreshAvatarIconInfo();
        return;
    }
    void RefreshAvatarIconInfo()
    {
        FSlateBrush local_48;
        EDamageType local_2 = EDamageType(0);
        EDamageType local_1 = local_2;
        if (!(this.GetTargetEntity().IsValid()))
        {
            this.SetAvatarBrush(FSlateBrush());
            local_2 = EDamageType(0);
            local_1 = local_2;
        }
        else
        {
            if (::GetAvatarConfig(this.GetTargetEntity()))
            {
                this.SetAvatarBrush(local_48);
                local_1 = local_2;
            }
            else
            {
                if (::GetPrefabConfigPtr(this.GetTargetEntity()))
                {
                    this.SetAvatarBrush(local_48);
                }
            }
        }
        FSlateBrush local_188;
        if (this.GetDamageTypeSlateBrush().Find(local_1, local_188))
        {
            this.SetAvatarDamageBrush(local_188);
        }
        else
        {
            this.SetAvatarDamageBrush(local_48);
        }
        return;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TargetEntity = __Value;
        return;
    }
    const FSlateBrush GetAvatarBrush() const property
    {
        const FSlateBrush __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSlateBrush GetModify_AvatarBrush() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAvatarBrush(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AvatarBrush = __Value;
        return;
    }
    const FSlateBrush GetAvatarDamageBrush() const property
    {
        const FSlateBrush __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FSlateBrush GetModify_AvatarDamageBrush() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAvatarDamageBrush(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AvatarDamageBrush = __Value;
        return;
    }
    const TMap<EDamageType, FSlateBrush> GetDamageTypeSlateBrush() const property
    {
        const TMap<EDamageType, FSlateBrush> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<EDamageType, FSlateBrush> GetModify_DamageTypeSlateBrush() property
    {
        TMap<EDamageType, FSlateBrush> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetDamageTypeSlateBrush(const TMap<EDamageType, FSlateBrush> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_DamageTypeSlateBrush = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PlayerAvatarIcon
{
    UPROPERTY()
    TEUIModelRef<FVM_PlayerAvatarIcon> Self;

    __GeneratedProperties_FVM_PlayerAvatarIcon()
    {
        return;
    }
}

namespace FVM_PlayerAvatarIcon
{
FVM_PlayerAvatarIcon& Create(const UObject ContextObject, const FECSEntity &inout TargetEntity)
{
    return FVM_PlayerAvatarIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), TargetEntity);
}
FVM_PlayerAvatarIcon CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout TargetEntity)
{
    FVM_PlayerAvatarIcon __r;
    TEUIModelRef<FVM_PlayerAvatarIcon> local_6 = TEUIModelRef<FVM_PlayerAvatarIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PlayerAvatarIcon::ModelId, 0, TargetEntity));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(true);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AvatarBrush";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarDamageBrush";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerAvatarIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PlayerAvatarIcon;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnTargetEntityChanged";
    local_24.DirtyFlags.Set(FVM_PlayerAvatarIcon::__IndexOf_TargetEntity());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PlayerAvatarIcon;
}
void __OnTargetEntityChanged(FVM_PlayerAvatarIcon &inout Model)
{
    Model.OnTargetEntityChanged();
    return;
}
FSlateBrush __UIGetter_AvatarBrush(const FVM_PlayerAvatarIcon &inout Model)
{
    return Model.GetAvatarBrush();
}
FSlateBrush __UIGetter_AvatarDamageBrush(const FVM_PlayerAvatarIcon &inout Model)
{
    return Model.GetAvatarDamageBrush();
}
TEUIModelRef<FVM_PlayerAvatarIcon> __UIGetter_Self(const FVM_PlayerAvatarIcon &inout Model)
{
    return TEUIModelRef<FVM_PlayerAvatarIcon>(Model);
}
int __IndexOf_TargetEntity()
{
    return 0;
}
int __IndexOf_AvatarBrush()
{
    return 1;
}
int __IndexOf_AvatarDamageBrush()
{
    return 2;
}
int __IndexOf_DamageTypeSlateBrush()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_PlayerAvatarIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}

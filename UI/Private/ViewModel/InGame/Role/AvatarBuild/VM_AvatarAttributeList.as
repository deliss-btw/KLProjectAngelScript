
namespace FVM_AvatarAttributeList
{
    const int ModelId = 0;

}
struct FVM_AvatarAttributeList : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_Avatar;
    UPROPERTY()
    TArray<FEUIModelRef> m_AttributeItems;
    UPROPERTY()
    bool m_bCanNotDisplayAttribute;

    FVM_AvatarAttributeList()
    {
        this.m_bCanNotDisplayAttribute = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarAttributeList' by default constructor.");
        return;
    }
    FVM_AvatarAttributeList(const FVM_AvatarAttributeList &inout Other)
    {
        this.m_bCanNotDisplayAttribute = false;
        this.m_Avatar = Other.m_Avatar;
        this.m_AttributeItems = Other.m_AttributeItems;
        this.m_bCanNotDisplayAttribute = Other.m_bCanNotDisplayAttribute;
        return;
    }
    FVM_AvatarAttributeList(const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatar)
    {
        this.m_bCanNotDisplayAttribute = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAvatar(InAvatar);
        return;
    }
    FVM_AvatarAttributeList opAssign(const FVM_AvatarAttributeList &inout Other)
    {
        FVM_AvatarAttributeList __r;
        this.m_Avatar = Other.m_Avatar;
        this.m_AttributeItems = Other.m_AttributeItems;
        this.m_bCanNotDisplayAttribute = Other.m_bCanNotDisplayAttribute;
        return __r;
    }
    void PostConstruct()
    {
        const UAvatarBuildSettings local_56;
        TDataObjectPtr<FAvatarPrefabConfig> local_28 = ::GetAvatarConfig(this.GetContext().GetLocalPlayerPawn());
        FDataObjectPtr local_52;
        local_52;
        if ((!((local_28 == local_52))))
        {
            this.SetbCanNotDisplayAttribute(true);
            return;
        }
        GetGameplaySettings<UAvatarBuildSettings> local_58;
        local_56 = local_58;
        for (auto& local_74 : local_56.AttributeDisplayGroups)
        {
            this.GetModify_AttributeItems().Add(::FVM_AvatarAttributeItem::CreateCategory(this.GetContext().Manager, local_74.DisplayName).opImplConv());
            for (auto& local_94 : local_74.Attributes)
            {
                this.GetModify_AttributeItems().Add(::FVM_AvatarAttributeItem::CreateAttribute(this.GetContext().Manager, local_94.Attribute, local_94.DisplayType).opImplConv());
            }
        }
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetAvatar() const property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_Avatar() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Avatar = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetAttributeItems() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_AttributeItems() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAttributeItems(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AttributeItems = __Value;
        return;
    }
    bool GetbCanNotDisplayAttribute() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bCanNotDisplayAttribute;
    }
    void SetbCanNotDisplayAttribute(const bool __Value) property
    {
        if (!(this.m_bCanNotDisplayAttribute) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bCanNotDisplayAttribute = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarAttributeList
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarAttributeList> Self;

    __GeneratedProperties_FVM_AvatarAttributeList()
    {
        return;
    }
}

namespace FVM_AvatarAttributeList
{
FVM_AvatarAttributeList& Create(const UObject ContextObject, const TDataObjectPtr<FAvatarPrefabConfig> &inout Avatar)
{
    return FVM_AvatarAttributeList::CreateByManager(EUIInternal::GetContextManager(ContextObject), Avatar);
}
FVM_AvatarAttributeList CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FAvatarPrefabConfig> &inout Avatar)
{
    FVM_AvatarAttributeList __r;
    TEUIModelRef<FVM_AvatarAttributeList> local_6 = TEUIModelRef<FVM_AvatarAttributeList>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarAttributeList::ModelId, 0, Avatar));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AttributeItems";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bCanNotDisplayAttribute";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarAttributeList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarAttributeList;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarAttributeList;
}
TArray<FEUIModelRef> __UIGetter_AttributeItems(const FVM_AvatarAttributeList &inout Model)
{
    return Model.GetAttributeItems();
}
bool __UIGetter_bCanNotDisplayAttribute(const FVM_AvatarAttributeList &inout Model)
{
    return Model.GetbCanNotDisplayAttribute();
}
TEUIModelRef<FVM_AvatarAttributeList> __UIGetter_Self(const FVM_AvatarAttributeList &inout Model)
{
    return TEUIModelRef<FVM_AvatarAttributeList>(Model);
}
int __IndexOf_Avatar()
{
    return 0;
}
int __IndexOf_AttributeItems()
{
    return 1;
}
int __IndexOf_bCanNotDisplayAttribute()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_AvatarAttributeList
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
